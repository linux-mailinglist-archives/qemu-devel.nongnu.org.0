Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7213A43B2
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 16:04:16 +0200 (CEST)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrhle-0003Fj-M9
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 10:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrhji-0001rP-MT
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:02:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lrhja-0006JY-RW
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 10:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623420125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WHgWsbI9LIhIOx1poHmuVEqbTcf1rHaaqa1JZ94y/ak=;
 b=Or869GByqtwjZ4DZ6RUCFGtoL6Y6aQfK9MGUX84qtxIsdfDC7Kby01KwHti9yGu77SfGyB
 mK+yJ3eH2qvR40gHpcDpc+sN9EFWe2BDJ4p2MSCRz6KK1skU+5B0Wqh2auGT9NP3+VB61r
 0i2vq+xEheaeZd+pl6ir7ULIAflDVq0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-D0SM2T3JOKWwBHBXwarZCg-1; Fri, 11 Jun 2021 10:02:02 -0400
X-MC-Unique: D0SM2T3JOKWwBHBXwarZCg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34EF0CC628;
 Fri, 11 Jun 2021 14:02:01 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 638E15D6AC;
 Fri, 11 Jun 2021 14:02:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-img: Make unallocated part of backing chain obvious
 in map
Date: Fri, 11 Jun 2021 09:01:57 -0500
Message-Id: <20210611140157.1366738-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: nsoffer@redhat.com, Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recently-added NBD context qemu:allocation-depth is able to
distinguish between locally-present data (even with that data is
sparse) [shown as depth 1 over NBD], and data that could not be found
anywhere in the backing chain [shown as depth 0].  But qemu-img map
--output=json predates that addition, and prior to this patch has the
unfortunate behavior that all portions of the backing chain that
resolve without finding a hit in any backing layer report the same
depth as the final backing layer.  This makes it harder to reconstruct
a qcow2 backing chain using just 'qemu-img map' output, especially
when using "backing":null to artificially limit a backing chain,
because it is impossible to distinguish between a
QCOW2_CLUSTER_UNALLOCATED (which defers to a [missing] backing file)
and a QCOW2_CLUSTER_ZERO_PLAIN cluster (which would override any
backing file), since both types of clusters otherwise show as
"data":false,"zero":true" (but note that we can distinguish a
QCOW2_CLUSTER_ZERO_ALLOCATED, which would also have an "offset":
listing).

The task of reconstructing a qcow2 chain was made harder in commit
0da9856851 (nbd: server: Report holes for raw images), because prior
to that point, it was possible to abuse NBD's block status command to
see which portions of a qcow2 file resulted in BDRV_BLOCK_ALLOCATED
(showing up as NBD_STATE_ZERO in isolation) vs. missing from the chain
(showing up as NBD_STATE_ZERO|NBD_STATE_HOLE); but now qemu reports
more accurate sparseness information over NBD.

An obvious solution is to make 'qemu-img map --output=json'
distinguish between clusters that have a local allocation from those
that are found nowhere in the chain.  We already have a one-off
mismatch between qemu-img map and NBD qemu:allocation-depth (the
former chose 0, and the latter 1 for the local layer), so exposing the
latter's choice of 0 for unallocated in the entire chain would mean
using using "depth":-1 in the former, but a negative depth may confuse
existing tools.  But there is an easy out: for any chain of length N,
we can simply represent an unallocated cluster as "depth":N+1.  This
does have a slight risk of confusing any tool that might try to
dereference NULL when finding the backing image for the last file in
the backing chain, but that risk sseems worth the more precise output.
The iotests have several examples where this distinction demonstrates
the additional accuracy.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Replaces v1: 20210610213906.1313440-1-eblake@redhat.com
(qemu-img: Use "depth":-1 to make backing probes obvious)

Use N+1 instead of -1 for unallocated [Kevin]

 docs/tools/qemu-img.rst    |   3 +-
 qemu-img.c                 |   3 ++
 tests/qemu-iotests/122.out |  34 ++++++-------
 tests/qemu-iotests/154.out | 100 +++++++++++++++++++------------------
 tests/qemu-iotests/179.out |  67 +++++++++++++++++++++----
 tests/qemu-iotests/223.out |  24 ++++-----
 tests/qemu-iotests/244.out |   7 +--
 tests/qemu-iotests/252.out |   4 +-
 tests/qemu-iotests/274.out |  16 +++---
 tests/qemu-iotests/291.out |   8 +--
 tests/qemu-iotests/309.out |   4 +-
 11 files changed, 162 insertions(+), 108 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index cfe11478791f..c155b1bf3cc8 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -599,7 +599,8 @@ Command description:
   - whether the data is known to read as zero (boolean field ``zero``);
   - in order to make the output shorter, the target file is expressed as
     a ``depth``; for example, a depth of 2 refers to the backing file
