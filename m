Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E484DB18D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 17:52:45 +0200 (CEST)
Received: from localhost ([::1]:51552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL84y-0006y6-41
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 11:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52083)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iL7D4-00056I-G6
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:57:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iL7D3-00037k-24
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:57:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25929)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iL7D2-00037J-PO
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 10:57:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0BC2888FFF8
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 14:57:00 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-36.ams2.redhat.com
 [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46A5E100EBA3;
 Thu, 17 Oct 2019 14:56:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] tests: benchmark crypto with fixed data size,
 not time period
Date: Thu, 17 Oct 2019 15:56:52 +0100
Message-Id: <20191017145654.11371-3-berrange@redhat.com>
In-Reply-To: <20191017145654.11371-1-berrange@redhat.com>
References: <20191017145654.11371-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 17 Oct 2019 14:57:00 +0000 (UTC)
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the crypto benchmarks are processing data in varying chunk
sizes, over a fixed time period. This turns out to be a terrible idea
because with small chunk sizes the overhead of checking the elapsed
time on each loop iteration masks the true performance.

Benchmarking over a fixed data size avoids the loop running any system
calls which can interfere with the performance measurements.

Before this change

Enc chunk 512 bytes 2283.47 MB/sec Dec chunk 512 bytes 2236.23 MB/sec OK
Enc chunk 4096 bytes 2744.97 MB/sec Dec chunk 4096 bytes 2614.71 MB/sec O=
K
Enc chunk 16384 bytes 2777.53 MB/sec Dec chunk 16384 bytes 2678.44 MB/sec=
 OK
Enc chunk 65536 bytes 2809.34 MB/sec Dec chunk 65536 bytes 2699.47 MB/sec=
 OK

After this change

Enc chunk 512 bytes 2058.22 MB/sec Dec chunk 512 bytes 2030.11 MB/sec OK
Enc chunk 4096 bytes 2699.27 MB/sec Dec chunk 4096 bytes 2573.78 MB/sec O=
K
Enc chunk 16384 bytes 2748.52 MB/sec Dec chunk 16384 bytes 2653.76 MB/sec=
 OK
Enc chunk 65536 bytes 2814.08 MB/sec Dec chunk 65536 bytes 2712.74 MB/sec=
 OK

The actual crypto performance hasn't changed, which shows how
significant the mis-measurement has been for small data sizes.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/benchmark-crypto-cipher.c | 26 ++++++++++++++------------
 tests/benchmark-crypto-hash.c   | 17 +++++++++--------
 2 files changed, 23 insertions(+), 20 deletions(-)

diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-cip=
her.c
index 3ca31a2779..d8db5504d4 100644
--- a/tests/benchmark-crypto-cipher.c
+++ b/tests/benchmark-crypto-cipher.c
@@ -21,11 +21,12 @@ static void test_cipher_speed(size_t chunk_size,
 {
     QCryptoCipher *cipher;
     Error *err =3D NULL;
-    double total =3D 0.0;
     uint8_t *key =3D NULL, *iv =3D NULL;
     uint8_t *plaintext =3D NULL, *ciphertext =3D NULL;
     size_t nkey;
     size_t niv;
+    size_t total =3D 2 * GiB;
+    size_t remain;
=20
     if (!qcrypto_cipher_supports(alg, mode)) {
         return;
@@ -58,33 +59,34 @@ static void test_cipher_speed(size_t chunk_size,
                                       &err) =3D=3D 0);
=20
     g_test_timer_start();
-    do {
+    remain =3D total;
+    while (remain) {
         g_assert(qcrypto_cipher_encrypt(cipher,
                                         plaintext,
                                         ciphertext,
                                         chunk_size,
                                         &err) =3D=3D 0);
-        total +=3D chunk_size;
-    } while (g_test_timer_elapsed() < 1.0);
+        remain -=3D chunk_size;
+    }
+    g_test_timer_elapsed();
=20
-    total /=3D MiB;
     g_print("Enc chunk %zu bytes ", chunk_size);
-    g_print("%.2f MB/sec ", total / g_test_timer_last());
+    g_print("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
=20
-    total =3D 0.0;
     g_test_timer_start();
-    do {
+    remain =3D total;
+    while (remain) {
         g_assert(qcrypto_cipher_decrypt(cipher,
                                         plaintext,
                                         ciphertext,
                                         chunk_size,
                                         &err) =3D=3D 0);
-        total +=3D chunk_size;
-    } while (g_test_timer_elapsed() < 1.0);
+        remain -=3D chunk_size;
+    }
+    g_test_timer_elapsed();
=20
-    total /=3D MiB;
     g_print("Dec chunk %zu bytes ", chunk_size);
-    g_print("%.2f MB/sec ", total / g_test_timer_last());
+    g_print("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
=20
     qcrypto_cipher_free(cipher);
     g_free(plaintext);
diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.=
c
index 9b6f7a9155..67b7067223 100644
--- a/tests/benchmark-crypto-hash.c
+++ b/tests/benchmark-crypto-hash.c
@@ -20,7 +20,8 @@ static void test_hash_speed(const void *opaque)
     size_t chunk_size =3D (size_t)opaque;
     uint8_t *in =3D NULL, *out =3D NULL;
     size_t out_len =3D 0;
-    double total =3D 0.0;
+    size_t total =3D 2 * GiB;
+    size_t remain;
     struct iovec iov;
     int ret;
=20
@@ -31,20 +32,20 @@ static void test_hash_speed(const void *opaque)
     iov.iov_len =3D chunk_size;
=20
     g_test_timer_start();
-    do {
+    remain =3D total;
+    while (remain) {
         ret =3D qcrypto_hash_bytesv(QCRYPTO_HASH_ALG_SHA256,
                                   &iov, 1, &out, &out_len,
                                   NULL);
         g_assert(ret =3D=3D 0);
=20
-        total +=3D chunk_size;
-    } while (g_test_timer_elapsed() < 5.0);
+        remain -=3D chunk_size;
+    }
+    g_test_timer_elapsed();
=20
-    total /=3D MiB;
     g_print("sha256: ");
-    g_print("Testing chunk_size %zu bytes ", chunk_size);
-    g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
-    g_print("%.2f MB/sec\n", total / g_test_timer_last());
+    g_print("Hash %zu GB chunk size %zu bytes ", total / GiB, chunk_size=
);
+    g_print("%.2f MB/sec ", (double)total / MiB / g_test_timer_last());
=20
     g_free(out);
     g_free(in);
--=20
2.21.0


