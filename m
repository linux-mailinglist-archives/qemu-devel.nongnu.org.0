Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D078E3D1742
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:51:39 +0200 (CEST)
Received: from localhost ([::1]:39908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IFm-0003zg-Rm
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:51:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6IBy-0007sa-3F
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:47:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6IBt-0005W5-Tn
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:47:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xgHU0baUWYZ4QaIYYCK4Rz7QcI7QRxus2fnGSVZziqA=;
 b=hVs8w+qtbsirn+p9yyX4r52rDte23AiFAk4Mp1FaBOd/wfWx12X74ZxgvpQQar1LsmCf7j
 suBglOWOY+n5PcCu4E7ELr+uYr1TKe9o3pv8aQWejWgn+u0wsp/XKqNhOXtTuWqdUNpk6+
 TZc3KMGYBBvOXowUG8OzuYHH0fFFz6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-4vWEpxpWP8KD5PxdRDjCEg-1; Wed, 21 Jul 2021 15:47:35 -0400
X-MC-Unique: 4vWEpxpWP8KD5PxdRDjCEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DF321084F53;
 Wed, 21 Jul 2021 19:47:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB43D5B826;
 Wed, 21 Jul 2021 19:47:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] qemu-img: Fail fast on convert --bitmaps with inconsistent
 bitmap
Date: Wed, 21 Jul 2021 14:47:28 -0500
Message-Id: <20210721194729.648763-3-eblake@redhat.com>
In-Reply-To: <20210721194729.648763-1-eblake@redhat.com>
References: <20210721194729.648763-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Waiting until the end of the convert operation (a potentially
time-consuming task) to finally detect that we can't copy a bitmap is
bad, comparing to failing fast up front.  Furthermore, this prevents
us from leaving a file behind with a bitmap that is not marked as
inconsistent even though it does not have sane contents.

This fixes the problems exposed in the previous patch to the iotest:
it adds a fast failure up front, and even if we don't fail early, it
ensures that any bitmap we add but do not properly populate is removed
again rather than left behind incomplete.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210709153951.2801666-3-eblake@redhat.com>
[eblake: add a hint to the warning message, simplify name computation]
Reviewed-by: Nir Soffer <nsoffer@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qemu-img.c                                    | 29 +++++++++++++++++--
 tests/qemu-iotests/tests/qemu-img-bitmaps     |  3 +-
 tests/qemu-iotests/tests/qemu-img-bitmaps.out | 21 ++------------
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 797742a44331..c5496e82e025 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2101,6 +2101,29 @@ static int convert_do_copy(ImgConvertState *s)
     return s->ret;
 }

+/* Check that bitmaps can be copied, or output an error */
+static int convert_check_bitmaps(BlockDriverState *src)
+{
+    BdrvDirtyBitmap *bm;
+
+    if (!bdrv_supports_persistent_dirty_bitmap(src)) {
+        error_report("Source lacks bitmap support");
+        return -1;
+    }
+    FOR_EACH_DIRTY_BITMAP(src, bm) {
+        if (!bdrv_dirty_bitmap_get_persistence(bm)) {
+            continue;
+        }
+        if (bdrv_dirty_bitmap_inconsistent(bm)) {
+            error_report("Cannot copy inconsistent bitmap '%s'",
+                         bdrv_dirty_bitmap_name(bm));
+            error_printf("Try 'qemu-img bitmap --remove' to delete it\n");
+            return -1;
+        }
+    }
+    return 0;
+}
+
 static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
 {
     BdrvDirtyBitmap *bm;
@@ -2127,6 +2150,7 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
                               &err);
         if (err) {
             error_reportf_err(err, "Failed to populate bitmap %s: ", name);
+            qmp_block_dirty_bitmap_remove(dst->node_name, name, NULL);
             return -1;
         }
     }
@@ -2554,9 +2578,8 @@ static int img_convert(int argc, char **argv)
             ret = -1;
             goto out;
         }
-        if (!bdrv_supports_persistent_dirty_bitmap(blk_bs(s.src[0]))) {
-            error_report("Source lacks bitmap support");
-            ret = -1;
+        ret = convert_check_bitmaps(blk_bs(s.src[0]));
+        if (ret < 0) {
             goto out;
         }
     }
diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps b/tests/qemu-iotests/tests/qemu-img-bitmaps
index 409c4497a303..09c3d395d1eb 100755
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
@@ -140,11 +140,10 @@ $QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
 $QEMU_IMG bitmap --add "$TEST_IMG" b4
 $QEMU_IMG bitmap --remove "$TEST_IMG" b1
 _img_info --format-specific | _filter_irrelevant_img_info
+# Proof that we fail fast if bitmaps can't be copied
 echo
 $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
     echo "unexpected success"
-# Bug - even though we failed at conversion, we left a file around with
-# a bitmap marked as not corrupt
 TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
     | _filter_irrelevant_img_info

diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
index 6824d4112893..d99c279d0c63 100644
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -144,22 +144,7 @@ Format specific information:
             granularity: 65536
     corrupt: false

-qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
-Try block-dirty-bitmap-remove to delete this bitmap from disk
-image: TEST_DIR/t.IMGFMT.copy
-file format: IMGFMT
-virtual size: 10 MiB (10485760 bytes)
-cluster_size: 65536
-Format specific information:
-    bitmaps:
-        [0]:
-            flags:
-            name: b0
-            granularity: 65536
-        [1]:
-            flags:
-                [0]: auto
-            name: b4
-            granularity: 65536
-    corrupt: false
+qemu-img: Cannot copy inconsistent bitmap 'b0'
+Try 'qemu-img bitmap --remove' to delete it
+qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open 'TEST_DIR/t.IMGFMT.copy': No such file or directory
 *** done
-- 
2.31.1


