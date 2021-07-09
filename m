Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CB3C23E6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:01:55 +0200 (CEST)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1q8g-0006GW-Th
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzF-0004yE-Tq
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pzC-0003id-1T
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:52:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6MhDj2LS1v+vdO4ppkqk9kzaql9ees7kpis6CZWC+RE=;
 b=H4g4IdL4wjPT7GVHPFqc1SOX+idmKj8gTKE6csqXZFiE1sKEWJHIzqP6R0gmFB9vSA8J5A
 yd0k/hJwfFuurK5SmoepoCq9fdNp5KV5KxNX7C5hg8p9YFlV8Kw10QeUNhUbcax2bNwusF
 lEF1BA269/v0ygGVeFOeeZsJEV8Dh0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-mVntsGmJPFCMucF2qlbxyw-1; Fri, 09 Jul 2021 08:52:02 -0400
X-MC-Unique: mVntsGmJPFCMucF2qlbxyw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC7A7188CBE0;
 Fri,  9 Jul 2021 12:52:01 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFA3860843;
 Fri,  9 Jul 2021 12:51:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 21/28] qemu-img: Require -F with -b backing image
Date: Fri,  9 Jul 2021 14:50:28 +0200
Message-Id: <20210709125035.191321-22-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

Back in commit d9f059aa6c (qemu-img: Deprecate use of -b without -F),
we deprecated the ability to create a file with a backing image that
requires qemu to perform format probing.  Qemu can still probe older
files for backwards compatibility, but it is time to finish off the
ability to create such images, due to the potential security risk they
present.  Update a couple of iotests affected by the change.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210503213600.569128-3-eblake@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 docs/system/deprecated.rst       | 20 -----------------
 docs/system/removed-features.rst | 19 ++++++++++++++++
 block.c                          | 37 ++++++++++----------------------
 qemu-img.c                       |  6 ++++--
 tests/qemu-iotests/040           |  4 ++--
 tests/qemu-iotests/041           |  6 ++++--
 tests/qemu-iotests/114           | 18 ++++++++--------
 tests/qemu-iotests/114.out       | 11 ++++------
 tests/qemu-iotests/301           |  4 +---
 tests/qemu-iotests/301.out       | 16 ++------------
 10 files changed, 56 insertions(+), 85 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9626a1fb57..25d6c4c9a0 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -282,26 +282,6 @@ this CPU is also deprecated.
 Related binaries
 ----------------
 
-qemu-img backing file without format (since 5.1)
-''''''''''''''''''''''''''''''''''''''''''''''''
-
-The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
-convert`` to create or modify an image that depends on a backing file
-now recommends that an explicit backing format be provided.  This is
-for safety: if QEMU probes a different format than what you thought,
-the data presented to the guest will be corrupt; similarly, presenting
-a raw image to a guest allows a potential security exploit if a future
-probe sees a non-raw image based on guest writes.
-
-To avoid the warning message, or even future refusal to create an
-unsafe image, you must pass ``-o backing_fmt=`` (or the shorthand
-``-F`` during create) to specify the intended backing format.  You may
-use ``qemu-img rebase -u`` to retroactively add a backing format to an
-existing image.  However, be aware that there are already potential
-security risks to blindly using ``qemu-img info`` to probe the format
-of an untrusted backing image, when deciding what format to add into
-an existing image.
-
 Backwards compatibility
 -----------------------
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index b64ea55194..28bb035043 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -503,6 +503,25 @@ backing chain should be performed with ``qemu-img rebase -u`` either
 before or after the remaining changes being performed by amend, as
 appropriate.
 
+qemu-img backing file without format (removed in 6.1)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
+convert`` to create or modify an image that depends on a backing file
+now requires that an explicit backing format be provided.  This is
+for safety: if QEMU probes a different format than what you thought,
+the data presented to the guest will be corrupt; similarly, presenting
+a raw image to a guest allows a potential security exploit if a future
+probe sees a non-raw image based on guest writes.
+
+To avoid creating unsafe backing chains, you must pass ``-o
+backing_fmt=`` (or the shorthand ``-F`` during create) to specify the
+intended backing format.  You may use ``qemu-img rebase -u`` to
+retroactively add a backing format to an existing image.  However, be
+aware that there are already potential security risks to blindly using
+``qemu-img info`` to probe the format of an untrusted backing image,
+when deciding what format to add into an existing image.
+
 Block devices
 -------------
 
diff --git a/block.c b/block.c
index acd35cb0cb..ce96585575 100644
--- a/block.c
+++ b/block.c
@@ -5074,7 +5074,7 @@ int coroutine_fn bdrv_co_check(BlockDriverState *bs,
  * -ENOTSUP - format driver doesn't support changing the backing file
  */
 int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
-                             const char *backing_fmt, bool warn)
+                             const char *backing_fmt, bool require)
 {
     BlockDriver *drv = bs->drv;
     int ret;
@@ -5088,10 +5088,8 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
         return -EINVAL;
     }
 
