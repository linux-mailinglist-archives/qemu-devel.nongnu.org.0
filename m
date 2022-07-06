Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D275693AB
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:54:44 +0200 (CEST)
Received: from localhost ([::1]:35132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C2k-0004aJ-J9
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMB-0000el-Nl; Wed, 06 Jul 2022 16:10:47 -0400
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36]:38443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BM4-0003Z4-9W; Wed, 06 Jul 2022 16:10:38 -0400
Received: by mail-vk1-xa36.google.com with SMTP id j15so7938759vkp.5;
 Wed, 06 Jul 2022 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJuENJl1yRB9Xp0Esi4sZj0bu46OMW6wvrgO9Eesdj8=;
 b=p9NYmwa94N3vDvFR+Tn6HoEljg5LSIyb4+g2QArbANTRjMCM6F5oRxExgYS1JO/6hC
 PXogxRR/+5ua5olpztQKTM6/tstvUVFJJo8kFtc8fE4NVzCKB64wFMDXNo8TXaPCbde4
 jJSmFAd1kOp2IRYa4PJd3pHZtNaHRcNsBS2b4ATAGskT5JpDUxQQ4j2zeZkLs3QVdwAx
 Ez3CUAxWwj9QEYLbPjWgVlLVcU7A+8KWE6P6jVFDVdMywImmytEMTZjaatwAdDCi1HDX
 MZxy0uX0mwEBWa7/+XZBK+CUASZk7GuFE5KdMMYRB9O/L/5eWp/RyamqCOr74jqIn5po
 Jw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJuENJl1yRB9Xp0Esi4sZj0bu46OMW6wvrgO9Eesdj8=;
 b=F3csaCYAkouTIJ+9stFAELHGxUrE87On/xcfh1J1x4SEmOQUfx6vzHPiRD7RtdcfiK
 LLqJx4HjyRf+GO0Ba5Rxx9Qmqs0q+i6Pkj/aO94cp1YeGle3xdRNMV7Pge9T/Vb+jO0y
 EvXWOt+IBxRUn/9UVcQIdb6LOh7QfiBOJJ5l4BwJ2xc+sNO134+PMWknO0V56CICg07c
 nDCmQ83hoWMiiQZJ+QbQPVNL0eUFm5d4rVUuk8Kivp31j+KItV0t4Hd2XPpfGQ/hhbFp
 0TLpJ2UdOZX4tX3bCHSJslT3uwXEBzD9BklZj1B08appAFND+t6Y87O/9EuSMQQ8yYoS
 I9kw==
X-Gm-Message-State: AJIora8f5t6tG9fi1gV4FeYxnq20TuoJzf5itZRzSrvex2pmIIFnvUW8
 tziFCCsW+Fjq8RuGptOJox9EKBk+sRo=
X-Google-Smtp-Source: AGRyM1vob7LYQPXwEHe6iRR9V1Mk0HzHpU75ECsnOvyWYi1MEFMs0yLnuEwWQInpUmj3KlMXsQJg+g==
X-Received: by 2002:a1f:4184:0:b0:374:469a:e51e with SMTP id
 o126-20020a1f4184000000b00374469ae51emr2031025vka.22.1657138234420; 
 Wed, 06 Jul 2022 13:10:34 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:34 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 22/34] target/ppc: Move mffscrn[i] to decodetree
Date: Wed,  6 Jul 2022 17:09:34 -0300
Message-Id: <20220706200946.471114-23-danielhb413@gmail.com>
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220629162904.105060-3-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  8 +++
 target/ppc/internal.h              |  3 --
 target/ppc/translate/fp-impl.c.inc | 83 +++++++++++++++---------------
 target/ppc/translate/fp-ops.c.inc  |  4 --
 4 files changed, 50 insertions(+), 48 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1a425ab28f..f63098d024 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -124,6 +124,9 @@
 &X_bfl          bf l:bool ra rb
 @X_bfl          ...... bf:3 . l:1 ra:5 rb:5 .......... .        &X_bfl
 
+&X_imm2         rt imm
+@X_imm2         ...... rt:5 ..... ... imm:2 .......... .        &X_imm2
+
 %x_xt           0:1 21:5
 &X_imm5         xt imm:uint8_t vrb
 @X_imm5         ...... ..... imm:5 vrb:5 .......... .           &X_imm5 xt=%x_xt
@@ -334,6 +337,11 @@ SETBCR          011111 ..... ..... ----- 0110100000 -   @X_bi
 SETNBC          011111 ..... ..... ----- 0111000000 -   @X_bi
 SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
