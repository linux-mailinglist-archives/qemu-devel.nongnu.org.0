Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5E6F8AEC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 23:27:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv2vJ-0000gA-NS; Fri, 05 May 2023 17:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vC-0000dN-Qi
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pv2vB-0004Qe-3c
 for qemu-devel@nongnu.org; Fri, 05 May 2023 17:24:58 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-304935cc79bso2125200f8f.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683321895; x=1685913895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ElGkLkSZPG5U6w3IO50r2nvTqh+XRQqzsanCGPviKUM=;
 b=P11v89p/kYe/QKuxd5Q+vYui7Z9Y2GSwDaurVNDl6QX0xFizo3ICsLRvRxDrjKytUT
 Iz4RpbqrucY6uKu1Inv7VQr+UiDirbHQCaLBcoZqJEy3xNyfYy1Kxkh/74l8GcW1lUgl
 r+HfgQ+REFqBYPUAzeHew0pU1Nd4lYq3FEMeOeSI9p6feHV+GQIrsrY8ck2JRgALDg0X
 rk8yLXsoSWa/5jnR3fhXaYqRBLMxH+QX4dDimHtV6NIja0mVuGvbIyZy5iPHovUPNVK2
 pQKfBuzw6AlYvYJ5NzzspCMh6UQVJ2Sh8I2ltzx6SdyTkjdrv1joGDrgPxdwFLRCyE1+
 xwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683321895; x=1685913895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElGkLkSZPG5U6w3IO50r2nvTqh+XRQqzsanCGPviKUM=;
 b=DK0YF/IxkuX2J2Bp3lg+Ks9mmlfiY2Q+b1XQWFdd2l/D+lNUk8f9ReZg92s/aPBH+4
 0aphv4lsaeZctfmVEYXQk9sT2WrJFD7Dxcq0lTyxTjUHNes7AE67OJKH+mCJIm4CP/BF
 AlWoHyS5knpGDqNmJ6xGbGMalGFE1+esYy4tHbgcwI41aSwc84BAPgpYS5V4ZhVZPWnU
 lSLMfn0wmrV2pRlEOD2Gfd2ltQThfPJMfs/ME1zEMI4O0kFp8WBMEk59I3leeMqBKrrJ
 MiRbssMO5B0CDsp+qwIpdvAKcp9+roZkZ4HyXCFECqosvYmlthCcp7sF3vtGAd/Rz4DN
 LHiA==
X-Gm-Message-State: AC+VfDxyaoZRLS5iNRjz8pKDgKB8nHvpLur0TIMqZr2y/or2pylGT/oa
 y9C+rW8GF640/Z8wXDtOzDGJP8R38SRZbriKWYXT0A==
X-Google-Smtp-Source: ACHHUZ4vYXmccZmbBm+oGX7Y7ZdsETqLqOIcLKl1kyWdRR4ZRKVFla4jqOQpahfwUVX649n1W98lZQ==
X-Received: by 2002:a5d:6309:0:b0:304:7eaa:b196 with SMTP id
 i9-20020a5d6309000000b003047eaab196mr2343596wru.24.1683321895740; 
 Fri, 05 May 2023 14:24:55 -0700 (PDT)
Received: from stoup.. ([212.241.182.8]) by smtp.gmail.com with ESMTPSA id
 t14-20020a5d460e000000b003047ae72b14sm3426709wrq.82.2023.05.05.14.24.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 14:24:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/42] target/alpha: Use MO_ALIGN where required
