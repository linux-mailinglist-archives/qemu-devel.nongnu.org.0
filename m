Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA831D1138
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:24:19 +0200 (CEST)
Received: from localhost ([::1]:54922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpUo-0006HL-N8
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:24:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpEJ-0002zB-DJ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:07:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30395
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpEH-0003oh-JQ
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589368031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yTLo/ajnHAOalVlz5PiujSz4TPhdQ6mGuMZMALg8XBs=;
 b=aFvi88/StmgyJW52P7svnEW0o45SilGjHcgyHstZgmBBnQ6Aj5vzpKrA3f+mWj4Pm5XCjE
 InxGhaWdcdbfkF+9Sb5i02vEMuLzSGXGCRoyJbVyUjxflQph6olXkuXITLL/3kHnNLClot
 eAmqijDKBAoHq9GeRUvTzur8W4Jwduc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-sQa6wRzoO5mkgY_Qwgfw1w-1; Wed, 13 May 2020 07:07:04 -0400
X-MC-Unique: sQa6wRzoO5mkgY_Qwgfw1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C01E383DC10;
 Wed, 13 May 2020 11:07:03 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E380C1002382;
 Wed, 13 May 2020 11:07:02 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 29/34] block: Use bdrv_default_perms()
Date: Wed, 13 May 2020 13:05:39 +0200
Message-Id: <20200513110544.176672-30-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 01:56:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_default_perms() can decide which permission profile to use based on
the BdrvChildRole, so block drivers do not need to select it explicitly.

