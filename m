Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E875E3C2707
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:43:54 +0200 (CEST)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sfS-0003KX-0A
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1sbk-0004gq-NN
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1sbi-0003Ue-PZ
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:40:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625845202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ojpd1yMPDIf8ndr1/GPuflMNSNRi/MU55g+DFS92YyI=;
 b=RZDpHllUUlLU6+P5FYKCRAQ7LNz39jj+V55bY+MoIqa8+uGSjAzh/FQr4zJKSeL4RpVma2
 fJS4KShVQ57tuC6SqkZIf8c7krUefQM348KtF82bJBuP0REx6IGdJS5NDZZIjZ+IkSCUm4
 zbVxMX2aMYCQgaBo7kNu0WstQS5/DZE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-jrEDASHmPfOJH_kk_gWwBA-1; Fri, 09 Jul 2021 11:40:01 -0400
X-MC-Unique: jrEDASHmPfOJH_kk_gWwBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F050A800D62;
 Fri,  9 Jul 2021 15:39:59 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AAA560C04;
 Fri,  9 Jul 2021 15:39:59 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] iotests: Improve and rename test 291 to qemu-img-bitmap
Date: Fri,  9 Jul 2021 10:39:49 -0500
Message-Id: <20210709153951.2801666-2-eblake@redhat.com>
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, nsoffer@redhat.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enhance the test to demonstrate existing less-than-stellar behavior of
qemu-img with a qcow2 image containing an inconsistent bitmap: we
don't diagnose the problem until after copying the entire image (a
potentially long time), and when we do diagnose the failure, we still
end up leaving an empty bitmap in the destination.  This mess will be
cleaned up in the next patch.

While at it, rename the test now that we support useful iotest names,
and fix a missing newline in the error message thus exposed.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/dirty-bitmap.c                          |  2 +-
 .../{291 => tests/qemu-img-bitmaps}           | 19 +++++++-
 .../{291.out => tests/qemu-img-bitmaps.out}   | 48 ++++++++++++++++++-
 3 files changed, 66 insertions(+), 3 deletions(-)
 rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (88%)
 rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (75%)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 68d295d6e3ed..0ef46163e3ea 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -193,7 +193,7 @@ int bdrv_dirty_bitmap_check(const BdrvDirtyBitmap *bitmap, uint32_t flags,
         error_setg(errp, "Bitmap '%s' is inconsistent and cannot be used",
                    bitmap->name);
         error_append_hint(errp, "Try block-dirty-bitmap-remove to delete"
-                          " this bitmap from disk");
+                          " this bitmap from disk\n");
         return -1;
     }

diff --git a/tests/qemu-iotests/291 b/tests/qemu-iotests/tests/qemu-img-bitmaps
similarity index 88%
rename from tests/qemu-iotests/291
rename to tests/qemu-iotests/tests/qemu-img-bitmaps
index 20efb080a6c0..2f51651d0ce5 100755
--- a/tests/qemu-iotests/291
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps
@@ -3,7 +3,7 @@
 #
 # Test qemu-img bitmap handling
 #
-# Copyright (C) 2018-2020 Red Hat, Inc.
+# Copyright (C) 2018-2021 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -27,11 +27,13 @@ status=1 # failure is the default!
 _cleanup()
 {
     _cleanup_test_img
+    _rm_test_img "$TEST_IMG.copy"
     nbd_server_stop
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15

 # get standard environment, filters and checks
+cd ..
 . ./common.rc
 . ./common.filter
 . ./common.nbd
@@ -129,6 +131,21 @@ $QEMU_IMG map --output=json --image-opts \

 nbd_server_stop

+echo
+echo "=== Check handling of inconsistent bitmap ==="
+echo
+
+$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
+$QEMU_IMG bitmap --add "$TEST_IMG" b4
+$QEMU_IMG bitmap --remove "$TEST_IMG" b1
+_img_info --format-specific | _filter_irrelevant_img_info
+$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy" &&
+    echo "unexpected success"
+# Bug - even though we failed at conversion, we left a file around with
+# a bitmap marked as not corrupt
+TEST_IMG=$TEST_IMG.copy _img_info --format-specific \
+    | _filter_irrelevant_img_info
+
 # success, all done
 echo '*** done'
 rm -f $seq.full
diff --git a/tests/qemu-iotests/291.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
similarity index 75%
rename from tests/qemu-iotests/291.out
rename to tests/qemu-iotests/tests/qemu-img-bitmaps.out
index 23411c0ff4d9..b762362075d1 100644
--- a/tests/qemu-iotests/291.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -1,4 +1,4 @@
-QA output created by 291
+QA output created by qemu-img-bitmaps

 === Initial image setup ===

@@ -115,4 +115,50 @@ Format specific information:
 [{ "start": 0, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 2097152, "length": 1048576, "depth": 0, "zero": false, "data": false},
 { "start": 3145728, "length": 7340032, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
+
+=== Check handling of inconsistent bitmap ===
+
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 10 MiB (10485760 bytes)
+cluster_size: 65536
+backing file: TEST_DIR/t.IMGFMT.base
+backing file format: IMGFMT
+Format specific information:
+    bitmaps:
+        [0]:
+            flags:
+                [0]: in-use
+                [1]: auto
+            name: b2
+            granularity: 65536
+        [1]:
+            flags:
+                [0]: in-use
+            name: b0
+            granularity: 65536
+        [2]:
+            flags:
+                [0]: auto
+            name: b4
+            granularity: 65536
+    corrupt: false
+qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
+Try block-dirty-bitmap-remove to delete this bitmap from disk
+image: TEST_DIR/t.IMGFMT.copy
+file format: IMGFMT
+virtual size: 10 MiB (10485760 bytes)
+cluster_size: 65536
+Format specific information:
+    bitmaps:
+        [0]:
+            flags:
+            name: b0
+            granularity: 65536
+        [1]:
+            flags:
+                [0]: auto
+            name: b4
+            granularity: 65536
+    corrupt: false
 *** done
-- 
2.31.1


