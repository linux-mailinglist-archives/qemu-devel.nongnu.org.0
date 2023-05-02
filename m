Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D26F480F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 18:10:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptsYx-0002pM-0I; Tue, 02 May 2023 12:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYf-0002lm-MN
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:59 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptsYc-0000b9-Sc
 for qemu-devel@nongnu.org; Tue, 02 May 2023 12:08:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-2f6401ce8f8so2489766f8f.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683043729; x=1685635729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElGkLkSZPG5U6w3IO50r2nvTqh+XRQqzsanCGPviKUM=;
 b=jr2g7nGCKLSUqBjmWl2In101FECMXT4VwKxb+mXz7gobIPG0tqjipoHNngCj2KGsKS
 i9OEN856b0Sbbp3KlV7PcpFuze14EWeSWeSskjzYR/BJ8SD/09nNTBfHGo+PwSZBVpHi
 Nu+JnjHLAWNwOlBx9JYNQvj/g8+TA8TjwscctE+Kj6SCyyqmVC7N6BBtL8Yrej6kHkG3
 hkUGon7PLL8sc2Km6I4KPUhNsHxraGbji6wgGeBa613Ss6VlrNsIk/2hWTeJsdlbYCYI
 osLNKfhfK/5XKVP8UBkGaScIV960Pw0Ed2GPNX0B3Y4Xyi5EKk6x8Z2c6bjJ5FuqpAlq
 UslQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683043729; x=1685635729;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ElGkLkSZPG5U6w3IO50r2nvTqh+XRQqzsanCGPviKUM=;
 b=ILxAhS44Mi8biUT+iPx7fCfMHNIDAl+Mm84JspWEmw1mvPqC0L30/c9gAFyBIZhpJ4
 kNYeTeOTvhK9ilnZp2ZWaPknYmBQLBXGMTUmlfQStRtmQMLgAxaYXc3wwj9etCbusY0C
 tV4aE81d+vrXeS6LmG70Iu9n5qe8u0tLY4l3TV5TAVQWYIalb8FWjehEDLzrwfD6qsr6
 b3ZXiOkzCvXujgHekd+J41J4GXksUm3JqCpOfnCFPCDKLqneceh/EjzLxTY7hzQFHivy
 zGAbryCgJzx8ra6DUepdfZEPNqJGas/6b3XfRWQrciqxg96OSz3JpUChu8Zk5lmATpRk
 Dqjw==
X-Gm-Message-State: AC+VfDzSIdtK+O264XHTW1WRo1j+VdYPwJ0pLB1wOjGltz1e0In+ANyp
 vTwP/P9S5XIHOJ5QA4OGlJwX6LVTKQ1nwwnGx4L2TQ==
X-Google-Smtp-Source: ACHHUZ76ehJdym4qogBwr+dKkKQVSl3ETFs8mVjNq7tb204FcUoEwU/rW5DvUBtyXnU/z+GxtABk2g==
X-Received: by 2002:adf:f892:0:b0:306:320f:7bd0 with SMTP id
 u18-20020adff892000000b00306320f7bd0mr3695310wrp.19.1683043728974; 
 Tue, 02 May 2023 09:08:48 -0700 (PDT)
Received: from stoup.Home ([2a02:c7c:74db:8d00:ad29:f02c:48a2:269c])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003ede3f5c81fsm39918471wmo.41.2023.05.02.09.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 09:08:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk
Subject: [PATCH 02/16] target/alpha: Use MO_ALIGN where required
Date: Tue,  2 May 2023 17:08:32 +0100
Message-Id: <20230502160846.1289975-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502160846.1289975-1-richard.henderson@linaro.org>
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
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


