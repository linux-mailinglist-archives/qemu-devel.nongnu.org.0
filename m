Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016518397A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Mar 2020 20:32:31 +0100 (CET)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jCTZG-0000U6-8A
	for lists+qemu-devel@lfdr.de; Thu, 12 Mar 2020 15:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jCTVc-0004Rr-21
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jCTVa-00074e-3U
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:43 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40702
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jCTVZ-00073i-Us
 for qemu-devel@nongnu.org; Thu, 12 Mar 2020 15:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584041321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BhAJhktNprlsT+HXCeIIndLoZoEA75mp2KeoPR8LKc=;
 b=YVgEPfeISJIdcOyX96U3GoO68G0F5GhLnmMl4R49o7Od8yyipqOdtSCSVKQ4QovpjeG89j
 cmTFr6BSPswvFRESlCFr6LJlNCOyPbpjLICsMv/aSygRdh9o1i5Z9To3E8lW32yH/Mc8/Z
 oF8mUmqUAdadT71H8wEKi2I3/YbBh/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-FORAkkcuMW6sRcq-pxJvjg-1; Thu, 12 Mar 2020 15:28:37 -0400
X-MC-Unique: FORAkkcuMW6sRcq-pxJvjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B16F9801E77;
 Thu, 12 Mar 2020 19:28:36 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-177.phx2.redhat.com [10.3.116.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAE635DA7B;
 Thu, 12 Mar 2020 19:28:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] qcow: Tolerate backing_fmt=,
 but warn on backing_fmt=raw
Date: Thu, 12 Mar 2020 14:28:18 -0500
Message-Id: <20200312192822.3739399-4-eblake@redhat.com>
In-Reply-To: <20200312192822.3739399-1-eblake@redhat.com>
References: <20200312192822.3739399-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 kchamart@redhat.com, libvir-list@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow has no space in the metadata to store a backing format, and there
are existing qcow images backed both by raw or by other formats
(usually qcow) images, reliant on probing to tell the difference.
While we don't recommend the creation of new qcow images (as qcow2 is
hands-down better), we can at least insist that if the user does
request a specific format without using -u, then it must be non-raw
(as a raw backing file that gets inadvertently edited into some other
format can form a security hole); if the user does not request a
specific format or lies when using -u, then the status quo of probing
for the backing format remains intact (although an upcoming patch will
warn when omitting a format request).  Thus, when this series is
complete, the only way to use a backing file for qcow without
triggering a warning is when using -F if the backing file is non-raw
to begin with.  Note that this is only for QemuOpts usage; there is no
change to the QAPI to allow a format through -blockdev.

Add a new iotest 290 just for qcow, to demonstrate the new warning.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow.c               | 16 ++++++++-
 tests/qemu-iotests/290     | 72 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/290.out | 42 ++++++++++++++++++++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/290
 create mode 100644 tests/qemu-iotests/290.out

