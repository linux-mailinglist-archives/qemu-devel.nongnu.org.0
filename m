Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC8FB0B6A
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 11:29:44 +0200 (CEST)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8LQ6-0005sI-T2
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 05:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i8LEI-0001s7-IC
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:17:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i8LEH-0005cO-KT
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 05:17:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37728)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i8LED-0005Zl-UZ; Thu, 12 Sep 2019 05:17:26 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C75830860BD;
 Thu, 12 Sep 2019 09:17:25 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11BDC166A0;
 Thu, 12 Sep 2019 09:17:22 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 12:17:01 +0300
Message-Id: <20190912091710.21449-4-mlevitsk@redhat.com>
In-Reply-To: <20190912091710.21449-1-mlevitsk@redhat.com>
References: <20190912091710.21449-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 12 Sep 2019 09:17:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 03/12] qcrypto-luks: don't overwrite
 cipher_mode in header
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
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This way we can store the header we loaded, which
will be used in key management code

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/block-luks.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index f12fa2d270..25f8a9f1c4 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -645,6 +645,7 @@ qcrypto_block_luks_open(QCryptoBlock *block,
     QCryptoHashAlgorithm hash;
     QCryptoHashAlgorithm ivhash;
     g_autofree char *password =3D NULL;
+    g_autofree char *cipher_mode =3D NULL;
=20
     if (!(flags & QCRYPTO_BLOCK_OPEN_NO_IO)) {
         if (!options->u.luks.key_secret) {
@@ -701,6 +702,8 @@ qcrypto_block_luks_open(QCryptoBlock *block,
         goto fail;
     }
=20
+    cipher_mode =3D g_strdup(luks->header.cipher_mode);
+
     /*
      * The cipher_mode header contains a string that we have
      * to further parse, of the format
@@ -709,11 +712,11 @@ qcrypto_block_luks_open(QCryptoBlock *block,
      *
      * eg  cbc-essiv:sha256, cbc-plain64
      */
-    ivgen_name =3D strchr(luks->header.cipher_mode, '-');
+    ivgen_name =3D strchr(cipher_mode, '-');
     if (!ivgen_name) {
         ret =3D -EINVAL;
         error_setg(errp, "Unexpected cipher mode string format %s",
-                   luks->header.cipher_mode);
+                   cipher_mode);
         goto fail;
     }
     *ivgen_name =3D '\0';
@@ -735,7 +738,7 @@ qcrypto_block_luks_open(QCryptoBlock *block,
         }
     }
=20
-    ciphermode =3D qcrypto_block_luks_cipher_mode_lookup(luks->header.ci=
pher_mode,
+    ciphermode =3D qcrypto_block_luks_cipher_mode_lookup(cipher_mode,
                                                        &local_err);
     if (local_err) {
         ret =3D -ENOTSUP;
--=20
2.17.2


