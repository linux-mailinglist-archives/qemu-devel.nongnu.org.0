Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746479D16C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 16:10:18 +0200 (CEST)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2FhJ-0007Tf-FH
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 10:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38220)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i2FPr-0008RW-2O
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:52:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i2FPp-000758-6f
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:52:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:18524)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i2FPe-0006ro-Pa; Mon, 26 Aug 2019 09:52:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 26F38105786A;
 Mon, 26 Aug 2019 13:52:02 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2F215D6C8;
 Mon, 26 Aug 2019 13:51:59 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 16:50:56 +0300
Message-Id: <20190826135103.22410-7-mlevitsk@redhat.com>
In-Reply-To: <20190826135103.22410-1-mlevitsk@redhat.com>
References: <20190826135103.22410-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 26 Aug 2019 13:52:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 06/13] qcrypto-block: pass keyslot index
 rather that pointer to the keyslot
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another minor refactoring

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 crypto/block-luks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 331377293d..0d81f2ac61 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -410,7 +410,7 @@ qcrypto_block_luks_essiv_cipher(QCryptoCipherAlgorithm cipher,
  */
 static int
 qcrypto_block_luks_load_key(QCryptoBlock *block,
-                            QCryptoBlockLUKSKeySlot *slot,
+                            unsigned int slot_idx,
                             const char *password,
                             QCryptoCipherAlgorithm cipheralg,
                             QCryptoCipherMode ciphermode,
@@ -424,6 +424,7 @@ qcrypto_block_luks_load_key(QCryptoBlock *block,
                             Error **errp)
 {
     QCryptoBlockLUKS *luks = block->opaque;
+    const QCryptoBlockLUKSKeySlot *slot = &luks->header.key_slots[slot_idx];
     g_autofree uint8_t *splitkey = NULL;
     size_t splitkeylen;
     g_autofree uint8_t *possiblekey = NULL;
@@ -580,13 +581,12 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
                             void *opaque,
                             Error **errp)
 {
-    QCryptoBlockLUKS *luks = block->opaque;
     size_t i;
     int rv;
 
     for (i = 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
         rv = qcrypto_block_luks_load_key(block,
-                                         &luks->header.key_slots[i],
+                                         i,
                                          password,
                                          cipheralg,
                                          ciphermode,
-- 
2.17.2


