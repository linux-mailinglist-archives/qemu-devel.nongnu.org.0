Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4201B7E9D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 21:11:24 +0200 (CEST)
Received: from localhost ([::1]:49120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS3jP-0003uX-4t
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 15:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jS3hS-0001ZH-Mh
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:09:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jS3hQ-0007bk-Ng
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:09:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:59128
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jS3hQ-0007ZD-7x
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 15:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587755359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESVCpLv8dcX3AiF10uDiu5SG9Qt4ofJftVuLrBj0vAA=;
 b=RDLwGLYa/ZF9gHYuvMH8eyst1seWLHgXYlCVuYPa5RvxFT9XwreKT1ppIO89TeGP7LQO9l
 lEodJ3gTiLsJvXlrQXxteOcbQD15mP9+sOxa4VPzHzD5lfZjEjckUM/9Z96rQ+h43bXRDx
 w1PFaOo/ohzY1CXUnCJvrl9JIFwaZwQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-w-Tncw2xMJCTA_Adm0XaJA-1; Fri, 24 Apr 2020 15:09:17 -0400
X-MC-Unique: w-Tncw2xMJCTA_Adm0XaJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78D52189952C;
 Fri, 24 Apr 2020 19:09:15 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E98FE5D9CA;
 Fri, 24 Apr 2020 19:09:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/3] block: Add blk_new_with_bs() helper
Date: Fri, 24 Apr 2020 14:09:01 -0500
Message-Id: <20200424190903.522087-2-eblake@redhat.com>
In-Reply-To: <20200424190903.522087-1-eblake@redhat.com>
References: <20200424190903.522087-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/24 13:45:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 "open list:Sheepdog" <sheepdog@lists.wpkg.org>, qemu-block@nongnu.org,
 Jeff Cody <codyprime@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Markus Armbruster <armbru@redhat.com>, mreitz@redhat.com, stefanha@redhat.com,
 Liu Yuan <namei.unix@gmail.com>, "Denis V. Lunev" <den@openvz.org>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are several callers that need to create a new block backend from
an existing BDS; make the task slightly easier with a common helper
routine.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/sysemu/block-backend.h |  2 ++
 block/block-backend.c          | 23 +++++++++++++++++++++++
 block/crypto.c                 | 10 ++++------
 block/parallels.c              |  8 ++++----
 block/qcow.c                   |  8 ++++----
 block/qcow2.c                  | 18 ++++++++----------
 block/qed.c                    |  9 ++++-----
 block/sheepdog.c               | 11 +++++------
 block/vdi.c                    |  8 ++++----
 block/vhdx.c                   |  9 ++++-----
 block/vmdk.c                   |  9 ++++-----
 block/vpc.c                    |  8 ++++----
 blockdev.c                     |  8 +++-----
 blockjob.c                     |  7 ++-----
 14 files changed, 75 insertions(+), 63 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.=
h
index 9bbdbd63d743..d37c1244dd9c 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -77,6 +77,8 @@ typedef struct BlockBackendPublic {
 } BlockBackendPublic;

 BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm=
);
+BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
+                              uint64_t shared_perm, Error **errp);
 BlockBackend *blk_new_open(const char *filename, const char *reference,
                            QDict *options, int flags, Error **errp);
 int blk_get_refcnt(BlockBackend *blk);
diff --git a/block/block-backend.c b/block/block-backend.c
index 38ae41382652..3592066b4259 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -355,6 +355,29 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, =
uint64_t shared_perm)
     return blk;
 }