-    of the backing file of *FILENAME*.
+    of the backing file of *FILENAME*.  Depth will be one larger than
+    the chain length if no file in the chain provides the data.

   In JSON format, the ``offset`` field is optional; it is absent in
   cases where ``human`` format would omit the entry or exit with an error.
diff --git a/qemu-img.c b/qemu-img.c
index a5993682aad4..33a5cd012b8b 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -3035,6 +3035,9 @@ static int get_block_status(BlockDriverState *bs, int64_t offset,
         bdrv_refresh_filename(file);
         filename = file->filename;
     }
+    if (!(ret & BDRV_BLOCK_ALLOCATED)) {
+        depth++;
+    }

     *e = (MapEntry) {
         .start = offset,
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 3a3e121d579d..779dab4847f0 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -68,11 +68,11 @@ read 65536/65536 bytes at offset 4194304
 read 65536/65536 bytes at offset 8388608
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 [{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": true},
-{ "start": 65536, "length": 4128768, "depth": 0, "zero": true, "data": false},
+{ "start": 65536, "length": 4128768, "depth": 1, "zero": true, "data": false},
 { "start": 4194304, "length": 65536, "depth": 0, "zero": false, "data": true},
-{ "start": 4259840, "length": 4128768, "depth": 0, "zero": true, "data": false},
+{ "start": 4259840, "length": 4128768, "depth": 1, "zero": true, "data": false},
 { "start": 8388608, "length": 65536, "depth": 0, "zero": false, "data": true},
-{ "start": 8454144, "length": 4128768, "depth": 0, "zero": true, "data": false}]
+{ "start": 8454144, "length": 4128768, "depth": 1, "zero": true, "data": false}]
 read 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 65536/65536 bytes at offset 4194304
@@ -95,11 +95,11 @@ wrote 1024/1024 bytes at offset 1046528
 wrote 1024/1024 bytes at offset 0
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 [{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": true},
-{ "start": 65536, "length": 65536, "depth": 0, "zero": true, "data": false},
+{ "start": 65536, "length": 65536, "depth": 1, "zero": true, "data": false},
 { "start": 131072, "length": 196608, "depth": 0, "zero": false, "data": true},
-{ "start": 327680, "length": 655360, "depth": 0, "zero": true, "data": false},
+{ "start": 327680, "length": 655360, "depth": 1, "zero": true, "data": false},
 { "start": 983040, "length": 65536, "depth": 0, "zero": false, "data": true},
-{ "start": 1048576, "length": 1046528, "depth": 0, "zero": true, "data": false}]
+{ "start": 1048576, "length": 1046528, "depth": 1, "zero": true, "data": false}]
 read 16384/16384 bytes at offset 0
 16 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 16384/16384 bytes at offset 16384
@@ -195,31 +195,31 @@ wrote 1024/1024 bytes at offset 17408

 convert -S 4k
 [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 4096, "length": 4096, "depth": 0, "zero": true, "data": false},
+{ "start": 4096, "length": 4096, "depth": 1, "zero": true, "data": false},
 { "start": 8192, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 12288, "length": 4096, "depth": 0, "zero": true, "data": false},
+{ "start": 12288, "length": 4096, "depth": 1, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 67088384, "depth": 0, "zero": true, "data": false}]
+{ "start": 20480, "length": 67088384, "depth": 1, "zero": true, "data": false}]

 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
-{ "start": 1024, "length": 7168, "depth": 0, "zero": true, "data": false},
+{ "start": 1024, "length": 7168, "depth": 1, "zero": true, "data": false},
 { "start": 8192, "length": 1024, "depth": 0, "zero": false, "data": true},
-{ "start": 9216, "length": 8192, "depth": 0, "zero": true, "data": false},
+{ "start": 9216, "length": 8192, "depth": 1, "zero": true, "data": false},
 { "start": 17408, "length": 1024, "depth": 0, "zero": false, "data": true},
-{ "start": 18432, "length": 67090432, "depth": 0, "zero": true, "data": false}]
+{ "start": 18432, "length": 67090432, "depth": 1, "zero": true, "data": false}]

 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 67084288, "depth": 0, "zero": true, "data": false}]
+{ "start": 24576, "length": 67084288, "depth": 1, "zero": true, "data": false}]

 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
-{ "start": 1024, "length": 7168, "depth": 0, "zero": true, "data": false},
+{ "start": 1024, "length": 7168, "depth": 1, "zero": true, "data": false},
 { "start": 8192, "length": 1024, "depth": 0, "zero": false, "data": true},
-{ "start": 9216, "length": 8192, "depth": 0, "zero": true, "data": false},
+{ "start": 9216, "length": 8192, "depth": 1, "zero": true, "data": false},
 { "start": 17408, "length": 1024, "depth": 0, "zero": false, "data": true},
-{ "start": 18432, "length": 67090432, "depth": 0, "zero": true, "data": false}]
+{ "start": 18432, "length": 67090432, "depth": 1, "zero": true, "data": false}]

 === -n to a non-zero image ===

