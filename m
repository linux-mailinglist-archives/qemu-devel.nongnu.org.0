Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 918773BF399
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:33:51 +0200 (CEST)
Received: from localhost ([::1]:46864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1IvG-0000ZE-LQ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Irl-00043b-RT
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1Irh-0003Oq-VX
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625707809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Blc8yY4MCDlaMO9gaGIfDWsxGHRFJms1seyrH9Lkft0=;
 b=fedOdAw8oKx6xemZ8FsavBmp0V/IM7TMFegLTg46t1bl3HBINIHDsqYcTTWKVApb+ElGld
 7IK0CW7IySS106h98Hpp9W5TY8EFa2/JNJQZ+I/YRW7EkEDOnmY2fpwfrG741wbINQDJJd
 WGzDx4Nh8wQ6VZHnQ479yPLzB0xqgS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-TExsKXpcMom3vY1e9eRjsg-1; Wed, 07 Jul 2021 21:30:08 -0400
X-MC-Unique: TExsKXpcMom3vY1e9eRjsg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C376192D786;
 Thu,  8 Jul 2021 01:30:07 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B877F60854;
 Thu,  8 Jul 2021 01:30:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] iotests: Improve and rename test 291 to qemu-img-bitmap
Date: Wed,  7 Jul 2021 20:30:00 -0500
Message-Id: <20210708013001.2576991-2-eblake@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>, nsoffer@redhat.com,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enhance the test to demonstrate behavior of qemu-img with a qcow2
image containing an inconsistent bitmap, and rename it now that we
support useful iotest names.

While at it, fix a missing newline in the error message thus exposed.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/dirty-bitmap.c                          |  2 +-
 .../{291 => tests/qemu-img-bitmaps}           | 13 +++++++-
 .../{291.out => tests/qemu-img-bitmaps.out}   | 32 ++++++++++++++++++-
 3 files changed, 44 insertions(+), 3 deletions(-)
 rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (92%)
 rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (82%)

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
similarity index 92%
rename from tests/qemu-iotests/291
rename to tests/qemu-iotests/tests/qemu-img-bitmaps
index 20efb080a6c0..76cd9e31e850 100755
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
@@ -32,6 +32,7 @@ _cleanup()
 trap "_cleanup; exit \$status" 0 1 2 3 15

 # get standard environment, filters and checks
+cd ..
 . ./common.rc
 . ./common.filter
 . ./common.nbd
@@ -129,6 +130,16 @@ $QEMU_IMG map --output=json --image-opts \

 nbd_server_stop

+echo
+echo "=== Check handling of inconsistent bitmap ==="
+echo
+
+$QEMU_IO -c abort "$TEST_IMG" 2>/dev/null
+$QEMU_IMG bitmap --add "$TEST_IMG" b4
+$QEMU_IMG bitmap --remove "$TEST_IMG" b1
+_img_info --format-specific | _filter_irrelevant_img_info
+$QEMU_IMG convert --bitmaps -O qcow2 "$TEST_IMG" "$TEST_IMG.copy"
+
 # success, all done
 echo '*** done'
 rm -f $seq.full
diff --git a/tests/qemu-iotests/291.out b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
similarity index 82%
rename from tests/qemu-iotests/291.out
rename to tests/qemu-iotests/tests/qemu-img-bitmaps.out
index 018d6b103f87..17b34eaed30f 100644
--- a/tests/qemu-iotests/291.out
+++ b/tests/qemu-iotests/tests/qemu-img-bitmaps.out
@@ -1,4 +1,4 @@
-QA output created by 291
+QA output created by qemu-img-bitmaps

 === Initial image setup ===

@@ -115,4 +115,34 @@ Format specific information:
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
+qemu-img: Failed to populate bitmap b0: Bitmap 'b0' is inconsistent and cannot be used
+Try block-dirty-bitmap-remove to delete this bitmap from disk
 *** done
-- 
2.31.1


