Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178212B7E49
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 14:26:41 +0100 (CET)
Received: from localhost ([::1]:60042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfNTs-0004z8-6Z
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 08:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfNOP-0007yy-Hi
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:21:02 -0500
Received: from relay.sw.ru ([185.231.240.75]:48182 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfNOG-00023p-NN
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 08:21:01 -0500
Received: from [192.168.15.37] (helo=andrey-MS-7B54.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kfNO2-009Ap3-8x; Wed, 18 Nov 2020 16:20:38 +0300
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.com>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v2 5/7] Implementation of vm_start() BH.
Date: Wed, 18 Nov 2020 16:20:46 +0300
Message-Id: <20201118132048.429092-6-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
References: <20201118132048.429092-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay3.sw.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:22:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
From: Andrey Gruzdev via <qemu-devel@nongnu.org>

To avoid saving updated versions of memory pages we need
to start tracking RAM writes before we resume operation of
vCPUs. This sequence is especially critical for virtio device
backends whos VQs are mapped to main memory and accessed
directly not using MMIO callbacks.

One problem is that vm_start() routine makes calls state
change notifier callbacks directly from itself. Virtio drivers
do some stuff with syncing/flusing VQs in its notifier routines.
Since we poll UFFD and process faults on the same thread, that
leads to the situation when the thread locks in vm_start()
if we try to call it from the migration thread.

The solution is to call ram_write_tracking_start() directly
from migration thread and then schedule BH for vm_start.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 158e5441ec..dba388f8bd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3716,7 +3716,13 @@ static void *migration_thread(void *opaque)
 
 static void wt_migration_vm_start_bh(void *opaque)
 {
-    /* TODO: implement */
+    MigrationState *s = opaque;
+
+    qemu_bh_delete(s->wt_vm_start_bh);
+    s->wt_vm_start_bh = NULL;
+
+    vm_start();
+    s->downtime = qemu_clock_get_ms(QEMU_CLOCK_REALTIME) - s->downtime_start;
 }
 
 /*
-- 
2.25.1


