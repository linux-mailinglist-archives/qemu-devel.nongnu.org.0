Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201953155EE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:29:45 +0100 (CET)
Received: from localhost ([::1]:33200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Xlg-0004QH-53
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9Xjw-0002js-BT
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l9Xjs-0007lF-SH
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612895271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=838YWj3IfRwG1KIIJFapU2hmQMRinOjvsiyN4wtj3+o=;
 b=WGu2jGwCPVNwO95ipozLQ7n9X9RJnjuFy7XQizwGCEyr9j52gkA3h0KRkAXt1GidU0Pzhs
 GE+1MHkhsucQ5nXTkuAlyGUMndz04Zb8hfUWPWBlt66QT/j34cXscs4xX89nsJ216oU8fc
 McmpPQ+gts8JStj4H6F+seKZ2AO9MFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-dx9DjOImPe6-GxDXhIL7OA-1; Tue, 09 Feb 2021 13:27:49 -0500
X-MC-Unique: dx9DjOImPe6-GxDXhIL7OA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3465F107ACF4;
 Tue,  9 Feb 2021 18:27:48 +0000 (UTC)
Received: from localhost (ovpn-113-208.ams2.redhat.com [10.36.113.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F20C5D9C0;
 Tue,  9 Feb 2021 18:27:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: Fix unsupported_imgopts for refcount_bits
Date: Tue,  9 Feb 2021 19:27:45 +0100
Message-Id: <20210209182745.501662-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many _unsupported_imgopts lines for refcount_bits values use something
like "refcount_bits=1[^0-9]" to forbid everything but "refcount_bits=1"
(e.g. "refcount_bits=16" is allowed).

That does not work when $IMGOPTS does not have any entry past the
refcount_bits option, which now became apparent with the "check" script
rewrite.

Use \b instead of [^0-9] to check for a word boundary, which is what we
really want.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
Reproducible with:
$ ./check -qcow2 -o refcount_bits=1
(The tests touched here should be skipped)

I don't know whether \b is portable.  I hope it is.
(This is why I CC-ed you, Eric.)

Then again, it appears that nobody ever runs the iotests with
refcount_bits=1 but me, and I do that on Linux.  So even if it isn't
portable, it shouldn't be an issue in practice... O:)
---
 tests/qemu-iotests/007 | 2 +-
 tests/qemu-iotests/015 | 2 +-
 tests/qemu-iotests/029 | 2 +-
 tests/qemu-iotests/058 | 2 +-
 tests/qemu-iotests/062 | 2 +-
 tests/qemu-iotests/066 | 2 +-
 tests/qemu-iotests/068 | 2 +-
 tests/qemu-iotests/080 | 2 +-
 tests/qemu-iotests/103 | 2 +-
 tests/qemu-iotests/201 | 2 +-
 tests/qemu-iotests/214 | 2 +-
 tests/qemu-iotests/217 | 2 +-
 tests/qemu-iotests/267 | 2 +-
 tests/qemu-iotests/271 | 3 ++-
 tests/qemu-iotests/286 | 2 +-
 15 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/qemu-iotests/007 b/tests/qemu-iotests/007
index 936d3f14fb..a014f50a6b 100755
--- a/tests/qemu-iotests/007
+++ b/tests/qemu-iotests/007
@@ -44,7 +44,7 @@ _supported_proto generic
 # refcount_bits must be at least 4 so we can create ten internal snapshots
 # (1 bit supports none, 2 bits support two, 4 bits support 14);
 # snapshot are generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=\(1\|2\)[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=\(1\|2\)\b' data_file
 
 echo
 echo "creating image"
diff --git a/tests/qemu-iotests/015 b/tests/qemu-iotests/015
index 40c23235a6..24e28643e4 100755
--- a/tests/qemu-iotests/015
+++ b/tests/qemu-iotests/015
@@ -43,7 +43,7 @@ _supported_fmt qcow2
 _supported_proto generic
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 echo
 echo "creating image"
diff --git a/tests/qemu-iotests/029 b/tests/qemu-iotests/029
index bd71dd2f22..9b345060e5 100755
--- a/tests/qemu-iotests/029
+++ b/tests/qemu-iotests/029
@@ -44,7 +44,7 @@ _supported_fmt qcow2
 _supported_proto generic
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 offset_size=24
 offset_l1_size=36
diff --git a/tests/qemu-iotests/058 b/tests/qemu-iotests/058
index ce35ff4ee0..0b0303fcd5 100755
--- a/tests/qemu-iotests/058
+++ b/tests/qemu-iotests/058
@@ -59,7 +59,7 @@ _supported_os Linux
 _require_command QEMU_NBD
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 nbd_snapshot_img="nbd:unix:$nbd_unix_socket"
 
diff --git a/tests/qemu-iotests/062 b/tests/qemu-iotests/062
index 321252298d..d7307f24ac 100755
--- a/tests/qemu-iotests/062
+++ b/tests/qemu-iotests/062
@@ -42,7 +42,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto generic
 # We need zero clusters and snapshots
-_unsupported_imgopts 'compat=0.10' 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'compat=0.10' 'refcount_bits=1\b' data_file
 
 IMG_SIZE=64M
 
diff --git a/tests/qemu-iotests/066 b/tests/qemu-iotests/066
index a780ed7ab5..ec9dab2025 100755
--- a/tests/qemu-iotests/066
+++ b/tests/qemu-iotests/066
@@ -43,7 +43,7 @@ _supported_proto generic
 # We need zero clusters and snapshots
 # (TODO: Consider splitting the snapshot part into a separate test
 #        file, so this one runs with refcount_bits=1 and data_file)
-_unsupported_imgopts 'compat=0.10' 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'compat=0.10' 'refcount_bits=1\b' data_file
 
 # Intentionally create an unaligned image
 IMG_SIZE=$((64 * 1024 * 1024 + 512))
diff --git a/tests/qemu-iotests/068 b/tests/qemu-iotests/068
index 03e03508a6..39a04a6ab6 100755
--- a/tests/qemu-iotests/068
+++ b/tests/qemu-iotests/068
@@ -42,7 +42,7 @@ _supported_fmt qcow2
 _supported_proto generic
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'compat=0.10' 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'compat=0.10' 'refcount_bits=1\b' data_file
 
 IMG_SIZE=128K
 
diff --git a/tests/qemu-iotests/080 b/tests/qemu-iotests/080
index 3306500683..a7cf938204 100755
--- a/tests/qemu-iotests/080
+++ b/tests/qemu-iotests/080
@@ -44,7 +44,7 @@ _supported_os Linux
 # - Internal snapshots are (currently) impossible with refcount_bits=1,
 #   and generally impossible with external data files
 # - This is generally a test for compat=1.1 images
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file 'compat=0.10'
+_unsupported_imgopts 'refcount_bits=1\b' data_file 'compat=0.10'
 
 header_size=112
 
diff --git a/tests/qemu-iotests/103 b/tests/qemu-iotests/103
index 726f8313ef..6276369052 100755
--- a/tests/qemu-iotests/103
+++ b/tests/qemu-iotests/103
@@ -41,7 +41,7 @@ _supported_fmt qcow2
 _supported_proto file nfs fuse
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 IMG_SIZE=64K
 
diff --git a/tests/qemu-iotests/201 b/tests/qemu-iotests/201
index 1b8eb51d8f..723d792adb 100755
--- a/tests/qemu-iotests/201
+++ b/tests/qemu-iotests/201
@@ -46,7 +46,7 @@ _supported_os Linux
 
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 size=64M
 _make_test_img $size
diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 0889089d81..e57e477f7c 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -41,7 +41,7 @@ _supported_proto file fuse
 # Repairing the corrupted image requires qemu-img check to store a
 # refcount up to 3, which requires at least two refcount bits.
 # External data files do not support compressed clusters.
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 
 echo
diff --git a/tests/qemu-iotests/217 b/tests/qemu-iotests/217
index e693f326a3..8b5df8d6bc 100755
--- a/tests/qemu-iotests/217
+++ b/tests/qemu-iotests/217
@@ -42,7 +42,7 @@ _supported_proto file fuse
 # This test needs clusters with at least a refcount of 2 so that
 # OFLAG_COPIED is not set.  refcount_bits=1 is therefore unsupported.
 # (As are external data files.)
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 echo
 echo '=== Simulating an I/O error during snapshot deletion ==='
diff --git a/tests/qemu-iotests/267 b/tests/qemu-iotests/267
index 2e2afdad9c..eb42b1ec02 100755
--- a/tests/qemu-iotests/267
+++ b/tests/qemu-iotests/267
@@ -45,7 +45,7 @@ _require_drivers copy-on-read
 
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 _require_devices virtio-blk
 
diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
index 599b849cc6..251afa0923 100755
--- a/tests/qemu-iotests/271
+++ b/tests/qemu-iotests/271
@@ -43,7 +43,8 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file nfs
 _supported_os Linux
-_unsupported_imgopts extended_l2 compat=0.10 cluster_size data_file refcount_bits=1[^0-9]
+_unsupported_imgopts extended_l2 compat=0.10 cluster_size data_file \
+    'refcount_bits=1\b'
 
 l2_offset=$((0x40000))
 
diff --git a/tests/qemu-iotests/286 b/tests/qemu-iotests/286
index 120a8375b7..76b3f80fa9 100755
--- a/tests/qemu-iotests/286
+++ b/tests/qemu-iotests/286
@@ -39,7 +39,7 @@ _supported_fmt qcow2
 _supported_proto file fuse
 # Internal snapshots are (currently) impossible with refcount_bits=1,
 # and generally impossible with external data files
-_unsupported_imgopts 'refcount_bits=1[^0-9]' data_file
+_unsupported_imgopts 'refcount_bits=1\b' data_file
 
 _make_test_img 64M
 
-- 
2.29.2


