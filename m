Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573235693E8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:09:28 +0200 (CEST)
Received: from localhost ([::1]:51596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CH1-00019f-9s
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLn-0000V4-4X; Wed, 06 Jul 2022 16:10:24 -0400
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLl-0003Vu-0m; Wed, 06 Jul 2022 16:10:18 -0400
Received: by mail-vs1-xe32.google.com with SMTP id o185so3746970vsc.7;
 Wed, 06 Jul 2022 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pgH5imCEWDP9oTFN3QxRWheG2kr63Cd3+O48n5Tun7g=;
 b=Yln+VDq4cUBA+8kDkMuv4kKA3uieIQn+o1dlRrVQnOafO5OmBXrXDyIFW8yCFQJpGJ
 aIfP5T0yjYdajQQ2rAO6qjcGX1eRTNIjkE+/mTYreNm5way6rwvVYhuWHrARbjJf7oZ3
 3ZKvovMSQ1zcitqA+0npnbodfxTebxWBTbWb0q9T4xKCxKX/i4q5Sq2YlvS0Ds1gSxUH
 8qWWfoU4MMUiHuhnI3ZmD3XaXw4fanf1AZMSs2b32Og97VrnRiS36b2uShpPhhbu2+dI
 Ly6Mx5t2p8DJAc3LNrP5j3JWb3DlQKB9M+lIxPO56ssmO5Aby59itMJFshm17FREAzqW
 d8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pgH5imCEWDP9oTFN3QxRWheG2kr63Cd3+O48n5Tun7g=;
 b=lnbMWd7hRpjgdoTkBLbEF6+j6ZsohNqSJRq9DzXl9S5G5hTvFKpF66H2h4kzTqgwxg
 wacWV7nh/fHaLi0casW7nhNMLpWf7sYU7vdFOmWox90R27U0+U4YYaF2snLMwXgIHjOr
 sXx0eulYTTbGMYzRKoNEsPUELVsX4h2Futi1EhF/p9JrbEiWF5HO50I+3RjFIzLHm2Ku
 6B1qZXk1cpYOMZdUTUq7ctjhHZandcT41U0/EYS5y7+FJ1mH6vGEmAN093JA9U3X/CgJ
 8DkqyMAuTcPxa5lDao0c86qVXPz9dzTzR4opZJ2+a8gUSHrLjv4ErdKpQnHzsDyQhAkd
 0LRg==
X-Gm-Message-State: AJIora8vEE9a2860IVqdj97ct5FuIr09MqJPPuxhpZ9xNMhugnTL4SlW
 uhUdy5rsqXFUgz/qKK4Btcg5t16qYNk=
X-Google-Smtp-Source: AGRyM1uuP4a1DGp9hi5/wkbYHwC52kQXgaHKulSxYdQeT6b9SQOEs7eVrOq6MMZTOYdLOqbdPy0ZOg==
X-Received: by 2002:a05:6102:3592:b0:354:38b3:fff6 with SMTP id
 h18-20020a056102359200b0035438b3fff6mr23676425vsu.38.1657138214656; 
 Wed, 06 Jul 2022 13:10:14 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 12/34] target/ppc: use int128.h methods in vpmsumd
