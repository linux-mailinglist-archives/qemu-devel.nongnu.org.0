Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2956935E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:34:11 +0200 (CEST)
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bir-0002a5-QF
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLw-0000WL-DR; Wed, 06 Jul 2022 16:10:34 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:38443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLu-0003Z4-Lx; Wed, 06 Jul 2022 16:10:28 -0400
Received: by mail-vk1-xa36.google.com with SMTP id j15so7938563vkp.5;
 Wed, 06 Jul 2022 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VCQuqi8rZ7hSfQwBwlYKCRLTvDloV/rmXgk2WSQVgHQ=;
 b=fxoZthQh05TJ1VbXeqDtr+TF4FjQ5v18MFgwAXtDbtPPhAe1qUp3qNjhuzsPkvuvgN
 ouuHEtIW3nH34JZi2JirByN1fEQDIo8qCf4t8PHXvPklWv5cEgGwZ2C1PXNaJhVBYvKH
 koBEhV9ve/NK0lCM2Nr8XCcnFqBBvUaIZSaPqu78+GsPACDvQKDDBjh2ntxmJplGlwgl
 6qycfm1OCiK7zt/G5UPz4T3nFQS9Aylr/Zh1zZ4baZaK4tUoFMZgVNp8B8SR7Qkfv+BD
 hXvU3VY30M4qXJXEvFjXRsVKoOwHXnCi7xN34QOtebdg3fiXzehCE1VdV9zUhFXKeZdh
 Fnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VCQuqi8rZ7hSfQwBwlYKCRLTvDloV/rmXgk2WSQVgHQ=;
 b=4mZ8jwNijSnl250I9fSsTx4/XYfp5J4livzc/ECc76VS3hn3fFvR2ze31P8lap7w9k
 WWC/Du9mkj4SbunpyS3i2OCe9q6Q6Pv1aGyJbE1+zQBaK18sSBCmgnNpmJemJY/aZgvR
 7yQf0p1pAN7dq0dS9HRrG+0+aK8eFO3ksAI922JyMLUlwvU0TtkqvPdHlGjaEAQDYeis
 d9V452Y4zfBWYZ1iEjGlYnvLYY3rGnEurLgvN4nS0dIT/2S8tQxzPlI1yIABcpKRyiWI
 j7hpT1ajHcIr1Wu7HjgXLIk+ah4GgMNm3avQcDfG1STjTfYJd3zu7ENksDfUAQViYI8a
 UTAw==
X-Gm-Message-State: AJIora92FZuR9KovaQWT3BwnrrAXKCUyHTfgGq04ExMQXltyUmdEZvpV
 eJBi9DnOITDyOiuavBLH29gg/lNAE28=
X-Google-Smtp-Source: AGRyM1tHwaCcIWNax7V0ohsZLfv/w/Ghp5+Ce4r26UghRhYXXJUy1VFO/OX+IxrDVp7ybg4+Avf0uA==
X-Received: by 2002:a1f:9d8d:0:b0:36c:99e3:9c34 with SMTP id
 g135-20020a1f9d8d000000b0036c99e39c34mr24839496vke.10.1657138224538; 
 Wed, 06 Jul 2022 13:10:24 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 17/34] target/ppc: use int128.h methods in vsubecuq and vsubeuqm
Date: Wed,  6 Jul 2022 17:09:29 -0300
Message-Id: <20220706200946.471114-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa36.google.com
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

And also move the insns to decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-7-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  4 +--
 target/ppc/insn32.decode            |  3 +++
 target/ppc/int_helper.c             | 38 +++++++----------------------
 target/ppc/translate/vmx-impl.c.inc |  7 +++---
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 5 files changed, 17 insertions(+), 36 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 1c02ad85e5..04ced6ef70 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -209,8 +209,8 @@ DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VSUBUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VSUBECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VSUBEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsldoi, TCG_CALL_NO_RWG, void, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_3(vextractub, TCG_CALL_NO_RWG, void, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index a8d3a5a8a1..5e6f3b668e 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -558,6 +558,9 @@ VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
 VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
 
+VSUBECUQ        000100 ..... ..... ..... ..... 111111   @VA
+VSUBEUQM        000100 ..... ..... ..... ..... 111110   @VA
+
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
 VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 159b831d97..a93398fde4 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2244,20 +2244,10 @@ void helper_VSUBUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     r->s128 = int128_sub(a->s128, b->s128);
 }
 
