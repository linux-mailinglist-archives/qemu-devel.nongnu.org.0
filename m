Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF03569429
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:19:53 +0200 (CEST)
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9CR6-0004Ly-62
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLu-0000WA-Qk; Wed, 06 Jul 2022 16:10:34 -0400
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931]:40958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BLt-0003Y9-0M; Wed, 06 Jul 2022 16:10:26 -0400
Received: by mail-ua1-x931.google.com with SMTP id r25so3959226uap.7;
 Wed, 06 Jul 2022 13:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wj7Gth1KWGwRdfwl2ug7ig7r9MuJTRddqkUvGGhuLVM=;
 b=KBjCL7MR+SVD2Ih6zlSaPJa6DB/KA0nfGECwm+TczIhQrrgdNVIUhqrbK12eW+yKPF
 3aRHg/lLPVS/k/fvdEqy+LJ7U7nA5y74fY7Zw7XaCezAO/j4UATMCkbV62dv2OAytEjz
 M4x3LLQHx9dHsHzL0rSP8byLQ8IHrdh5V2BHHu1JPLaHWMKJBqnIX6rtaUtVit3v/OJq
 96cK5/Ev08FD96hakUWXn3dTsyhcYAjeuC8sD8z5QOqhodJ+RvnCpTOAdH2QoO7F2PRI
 Gjg9x7DrnAIML1qkNlk1jpyWnXpvzT/AVFlm32qqAdihsjHImzH1kFtMqRcCIitqI5I6
 0Jhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wj7Gth1KWGwRdfwl2ug7ig7r9MuJTRddqkUvGGhuLVM=;
 b=OUXKVC8RRPrWB1q3+fmtY7Lfn6aofR7IXeDvfVP8bixYXYnrCQiCtqjkjBvwnIeM9O
 iQNYYuOOWYuk6AXdoWQS5dM9Qb2PAfVDS9c/RP4AAzGgxohgCwFoK6n9SNHnv805WoO8
 8w4Tj+mKi4BRn1o833BqVtXZFyQ6YMIFm2A0sD2kHG5/EJWWCMBCR+9KWW+4eDZbHpI7
 EBJC3CSOYjP170X+huCxSYdbDT98kgwMRCZGRahBPf818It55SVDNtUIRAdAK+gVXEMQ
 UVfEEJX6D5YX1yG9C9qeK1RFNH6AEVGrzhenXnq4A7/wclzDDUnuBURUb7Gq90cWBvSP
 REQw==
X-Gm-Message-State: AJIora/x4BuA5PO/SWHCf9F9hXPebf8SD+3m603ZWOBaNsJ/0Vaok/ig
 e+NcXaMzb7ykPk0mCp0dMAaBVM7YNFI=
X-Google-Smtp-Source: AGRyM1t/6VYXQ9PqNB7MofkYb24+GyituvyoX1fipLvB1JiE65pxafBeQQ0gydsLIt2xmIkTwgUdAA==
X-Received: by 2002:ab0:6894:0:b0:382:df7f:db89 with SMTP id
 t20-20020ab06894000000b00382df7fdb89mr2733519uar.78.1657138222624; 
 Wed, 06 Jul 2022 13:10:22 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:22 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
Subject: [PULL 16/34] target/ppc: use int128.h methods in vsubuqm
Date: Wed,  6 Jul 2022 17:09:28 -0300
Message-Id: <20220706200946.471114-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::931;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x931.google.com
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

