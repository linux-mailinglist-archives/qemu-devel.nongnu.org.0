Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CBB1C8A03
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 14:03:43 +0200 (CEST)
Received: from localhost ([::1]:44182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWfFe-0002LW-5n
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 08:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWfAS-0006KY-BE
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:58:20 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:52945
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jWfAR-0000hp-6L
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:58:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588852698;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NRWNcKPFy9Df1Gy2X+Mscu8LTbGBR6u2xRaT1BtAKk=;
 b=RHIlbhupq/Z3WLNdNDrXcGHPxTQlc8WQ8dkKaxe38lAr3ON1r57ubQTUYjeL1D2d//P/qW
 RmeRzvOxXra/6qvuGkK/XED4gLkSL42eoFhAWIb2QGIXK0MuoK0zP6xhcY6Y9c7/J+kXBB
 566iW9q0gjRDoaGQKXumKCvgmkv07HQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-W9tVPc6_Po67XEJQwxZz_w-1; Thu, 07 May 2020 07:58:16 -0400
X-MC-Unique: W9tVPc6_Po67XEJQwxZz_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACAEB107ACF4;
 Thu,  7 May 2020 11:58:14 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.110.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3896962A9D;
 Thu,  7 May 2020 11:58:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] crypto: Redundant type conversion for AES_KEY pointer
Date: Thu,  7 May 2020 12:58:01 +0100
Message-Id: <20200507115803.1122661-4-berrange@redhat.com>
In-Reply-To: <20200507115803.1122661-1-berrange@redhat.com>
References: <20200507115803.1122661-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

We can delete the redundant type conversion if
we set the the AES_KEY parameter with 'const' in
qcrypto_cipher_aes_ecb_(en|de)crypt() function.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/cipher-builtin.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/crypto/cipher-builtin.c b/crypto/cipher-builtin.c
index bf8413e71a..35cf7820d9 100644
--- a/crypto/cipher-builtin.c
+++ b/crypto/cipher-builtin.c
@@ -74,7 +74,7 @@ static void qcrypto_cipher_free_aes(QCryptoCipher *cipher=
)
 }
=20
=20
-static void qcrypto_cipher_aes_ecb_encrypt(AES_KEY *key,
+static void qcrypto_cipher_aes_ecb_encrypt(const AES_KEY *key,
                                            const void *in,
                                            void *out,
                                            size_t len)
@@ -100,7 +100,7 @@ static void qcrypto_cipher_aes_ecb_encrypt(AES_KEY *key=
,
 }
=20
=20
-static void qcrypto_cipher_aes_ecb_decrypt(AES_KEY *key,
+static void qcrypto_cipher_aes_ecb_decrypt(const AES_KEY *key,
                                            const void *in,
                                            void *out,
                                            size_t len)
@@ -133,8 +133,7 @@ static void qcrypto_cipher_aes_xts_encrypt(const void *=
ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx =3D ctx;
=20
-    qcrypto_cipher_aes_ecb_encrypt((AES_KEY *)&aesctx->enc,
-                                   src, dst, length);
+    qcrypto_cipher_aes_ecb_encrypt(&aesctx->enc, src, dst, length);
 }
=20
=20
@@ -145,8 +144,7 @@ static void qcrypto_cipher_aes_xts_decrypt(const void *=
ctx,
 {
     const QCryptoCipherBuiltinAESContext *aesctx =3D ctx;
=20
-    qcrypto_cipher_aes_ecb_decrypt((AES_KEY *)&aesctx->dec,
-                                   src, dst, length);
+    qcrypto_cipher_aes_ecb_decrypt(&aesctx->dec, src, dst, length);
 }
=20
=20
--=20
2.26.2


