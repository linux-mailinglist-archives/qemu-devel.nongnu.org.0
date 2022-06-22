Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8680F553FA3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:44:11 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oTa-00046Z-Jn
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCU-0003Hw-D1
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCR-0006AA-1W
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfmlXgTjOrkbsp/ws8H1eCb+jr6Et8+r8An9XNDNW/w=;
 b=BeTDEO/NmzZ1uOtkAFzjyCwAqaMuIDdWcw+VpQTc2q3UGSyzwoR3oMcewpakVOQVpoip62
 WmUoD3zK+AfKXodkof72zrk1zVcM/FVcNOC/EWfnKDe9FSqgc3CyZLI9R7a/30e61h6MOn
 mKtgiCGpOKe+C0+PP9qJBdAVqw0Ph48=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-W0pWxV_VNW2m5_Ys1vVhOg-1; Tue, 21 Jun 2022 20:26:24 -0400
X-MC-Unique: W0pWxV_VNW2m5_Ys1vVhOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA76380029D;
 Wed, 22 Jun 2022 00:26:23 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CDFF141510D;
 Wed, 22 Jun 2022 00:26:22 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 16/25] migration: hardcode assumption that QEMUFile is backed
 with QIOChannel
Date: Wed, 22 Jun 2022 02:25:38 +0200
Message-Id: <20220622002547.64784-17-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

The only callers of qemu_fopen_ops pass 'true' for the 'has_ioc'
parameter, so hardcode this assumption in QEMUFile, by passing in
the QIOChannel object as a non-opaque parameter.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.h         |  2 +-
 migration/qemu-file-channel.c |  4 ++--
 migration/qemu-file.c         | 35 +++++++++++++++++------------------
 3 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 277f1d5a62..3a1ecc0e34 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -118,7 +118,7 @@ typedef struct QEMUFileHooks {
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
 
-QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
+QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index bb5a5752df..ce8eced417 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -184,11 +184,11 @@ static const QEMUFileOps channel_output_ops = {
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_input_ops, true);
+    return qemu_fopen_ops(ioc, &channel_input_ops);
 }
 
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_output_ops, true);
+    return qemu_fopen_ops(ioc, &channel_output_ops);
 }
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 006880abd3..ce48d7a5d8 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -37,7 +37,7 @@
 struct QEMUFile {
     const QEMUFileOps *ops;
     const QEMUFileHooks *hooks;
-    void *opaque;
+    QIOChannel *ioc;
 
     /*
      * Maximum amount of data in bytes to transfer during one
@@ -65,8 +65,6 @@ struct QEMUFile {
     Error *last_error_obj;
     /* has the file has been shutdown */
     bool shutdown;
-    /* Whether opaque points to a QIOChannel */
-    bool has_ioc;
 };
 
 /*
@@ -81,7 +79,7 @@ int qemu_file_shutdown(QEMUFile *f)
     if (!f->ops->shut_down) {
         return -ENOSYS;
     }
-    ret = f->ops->shut_down(f->opaque, true, true, NULL);
+    ret = f->ops->shut_down(f->ioc, true, true, NULL);
 
     if (!f->last_error) {
         qemu_file_set_error(f, -EIO);
@@ -98,7 +96,7 @@ QEMUFile *qemu_file_get_return_path(QEMUFile *f)
     if (!f->ops->get_return_path) {
         return NULL;
     }
-    return f->ops->get_return_path(f->opaque);
+    return f->ops->get_return_path(f->ioc);
 }
 
 bool qemu_file_mode_is_not_valid(const char *mode)
@@ -113,15 +111,15 @@ bool qemu_file_mode_is_not_valid(const char *mode)
     return false;
 }
 
-QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc)
+QEMUFile *qemu_fopen_ops(QIOChannel *ioc, const QEMUFileOps *ops)
 {
     QEMUFile *f;
 
     f = g_new0(QEMUFile, 1);
 
-    f->opaque = opaque;
+    f->ioc = ioc;
     f->ops = ops;
-    f->has_ioc = has_ioc;
+
     return f;
 }
 
@@ -242,7 +240,7 @@ void qemu_fflush(QEMUFile *f)
     }
     if (f->iovcnt > 0) {
         expect = iov_size(f->iov, f->iovcnt);
-        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->total_transferred,
+        ret = f->ops->writev_buffer(f->ioc, f->iov, f->iovcnt, f->total_transferred,
                                     &local_error);
 
         qemu_iovec_release_ram(f);
@@ -358,7 +356,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
         return 0;
     }
 
-    len = f->ops->get_buffer(f->opaque, f->buf + pending, f->total_transferred,
+    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
                              IO_BUF_SIZE - pending, &local_error);
     if (len > 0) {
         f->buf_size += len;
@@ -394,7 +392,7 @@ int qemu_fclose(QEMUFile *f)
     ret = qemu_file_get_error(f);
 
     if (f->ops->close) {
-        int ret2 = f->ops->close(f->opaque, NULL);
+        int ret2 = f->ops->close(f->ioc, NULL);
         if (ret >= 0) {
             ret = ret2;
         }
@@ -861,18 +859,19 @@ void qemu_put_counted_string(QEMUFile *f, const char *str)
 void qemu_file_set_blocking(QEMUFile *f, bool block)
 {
     if (f->ops->set_blocking) {
-        f->ops->set_blocking(f->opaque, block, NULL);
+        f->ops->set_blocking(f->ioc, block, NULL);
     }
 }
 
 /*
- * Return the ioc object if it's a migration channel.  Note: it can return NULL
- * for callers passing in a non-migration qemufile.  E.g. see qemu_fopen_bdrv()
- * and its usage in e.g. load_snapshot().  So we need to check against NULL
- * before using it.  If without the check, migration_incoming_state_destroy()
- * could fail for load_snapshot().
+ * qemu_file_get_ioc:
+ *
+ * Get the ioc object for the file, without incrementing
+ * the reference count.
+ *
+ * Returns: the ioc object
  */
 QIOChannel *qemu_file_get_ioc(QEMUFile *file)
 {
-    return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
+    return file->ioc;
 }
-- 
2.35.3