And also move the insn to decodetree

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Message-Id: <20220606150037.338931-6-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             | 19 ++-----------------
 target/ppc/translate/vmx-impl.c.inc |  5 ++---
 target/ppc/translate/vmx-ops.c.inc  |  2 +-
 5 files changed, 8 insertions(+), 22 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f6b1b2fad2..1c02ad85e5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -208,7 +208,7 @@ DEF_HELPER_FLAGS_3(VADDUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDECUQ, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VADDEUQM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(VADDCUQ, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vsubuqm, TCG_CALL_NO_RWG, void, avr, avr, avr)
+DEF_HELPER_FLAGS_3(VSUBUQM, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubecuq, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vsubeuqm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsubcuq, TCG_CALL_NO_RWG, void, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 35252ddd4f..a8d3a5a8a1 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -556,6 +556,8 @@ VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
 VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
+VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
+
 VEXTSB2W        000100 ..... 10000 ..... 11000000010    @VX_tb
 VEXTSH2W        000100 ..... 10001 ..... 11000000010    @VX_tb
 VEXTSB2D        000100 ..... 11000 ..... 11000000010    @VX_tb
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 279333a814..159b831d97 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -2176,12 +2176,6 @@ VGENERIC_DO(popcntd, u64)
 
 #undef VGENERIC_DO
 
-#if HOST_BIG_ENDIAN
-#define QW_ONE { .u64 = { 0, 1 } }
-#else
-#define QW_ONE { .u64 = { 1, 0 } }
-#endif
-
 #ifndef CONFIG_INT128
 
 static inline void avr_qw_not(ppc_avr_t *t, ppc_avr_t a)
@@ -2245,18 +2239,9 @@ void helper_VADDECUQ(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     r->VsrD(1) = carry_out;
 }
 
-void helper_vsubuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
+void helper_VSUBUQM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
-#ifdef CONFIG_INT128
-    r->u128 = a->u128 - b->u128;
-#else
-    ppc_avr_t tmp;
-    ppc_avr_t one = QW_ONE;
-
-    avr_qw_not(&tmp, *b);
-    avr_qw_add(&tmp, *a, tmp);
-    avr_qw_add(r, tmp, one);
-#endif
+    r->s128 = int128_sub(a->s128, b->s128);
 }
 
 void helper_vsubeuqm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 8c0e5bcc03..1e665534c3 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -1234,7 +1234,6 @@ GEN_VXFORM_SAT(vsubuws, MO_32, sub, ussub, 0, 26);
 GEN_VXFORM_SAT(vsubsbs, MO_8, sub, sssub, 0, 28);
 GEN_VXFORM_SAT(vsubshs, MO_16, sub, sssub, 0, 29);
 GEN_VXFORM_SAT(vsubsws, MO_32, sub, sssub, 0, 30);
-GEN_VXFORM(vsubuqm, 0, 20);
 GEN_VXFORM(vsubcuq, 0, 21);
 GEN_VXFORM3(vsubeuqm, 31, 0);
 GEN_VXFORM3(vsubecuq, 31, 0);
@@ -2858,8 +2857,6 @@ GEN_VXFORM_DUAL(vsubuwm, PPC_ALTIVEC, PPC_NONE, \
                 bcdus, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubsbs, PPC_ALTIVEC, PPC_NONE, \
                 bcdtrunc, PPC_NONE, PPC2_ISA300)
-GEN_VXFORM_DUAL(vsubuqm, PPC2_ALTIVEC_207, PPC_NONE, \
-                bcdtrunc, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubcuq, PPC2_ALTIVEC_207, PPC_NONE, \
                 bcdutrunc, PPC_NONE, PPC2_ISA300)
 
@@ -3102,6 +3099,8 @@ TRANS_FLAGS2(ALTIVEC_207, VADDUQM, do_vx_helper, gen_helper_VADDUQM)
 
 TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 
+TRANS_FLAGS2(ALTIVEC_207, VSUBUQM, do_vx_helper, gen_helper_VSUBUQM)
+
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
                          void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 33e05929cb..9feef9afee 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -126,7 +126,7 @@ GEN_VXFORM(vsubuws, 0, 26),
 GEN_VXFORM_DUAL(vsubsbs, bcdtrunc, 0, 28, PPC_ALTIVEC, PPC2_ISA300),
 GEN_VXFORM(vsubshs, 0, 29),
 GEN_VXFORM_DUAL(vsubsws, xpnd04_2, 0, 30, PPC_ALTIVEC, PPC_NONE),
-GEN_VXFORM_DUAL(vsubuqm, bcdtrunc, 0, 20, PPC2_ALTIVEC_207, PPC2_ISA300),
+GEN_VXFORM_300(bcdtrunc, 0, 20),
 GEN_VXFORM_DUAL(vsubcuq, bcdutrunc, 0, 21, PPC2_ALTIVEC_207, PPC2_ISA300),
 GEN_VXFORM_DUAL(vsubeuqm, vsubecuq, 31, 0xFF, PPC_NONE, PPC2_ALTIVEC_207),
 GEN_VXFORM(vsl, 2, 7),
-- 
2.36.1


