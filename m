Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EEB4ED004
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:28:11 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhjW-0006ba-N1
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:28:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsn-0007sK-Ps
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:37 -0400
Received: from [2a00:1450:4864:20::230] (port=38717
 helo=mail-lj1-x230.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsk-00039F-4O
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:37 -0400
Received: by mail-lj1-x230.google.com with SMTP id s13so12413099ljd.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNNdHTPn1DUv74tlqYf7JLxDRsIrqUmTToAPG0Th9yo=;
 b=Y4NguSOOc0Yk3oPa81yyiTsq9/jz5Ukg7XzbAx6GPLMDIW+Ar8rEMYJbfjGshGavBC
 S4cdoMjAHXwtJ97gtqpfeIglPTvSdoXVcLDUB/Uzoj1lRyOGPbETN+EN+I/XTESRAJWA
 hheKXrSJ8F3/0DkhWhrgKTuigw8Dj4x9K8yPRKQ99oIWtFdu1yAzAIY9URabNyJEdxS8
 jkCVj/qMyYych2InJf2OS1N5wgNODv+meeU8xWSMVkceihHdkL7XTY7RQdioaCpW/k7X
 wCLEJaG1+6OAFSssUk9V/9V9iqT0HOCO4Uq5zhaITmxVGyCb8EBPTlCTILcixYb9Qkka
 BrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vNNdHTPn1DUv74tlqYf7JLxDRsIrqUmTToAPG0Th9yo=;
 b=ws5Q8t4ifJyhuXcfFSGuVA9GOTkF6BPsjaz1Ui2tSaqmADwiMF72y8uBeHW460+Oaj
 6qg2Wd0s6pbMzvZrponoE6bZPW+kA7CXAXFiLRq5kx4XONdNcsQMoBc8qE78BRnCF5ZB
 8yIKKp49gxd6/Sj4S/Z6yioobcIpjMD1ydhm1YuGsXE3B4FpL4550Qyub8wo8Z8uww+b
 ulwraXgPnInLBKnICJqZgZxo1rsZb5uVwT37DIwPg0zItP+Sn0HvshcSb+qgl9ebVlL1
 h5XLu2rR6hRCDObpRvNh2US8HhP2sUG9Tfuyb5CN3Iwy8IeO4ueKpM6ExtlX7QulonUp
 0YtA==
X-Gm-Message-State: AOAM532B7sk3HurFFSMzU65uDxxeUvRxx3IBS+Ih60JrPS5zMXUsbI5g
 jUrmLufAFCgrCRhJnZgax21Rug==
X-Google-Smtp-Source: ABdhPJzo1MtEfZ6B/UH3741I+qEx1eTd9rnpCwHWaqTeys1T0IJyupnHkEsE/uH7F5gwKucUcGzSqg==
X-Received: by 2002:a2e:22c5:0:b0:249:b8c6:282e with SMTP id
 i188-20020a2e22c5000000b00249b8c6282emr8434868lji.140.1648675772445; 
 Wed, 30 Mar 2022 14:29:32 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:32 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 02/45] block: introduce bdrv_open_file_child() helper
Date: Thu, 31 Mar 2022 00:28:19 +0300
Message-Id: <20220330212902.590099-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::230
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x230.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:14 -0400
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
Cc: kwolf@redhat.com, Fam Zheng <fam@euphon.net>, v.sementsov-og@mail.ru,
 Stefan Hajnoczi <stefanha@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, "Denis V. Lunev" <den@openvz.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 John Snow <jsnow@redhat.com>, Ari Sundholm <ari@tuxera.com>
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                            | 21 +++++++++++++++++++++
 block/blkdebug.c                   |  9 +++------
 block/blklogwrites.c               |  7 ++-----
 block/blkreplay.c                  |  7 ++-----
 block/blkverify.c                  |  9 +++------
 block/bochs.c                      |  7 +++----
 block/cloop.c                      |  7 +++----
 block/copy-before-write.c          |  9 ++++-----
 block/copy-on-read.c               |  9 ++++-----
 block/crypto.c                     | 11 ++++++-----
 block/dmg.c                        |  7 +++----
 block/filter-compress.c            |  6 ++----
 block/parallels.c                  |  7 +++----
 block/preallocate.c                |  9 ++++-----
 block/qcow.c                       |  6 ++----
 block/qcow2.c                      |  8 ++++----
 block/qed.c                        |  8 ++++----
 block/replication.c                |  8 +++-----
 block/throttle.c                   |  8 +++-----
 block/vdi.c                        |  7 +++----
 block/vhdx.c                       |  7 +++----
 block/vmdk.c                       |  7 +++----
 block/vpc.c                        |  7 +++----
 include/block/block-global-state.h |  3 +++
 24 files changed, 94 insertions(+), 100 deletions(-)

diff --git a/block.c b/block.c
index 718e4cae8b..8110b1b330 100644
--- a/block.c
+++ b/block.c
@@ -3666,6 +3666,27 @@ BdrvChild *bdrv_open_child(const char *filename,
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
index e4a37af3b2..e4d40a63aa 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -122,12 +122,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
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
index a8a06fdc09..4fad564691 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -376,12 +376,11 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
     int64_t cluster_size;
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
index 1ba82984ef..e165447a5b 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -261,15 +261,14 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
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
@@ -277,6 +276,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     opts = qemu_opts_create(opts_spec, NULL, 0, &error_abort);
     if (!qemu_opts_absorb_qdict(opts, options, errp)) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
@@ -285,6 +285,7 @@ static int block_crypto_open_generic(QCryptoBlockFormat format,
 
     open_opts = block_crypto_open_opts_init(cryptoopts, errp);
     if (!open_opts) {
+        ret = -EINVAL;
         goto cleanup;
     }
 
diff --git a/block/dmg.c b/block/dmg.c
index c626587f9c..f91c5d3980 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -440,10 +440,9 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
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
index cd23e02d06..c55f1af5da 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -736,10 +736,9 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
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
index e15cb8c74a..d50ee7f49b 100644
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
index 4fba1b9e36..b4033c0db9 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -121,10 +121,8 @@ static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
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
index b5c47931ef..6de8dbef32 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1891,11 +1891,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
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
index f34d9a3ac1..1ff024f16d 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -559,11 +559,11 @@ static int bdrv_qed_open(BlockDriverState *bs, QDict *options, int flags,
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
index cca3a3a356..a539081138 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -377,10 +377,9 @@ static int vdi_open(BlockDriverState *bs, QDict *options, int flags,
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
index 410c6f9610..994f8b91cc 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -997,10 +997,9 @@ static int vhdx_open(BlockDriverState *bs, QDict *options, int flags,
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
index 37c0946066..9fd417b4a3 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1263,10 +1263,9 @@ static int vmdk_open(BlockDriverState *bs, QDict *options, int flags,
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
index 4d8f16e199..cd82eb7f92 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -233,10 +233,9 @@ static int vpc_open(BlockDriverState *bs, QDict *options, int flags,
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
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 25bb69bbef..600afcf5bd 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -76,6 +76,9 @@ BdrvChild *bdrv_open_child(const char *filename,
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


