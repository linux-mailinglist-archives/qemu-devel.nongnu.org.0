Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36671126506
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:42:02 +0100 (CET)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihx04-0008Of-PP
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:42:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ihwxD-0005EV-Tg
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:39:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ihwxC-0006Ud-Jx
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:39:03 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49780
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ihwxC-0006R9-BQ
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:39:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576766341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/pJpY3hwV5shIFKMRgTnTwl2AlilUWuNs4OgURWtNI=;
 b=VgbwKUegGGosw690yvSbHlxIpI/c3io8y4lmZTjXptzsqHwLdTjw1nGaoscY2/hG921izE
 icc8wXECwT8cOePf7TcqX5G6m7OB/DmWQ1gvNEv1C9FNZzBljUEwKApoHTB0lm6u5glnGv
 qvYXJrkA+QeQr0gwzkBsQZSgRGS4cpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-QSrVHNymN3iIKDLOFINBAg-1; Thu, 19 Dec 2019 09:38:58 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AF021007251;
 Thu, 19 Dec 2019 14:38:57 +0000 (UTC)
Received: from localhost (ovpn-205-138.brq.redhat.com [10.40.205.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFA6D5D9E2;
 Thu, 19 Dec 2019 14:38:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 09/18] iotests: Do not pipe _make_test_img
Date: Thu, 19 Dec 2019 15:38:09 +0100
Message-Id: <20191219143818.1646168-10-mreitz@redhat.com>
In-Reply-To: <20191219143818.1646168-1-mreitz@redhat.com>
References: <20191219143818.1646168-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: QSrVHNymN3iIKDLOFINBAg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Executing _make_test_img as part of a pipe will undo all variable
changes it has done.  As such, this could not work with FUSE (because
we want to remember all of our exports and their qemu instances).

Replace the pipe by a temporary file in 071 and 174 (the two tests that
can run on FUSE).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/071 | 19 +++++++++++++++----
 tests/qemu-iotests/174 | 10 +++++++++-
 2 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/071 b/tests/qemu-iotests/071
index 88faebcc1d..18fe9054b0 100755
--- a/tests/qemu-iotests/071
+++ b/tests/qemu-iotests/071
@@ -61,8 +61,17 @@ echo
 echo "=3D=3D=3D Testing blkverify through filename =3D=3D=3D"
 echo
=20
-TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG_S=
IZE |\
-    _filter_imgfmt
+# _make_test_img may set variables that we need to retain.  Everything
+# in a pipe is executed in a subshell, so doing so would throw away
+# all changes.  Therefore, we have to store the output in some temp
+# file and filter that.
+scratch_out=3D"$TEST_DIR/img-create.out"
+
+TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG_S=
IZE \
+    >"$scratch_out"
+_filter_imgfmt <"$scratch_out"
+rm -f "$scratch_out"
+
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=3Draw,file.driver=3Dblkverify,file.raw.filenam=
e=3D$TEST_IMG.base $TEST_IMG" \
          -c 'read 0 512' -c 'write -P 42 0x38000 512' -c 'read -P 42 0x380=
00 512' | _filter_qemu_io
@@ -76,8 +85,10 @@ echo
 echo "=3D=3D=3D Testing blkverify through file blockref =3D=3D=3D"
 echo
=20
-TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG_S=
IZE |\
-    _filter_imgfmt
+TEST_IMG=3D"$TEST_IMG.base" IMGFMT=3D"raw" _make_test_img --no-opts $IMG_S=
IZE \
+    >"$scratch_out"
+_filter_imgfmt <"$scratch_out"
+
 _make_test_img $IMG_SIZE
 $QEMU_IO -c "open -o driver=3Draw,file.driver=3Dblkverify,file.raw.filenam=
e=3D$TEST_IMG.base,file.test.driver=3D$IMGFMT,file.test.file.filename=3D$TE=
ST_IMG" \
          -c 'read 0 512' -c 'write -P 42 0x38000 512' -c 'read -P 42 0x380=
00 512' | _filter_qemu_io
diff --git a/tests/qemu-iotests/174 b/tests/qemu-iotests/174
index e2f14a38c6..1b0dd2e8b7 100755
--- a/tests/qemu-iotests/174
+++ b/tests/qemu-iotests/174
@@ -40,7 +40,15 @@ _unsupported_fmt raw
=20
=20
 size=3D256K
-IMGFMT=3Draw IMGKEYSECRET=3D _make_test_img --no-opts $size | _filter_imgf=
mt
+
+# _make_test_img may set variables that we need to retain.  Everything
+# in a pipe is executed in a subshell, so doing so would throw away
+# all changes.  Therefore, we have to store the output in some temp
+# file and filter that.
+scratch_out=3D"$TEST_DIR/img-create.out"
+IMGFMT=3Draw IMGKEYSECRET=3D _make_test_img --no-opts $size >"$scratch_out=
"
+_filter_imgfmt <"$scratch_out"
+rm -f "$scratch_out"
=20
 echo
 echo "=3D=3D reading wrong format should fail =3D=3D"
--=20
2.23.0


