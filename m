Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FF471C20
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 17:49:37 +0200 (CEST)
Received: from localhost ([::1]:45176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpx2m-00032v-L3
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 11:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52007)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <berrange@redhat.com>) id 1hpx2G-0001kw-K1
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 11:49:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1hpx2F-0000Zu-JB
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 11:49:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42988)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1hpx2F-0000YX-Dr
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 11:49:03 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBB1BC03D478
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 15:49:02 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB35A1001938;
 Tue, 23 Jul 2019 15:49:01 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 16:48:55 +0100
Message-Id: <20190723154856.17348-3-berrange@redhat.com>
In-Reply-To: <20190723154856.17348-1-berrange@redhat.com>
References: <20190723154856.17348-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 23 Jul 2019 15:49:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for 4.2 2/3] crypto: define cleanup functions
 for use with g_autoptr
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

Allow crypto structs to be used with g_autoptr, avoiding the need to
explicitly call XXX_free() functions when variables go out of scope on
the stack.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 include/crypto/block.h      | 2 ++
 include/crypto/cipher.h     | 2 ++
 include/crypto/hmac.h       | 2 ++
 include/crypto/ivgen.h      | 2 ++
 include/crypto/tlssession.h | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/include/crypto/block.h b/include/crypto/block.h
index fe12899831..d49d2c2da9 100644
--- a/include/crypto/block.h
+++ b/include/crypto/block.h
@@ -268,4 +268,6 @@ uint64_t qcrypto_block_get_sector_size(QCryptoBlock *=
block);
  */
 void qcrypto_block_free(QCryptoBlock *block);
=20
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoBlock, qcrypto_block_free)
+
 #endif /* QCRYPTO_BLOCK_H */
diff --git a/include/crypto/cipher.h b/include/crypto/cipher.h
index cac90b410c..5928e5ecc7 100644
--- a/include/crypto/cipher.h
+++ b/include/crypto/cipher.h
@@ -170,6 +170,8 @@ QCryptoCipher *qcrypto_cipher_new(QCryptoCipherAlgori=
thm alg,
  */
 void qcrypto_cipher_free(QCryptoCipher *cipher);
=20
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoCipher, qcrypto_cipher_free)
+
 /**
  * qcrypto_cipher_encrypt:
  * @cipher: the cipher object
diff --git a/include/crypto/hmac.h b/include/crypto/hmac.h
index aa3c97a2ff..ad4d778416 100644
--- a/include/crypto/hmac.h
+++ b/include/crypto/hmac.h
@@ -65,6 +65,8 @@ QCryptoHmac *qcrypto_hmac_new(QCryptoHashAlgorithm alg,
  */
 void qcrypto_hmac_free(QCryptoHmac *hmac);
=20
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoHmac, qcrypto_hmac_free)
+
 /**
  * qcrypto_hmac_bytesv:
  * @hmac: the hmac object
diff --git a/include/crypto/ivgen.h b/include/crypto/ivgen.h
index 9b4a62f7bb..e41521519c 100644
--- a/include/crypto/ivgen.h
+++ b/include/crypto/ivgen.h
@@ -203,4 +203,6 @@ QCryptoHashAlgorithm qcrypto_ivgen_get_hash(QCryptoIV=
Gen *ivgen);
  */
 void qcrypto_ivgen_free(QCryptoIVGen *ivgen);
=20
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoIVGen, qcrypto_ivgen_free)
+
 #endif /* QCRYPTO_IVGEN_H */
diff --git a/include/crypto/tlssession.h b/include/crypto/tlssession.h
index 816300cdcc..e01e1a9dc2 100644
--- a/include/crypto/tlssession.h
+++ b/include/crypto/tlssession.h
@@ -160,6 +160,8 @@ QCryptoTLSSession *qcrypto_tls_session_new(QCryptoTLS=
Creds *creds,
  */
 void qcrypto_tls_session_free(QCryptoTLSSession *sess);
=20
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QCryptoTLSSession, qcrypto_tls_session_fre=
e)
+
 /**
  * qcrypto_tls_session_check_credentials:
  * @sess: the TLS session object
--=20
2.21.0


