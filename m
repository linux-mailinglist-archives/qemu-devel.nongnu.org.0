Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C44DF3C2702
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:42:17 +0200 (CEST)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sds-0007Yx-QZ
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1sbm-0004mB-IN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:40:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1sbj-0003Uo-LV
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625845203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SDUfa2A+s93YASpxPNGo4aHm+ZJdw4G6hfNktcpTIPw=;
 b=F0k1c9OermgC+JLTf9xzhYHrBMdRwY1tZdywCXojZvSEGlM39GxT2Yp8qTuSr46kFp1K8g
 AuoMTGSeZg9V14tEFYOWl/UY9r04LmJFCVkrkVahxHdttHXV+PXkO2VnbEKMHgcRKUwPZj
 X1EB9hw2sLLOqpMMcikWRtPZ6YD4VeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-4fyh9jdVMuml359oV7IX4A-1; Fri, 09 Jul 2021 11:40:01 -0400
X-MC-Unique: 4fyh9jdVMuml359oV7IX4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABAFD1084F54;
 Fri,  9 Jul 2021 15:40:00 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EABE60C04;
 Fri,  9 Jul 2021 15:40:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] qemu-img: Fail fast on convert --bitmaps with
 inconsistent bitmap
Date: Fri,  9 Jul 2021 10:39:50 -0500
Message-Id: <20210709153951.2801666-3-eblake@redhat.com>
In-Reply-To: <20210709153951.2801666-1-eblake@redhat.com>
References: <20210709153951.2801666-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Waiting until the end of the convert operation (a potentially
time-consuming task) to finally detect that we can't copy a bitmap is
bad, comparing to failing fast up front.  Furthermore, this prevents
us from leaving a file behind with a bitmap that is not marked as
inconsistent even though it does not have sane contents.

This fixes the problems exposed in the previous patch to the iotest.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-img.c                                    | 30 +++++++++++++++++--
 tests/qemu-iotests/tests/qemu-img-bitmaps     |  2 --
 tests/qemu-iotests/tests/qemu-img-bitmaps.out | 20 ++-----------
 3 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 7956a8996512..e84b3c530155 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2101,6 +2101,30 @@ static int convert_do_copy(ImgConvertState *s)
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
+        const char *name;
+
+        if (!bdrv_dirty_bitmap_get_persistence(bm)) {
+            continue;
+        }
+        name = bdrv_dirty_bitmap_name(bm);
+        if (bdrv_dirty_bitmap_inconsistent(bm)) {
+            error_report("Cannot copy inconsistent bitmap '%s'", name);
+            return -1;
+        }
+    }
+    return 0;
+}
+
 static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
 {
     BdrvDirtyBitmap *bm;
@@ -2127,6 +2151,7 @@ static int convert_copy_bitmaps(BlockDriverState *src, BlockDriverState *dst)
                               &err);
         if (err) {
             error_reportf_err(err, "Failed to populate bitmap %s: ", name);
+            qmp_block_dirty_bitmap_remove(dst->node_name, name, NULL);
             return -1;
         }
     }
@@ -2552,9 +2577,8 @@ static int img_convert(int argc, char **argv)
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
index 2f51651d0ce5..3fde95907515 100755
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
@@ -141,8 +141,6 @@ $QEMU_IMG bitmap --remove "$TEST_IMG" b1
 _img_info --format-specific | _filter_irrelevant_img_info
 $QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
     echo "unexpected success"
-# Bug - even though we failed at conversion, we left a file around with
-# a bitmap marked as not corrupt
 TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
     | _filter_irrelevant_img_info

diff --git a/tests/qemu-iotests/tests/qemu-img-bitmaps.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
index b762362075d1..546aaa404bba 100644
--- a/tests/qemu-iotests/tests/qemu-img-bitmaps.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -143,22 +143,6 @@ Format specific information:
             name: b4
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
+qemu-img: Could not open 'TEST_DIR/t.IMGFMT.copy': Could not open 'TEST_DIR/t.IMGFMT.copy': No such file or directory
 *** done
-- 
2.31.1


