Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 323C63BF398
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:32:16 +0200 (CEST)
Received: from localhost ([::1]:42842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Itj-0006Ah-8w
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:32:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Irm-00044X-AF
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:30:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Irj-0003Oy-Gm
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:30:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625707810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmLiYW0j1UZaqM70z277Q9vnxj6sk+sejx3ErZ7H5FI=;
 b=W7/7mO6nsU6//1e00xGSbYLPVANKJxAoyC8DtVRJT7z25xmcr16qE10zvgb63t/fO5aA9x
 Fd5qvNo0YeQ5OeMWYyScLZbf+k9sFBOOuovgjuv6d0et0ib+POzMcq8tFKzKnRZMp5EjdJ
 UYBSbfepai0VsH39dap7zNN0GgWLNHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-2-pAT3t3MTWWn8xbih_xew-1; Wed, 07 Jul 2021 21:30:08 -0400
X-MC-Unique: 2-pAT3t3MTWWn8xbih_xew-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2C9E5074C;
 Thu,  8 Jul 2021 01:30:07 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73EE060854;
 Thu,  8 Jul 2021 01:30:07 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qemu-img: Add --skip-broken for 'convert --bitmaps'
Date: Wed,  7 Jul 2021 20:30:01 -0500
Message-Id: <20210708013001.2576991-3-eblake@redhat.com>
In-Reply-To: <20210708013001.2576991-1-eblake@redhat.com>
References: <20210708013001.2576991-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The point of 'qemu-img convert --bitmaps' is to be a convenience for
actions that are already possible through a string of smaller
'qemu-img bitmap' sub-commands.  One situation not accounted for
already is that if a source image contains an inconsistent bitmap (for
example, because a qemu process died abruptly before flushing bitmap
state), the user MUST delete those inconsistent bitmaps before
anything else useful can be done with the image.

We don't want to delete inconsistent bitmaps by default: although a
corrupt bitmap is only a loss of optimization rather than a corruption
of user-visible data, it is still nice to require the user to opt in
to the fact that they are aware of the loss of the bitmap.  Still,
requiring the user to check 'qemu-img info' to see whether bitmaps are
consistent, then use 'qemu-img bitmap --remove' to remove offenders,
all before using 'qemu-img convert', is a lot more work than just
adding a knob 'qemu-img convert --bitmaps --skip-broken' which opts in
to skipping the broken bitmaps.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1946084
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/tools/qemu-img.rst                       |  8 +++++++-
 qemu-img.c                                    | 20 +++++++++++++++++--
 tests/qemu-iotests/tests/qemu-img-bitmaps     |  4 ++++
 tests/qemu-iotests/tests/qemu-img-bitmaps.out | 14 +++++++++++++
 4 files changed, 43 insertions(+), 3 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 1d8470eada0e..5cf1c764597b 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -414,7 +414,7 @@ Command description:
   4
     Error on reading data

-.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME
+.. option:: convert [--object OBJECTDEF] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps [--skip-broken]] [-U] [-C] [-c] [-p] [-q] [-n] [-f FMT] [-t CACHE] [-T SRC_CACHE] [-O OUTPUT_FMT] [-B BACKING_FILE] [-o OPTIONS] [-l SNAPSHOT_PARAM] [-S SPARSE_SIZE] [-r RATE_LIMIT] [-m NUM_COROUTINES] [-W] FILENAME [FILENAME2 [...]] OUTPUT_FILENAME

   Convert the disk image *FILENAME* or a snapshot *SNAPSHOT_PARAM*
   to disk image *OUTPUT_FILENAME* using format *OUTPUT_FMT*. It can
@@ -456,6 +456,12 @@ Command description:
   *NUM_COROUTINES* specifies how many coroutines work in parallel during
   the convert process (defaults to 8).

+  Use of ``--bitmaps`` requests that any persistent bitmaps present in
+  the original are also copied to the destination.  If any bitmap is
+  inconsistent in the source, the conversion will fail unless
+  ``--skip-broken`` is also specified to copy only the consistent
+  bitmaps.
+
 .. option:: create [--object OBJECTDEF] [-q] [-f FMT] [-b BACKING_FILE] [-F BACKING_FMT] [-u] [-o OPTIONS] FILENAME [SIZE]

   Create the new disk image *FILENAME* of size *SIZE* and format
