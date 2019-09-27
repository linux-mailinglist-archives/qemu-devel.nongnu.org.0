Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABDBC029B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 11:45:57 +0200 (CEST)
Received: from localhost ([::1]:48980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDmp1-0005KQ-Th
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 05:45:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iDmm7-0002zt-7N
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:42:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iDmm5-0007JH-Rl
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 05:42:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iDmm2-0007CC-Px; Fri, 27 Sep 2019 05:42:50 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 01CAD30ADBAE;
 Fri, 27 Sep 2019 09:42:50 +0000 (UTC)
Received: from localhost (ovpn-204-76.brq.redhat.com [10.40.204.76])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 903B55D9DC;
 Fri, 27 Sep 2019 09:42:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 02/18] iotests: Replace IMGOPTS by _unsupported_imgopts
Date: Fri, 27 Sep 2019 11:42:26 +0200
Message-Id: <20190927094242.11152-3-mreitz@redhat.com>
In-Reply-To: <20190927094242.11152-1-mreitz@redhat.com>
References: <20190927094242.11152-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 27 Sep 2019 09:42:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some tests require compat=3D1.1 and thus set IMGOPTS=3D'compat=3D1.1'
globally.  That is not how it should be done; instead, they should
simply set _unsupported_imgopts to compat=3D0.10 (compat=3D1.1 is the
default anyway).

This makes the tests heed user-specified $IMGOPTS.  Some do not work
with all image options, though, so we need to disable them accordingly.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/036 | 3 +--
 tests/qemu-iotests/060 | 4 ++--
 tests/qemu-iotests/062 | 3 ++-
 tests/qemu-iotests/066 | 3 ++-
 tests/qemu-iotests/068 | 3 ++-
 tests/qemu-iotests/098 | 3 +--
 6 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index 69d0f9f903..57dda23b02 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -43,9 +43,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qcow2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto file
-
 # Only qcow2v3 and later supports feature bits
-IMGOPTS=3D"compat=3D1.1"
+_unsupported_imgopts 'compat=3D0.10'
=20
 echo
 echo =3D=3D=3D Image with unknown incompatible feature bit =3D=3D=3D
diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index b91d8321bb..9c2ef42522 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -48,6 +48,8 @@ _filter_io_error()
 _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
+# These tests only work for compat=3D1.1 images with refcount_bits=3D16
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D\([^1]\|.\([^6]\|$=
\)\)'
=20
 rt_offset=3D65536  # 0x10000 (XXX: just an assumption)
 rb_offset=3D131072 # 0x20000 (XXX: just an assumption)
@@ -55,8 +57,6 @@ l1_offset=3D196608 # 0x30000 (XXX: just an assumption)
 l2_offset=3D262144 # 0x40000 (XXX: just an assumption)
 l2_offset_after_snapshot=3D524288 # 0x80000 (XXX: just an assumption)
=20
-IMGOPTS=3D"compat=3D1.1"
-
 OPEN_RW=3D"open -o overlap-check=3Dall $TEST_IMG"
 # Overlap checks are done before write operations only, therefore openin=
g an
 # image read-only makes the overlap-check option irrelevant
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index d5f818fcce..ac0d2a9a3b 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -40,8 +40,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qocw2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
+# We need zero clusters and snapshots
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]'
=20
-IMGOPTS=3D"compat=3D1.1"
 IMG_SIZE=3D64M
=20
 echo
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index 28f8c98412..9a15ba8027 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -39,9 +39,10 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qocw2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
+# Weneed zero clusters and snapshots
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]'
=20
 # Intentionally create an unaligned image
-IMGOPTS=3D"compat=3D1.1"
 IMG_SIZE=3D$((64 * 1024 * 1024 + 512))
=20
 echo
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 22f5ca3ba6..65650fca9a 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -39,8 +39,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # This tests qocw2-specific low-level functionality
 _supported_fmt qcow2
 _supported_proto generic
+# Internal snapshots are (currently) impossible with refcount_bits=3D1
+_unsupported_imgopts 'compat=3D0.10' 'refcount_bits=3D1[^0-9]'
=20
-IMGOPTS=3D"compat=3D1.1"
 IMG_SIZE=3D128K
=20
 case "$QEMU_DEFAULT_MACHINE" in
diff --git a/tests/qemu-iotests/098 b/tests/qemu-iotests/098
index 1c1d1c468f..2d68dc7d6c 100755
--- a/tests/qemu-iotests/098
+++ b/tests/qemu-iotests/098
@@ -40,8 +40,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
=20
 _supported_fmt qcow2
 _supported_proto file
-
-IMGOPTS=3D"compat=3D1.1"
+_unsupported_imgopts 'compat=3D0.10'
=20
 for event in l1_update empty_image_prepare reftable_update refblock_allo=
c; do
=20
--=20
2.21.0