+/*
+ * Create a new BlockBackend connected to an existing BlockDriverState.
+ *
+ * @perm is a bitmasks of BLK_PERM_* constants which describes the
+ * permissions to request for @bs that is attached to this
+ * BlockBackend.  @shared_perm is a bitmask which describes which
+ * permissions may be granted to other users of the attached node.
+ * Both sets of permissions can be changed later using blk_set_perm().
+ *
+ * Return the new BlockBackend on success, null on failure.
+ */
+BlockBackend *blk_new_with_bs(BlockDriverState *bs, uint64_t perm,
+                              uint64_t shared_perm, Error **errp)
+{
+    BlockBackend *blk =3D blk_new(bdrv_get_aio_context(bs), perm, shared_p=
erm);
+
+    if (blk_insert_bs(blk, bs, errp) < 0) {
+        blk_unref(blk);
+        return NULL;
+    }
+    return blk;
+}
+
 /*
  * Creates a new BlockBackend, opens a new BlockDriverState, and connects =
both.
  * The new BlockBackend is in the main AioContext.
diff --git a/block/crypto.c b/block/crypto.c
index d577f89659fa..a4d77f07fe8c 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -256,16 +256,14 @@ static int block_crypto_co_create_generic(BlockDriver=
State *bs,
                                           PreallocMode prealloc,
                                           Error **errp)
 {
-    int ret;
+    int ret =3D -EPERM;
     BlockBackend *blk;
     QCryptoBlock *crypto =3D NULL;
     struct BlockCryptoCreateData data;

-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM=
_ALL,
+                          errp);
+    if (!blk) {
         goto cleanup;
     }

diff --git a/block/parallels.c b/block/parallels.c
index 6d4ed77f165f..aad07b89c818 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -559,10 +559,10 @@ static int coroutine_fn parallels_co_create(BlockdevC=
reateOptions* opts,
         return -EIO;
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM=
_ALL,
+                          errp);
+    if (!blk) {
+        ret =3D -EPERM;
         goto out;
     }
     blk_set_allow_write_beyond_eof(blk, true);
diff --git a/block/qcow.c b/block/qcow.c
index 8973e4e565a1..3f0c60051933 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -849,10 +849,10 @@ static int coroutine_fn qcow_co_create(BlockdevCreate=
Options *opts,
         return -EIO;
     }

-    qcow_blk =3D blk_new(bdrv_get_aio_context(bs),
-                       BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(qcow_blk, bs, errp);
-    if (ret < 0) {
+    qcow_blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE,
+                               BLK_PERM_ALL, errp);
+    if (!qcow_blk) {
+        ret =3D -EPERM;
         goto exit;
     }
     blk_set_allow_write_beyond_eof(qcow_blk, true);
diff --git a/block/qcow2.c b/block/qcow2.c
index b524b0c53f84..f56745c56924 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3404,10 +3404,10 @@ qcow2_co_create(BlockdevCreateOptions *create_optio=
ns, Error **errp)
     }

     /* Create BlockBackend to write to the image */
-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM=
_ALL,
+                          errp);
+    if (!blk) {
+        ret =3D -EPERM;
         goto out;
     }
     blk_set_allow_write_beyond_eof(blk, true);
