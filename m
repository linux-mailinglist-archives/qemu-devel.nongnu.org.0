Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C056117CF
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:43:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQK-00034c-9w; Fri, 28 Oct 2022 12:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPL-0004qM-KK; Fri, 28 Oct 2022 12:40:35 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPI-0007rE-Om; Fri, 28 Oct 2022 12:40:35 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13b103a3e5dso6882824fac.2; 
 Fri, 28 Oct 2022 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bSVbVqUMoWrvzA/qTO3qCVq0+/JX/NUAzKxWg8pgStg=;
 b=hHVnd5YWjwYdViovze6elUw9bgyhvRPS7zdAX6Dj/jG1ZxZ7gIbb2KRVf7AiYL9k9h
 7jo3nxC/IGCY91yclFE/9YqO/5kgFbNqcS17dex66rd6d4iTwRx0qq+/DJNAPvTPdNjo
 js/G5CbfBghCsyHvx83WtgiZH9L1B7lRYnMFTpTXylLtLvCky/NVshl9HeDqDPlNDFlk
 LpEHdJJ/Ymgxiur64dNxjZFeDYpiAi/3UEXeH2jYeRALgrhZPjvloCQJHUiA+O6D4j1V
 zoN69oLEQm7JQLK9+TfwnBPSgOsV1lOD4pUthqff17t8cF/CmnbsEvdpS62vzjQttKN7
 EJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bSVbVqUMoWrvzA/qTO3qCVq0+/JX/NUAzKxWg8pgStg=;
 b=SkE7gbYNwC/uFtycUsOZtgz/xdgOX+l2TXVeQLRV/sDwsgDmzOrRZPvA4kR0IDlsIu
 tB9cZ1JpwQKyKrGjBkL5x/c/LAofHhv/uq63hoiYiihD+P4iBbqQN4lzWK7LXYf5efxb
 MLMjT+oQhigIdpMgXwnpRuIefLtjiZxXsPMP20YEdzemie1YDDe3jKAg3dye2l4+r6HY
 xYZJVAihX9e1lLeQo6DvAWkslesxG+ibSILS3jPGreQRuEyi+U1A0klSPIa2pqK/Ef4p
 LnCxrGe3tBRh6oKII4UFzXcGogfo+rYKIANbq96FqWzBDQNc1LwjzBvyXcMXO89I6v3q
 zSYA==
X-Gm-Message-State: ACrzQf3gP7rUKDUx4nFetaPUxa+W/VNPtYjT3pRbRQmLJSde6S9pkiTa
 FEBXjKnWM8jSURMbMm0ARdPrY4ni8+ishA==
X-Google-Smtp-Source: AMsMyM4HzQ14TUxoJ4OTHpwp/VyDLrBsYtE1HA6ux72t+OU7nOXBhBUs2+ZrbShGyMCzlU6kLpobpw==
X-Received: by 2002:a05:6870:4195:b0:13c:8f93:8517 with SMTP id
 y21-20020a056870419500b0013c8f938517mr7175oac.147.1666975231072; 
 Fri, 28 Oct 2022 09:40:31 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 07/62] target/ppc: Moved VMLADDUHM to decodetree and use gvec
Date: Fri, 28 Oct 2022 13:38:56 -0300
Message-Id: <20221028163951.810456-8-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

This patch moves VMLADDUHM to decodetree a creates a gvec implementation
using mul_vec and add_vec.

rept    loop    master             patch
8       12500   0,01810500         0,00903100 (-50.1%)
25      4000    0,01739400         0,00747700 (-57.0%)
100     1000    0,01843600         0,00901400 (-51.1%)
500     200     0,02574600         0,01971000 (-23.4%)
2500    40      0,05921600         0,07121800 (+20.3%)
8000    12      0,15326700         0,21725200 (+41.7%)

The significant difference in performance when REPT is low and LOOP is
high I think is due to the fact that the new implementation has a higher
translation time, as when using a helper only 5 TCGop are used but with
the patch a total of 10 TCGop are needed (Power lacks a direct mul_vec
equivalent so this instruction is implemented with the help of 5 others,
vmuleu, vmulou, vmrgh, vmrgl and vpkum).

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-2-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  2 ++
 target/ppc/int_helper.c             |  3 +-
 target/ppc/translate.c              |  1 -
 target/ppc/translate/vmx-impl.c.inc | 48 ++++++++++++++++++-----------
 5 files changed, 35 insertions(+), 21 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57eee07256..9c562ab00e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -264,7 +264,7 @@ DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMSHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMSHS, void, env, avr, avr, avr, avr)
-DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_5(VMLADDUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_2(mtvscr, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_1(mfvscr, TCG_CALL_NO_RWG, i32, env)
 DEF_HELPER_3(lvebx, void, env, avr, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 70a3b4de5e..9ba1689230 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -693,6 +693,8 @@ VMSUMUHS        000100 ..... ..... ..... ..... 100111   @VA
 VMSUMCUD        000100 ..... ..... ..... ..... 010111   @VA
 VMSUMUDM        000100 ..... ..... ..... ..... 100011   @VA
 
+VMLADDUHM       000100 ..... ..... ..... ..... 100010   @VA
+
 ## Vector String Instructions
 
 VSTRIBL         000100 ..... 00000 ..... . 0000001101   @VX_tb_rc
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 696096100b..0d25000b2a 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -974,7 +974,8 @@ void helper_vmhraddshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmladduhm(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMLADDUHM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c,
+                      uint32_t v)
 {
     int i;
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 959e7e3475..58fbc15954 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -6855,7 +6855,6 @@ GEN_HANDLER(lvsl, 0x1f, 0x06, 0x00, 0x00000001, PPC_ALTIVEC),
 GEN_HANDLER(lvsr, 0x1f, 0x06, 0x01, 0x00000001, PPC_ALTIVEC),
 GEN_HANDLER(mfvscr, 0x04, 0x2, 0x18, 0x001ff800, PPC_ALTIVEC),
 GEN_HANDLER(mtvscr, 0x04, 0x2, 0x19, 0x03ff0000, PPC_ALTIVEC),
-GEN_HANDLER(vmladduhm, 0x04, 0x11, 0xFF, 0x00000000, PPC_ALTIVEC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER_E(maddhd_maddhdu, 0x04, 0x18, 0xFF, 0x00000000, PPC_NONE,
               PPC2_ISA300),
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index e644ad3236..9f18c6d4f2 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2523,24 +2523,6 @@ static void glue(gen_, name0##_##name1)(DisasContext *ctx)              \
 
 GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16)
 
-static void gen_vmladduhm(DisasContext *ctx)
-{
-    TCGv_ptr ra, rb, rc, rd;
-    if (unlikely(!ctx->altivec_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_VPU);
-        return;
-    }
-    ra = gen_avr_ptr(rA(ctx->opcode));
-    rb = gen_avr_ptr(rB(ctx->opcode));
-    rc = gen_avr_ptr(rC(ctx->opcode));
-    rd = gen_avr_ptr(rD(ctx->opcode));
-    gen_helper_vmladduhm(rd, ra, rb, rc);
-    tcg_temp_free_ptr(ra);
-    tcg_temp_free_ptr(rb);
-    tcg_temp_free_ptr(rc);
-    tcg_temp_free_ptr(rd);
-}
-
 static bool do_va_helper(DisasContext *ctx, arg_VA *a,
     void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr, TCGv_ptr))
 {
@@ -2569,6 +2551,36 @@ TRANS_FLAGS2(ALTIVEC_207, VSUBECUQ, do_va_helper, gen_helper_VSUBECUQ)
 TRANS_FLAGS(ALTIVEC, VPERM, do_va_helper, gen_helper_VPERM)
 TRANS_FLAGS2(ISA300, VPERMR, do_va_helper, gen_helper_VPERMR)
 
+static void gen_vmladduhm_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b,
+                              TCGv_vec c)
+{
+    tcg_gen_mul_vec(vece, t, a, b);
+    tcg_gen_add_vec(vece, t, t, c);
+}
+
+static bool trans_VMLADDUHM(DisasContext *ctx, arg_VA *a)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_add_vec, INDEX_op_mul_vec, 0
+    };
+
+    static const GVecGen4 op = {
+        .fno = gen_helper_VMLADDUHM,
+        .fniv = gen_vmladduhm_vec,
+        .opt_opc = vecop_list,
+        .vece = MO_16
+    };
+
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_4(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), avr_full_offset(a->rc),
+                   16, 16, &op);
+
+    return true;
+}
+
 static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
 {
     REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
-- 
2.37.3