-    if (warn && backing_file && !backing_fmt) {
-        warn_report("Deprecated use of backing file without explicit "
-                    "backing format, use of this image requires "
-                    "potentially unsafe format probing");
+    if (require && backing_file && !backing_fmt) {
+        return -EINVAL;
     }
 
     if (drv->bdrv_change_backing_file != NULL) {
@@ -6601,24 +6599,11 @@ void bdrv_img_create(const char *filename, const char *fmt,
             goto out;
         } else {
             if (!backing_fmt) {
-                warn_report("Deprecated use of backing file without explicit "
-                            "backing format (detected format of %s)",
-                            bs->drv->format_name);
-                if (bs->drv != &bdrv_raw) {
-                    /*
-                     * A probe of raw deserves the most attention:
-                     * leaving the backing format out of the image
-                     * will ensure bs->probed is set (ensuring we
-                     * don't accidentally commit into the backing
-                     * file), and allow more spots to warn the users
-                     * to fix their toolchain when opening this image
-                     * later.  For other images, we can safely record
-                     * the format that we probed.
-                     */
-                    backing_fmt = bs->drv->format_name;
-                    qemu_opt_set(opts, BLOCK_OPT_BACKING_FMT, backing_fmt,
-                                 NULL);
-                }
+                error_setg(&local_err,
+                           "Backing file specified without backing format");
+                error_append_hint(&local_err, "Detected format of %s.",
+                                  bs->drv->format_name);
+                goto out;
             }
             if (size == -1) {
                 /* Opened BS, have no size */
@@ -6635,9 +6620,9 @@ void bdrv_img_create(const char *filename, const char *fmt,
         }
         /* (backing_file && !(flags & BDRV_O_NO_BACKING)) */
     } else if (backing_file && !backing_fmt) {
-        warn_report("Deprecated use of unopened backing file without "
-                    "explicit backing format, use of this image requires "
-                    "potentially unsafe format probing");
+        error_setg(&local_err,
+                   "Backing file specified without backing format");
+        goto out;
     }
 
     if (size == -1) {
diff --git a/qemu-img.c b/qemu-img.c
index 7956a89965..ec0e2fabe5 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2508,8 +2508,10 @@ static int img_convert(int argc, char **argv)
 
     if (out_baseimg_param) {
         if (!qemu_opt_get(opts, BLOCK_OPT_BACKING_FMT)) {
-            warn_report("Deprecated use of backing file without explicit "
-                        "backing format");
+            error_report("Use of backing file requires explicit "
+                         "backing format");
+            ret = -1;
+            goto out;
         }
     }
 
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index ba7cb34ce8..f3677de9df 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -920,8 +920,8 @@ class TestCommitWithOverriddenBacking(iotests.QMPTestCase):
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, self.img_base_a, '1M')
         qemu_img('create', '-f', iotests.imgfmt, self.img_base_b, '1M')
-        qemu_img('create', '-f', iotests.imgfmt, '-b', self.img_base_a, \
-                 self.img_top)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', self.img_base_a,
+                 '-F', iotests.imgfmt, self.img_top)
 
         self.vm = iotests.VM()
         self.vm.launch()
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 5cc02b24fc..db9f5dc540 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1295,8 +1295,10 @@ class TestReplaces(iotests.QMPTestCase):
 class TestFilters(iotests.QMPTestCase):
     def setUp(self):
         qemu_img('create', '-f', iotests.imgfmt, backing_img, '1M')
-        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img, test_img)
-        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img, target_img)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img,
+                 '-F', iotests.imgfmt, test_img)
+        qemu_img('create', '-f', iotests.imgfmt, '-b', backing_img,
+                 '-F', iotests.imgfmt, target_img)
 
         qemu_io('-c', 'write -P 1 0 512k', backing_img)
         qemu_io('-c', 'write -P 2 512k 512k', test_img)
diff --git a/tests/qemu-iotests/114 b/tests/qemu-iotests/114
index 43cb0bc6c3..de6fd327ee 100755
--- a/tests/qemu-iotests/114
+++ b/tests/qemu-iotests/114
@@ -44,16 +44,16 @@ _supported_os Linux
 # qcow2.py does not work too well with external data files
 _unsupported_imgopts data_file
 
-# Intentionally specify backing file without backing format; demonstrate
-# the difference in warning messages when backing file could be probed.
-# Note that only a non-raw probe result will affect the resulting image.
+# Older qemu-img could set up backing file without backing format; modern
+# qemu can't but we can use qcow2.py to simulate older files.
 truncate -s $((64 * 1024 * 1024)) "$TEST_IMG.orig"
-_make_test_img -b "$TEST_IMG.orig" 64M
+_make_test_img -b "$TEST_IMG.orig" -F raw 64M
+$PYTHON qcow2.py "$TEST_IMG" del-header-ext 0xE2792ACA
 
 TEST_IMG="$TEST_IMG.base" _make_test_img 64M
 $QEMU_IMG convert -O qcow2 -B "$TEST_IMG.orig" "$TEST_IMG.orig" "$TEST_IMG"