Date: Wed,  6 Jul 2022 17:09:24 -0300
Message-Id: <20220706200946.471114-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e32;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe32.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Also drop VECTOR_FOR_INORDER_I usage since there is no need to access
the elements in any particular order, and move the instruction to
decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-2-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  4 +++
 target/ppc/int_helper.c             | 48 ++++++-----------------------
 target/ppc/translate/vmx-impl.c.inc |  3 +-
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 5 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d627cfe6ed..39ad114c97 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -318,7 +318,7 @@ DEF_HELPER_FLAGS_3(vbpermq, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpmsumb, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpmsumh, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpmsumw, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vpmsumd, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VPMSUMD, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_2(vextublx, TCG_CALL_NO_RWG, tl, tl, avr)
 DEF_HELPER_FLAGS_2(vextuhlx, TCG_CALL_NO_RWG, tl, tl, avr)
 DEF_HELPER_FLAGS_2(vextuwlx, TCG_CALL_NO_RWG, tl, tl, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6ea48d5163..0772729c6e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -426,6 +426,10 @@ DSCLIQ          111111 ..... ..... ...... 001000010 .   @Z22_tap_sh_rc
 DSCRI           111011 ..... ..... ...... 001100010 .   @Z22_ta_sh_rc
 DSCRIQ          111111 ..... ..... ...... 001100010 .   @Z22_tap_sh_rc
 
+## Vector Exclusive-OR-based Instructions
+
+VPMSUMD         000100 ..... ..... ..... 10011001000    @VX
+
 ## Vector Integer Instructions
 
 VCMPEQUB        000100 ..... ..... ..... . 0000000110   @VC
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 3ae03f73d3..1476e51651 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1484,52 +1484,24 @@ PMSUM(vpmsumb, u8, u16, uint16_t)
 PMSUM(vpmsumh, u16, u32, uint32_t)
 PMSUM(vpmsumw, u32, u64, uint64_t)
 
-void helper_vpmsumd(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VPMSUMD(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-
-#ifdef CONFIG_INT128
     int i, j;
-    __uint128_t prod[2];
-
-    VECTOR_FOR_INORDER_I(i, u64) {
-        prod[i] = 0;
-        for (j = 0; j < 64; j++) {
-            if (a->u64[i] & (1ull << j)) {
-                prod[i] ^= (((__uint128_t)b->u64[i]) << j);
+    Int128 tmp, prod[2] = {int128_zero(), int128_zero()};
+
+    for (j = 0; j < 64; j++) {
+        for (i = 0; i < ARRAY_SIZE(r->u64); i++) {
+            if (a->VsrD(i) & (1ull << j)) {
+                tmp = int128_make64(b->VsrD(i));
+                tmp = int128_lshift(tmp, j);
+                prod[i] = int128_xor(prod[i], tmp);
             }
         }
     }
 
-    r->u128 = prod[0] ^ prod[1];
-
-#else
-    int i, j;
-    ppc_avr_t prod[2];
-
-    VECTOR_FOR_INORDER_I(i, u64) {
-        prod[i].VsrD(1) = prod[i].VsrD(0) = 0;
-        for (j = 0; j < 64; j++) {
-            if (a->u64[i] & (1ull << j)) {
-                ppc_avr_t bshift;
-                if (j == 0) {
-                    bshift.VsrD(0) = 0;
-                    bshift.VsrD(1) = b->u64[i];
-                } else {
-                    bshift.VsrD(0) = b->u64[i] >> (64 - j);
-                    bshift.VsrD(1) = b->u64[i] << j;
-                }
-                prod[i].VsrD(1) ^= bshift.VsrD(1);
-                prod[i].VsrD(0) ^= bshift.VsrD(0);
-            }
-        }
-    }
-
-    r->VsrD(1) = prod[0].VsrD(1) ^ prod[1].VsrD(1);
-    r->VsrD(0) = prod[0].VsrD(0) ^ prod[1].VsrD(0);
-#endif
+    r->s128 = int128_xor(prod[0], prod[1]);
 }
 
-
 #if HOST_BIG_ENDIAN
 #define PKBIG 1
 #else
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 0b563bed37..4c2a36405b 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2717,7 +2717,6 @@ GEN_VXFORM_TRANS(vgbbd, 6, 20);
 GEN_VXFORM(vpmsumb, 4, 16)
 GEN_VXFORM(vpmsumh, 4, 17)
 GEN_VXFORM(vpmsumw, 4, 18)
-GEN_VXFORM(vpmsumd, 4, 19)
 
 #define GEN_BCD(op)                                 \
 static void gen_##op(DisasContext *ctx)             \
@@ -3101,6 +3100,8 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
     return true;
 }
 
+TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
+
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
                          void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index d7cc57868e..26c1d957ee 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -237,7 +237,6 @@ GEN_VXFORM_207(vgbbd, 6, 20),
 GEN_VXFORM_207(vpmsumb, 4, 16),
 GEN_VXFORM_207(vpmsumh, 4, 17),
 GEN_VXFORM_207(vpmsumw, 4, 18),
-GEN_VXFORM_207(vpmsumd, 4, 19),
 
 GEN_VXFORM_207(vsbox, 4, 23),
 
-- 
2.36.1


