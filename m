Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 342B23D173F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:49:08 +0200 (CEST)
Received: from localhost ([::1]:35758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6IDL-0001Au-8T
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6IBw-0007pS-Mj
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:47:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m6IBu-0005Vz-0W
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:47:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896856;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ShHzm8W9B0322gtrUqASV/e1SWapqxmeqYr4Ku/w3Ag=;
 b=cBEDsy7yxaPjhbPf3OEVhFtKsY1k2cuhqRIQ6zeXcid8kKkOdlvRYPXfWjC6+zjaVEIyA0
 MjBiHGq/UMKxoxohjh8q9wyry+/bp3tEflP/53McMc8/kuANyGphcG01Vk5LoReJW/sNWf
 I4uFjKQC4NM8eM7lKCZV8UaJh993shw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-KOpm-mqCNVKydgGw60PwOA-1; Wed, 21 Jul 2021 15:47:34 -0400
X-MC-Unique: KOpm-mqCNVKydgGw60PwOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5AE910074A0;
 Wed, 21 Jul 2021 19:47:33 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-216.phx2.redhat.com [10.3.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E237369CB6;
 Wed, 21 Jul 2021 19:47:32 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] iotests: Improve and rename test 291 to qemu-img-bitmap
Date: Wed, 21 Jul 2021 14:47:27 -0500
Message-Id: <20210721194729.648763-2-eblake@redhat.com>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.459, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Dirty Bitmaps" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
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
Message-Id: <20210709153951.2801666-2-eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Nir Soffer <nsoffer@redhat.com>
---
 block/dirty-bitmap.c                          |  2 +-
 .../{291 => tests/qemu-img-bitmaps}           | 21 +++++++-
 .../{291.out => tests/qemu-img-bitmaps.out}   | 49 ++++++++++++++++++-
 3 files changed, 69 insertions(+), 3 deletions(-)
 rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (87%)
 rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (76%)

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
similarity index 87%
rename from tests/qemu-iotests/291
rename to tests/qemu-iotests/tests/qemu-img-bitmaps
index 20efb080a6c0..409c4497a303 100755
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
@@ -129,6 +131,23 @@ $QEMU_IMG map --output=json --image-opts \

 nbd_server_stop

+echo
+echo "=== Check handling of inconsistent bitmap ==="
+echo
+
+# Prepare image with corrupted bitmap
+$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
+$QEMU_IMG bitmap --add "$TEST_IMG" b4
+$QEMU_IMG bitmap --remove "$TEST_IMG" b1
+_img_info --format-specific | _filter_irrelevant_img_info
+echo
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
similarity index 76%
rename from tests/qemu-iotests/291.out
rename to tests/qemu-iotests/tests/qemu-img-bitmaps.out
index 018d6b103f87..6824d4112893 100644
--- a/tests/qemu-iotests/291.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -1,4 +1,4 @@
-QA output created by 291
+QA output created by qemu-img-bitmaps

 === Initial image setup ===

@@ -115,4 +115,51 @@ Format specific information:
 [{ "start": 0, "length": 2097152, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 2097152, "length": 1048576, "depth": 0, "present": false, "zero": false, "data": false},
 { "start": 3145728, "length": 7340032, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
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
+
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