@@ -5359,12 +5359,10 @@ static int qcow2_amend_options(BlockDriverState *bs=
, QemuOpts *opts,
     }

     if (new_size) {
-        BlockBackend *blk =3D blk_new(bdrv_get_aio_context(bs),
-                                    BLK_PERM_RESIZE, BLK_PERM_ALL);
-        ret =3D blk_insert_bs(blk, bs, errp);
-        if (ret < 0) {
-            blk_unref(blk);
-            return ret;
+        BlockBackend *blk =3D blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PER=
M_ALL,
+                                            errp);
+        if (!blk) {
+            return -EPERM;
         }

         /*
diff --git a/block/qed.c b/block/qed.c
index 1af9b3cb1db1..7a31495d293b 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -610,7 +610,7 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCrea=
teOptions *opts,
     QEDHeader le_header;
     uint8_t *l1_table =3D NULL;
     size_t l1_size;
-    int ret =3D 0;
+    int ret =3D -EPERM;

     assert(opts->driver =3D=3D BLOCKDEV_DRIVER_QED);
     qed_opts =3D &opts->u.qed;
@@ -651,10 +651,9 @@ static int coroutine_fn bdrv_qed_co_create(BlockdevCre=
ateOptions *opts,
         return -EIO;
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM=
_ALL,
+                          errp);
+    if (!blk) {
         goto out;
     }
     blk_set_allow_write_beyond_eof(blk, true);
diff --git a/block/sheepdog.c b/block/sheepdog.c
index 59f7ebb1710f..2b53cd950d20 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -1801,14 +1801,13 @@ static int sd_prealloc(BlockDriverState *bs, int64_=
t old_size, int64_t new_size,
     uint32_t idx, max_idx;
     uint32_t object_size;
     void *buf =3D NULL;
-    int ret;
+    int ret =3D -EPERM;

-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE | BLK_PERM_RES=
IZE,
-                  BLK_PERM_ALL);
+    blk =3D blk_new_with_bs(bs,
+                          BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE | BLK_=
PERM_RESIZE,
+                          BLK_PERM_ALL, errp);

-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    if (!blk) {
         goto out_with_err_set;
     }

diff --git a/block/vdi.c b/block/vdi.c
index e1a11f2aa097..0e90130268cd 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -804,10 +804,10 @@ static int coroutine_fn vdi_co_do_create(BlockdevCrea=
teOptions *create_options,
         goto exit;
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs_file),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(blk, bs_file, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs_file, BLK_PERM_WRITE | BLK_PERM_RESIZE,
+                          BLK_PERM_ALL, errp);
+    if (!blk) {
+        ret =3D -EPERM;
         goto exit;
     }

diff --git a/block/vhdx.c b/block/vhdx.c
index 33e57cd6567a..bdf5d05cc018 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1891,7 +1891,7 @@ static int coroutine_fn vhdx_co_create(BlockdevCreate=
Options *opts,
     BlockBackend *blk =3D NULL;
     BlockDriverState *bs =3D NULL;

-    int ret =3D 0;
+    int ret =3D -EPERM;
     uint64_t image_size;
     uint32_t log_size;
     uint32_t block_size;
@@ -1984,10 +1984,9 @@ static int coroutine_fn vhdx_co_create(BlockdevCreat=
eOptions *opts,
         return -EIO;
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM=
_ALL,
+                          errp);
+    if (!blk) {
         goto delete_and_exit;
     }
     blk_set_allow_write_beyond_eof(blk, true);
diff --git a/block/vmdk.c b/block/vmdk.c
index 218d9c980059..dff9bd28cc3f 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -2717,11 +2717,10 @@ static BlockBackend *vmdk_co_create_cb(int64_t size=
, int idx,
     if (!bs) {
         return NULL;
     }
-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE | BLK_PERM_RES=
IZE,
-                  BLK_PERM_ALL);
-    if (blk_insert_bs(blk, bs, errp)) {
-        bdrv_unref(bs);
+    blk =3D blk_new_with_bs(bs,
+                          BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE | BLK_=
PERM_RESIZE,
+                          BLK_PERM_ALL, errp);
+    if (!blk) {
         return NULL;
     }
     blk_set_allow_write_beyond_eof(blk, true);
diff --git a/block/vpc.c b/block/vpc.c
index d8141b52da8b..4858083c20e4 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1012,10 +1012,10 @@ static int coroutine_fn vpc_co_create(BlockdevCreat=
eOptions *opts,
         return -EIO;
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs),
-                  BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM_ALL);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_WRITE | BLK_PERM_RESIZE, BLK_PERM=
_ALL,
+                          errp);
+    if (!blk) {
+        ret =3D -EPERM;
         goto out;
     }
     blk_set_allow_write_beyond_eof(blk, true);
diff --git a/blockdev.c b/blockdev.c
index 5faddaa7052f..f43426ed5fbc 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2711,7 +2711,6 @@ void qmp_block_resize(bool has_device, const char *de=
vice,
     BlockBackend *blk =3D NULL;
     BlockDriverState *bs;
     AioContext *aio_context;
-    int ret;

     bs =3D bdrv_lookup_bs(has_device ? device : NULL,
                         has_node_name ? node_name : NULL,
@@ -2734,14 +2733,13 @@ void qmp_block_resize(bool has_device, const char *=
device,
         goto out;
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs), BLK_PERM_RESIZE, BLK_PERM_AL=
L);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
+    blk =3D blk_new_with_bs(bs, BLK_PERM_RESIZE, BLK_PERM_ALL, errp);
+    if (!blk) {
         goto out;
     }

     bdrv_drained_begin(bs);
-    ret =3D blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
+    blk_truncate(blk, size, false, PREALLOC_MODE_OFF, errp);
     bdrv_drained_end(bs);

 out:
diff --git a/blockjob.c b/blockjob.c
index fc850312c124..2affa1844d4f 100644
--- a/blockjob.c
+++ b/blockjob.c
@@ -397,16 +397,13 @@ void *block_job_create(const char *job_id, const Bloc=
kJobDriver *driver,
 {
     BlockBackend *blk;
     BlockJob *job;
-    int ret;

     if (job_id =3D=3D NULL && !(flags & JOB_INTERNAL)) {
         job_id =3D bdrv_get_device_name(bs);
     }

-    blk =3D blk_new(bdrv_get_aio_context(bs), perm, shared_perm);
-    ret =3D blk_insert_bs(blk, bs, errp);
-    if (ret < 0) {
-        blk_unref(blk);
+    blk =3D blk_new_with_bs(bs, perm, shared_perm, errp);
+    if (!blk) {
         return NULL;
     }

--=20
2.26.2


