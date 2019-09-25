Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5A2BE7B8
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 23:39:47 +0200 (CEST)
Received: from localhost ([::1]:57598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDF0g-0008Fs-2K
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 17:39:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37676)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEwr-00061n-NV
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iDEwq-0005u6-Ke
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 17:35:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57676)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iDEwo-0005po-Ei; Wed, 25 Sep 2019 17:35:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AE05F3082141;
 Wed, 25 Sep 2019 21:35:41 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BC5019D7A;
 Wed, 25 Sep 2019 21:35:39 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/13] block-crypto: misc refactoring
Date: Thu, 26 Sep 2019 00:35:15 +0300
Message-Id: <20190925213527.9117-2-mlevitsk@redhat.com>
In-Reply-To: <20190925213527.9117-1-mlevitsk@redhat.com>
References: <20190925213527.9117-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Wed, 25 Sep 2019 21:35:41 +0000 (UTC)
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* rename the write_func to create_write_func,
  and init_func to create_init_func
  this is  preparation for other write_func that will
  be used to update the encryption keys.

No functional changes

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 block/crypto.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index 7eb698774e..6e822c6e50 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -78,7 +78,7 @@ struct BlockCryptoCreateData {
 };
=20
=20
-static ssize_t block_crypto_write_func(QCryptoBlock *block,
+static ssize_t block_crypto_create_write_func(QCryptoBlock *block,
                                        size_t offset,
                                        const uint8_t *buf,
                                        size_t buflen,
@@ -96,8 +96,7 @@ static ssize_t block_crypto_write_func(QCryptoBlock *bl=
ock,
     return ret;
 }
=20
-
-static ssize_t block_crypto_init_func(QCryptoBlock *block,
+static ssize_t block_crypto_create_init_func(QCryptoBlock *block,
                                       size_t headerlen,
                                       void *opaque,
                                       Error **errp)
@@ -109,7 +108,8 @@ static ssize_t block_crypto_init_func(QCryptoBlock *b=
lock,
         return -EFBIG;
     }
=20
-    /* User provided size should reflect amount of space made
+    /*
+     * User provided size should reflect amount of space made
      * available to the guest, so we must take account of that
      * which will be used by the crypto header
      */
@@ -279,8 +279,8 @@ static int block_crypto_co_create_generic(BlockDriver=
State *bs,
     };
=20
     crypto =3D qcrypto_block_create(opts, NULL,
-                                  block_crypto_init_func,
-                                  block_crypto_write_func,
+                                  block_crypto_create_init_func,
+                                  block_crypto_create_write_func,
                                   &data,
                                   errp);
=20
--=20
2.17.2


