Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DBC083A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Sep 2019 17:02:45 +0200 (CEST)
Received: from localhost ([::1]:52096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDrlb-000378-PL
	for lists+qemu-devel@lfdr.de; Fri, 27 Sep 2019 11:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iDqRX-0001Pf-Kv
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iDqRW-00039B-7B
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:37:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58614)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>) id 1iDqRV-00038U-UF
 for qemu-devel@nongnu.org; Fri, 27 Sep 2019 09:37:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 60276898104
 for <qemu-devel@nongnu.org>; Fri, 27 Sep 2019 09:59:47 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-55.ams2.redhat.com
 [10.36.112.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2464F60923;
 Fri, 27 Sep 2019 09:59:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] qcrypto-luks: simplify the math used for keyslot
 locations
Date: Fri, 27 Sep 2019 10:59:25 +0100
Message-Id: <20190927095926.22230-11-berrange@redhat.com>
In-Reply-To: <20190927095926.22230-1-berrange@redhat.com>
References: <20190927095926.22230-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 27 Sep 2019 09:59:47 +0000 (UTC)
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 crypto/block-luks.c | 63 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 6d4e9eb348..a53d5d1916 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -409,6 +409,30 @@ qcrypto_block_luks_essiv_cipher(QCryptoCipherAlgorit=
hm cipher,
     }
 }
=20
+/*
+ * Returns number of sectors needed to store the key material
+ * given number of anti forensic stripes
+ */
+static int
+qcrypto_block_luks_splitkeylen_sectors(const QCryptoBlockLUKS *luks,
+                                       unsigned int header_sectors,
+                                       unsigned int stripes)
+{
+    /*
+     * This calculation doesn't match that shown in the spec,
+     * but instead follows the cryptsetup implementation.
+     */
+
+    size_t splitkeylen =3D luks->header.master_key_len * stripes;
+
+    /* First align the key material size to block size*/
+    size_t splitkeylen_sectors =3D
+        DIV_ROUND_UP(splitkeylen, QCRYPTO_BLOCK_LUKS_SECTOR_SIZE);
+
+    /* Then also align the key material size to the size of the header *=
/
+    return ROUND_UP(splitkeylen_sectors, header_sectors);
+}
+
 /*
  * Stores the main LUKS header, taking care of endianess
  */
@@ -1114,7 +1138,8 @@ qcrypto_block_luks_create(QCryptoBlock *block,
     QCryptoBlockCreateOptionsLUKS luks_opts;
     Error *local_err =3D NULL;
     g_autofree uint8_t *masterkey =3D NULL;
-    size_t splitkeylen =3D 0;
+    size_t header_sectors;
+    size_t split_key_sectors;
     size_t i;
     g_autofree char *password =3D NULL;
     const char *cipher_alg;
@@ -1333,37 +1358,29 @@ qcrypto_block_luks_create(QCryptoBlock *block,
         goto error;
     }
=20
+    /* start with the sector that follows the header*/
+    header_sectors =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
+        QCRYPTO_BLOCK_LUKS_SECTOR_SIZE;
+
+    split_key_sectors =3D
+        qcrypto_block_luks_splitkeylen_sectors(luks,
+                                               header_sectors,
+                                               QCRYPTO_BLOCK_LUKS_STRIPE=
S);
=20
-    /* Although LUKS has multiple key slots, we're just going
-     * to use the first key slot */
-    splitkeylen =3D luks->header.master_key_len * QCRYPTO_BLOCK_LUKS_STR=
IPES;
     for (i =3D 0; i < QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS; i++) {
-        luks->header.key_slots[i].active =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT=
_DISABLED;
-        luks->header.key_slots[i].stripes =3D QCRYPTO_BLOCK_LUKS_STRIPES=
;
+        QCryptoBlockLUKSKeySlot *slot =3D &luks->header.key_slots[i];
+        slot->active =3D QCRYPTO_BLOCK_LUKS_KEY_SLOT_DISABLED;
=20
-        /* This calculation doesn't match that shown in the spec,
-         * but instead follows the cryptsetup implementation.
-         */
-        luks->header.key_slots[i].key_offset_sector =3D
-            (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
-             QCRYPTO_BLOCK_LUKS_SECTOR_SIZE) +
-            (ROUND_UP(DIV_ROUND_UP(splitkeylen, QCRYPTO_BLOCK_LUKS_SECTO=
R_SIZE),
-                      (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
-                       QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) * i);
+        slot->key_offset_sector =3D header_sectors + i * split_key_secto=
rs;
+        slot->stripes =3D QCRYPTO_BLOCK_LUKS_STRIPES;
     }
=20
-
     /* The total size of the LUKS headers is the partition header + key
      * slot headers, rounded up to the nearest sector, combined with
      * the size of each master key material region, also rounded up
      * to the nearest sector */
-    luks->header.payload_offset_sector =3D
-        (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
-         QCRYPTO_BLOCK_LUKS_SECTOR_SIZE) +
-        (ROUND_UP(DIV_ROUND_UP(splitkeylen, QCRYPTO_BLOCK_LUKS_SECTOR_SI=
ZE),
-                  (QCRYPTO_BLOCK_LUKS_KEY_SLOT_OFFSET /
-                   QCRYPTO_BLOCK_LUKS_SECTOR_SIZE)) *
-         QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS);
+    luks->header.payload_offset_sector =3D header_sectors +
+            QCRYPTO_BLOCK_LUKS_NUM_KEY_SLOTS * split_key_sectors;
=20
     block->sector_size =3D QCRYPTO_BLOCK_LUKS_SECTOR_SIZE;
     block->payload_offset =3D luks->header.payload_offset_sector *
--=20
2.21.0