diff --git a/qemu-img.c b/qemu-img.c
index 68a4d298098f..e8b012f39c0c 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -82,6 +82,7 @@ enum {
     OPTION_MERGE = 274,
     OPTION_BITMAPS = 275,
     OPTION_FORCE = 276,
+    OPTION_SKIP_BROKEN = 277,
 };

 typedef enum OutputFormat {
@@ -2101,7 +2102,8 @@ static int convert_do_copy(ImgConvertState *s)
     return s->ret;
 }

-static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
+static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst,
+                                bool skip_broken)
 {
     BdrvDirtyBitmap *bm;
     Error *err = NULL;
@@ -2113,6 +2115,10 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
             continue;
         }
         name = bdrv_dirty_bitmap_name(bm);
+        if (skip_broken && bdrv_dirty_bitmap_inconsistent(bm)) {
+            warn_report("Skipping inconsistent bitmap %s", name);
+            continue;
+        }
         qmp_block_dirty_bitmap_add(dst->node_name, name,
                                    true, bdrv_dirty_bitmap_granularity(bm),
                                    true, true,
@@ -2167,6 +2173,7 @@ static int img_convert(int argc, char **argv)
     bool force_share = false;
     bool explict_min_sparse = false;
     bool bitmaps = false;
+    bool skip_broken = false;
     int64_t rate_limit = 0;

     ImgConvertState s = (ImgConvertState) {
@@ -2188,6 +2195,7 @@ static int img_convert(int argc, char **argv)
             {"salvage", no_argument, 0, OPTION_SALVAGE},
             {"target-is-zero", no_argument, 0, OPTION_TARGET_IS_ZERO},
             {"bitmaps", no_argument, 0, OPTION_BITMAPS},
+            {"skip-broken", no_argument, 0, OPTION_SKIP_BROKEN},
             {0, 0, 0, 0}
         };
         c = getopt_long(argc, argv, ":hf:O:B:Cco:l:S:pt:T:qnm:WUr:",
@@ -2316,6 +2324,9 @@ static int img_convert(int argc, char **argv)
         case OPTION_BITMAPS:
             bitmaps = true;
             break;
+        case OPTION_SKIP_BROKEN:
+            skip_broken = true;
+            break;
         }
     }

@@ -2323,6 +2334,11 @@ static int img_convert(int argc, char **argv)
         out_fmt = "raw";
     }

+    if (skip_broken && !bitmaps) {
+        error_report("Use of --skip-broken requires --bitmaps");
+        goto fail_getopt;
+    }
+
     if (s.compressed && s.copy_range) {
         error_report("Cannot enable copy offloading when -c is used");
         goto fail_getopt;
@@ -2678,7 +2694,7 @@ static int img_convert(int argc, char **argv)

     /* Now copy the bitmaps */
     if (bitmaps && ret == 0) {
-        ret = convert_copy_bitmaps(blk_bs(s.src[0]), out_bs);
+        ret = convert_copy_bitmaps(blk_bs(s.src[0]), out_bs, skip_broken);
     }

 out:
diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
index 76cd9e31e850..3e1a39bc81e4 100755
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
@@ -28,6 +28,7 @@ _cleanup()
 {
     _cleanup_test_img
     nbd_server_stop
+    _rm_test_img "$TEST_DIR/t.$IMGFMT.copy"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15

@@ -139,6 +140,9 @@ $QEMU_IMG bitmap --add "$TEST_IMG" b4
 $QEMU_IMG bitmap --remove "$TEST_IMG" b1
 _img_info --format-specific | _filter_irrelevant_img_info
 $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
+$QEMU_IMG convert --bitmaps --skip-broken -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
+TEST_IMG="$TEST_IMG.copy" _img_info --format-specific \
+    | _filter_irrelevant_img_info

 # success, all done
 echo '*** done'
diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
index 17b34eaed30f..685bde6d1d63 100644
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -145,4 +145,18 @@ Format specific information:
     corrupt: false
 qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
 Try block-dirty-bitmap-remove to delete this bitmap from disk
+qemu-img: warning: Skipping inconsistent bitmap b0
+qemu-img: warning: Skipping inconsistent bitmap b2
+image: TEST_DIR/t.IMGFMT.copy
+file format: IMGFMT
+virtual size: 10 MiB (10485760 bytes)
+cluster_size: 65536
+Format specific information:
+    bitmaps:
+        [0]:
+            flags:
+                [0]: auto
+            name: b4
+            granularity: 65536
+    corrupt: false
 *** done
-- 
2.31.1


