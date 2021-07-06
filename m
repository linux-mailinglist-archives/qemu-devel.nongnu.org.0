Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5072C3BC903
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:05:01 +0200 (CEST)
Received: from localhost ([::1]:57864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0hwq-0005VG-7S
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrx-00055J-JI
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0hrr-00011q-DQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 05:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625565589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jw3oJBdKjlSL4ZUh59nlyCoaS5cm36Y9n8G2R92NQl4=;
 b=ErD9xFFO9Q1vjsBKD7YRETr/p62Sp5vCGXjsPlk4nMMt0zdDjDrgolE2uvLI838zKp/KWL
 l/a2gOgMURV1WVP8DxB9lF2HPH+F+rlrgI42zGKEkj/S8NHR1QYHwk6wuWVf6UekiyU+rQ
 aNYaPAqRVSYGL23aey4plYXuEiXksyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-l-AU5doKNJKEnv5q5XaqRg-1; Tue, 06 Jul 2021 05:59:48 -0400
X-MC-Unique: l-AU5doKNJKEnv5q5XaqRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D03788030B0
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 09:59:47 +0000 (UTC)
Received: from domokun.gsslab.fab.redhat.com (gx270-2.gsslab.fab.redhat.com
 [10.33.8.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEA4F5D6A1;
 Tue,  6 Jul 2021 09:59:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/18] crypto: delete built-in DES implementation
Date: Tue,  6 Jul 2021 10:59:15 +0100
Message-Id: <20210706095924.764117-10-berrange@redhat.com>
In-Reply-To: <20210706095924.764117-1-berrange@redhat.com>
References: <20210706095924.764117-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The built-in DES implementation is used for the VNC server password
authentication scheme. When building system emulators it is reasonable
to expect that an external crypto library is being used. It is thus
not worth keeping a home grown DES implementation in tree.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/cipher-builtin.c.inc |  72 -------
 crypto/desrfb.c             | 416 ------------------------------------
 crypto/meson.build          |   1 -
 3 files changed, 489 deletions(-)
 delete mode 100644 crypto/desrfb.c

diff --git a/crypto/cipher-builtin.c.inc b/crypto/cipher-builtin.c.inc
index 7597cf4a10..70743f253c 100644
--- a/crypto/cipher-builtin.c.inc
+++ b/crypto/cipher-builtin.c.inc
@@ -19,7 +19,6 @@
  */
 
 #include "crypto/aes.h"
-#include "crypto/desrfb.h"
 #include "crypto/xts.h"
 
 typedef struct QCryptoCipherBuiltinAESContext QCryptoCipherBuiltinAESContext;
@@ -265,69 +264,10 @@ static const struct QCryptoCipherDriver qcrypto_cipher_aes_driver_xts = {
 };
 
 
-typedef struct QCryptoCipherBuiltinDESRFB QCryptoCipherBuiltinDESRFB;
-struct QCryptoCipherBuiltinDESRFB {
-    QCryptoCipher base;
-
-    /* C.f. alg_key_len[QCRYPTO_CIPHER_ALG_DES_RFB] */
-    uint8_t key[8];
-};
-
-static int qcrypto_cipher_encrypt_des_rfb(QCryptoCipher *cipher,
-                                          const void *in, void *out,
-                                          size_t len, Error **errp)
-{
-    QCryptoCipherBuiltinDESRFB *ctx
-        = container_of(cipher, QCryptoCipherBuiltinDESRFB, base);
-    size_t i;
-
-    if (!qcrypto_length_check(len, 8, errp)) {
-        return -1;
-    }
-
-    deskey(ctx->key, EN0);
-
-    for (i = 0; i < len; i += 8) {
-        des((void *)in + i, out + i);
-    }
-
-    return 0;
-}
-
-static int qcrypto_cipher_decrypt_des_rfb(QCryptoCipher *cipher,
-                                          const void *in, void *out,
-                                          size_t len, Error **errp)
-{
-    QCryptoCipherBuiltinDESRFB *ctx
-        = container_of(cipher, QCryptoCipherBuiltinDESRFB, base);
-    size_t i;
-
-    if (!qcrypto_length_check(len, 8, errp)) {
-        return -1;
-    }
-
-    deskey(ctx->key, DE1);
-
-    for (i = 0; i < len; i += 8) {
-        des((void *)in + i, out + i);
-    }
-
-    return 0;
-}
-
-static const struct QCryptoCipherDriver qcrypto_cipher_des_rfb_driver = {
-    .cipher_encrypt = qcrypto_cipher_encrypt_des_rfb,
-    .cipher_decrypt = qcrypto_cipher_decrypt_des_rfb,
-    .cipher_setiv = qcrypto_cipher_no_setiv,
-    .cipher_free = qcrypto_cipher_ctx_free,
-};
-
 bool qcrypto_cipher_supports(QCryptoCipherAlgorithm alg,
                              QCryptoCipherMode mode)
 {
     switch (alg) {
-    case QCRYPTO_CIPHER_ALG_DES_RFB:
-        return mode == QCRYPTO_CIPHER_MODE_ECB;
     case QCRYPTO_CIPHER_ALG_AES_128:
     case QCRYPTO_CIPHER_ALG_AES_192:
     case QCRYPTO_CIPHER_ALG_AES_256:
@@ -356,18 +296,6 @@ static QCryptoCipher *qcrypto_cipher_ctx_new(QCryptoCipherAlgorithm alg,
     }
 
     switch (alg) {
-    case QCRYPTO_CIPHER_ALG_DES_RFB:
-        if (mode == QCRYPTO_CIPHER_MODE_ECB) {
-            QCryptoCipherBuiltinDESRFB *ctx;
-
-            ctx = g_new0(QCryptoCipherBuiltinDESRFB, 1);
-            ctx->base.driver = &qcrypto_cipher_des_rfb_driver;
-            memcpy(ctx->key, key, sizeof(ctx->key));
-
-            return &ctx->base;
-        }
-        goto bad_mode;
-
     case QCRYPTO_CIPHER_ALG_AES_128:
     case QCRYPTO_CIPHER_ALG_AES_192:
     case QCRYPTO_CIPHER_ALG_AES_256:
diff --git a/crypto/desrfb.c b/crypto/desrfb.c
deleted file mode 100644
index b2a105ebbc..0000000000
--- a/crypto/desrfb.c
+++ /dev/null
@@ -1,416 +0,0 @@
-/*
- * This is D3DES (V5.09) by Richard Outerbridge with the double and
- * triple-length support removed for use in VNC.  Also the bytebit[] array
- * has been reversed so that the most significant bit in each byte of the
- * key is ignored, not the least significant.
- *
- * These changes are:
- *  Copyright (C) 1999 AT&T Laboratories Cambridge.  All Rights Reserved.
- *
- * This software is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
- */
-
-/* D3DES (V5.09) -
- *
- * A portable, public domain, version of the Data Encryption Standard.
- *
- * Written with Symantec's THINK (Lightspeed) C by Richard Outerbridge.
- * Thanks to: Dan Hoey for his excellent Initial and Inverse permutation
- * code;  Jim Gillogly & Phil Karn for the DES key schedule code; Dennis
- * Ferguson, Eric Young and Dana How for comparing notes; and Ray Lau,
- * for humouring me on.
- *
- * Copyright (c) 1988,1989,1990,1991,1992 by Richard Outerbridge.
- * (GEnie : OUTER; CIS : [71755,204]) Graven Imagery, 1992.
- */
-
-#include "qemu/osdep.h"
-#include "crypto/desrfb.h"
-
-static void scrunch(unsigned char *, unsigned long *);
-static void unscrun(unsigned long *, unsigned char *);
-static void desfunc(unsigned long *, unsigned long *);
-static void cookey(unsigned long *);
-
-static unsigned long KnL[32] = { 0L };
-
-static const unsigned short bytebit[8]	= {
-        01, 02, 04, 010, 020, 040, 0100, 0200 };
-
-static const unsigned long bigbyte[24] = {
-        0x800000L,	0x400000L,	0x200000L,	0x100000L,
-        0x80000L,	0x40000L,	0x20000L,	0x10000L,
-        0x8000L,	0x4000L,	0x2000L,	0x1000L,
-        0x800L, 	0x400L, 	0x200L, 	0x100L,
-        0x80L,		0x40L,		0x20L,		0x10L,
-        0x8L,		0x4L,		0x2L,		0x1L	};
-
-/* Use the key schedule specified in the Standard (ANSI X3.92-1981). */
-
-static const unsigned char pc1[56] = {
-        56, 48, 40, 32, 24, 16,  8,	 0, 57, 49, 41, 33, 25, 17,
-         9,  1, 58, 50, 42, 34, 26,	18, 10,  2, 59, 51, 43, 35,
-        62, 54, 46, 38, 30, 22, 14,	 6, 61, 53, 45, 37, 29, 21,
-        13,  5, 60, 52, 44, 36, 28,	20, 12,  4, 27, 19, 11,  3 };
-
-static const unsigned char totrot[16] = {
-        1, 2, 4, 6, 8, 10, 12, 14, 15, 17, 19, 21, 23, 25, 27, 28 };
-
-static const unsigned char pc2[48] = {
-        13, 16, 10, 23,  0,  4,  2, 27, 14,  5, 20,  9,
-        22, 18, 11,  3, 25,  7, 15,  6, 26, 19, 12,  1,
-        40, 51, 30, 36, 46, 54, 29, 39, 50, 44, 32, 47,
-        43, 48, 38, 55, 33, 52, 45, 41, 49, 35, 28, 31 };
-
-/* Thanks to James Gillogly & Phil Karn! */
-void deskey(unsigned char *key, int edf)
-{
-        register int i, j, l, m, n;
-        unsigned char pc1m[56], pcr[56];
-        unsigned long kn[32];
-
-        for ( j = 0; j < 56; j++ ) {
-                l = pc1[j];
-                m = l & 07;
-                pc1m[j] = (key[l >> 3] & bytebit[m]) ? 1 : 0;
-                }
-        for( i = 0; i < 16; i++ ) {
-                if( edf == DE1 ) m = (15 - i) << 1;
-                else m = i << 1;
-                n = m + 1;
-                kn[m] = kn[n] = 0L;
-                for( j = 0; j < 28; j++ ) {
-                        l = j + totrot[i];
-                        if( l < 28 ) pcr[j] = pc1m[l];
-                        else pcr[j] = pc1m[l - 28];
-                        }
-                for( j = 28; j < 56; j++ ) {
-                    l = j + totrot[i];
-                    if( l < 56 ) pcr[j] = pc1m[l];
-                    else pcr[j] = pc1m[l - 28];
-                    }
-                for( j = 0; j < 24; j++ ) {
-                        if( pcr[pc2[j]] ) kn[m] |= bigbyte[j];
-                        if( pcr[pc2[j + 24]] ) kn[n] |= bigbyte[j];
-                        }
-                }
-        cookey(kn);
-        return;
-        }
-
-static void cookey(register unsigned long *raw1)
-{
-        register unsigned long *cook, *raw0;
-        unsigned long dough[32];
-        register int i;
-
-        cook = dough;
-        for( i = 0; i < 16; i++, raw1++ ) {
-                raw0 = raw1++;
-                *cook	 = (*raw0 & 0x00fc0000L) << 6;
-                *cook	|= (*raw0 & 0x00000fc0L) << 10;
-                *cook	|= (*raw1 & 0x00fc0000L) >> 10;
-                *cook++ |= (*raw1 & 0x00000fc0L) >> 6;
-                *cook	 = (*raw0 & 0x0003f000L) << 12;
-                *cook	|= (*raw0 & 0x0000003fL) << 16;
-                *cook	|= (*raw1 & 0x0003f000L) >> 4;
-                *cook++ |= (*raw1 & 0x0000003fL);
-                }
-        usekey(dough);
-        return;
-        }
-
-void usekey(register unsigned long *from)
-{
-        register unsigned long *to, *endp;
-
-        to = KnL, endp = &KnL[32];
-        while( to < endp ) *to++ = *from++;
-        return;
-        }
-
-void des(unsigned char *inblock, unsigned char *outblock)
-{
-        unsigned long work[2];
-
-        scrunch(inblock, work);
-        desfunc(work, KnL);
-        unscrun(work, outblock);
-        return;
-        }
-
-static void scrunch(register unsigned char *outof, register unsigned long *into)
-{
-        *into	 = (*outof++ & 0xffL) << 24;
-        *into	|= (*outof++ & 0xffL) << 16;
-        *into	|= (*outof++ & 0xffL) << 8;
-        *into++ |= (*outof++ & 0xffL);
-        *into	 = (*outof++ & 0xffL) << 24;
-        *into	|= (*outof++ & 0xffL) << 16;
-        *into	|= (*outof++ & 0xffL) << 8;
-        *into	|= (*outof   & 0xffL);
-        return;
-        }
-
-static void unscrun(register unsigned long *outof, register unsigned char *into)
-{
-        *into++ = (unsigned char)((*outof >> 24) & 0xffL);
-        *into++ = (unsigned char)((*outof >> 16) & 0xffL);
-        *into++ = (unsigned char)((*outof >>  8) & 0xffL);
-        *into++ = (unsigned char)(*outof++	 & 0xffL);
-        *into++ = (unsigned char)((*outof >> 24) & 0xffL);
-        *into++ = (unsigned char)((*outof >> 16) & 0xffL);
-        *into++ = (unsigned char)((*outof >>  8) & 0xffL);
-        *into	=  (unsigned char)(*outof	 & 0xffL);
-        return;
-        }
-
-static const unsigned long SP1[64] = {
-        0x01010400L, 0x00000000L, 0x00010000L, 0x01010404L,
-        0x01010004L, 0x00010404L, 0x00000004L, 0x00010000L,
-        0x00000400L, 0x01010400L, 0x01010404L, 0x00000400L,
-        0x01000404L, 0x01010004L, 0x01000000L, 0x00000004L,
-        0x00000404L, 0x01000400L, 0x01000400L, 0x00010400L,
-        0x00010400L, 0x01010000L, 0x01010000L, 0x01000404L,
-        0x00010004L, 0x01000004L, 0x01000004L, 0x00010004L,
-        0x00000000L, 0x00000404L, 0x00010404L, 0x01000000L,
-        0x00010000L, 0x01010404L, 0x00000004L, 0x01010000L,
-        0x01010400L, 0x01000000L, 0x01000000L, 0x00000400L,
-        0x01010004L, 0x00010000L, 0x00010400L, 0x01000004L,
-        0x00000400L, 0x00000004L, 0x01000404L, 0x00010404L,
-        0x01010404L, 0x00010004L, 0x01010000L, 0x01000404L,
-        0x01000004L, 0x00000404L, 0x00010404L, 0x01010400L,
-        0x00000404L, 0x01000400L, 0x01000400L, 0x00000000L,
-        0x00010004L, 0x00010400L, 0x00000000L, 0x01010004L };
-
-static const unsigned long SP2[64] = {
-        0x80108020L, 0x80008000L, 0x00008000L, 0x00108020L,
-        0x00100000L, 0x00000020L, 0x80100020L, 0x80008020L,
-        0x80000020L, 0x80108020L, 0x80108000L, 0x80000000L,
-        0x80008000L, 0x00100000L, 0x00000020L, 0x80100020L,
-        0x00108000L, 0x00100020L, 0x80008020L, 0x00000000L,
-        0x80000000L, 0x00008000L, 0x00108020L, 0x80100000L,
-        0x00100020L, 0x80000020L, 0x00000000L, 0x00108000L,
-        0x00008020L, 0x80108000L, 0x80100000L, 0x00008020L,
-        0x00000000L, 0x00108020L, 0x80100020L, 0x00100000L,
-        0x80008020L, 0x80100000L, 0x80108000L, 0x00008000L,
-        0x80100000L, 0x80008000L, 0x00000020L, 0x80108020L,
-        0x00108020L, 0x00000020L, 0x00008000L, 0x80000000L,
-        0x00008020L, 0x80108000L, 0x00100000L, 0x80000020L,
-        0x00100020L, 0x80008020L, 0x80000020L, 0x00100020L,
-        0x00108000L, 0x00000000L, 0x80008000L, 0x00008020L,
-        0x80000000L, 0x80100020L, 0x80108020L, 0x00108000L };
-
-static const unsigned long SP3[64] = {
-        0x00000208L, 0x08020200L, 0x00000000L, 0x08020008L,
-        0x08000200L, 0x00000000L, 0x00020208L, 0x08000200L,
-        0x00020008L, 0x08000008L, 0x08000008L, 0x00020000L,
-        0x08020208L, 0x00020008L, 0x08020000L, 0x00000208L,
-        0x08000000L, 0x00000008L, 0x08020200L, 0x00000200L,
-        0x00020200L, 0x08020000L, 0x08020008L, 0x00020208L,
-        0x08000208L, 0x00020200L, 0x00020000L, 0x08000208L,
-        0x00000008L, 0x08020208L, 0x00000200L, 0x08000000L,
-        0x08020200L, 0x08000000L, 0x00020008L, 0x00000208L,
-        0x00020000L, 0x08020200L, 0x08000200L, 0x00000000L,
-        0x00000200L, 0x00020008L, 0x08020208L, 0x08000200L,
-        0x08000008L, 0x00000200L, 0x00000000L, 0x08020008L,
-        0x08000208L, 0x00020000L, 0x08000000L, 0x08020208L,
-        0x00000008L, 0x00020208L, 0x00020200L, 0x08000008L,
-        0x08020000L, 0x08000208L, 0x00000208L, 0x08020000L,
-        0x00020208L, 0x00000008L, 0x08020008L, 0x00020200L };
-
-static const unsigned long SP4[64] = {
-        0x00802001L, 0x00002081L, 0x00002081L, 0x00000080L,
-        0x00802080L, 0x00800081L, 0x00800001L, 0x00002001L,
-        0x00000000L, 0x00802000L, 0x00802000L, 0x00802081L,
-        0x00000081L, 0x00000000L, 0x00800080L, 0x00800001L,
-        0x00000001L, 0x00002000L, 0x00800000L, 0x00802001L,
-        0x00000080L, 0x00800000L, 0x00002001L, 0x00002080L,
-        0x00800081L, 0x00000001L, 0x00002080L, 0x00800080L,
-        0x00002000L, 0x00802080L, 0x00802081L, 0x00000081L,
-        0x00800080L, 0x00800001L, 0x00802000L, 0x00802081L,
-        0x00000081L, 0x00000000L, 0x00000000L, 0x00802000L,
-        0x00002080L, 0x00800080L, 0x00800081L, 0x00000001L,
-        0x00802001L, 0x00002081L, 0x00002081L, 0x00000080L,
-        0x00802081L, 0x00000081L, 0x00000001L, 0x00002000L,
-        0x00800001L, 0x00002001L, 0x00802080L, 0x00800081L,
-        0x00002001L, 0x00002080L, 0x00800000L, 0x00802001L,
-        0x00000080L, 0x00800000L, 0x00002000L, 0x00802080L };
-
-static const unsigned long SP5[64] = {
-        0x00000100L, 0x02080100L, 0x02080000L, 0x42000100L,
-        0x00080000L, 0x00000100L, 0x40000000L, 0x02080000L,
-        0x40080100L, 0x00080000L, 0x02000100L, 0x40080100L,
-        0x42000100L, 0x42080000L, 0x00080100L, 0x40000000L,
-        0x02000000L, 0x40080000L, 0x40080000L, 0x00000000L,
-        0x40000100L, 0x42080100L, 0x42080100L, 0x02000100L,
-        0x42080000L, 0x40000100L, 0x00000000L, 0x42000000L,
-        0x02080100L, 0x02000000L, 0x42000000L, 0x00080100L,
-        0x00080000L, 0x42000100L, 0x00000100L, 0x02000000L,
-        0x40000000L, 0x02080000L, 0x42000100L, 0x40080100L,
-        0x02000100L, 0x40000000L, 0x42080000L, 0x02080100L,
-        0x40080100L, 0x00000100L, 0x02000000L, 0x42080000L,
-        0x42080100L, 0x00080100L, 0x42000000L, 0x42080100L,
-        0x02080000L, 0x00000000L, 0x40080000L, 0x42000000L,
-        0x00080100L, 0x02000100L, 0x40000100L, 0x00080000L,
-        0x00000000L, 0x40080000L, 0x02080100L, 0x40000100L };
-
-static const unsigned long SP6[64] = {
-        0x20000010L, 0x20400000L, 0x00004000L, 0x20404010L,
-        0x20400000L, 0x00000010L, 0x20404010L, 0x00400000L,
-        0x20004000L, 0x00404010L, 0x00400000L, 0x20000010L,
-        0x00400010L, 0x20004000L, 0x20000000L, 0x00004010L,
-        0x00000000L, 0x00400010L, 0x20004010L, 0x00004000L,
-        0x00404000L, 0x20004010L, 0x00000010L, 0x20400010L,
-        0x20400010L, 0x00000000L, 0x00404010L, 0x20404000L,
-        0x00004010L, 0x00404000L, 0x20404000L, 0x20000000L,
-        0x20004000L, 0x00000010L, 0x20400010L, 0x00404000L,
-        0x20404010L, 0x00400000L, 0x00004010L, 0x20000010L,
-        0x00400000L, 0x20004000L, 0x20000000L, 0x00004010L,
-        0x20000010L, 0x20404010L, 0x00404000L, 0x20400000L,
-        0x00404010L, 0x20404000L, 0x00000000L, 0x20400010L,
-        0x00000010L, 0x00004000L, 0x20400000L, 0x00404010L,
-        0x00004000L, 0x00400010L, 0x20004010L, 0x00000000L,
-        0x20404000L, 0x20000000L, 0x00400010L, 0x20004010L };
-
-static const unsigned long SP7[64] = {
-        0x00200000L, 0x04200002L, 0x04000802L, 0x00000000L,
-        0x00000800L, 0x04000802L, 0x00200802L, 0x04200800L,
-        0x04200802L, 0x00200000L, 0x00000000L, 0x04000002L,
-        0x00000002L, 0x04000000L, 0x04200002L, 0x00000802L,
-        0x04000800L, 0x00200802L, 0x00200002L, 0x04000800L,
-        0x04000002L, 0x04200000L, 0x04200800L, 0x00200002L,
-        0x04200000L, 0x00000800L, 0x00000802L, 0x04200802L,
-        0x00200800L, 0x00000002L, 0x04000000L, 0x00200800L,
-        0x04000000L, 0x00200800L, 0x00200000L, 0x04000802L,
-        0x04000802L, 0x04200002L, 0x04200002L, 0x00000002L,
-        0x00200002L, 0x04000000L, 0x04000800L, 0x00200000L,
-        0x04200800L, 0x00000802L, 0x00200802L, 0x04200800L,
-        0x00000802L, 0x04000002L, 0x04200802L, 0x04200000L,
-        0x00200800L, 0x00000000L, 0x00000002L, 0x04200802L,
-        0x00000000L, 0x00200802L, 0x04200000L, 0x00000800L,
-        0x04000002L, 0x04000800L, 0x00000800L, 0x00200002L };
-
-static const unsigned long SP8[64] = {
-        0x10001040L, 0x00001000L, 0x00040000L, 0x10041040L,
-        0x10000000L, 0x10001040L, 0x00000040L, 0x10000000L,
-        0x00040040L, 0x10040000L, 0x10041040L, 0x00041000L,
-        0x10041000L, 0x00041040L, 0x00001000L, 0x00000040L,
-        0x10040000L, 0x10000040L, 0x10001000L, 0x00001040L,
-        0x00041000L, 0x00040040L, 0x10040040L, 0x10041000L,
-        0x00001040L, 0x00000000L, 0x00000000L, 0x10040040L,
-        0x10000040L, 0x10001000L, 0x00041040L, 0x00040000L,
-        0x00041040L, 0x00040000L, 0x10041000L, 0x00001000L,
-        0x00000040L, 0x10040040L, 0x00001000L, 0x00041040L,
-        0x10001000L, 0x00000040L, 0x10000040L, 0x10040000L,
-        0x10040040L, 0x10000000L, 0x00040000L, 0x10001040L,
-        0x00000000L, 0x10041040L, 0x00040040L, 0x10000040L,
-        0x10040000L, 0x10001000L, 0x10001040L, 0x00000000L,
-        0x10041040L, 0x00041000L, 0x00041000L, 0x00001040L,
-        0x00001040L, 0x00040040L, 0x10000000L, 0x10041000L };
-
-static void desfunc(register unsigned long *block, register unsigned long *keys)
-{
-        register unsigned long fval, work, right, leftt;
-        register int round;
-
-        leftt = block[0];
-        right = block[1];
-        work = ((leftt >> 4) ^ right) & 0x0f0f0f0fL;
-        right ^= work;
-        leftt ^= (work << 4);
-        work = ((leftt >> 16) ^ right) & 0x0000ffffL;
-        right ^= work;
-        leftt ^= (work << 16);
-        work = ((right >> 2) ^ leftt) & 0x33333333L;
-        leftt ^= work;
-        right ^= (work << 2);
-        work = ((right >> 8) ^ leftt) & 0x00ff00ffL;
-        leftt ^= work;
-        right ^= (work << 8);
-        right = ((right << 1) | ((right >> 31) & 1L)) & 0xffffffffL;
-        work = (leftt ^ right) & 0xaaaaaaaaL;
-        leftt ^= work;
-        right ^= work;
-        leftt = ((leftt << 1) | ((leftt >> 31) & 1L)) & 0xffffffffL;
-
-        for( round = 0; round < 8; round++ ) {
-                work  = (right << 28) | (right >> 4);
-                work ^= *keys++;
-                fval  = SP7[ work		 & 0x3fL];
-                fval |= SP5[(work >>  8) & 0x3fL];
-                fval |= SP3[(work >> 16) & 0x3fL];
-                fval |= SP1[(work >> 24) & 0x3fL];
-                work  = right ^ *keys++;
-                fval |= SP8[ work		 & 0x3fL];
-                fval |= SP6[(work >>  8) & 0x3fL];
-                fval |= SP4[(work >> 16) & 0x3fL];
-                fval |= SP2[(work >> 24) & 0x3fL];
-                leftt ^= fval;
-                work  = (leftt << 28) | (leftt >> 4);
-                work ^= *keys++;
-                fval  = SP7[ work		 & 0x3fL];
-                fval |= SP5[(work >>  8) & 0x3fL];
-                fval |= SP3[(work >> 16) & 0x3fL];
-                fval |= SP1[(work >> 24) & 0x3fL];
-                work  = leftt ^ *keys++;
-                fval |= SP8[ work		 & 0x3fL];
-                fval |= SP6[(work >>  8) & 0x3fL];
-                fval |= SP4[(work >> 16) & 0x3fL];
-                fval |= SP2[(work >> 24) & 0x3fL];
-                right ^= fval;
-                }
-
-        right = (right << 31) | (right >> 1);
-        work = (leftt ^ right) & 0xaaaaaaaaL;
-        leftt ^= work;
-        right ^= work;
-        leftt = (leftt << 31) | (leftt >> 1);
-        work = ((leftt >> 8) ^ right) & 0x00ff00ffL;
-        right ^= work;
-        leftt ^= (work << 8);
-        work = ((leftt >> 2) ^ right) & 0x33333333L;
-        right ^= work;
-        leftt ^= (work << 2);
-        work = ((right >> 16) ^ leftt) & 0x0000ffffL;
-        leftt ^= work;
-        right ^= (work << 16);
-        work = ((right >> 4) ^ leftt) & 0x0f0f0f0fL;
-        leftt ^= work;
-        right ^= (work << 4);
-        *block++ = right;
-        *block = leftt;
-        return;
-        }
-
-/* Validation sets:
- *
- * Single-length key, single-length plaintext -
- * Key	  : 0123 4567 89ab cdef
- * Plain  : 0123 4567 89ab cde7
- * Cipher : c957 4425 6a5e d31d
- *
- * Double-length key, single-length plaintext -
- * Key	  : 0123 4567 89ab cdef fedc ba98 7654 3210
- * Plain  : 0123 4567 89ab cde7
- * Cipher : 7f1d 0a77 826b 8aff
- *
- * Double-length key, double-length plaintext -
- * Key	  : 0123 4567 89ab cdef fedc ba98 7654 3210
- * Plain  : 0123 4567 89ab cdef 0123 4567 89ab cdff
- * Cipher : 27a0 8440 406a df60 278f 47cf 42d6 15d7
- *
- * Triple-length key, single-length plaintext -
- * Key	  : 0123 4567 89ab cdef fedc ba98 7654 3210 89ab cdef 0123 4567
- * Plain  : 0123 4567 89ab cde7
- * Cipher : de0b 7c06 ae5e 0ed5
- *
- * Triple-length key, double-length plaintext -
- * Key	  : 0123 4567 89ab cdef fedc ba98 7654 3210 89ab cdef 0123 4567
- * Plain  : 0123 4567 89ab cdef 0123 4567 89ab cdff
- * Cipher : ad0d 1b30 ac17 cf07 0ed1 1c63 81e4 4de5
- *
- * d3des V5.0a rwo 9208.07 18:44 Graven Imagery
- **********************************************************************/
diff --git a/crypto/meson.build b/crypto/meson.build
index 7cbf1a6ba7..b384ca8b57 100644
--- a/crypto/meson.build
+++ b/crypto/meson.build
@@ -5,7 +5,6 @@ crypto_ss.add(files(
   'block-qcow.c',
   'block.c',
   'cipher.c',
-  'desrfb.c',
   'hash.c',
   'hmac.c',
   'ivgen-essiv.c',
-- 
2.31.1


