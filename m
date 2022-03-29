Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B004EB4CF
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 22:45:44 +0200 (CEST)
Received: from localhost ([::1]:40494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZIij-0006iR-J4
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 16:45:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIeo-0003ac-0F; Tue, 29 Mar 2022 16:41:38 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:44448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIel-0006Ys-62; Tue, 29 Mar 2022 16:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=Gk+SfTH6bisMmZA5DzviS089JFgg2SbkuHxVjfQzoxk=; 
 t=1648586495;x=1649191895; 
 b=QxCGGmPbiYH1opQFlJLf1jdqds84Uwdt2CXG2n48p++8cYUMpOQhKvzJ+Rp5FkI3Z4YCYHsDNjJarrCHAIukR+O5fKwmxIeaZrNMhM1aq1YtuDql7z9Y7/xjbXooEKjrObJi0v2n8jsZA/w2AFX5z0tsBWe6JpikGidpTV2BUTP0ytY3V1Mbk0EaErjpmJnjtnpZdAC0tdRrbB+eQgN8olTJ4HrbuU7i3csP63ZopVFTwlmbqevflYUPHwAiihmDxaqhFkronWfNrwExEhVQrap59Gw/cqnroZ8nfS5rS+KSvw9rEbJypOSYTUR8W7yBcMyc3Gr8oW6qlY33bN/30w==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIei-000374-Gh; Tue, 29 Mar 2022 23:41:33 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V. Lunev" <den@openvz.org>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v4 02/45] block: introduce bdrv_open_file_child() helper
Date: Tue, 29 Mar 2022 23:40:24 +0300
Message-Id: <20220329204107.411011-3-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61AD608933592879E20A8B16C77A2AB91B00894C459B0CD1B9B1BADD65B585385C4B1BBD4FE21B003AC206EF2094F4D734EA0974AE69F90BDD
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7B9FBA884A7C9B8BAEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637AC18FED211962C318638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81780CF1C05F950D6CB94E8A8C2CB67346F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7A4F00A9E8C511CEB9FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC74F4549EE67997D43AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379B06BA6FE78CAE96D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89FDD9D78FC36703085CE5475246E174218B5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CF593E0A4FA3DD8F544BFB2CA983ABB8C2BE0499FC8F83C379C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFD07623A0E6354027699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D345DE7771146E56B086B879FFC53B7D869FF614DE20492DE794DA8372186B20290CDAC6C9A46327B241D7E09C32AA3244CE5811BCF20A8A31FAFA3E7DB973FE131C86C126E7119A0FE46461017C5ECEC8C
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGaeDDHLO3/Egw==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE091173E07D013056C767CF233A6F34DC7930DD21EA83E65AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Almost all drivers call bdrv_open_child() similarly. Let's create a
helper for this.

The only not updated driver that call bdrv_open_child() to set
bs->file is raw-format, as it sometimes want to have filtered child but
don't set drv->is_filter to true.

Possibly we should implement drv->is_filter_func() handler, to consider
raw-format as filter when it works as filter.. But it's another story.

Note also, that we decrease assignments to bs->file in code: it helps
us restrict modifying this field in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c                   | 21 +++++++++++++++++++++
 block/blkdebug.c          |  9 +++------
 block/blklogwrites.c      |  7 ++-----
 block/blkreplay.c         |  7 ++-----
 block/blkverify.c         |  9 +++------
 block/bochs.c             |  7 +++----
 block/cloop.c             |  7 +++----
 block/copy-before-write.c |  9 ++++-----
 block/copy-on-read.c      |  9 ++++-----
 block/crypto.c            | 11 ++++++-----
 block/dmg.c               |  7 +++----
 block/filter-compress.c   |  6 ++----
 block/parallels.c         |  7 +++----
 block/preallocate.c       |  9 ++++-----
 block/qcow.c              |  6 ++----
 block/qcow2.c             |  8 ++++----
 block/qed.c               |  8 ++++----
 block/replication.c       |  8 +++-----
 block/throttle.c          |  8 +++-----
 block/vdi.c               |  7 +++----
 block/vhdx.c              |  7 +++----
 block/vmdk.c              |  7 +++----
 block/vpc.c               |  7 +++----
 include/block/block.h     |  3 +++
 24 files changed, 94 insertions(+), 100 deletions(-)

diff --git a/block.c b/block.c
index b54d59d1fa..b61c4b6128 100644
--- a/block.c
+++ b/block.c
@@ -3549,6 +3549,27 @@ BdrvChild *bdrv_open_child(const char *filename,
                              errp);
 }
 
