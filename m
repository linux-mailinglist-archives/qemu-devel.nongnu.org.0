Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919A372297
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:41:24 +0200 (CEST)
Received: from localhost ([::1]:48588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldgJf-0000Xl-6X
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldgEo-0006Md-OY
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ldgEk-0005JY-SK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620077773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqx1HHQJacuyYpHo6lG204hmyDh98TlBj5OpevE5ybo=;
 b=F6DBvwDxA9bmzh2+lG8ifYOK2dvQX9giZDvHb5FnPiwx8xD+9NNbS7rrmNKXcfKRKTvfJg
 vac0GhEgMFRqdy1IsypJRqR7p5D+6YqmWcYNUmUwe6KfuOi8nCYv1JioEWMlKEzjUL8Rk4
 U1w5hikmnmR9mNKjhSah07IpOP3q4T8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-2BslpdPxNXi-CVMZr02y6A-1; Mon, 03 May 2021 17:36:09 -0400
X-MC-Unique: 2BslpdPxNXi-CVMZr02y6A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E837D18B9ECC;
 Mon,  3 May 2021 21:36:08 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-144.phx2.redhat.com [10.3.114.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6DFC360C05;
 Mon,  3 May 2021 21:36:08 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qemu-img: Require -F with -b backing image
Date: Mon,  3 May 2021 16:36:00 -0500
Message-Id: <20210503213600.569128-3-eblake@redhat.com>
In-Reply-To: <20210503213600.569128-1-eblake@redhat.com>
References: <20210503213600.569128-1-eblake@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Back in commit d9f059aa6c (qemu-img: Deprecate use of -b without -F),
we deprecated the ability to create a file with a backing image that
requires qemu to perform format probing.  Qemu can still probe older
files for backwards compatibility, but it is time to finish off the
ability to create such images, due to the potential security risk they
present.  Update a couple of iotests affected by the change.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 docs/system/deprecated.rst       | 20 -----------------
 docs/system/removed-features.rst | 19 ++++++++++++++++
 block.c                          | 37 ++++++++++----------------------
 qemu-img.c                       |  6 ++++--
 tests/qemu-iotests/114           | 18 ++++++++--------
 tests/qemu-iotests/114.out       | 11 ++++------
 tests/qemu-iotests/301           |  4 +---
 tests/qemu-iotests/301.out       | 16 ++------------
 8 files changed, 50 insertions(+), 81 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9ec1a9d0e03e..aa6f7d84e583 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -315,26 +315,6 @@ this CPU is also deprecated.
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
index 28b5df757d35..1928d8a483c0 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -466,6 +466,25 @@ backing chain should be performed with ``qemu-img rebase -u`` either
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
index 874c22c43e3d..931e37a8499b 100644
--- a/block.c
+++ b/block.c
@@ -5033,7 +5033,7 @@ int coroutine_fn bdrv_co_check(BlockDriverState *bs,
  * -ENOTSUP - format driver doesn't support changing the backing file
  */
 int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
-                             const char *backing_fmt, bool warn)
+                             const char *backing_fmt, bool require)
 {
     BlockDriver *drv = bs->drv;
     int ret;
@@ -5047,10 +5047,8 @@ int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
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
@@ -6556,24 +6554,11 @@ void bdrv_img_create(const char *filename, const char *fmt,
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
@@ -6590,9 +6575,9 @@ void bdrv_img_create(const char *filename, const char *fmt,
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
index a5993682aad4..3cdfcaa23f6b 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -2505,8 +2505,10 @@ static int img_convert(int argc, char **argv)

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

diff --git a/tests/qemu-iotests/114 b/tests/qemu-iotests/114
index 43cb0bc6c344..3e30b402bc4c 100755
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
+$QEMU_IMG rebase -u -b "$TEST_IMG.base" "$TEST_IMG" && echo "unexpected pass"
+$QEMU_IMG rebase -u -b "$TEST_IMG.base" -F $IMGFMT "$TEST_IMG"
 $QEMU_IO -c "open $TEST_IMG" -c "read 0 4k" 2>&1 | _filter_qemu_io | _filter_testdir

 # success, all done
diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
index 0a37d20c82a9..172454401257 100644
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
+qemu-img: Could not change the backing file to '/home/eblake/qemu/build/tests/qemu-iotests/scratch/t.qcow2.base': Invalid argument
 read 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
diff --git a/tests/qemu-iotests/301 b/tests/qemu-iotests/301
index 9f943cadbe24..220de1043fa5 100755
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
index 9004dad6392f..e280658191e1 100644
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


