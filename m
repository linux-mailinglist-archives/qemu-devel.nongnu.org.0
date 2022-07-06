Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6075456933B
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:24:23 +0200 (CEST)
Received: from localhost ([::1]:54660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9BZO-0002t3-Dm
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:24:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLt-0000Vz-1O; Wed, 06 Jul 2022 16:10:29 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLq-0003WU-6E; Wed, 06 Jul 2022 16:10:24 -0400
Received: by mail-vk1-xa35.google.com with SMTP id j26so7913846vki.12;
 Wed, 06 Jul 2022 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rpaBNNnsqr6/9XJag2Swa3LPw8pSQGCLjPewQUFs3o=;
 b=NralfNtsmmofJUP1A6wY3h14UVymhAcelU7a7oQs+hAajQqGYxTb6znpX0ROzwVqER
 kRMc2RSTXWLwjZDuI/JoJz/tVaWRr9qGK0Sb2wIEmQ515Dveh5EJxnnFG7GoF1vKKqo5
 iXAF/IUIVe2i6UYuyALZ5P1NavP9By0Ur4wXFIHl7zWSDGNJcOnYIsFn0VAhifhQ23zX
 qnHpZqcHup8PIf46IecAUppJsmPEZTLKv5nYEBZzsp52cXC3Dmpgwge3HfKCx6rclKtS
 8yj7mUSFDVu4TDdaYFZQ5mYIAuQhET+iip4j9Hi2CbBXc2ZRzg2cKeqK9j70B0JtFcBB
 aOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+rpaBNNnsqr6/9XJag2Swa3LPw8pSQGCLjPewQUFs3o=;
 b=WbAfj9WvOihdDYkyICn4hw0qN987INbGevKD2ce2fG6irchzpCY2MATn+XXP29nEyw
 2J8WkSzW+rLVurzVp5trfFTwuyMzVfycC1aY7UJ5kPoQkJifuJ0QIj72+XaV8/F6iOAZ
 2DNBZQJsSxTLJGJxMPLKnINfpIkXC4kXSQN8G6jWd5pGu62U88yD2ZSwHlfV0AUGi5dl
 kBMaJHyxgJkmLkV45THLsiqmf8sOFT9LGyPwA6RhcVULlXo1O7nS70AVkLqfOda4+t1E
 xvXUO7vW3sdv7d6kcpLLrjcBzwWs44fsoXh/YxDnsTpNJGCbAKl7J6zDyFvy3p7pXoGh
 q0Ig==
X-Gm-Message-State: AJIora8fAXY47YkAG9pNo0/iO8Ngir8kOYuvqPlT2OYM0Gwedlu+wMWk
 VHoTdl6SVTXpTxZhFC20UoxIkUxiJQg=
X-Google-Smtp-Source: AGRyM1ua/q+klXp9II7X3o2v72t+7MB6Ta3QHiUH47eMabBbkkm3cNhFxK8g/v6Gq6mduZLLCgC9eg==
X-Received: by 2002:a05:6122:1697:b0:370:12fb:c2de with SMTP id
 23-20020a056122169700b0037012fbc2demr25026713vkl.5.1657138218696; 
 Wed, 06 Jul 2022 13:10:18 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 14/34] target/ppc: use int128.h methods in vaddecuq and vaddeuqm
Date: Wed,  6 Jul 2022 17:09:26 -0300
Message-Id: <20220706200946.471114-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa35.google.com
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

