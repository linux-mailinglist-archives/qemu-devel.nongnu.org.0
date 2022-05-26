Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6B75355FB
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:06:19 +0200 (CEST)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLcV-0001EL-2m
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCg-00020C-9z; Thu, 26 May 2022 17:39:35 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:40797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCe-0008CC-HQ; Thu, 26 May 2022 17:39:34 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-f2cd424b9cso3751848fac.7; 
 Thu, 26 May 2022 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C3ijBQSN6trWG0O+mjBr0Jm6tSXTDIuMinn/Bnh7V80=;
 b=cLc25yALY0Nf64chnzp4pCly10IT+X/626Pc0bYEkN5V7a/vNPPdMHduJ5hJGUZbOK
 9cLy1BK+mQZ73JQPpqNVQqTAwdt9NKDMaxAf65b8mRUR9pYMqaIq5R1Rn6AkZFYIx/yw
 qHadZNJQlLC9+J5i3OCejrFh70Qjy+VvPi++qYRFjmMXZPQEkvQS19X20tlZ3VQWaeBi
 EVxLKLhOOC0Ow0BAHKf6A+MFh+A58p9wVwa5y6rKNTSkBO3Hvkj4qBO90z68mJl7JdMD
 Ffq18WoYnRhPrAA9hoS0YyLUMm4Nk5QzLzOYzgMEaN7dPkWe25XCmaOwM87xR4/Djx98
 tABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C3ijBQSN6trWG0O+mjBr0Jm6tSXTDIuMinn/Bnh7V80=;
 b=lCXd3kx+6FrY4EvAQEyr5uN2v8hjOC0j7jv0HSaNyIe+LKJnWjal43Gd+2mtr6Mf5o
 KbVDcJHqBiOb24cZBBJpe7nJbsZ9jNfrzq+n14vstSJCDiPCdFSUNM2jTVVlw+B+bH5H
 JAr+OKyrYdl2A9dyagVaJOdtqiFEylU4U61kFNTqEGYmJapbQ/+h/9mPaLW/BW01ePAN
 /DsBafcKA45/MhuBC63cyxWGnweDZ1EASsVX81t6a9NuALnm1QKmtodaO0BR7DFabpRz
 sfp9fSYrW5zM0h9uoZNJdydJZFZbL96vysTA845SSbFyrr5TSc3mCvnA6Lwl216SC3Th
 fRbQ==
X-Gm-Message-State: AOAM530QK8zC9wnGqnhxbyDgrjE+8d4vlSSrof6/JgQ5UtVj5xPkYdCI
 2YcMIknhaQFxyIoseR/436CU8pfMApE=
X-Google-Smtp-Source: ABdhPJzgRtM/fOINdb9KiBSdIprpAygQ8Kq0N7EUIEKMFfIMxrUgnnXpwz8zq/V9pwwd4Y6rVgy++Q==
X-Received: by 2002:a05:6870:b3a2:b0:e9:f22:5819 with SMTP id
 w34-20020a056870b3a200b000e90f225819mr2298285oap.293.1653601171012; 
 Thu, 26 May 2022 14:39:31 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 21/34] target/ppc: declare vmsumuh[ms] helper with call flags
Date: Thu, 26 May 2022 18:38:02 -0300
Message-Id: <20220526213815.92701-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
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

Move vmsumuhm and vmsumuhs to decodetree, declare vmsumuhm helper with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-12-matheus.ferst@eldorado.org.br>
[danielhb: added #undef VMSUMUHM to fix ppc64 build]
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  4 ++--
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             |  5 ++---
 target/ppc/translate/vmx-impl.c.inc | 24 ++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  1 -
 tcg/ppc/tcg-target.c.inc            |  1 +
 6 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f0761fe38d..5127851f2c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -242,8 +242,8 @@ DEF_HELPER_4(vpkudum, void, env, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vpkpx, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsumuhm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsumuhs, void, env, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshm, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmsumshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index fdb8d76456..43ea03c3e7 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -601,6 +601,8 @@ VMULLD          000100 ..... ..... ..... 00111001001    @VX
 
 VMSUMUBM        000100 ..... ..... ..... ..... 100100   @VA
 VMSUMMBM        000100 ..... ..... ..... ..... 100101   @VA
+VMSUMUHM        000100 ..... ..... ..... ..... 100110   @VA
+VMSUMUHS        000100 ..... ..... ..... ..... 100111   @VA
 
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 85a7442103..9285a1c2a1 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -942,8 +942,7 @@ void helper_VMSUMUBM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     }
 }
 
-void helper_vmsumuhm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
-                     ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMSUMUHM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     uint32_t prod[8];
     int i;
@@ -957,7 +956,7 @@ void helper_vmsumuhm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmsumuhs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMSUMUHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                      ppc_avr_t *b, ppc_avr_t *c)
 {
     uint32_t prod[8];
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 4cbd724641..da81296b96 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2587,11 +2587,31 @@ static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
     return true;
 }
 
-GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19)
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
-
 TRANS_FLAGS(ALTIVEC, VMSUMUBM, do_va_helper, gen_helper_VMSUMUBM)
 TRANS_FLAGS(ALTIVEC, VMSUMMBM, do_va_helper, gen_helper_VMSUMMBM)
+TRANS_FLAGS(ALTIVEC, VMSUMUHM, do_va_helper, gen_helper_VMSUMUHM)
+
+static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
+    void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr vrt, vra, vrb, vrc;
+    REQUIRE_VECTOR(ctx);
+
+    vrt = gen_avr_ptr(a->vrt);
+    vra = gen_avr_ptr(a->vra);
+    vrb = gen_avr_ptr(a->vrb);
+    vrc = gen_avr_ptr(a->rc);
+    gen_helper(cpu_env, vrt, vra, vrb, vrc);
+    tcg_temp_free_ptr(vrt);
+    tcg_temp_free_ptr(vra);
+    tcg_temp_free_ptr(vrb);
+    tcg_temp_free_ptr(vrc);
+
+    return true;
+}
+
+TRANS_FLAGS(ALTIVEC, VMSUMUHS, do_va_env_helper, gen_helper_VMSUMUHS)
 
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 5b85322c06..15b3e06410 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -224,7 +224,6 @@ GEN_VXFORM_UIMM(vctsxs, 5, 15),
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
     GEN_HANDLER(name0##_##name1, 0x04, opc2, 0xFF, 0x00000000, PPC_ALTIVEC)
 GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
-GEN_VAFORM_PAIRED(vmsumuhm, vmsumuhs, 19),
 GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index cfcd121f9c..fc8ae47293 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -4008,3 +4008,4 @@ void tcg_register_jit(const void *buf, size_t buf_size)
 #undef VMULOUB
 #undef VMULOUH
 #undef VMULOUW
+#undef VMSUMUHM
-- 
2.36.1


