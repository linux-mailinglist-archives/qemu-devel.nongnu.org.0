Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A88532A15
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:13:36 +0200 (CEST)
Received: from localhost ([::1]:60246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTPr-0007vY-Gf
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntSJp-00066t-7Z
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:03:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ntSJh-0003X9-I6
 for qemu-devel@nongnu.org; Tue, 24 May 2022 07:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653390188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DuoS4lAc9nEl2/Uu9IBjdWqa4ATF2VoAuiAH2VLQaIU=;
 b=DMdmlPm7Xi0kijzf67ZG9j2nw4Egs9MIK4cGFGF73srbm1zpEqlcpceszYFdEdty/EkYN1
 6BnxJJoiRAt90Ewzbj6M7ZP5wwH21NQiU2DvHMlit169Htl39OHkB6/J9IVqbG43AdR4Ja
 obdKZf7nnS+idA1HIj1Zb8SHyLJZfxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-sEJuZ6ZpPkCacYo5_Yb2Ew-1; Tue, 24 May 2022 07:03:05 -0400
X-MC-Unique: sEJuZ6ZpPkCacYo5_Yb2Ew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53D84801228;
 Tue, 24 May 2022 11:03:05 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8FEE1121315;
 Tue, 24 May 2022 11:03:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 16/20] migration: remove the QEMUFileOps 'close' callback
Date: Tue, 24 May 2022 12:02:31 +0100
Message-Id: <20220524110235.145079-17-berrange@redhat.com>
In-Reply-To: <20220524110235.145079-1-berrange@redhat.com>
References: <20220524110235.145079-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This directly implements the close logic using QIOChannel APIs.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/qemu-file-channel.c | 12 ------------
 migration/qemu-file.c         | 12 ++++++------
 migration/qemu-file.h         | 10 ----------
 3 files changed, 6 insertions(+), 28 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 0350d367ec..8ff58e81f9 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -102,16 +102,6 @@ static ssize_t channel_get_buffer(void *opaque,
 }
 
 
-static int channel_close(void *opaque, Error **errp)
-{
-    int ret;
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-    ret = qio_channel_close(ioc, errp);
-    object_unref(OBJECT(ioc));
-    return ret;
-}
-
-
 static QEMUFile *channel_get_input_return_path(void *opaque)
 {
     QIOChannel *ioc = QIO_CHANNEL(opaque);
@@ -128,14 +118,12 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
 
 static const QEMUFileOps channel_input_ops = {
     .get_buffer = channel_get_buffer,
-    .close = channel_close,
     .get_return_path = channel_get_input_return_path,
 };
 
 
 static const QEMUFileOps channel_output_ops = {
     .writev_buffer = channel_writev_buffer,
-    .close = channel_close,
     .get_return_path = channel_get_output_return_path,
 };
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 171b9f85bf..a855ce33dc 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -405,16 +405,16 @@ void qemu_file_credit_transfer(QEMUFile *f, size_t size)
  */
 int qemu_fclose(QEMUFile *f)
 {
-    int ret;
+    int ret, ret2;
     qemu_fflush(f);
     ret = qemu_file_get_error(f);
 
-    if (f->ops->close) {
-        int ret2 = f->ops->close(f->ioc, NULL);
-        if (ret >= 0) {
-            ret = ret2;
-        }
+    ret2 = qio_channel_close(f->ioc, NULL);
+    if (ret >= 0) {
+        ret = ret2;
     }
+    g_clear_pointer(&f->ioc, object_unref);
+
     /* If any error was spotted before closing, we should report it
      * instead of the close() return value.
      */
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 6db4bb9fdb..7ec105bf96 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -37,15 +37,6 @@ typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
                                         int64_t pos, size_t size,
                                         Error **errp);
 
-/* Close a file
- *
- * Return negative error number on error, 0 or positive value on success.
- *
- * The meaning of return value on success depends on the specific back-end being
- * used.
- */
-typedef int (QEMUFileCloseFunc)(void *opaque, Error **errp);
-
 /*
  * This function writes an iovec to file. The handler must write all
  * of the data or return a negative errno value.
@@ -87,7 +78,6 @@ typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
 
 typedef struct QEMUFileOps {
     QEMUFileGetBufferFunc *get_buffer;
-    QEMUFileCloseFunc *close;
     QEMUFileWritevBufferFunc *writev_buffer;
     QEMURetPathFunc *get_return_path;
 } QEMUFileOps;
-- 
2.36.1


