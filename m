Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D9F172481
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 18:06:51 +0100 (CET)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Mcd-0007Mk-3K
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 12:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47282)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1j7MZ4-00023l-DZ
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:03:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1j7MZ3-0000Vl-6A
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:03:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49444
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1j7MZ3-0000VC-2h
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 12:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582822987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bDbO6KfewA7HuAfE2F3liY299JJeFspK5VWfGudlE4=;
 b=a0SdUHLTZ7QVYGXCf99DB5VnTcEgltjTu+JM20BdMNzfl+ZCxmpNFxJKuyAEJ2Ksd2+Rt8
 cmg/tDSmpeSO9Mn46eHGnzKxqpvnRNMYDrWhVOtKyn6c9LTMr1S605xfpplcC85Tk3Tcwc
 PWunafPpJu3vyJ+zRzuQ2m4OWWF55Xs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-DzRqpXGMMw6IYQIJfftrbQ-1; Thu, 27 Feb 2020 12:03:00 -0500
X-MC-Unique: DzRqpXGMMw6IYQIJfftrbQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E22B9800D5A;
 Thu, 27 Feb 2020 17:02:59 +0000 (UTC)
Received: from localhost (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CAFA5C57D;
 Thu, 27 Feb 2020 17:02:59 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] iotests/138: Test leaks/corruptions fixed report
Date: Thu, 27 Feb 2020 18:02:51 +0100
Message-Id: <20200227170251.86113-4-mreitz@redhat.com>
In-Reply-To: <20200227170251.86113-1-mreitz@redhat.com>
References: <20200227170251.86113-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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

Test that qemu-img check reports the number of leaks and corruptions
fixed in its JSON report (after a successful run).

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/138     | 41 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/138.out | 14 +++++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/138 b/tests/qemu-iotests/138
index 54b01046ad..25bfbd4cca 100755
--- a/tests/qemu-iotests/138
+++ b/tests/qemu-iotests/138
@@ -41,8 +41,10 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
 # With an external data file, data clusters are not refcounted
-# (and so qemu-img check does not check their refcount)
-_unsupported_imgopts data_file
+# (and so qemu-img check does not check their refcount);
+# we want to modify the refcounts, so we need them to have a specific
+# format (namely u16)
+_unsupported_imgopts data_file 'refcount_bits=3D\([^1]\|.\([^6]\|$\)\)'
=20
 echo
 echo '=3D=3D=3D Check on an image with a multiple of 2^32 clusters =3D=3D=
=3D'
@@ -65,6 +67,41 @@ poke_file "$TEST_IMG" $((2048 + 8)) "\x00\x80\x00\x00\x0=
0\x00\x00\x00"
 # allocate memory", we have an error showing that l2 entry is invalid.
 _check_test_img
=20
+echo
+echo '=3D=3D=3D Check leaks-fixed/corruptions-fixed report'
+echo
+
+# After leaks and corruptions were fixed, those numbers should be
+# reported by qemu-img check
+_make_test_img 64k
+
+# Allocate data cluster
+$QEMU_IO -c 'write 0 64k' "$TEST_IMG" | _filter_qemu_io
+
+reftable_ofs=3D$(peek_file_be "$TEST_IMG" 48 8)
+refblock_ofs=3D$(peek_file_be "$TEST_IMG" $reftable_ofs 8)
+
+# Introduce a leak: Make the image header's refcount 2
+poke_file "$TEST_IMG" "$refblock_ofs" "\x00\x02"
+
+l1_ofs=3D$(peek_file_be "$TEST_IMG" 40 8)
+
+# Introduce a corruption: Drop the COPIED flag from the (first) L1 entry
+l1_entry=3D$(peek_file_be "$TEST_IMG" $l1_ofs 8)
+l1_entry=3D$((l1_entry & ~(1 << 63)))
+poke_file_be "$TEST_IMG" $l1_ofs 8 $l1_entry
+
+echo
+# Should print the number of corruptions and leaks fixed
+# (Filter out all JSON fields (recognizable by their four-space
+# indentation), but keep the "-fixed" fields (by removing two spaces
+# from their indentation))
+# (Also filter out the L1 entry, because why not)
+_check_test_img -r all --output=3Djson \
+    | sed -e 's/^  \(.*\)-fixed"/\1-fixed"/' \
+    | grep -v '^    ' \
+    | sed -e "s/\\<$(printf %x $l1_entry)\\>/L1_ENTRY_VALUE/"
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/138.out b/tests/qemu-iotests/138.out
index aca7d47a80..79681e7cc9 100644
--- a/tests/qemu-iotests/138.out
+++ b/tests/qemu-iotests/138.out
@@ -9,4 +9,18 @@ ERROR: counting reference for region exceeding the end of =
the file by one cluste
=20
 1 errors were found on the image.
 Data may be corrupted, or further writes to the image may corrupt it.
+
+=3D=3D=3D Check leaks-fixed/corruptions-fixed report
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D65536
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+Leaked cluster 0 refcount=3D2 reference=3D1
+Repairing cluster 0 refcount=3D2 reference=3D1
+Repairing OFLAG_COPIED L2 cluster: l1_index=3D0 l1_entry=3DL1_ENTRY_VALUE =
refcount=3D1
+{
+  "corruptions-fixed": 1,
+  "leaks-fixed": 1,
+}
 *** done
--=20
2.24.1