+### Move To/From FPSCR
+
+MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+
 ### Decimal Floating-Point Arithmetic Instructions
 
 DADD            111011 ..... ..... ..... 0000000010 .   @X_rc
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 2add128cd1..467f3046c8 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -159,9 +159,6 @@ EXTRACT_HELPER(FPL, 25, 1);
 EXTRACT_HELPER(FPFLM, 17, 8);
 EXTRACT_HELPER(FPW, 16, 1);
 
-/* mffscrni */
-EXTRACT_HELPER(RM, 11, 2);
-
 /* addpcis */
 EXTRACT_HELPER_SPLIT_3(DX, 10, 6, 6, 5, 16, 1, 1, 0, 0)
 #if defined(TARGET_PPC64)
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index f9b58b844e..bcb7ec2689 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -685,71 +685,72 @@ static void gen_mffsce(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
 
-static void gen_helper_mffscrn(DisasContext *ctx, TCGv_i64 t1)
+static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
 {
-    TCGv_i64 t0 = tcg_temp_new_i64();
-    TCGv_i32 mask = tcg_const_i32(0x0001);
+    TCGv_i64 fpscr = tcg_temp_new_i64();
+    TCGv_i64 fpscr_masked = tcg_temp_new_i64();
 
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_ENABLES | FP_RN);
-    set_fpr(rD(ctx->opcode), t0);
+    tcg_gen_extu_tl_i64(fpscr, cpu_fpscr);
+    tcg_gen_andi_i64(fpscr_masked, fpscr, mask);
+    set_fpr(rt, fpscr_masked);
 
-    /* Mask FPSCR value to clear RN.  */
-    tcg_gen_andi_i64(t0, t0, ~FP_RN);
+    tcg_temp_free_i64(fpscr_masked);
 
-    /* Merge RN into FPSCR value.  */
-    tcg_gen_or_i64(t0, t0, t1);
+    return fpscr;
+}
 
-    gen_helper_store_fpscr(cpu_env, t0, mask);
+static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
+                               TCGv_i64 set_mask, uint32_t store_mask)
+{
+    TCGv_i64 fpscr_masked = tcg_temp_new_i64();
+    TCGv_i32 st_mask = tcg_constant_i32(store_mask);
 
-    tcg_temp_free_i32(mask);
-    tcg_temp_free_i64(t0);
+    tcg_gen_andi_i64(fpscr_masked, fpscr, ~clear_mask);
+    tcg_gen_or_i64(fpscr_masked, fpscr_masked, set_mask);
+    gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
+
+    tcg_temp_free_i64(fpscr_masked);
 }
 
-/* mffscrn */
-static void gen_mffscrn(DisasContext *ctx)
+static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
-    TCGv_i64 t1;
+    TCGv_i64 t1, fpscr;
 
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
-
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
-    get_fpr(t1, rB(ctx->opcode));
-    /* Mask FRB to get just RN.  */
+    get_fpr(t1, a->rb);
     tcg_gen_andi_i64(t1, t1, FP_RN);
 
-    gen_helper_mffscrn(ctx, t1);
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_RN, t1, 0x0001);
 
     tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
 }
 
-/* mffscrni */
-static void gen_mffscrni(DisasContext *ctx)
+static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
-    TCGv_i64 t1;
-
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
+    TCGv_i64 t1, fpscr;
 
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
 
-    t1 = tcg_const_i64((uint64_t)RM(ctx->opcode));
+    t1 = tcg_temp_new_i64();
+    tcg_gen_movi_i64(t1, a->imm);
 
-    gen_helper_mffscrn(ctx, t1);
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, FP_DRN | FP_ENABLES | FP_NI | FP_RN);
+    store_fpscr_masked(fpscr, FP_RN, t1, 0x0001);
 
     tcg_temp_free_i64(t1);
+    tcg_temp_free_i64(fpscr);
+
+    return true;
 }
 
 /* mtfsb0 */
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index 0538ab2d2d..a27a1be9f5 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -79,10 +79,6 @@ GEN_HANDLER_E_2(mffsce, 0x3F, 0x07, 0x12, 0x01, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
 GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
-GEN_HANDLER_E_2(mffscrn, 0x3F, 0x07, 0x12, 0x16, 0x00000000, PPC_FLOAT,
-    PPC_NONE),
-GEN_HANDLER_E_2(mffscrni, 0x3F, 0x07, 0x12, 0x17, 0x00000000, PPC_FLOAT,
-    PPC_NONE),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.36.1