And also move the insns to decodetree and remove the now unused
avr_qw_addc method.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  4 +--
 target/ppc/insn32.decode            |  3 ++
 target/ppc/int_helper.c             | 53 +++++------------------------
 target/ppc/translate/vmx-impl.c.inc |  7 ++--
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 5 files changed, 17 insertions(+), 51 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index c6fbe4b6da..f699adbedc 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -205,8 +205,8 @@ DEF_HELPER_FLAGS_5(vsububs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuhs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_4(vaddecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_4(vaddeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index d6bfc2c768..139aa3caeb 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -552,6 +552,9 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
 
 VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 
+VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
+VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
+
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
 VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 7de69f00b5..ecfe413ae1 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2212,16 +2212,6 @@ static void avr_qw_add(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
                      (~a.VsrD(1) < b.VsrD(1));
 }
 
-static int avr_qw_addc(ppc_avr_t *t, ppc_avr_t a, ppc_avr_t b)
-{
-    ppc_avr_t not_a;
-    t->VsrD(1) = a.VsrD(1) + b.VsrD(1);
-    t->VsrD(0) = a.VsrD(0) + b.VsrD(0) +
-                     (~a.VsrD(1) < b.VsrD(1));
-    avr_qw_not(&not_a, a);
-    return avr_qw_cmpu(not_a, b) < 0;
-}
-
 #endif
 
 void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
@@ -2229,23 +2219,10 @@ void helper_VADDUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
     r->s128 = int128_add(a->s128, b->s128);
 }
 
-void helper_vaddeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
+void helper_VADDEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
-#ifdef CONFIG_INT128
-    r->u128 = a->u128 + b->u128 + (c->u128 & 1);
-#else
-
-    if (c->VsrD(1) & 1) {
-        ppc_avr_t tmp;
-
-        tmp.VsrD(0) = 0;
-        tmp.VsrD(1) = c->VsrD(1) & 1;
-        avr_qw_add(&tmp, *a, tmp);
-        avr_qw_add(r, tmp, *b);
-    } else {
-        avr_qw_add(r, *a, *b);
-    }
-#endif
+    r->s128 = int128_add(int128_add(a->s128, b->s128),
+                         int128_make64(int128_getlo(c->s128) & 1));
 }
 
 void helper_vaddcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
@@ -2262,30 +2239,18 @@ void helper_vaddcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #endif
 }
 
-void helper_vaddecuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
+void helper_VADDECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
-#ifdef CONFIG_INT128
-    int carry_out = (~a->u128 < b->u128);
-    if (!carry_out && (c->u128 & 1)) {
-        carry_out = ((a->u128 + b->u128 + 1) == 0) &&
-                    ((a->u128 != 0) || (b->u128 != 0));
-    }
-    r->u128 = carry_out;
-#else
-
-    int carry_in = c->VsrD(1) & 1;
-    int carry_out = 0;
-    ppc_avr_t tmp;
-
-    carry_out = avr_qw_addc(&tmp, *a, *b);
+    bool carry_out = int128_ult(int128_not(a->s128), b->s128),
+         carry_in = int128_getlo(c->s128) & 1;
 
     if (!carry_out && carry_in) {
-        ppc_avr_t one = QW_ONE;
-        carry_out = avr_qw_addc(&tmp, tmp, one);
+        carry_out = (int128_nz(a->s128) || int128_nz(b->s128)) &&
+                    int128_eq(int128_add(a->s128, b->s128), int128_makes64(-1));
     }
+
     r->VsrD(0) = 0;
     r->VsrD(1) = carry_out;
-#endif
 }
 
 void helper_vsubuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 3fb48404d9..4ec6b841b3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1235,10 +1235,6 @@ GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
 GEN_VXFORM(vaddcuq, 0, 5);
-GEN_VXFORM3(vaddeuqm, 30, 0);
-GEN_VXFORM3(vaddecuq, 30, 0);
-GEN_VXFORM_DUAL(vaddeuqm, PPC_NONE, PPC2_ALTIVEC_207, \
-            vaddecuq, PPC_NONE, PPC2_ALTIVEC_207)
 GEN_VXFORM(vsubuqm, 0, 20);
 GEN_VXFORM(vsubcuq, 0, 21);
 GEN_VXFORM3(vsubeuqm, 31, 0);
@@ -2571,6 +2567,9 @@ static bool do_va_helper(DisasContext *ctx, arg_VA *a,
     return true;
 }
 
+TRANS_FLAGS2(ALTIVEC_207, VADDECUQ, do_va_helper, gen_helper_VADDECUQ)
+TRANS_FLAGS2(ALTIVEC_207, VADDEUQM, do_va_helper, gen_helper_VADDEUQM)
+
 TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
 TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
 
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 065b0ba414..f8a512f920 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -127,7 +127,6 @@ GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
 GEN_VXFORM_207(vaddcuq, 0, 5),
-GEN_VXFORM_DUAL(vaddeuqm, vaddecuq, 30, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.36.1


