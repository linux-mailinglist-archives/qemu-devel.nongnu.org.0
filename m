Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669913144C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 16:02:58 +0100 (CET)
Received: from localhost ([::1]:53076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioTuC-0005ji-R2
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 10:02:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43551)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1ioTau-0006FS-Pg
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1ioTat-0000Ck-A7
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:43:00 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47626
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1ioTat-0000CS-6v
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 09:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578321778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=osQrdo77LH9FFoH7Ou21azj0h3tsEoibCd2rMNMALcw=;
 b=itXxTqik7oPf0E2LoZvXzfFC0Mk8yzlovWkiSGFlyRTmTJdczxDr+ETUhaj7lIBoNgJiK6
 qiAFVs7CNfKEmgIVJP8UddVHdd5ULgxslT+am7bll6B/UQnKe/rbQnV8COwSgqjQwY4JtI
 tqSGKOOKvZg0kG/6LdL5NS7nIsL8Fec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-KE8bTMJYNNKfIA6nBdVntA-1; Mon, 06 Jan 2020 09:42:54 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 587821099317;
 Mon,  6 Jan 2020 14:42:53 +0000 (UTC)
Received: from localhost (ovpn-117-91.ams2.redhat.com [10.36.117.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9417289A8;
 Mon,  6 Jan 2020 14:42:52 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/34] iotests: Filter refcount_order in 036
Date: Mon,  6 Jan 2020 15:41:44 +0100
Message-Id: <20200106144206.698920-13-mreitz@redhat.com>
In-Reply-To: <20200106144206.698920-1-mreitz@redhat.com>
References: <20200106144206.698920-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KE8bTMJYNNKfIA6nBdVntA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test can run just fine with other values for refcount_bits, so we
should filter the value from qcow2.py's dump-header.  In fact, we can
filter everything but the feature bits and header extensions, because
that is what the test is about.

(036 currently ignores user-specified image options, but that will be
fixed in the next patch.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Message-id: 20191107163708.833192-6-mreitz@redhat.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/036     |  9 ++++---
 tests/qemu-iotests/036.out | 48 --------------------------------------
 2 files changed, 6 insertions(+), 51 deletions(-)

diff --git a/tests/qemu-iotests/036 b/tests/qemu-iotests/036
index f06ff67408..5f929ad3be 100755
--- a/tests/qemu-iotests/036
+++ b/tests/qemu-iotests/036
@@ -55,7 +55,8 @@ $PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible=
 63
=20
 # Without feature table
 $PYTHON qcow2.py "$TEST_IMG" del-header-ext 0x6803f857
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+$PYTHON qcow2.py "$TEST_IMG" dump-header-exts
 _img_info
=20
 # With feature table containing bit 63
@@ -103,14 +104,16 @@ echo =3D=3D=3D Create image with unknown autoclear fe=
ature bit =3D=3D=3D
 echo
 _make_test_img 64M
 $PYTHON qcow2.py "$TEST_IMG" set-feature-bit autoclear 63
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+$PYTHON qcow2.py "$TEST_IMG" dump-header-exts
=20
 echo
 echo =3D=3D=3D Repair image =3D=3D=3D
 echo
 _check_test_img -r all
=20
-$PYTHON qcow2.py "$TEST_IMG" dump-header
+$PYTHON qcow2.py "$TEST_IMG" dump-header | grep features
+$PYTHON qcow2.py "$TEST_IMG" dump-header-exts
=20
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/036.out b/tests/qemu-iotests/036.out
index 15229a9604..0b52b934e1 100644
--- a/tests/qemu-iotests/036.out
+++ b/tests/qemu-iotests/036.out
@@ -3,25 +3,9 @@ QA output created by 036
 =3D=3D=3D Image with unknown incompatible feature bit =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
-magic                     0x514649fb
-version                   3
-backing_file_offset       0x0
-backing_file_size         0x0
-cluster_bits              16
-size                      67108864
-crypt_method              0
-l1_size                   1
-l1_table_offset           0x30000
-refcount_table_offset     0x10000
-refcount_table_clusters   1
-nb_snapshots              0
-snapshot_offset           0x0
 incompatible_features     [63]
 compatible_features       []
 autoclear_features        []
-refcount_order            4
-header_length             104
-
 qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupported IMGFMT feature(s=
): Unknown incompatible feature: 8000000000000000
 qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupported IMGFMT feature(s=
): Test feature
=20
@@ -37,25 +21,9 @@ qemu-img: Could not open 'TEST_DIR/t.IMGFMT': Unsupporte=
d IMGFMT feature(s): tes
 =3D=3D=3D Create image with unknown autoclear feature bit =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
-magic                     0x514649fb
-version                   3
-backing_file_offset       0x0
-backing_file_size         0x0
-cluster_bits              16
-size                      67108864
-crypt_method              0
-l1_size                   1
-l1_table_offset           0x30000
-refcount_table_offset     0x10000
-refcount_table_clusters   1
-nb_snapshots              0
-snapshot_offset           0x0
 incompatible_features     []
 compatible_features       []
 autoclear_features        [63]
-refcount_order            4
-header_length             104
-
 Header extension:
 magic                     0x6803f857
 length                    192
@@ -65,25 +33,9 @@ data                      <binary>
 =3D=3D=3D Repair image =3D=3D=3D
=20
 No errors were found on the image.
-magic                     0x514649fb
-version                   3
-backing_file_offset       0x0
-backing_file_size         0x0
-cluster_bits              16
-size                      67108864
-crypt_method              0
-l1_size                   1
-l1_table_offset           0x30000
-refcount_table_offset     0x10000
-refcount_table_clusters   1
-nb_snapshots              0
-snapshot_offset           0x0
 incompatible_features     []
 compatible_features       []
 autoclear_features        []
-refcount_order            4
-header_length             104
-
 Header extension:
 magic                     0x6803f857
 length                    192
--=20
2.24.1