@@ -235,7 +235,7 @@ Formatting 'TEST_DIR/t.IMGFMT.orig', fmt=IMGFMT size=67108864
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 [{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-[{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 67108864, "depth": 1, "zero": true, "data": false}]

 === -n to an empty image with a backing file ===

diff --git a/tests/qemu-iotests/154.out b/tests/qemu-iotests/154.out
index 4863e2483864..34e65dc70759 100644
--- a/tests/qemu-iotests/154.out
+++ b/tests/qemu-iotests/154.out
@@ -12,13 +12,13 @@ wrote 2048/2048 bytes at offset 17408
 wrote 2048/2048 bytes at offset 27648
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 [{ "start": 0, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 4096, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 4096, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 8192, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 12288, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 12288, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 20480, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 20480, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 24576, "length": 8192, "depth": 0, "zero": true, "data": false},
-{ "start": 32768, "length": 134184960, "depth": 1, "zero": true, "data": false}]
+{ "start": 32768, "length": 134184960, "depth": 2, "zero": true, "data": false}]

 == backing file contains non-zero data before write_zeroes ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -41,11 +41,11 @@ read 1024/1024 bytes at offset 65536
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 2048/2048 bytes at offset 67584
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 32768, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 32768, "depth": 2, "zero": true, "data": false},
 { "start": 32768, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 36864, "length": 28672, "depth": 1, "zero": true, "data": false},
+{ "start": 36864, "length": 28672, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 69632, "length": 134148096, "depth": 1, "zero": true, "data": false}]
+{ "start": 69632, "length": 134148096, "depth": 2, "zero": true, "data": false}]

 == backing file contains non-zero data after write_zeroes ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -68,11 +68,11 @@ read 1024/1024 bytes at offset 44032
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 3072/3072 bytes at offset 40960
 3 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 32768, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 32768, "depth": 2, "zero": true, "data": false},
 { "start": 32768, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 36864, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 36864, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 40960, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 45056, "length": 134172672, "depth": 1, "zero": true, "data": false}]
+{ "start": 45056, "length": 134172672, "depth": 2, "zero": true, "data": false}]

 == write_zeroes covers non-zero data ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -101,15 +101,15 @@ wrote 2048/2048 bytes at offset 29696
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 4096/4096 bytes at offset 28672
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 4096, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 4096, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 8192, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 8192, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 12288, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 16384, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 16384, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 20480, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 24576, "length": 4096, "depth": 1, "zero": true, "data": false},
+{ "start": 24576, "length": 4096, "depth": 2, "zero": true, "data": false},
 { "start": 28672, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 32768, "length": 134184960, "depth": 1, "zero": true, "data": false}]
+{ "start": 32768, "length": 134184960, "depth": 2, "zero": true, "data": false}]

 == spanning two clusters, non-zero before request ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -142,16 +142,16 @@ read 1024/1024 bytes at offset 67584
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 5120/5120 bytes at offset 68608
 5 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 32768, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 32768, "depth": 2, "zero": true, "data": false},
 { "start": 32768, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 36864, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 40960, "length": 8192, "depth": 1, "zero": true, "data": false},
+{ "start": 40960, "length": 8192, "depth": 2, "zero": true, "data": false},
 { "start": 49152, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 53248, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 57344, "length": 8192, "depth": 1, "zero": true, "data": false},
+{ "start": 57344, "length": 8192, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 69632, "length": 4096, "depth": 0, "zero": true, "data": false},
-{ "start": 73728, "length": 134144000, "depth": 1, "zero": true, "data": false}]
+{ "start": 73728, "length": 134144000, "depth": 2, "zero": true, "data": false}]

 == spanning two clusters, non-zero after request ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -184,16 +184,16 @@ read 7168/7168 bytes at offset 65536
 7 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 1024/1024 bytes at offset 72704
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 32768, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 32768, "depth": 2, "zero": true, "data": false},
 { "start": 32768, "length": 4096, "depth": 0, "zero": true, "data": false},
 { "start": 36864, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 40960, "length": 8192, "depth": 1, "zero": true, "data": false},
+{ "start": 40960, "length": 8192, "depth": 2, "zero": true, "data": false},
 { "start": 49152, "length": 4096, "depth": 0, "zero": true, "data": false},
 { "start": 53248, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 57344, "length": 8192, "depth": 1, "zero": true, "data": false},
+{ "start": 57344, "length": 8192, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 4096, "depth": 0, "zero": true, "data": false},
 { "start": 69632, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 73728, "length": 134144000, "depth": 1, "zero": true, "data": false}]
