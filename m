Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875F82D7CF2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:34:23 +0100 (CET)
Received: from localhost ([::1]:40256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmJC-0001q4-5W
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:34:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluZ-0003qX-8H
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluI-00029E-3c
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:08:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NlNAGwbdtmYnWPDfJD2c+tjwRr6hd9k8Fdpcee5PByw=;
 b=CaiRJBzD2R0iNfd9AFVKTr9/Dhum4HlUWQNFFg162+QFfgmWg0zz5zJBfoADcclH3A6lQw
 8K/PJ6q9Ddjk7630xynTBsOEOnd9u1CUt1lA/9qVNUADvo1Zk9Tudr43kVgRibgdyhfRHy
 4ahNPrRyeROHHgJkIZf0wrWDyG7c7r8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-oFWaCkVvO3GcqnnKOCc10Q-1; Fri, 11 Dec 2020 12:08:34 -0500
X-MC-Unique: oFWaCkVvO3GcqnnKOCc10Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A16E180E469;
 Fri, 11 Dec 2020 17:08:33 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 552FB5D731;
 Fri, 11 Dec 2020 17:08:32 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/34] iotests: Do not needlessly filter _make_test_img
Date: Fri, 11 Dec 2020 18:07:49 +0100
Message-Id: <20201211170812.228643-12-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

In most cases, _make_test_img does not need a _filter_imgfmt on top.  It
does that by itself.

(The exception is when IMGFMT has been overwritten but TEST_IMG has not.
In such cases, we do need a _filter_imgfmt on top to filter the test's
original IMGFMT from TEST_IMG.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-8-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/161 | 12 ++++++------
 tests/qemu-iotests/175 |  6 +++---
 tests/qemu-iotests/249 |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/161 b/tests/qemu-iotests/161
index e270976d87..bbf7dbbc5c 100755
--- a/tests/qemu-iotests/161
+++ b/tests/qemu-iotests/161
@@ -48,9 +48,9 @@ _supported_os Linux
 IMG_SIZE=1M
 
 # Create the images
-TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE | _filter_imgfmt
-TEST_IMG="$TEST_IMG.int" _make_test_img -b "$TEST_IMG.base" -F $IMGFMT | _filter_imgfmt
-_make_test_img -b "$TEST_IMG.int" -F $IMGFMT -F $IMGFMT | _filter_imgfmt
+TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE
+TEST_IMG="$TEST_IMG.int" _make_test_img -b "$TEST_IMG.base" -F $IMGFMT
+_make_test_img -b "$TEST_IMG.int" -F $IMGFMT -F $IMGFMT
 
 # First test: reopen $TEST.IMG changing the detect-zeroes option on
 # its backing file ($TEST_IMG.int).
@@ -105,9 +105,9 @@ echo
 echo "*** Commit and then change an option on the backing file"
 echo
 # Create the images again
-TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE | _filter_imgfmt
-TEST_IMG="$TEST_IMG.int" _make_test_img -b "$TEST_IMG.base" -F $IMGFMT| _filter_imgfmt
-_make_test_img -b "$TEST_IMG.int" -F $IMGFMT | _filter_imgfmt
+TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE
+TEST_IMG="$TEST_IMG.int" _make_test_img -b "$TEST_IMG.base" -F $IMGFMT
+_make_test_img -b "$TEST_IMG.int" -F $IMGFMT
 
 _launch_qemu -drive if=none,file="${TEST_IMG}"
 _send_qemu_cmd $QEMU_HANDLE \
diff --git a/tests/qemu-iotests/175 b/tests/qemu-iotests/175
index 00a626aa63..c3c2aed653 100755
--- a/tests/qemu-iotests/175
+++ b/tests/qemu-iotests/175
@@ -89,20 +89,20 @@ min_blocks=$(stat -c '%b' "$TEST_DIR/empty")
 
 echo
 echo "== creating image with default preallocation =="
-_make_test_img -o extent_size_hint=0 $size | _filter_imgfmt
+_make_test_img -o extent_size_hint=0 $size
 stat -c "size=%s, blocks=%b" $TEST_IMG | _filter_blocks $extra_blocks $min_blocks $size
 
 for mode in off full falloc; do
     echo
     echo "== creating image with preallocation $mode =="
-    _make_test_img -o preallocation=$mode,extent_size_hint=0 $size | _filter_imgfmt
+    _make_test_img -o preallocation=$mode,extent_size_hint=0 $size
     stat -c "size=%s, blocks=%b" $TEST_IMG | _filter_blocks $extra_blocks $min_blocks $size
 done
 
 for new_size in 4096 1048576; do
     echo
     echo "== resize empty image with block_resize =="
-    _make_test_img -o extent_size_hint=0 0 | _filter_imgfmt
+    _make_test_img -o extent_size_hint=0 0
     _block_resize $TEST_IMG $new_size >/dev/null
     stat -c "size=%s, blocks=%b" $TEST_IMG | _filter_blocks $extra_blocks $min_blocks $new_size
 done
diff --git a/tests/qemu-iotests/249 b/tests/qemu-iotests/249
index 68f13ed328..a9aa9303eb 100755
--- a/tests/qemu-iotests/249
+++ b/tests/qemu-iotests/249
@@ -48,9 +48,9 @@ _supported_os Linux
 IMG_SIZE=1M
 
 # Create the images: base <- int <- active
-TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE | _filter_imgfmt
-TEST_IMG="$TEST_IMG.int" _make_test_img -b "$TEST_IMG.base" -F $IMGFMT | _filter_imgfmt
-_make_test_img -b "$TEST_IMG.int" -F $IMGFMT | _filter_imgfmt
+TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE
+TEST_IMG="$TEST_IMG.int" _make_test_img -b "$TEST_IMG.base" -F $IMGFMT
+_make_test_img -b "$TEST_IMG.int" -F $IMGFMT
 
 # Launch QEMU with these two drives:
 # none0: base (read-only)
-- 
2.29.2


