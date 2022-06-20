Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D294551748
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:22:16 +0200 (CEST)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FTv-0006eI-Ck
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FB4-0003DD-6g
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FB2-0007bb-FA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mTplg6ud9Dc5woY6H/MtjY+pQGiPhB2+uv2XdUq3QU0=;
 b=hz8dHIId6LLED7aUvTCA37di1BCb63tj1ph4WlNYOzyyOmS3DGP7N6YxWOPurX+2CoRkNO
 SNaa9Ow+0b6nT9Egn78qje+rRAJSYfDg3lL8zRSfwmzm49e2QLtJzJiusLcjUqNlBX9j6y
 ayFy86oxT/I/5ppDlAyqCZ75LR/+fIE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-qgWblLJ6OHenhdy-NcpnVQ-1; Mon, 20 Jun 2022 07:02:36 -0400
X-MC-Unique: qgWblLJ6OHenhdy-NcpnVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E57085A581;
 Mon, 20 Jun 2022 11:02:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D322DC28112;
 Mon, 20 Jun 2022 11:02:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 16/21] migration: remove the QEMUFileOps 'set_blocking'
 callback
Date: Mon, 20 Jun 2022 12:02:00 +0100
Message-Id: <20220620110205.1357829-17-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

This directly implements the set_blocking logic using QIOChannel APIs.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
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
index 6e79de1404..efbc0a5515 100644
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