+{ "start": 73728, "length": 134144000, "depth": 2, "zero": true, "data": false}]

 == spanning two clusters, partially overwriting backing file ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -213,7 +213,7 @@ read 1024/1024 bytes at offset 5120
 read 2048/2048 bytes at offset 6144
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 [{ "start": 0, "length": 8192, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 8192, "length": 134209536, "depth": 1, "zero": true, "data": false}]
+{ "start": 8192, "length": 134209536, "depth": 2, "zero": true, "data": false}]

 == spanning multiple clusters, non-zero in first cluster ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -226,10 +226,10 @@ read 2048/2048 bytes at offset 65536
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 10240/10240 bytes at offset 67584
 10 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 65536, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 65536, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 69632, "length": 8192, "depth": 0, "zero": true, "data": false},
-{ "start": 77824, "length": 134139904, "depth": 1, "zero": true, "data": false}]
+{ "start": 77824, "length": 134139904, "depth": 2, "zero": true, "data": false}]

 == spanning multiple clusters, non-zero in intermediate cluster ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -240,9 +240,9 @@ wrote 7168/7168 bytes at offset 67584
 7 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 12288/12288 bytes at offset 65536
 12 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 65536, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 65536, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 12288, "depth": 0, "zero": true, "data": false},
-{ "start": 77824, "length": 134139904, "depth": 1, "zero": true, "data": false}]
+{ "start": 77824, "length": 134139904, "depth": 2, "zero": true, "data": false}]

 == spanning multiple clusters, non-zero in final cluster ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -255,10 +255,10 @@ read 10240/10240 bytes at offset 65536
 10 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 2048/2048 bytes at offset 75776
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 65536, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 65536, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 8192, "depth": 0, "zero": true, "data": false},
 { "start": 73728, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 77824, "length": 134139904, "depth": 1, "zero": true, "data": false}]
+{ "start": 77824, "length": 134139904, "depth": 2, "zero": true, "data": false}]

 == spanning multiple clusters, partially overwriting backing file ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
@@ -277,57 +277,61 @@ read 2048/2048 bytes at offset 74752
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 1024/1024 bytes at offset 76800
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 65536, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 65536, "depth": 2, "zero": true, "data": false},
 { "start": 65536, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 69632, "length": 4096, "depth": 0, "zero": true, "data": false},
 { "start": 73728, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 77824, "length": 134139904, "depth": 1, "zero": true, "data": false}]
