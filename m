Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834961D4E82
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 15:10:43 +0200 (CEST)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZa6s-0005tZ-Jc
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 09:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjR-0003VE-UE
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40106
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjQ-0002RD-SM
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdZ9Ng9D2S+MWyTy/IA76hQD8meauYjfqfc65E4W2I0=;
 b=WKpfIKHD3JrFmP3N04guZ/uD+DtltTPqdQK/uHt0vp2xrptYOaVXm4TjVhd8A+osqdZuzT
 5kWgSCnmhd8E7g7ZWYZdHTjNNeiAT/MZBjbSNib8f2DVfAAo25sbJeXx72wluuX84RP1Rn
 cV/kcRmcHXpwd3KLiP1Qzi8lQISab68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-PJZnAgGSPnyvMHmLztxYDw-1; Fri, 15 May 2020 08:46:24 -0400
X-MC-Unique: PJZnAgGSPnyvMHmLztxYDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 212F51005512;
 Fri, 15 May 2020 12:46:23 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 272D72E024;
 Fri, 15 May 2020 12:46:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 37/51] block: Make format drivers use child_of_bds
Date: Fri, 15 May 2020 14:45:07 +0200
Message-Id: <20200515124521.335403-38-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:39:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Commonly, they need to pass the BDRV_CHILD_IMAGE set as the
BdrvChildRole; but there are exceptions for drivers with external data
files (qcow2 and vmdk).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200513110544.176672-26-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/bochs.c     |  4 ++--
 block/cloop.c     |  4 ++--
 block/crypto.c    |  4 ++--
 block/dmg.c       |  4 ++--
 block/parallels.c |  4 ++--
 block/qcow.c      |  4 ++--
 block/qcow2.c     | 19 +++++++++++++------
 block/qed.c       |  4 ++--
 block/vdi.c       |  4 ++--
 block/vhdx.c      |  4 ++--
 block/vmdk.c      | 20 +++++++++++++++++---
 block/vpc.c       |  4 ++--
 12 files changed, 50 insertions(+), 29 deletions(-)

diff --git a/block/bochs.c b/block/bochs.c
index b013e73063..62c3f42548 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -110,8 +110,8 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/cloop.c b/block/cloop.c
index 3ed9fa63cc..d374a8427d 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -71,8 +71,8 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/crypto.c b/block/crypto.c
index 8b516bfee2..457f3a06a5 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -218,8 +218,8 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
     unsigned int cflags = 0;
     QDict *cryptoopts = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/dmg.c b/block/dmg.c
index af8188638c..bc64194577 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -439,8 +439,8 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/parallels.c b/block/parallels.c
index 9855ac1162..168d6c531a 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -739,8 +739,8 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     Error *local_err = NULL;
     char *buf;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/qcow.c b/block/qcow.c
index 13583f0339..5347037720 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -130,8 +130,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
     encryptfmt = qdict_get_try_str(encryptopts, "format");
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         ret = -EINVAL;
         goto fail;
diff --git a/block/qcow2.c b/block/qcow2.c
index 86335d9403..8d7230dca8 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1590,8 +1590,9 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     }
 
     /* Open external data file */
-    s->data_file = bdrv_open_child(NULL, options, "data-file", bs, &child_file,
-                                   0, true, &local_err);
+    s->data_file = bdrv_open_child(NULL, options, "data-file", bs,
+                                   &child_of_bds, BDRV_CHILD_DATA,
+                                   true, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         ret = -EINVAL;
@@ -1601,8 +1602,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     if (s->incompatible_features & QCOW2_INCOMPAT_DATA_FILE) {
         if (!s->data_file && s->image_data_file) {
             s->data_file = bdrv_open_child(s->image_data_file, options,
-                                           "data-file", bs, &child_file, 0,
-                                           false, errp);
+                                           "data-file", bs, &child_of_bds,
+                                           BDRV_CHILD_DATA, false, errp);
             if (!s->data_file) {
                 ret = -EINVAL;
                 goto fail;
@@ -1613,6 +1614,12 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
             ret = -EINVAL;
             goto fail;
         }
+
+        /* No data here */
+        bs->file->role &= ~BDRV_CHILD_DATA;
+
+        /* Must succeed because we have given up permissions if anything */
+        bdrv_child_refresh_perms(bs, bs->file, &error_abort);
     } else {
         if (s->data_file) {
             error_setg(errp, "'data-file' can only be set for images with an "
@@ -1863,8 +1870,8 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
         .ret = -EINPROGRESS
     };
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/qed.c b/block/qed.c
index 1ad2aba810..ef6463b48d 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -547,8 +547,8 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
         .ret = -EINPROGRESS
     };
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/vdi.c b/block/vdi.c
index 653acb5fc1..d20698b3cc 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -378,8 +378,8 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     Error *local_err = NULL;
     QemuUUID uuid_link, uuid_parent;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/vhdx.c b/block/vhdx.c
index dde156c97b..62c6bd69ff 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -996,8 +996,8 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     uint64_t signature;
     Error *local_err = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/vmdk.c b/block/vmdk.c
index c2cb741e2d..fadc98a262 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1089,6 +1089,7 @@ static int vmdk_parse_extents(const char *desc, BlockDriverState *bs,
     char *desc_file_dir = NULL;
     char *extent_path;
     BdrvChild *extent_file;
+    BdrvChildRole extent_role;
     BDRVVmdkState *s = bs->opaque;
     VmdkExtent *extent;
     char extent_opt_prefix[32];
@@ -1151,8 +1152,15 @@ static int vmdk_parse_extents(const char *desc, BlockDriverState *bs,
         ret = snprintf(extent_opt_prefix, 32, "extents.%d", s->num_extents);
         assert(ret < 32);
 
+        extent_role = BDRV_CHILD_DATA;
+        if (strcmp(type, "FLAT") != 0 && strcmp(type, "VMFS") != 0) {
+            /* non-flat extents have metadata */
+            extent_role |= BDRV_CHILD_METADATA;
+        }
+
         extent_file = bdrv_open_child(extent_path, options, extent_opt_prefix,
-                                      bs, &child_file, 0, false, &local_err);
+                                      bs, &child_of_bds, extent_role, false,
+                                      &local_err);
         g_free(extent_path);
         if (local_err) {
             error_propagate(errp, local_err);
@@ -1257,8 +1265,8 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     uint32_t magic;
     Error *local_err = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
@@ -1277,6 +1285,12 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
             s->desc_offset = 0x200;
             break;
         default:
+            /* No data in the descriptor file */
+            bs->file->role &= ~BDRV_CHILD_DATA;
+
+            /* Must succeed because we have given up permissions if anything */
+            bdrv_child_refresh_perms(bs, bs->file, &error_abort);
+
             ret = vmdk_open_desc_file(bs, flags, buf, options, errp);
             break;
     }
diff --git a/block/vpc.c b/block/vpc.c
index b2a86074a5..651a6737b6 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -228,8 +228,8 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     int64_t bs_size;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
-                               false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_IMAGE, false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
-- 
2.25.4