+/*
+ * Wrapper on bdrv_open_child() for most popular case: open primary child of bs.
+ */
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent, Error **errp)
+{
+    BdrvChildRole role;
+
+    /* commit_top and mirror_top don't use this function */
+    assert(!parent->drv->filtered_child_is_backing);
+
+    role = parent->drv->is_filter ?
+        (BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY) : BDRV_CHILD_IMAGE;
+
+    parent->file = bdrv_open_child(filename, options, bdref_key, parent,
+                                   &child_of_bds, role, false, errp);
+
+    return parent->file ? 0 : -EINVAL;
+}
+
 /*
  * TODO Future callers may need to specify parent/child_class in order for
  * option inheritance to work. Existing callers use it for the root node.
diff --git a/block/blkdebug.c b/block/blkdebug.c
index bbf2948703..5fcfc8ac6f 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -503,12 +503,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the image file */
-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "image",
-                               bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-image"), options, "image",
+                               bs, errp);
+    if (ret < 0) {
         goto out;
     }
 
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index f7a251e91f..f66a617eb3 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -155,11 +155,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the file */
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, false,
-                               errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/blkreplay.c b/block/blkreplay.c
index dcbe780ddb..76a0b8d12a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -26,11 +26,8 @@ static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
 
     /* Open the image file */
