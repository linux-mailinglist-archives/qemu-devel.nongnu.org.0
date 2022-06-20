Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FCB551744
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:21:03 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FSo-0003TK-UK
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FB9-0003Dy-K8
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FB8-0007cw-2b
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0T1CkMeL/OStsK48/fbDWLs8/wlICvL+te8B0tAy44=;
 b=TzCdWpWz4dF1sW94I11UR75jrrQPU+4JfBIK6nZ48wl6Qhie4P68PkWmKGRE6+e0IgTXeK
 nkcmdaCMMnJa5+wcfWvok3fZEqKyHl5iJa5pwFsgOvvPOIOsKzuc46C5EziUsRtZTFeaj2
 9qi1hkDpqcx4ES44C2E0xH5+G1pj/3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-0WTzODkCP3SpIiW3cSLYrw-1; Mon, 20 Jun 2022 07:02:39 -0400
X-MC-Unique: 0WTzODkCP3SpIiW3cSLYrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C67985A580;
 Mon, 20 Jun 2022 11:02:39 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 073C5C08087;
 Mon, 20 Jun 2022 11:02:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 18/21] migration: remove the QEMUFileOps 'get_buffer'
 callback
Date: Mon, 20 Jun 2022 12:02:02 +0100
Message-Id: <20220620110205.1357829-19-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

This directly implements the get_buffer logic using QIOChannel APIs.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/qemu-file-channel.c | 29 -----------------------------
 migration/qemu-file.c         | 18 ++++++++++++++++--
 migration/qemu-file.h         |  9 ---------
 3 files changed, 16 insertions(+), 40 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 8ff58e81f9..7b32831752 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -74,34 +74,6 @@ static ssize_t channel_writev_buffer(void *opaque,
 }
 
 
-static ssize_t channel_get_buffer(void *opaque,
-                                  uint8_t *buf,
-                                  int64_t pos,
-                                  size_t size,
-                                  Error **errp)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-    ssize_t ret;
-
-    do {
-        ret = qio_channel_read(ioc, (char *)buf, size, errp);
-        if (ret < 0) {
-            if (ret == QIO_CHANNEL_ERR_BLOCK) {
-                if (qemu_in_coroutine()) {
-                    qio_channel_yield(ioc, G_IO_IN);
-                } else {
-                    qio_channel_wait(ioc, G_IO_IN);
-                }
-            } else {
-                return -EIO;
-            }
-        }
-    } while (ret == QIO_CHANNEL_ERR_BLOCK);
-
-    return ret;
-}
-
-
 static QEMUFile *channel_get_input_return_path(void *opaque)
 {
     QIOChannel *ioc = QIO_CHANNEL(opaque);
@@ -117,7 +89,6 @@ static QEMUFile *channel_get_output_return_path(void *opaque)
 }
 
 static const QEMUFileOps channel_input_ops = {
-    .get_buffer = channel_get_buffer,
     .get_return_path = channel_get_input_return_path,
 };
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 5eb8cf0e28..df438724cd 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -377,8 +377,22 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
         return 0;
     }
 
-    len = f->ops->get_buffer(f->ioc, f->buf + pending, f->total_transferred,
-                             IO_BUF_SIZE - pending, &local_error);
+    do {
+        len = qio_channel_read(f->ioc,
+                               (char *)f->buf + pending,
+                               IO_BUF_SIZE - pending,
+                               &local_error);
+        if (len == QIO_CHANNEL_ERR_BLOCK) {
+            if (qemu_in_coroutine()) {
+                qio_channel_yield(f->ioc, G_IO_IN);
+            } else {
+                qio_channel_wait(f->ioc, G_IO_IN);
+            }
+        } else if (len < 0) {
+            len = EIO;
+        }
+    } while (len == QIO_CHANNEL_ERR_BLOCK);
+
     if (len > 0) {
         f->buf_size += len;
         f->total_transferred += len;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 4a3beedb5b..f7ed568894 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -29,14 +29,6 @@
 #include "exec/cpu-common.h"
 #include "io/channel.h"
 
-/* Read a chunk of data from a file at the given position.  The pos argument
- * can be ignored if the file is only be used for streaming.  The number of
- * bytes actually read should be returned.
- */
-typedef ssize_t (QEMUFileGetBufferFunc)(void *opaque, uint8_t *buf,
-                                        int64_t pos, size_t size,
-                                        Error **errp);
-
 /*
  * This function writes an iovec to file. The handler must write all
  * of the data or return a negative errno value.
@@ -77,7 +69,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
 typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
 
 typedef struct QEMUFileOps {
-    QEMUFileGetBufferFunc *get_buffer;
     QEMUFileWritevBufferFunc *writev_buffer;
     QEMURetPathFunc *get_return_path;
 } QEMUFileOps;
-- 
2.36.1