Date: Fri,  5 May 2023 22:24:17 +0100
Message-Id: <20230505212447.374546-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505212447.374546-1-richard.henderson@linaro.org>
References: <20230505212447.374546-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Mark all memory operations that are not already marked with UNALIGN.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/translate.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index ffbac1c114..be8adb2526 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -2399,21 +2399,21 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             switch ((insn >> 12) & 0xF) {
             case 0x0:
                 /* Longword physical access (hw_ldl/p) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LESL);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LESL | MO_ALIGN);
                 break;
             case 0x1:
                 /* Quadword physical access (hw_ldq/p) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEUQ);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEUQ | MO_ALIGN);
                 break;
             case 0x2:
                 /* Longword physical access with lock (hw_ldl_l/p) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LESL);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LESL | MO_ALIGN);
                 tcg_gen_mov_i64(cpu_lock_addr, addr);
                 tcg_gen_mov_i64(cpu_lock_value, va);
                 break;
             case 0x3:
                 /* Quadword physical access with lock (hw_ldq_l/p) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEUQ);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_PHYS_IDX, MO_LEUQ | MO_ALIGN);
                 tcg_gen_mov_i64(cpu_lock_addr, addr);
                 tcg_gen_mov_i64(cpu_lock_value, va);
                 break;
@@ -2438,11 +2438,13 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 goto invalid_opc;
             case 0xA:
                 /* Longword virtual access with protection check (hw_ldl/w) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_KERNEL_IDX, MO_LESL);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_KERNEL_IDX,
+                                    MO_LESL | MO_ALIGN);
                 break;
             case 0xB:
                 /* Quadword virtual access with protection check (hw_ldq/w) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_KERNEL_IDX, MO_LEUQ);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_KERNEL_IDX,
+                                    MO_LEUQ | MO_ALIGN);
                 break;
             case 0xC:
                 /* Longword virtual access with alt access mode (hw_ldl/a)*/
@@ -2453,12 +2455,14 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
             case 0xE:
                 /* Longword virtual access with alternate access mode and
                    protection checks (hw_ldl/wa) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX, MO_LESL);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX,
+                                    MO_LESL | MO_ALIGN);
                 break;
             case 0xF:
                 /* Quadword virtual access with alternate access mode and
                    protection checks (hw_ldq/wa) */
-                tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX, MO_LEUQ);
+                tcg_gen_qemu_ld_i64(va, addr, MMU_USER_IDX,
+                                    MO_LEUQ | MO_ALIGN);
                 break;
             }
             break;
@@ -2659,7 +2663,7 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 vb = load_gpr(ctx, rb);
                 tmp = tcg_temp_new();
                 tcg_gen_addi_i64(tmp, vb, disp12);
-                tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LESL);
+                tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LESL | MO_ALIGN);
                 break;
             case 0x1:
                 /* Quadword physical access */
@@ -2667,17 +2671,17 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
                 vb = load_gpr(ctx, rb);
                 tmp = tcg_temp_new();
                 tcg_gen_addi_i64(tmp, vb, disp12);
-                tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LEUQ);
+                tcg_gen_qemu_st_i64(va, tmp, MMU_PHYS_IDX, MO_LEUQ | MO_ALIGN);
                 break;
             case 0x2:
                 /* Longword physical access with lock */
                 ret = gen_store_conditional(ctx, ra, rb, disp12,
-                                            MMU_PHYS_IDX, MO_LESL);
+                                            MMU_PHYS_IDX, MO_LESL | MO_ALIGN);
                 break;
             case 0x3:
                 /* Quadword physical access with lock */
                 ret = gen_store_conditional(ctx, ra, rb, disp12,
-                                            MMU_PHYS_IDX, MO_LEUQ);
+                                            MMU_PHYS_IDX, MO_LEUQ | MO_ALIGN);
                 break;
             case 0x4:
                 /* Longword virtual access */
@@ -2771,11 +2775,11 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
         break;
     case 0x2A:
         /* LDL_L */
-        gen_load_int(ctx, ra, rb, disp16, MO_LESL, 0, 1);
+        gen_load_int(ctx, ra, rb, disp16, MO_LESL | MO_ALIGN, 0, 1);
         break;
     case 0x2B:
         /* LDQ_L */
-        gen_load_int(ctx, ra, rb, disp16, MO_LEUQ, 0, 1);
+        gen_load_int(ctx, ra, rb, disp16, MO_LEUQ | MO_ALIGN, 0, 1);
         break;
     case 0x2C:
         /* STL */
@@ -2788,12 +2792,12 @@ static DisasJumpType translate_one(DisasContext *ctx, uint32_t insn)
     case 0x2E:
         /* STL_C */
         ret = gen_store_conditional(ctx, ra, rb, disp16,
-                                    ctx->mem_idx, MO_LESL);
+                                    ctx->mem_idx, MO_LESL | MO_ALIGN);
         break;
     case 0x2F:
         /* STQ_C */
         ret = gen_store_conditional(ctx, ra, rb, disp16,
-                                    ctx->mem_idx, MO_LEUQ);
+                                    ctx->mem_idx, MO_LEUQ | MO_ALIGN);
         break;
     case 0x30:
         /* BR */
-- 
2.34.1