-    bs->file = bdrv_open_child(NULL, options, "image", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "image", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/blkverify.c b/block/blkverify.c
index d1facf5ba9..920e891684 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -121,12 +121,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the raw file */
-    bs->file = bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "raw",
-                               bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(qemu_opt_get(opts, "x-raw"), options, "raw",
+                               bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/bochs.c b/block/bochs.c
index 4d68658087..b2dc06bbfd 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -110,10 +110,9 @@ static int bochs_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = bdrv_pread(bs->file, 0, &bochs, sizeof(bochs));
diff --git a/block/cloop.c b/block/cloop.c
index b8c6d0eccd..bee87da173 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -71,10 +71,9 @@ static int cloop_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* read header */
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..8aa2cb6a85 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -150,12 +150,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *copy_bitmap;
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 1fc7fb3333..815ac1d835 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -41,12 +41,11 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVStateCOR *state = bs->opaque;
     /* Find a bottom node name, if any */
     const char *bottom_node = qdict_get_try_str(options, "bottom");
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bs->supported_read_flags = BDRV_REQ_PREFETCH;
diff --git a/block/crypto.c b/block/crypto.c
index c8ba4681e2..abfce39230 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -260,15 +260,14 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 {
     BlockCrypto *crypto = bs->opaque;
     QemuOpts *opts = NULL;
-    int ret = -EINVAL;
+    int ret;
     QCryptoBlockOpenOptions *open_opts = NULL;
     unsigned int cflags = 0;
     QDict *cryptoopts = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bs->supported_write_flags = BDRV_REQ_FUA &
@@ -276,6 +275,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     opts = qemu_opts_create(opts_spec, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
@@ -284,6 +284,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     open_opts = block_crypto_open_opts_init(cryptoopts, errp);
     if (!open_opts) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
diff --git a/block/dmg.c b/block/dmg.c
index 447901fbb8..38c363dd39 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -439,10 +439,9 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
         return ret;
     }
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     block_module_load_one("dmg-bz2");
diff --git a/block/filter-compress.c b/block/filter-compress.c
index d5be538619..b2cfa9a9a5 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -30,10 +30,8 @@
 static int compress_open(BlockDriverState *bs, QDict *options, int flags,
                          Error **errp)
 {
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
+    int ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         return -EINVAL;
     }
 
diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bb..ed4debd899 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -735,10 +735,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     Error *local_err = NULL;
     char *buf;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = bdrv_pread(bs->file, 0, &ph, sizeof(ph));
diff --git a/block/preallocate.c b/block/preallocate.c
index 1d4233f730..332408bdc9 100644
--- a/block/preallocate.c
+++ b/block/preallocate.c
@@ -134,6 +134,7 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
                             Error **errp)
 {
     BDRVPreallocateState *s = bs->opaque;
+    int ret;
 
     /*
      * s->data_end and friends should be initialized on permission update.
@@ -141,11 +142,9 @@ static int preallocate_open(BlockDriverState *bs, QDict *options, int flags,
      */
     s->file_end = s->zero_start = s->data_end = -EINVAL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     if (!preallocate_absorb_opts(&s->opts, options, bs->file->bs, errp)) {
diff --git a/block/qcow.c b/block/qcow.c
index c39940f33e..544a17261f 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -120,10 +120,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
     qdict_extract_subqdict(options, &encryptopts, "encrypt.");
     encryptfmt = qdict_get_try_str(encryptopts, "format");
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        ret = -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
         goto fail;
     }
 
diff --git a/block/qcow2.c b/block/qcow2.c
index c8115e1cba..614df0307f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1890,11 +1890,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
         .errp = errp,
         .ret = -EINPROGRESS
     };
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     /* Initialise locks */
diff --git a/block/qed.c b/block/qed.c
index 558d3646c4..e3b06a3d00 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -558,11 +558,11 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
         .errp = errp,
         .ret = -EINPROGRESS
     };
+    int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     bdrv_qed_init_state(bs);
diff --git a/block/replication.c b/block/replication.c
index 55c8f894aa..2f17397764 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -88,11 +88,9 @@ static int replication_open(BlockDriverState *bs, QDict *options,
     const char *mode;
     const char *top_id;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     ret = -EINVAL;
diff --git a/block/throttle.c b/block/throttle.c
index 6e8d52fa24..4fb5798c27 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -78,11 +78,9 @@ static int throttle_open(BlockDriverState *bs, QDict *options,
     char *group;
     int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                               false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
     bs->supported_write_flags = bs->file->bs->supported_write_flags |
                                 BDRV_REQ_WRITE_UNCHANGED;
diff --git a/block/vdi.c b/block/vdi.c
index bdc58d726e..c50c0ed61f 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -376,10 +376,9 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     QemuUUID uuid_link, uuid_parent;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     logout("\n");
diff --git a/block/vhdx.c b/block/vhdx.c
index 356ec4c455..e7d6d7509a 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -996,10 +996,9 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
     uint64_t signature;
     Error *local_err = NULL;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     s->bat = NULL;
diff --git a/block/vmdk.c b/block/vmdk.c
index 0dfab6e941..7d7e56b36c 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1262,10 +1262,9 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVVmdkState *s = bs->opaque;
     uint32_t magic;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     buf = vmdk_read_desc(bs->file, 0, errp);
diff --git a/block/vpc.c b/block/vpc.c
index 297a26262a..430cab1cbb 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -232,10 +232,9 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
     int64_t bs_size;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
-                               BDRV_CHILD_IMAGE, false, errp);
-    if (!bs->file) {
-        return -EINVAL;
+    ret = bdrv_open_file_child(NULL, options, "file", bs, errp);
+    if (ret < 0) {
+        return ret;
     }
 
     opts = qemu_opts_create(&vpc_runtime_opts, NULL, 0, &error_abort);
diff --git a/include/block/block.h b/include/block/block.h
index e1713ee306..2783f77dc2 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -376,6 +376,9 @@ BdrvChild *bdrv_open_child(const char *filename,
                            const BdrvChildClass *child_class,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
+int bdrv_open_file_child(const char *filename,
+                         QDict *options, const char *bdref_key,
+                         BlockDriverState *parent, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
 int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                         Error **errp);
-- 
2.35.1


