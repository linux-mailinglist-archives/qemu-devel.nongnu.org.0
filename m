Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 170ED34204B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 15:56:44 +0100 (CET)
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGYN-0007aW-6m
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNGUn-00042y-Kq
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:53:02 -0400
Received: from relay.sw.ru ([185.231.240.75]:58480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNGUh-0003xQ-0y
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 10:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=virtuozzo.com; s=relay; h=MIME-Version:Message-Id:Date:Subject:From:
 Content-Type; bh=jH0WZ/RmDE/Z2aVjOBynPZMT/xmSLmwmRqUG0uuuXok=; b=B/6H6uU022Oo
 sbZPEslU4m+iauFlowAQ7EdXwGT+Kf62QWmrwQx2UZw9hB7gRGX5rNNjmKt0/OTVLo2kSdmDO2443
 7wY6ijJAGPVSSWz6ZkT3H93/C5f+3fH5VduJYXyWx0x2aVhgEfy/mpF2e0jGivdo2aVY8wJ+k03d2
 F7BL0=;
Received: from [192.168.15.248] (helo=andrey-MS-7B54.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNGUX-00010K-SG; Fri, 19 Mar 2021 17:52:45 +0300
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer file in
 bg_migration_thread
Date: Fri, 19 Mar 2021 17:52:47 +0300
Message-Id: <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
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
 migration/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ca8b97baa5..32b48fe9f5 100644
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
@@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
     if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
         goto fail;
     }
+    qemu_fflush(fb);
+
     /* Now initialize UFFD context and start tracking RAM writes */
     if (ram_write_tracking_start()) {
         goto fail;
-- 
2.25.1