-_make_test_img -b "$TEST_IMG.base" 64M
-_make_test_img -u -b "$TEST_IMG.base" 64M
+_make_test_img -b "$TEST_IMG.base" -F $IMGFMT 64M
+_make_test_img -u -b "$TEST_IMG.base" -F $IMGFMT 64M
 
 # Set an invalid backing file format
 $PYTHON qcow2.py "$TEST_IMG" add-header-ext 0xE2792ACA "foo"
@@ -64,9 +64,9 @@ _img_info
 $QEMU_IO -c "open $TEST_IMG" -c "read 0 4k" 2>&1 | _filter_qemu_io | _filter_testdir
 $QEMU_IO -c "open -o backing.driver=$IMGFMT $TEST_IMG" -c "read 0 4k" | _filter_qemu_io
 
-# Rebase the image, to show that omitting backing format triggers a warning,
-# but probing now lets us use the backing file.
-$QEMU_IMG rebase -u -b "$TEST_IMG.base" "$TEST_IMG"
+# Rebase the image, to show that backing format is required.
+($QEMU_IMG rebase -u -b "$TEST_IMG.base" "$TEST_IMG" 2>&1 && echo "unexpected pass") | _filter_testdir
+$QEMU_IMG rebase -u -b "$TEST_IMG.base" -F $IMGFMT "$TEST_IMG"
 $QEMU_IO -c "open $TEST_IMG" -c "read 0 4k" 2>&1 | _filter_qemu_io | _filter_testdir
 
 # success, all done
diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
index 0a37d20c82..6d638da266 100644
--- a/tests/qemu-iotests/114.out
+++ b/tests/qemu-iotests/114.out
@@ -1,12 +1,9 @@
 QA output created by 114
-qemu-img: warning: Deprecated use of backing file without explicit backing format (detected format of raw)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.orig
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.orig backing_fmt=raw
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-qemu-img: warning: Deprecated use of backing file without explicit backing format
-qemu-img: warning: Deprecated use of backing file without explicit backing format (detected format of IMGFMT)
+qemu-img: Use of backing file requires explicit backing format
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
-qemu-img: warning: Deprecated use of unopened backing file without explicit backing format, use of this image requires potentially unsafe format probing
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64 MiB (67108864 bytes)
@@ -17,7 +14,7 @@ qemu-io: can't open device TEST_DIR/t.qcow2: Could not open backing file: Unknow
 no file open, try 'help open'
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: warning: Deprecated use of backing file without explicit backing format, use of this image requires potentially unsafe format probing
+qemu-img: Could not change the backing file to 'TEST_DIR/t.qcow2.base': Invalid argument
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
diff --git a/tests/qemu-iotests/301 b/tests/qemu-iotests/301
index 9f943cadbe..220de1043f 100755
--- a/tests/qemu-iotests/301
+++ b/tests/qemu-iotests/301
@@ -3,7 +3,7 @@
 #
 # Test qcow backing file warnings
 #
-# Copyright (C) 2020 Red Hat, Inc.
+# Copyright (C) 2020-2021 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -46,7 +46,6 @@ echo "== qcow backed by qcow =="
 
 TEST_IMG="$TEST_IMG.base" _make_test_img $size
 _make_test_img -b "$TEST_IMG.base" $size
-_img_info
 _make_test_img -b "$TEST_IMG.base" -F $IMGFMT $size
 _img_info
 
@@ -71,7 +70,6 @@ echo "== qcow backed by raw =="
 rm "$TEST_IMG.base"
 truncate --size=$size "$TEST_IMG.base"
 _make_test_img -b "$TEST_IMG.base" $size
-_img_info
 _make_test_img -b "$TEST_IMG.base" -F raw $size
 _img_info
 
diff --git a/tests/qemu-iotests/301.out b/tests/qemu-iotests/301.out
index 9004dad639..e280658191 100644
--- a/tests/qemu-iotests/301.out
+++ b/tests/qemu-iotests/301.out
@@ -2,13 +2,7 @@ QA output created by 301
 
 == qcow backed by qcow ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=33554432
-qemu-img: warning: Deprecated use of backing file without explicit backing format (detected format of IMGFMT)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
-image: TEST_DIR/t.IMGFMT
-file format: IMGFMT
-virtual size: 32 MiB (33554432 bytes)
-cluster_size: 512
-backing file: TEST_DIR/t.IMGFMT.base
+qemu-img: TEST_DIR/t.IMGFMT: Backing file specified without backing format
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
@@ -36,13 +30,7 @@ cluster_size: 512
 backing file: TEST_DIR/t.IMGFMT.base
 
 == qcow backed by raw ==
-qemu-img: warning: Deprecated use of backing file without explicit backing format (detected format of raw)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432 backing_file=TEST_DIR/t.IMGFMT.base
-image: TEST_DIR/t.IMGFMT
-file format: IMGFMT
-virtual size: 32 MiB (33554432 bytes)
-cluster_size: 512
-backing file: TEST_DIR/t.IMGFMT.base
+qemu-img: TEST_DIR/t.IMGFMT: Backing file specified without backing format
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=33554432 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
-- 
2.31.1


