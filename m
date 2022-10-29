Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792716122DA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 14:21:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ookpP-0006qD-Tc; Sat, 29 Oct 2022 08:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ookpK-0006hh-NX
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 08:20:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ookpI-0008B8-QT
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 08:20:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667046035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=goTTYaFYidCzNhW//N4KcgjA3RQSCDFUzuMCDLpfuac=;
 b=PO8CS6D1k+42N4Z+x8uBUe83AEnNiAvEYEj6M25E6ImqJrS6uxtYL/Y8SEoKPsSyOpy2In
 XPkA9StKMhq2ydkOgXVqsFTPNiEtkdyi3Tns/wXvntaQgzj5xMmWGci8Ox5O8psYBJPsOi
 PvkvKBPmyd6ntUpkeZ7Um0TlbyQubNE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-1jPC-ZqIOo6Gb4QzRCGiAQ-1; Sat, 29 Oct 2022 08:20:34 -0400
X-MC-Unique: 1jPC-ZqIOo6Gb4QzRCGiAQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E273D1C05159;
 Sat, 29 Oct 2022 12:20:33 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9E66140EBF3;
 Sat, 29 Oct 2022 12:20:32 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH] block/blkio: Tolerate device size changes
Date: Sat, 29 Oct 2022 13:20:31 +0100
Message-Id: <20221029122031.975273-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some libblkio drivers may be able to work with regular files (e.g.,
io_uring) or otherwise resizable devices. Conservatively set
BlockDriver::has_variable_length to true to ensure bdrv_nb_sectors()
always gives up-to-date results.

Also implement BlockDriver::bdrv_co_truncate for the case where no
preallocation is needed and the device already has a size compatible
with what was requested.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---

This is based on Stefan's block tree:
https://gitlab.com/stefanha/qemu/-/commits/block

 block/blkio.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/block/blkio.c b/block/blkio.c
index 82f26eedd2..190454cdbe 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -845,6 +845,31 @@ static int64_t blkio_getlength(BlockDriverState *bs)
     return capacity;
 }
 
+static int coroutine_fn blkio_truncate(BlockDriverState *bs, int64_t offset,
+                                       bool exact, PreallocMode prealloc,
+                                       BdrvRequestFlags flags, Error **errp)
+{
+    int64_t current_length;
+
+    if (prealloc != PREALLOC_MODE_OFF) {
+        error_setg(errp, "Unsupported preallocation mode '%s'",
+                   PreallocMode_str(prealloc));
+        return -ENOTSUP;
+    }
+
+    current_length = blkio_getlength(bs);
+
+    if (offset > current_length) {
+        error_setg(errp, "Cannot grow device");
+        return -EINVAL;
+    } else if (exact && offset != current_length) {
+        error_setg(errp, "Cannot resize device");
+        return -ENOTSUP;
+    }
+
+    return 0;
+}
+
 static int blkio_get_info(BlockDriverState *bs, BlockDriverInfo *bdi)
 {
     return 0;
@@ -960,10 +985,12 @@ static void blkio_refresh_limits(BlockDriverState *bs, Error **errp)
     { \
         .format_name             = name, \
         .protocol_name           = name, \
+        .has_variable_length     = true, \
         .instance_size           = sizeof(BDRVBlkioState), \
         .bdrv_file_open          = blkio_file_open, \
         .bdrv_close              = blkio_close, \
         .bdrv_getlength          = blkio_getlength, \
+        .bdrv_co_truncate        = blkio_truncate, \
         .bdrv_get_info           = blkio_get_info, \
         .bdrv_attach_aio_context = blkio_attach_aio_context, \
         .bdrv_detach_aio_context = blkio_detach_aio_context, \
-- 
2.38.1


