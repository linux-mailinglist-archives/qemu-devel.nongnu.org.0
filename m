Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650D0350584
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 19:34:42 +0200 (CEST)
Received: from localhost ([::1]:33836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRejp-0006bO-Ao
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 13:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRedZ-00024E-Sb
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 13:28:13 -0400
Received: from relay.sw.ru ([185.231.240.75]:56390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRedT-0000pB-Mi
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 13:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=xU32CofsJay/rU4iEOor0ZWeLxqyVfFbC56XhPawbjY=; b=qz/f9e2CM449
 mtxcpqO6XbWO5Ti/p1HV9cCuEEh9uhmyN8DG5Z4hnmIDZo4TfrW+dQ7NIO78IUywAvIFulvsZkCOn
 VesT2+tWbYh5BOiKsAxofzr+lJiX7bkMwNgbDf4L1X7JcgU2qNqCnWdsWcCwdvKPmJQd9ZVgLnppL
 w9E3I=;
Received: from [192.168.15.162] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRedQ-000D00-1V; Wed, 31 Mar 2021 20:28:04 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH for-6.0 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
Date: Wed, 31 Mar 2021 20:28:01 +0300
Message-Id: <20210331172803.87756-2-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331172803.87756-1-andrey.gruzdev@virtuozzo.com>
References: <20210331172803.87756-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.gruzdev@virtuozzo.com; helo=relay.sw.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Added missing qemu_fflush() on buffer file holding precopy device state.
Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
Typical configurations often require >200KB for device state and VMDESC.

Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
---
 migration/migration.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ca8b97baa5..00e13f9d58 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
      * with vCPUs running and, finally, write stashed non-RAM part of
      * the vmstate from the buffer to the migration stream.
      */
-    s->bioc = qio_channel_buffer_new(128 * 1024);
+    s->bioc = qio_channel_buffer_new(512 * 1024);
     qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
     fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
     object_unref(OBJECT(s->bioc));
@@ -3866,6 +3866,12 @@ static void *bg_migration_thread(void *opaque)
     if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
         goto fail;
     }
+    /*
+     * Since we are going to get non-iterable state data directly
+     * from s->bioc->data, explicit flush is needed here.
+     */
+    qemu_fflush(fb);
+
     /* Now initialize UFFD context and start tracking RAM writes */
     if (ram_write_tracking_start()) {
         goto fail;
-- 
2.27.0