+{ "start": 77824, "length": 134139904, "depth": 2, "zero": true, "data": false}]

 == unaligned image tail cluster, no allocation needed ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776
 wrote 512/512 bytes at offset 134217728
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134219776, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+{ "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776
 wrote 512/512 bytes at offset 134219264
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134219776, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+{ "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776
 wrote 1024/1024 bytes at offset 134218240
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134219776, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+{ "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776
 wrote 2048/2048 bytes at offset 134217728
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134219776, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+{ "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134218752
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 512/512 bytes at offset 134217728
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 512/512 bytes at offset 134219264
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 1024/1024 bytes at offset 134218240
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 2048/2048 bytes at offset 134217728
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 wrote 512/512 bytes at offset 134217728
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -335,25 +339,25 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/
 wrote 512/512 bytes at offset 134217728
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 512/512 bytes at offset 134219264
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 1024/1024 bytes at offset 134218240
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 2048/2048 bytes at offset 134217728
 2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 2048/2048 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": true, "data": false}]
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134218752
 wrote 1024/1024 bytes at offset 134217728
@@ -365,14 +369,14 @@ read 512/512 bytes at offset 134217728
 read 512/512 bytes at offset 134218240
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 1024/1024 bytes allocated at offset 128 MiB
-[{ "start": 0, "length": 134217728, "depth": 0, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
 { "start": 134217728, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 wrote 1024/1024 bytes at offset 134217728
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 1024/1024 bytes allocated at offset 128 MiB
 read 1024/1024 bytes at offset 134217728
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 134217728, "depth": 0, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
 { "start": 134217728, "length": 1024, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]

 == unaligned image tail cluster, allocation required ==
@@ -386,7 +390,7 @@ read 512/512 bytes at offset 134217728
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 1536/1536 bytes at offset 134218240
 1.500 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134218752
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134219776 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
@@ -408,6 +412,6 @@ read 512/512 bytes at offset 134218240
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 1024/1024 bytes at offset 134218752
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 134217728, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 134217728, "depth": 2, "zero": true, "data": false},
 { "start": 134217728, "length": 2048, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 *** done
diff --git a/tests/qemu-iotests/179.out b/tests/qemu-iotests/179.out
index 1f7680002ca6..2e2c33138902 100644
--- a/tests/qemu-iotests/179.out
+++ b/tests/qemu-iotests/179.out
@@ -13,7 +13,11 @@ wrote 2097152/2097152 bytes at offset 6291456
 2 MiB (0x200000) bytes not allocated at offset 4 MiB (0x400000)
 2 MiB (0x200000) bytes     allocated at offset 6 MiB (0x600000)
 56 MiB (0x3800000) bytes not allocated at offset 8 MiB (0x800000)
-[{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 4194304, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 6291456, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 8388608, "length": 58720256, "depth": 1, "zero": true, "data": false}]
 wrote 2097150/2097150 bytes at offset 10485761
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 2097150/2097150 bytes at offset 14680065
@@ -27,7 +31,15 @@ wrote 2097150/2097150 bytes at offset 14680065
 2 MiB (0x200000) bytes not allocated at offset 12 MiB (0xc00000)
 2 MiB (0x200000) bytes     allocated at offset 14 MiB (0xe00000)
 48 MiB (0x3000000) bytes not allocated at offset 16 MiB (0x1000000)
-[{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
+[{ "start": 0, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 4194304, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 6291456, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 10485760, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 12582912, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 14680064, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 16777216, "length": 50331648, "depth": 1, "zero": true, "data": false}]
 wrote 14680064/14680064 bytes at offset 18874368
 14 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 2097152/2097152 bytes at offset 20971520
@@ -45,13 +57,21 @@ wrote 6291456/6291456 bytes at offset 25165824
 2 MiB (0x200000) bytes not allocated at offset 16 MiB (0x1000000)
 14 MiB (0xe00000) bytes     allocated at offset 18 MiB (0x1200000)
 32 MiB (0x2000000) bytes not allocated at offset 32 MiB (0x2000000)
-[{ "start": 0, "length": 18874368, "depth": 0, "zero": true, "data": false},
+[{ "start": 0, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 4194304, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 6291456, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 10485760, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 12582912, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 14680064, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 16777216, "length": 2097152, "depth": 1, "zero": true, "data": false},
 { "start": 18874368, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 20971520, "length": 2097152, "depth": 0, "zero": true, "data": false},
 { "start": 23068672, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 25165824, "length": 6291456, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 31457280, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 33554432, "length": 33554432, "depth": 0, "zero": true, "data": false}]
+{ "start": 33554432, "length": 33554432, "depth": 1, "zero": true, "data": false}]
 wrote 2097152/2097152 bytes at offset 27262976
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 2097152/2097152 bytes at offset 29360128
@@ -67,7 +87,15 @@ wrote 2097152/2097152 bytes at offset 29360128
 2 MiB (0x200000) bytes not allocated at offset 16 MiB (0x1000000)
 14 MiB (0xe00000) bytes     allocated at offset 18 MiB (0x1200000)
 32 MiB (0x2000000) bytes not allocated at offset 32 MiB (0x2000000)
-[{ "start": 0, "length": 18874368, "depth": 0, "zero": true, "data": false},
+[{ "start": 0, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 4194304, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 6291456, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 10485760, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 12582912, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 14680064, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 16777216, "length": 2097152, "depth": 1, "zero": true, "data": false},
 { "start": 18874368, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 20971520, "length": 2097152, "depth": 0, "zero": true, "data": false},
 { "start": 23068672, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
@@ -75,7 +103,7 @@ wrote 2097152/2097152 bytes at offset 29360128
 { "start": 27262976, "length": 2097152, "depth": 0, "zero": true, "data": false},
 { "start": 29360128, "length": 2097152, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 31457280, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 33554432, "length": 33554432, "depth": 0, "zero": true, "data": false}]
+{ "start": 33554432, "length": 33554432, "depth": 1, "zero": true, "data": false}]
 wrote 8388608/8388608 bytes at offset 33554432
 8 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 2097152/2097152 bytes at offset 35651584
@@ -93,7 +121,15 @@ wrote 2097152/2097152 bytes at offset 37748736
 2 MiB (0x200000) bytes not allocated at offset 16 MiB (0x1000000)
 22 MiB (0x1600000) bytes     allocated at offset 18 MiB (0x1200000)
 24 MiB (0x1800000) bytes not allocated at offset 40 MiB (0x2800000)
-[{ "start": 0, "length": 18874368, "depth": 0, "zero": true, "data": false},
+[{ "start": 0, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 4194304, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 6291456, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 10485760, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 12582912, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 14680064, "length": 2097152, "depth": 0, "zero": true, "data": false},
+{ "start": 16777216, "length": 2097152, "depth": 1, "zero": true, "data": false},
 { "start": 18874368, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 20971520, "length": 2097152, "depth": 0, "zero": true, "data": false},
 { "start": 23068672, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
@@ -101,7 +137,8 @@ wrote 2097152/2097152 bytes at offset 37748736
 { "start": 27262976, "length": 2097152, "depth": 0, "zero": true, "data": false},
 { "start": 29360128, "length": 2097152, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 31457280, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 33554432, "length": 33554432, "depth": 0, "zero": true, "data": false}]
+{ "start": 33554432, "length": 8388608, "depth": 0, "zero": true, "data": false},
+{ "start": 41943040, "length": 25165824, "depth": 1, "zero": true, "data": false}]
 wrote 8388608/8388608 bytes at offset 41943040
 8 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 8388608/8388608 bytes at offset 50331648
@@ -125,7 +162,15 @@ wrote 2097152/2097152 bytes at offset 62914560
 4 MiB (0x400000) bytes not allocated at offset 54 MiB (0x3600000)
 4 MiB (0x400000) bytes     allocated at offset 58 MiB (0x3a00000)
 2 MiB (0x200000) bytes not allocated at offset 62 MiB (0x3e00000)
-[{ "start": 0, "length": 18874368, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 2097152, "depth": 2, "zero": true, "data": false},
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 4194304, "length": 2097152, "depth": 2, "zero": true, "data": false},
+{ "start": 6291456, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 2, "zero": true, "data": false},
+{ "start": 10485760, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 12582912, "length": 2097152, "depth": 2, "zero": true, "data": false},
+{ "start": 14680064, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 16777216, "length": 2097152, "depth": 2, "zero": true, "data": false},
 { "start": 18874368, "length": 2097152, "depth": 1, "zero": false, "data": true, "offset": OFFSET},
 { "start": 20971520, "length": 2097152, "depth": 1, "zero": true, "data": false},
 { "start": 23068672, "length": 2097152, "depth": 1, "zero": false, "data": true, "offset": OFFSET},
@@ -139,9 +184,9 @@ wrote 2097152/2097152 bytes at offset 62914560
 { "start": 50331648, "length": 2097152, "depth": 1, "zero": false, "data": true, "offset": OFFSET},
 { "start": 52428800, "length": 4194304, "depth": 0, "zero": true, "data": false},
 { "start": 56623104, "length": 2097152, "depth": 1, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 58720256, "length": 2097152, "depth": 1, "zero": true, "data": false},
+{ "start": 58720256, "length": 2097152, "depth": 2, "zero": true, "data": false},
 { "start": 60817408, "length": 4194304, "depth": 0, "zero": true, "data": false},
-{ "start": 65011712, "length": 2097152, "depth": 1, "zero": true, "data": false}]
+{ "start": 65011712, "length": 2097152, "depth": 2, "zero": true, "data": false}]
 No errors were found on the image.
 No errors were found on the image.

diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index 083b62d05386..101d1e89a8db 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -103,16 +103,16 @@ read 2097152/2097152 bytes at offset 2097152
 [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 4096, "length": 1044480, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 1048576, "length": 3145728, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
-[{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": false},
+[{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": false},
 { "start": 65536, "length": 2031616, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 2097152, "depth": 0, "zero": false, "data": false}]
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": false, "data": false}]

 === Contrast to small granularity dirty-bitmap ===

 [{ "start": 0, "length": 512, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 512, "length": 512, "depth": 0, "zero": false, "data": false},
+{ "start": 512, "length": 512, "depth": 1, "zero": false, "data": false},
 { "start": 1024, "length": 2096128, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 2097152, "depth": 0, "zero": false, "data": false}]
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": false, "data": false}]

 === End qemu NBD server ===

@@ -204,16 +204,16 @@ read 2097152/2097152 bytes at offset 2097152
 [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 4096, "length": 1044480, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 1048576, "length": 3145728, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
-[{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": false},
+[{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": false},
 { "start": 65536, "length": 2031616, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 2097152, "depth": 0, "zero": false, "data": false}]
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": false, "data": false}]

 === Contrast to small granularity dirty-bitmap ===

 [{ "start": 0, "length": 512, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 512, "length": 512, "depth": 0, "zero": false, "data": false},
+{ "start": 512, "length": 512, "depth": 1, "zero": false, "data": false},
 { "start": 1024, "length": 2096128, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 2097152, "depth": 0, "zero": false, "data": false}]
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": false, "data": false}]

 === End qemu NBD server ===

@@ -238,12 +238,12 @@ read 2097152/2097152 bytes at offset 2097152

 === Use qemu-nbd as server ===

-[{ "start": 0, "length": 65536, "depth": 0, "zero": false, "data": false},
+[{ "start": 0, "length": 65536, "depth": 1, "zero": false, "data": false},
 { "start": 65536, "length": 2031616, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 2097152, "depth": 0, "zero": false, "data": false}]
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": false, "data": false}]
 [{ "start": 0, "length": 512, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 512, "length": 512, "depth": 0, "zero": false, "data": false},
+{ "start": 512, "length": 512, "depth": 1, "zero": false, "data": false},
 { "start": 1024, "length": 11321, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 [{ "start": 12345, "length": 2084807, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 2097152, "depth": 0, "zero": false, "data": false}]
+{ "start": 2097152, "length": 2097152, "depth": 1, "zero": false, "data": false}]
 *** done
diff --git a/tests/qemu-iotests/244.out b/tests/qemu-iotests/244.out
index 99f56ac18c48..b934f2d9b792 100644
--- a/tests/qemu-iotests/244.out
+++ b/tests/qemu-iotests/244.out
@@ -57,11 +57,12 @@ wrote 3145728/3145728 bytes at offset 3145728
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.

-[{ "start": 0, "length": 1048576, "depth": 0, "zero": true, "data": false},
+[{ "start": 0, "length": 1048576, "depth": 1, "zero": true, "data": false},
 { "start": 1048576, "length": 1048576, "depth": 0, "zero": false, "data": true, "offset": 1048576},
 { "start": 2097152, "length": 2097152, "depth": 0, "zero": true, "data": false},
 { "start": 4194304, "length": 1048576, "depth": 0, "zero": true, "data": false, "offset": 4194304},
-{ "start": 5242880, "length": 61865984, "depth": 0, "zero": true, "data": false}]
+{ "start": 5242880, "length": 1048576, "depth": 0, "zero": true, "data": false},
+{ "start": 6291456, "length": 60817408, "depth": 1, "zero": true, "data": false}]

 read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -123,7 +124,7 @@ read 1048576/1048576 bytes at offset 0
 Offset          Length          Mapped to       File
 0               0x100000        0               TEST_DIR/t.qcow2.data
 [{ "start": 0, "length": 1048576, "depth": 0, "zero": false, "data": true, "offset": 0},
-{ "start": 1048576, "length": 66060288, "depth": 0, "zero": true, "data": false}]
+{ "start": 1048576, "length": 66060288, "depth": 1, "zero": true, "data": false}]

 === Copy offloading ===

diff --git a/tests/qemu-iotests/252.out b/tests/qemu-iotests/252.out
index 12dce889f823..b057b825739e 100644
--- a/tests/qemu-iotests/252.out
+++ b/tests/qemu-iotests/252.out
@@ -24,7 +24,7 @@ read 131072/131072 bytes at offset 262144
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)

 [{ "start": 0, "length": 262144, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 262144, "length": 131072, "depth": 0, "zero": true, "data": false}]
+{ "start": 262144, "length": 131072, "depth": 1, "zero": true, "data": false}]

 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -35,5 +35,5 @@ read 131072/131072 bytes at offset 262144

 [{ "start": 0, "length": 262144, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 262144, "length": 65536, "depth": 0, "zero": true, "data": false},
-{ "start": 327680, "length": 65536, "depth": 1, "zero": true, "data": false}]
+{ "start": 327680, "length": 65536, "depth": 2, "zero": true, "data": false}]
 *** done
diff --git a/tests/qemu-iotests/274.out b/tests/qemu-iotests/274.out
index cfe17a865924..9a4de18c4cf2 100644
--- a/tests/qemu-iotests/274.out
+++ b/tests/qemu-iotests/274.out
@@ -37,7 +37,7 @@ Offset          Length          Mapped to       File
 0               0x100000        0x50000         TEST_DIR/PID-base

 [{ "start": 0, "length": 1048576, "depth": 2, "zero": false, "data": true, "offset": 327680},
-{ "start": 1048576, "length": 1048576, "depth": 0, "zero": true, "data": false}]
+{ "start": 1048576, "length": 1048576, "depth": 1, "zero": true, "data": false}]

 Offset          Length          Mapped to       File
 0               0x100000        0x50000         TEST_DIR/PID-base
@@ -220,7 +220,7 @@ read 65536/65536 bytes at offset 5368709120
 1 GiB (0x40000000) bytes not allocated at offset 0 bytes (0x0)
 7 GiB (0x1c0000000) bytes     allocated at offset 1 GiB (0x40000000)

-[{ "start": 0, "length": 1073741824, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 1073741824, "depth": 2, "zero": true, "data": false},
 { "start": 1073741824, "length": 7516192768, "depth": 0, "zero": true, "data": false}]

 === preallocation=metadata ===
@@ -239,7 +239,7 @@ read 65536/65536 bytes at offset 33285996544
 30 GiB (0x780000000) bytes not allocated at offset 0 bytes (0x0)
 3 GiB (0xc0000000) bytes     allocated at offset 30 GiB (0x780000000)

-[{ "start": 0, "length": 32212254720, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 32212254720, "depth": 2, "zero": true, "data": false},
 { "start": 32212254720, "length": 536870912, "depth": 0, "zero": true, "data": false, "offset": 327680},
 { "start": 32749125632, "length": 536870912, "depth": 0, "zero": true, "data": false, "offset": 537264128},
 { "start": 33285996544, "length": 536870912, "depth": 0, "zero": true, "data": false, "offset": 1074200576},
@@ -263,7 +263,7 @@ read 65536/65536 bytes at offset 9437184
 5 MiB (0x500000) bytes not allocated at offset 0 bytes (0x0)
 10 MiB (0xa00000) bytes     allocated at offset 5 MiB (0x500000)

-[{ "start": 0, "length": 5242880, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 5242880, "depth": 2, "zero": true, "data": false},
 { "start": 5242880, "length": 10485760, "depth": 0, "zero": false, "data": true, "offset": 327680}]

 === preallocation=full ===
@@ -282,7 +282,7 @@ read 65536/65536 bytes at offset 11534336
 8 MiB (0x800000) bytes not allocated at offset 0 bytes (0x0)
 4 MiB (0x400000) bytes     allocated at offset 8 MiB (0x800000)

-[{ "start": 0, "length": 8388608, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 8388608, "depth": 2, "zero": true, "data": false},
 { "start": 8388608, "length": 4194304, "depth": 0, "zero": false, "data": true, "offset": 327680}]

 === preallocation=off ===
@@ -301,7 +301,7 @@ read 65536/65536 bytes at offset 259072
 192 KiB (0x30000) bytes not allocated at offset 0 bytes (0x0)
 320 KiB (0x50000) bytes     allocated at offset 192 KiB (0x30000)

-[{ "start": 0, "length": 196608, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 196608, "depth": 2, "zero": true, "data": false},
 { "start": 196608, "length": 65536, "depth": 0, "zero": false, "data": true, "offset": 327680},
 { "start": 262144, "length": 262144, "depth": 0, "zero": true, "data": false}]

@@ -321,7 +321,7 @@ read 65536/65536 bytes at offset 344064
 256 KiB (0x40000) bytes not allocated at offset 0 bytes (0x0)
 256 KiB (0x40000) bytes     allocated at offset 256 KiB (0x40000)

-[{ "start": 0, "length": 262144, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 262144, "depth": 2, "zero": true, "data": false},
 { "start": 262144, "length": 262144, "depth": 0, "zero": true, "data": false}]

 === preallocation=off ===
@@ -340,6 +340,6 @@ read 65536/65536 bytes at offset 446464
 256 KiB (0x40000) bytes not allocated at offset 0 bytes (0x0)
 244 KiB (0x3d000) bytes     allocated at offset 256 KiB (0x40000)

-[{ "start": 0, "length": 262144, "depth": 1, "zero": true, "data": false},
+[{ "start": 0, "length": 262144, "depth": 2, "zero": true, "data": false},
 { "start": 262144, "length": 249856, "depth": 0, "zero": true, "data": false}]

diff --git a/tests/qemu-iotests/291.out b/tests/qemu-iotests/291.out
index 23411c0ff4d9..5b997eb8d744 100644
--- a/tests/qemu-iotests/291.out
+++ b/tests/qemu-iotests/291.out
@@ -104,15 +104,15 @@ Format specific information:
 === Check bitmap contents ===

 [{ "start": 0, "length": 3145728, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 3145728, "length": 1048576, "depth": 0, "zero": false, "data": false},
+{ "start": 3145728, "length": 1048576, "depth": 1, "zero": false, "data": false},
 { "start": 4194304, "length": 6291456, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 [{ "start": 0, "length": 1048576, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 1048576, "length": 1048576, "depth": 0, "zero": false, "data": false},
+{ "start": 1048576, "length": 1048576, "depth": 1, "zero": false, "data": false},
 { "start": 2097152, "length": 8388608, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 [{ "start": 0, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 1048576, "depth": 0, "zero": false, "data": false},
+{ "start": 2097152, "length": 1048576, "depth": 1, "zero": false, "data": false},
 { "start": 3145728, "length": 7340032, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 [{ "start": 0, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 2097152, "length": 1048576, "depth": 0, "zero": false, "data": false},
+{ "start": 2097152, "length": 1048576, "depth": 1, "zero": false, "data": false},
 { "start": 3145728, "length": 7340032, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 *** done
diff --git a/tests/qemu-iotests/309.out b/tests/qemu-iotests/309.out
index db75bb6b0df9..7020bd33d7c1 100644
--- a/tests/qemu-iotests/309.out
+++ b/tests/qemu-iotests/309.out
@@ -13,10 +13,10 @@ wrote 2097152/2097152 bytes at offset 1048576

 [{ "start": 0, "length": 1048576, "depth": 1, "zero": false, "data": true, "offset": 327680},
 { "start": 1048576, "length": 2097152, "depth": 0, "zero": false, "data": true, "offset": 327680},
-{ "start": 3145728, "length": 1048576, "depth": 1, "zero": true, "data": false}]
+{ "start": 3145728, "length": 1048576, "depth": 2, "zero": true, "data": false}]
 [{ "start": 0, "length": 3145728, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 3145728, "length": 1048576, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 [{ "start": 0, "length": 1048576, "depth": 0, "zero": true, "data": true, "offset": OFFSET},
-{ "start": 1048576, "length": 2097152, "depth": 0, "zero": false, "data": false},
+{ "start": 1048576, "length": 2097152, "depth": 1, "zero": false, "data": false},
 { "start": 3145728, "length": 1048576, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 *** done
-- 
2.31.1


