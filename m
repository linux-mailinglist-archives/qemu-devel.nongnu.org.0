Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAEB5200EA
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 17:16:56 +0200 (CEST)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no582-0004D4-QG
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 11:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4uv-0001Bl-47
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1no4ut-0002n5-EB
 for qemu-devel@nongnu.org; Mon, 09 May 2022 11:03:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652108598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gnPAgemPfn3CYoPeI/3CVJD5I1i8tr86noryb5X2C9Y=;
 b=RBD554m8GfDiz1WtiPb7MzQDgUMePAbO53T5jIjOdJeRE9+WzN/2748dgU+PuxO1qtUkIA
 ZrmFZ7y2u6TSqGvH+CqXeLxfsLWFNGC4pkYvDIkbAUTI6Hvgdcs8aaFCSWVmq9jthszX9l
 M2gEmlAV4DCiM0geVLMeKbOLr67DVRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-uHaNv77WN1eIASaahadcZA-1; Mon, 09 May 2022 11:03:17 -0400
X-MC-Unique: uHaNv77WN1eIASaahadcZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3408899EC2
 for <qemu-devel@nongnu.org>; Mon,  9 May 2022 15:03:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.193.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06EFFC15D40;
 Mon,  9 May 2022 15:03:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com, berrange@redhat.com
Subject: [PULL 14/16] multifd: multifd_send_sync_main now returns negative on
 error
Date: Mon,  9 May 2022 16:02:51 +0100
Message-Id: <20220509150253.218715-15-dgilbert@redhat.com>
In-Reply-To: <20220509150253.218715-1-dgilbert@redhat.com>
References: <20220509150253.218715-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

From: Leonardo Bras <leobras@redhat.com>

Even though multifd_send_sync_main() currently emits error_reports, it's
callers don't really check it before continuing.

Change multifd_send_sync_main() to return -1 on error and 0 on success.
Also change all it's callers to make use of this change and possibly fail
earlier.

(This change is important to next patch on  multifd zero copy
implementation, to make it sure an error in zero-copy flush does not go
unnoticed.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220507015759.840466-6-leobras@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 10 ++++++----
 migration/multifd.h |  2 +-
 migration/ram.c     | 29 ++++++++++++++++++++++-------
 3 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 2a8c8570c3..15fb668e64 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -566,17 +566,17 @@ void multifd_save_cleanup(void)
     multifd_send_state = NULL;
 }
 
-void multifd_send_sync_main(QEMUFile *f)
+int multifd_send_sync_main(QEMUFile *f)
 {
     int i;
 
     if (!migrate_use_multifd()) {
-        return;
+        return 0;
     }
     if (multifd_send_state->pages->num) {
         if (multifd_send_pages(f) < 0) {
             error_report("%s: multifd_send_pages fail", __func__);
-            return;
+            return -1;
         }
     }
     for (i = 0; i < migrate_multifd_channels(); i++) {
@@ -589,7 +589,7 @@ void multifd_send_sync_main(QEMUFile *f)
         if (p->quit) {
             error_report("%s: channel %d has already quit", __func__, i);
             qemu_mutex_unlock(&p->mutex);
-            return;
+            return -1;
         }
 
         p->packet_num = multifd_send_state->packet_num++;
@@ -608,6 +608,8 @@ void multifd_send_sync_main(QEMUFile *f)
         qemu_sem_wait(&p->sem_sync);
     }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
+
+    return 0;
 }
 
 static void *multifd_send_thread(void *opaque)
diff --git a/migration/multifd.h b/migration/multifd.h
index 7d0effcb03..bcf5992945 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -20,7 +20,7 @@ int multifd_load_cleanup(Error **errp);
 bool multifd_recv_all_channels_created(void);
 bool multifd_recv_new_channel(QIOChannel *ioc, Error **errp);
 void multifd_recv_sync_main(void);
-void multifd_send_sync_main(QEMUFile *f);
+int multifd_send_sync_main(QEMUFile *f);
 int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset);
 
 /* Multifd Compression flags */
diff --git a/migration/ram.c b/migration/ram.c
index a2489a2699..5f5e37f64d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2909,6 +2909,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
 {
     RAMState **rsp = opaque;
     RAMBlock *block;
+    int ret;
 
     if (compress_threads_save_setup()) {
         return -1;
@@ -2943,7 +2944,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
     ram_control_before_iterate(f, RAM_CONTROL_SETUP);
     ram_control_after_iterate(f, RAM_CONTROL_SETUP);
 
-    multifd_send_sync_main(f);
+    ret =  multifd_send_sync_main(f);
+    if (ret < 0) {
+        return ret;
+    }
+
     qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
     qemu_fflush(f);
 
@@ -3052,7 +3057,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
 out:
     if (ret >= 0
         && migration_is_setup_or_active(migrate_get_current()->state)) {
-        multifd_send_sync_main(rs->f);
+        ret = multifd_send_sync_main(rs->f);
+        if (ret < 0) {
+            return ret;
+        }
+
         qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
         qemu_fflush(f);
         ram_transferred_add(8);
@@ -3112,13 +3121,19 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
         ram_control_after_iterate(f, RAM_CONTROL_FINISH);
     }
 
-    if (ret >= 0) {
-        multifd_send_sync_main(rs->f);
-        qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
-        qemu_fflush(f);
+    if (ret < 0) {
+        return ret;
     }
 
-    return ret;
+    ret = multifd_send_sync_main(rs->f);
+    if (ret < 0) {
+        return ret;
+    }
+
+    qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
+    qemu_fflush(f);
+
+    return 0;
 }
 
 static void ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size,
-- 
2.36.0


