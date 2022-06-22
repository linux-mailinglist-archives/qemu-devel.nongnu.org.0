Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3105553EF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 21:02:48 +0200 (CEST)
Received: from localhost ([::1]:43604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o45cl-0006ts-M4
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 15:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GZ-0007vR-Sr
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o45GV-0002FY-QN
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 14:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655923187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8V7dCUpeQLsYbg+OAsasprIVrbyy53etlHxIkXU1gw=;
 b=I7EZX+KAfpiBPYE5TDhdFhrP4fPI/N3rcYN8dZ9XhGLRl4ax0Hf3am0PS/QvU48qEInRp1
 rU7XBmwfFJcrrlisRe56cE4TC+YuFfE7dQBuwtds3EfwUvQlSx3pl/DS9WNGERCcPUn2+U
 ycgGLc2RpfG8knrum6sht8kTrW4pHMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-Yb4upwl_NampDmBzEWbt9g-1; Wed, 22 Jun 2022 14:39:42 -0400
X-MC-Unique: Yb4upwl_NampDmBzEWbt9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5EE618E0044;
 Wed, 22 Jun 2022 18:39:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D96181131D;
 Wed, 22 Jun 2022 18:39:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 15/33] migration: stop passing 'opaque' parameter to QEMUFile
 hooks
Date: Wed, 22 Jun 2022 19:38:59 +0100
Message-Id: <20220622183917.155308-16-dgilbert@redhat.com>
In-Reply-To: <20220622183917.155308-1-dgilbert@redhat.com>
References: <20220622183917.155308-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

From: Daniel P. Berrangé <berrange@redhat.com>

The only user of the hooks is RDMA which provides a QIOChannel backed
impl of QEMUFile. It can thus use the qemu_file_get_ioc() method.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file.c |  8 ++++----
 migration/qemu-file.h | 14 ++++++--------
 migration/rdma.c      | 19 ++++++++++---------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 7fe0d9fa30..cdcb6e1788 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -266,7 +266,7 @@ void ram_control_before_iterate(QEMUFile *f, uint64_t flags)
     int ret = 0;
 
     if (f->hooks && f->hooks->before_ram_iterate) {
-        ret = f->hooks->before_ram_iterate(f, f->opaque, flags, NULL);
+        ret = f->hooks->before_ram_iterate(f, flags, NULL);
         if (ret < 0) {
             qemu_file_set_error(f, ret);
         }
@@ -278,7 +278,7 @@ void ram_control_after_iterate(QEMUFile *f, uint64_t flags)
     int ret = 0;
 
     if (f->hooks && f->hooks->after_ram_iterate) {
-        ret = f->hooks->after_ram_iterate(f, f->opaque, flags, NULL);
+        ret = f->hooks->after_ram_iterate(f, flags, NULL);
         if (ret < 0) {
             qemu_file_set_error(f, ret);
         }
@@ -290,7 +290,7 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data)
     int ret = -EINVAL;
 
     if (f->hooks && f->hooks->hook_ram_load) {
-        ret = f->hooks->hook_ram_load(f, f->opaque, flags, data);
+        ret = f->hooks->hook_ram_load(f, flags, data);
         if (ret < 0) {
             qemu_file_set_error(f, ret);
         }
@@ -310,7 +310,7 @@ size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
                              uint64_t *bytes_sent)
 {
     if (f->hooks && f->hooks->save_page) {
-        int ret = f->hooks->save_page(f, f->opaque, block_offset,
+        int ret = f->hooks->save_page(f, block_offset,
                                       offset, size, bytes_sent);
         if (ret != RAM_SAVE_CONTROL_NOT_SUPP) {
             f->rate_limit_used += size;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 901f2cf697..277f1d5a62 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -65,11 +65,9 @@ typedef ssize_t (QEMUFileWritevBufferFunc)(void *opaque, struct iovec *iov,
 /*
  * This function provides hooks around different
  * stages of RAM migration.
- * 'opaque' is the backend specific data in QEMUFile
  * 'data' is call specific data associated with the 'flags' value
  */
-typedef int (QEMURamHookFunc)(QEMUFile *f, void *opaque, uint64_t flags,
-                              void *data);
+typedef int (QEMURamHookFunc)(QEMUFile *f, uint64_t flags, void *data);
 
 /*
  * Constants used by ram_control_* hooks
@@ -84,11 +82,11 @@ typedef int (QEMURamHookFunc)(QEMUFile *f, void *opaque, uint64_t flags,
  * This function allows override of where the RAM page
  * is saved (such as RDMA, for example.)
  */
-typedef size_t (QEMURamSaveFunc)(QEMUFile *f, void *opaque,
-                               ram_addr_t block_offset,
-                               ram_addr_t offset,
-                               size_t size,
-                               uint64_t *bytes_sent);
+typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
+                                 ram_addr_t block_offset,
+                                 ram_addr_t offset,
+                                 size_t size,
+                                 uint64_t *bytes_sent);
 
 /*
  * Return a QEMUFile for comms in the opposite direction
diff --git a/migration/rdma.c b/migration/rdma.c
index c5fa4a408a..26a0cbbf40 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3215,11 +3215,11 @@ qio_channel_rdma_shutdown(QIOChannel *ioc,
  *                  sent. Usually, this will not be more than a few bytes of
  *                  the protocol because most transfers are sent asynchronously.
  */
-static size_t qemu_rdma_save_page(QEMUFile *f, void *opaque,
+static size_t qemu_rdma_save_page(QEMUFile *f,
                                   ram_addr_t block_offset, ram_addr_t offset,
                                   size_t size, uint64_t *bytes_sent)
 {
-    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
     int ret;
 
@@ -3831,14 +3831,15 @@ rdma_block_notification_handle(QIOChannelRDMA *rioc, const char *name)
     return 0;
 }
 
-static int rdma_load_hook(QEMUFile *f, void *opaque, uint64_t flags, void *data)
+static int rdma_load_hook(QEMUFile *f, uint64_t flags, void *data)
 {
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     switch (flags) {
     case RAM_CONTROL_BLOCK_REG:
-        return rdma_block_notification_handle(opaque, data);
+        return rdma_block_notification_handle(rioc, data);
 
     case RAM_CONTROL_HOOK:
-        return qemu_rdma_registration_handle(f, opaque);
+        return qemu_rdma_registration_handle(f, rioc);
 
     default:
         /* Shouldn't be called with any other values */
@@ -3846,10 +3847,10 @@ static int rdma_load_hook(QEMUFile *f, void *opaque, uint64_t flags, void *data)
     }
 }
 
-static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
+static int qemu_rdma_registration_start(QEMUFile *f,
                                         uint64_t flags, void *data)
 {
-    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
 
     RCU_READ_LOCK_GUARD();
@@ -3875,10 +3876,10 @@ static int qemu_rdma_registration_start(QEMUFile *f, void *opaque,
  * Inform dest that dynamic registrations are done for now.
  * First, flush writes, if any.
  */
-static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
+static int qemu_rdma_registration_stop(QEMUFile *f,
                                        uint64_t flags, void *data)
 {
-    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(opaque);
+    QIOChannelRDMA *rioc = QIO_CHANNEL_RDMA(qemu_file_get_ioc(f));
     RDMAContext *rdma;
     RDMAControlHeader head = { .len = 0, .repeat = 1 };
     int ret = 0;
-- 
2.36.1


