Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CADD55823A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 19:13:01 +0200 (CEST)
Received: from localhost ([::1]:35100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4QO4-0004MW-Ji
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 13:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Q66-0006CM-KF
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4Q64-0005zh-VK
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 12:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656003264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T1xN+11P1k1HT8e/kdMnxGNyNbGhYmDHd2rNAaVdSkY=;
 b=TU9xpPnmiHAz9OC+wAAxqhhXIBF5GFEVFyq0PgCLraWmo7Nd3D0d7oJS49/9NPpaO4Yeav
 ggfRJzHA6TksqVbpdZ0g3mGTLsUPP3IR0SRJAISL6wmrTe/BXsvViezcrMttObb753ep8Y
 /Oh4k/mArOK14358FJ2KWm4oBFqERFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-JdM5PfxnNQ6HDQQPdpDuog-1; Thu, 23 Jun 2022 12:54:23 -0400
X-MC-Unique: JdM5PfxnNQ6HDQQPdpDuog-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22BFD101E985;
 Thu, 23 Jun 2022 16:54:23 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 278A42026D64;
 Thu, 23 Jun 2022 16:54:22 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 19/25] migration: remove the QEMUFileOps 'shut_down' callback
Date: Thu, 23 Jun 2022 17:53:48 +0100
Message-Id: <20220623165354.197792-20-dgilbert@redhat.com>
In-Reply-To: <20220623165354.197792-1-dgilbert@redhat.com>
References: <20220623165354.197792-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

This directly implements the shutdown logic using QIOChannel APIs.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file-channel.c | 27 ---------------------------
 migration/qemu-file.c         | 13 ++++++++++---
 migration/qemu-file.h         | 10 ----------
 3 files changed, 10 insertions(+), 40 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 5cb8ac93c0..80f05dc371 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -112,31 +112,6 @@ static int channel_close(void *opaque, Error **errp)
 }
 
 
-static int channel_shutdown(void *opaque,
-                            bool rd,
-                            bool wr,
-                            Error **errp)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-
-    if (qio_channel_has_feature(ioc,
-                                QIO_CHANNEL_FEATURE_SHUTDOWN)) {
-        QIOChannelShutdown mode;
-        if (rd && wr) {
-            mode = QIO_CHANNEL_SHUTDOWN_BOTH;
-        } else if (rd) {
-            mode = QIO_CHANNEL_SHUTDOWN_READ;
-        } else {
-            mode = QIO_CHANNEL_SHUTDOWN_WRITE;
-        }
-        if (qio_channel_shutdown(ioc, mode, errp) < 0) {
-            return -EIO;
-        }
-    }
-    return 0;
-}
-
-
 static int channel_set_blocking(void *opaque,
                                 bool enabled,
                                 Error **errp)
@@ -166,7 +141,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
 static const QEMUFileOps channel_input_ops = {
     .get_buffer = channel_get_buffer,
     .close = channel_close,
-    .shut_down = channel_shutdown,
     .set_blocking = channel_set_blocking,
     .get_return_path = channel_get_input_return_path,
 };
@@ -175,7 +149,6 @@ static const QEMUFileOps channel_input_ops = {
 static const QEMUFileOps channel_output_ops = {
     .writev_buffer = channel_writev_buffer,
     .close = channel_close,
-    .shut_down = channel_shutdown,
     .set_blocking = channel_set_blocking,
     .get_return_path = channel_get_output_return_path,
 };
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 2d6ceb53af..d71bcb6c9c 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -71,16 +71,23 @@ struct QEMUFile {
 /*
  * Stop a file from being read/written - not all backing files can do this
  * typically only sockets can.
+ *
+ * TODO: convert to propagate Error objects instead of squashing
+ * to a fixed errno value
  */
 int qemu_file_shutdown(QEMUFile *f)
 {
-    int ret;
+    int ret = 0;
 
     f->shutdown = true;
-    if (!f->ops->shut_down) {
+    if (!qio_channel_has_feature(f->ioc,
+                                 QIO_CHANNEL_FEATURE_SHUTDOWN)) {
         return -ENOSYS;
     }
-    ret = f->ops->shut_down(f->ioc, true, true, NULL);
+
+    if (qio_channel_shutdown(f->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL) < 0) {
+        ret = -EIO;
+    }
 
     if (!f->last_error) {
         qemu_file_set_error(f, -EIO);
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index fe1b2d1c00..9fa92c1998 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -89,22 +89,12 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
  */
 typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
 
-/*
- * Stop any read or write (depending on flags) on the underlying
- * transport on the QEMUFile.
- * Existing blocking reads/writes must be woken
- * Returns 0 on success, -err on error
- */
-typedef int (QEMUFileShutdownFunc)(void *opaque, bool rd, bool wr,
-                                   Error **errp);
-
 typedef struct QEMUFileOps {
     QEMUFileGetBufferFunc *get_buffer;
     QEMUFileCloseFunc *close;
     QEMUFileSetBlocking *set_blocking;
     QEMUFileWritevBufferFunc *writev_buffer;
     QEMURetPathFunc *get_return_path;
-    QEMUFileShutdownFunc *shut_down;
 } QEMUFileOps;
 
 typedef struct QEMUFileHooks {
-- 
2.36.1


