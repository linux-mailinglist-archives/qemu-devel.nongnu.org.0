Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB16569348
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:26:03 +0200 (CEST)
Received: from localhost ([::1]:57070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bb0-0004ZN-RR
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLt-0000W0-5R; Wed, 06 Jul 2022 16:10:29 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:38555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLq-0003Xh-VG; Wed, 06 Jul 2022 16:10:24 -0400
Received: by mail-ua1-x934.google.com with SMTP id j6so4861242uae.5;
 Wed, 06 Jul 2022 13:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F73l7H0qOOA905gw+ufGvkNYklSqioAsWa74+yYOp8A=;
 b=ZPY4c8r/anxHddiR5z62MsuS5oJjF2tpD7gGx4xBANmEnMu9kV0qWmPede455bBRm1
 1XOfBBK1qDdmSvpz1CTIiT44fyvCAxyRmW1w/xwn7sobnvmqwOuaRViI0XIuxOUhVWeI
 gf6FFF7Q1Dv7MSMKkb3TqUZHI1uR9bupBG04N+iKkTuM4TC9n7xSX93tciW+4BP65tbD
 XrTN6rPaOEQMc2IRZlCZBfa6BDfjBWKdZrVPFdP8iIu9haCZti34awNkeJpQlrPIAdOc
 BYDc12HDmV6oXfz4dlvAgxaXfjybWiKKl9OiR9KyYWL3dcgM3BRvmnaoZ4zPV9SSknXw
 w5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F73l7H0qOOA905gw+ufGvkNYklSqioAsWa74+yYOp8A=;
 b=pxRsR/Fx0675z1TJg8zFW8oOMA4tyqy79oZ5g7tIzkSN5Gciml6G7cWZll8Htck0/2
 uhbE32d2AIyq/K/MRsy+ladl1K4tTIw5kKctxzu0FHd9OnF6xFhTM6fcpBBzKGIIMUBy
 du08W6cPOmTkhT3BZEUK58rkn1XoskFDFJ2uOVeYVg3ylCXsr2gwuJm3a6DXitNjUPQh
 ff3Pc9y3EYJ3MnBsvqTR3ug1a7TRQNtBKFvlPbPHiR4bboSR1IyTWclIEQ/A4QaBHzym
 SSSpBE6k4YJzz2HRLvLkX07xzcB6DkpdnoDNEfZlJW2DvX+zFDPRHPXrGhFCba9ielC+
 t6sw==
X-Gm-Message-State: AJIora/Ld/CjkaX8n98sa23UpkVmgQrVZsAPG6XmwrbUP37cv7wVzgRO
 yqAu+8pH6egx7CQy5eBQ176Otmfvb5s=
X-Google-Smtp-Source: AGRyM1uX/szS+gRkG2kpEqWg7jZZNrC5E+IxhO/9/cJGnZr7UGajofS9tUUw6q9oBFZssFMUmbhEZg==
X-Received: by 2002:ab0:5991:0:b0:37f:3e2c:ee5d with SMTP id
 g17-20020ab05991000000b0037f3e2cee5dmr20498568uad.34.1657138220700; 
 Wed, 06 Jul 2022 13:10:20 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:20 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 15/34] target/ppc: use int128.h methods in vaddcuq
Date: Wed,  6 Jul 2022 17:09:27 -0300
Message-Id: <20220706200946.471114-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::934;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x934.google.com
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

And also move the insn to decodetree.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-5-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  1 +
 target/ppc/int_helper.c             | 12 ++----------
 target/ppc/translate/vmx-impl.c.inc |  2 +-
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 5 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f699adbedc..f6b1b2fad2 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -207,7 +207,7 @@ DEF_HELPER_FLAGS_5(vsubuws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vaddcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 139aa3caeb..35252ddd4f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -550,6 +550,7 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
 
 ## Vector Integer Arithmetic Instructions
 
+VADDCUQ         000100 ..... ..... ..... 00101000000    @VX
 VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ecfe413ae1..279333a814 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2225,18 +2225,10 @@ void helper_VADDEUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
                          int128_make64(int128_getlo(c->s128) & 1));
 }
 
-void helper_vaddcuq(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VADDCUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-#ifdef CONFIG_INT128
-    r->u128 = (~a->u128 < b->u128);
-#else
-    ppc_avr_t not_a;
-
-    avr_qw_not(&not_a, *a);
-
+    r->VsrD(1) = int128_ult(int128_not(a->s128), b->s128);
     r->VsrD(0) = 0;
-    r->VsrD(1) = (avr_qw_cmpu(not_a, *b) < 0);
-#endif
 }
 
 void helper_VADDECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4ec6b841b3..8c0e5bcc03 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
-GEN_VXFORM(vaddcuq, 0, 5);
 GEN_VXFORM(vsubuqm, 0, 20);
 GEN_VXFORM(vsubcuq, 0, 21);
 GEN_VXFORM3(vsubeuqm, 31, 0);
@@ -3098,6 +3097,7 @@ static bool do_vx_helper(DisasContext *ctx, arg_VX *a,
     return true;
 }
 
+TRANS_FLAGS2(ALTIVEC_207, VADDCUQ, do_vx_helper, gen_helper_VADDCUQ)
 TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
 
 TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index f8a512f920..33e05929cb 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -126,7 +126,6 @@ GEN_VXFORM(vsubuws, 0, 26),
 GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_207(vaddcuq, 0, 5),
 GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.36.1


