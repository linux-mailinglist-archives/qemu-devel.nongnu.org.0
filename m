Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E1611E35
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 01:41:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooYwM-0007sy-Ox; Fri, 28 Oct 2022 19:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooYwI-0007sX-O4
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 19:39:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1ooYwG-00084s-Se
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 19:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667000339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dDeW5b36/zACsW5srxGOdqRHBqpoSLNWxYFdYnQHCbc=;
 b=cnErTlMTGzGOK0bWzaxxoPl994xOiM/6PknoCVlgHEVzMbE7x8ISs1mbxGArAt3RS1pM/h
 oqX3CdWfFki17QlqlG1eHC8P7y91Rq4oFrl2mPFArnwbpPRrHBduUiTUTIRq4Ngao0wO+y
 8ZFBAaS9tBi3vtffiLcpfi5ejRL5ScA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-fABMB80QPDmMecQge3eEoA-1; Fri, 28 Oct 2022 19:38:57 -0400
X-MC-Unique: fABMB80QPDmMecQge3eEoA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A2773C025BE;
 Fri, 28 Oct 2022 23:38:57 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD424EA52;
 Fri, 28 Oct 2022 23:38:55 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH] block/blkio: Make driver nvme-io_uring take a "path" instead
 of a "filename"
Date: Sat, 29 Oct 2022 00:38:54 +0100
Message-Id: <20221028233854.839933-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
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

The nvme-io_uring driver expects a character special file such as
/dev/ng0n1. Follow the convention of having a "filename" option when a
regular file is expected, and a "path" option otherwise.

This makes io_uring the only libblkio-based driver with a "filename"
option, as it accepts a regular file (even though it can also take a
block special file).

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/blkio.c        | 12 ++++++++----
 qapi/block-core.json |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/block/blkio.c b/block/blkio.c
index 82f26eedd2..5f600e5e9e 100644
--- a/block/blkio.c
+++ b/block/blkio.c
@@ -639,12 +639,17 @@ static int blkio_io_uring_open(BlockDriverState *bs, QDict *options, int flags,
 static int blkio_nvme_io_uring(BlockDriverState *bs, QDict *options, int flags,
                                Error **errp)
 {
-    const char *filename = qdict_get_str(options, "filename");
+    const char *path = qdict_get_try_str(options, "path");
     BDRVBlkioState *s = bs->opaque;
     int ret;
 
-    ret = blkio_set_str(s->blkio, "path", filename);
-    qdict_del(options, "filename");
+    if (!path) {
+        error_setg(errp, "missing 'path' option");
+        return -EINVAL;
+    }
+
+    ret = blkio_set_str(s->blkio, "path", path);
+    qdict_del(options, "path");
     if (ret < 0) {
         error_setg_errno(errp, -ret, "failed to set path: %s",
                          blkio_get_error_msg());
@@ -986,7 +991,6 @@ static BlockDriver bdrv_io_uring = BLKIO_DRIVER(
 
 static BlockDriver bdrv_nvme_io_uring = BLKIO_DRIVER(
     DRIVER_NVME_IO_URING,
-    .bdrv_needs_filename = true,
 );
 
 static BlockDriver bdrv_virtio_blk_vhost_user = BLKIO_DRIVER(
diff --git a/qapi/block-core.json b/qapi/block-core.json
index cb5079e645..6d36c0ed8b 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3703,12 +3703,12 @@
 #
 # Driver specific block device options for the nvme-io_uring backend.
 #
-# @filename: path to the image file
+# @path: path to the image file
 #
 # Since: 7.2
 ##
 { 'struct': 'BlockdevOptionsNvmeIoUring',
-  'data': { 'filename': 'str' },
+  'data': { 'path': 'str' },
   'if': 'CONFIG_BLKIO' }
 
 ##
-- 
2.38.1


