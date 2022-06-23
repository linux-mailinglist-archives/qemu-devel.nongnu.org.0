Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C54557732
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:55:53 +0200 (CEST)
Received: from localhost ([::1]:50106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4JZ2-0000Ou-Tk
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8p-0000d1-2z
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o4J8m-0004yS-Hn
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 05:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655976524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4axUKHaIIzvzWlrJsA5rLvfS1C75sXnDRQj3DDCmvRE=;
 b=ffrXaP2YAkgYoU6gu7MOr/e+q2cJJNg98H7HyNJjJjI4iTudOtjhMehZuIxr4lT+VAbLOs
 oV4NbKIJuV3bl3RvF9nfc4xRr8ZNQbT/g3s4/Yh5hekj0dFL65ZZez2jcy4NVKVluNh6D+
 0ViVvGSATG1nzkqB6n+4jEbFXZ+7yQo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-NhCv1j5cMcCKJ4sAVa6R1Q-1; Thu, 23 Jun 2022 05:28:40 -0400
X-MC-Unique: NhCv1j5cMcCKJ4sAVa6R1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55F9C1C05199;
 Thu, 23 Jun 2022 09:28:40 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57068404E4DC;
 Thu, 23 Jun 2022 09:28:39 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, huangy81@chinatelecom.cn,
 quintela@redhat.com, leobras@redhat.com, peterx@redhat.com
Cc: jdenemar@redhat.com
Subject: [PULL 20/33] migration: remove the QEMUFileOps 'set_blocking' callback
Date: Thu, 23 Jun 2022 10:27:57 +0100
Message-Id: <20220623092810.96234-21-dgilbert@redhat.com>
In-Reply-To: <20220623092810.96234-1-dgilbert@redhat.com>
References: <20220623092810.96234-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

This directly implements the set_blocking logic using QIOChannel APIs.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file-channel.c | 14 --------------
 migration/qemu-file.c         |  4 +---
 migration/qemu-file.h         |  5 -----
 3 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 80f05dc371..0350d367ec 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -112,18 +112,6 @@ static int channel_close(void *opaque, Error **errp)
 }
 
 
-static int channel_set_blocking(void *opaque,
-                                bool enabled,
-                                Error **errp)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-
-    if (qio_channel_set_blocking(ioc, enabled, errp) < 0) {
-        return -1;
-    }
-    return 0;
-}
-
 static QEMUFile *channel_get_input_return_path(void *opaque)
 {
     QIOChannel *ioc = QIO_CHANNEL(opaque);
@@ -141,7 +129,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
 static const QEMUFileOps channel_input_ops = {
     .get_buffer = channel_get_buffer,
     .close = channel_close,
-    .set_blocking = channel_set_blocking,
     .get_return_path = channel_get_input_return_path,
 };
 
@@ -149,7 +136,6 @@ static const QEMUFileOps channel_input_ops = {
 static const QEMUFileOps channel_output_ops = {
     .writev_buffer = channel_writev_buffer,
     .close = channel_close,
-    .set_blocking = channel_set_blocking,
     .get_return_path = channel_get_output_return_path,
 };
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d71bcb6c9c..95d5db9dd6 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -879,9 +879,7 @@ void qemu_put_counted_string(QEMUFile *f, const char *str)
  */
 void qemu_file_set_blocking(QEMUFile *f, bool block)
 {
-    if (f->ops->set_blocking) {
-        f->ops->set_blocking(f->ioc, block, NULL);
-    }
+    qio_channel_set_blocking(f->ioc, block, NULL);
 }
 
 /*
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 9fa92c1998..7793e765f2 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -46,10 +46,6 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
  */
 typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
 
-/* Called to change the blocking mode of the file
- */
-typedef int (QEMUFileSetBlocking)(void *opaque, bool enabled, Error **errp);
-
 /*
  * This function writes an iovec to file. The handler must write all
  * of the data or return a negative errno value.
@@ -92,7 +88,6 @@ typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
 typedef struct QEMUFileOps {
     QEMUFileGetBufferFunc *get_buffer;
     QEMUFileCloseFunc *close;
-    QEMUFileSetBlocking *set_blocking;
     QEMUFileWritevBufferFunc *writev_buffer;
     QEMURetPathFunc *get_return_path;
 } QEMUFileOps;
-- 
2.36.1