diff --git a/block/qcow.c b/block/qcow.c
index fce89898681f..47c6a40342a6 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -939,11 +939,12 @@ static int coroutine_fn qcow_co_create_opts(const cha=
r *filename,
 {
     BlockdevCreateOptions *create_options =3D NULL;
     BlockDriverState *bs =3D NULL;
-    QDict *qdict;
+    QDict *qdict =3D NULL;
     Visitor *v;
     const char *val;
     Error *local_err =3D NULL;
     int ret;
+    char *backing_fmt;

     static const QDictRenames opt_renames[] =3D {
         { BLOCK_OPT_BACKING_FILE,       "backing-file" },
@@ -952,6 +953,13 @@ static int coroutine_fn qcow_co_create_opts(const char=
 *filename,
     };

     /* Parse options and convert legacy syntax */
+    backing_fmt =3D qemu_opt_get_del(opts, BLOCK_OPT_BACKING_FMT);
+    if (backing_fmt && !strcmp(backing_fmt, "raw")) {
+        error_setg(errp, "qcow cannot store backing format; an explicit "
+                   "backing format of raw is unsafe");
+        ret =3D -EINVAL;
+        goto fail;
+    }
     qdict =3D qemu_opts_to_qdict_filtered(opts, NULL, &qcow_create_opts, t=
rue);

     val =3D qdict_get_try_str(qdict, BLOCK_OPT_ENCRYPT);
@@ -1017,6 +1025,7 @@ static int coroutine_fn qcow_co_create_opts(const cha=
r *filename,

     ret =3D 0;
 fail:
+    g_free(backing_fmt);
     qobject_unref(qdict);
     bdrv_unref(bs);
     qapi_free_BlockdevCreateOptions(create_options);
@@ -1151,6 +1160,11 @@ static QemuOptsList qcow_create_opts =3D {
             .type =3D QEMU_OPT_STRING,
             .help =3D "File name of a base image"
         },
+        {
+            .name =3D BLOCK_OPT_BACKING_FMT,
+            .type =3D QEMU_OPT_STRING,
+            .help =3D "Format of the backing image (caution: raw backing i=
s unsafe)",
+        },
         {
             .name =3D BLOCK_OPT_ENCRYPT,
             .type =3D QEMU_OPT_BOOL,
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
new file mode 100755
index 000000000000..8482de58cb4b
--- /dev/null
+++ b/tests/qemu-iotests/290
@@ -0,0 +1,72 @@
+#!/usr/bin/env bash
+#
+# Test qcow backing file warnings
+#
+# Copyright (C) 2020 Red Hat, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+seq=3D`basename $0`
+echo "QA output created by $seq"
+
+status=3D1=09# failure is the default!
+
+_cleanup()
+{
+=09_cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+
+_supported_fmt qcow
+_supported_proto file
+_supported_os Linux
+
+size=3D128M
+
+echo
+echo "=3D=3D qcow backed by qcow =3D=3D"
+
+TEST_IMG=3D"$TEST_IMG.base" _make_test_img $size
+_make_test_img -b "$TEST_IMG.base"
+_img_info
+_make_test_img -b "$TEST_IMG.base" -F $IMGFMT
+_img_info
+
+echo
+echo "=3D=3D mismatched command line detection =3D=3D"
+
+_make_test_img -b "$TEST_IMG.base" -F vmdk
+# Use of -u bypasses the backing format sanity check
+_make_test_img -u -b "$TEST_IMG.base" -F vmdk $size
+_img_info
+
+echo
+echo "=3D=3D qcow backed by raw =3D=3D"
+
+rm "$TEST_IMG.base"
+truncate --size=3D$size "$TEST_IMG.base"
+_make_test_img -b "$TEST_IMG.base"
+_img_info
+_make_test_img -b "$TEST_IMG.base" -F raw
+_img_info
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=3D0
diff --git a/tests/qemu-iotests/290.out b/tests/qemu-iotests/290.out
new file mode 100644
index 000000000000..5b4ae3196d04
--- /dev/null
+++ b/tests/qemu-iotests/290.out
@@ -0,0 +1,42 @@
+QA output created by 290
+
+=3D=3D qcow backed by qcow =3D=3D
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D134217728
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_file=
=3DTEST_DIR/t.IMGFMT.base
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 128 MiB (134217728 bytes)
+cluster_size: 512
+backing file: TEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_file=
=3DTEST_DIR/t.IMGFMT.base backing_fmt=3DIMGFMT
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 128 MiB (134217728 bytes)
+cluster_size: 512
+backing file: TEST_DIR/t.IMGFMT.base
+
+=3D=3D mismatched command line detection =3D=3D
+qemu-img: TEST_DIR/t.IMGFMT: invalid VMDK image descriptor
+Could not open backing image to determine size.
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_file=
=3DTEST_DIR/t.IMGFMT.base backing_fmt=3Dvmdk
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 128 MiB (134217728 bytes)
+cluster_size: 512
+backing file: TEST_DIR/t.IMGFMT.base
+
+=3D=3D qcow backed by raw =3D=3D
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_file=
=3DTEST_DIR/t.IMGFMT.base
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 128 MiB (134217728 bytes)
+cluster_size: 512
+backing file: TEST_DIR/t.IMGFMT.base
+qemu-img: TEST_DIR/t.IMGFMT: IMGFMT cannot store backing format; an explic=
it backing format of raw is unsafe
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_file=
=3DTEST_DIR/t.IMGFMT.base backing_fmt=3Draw
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 128 MiB (134217728 bytes)
+cluster_size: 512
+backing file: TEST_DIR/t.IMGFMT.base
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index ec2b2302e501..fb95b1e2887d 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -295,3 +295,4 @@
 284 rw
 286 rw quick
 288 quick
+290 backing quick
--=20
2.25.1