-void helper_vsubeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
+void helper_VSUBEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
-#ifdef CONFIG_INT128
-    r->u128 = a->u128 + ~b->u128 + (c->u128 & 1);
-#else
-    ppc_avr_t tmp, sum;
-
-    avr_qw_not(&tmp, *b);
-    avr_qw_add(&sum, *a, tmp);
-
-    tmp.VsrD(0) = 0;
-    tmp.VsrD(1) = c->VsrD(1) & 1;
-    avr_qw_add(r, sum, tmp);
-#endif
+    r->s128 = int128_add(int128_add(a->s128, int128_not(b->s128)),
+                         int128_make64(int128_getlo(c->s128) & 1));
 }
 
 void helper_vsubcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
@@ -2278,25 +2268,15 @@ void helper_vsubcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #endif
 }
 
-void helper_vsubecuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
+void helper_VSUBECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
-#ifdef CONFIG_INT128
-    r->u128 =
-        (~a->u128 < ~b->u128) ||
-        ((c->u128 & 1) && (a->u128 + ~b->u128 == (__uint128_t)-1));
-#else
-    int carry_in = c->VsrD(1) & 1;
-    int carry_out = (avr_qw_cmpu(*a, *b) > 0);
-    if (!carry_out && carry_in) {
-        ppc_avr_t tmp;
-        avr_qw_not(&tmp, *b);
-        avr_qw_add(&tmp, *a, tmp);
-        carry_out = ((tmp.VsrD(0) == -1ull) && (tmp.VsrD(1) == -1ull));
-    }
+    Int128 tmp = int128_not(b->s128);
+    bool carry_out = int128_ult(int128_not(a->s128), tmp),
+         carry_in = int128_getlo(c->s128) & 1;
 
+    r->VsrD(1) = carry_out || (carry_in && int128_eq(int128_add(a->s128, tmp),
+                                                     int128_makes64(-1)));
     r->VsrD(0) = 0;
-    r->VsrD(1) = carry_out;
-#endif
 }
 
 #define BCD_PLUS_PREF_1 0xC
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 1e665534c3..671992f7d1 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1235,10 +1235,6 @@ GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
 GEN_VXFORM(vsubcuq, 0, 21);
-GEN_VXFORM3(vsubeuqm, 31, 0);
-GEN_VXFORM3(vsubecuq, 31, 0);
-GEN_VXFORM_DUAL(vsubeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
-            vsubecuq, PPC_NONE, PPC2_ALTIVEC_207)
 GEN_VXFORM_TRANS(vsl, 2, 7);
 GEN_VXFORM_TRANS(vsr, 2, 11);
 GEN_VXFORM_ENV(vpkuhum, 7, 0);
@@ -2568,6 +2564,9 @@ static bool do_va_helper(DisasContext *ctx, arg_VA *a,
 TRANS_FLAGS2(ALTIVEC_207, VADDECUQ, do_va_helper, gen_helper_VADDECUQ)
 TRANS_FLAGS2(ALTIVEC_207, VADDEUQM, do_va_helper, gen_helper_VADDEUQM)
 
+TRANS_FLAGS2(ALTIVEC_207, VSUBEUQM, do_va_helper, gen_helper_VSUBEUQM)
+TRANS_FLAGS2(ALTIVEC_207, VSUBECUQ, do_va_helper, gen_helper_VSUBECUQ)
+
 TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
 TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
 
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 9feef9afee..9395806f3d 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -128,7 +128,6 @@ GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM_300(bcdtrunc, 0, 20),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
-GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM(vsl, 2, 7),
 GEN_VXFORM(vsr, 2, 11),
 GEN_VXFORM(vpkuhum, 7, 0),
-- 
2.36.1


