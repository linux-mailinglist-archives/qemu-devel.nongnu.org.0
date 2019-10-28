Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F02FE75B9
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Oct 2019 17:01:03 +0100 (CET)
Received: from localhost ([::1]:55262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iP7S2-0007Gj-Bb
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 12:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32945)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iP7H5-0003ha-Lt
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:49:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iP7H4-00013n-IG
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:49:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39596
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iP7H4-00013b-FB
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 11:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572277782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwDekJskiz1kDqJoWdljY/MNvrSkK6g6oZezH+6KCeA=;
 b=aHPsl0wDJDNA/eiy2QzFnoq3yTed1VCoBAtkjuuP+Y+LVo+Nv1cB6PLMi85C60RoY2Nfwq
 UKV/Bxkvb8b/WqcrH+nDT841I2wjWbFXIPASvLmt0imlRsZNTQWRpcI36Axvw0sn68lwtj
 C/3EoPeVlIc5NUp/y8PRTZdNsAUMl8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-UpT8IQhSPWiHG5Zxk300gA-1; Mon, 28 Oct 2019 11:49:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98709801E64
 for <qemu-devel@nongnu.org>; Mon, 28 Oct 2019 15:49:39 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-24.ams2.redhat.com
 [10.36.112.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A91AE5D9C5;
 Mon, 28 Oct 2019 15:49:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] tests: allow filtering crypto cipher benchmark tests
Date: Mon, 28 Oct 2019 16:49:11 +0100
Message-Id: <20191028154914.84821-2-berrange@redhat.com>
In-Reply-To: <20191028154914.84821-1-berrange@redhat.com>
References: <20191028154914.84821-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: UpT8IQhSPWiHG5Zxk300gA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support for specifying a cipher mode and chunk size as argv to
filter which combinations are benchmarked. For example to only
benchmark XTS mode with 512 byte chunks:

  ./tests/benchmark-crypto-cipher xts 512

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tests/benchmark-crypto-cipher.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-ciphe=
r.c
index 67fdf8c31d..3ca31a2779 100644
--- a/tests/benchmark-crypto-cipher.c
+++ b/tests/benchmark-crypto-cipher.c
@@ -161,15 +161,26 @@ static void test_cipher_speed_xts_aes_256(const void =
*opaque)
=20
 int main(int argc, char **argv)
 {
+    char *alg =3D NULL;
+    char *size =3D NULL;
     g_test_init(&argc, &argv, NULL);
     g_assert(qcrypto_init(NULL) =3D=3D 0);
=20
 #define ADD_TEST(mode, cipher, keysize, chunk)                          \
-    g_test_add_data_func(                                               \
+    if ((!alg || g_str_equal(alg, #mode)) &&                            \
+        (!size || g_str_equal(size, #chunk)))                           \
+        g_test_add_data_func(                                           \
         "/crypto/cipher/" #mode "-" #cipher "-" #keysize "/chunk-" #chunk,=
 \
         (void *)chunk,                                                  \
         test_cipher_speed_ ## mode ## _ ## cipher ## _ ## keysize)
=20
+    if (argc >=3D 2) {
+        alg =3D argv[1];
+    }
+    if (argc >=3D 3) {
+        size =3D argv[2];
+    }
+
 #define ADD_TESTS(chunk)                        \
     do {                                        \
         ADD_TEST(ecb, aes, 128, chunk);         \
--=20
2.23.0