The blkverify driver now no longer shares the WRITE permission for the
image to verify.  We thus have to adjust two places in
test-block-iothread not to take it.  (Note that in theory, blkverify
should behave like quorum in this regard and share neither WRITE nor
RESIZE for both of its children.  In practice, it does not really
matter, because blkverify is used only for debugging, so we might as
well keep its permissions rather liberal.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 block/backup-top.c          |  4 ++--
 block/blkdebug.c            |  4 ++--
 block/blklogwrites.c        |  9 ++-------
 block/blkreplay.c           |  2 +-
 block/blkverify.c           |  2 +-
 block/bochs.c               |  2 +-
 block/cloop.c               |  2 +-
 block/crypto.c              |  2 +-
 block/dmg.c                 |  2 +-
 block/filter-compress.c     |  2 +-
 block/parallels.c           |  2 +-
 block/qcow.c                |  2 +-
 block/qcow2.c               |  2 +-
 block/qed.c                 |  2 +-
 block/raw-format.c          |  2 +-
 block/throttle.c            |  2 +-
 block/vdi.c                 |  2 +-
 block/vhdx.c                |  2 +-
 block/vmdk.c                |  2 +-
 block/vpc.c                 |  2 +-
 tests/test-bdrv-drain.c     | 10 +++++-----
 tests/test-bdrv-graph-mod.c |  2 +-
 tests/test-block-iothread.c | 17 ++++++++++++++---
 23 files changed, 43 insertions(+), 37 deletions(-)

diff --git a/block/backup-top.c b/block/backup-top.c
index 8af2c5fe9b..f0efec18b5 100644
--- a/block/backup-top.c
+++ b/block/backup-top.c
@@ -156,8 +156,8 @@ static void backup_top_child_perm(BlockDriverState *bs, BdrvChild *c,
         *nperm = BLK_PERM_WRITE;
     } else {
         /* Source child */
-        bdrv_filter_default_perms(bs, c, child_class, role, reopen_queue,
-                                  perm, shared, nperm, nshared);
+        bdrv_default_perms(bs, c, child_class, role, reopen_queue,
+                           perm, shared, nperm, nshared);
 
         if (perm & BLK_PERM_WRITE) {
             *nperm = *nperm | BLK_PERM_CONSISTENT_READ;
diff --git a/block/blkdebug.c b/block/blkdebug.c
index b31fa40b0e..a925d8295e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -1003,8 +1003,8 @@ static void blkdebug_child_perm(BlockDriverState *bs, BdrvChild *c,
 {
     BDRVBlkdebugState *s = bs->opaque;
 
-    bdrv_filter_default_perms(bs, c, child_class, role, reopen_queue,
-                              perm, shared, nperm, nshared);
+    bdrv_default_perms(bs, c, child_class, role, reopen_queue,
+                       perm, shared, nperm, nshared);
 
     *nperm |= s->take_child_perms;
     *nshared &= ~s->unshare_child_perms;
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 3a57b273fc..8684fb1c74 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -295,13 +295,8 @@ static void blk_log_writes_child_perm(BlockDriverState *bs, BdrvChild *c,
         return;
     }
 
-    if (!strcmp(c->name, "log")) {
-        bdrv_format_default_perms(bs, c, child_class, role, ro_q, perm, shrd,
-                                  nperm, nshrd);
-    } else {
-        bdrv_filter_default_perms(bs, c, child_class, role, ro_q, perm, shrd,
-                                  nperm, nshrd);
-    }
+    bdrv_default_perms(bs, c, child_class, role, ro_q, perm, shrd,
+                       nperm, nshrd);
 }
 
 static void blk_log_writes_refresh_limits(BlockDriverState *bs, Error **errp)
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 20d6139baa..30a0f5d57a 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -139,7 +139,7 @@ static BlockDriver bdrv_blkreplay = {
     .is_filter              = true,
 
     .bdrv_open              = blkreplay_open,
-    .bdrv_child_perm        = bdrv_filter_default_perms,
+    .bdrv_child_perm        = bdrv_default_perms,
     .bdrv_getlength         = blkreplay_getlength,
 
     .bdrv_co_preadv         = blkreplay_co_preadv,
diff --git a/block/blkverify.c b/block/blkverify.c
index 5c3b29244a..2f261de24b 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -319,7 +319,7 @@ static BlockDriver bdrv_blkverify = {
     .bdrv_parse_filename              = blkverify_parse_filename,
     .bdrv_file_open                   = blkverify_open,
     .bdrv_close                       = blkverify_close,
-    .bdrv_child_perm                  = bdrv_filter_default_perms,
+    .bdrv_child_perm                  = bdrv_default_perms,
     .bdrv_getlength                   = blkverify_getlength,
     .bdrv_refresh_filename            = blkverify_refresh_filename,
     .bdrv_dirname                     = blkverify_dirname,
diff --git a/block/bochs.c b/block/bochs.c
index 62c3f42548..2f010ab40a 100644
--- a/block/bochs.c
+++ b/block/bochs.c
@@ -297,7 +297,7 @@ static BlockDriver bdrv_bochs = {
     .instance_size	= sizeof(BDRVBochsState),
     .bdrv_probe		= bochs_probe,
     .bdrv_open		= bochs_open,
-    .bdrv_child_perm     = bdrv_format_default_perms,
+    .bdrv_child_perm     = bdrv_default_perms,
     .bdrv_refresh_limits = bochs_refresh_limits,
     .bdrv_co_preadv = bochs_co_preadv,
     .bdrv_close		= bochs_close,
diff --git a/block/cloop.c b/block/cloop.c
index d374a8427d..c99192a57f 100644
--- a/block/cloop.c
+++ b/block/cloop.c
@@ -293,7 +293,7 @@ static BlockDriver bdrv_cloop = {
     .instance_size  = sizeof(BDRVCloopState),
     .bdrv_probe     = cloop_probe,
     .bdrv_open      = cloop_open,
-    .bdrv_child_perm     = bdrv_format_default_perms,
+    .bdrv_child_perm     = bdrv_default_perms,
     .bdrv_refresh_limits = cloop_refresh_limits,
     .bdrv_co_preadv = cloop_co_preadv,
     .bdrv_close     = cloop_close,
diff --git a/block/crypto.c b/block/crypto.c
index 457f3a06a5..b216e12c31 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -756,7 +756,7 @@ static BlockDriver bdrv_crypto_luks = {
     .bdrv_close         = block_crypto_close,
     /* This driver doesn't modify LUKS metadata except when creating image.
      * Allow share-rw=on as a special case. */
-    .bdrv_child_perm    = bdrv_filter_default_perms,
+    .bdrv_child_perm    = bdrv_default_perms,
     .bdrv_co_create     = block_crypto_co_create_luks,
     .bdrv_co_create_opts = block_crypto_co_create_opts_luks,
     .bdrv_co_truncate   = block_crypto_co_truncate,
diff --git a/block/dmg.c b/block/dmg.c
index bc64194577..0d6c317296 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -750,7 +750,7 @@ static BlockDriver bdrv_dmg = {
     .bdrv_probe     = dmg_probe,
     .bdrv_open      = dmg_open,
     .bdrv_refresh_limits = dmg_refresh_limits,
-    .bdrv_child_perm     = bdrv_format_default_perms,
+    .bdrv_child_perm     = bdrv_default_perms,
     .bdrv_co_preadv = dmg_co_preadv,
     .bdrv_close     = dmg_close,
     .is_format      = true,
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 9edd937645..8ec1991c1f 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -133,7 +133,7 @@ static BlockDriver bdrv_compress = {
     .format_name                        = "compress",
 
     .bdrv_open                          = compress_open,
-    .bdrv_child_perm                    = bdrv_filter_default_perms,
+    .bdrv_child_perm                    = bdrv_default_perms,
 
     .bdrv_getlength                     = compress_getlength,
 
diff --git a/block/parallels.c b/block/parallels.c
index 168d6c531a..63a1cde8af 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -912,7 +912,7 @@ static BlockDriver bdrv_parallels = {
     .bdrv_probe		= parallels_probe,
     .bdrv_open		= parallels_open,
     .bdrv_close		= parallels_close,
-    .bdrv_child_perm          = bdrv_format_default_perms,
+    .bdrv_child_perm          = bdrv_default_perms,
     .bdrv_co_block_status     = parallels_co_block_status,
     .bdrv_has_zero_init       = bdrv_has_zero_init_1,
     .bdrv_co_flush_to_os      = parallels_co_flush_to_os,
diff --git a/block/qcow.c b/block/qcow.c
index 5347037720..ee5d35fe20 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -1180,7 +1180,7 @@ static BlockDriver bdrv_qcow = {
     .bdrv_probe		= qcow_probe,
     .bdrv_open		= qcow_open,
     .bdrv_close		= qcow_close,
-    .bdrv_child_perm        = bdrv_format_default_perms,
+    .bdrv_child_perm        = bdrv_default_perms,
     .bdrv_reopen_prepare    = qcow_reopen_prepare,
     .bdrv_co_create         = qcow_co_create,
     .bdrv_co_create_opts    = qcow_co_create_opts,
diff --git a/block/qcow2.c b/block/qcow2.c
index 8d7230dca8..fe0ce39799 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5744,7 +5744,7 @@ BlockDriver bdrv_qcow2 = {
     .bdrv_reopen_commit_post = qcow2_reopen_commit_post,
     .bdrv_reopen_abort    = qcow2_reopen_abort,
     .bdrv_join_options    = qcow2_join_options,
-    .bdrv_child_perm      = bdrv_format_default_perms,
+    .bdrv_child_perm      = bdrv_default_perms,
     .bdrv_co_create_opts  = qcow2_co_create_opts,
     .bdrv_co_create       = qcow2_co_create,
     .bdrv_has_zero_init   = qcow2_has_zero_init,
diff --git a/block/qed.c b/block/qed.c
index ef6463b48d..c0c65015c7 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -1672,7 +1672,7 @@ static BlockDriver bdrv_qed = {
     .bdrv_open                = bdrv_qed_open,
     .bdrv_close               = bdrv_qed_close,
     .bdrv_reopen_prepare      = bdrv_qed_reopen_prepare,
-    .bdrv_child_perm          = bdrv_format_default_perms,
+    .bdrv_child_perm          = bdrv_default_perms,
     .bdrv_co_create           = bdrv_qed_co_create,
     .bdrv_co_create_opts      = bdrv_qed_co_create_opts,
     .bdrv_has_zero_init       = bdrv_has_zero_init_1,
diff --git a/block/raw-format.c b/block/raw-format.c
index bfb4d7ddb7..018441bddf 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -586,7 +586,7 @@ BlockDriver bdrv_raw = {
     .bdrv_reopen_commit   = &raw_reopen_commit,
     .bdrv_reopen_abort    = &raw_reopen_abort,
     .bdrv_open            = &raw_open,
-    .bdrv_child_perm      = bdrv_filter_default_perms,
+    .bdrv_child_perm      = bdrv_default_perms,
     .bdrv_co_create_opts  = &raw_co_create_opts,
     .bdrv_co_preadv       = &raw_co_preadv,
     .bdrv_co_pwritev      = &raw_co_pwritev,
diff --git a/block/throttle.c b/block/throttle.c
index 47b0a3522d..0ebbad0743 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -237,7 +237,7 @@ static BlockDriver bdrv_throttle = {
     .bdrv_close                         =   throttle_close,
     .bdrv_co_flush                      =   throttle_co_flush,
 
-    .bdrv_child_perm                    =   bdrv_filter_default_perms,
+    .bdrv_child_perm                    =   bdrv_default_perms,
 
     .bdrv_getlength                     =   throttle_getlength,
 
diff --git a/block/vdi.c b/block/vdi.c
index d20698b3cc..2f506a01ba 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -1039,7 +1039,7 @@ static BlockDriver bdrv_vdi = {
     .bdrv_open = vdi_open,
     .bdrv_close = vdi_close,
     .bdrv_reopen_prepare = vdi_reopen_prepare,
-    .bdrv_child_perm          = bdrv_format_default_perms,
+    .bdrv_child_perm          = bdrv_default_perms,
     .bdrv_co_create      = vdi_co_create,
     .bdrv_co_create_opts = vdi_co_create_opts,
     .bdrv_has_zero_init  = vdi_has_zero_init,
diff --git a/block/vhdx.c b/block/vhdx.c
index 62c6bd69ff..fa9e544a5e 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -2245,7 +2245,7 @@ static BlockDriver bdrv_vhdx = {
     .bdrv_open              = vhdx_open,
     .bdrv_close             = vhdx_close,
     .bdrv_reopen_prepare    = vhdx_reopen_prepare,
-    .bdrv_child_perm        = bdrv_format_default_perms,
+    .bdrv_child_perm        = bdrv_default_perms,
     .bdrv_co_readv          = vhdx_co_readv,
     .bdrv_co_writev         = vhdx_co_writev,
     .bdrv_co_create         = vhdx_co_create,
diff --git a/block/vmdk.c b/block/vmdk.c
index fadc98a262..62da465126 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -3067,7 +3067,7 @@ static BlockDriver bdrv_vmdk = {
     .bdrv_open                    = vmdk_open,
     .bdrv_co_check                = vmdk_co_check,
     .bdrv_reopen_prepare          = vmdk_reopen_prepare,
-    .bdrv_child_perm              = bdrv_format_default_perms,
+    .bdrv_child_perm              = bdrv_default_perms,
     .bdrv_co_preadv               = vmdk_co_preadv,
     .bdrv_co_pwritev              = vmdk_co_pwritev,
     .bdrv_co_pwritev_compressed   = vmdk_co_pwritev_compressed,
diff --git a/block/vpc.c b/block/vpc.c
index 651a6737b6..c055591641 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -1240,7 +1240,7 @@ static BlockDriver bdrv_vpc = {
     .bdrv_open              = vpc_open,
     .bdrv_close             = vpc_close,
     .bdrv_reopen_prepare    = vpc_reopen_prepare,
-    .bdrv_child_perm        = bdrv_format_default_perms,
+    .bdrv_child_perm        = bdrv_default_perms,
     .bdrv_co_create         = vpc_co_create,
     .bdrv_co_create_opts    = vpc_co_create_opts,
 
diff --git a/tests/test-bdrv-drain.c b/tests/test-bdrv-drain.c
index 91567ca97d..0da5a3a6a1 100644
--- a/tests/test-bdrv-drain.c
+++ b/tests/test-bdrv-drain.c
@@ -93,15 +93,15 @@ static void bdrv_test_child_perm(BlockDriverState *bs, BdrvChild *c,
                                  uint64_t *nperm, uint64_t *nshared)
 {
     /*
-     * bdrv_format_default_perms() accepts only these two, so disguise
+     * bdrv_default_perms() accepts only these two, so disguise
      * detach_by_driver_cb_parent as one of them.
      */
     if (child_class != &child_file && child_class != &child_of_bds) {
         child_class = &child_of_bds;
     }
 
-    bdrv_format_default_perms(bs, c, child_class, role, reopen_queue,
-                              perm, shared, nperm, nshared);
+    bdrv_default_perms(bs, c, child_class, role, reopen_queue,
+                       perm, shared, nperm, nshared);
 }
 
 static int bdrv_test_change_backing_file(BlockDriverState *bs,
@@ -1137,7 +1137,7 @@ static BlockDriver bdrv_test_top_driver = {
     .bdrv_close             = bdrv_test_top_close,
     .bdrv_co_preadv         = bdrv_test_top_co_preadv,
 
-    .bdrv_child_perm        = bdrv_format_default_perms,
+    .bdrv_child_perm        = bdrv_default_perms,
 };
 
 typedef struct TestCoDeleteByDrainData {
@@ -1966,7 +1966,7 @@ static BlockDriver bdrv_replace_test = {
     .bdrv_co_drain_begin    = bdrv_replace_test_co_drain_begin,
     .bdrv_co_drain_end      = bdrv_replace_test_co_drain_end,
 
-    .bdrv_child_perm        = bdrv_format_default_perms,
+    .bdrv_child_perm        = bdrv_default_perms,
 };
 
 static void coroutine_fn test_replace_child_mid_drain_read_co(void *opaque)
diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
index 6ae91ff171..a2d0318b16 100644
--- a/tests/test-bdrv-graph-mod.c
+++ b/tests/test-bdrv-graph-mod.c
@@ -26,7 +26,7 @@
 
 static BlockDriver bdrv_pass_through = {
     .format_name = "pass-through",
-    .bdrv_child_perm = bdrv_filter_default_perms,
+    .bdrv_child_perm = bdrv_default_perms,
 };
 
 static void no_perm_default_perms(BlockDriverState *bs, BdrvChild *c,
diff --git a/tests/test-block-iothread.c b/tests/test-block-iothread.c
index 71e9bce3b1..a953794be2 100644
--- a/tests/test-block-iothread.c
+++ b/tests/test-block-iothread.c
@@ -482,8 +482,13 @@ static void test_propagate_basic(void)
     BlockDriverState *bs_a, *bs_b, *bs_verify;
     QDict *options;
 
-    /* Create bs_a and its BlockBackend */
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    /*
+     * Create bs_a and its BlockBackend.  We cannot take the RESIZE
+     * permission because blkverify will not share it on the test
+     * image.
+     */
+    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL & ~BLK_PERM_RESIZE,
+                  BLK_PERM_ALL);
     bs_a = bdrv_new_open_driver(&bdrv_test, "bs_a", BDRV_O_RDWR, &error_abort);
     blk_insert_bs(blk, bs_a, &error_abort);
 
@@ -566,7 +571,13 @@ static void test_propagate_diamond(void)
     qdict_put_str(options, "raw", "bs_c");
 
     bs_verify = bdrv_open(NULL, NULL, options, BDRV_O_RDWR, &error_abort);
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    /*
+     * Do not take the RESIZE permission: This would require the same
+     * from bs_c and thus from bs_a; however, blkverify will not share
+     * it on bs_b, and thus it will not be available for bs_a.
+     */
+    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL & ~BLK_PERM_RESIZE,
+                  BLK_PERM_ALL);
     blk_insert_bs(blk, bs_verify, &error_abort);
 
     /* Switch the AioContext */
-- 
2.26.2


