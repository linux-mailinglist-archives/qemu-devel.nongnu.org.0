Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE80E6FEDC7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:17:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1Ld-0007JJ-KS; Thu, 11 May 2023 04:08:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1La-0007Ej-FZ
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1LX-0001wj-W5
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:08:22 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bd2d7ba74so76582923a12.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792498; x=1686384498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cqP+kmlr3vGIQ8ytEhUxnQ61nNI/I+I3GQWyWpYA5O0=;
 b=W2V6xVk1v8a2xUqrBw+rewNIEjN7SISGjnBZQ2J5rY6jor4UyTe+yLxxve560E5LmQ
 2wN04+p2CTmrHUtISh9Ku6ADEouHr3U4N5dZhuCakKjbcTmnrgoGkHw9pySj+ipdZvcL
 iPXKkHGxMzisyt1zfSb0DmZd0Yrd0Gwfj5VZI1ES8npsJMUodHpCdxBGah7RJOWnr6Qb
 MQQxiPKJvncQLrOXet+X/5Sg0fyvDqww5P7/J1V9aD1nJkPHwFtN9g4JHkQGLUswM1rG
 dFL3SWZdl10l8YfAmc5f6AAi7KPx3FDo5yxt/a4wmOIVnK8gs6mYiAv3U3GU+VY88Ccm
 BD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792498; x=1686384498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqP+kmlr3vGIQ8ytEhUxnQ61nNI/I+I3GQWyWpYA5O0=;
 b=SA4yS8I4HnvQcVyS4KJbx0SA8+dmlOUVI1JOSHlldc5C0adARJT/q5oJ8n8INwfErQ
 Fd15QaHJ7MgEHPf/bisTBaIo8AUvEbf6rWgXLl8BhBdqBieybPvylpKL75aY9hmkHj/q
 V7RC/XbZ5jABmIGqtprlF68VKkNMCqbXHMs73AROiAfjfFhF1etp1bvM2ELNJ22UYWZv
 TbwDEqLWBQHXHYrcK488YcoN/GGnoj2Wj5aQdbqb4pYz0jntnQMUTmrMuenTJoO1h8Nu
 7Co/7Q6FeCqGNfXUhln3FqGtVdysCqifYvFiRCLwv0ZTADQesAdra76Rt00weWU5qmFe
 hXtw==
X-Gm-Message-State: AC+VfDzLkquQbW+4vYQwmS8eh1sM625I9BVP669fKKJCnhalJBpoVXXH
 +ZQq1MRplg+F0cK06WnWy8F62BnX1y3aEtUrKZQ3mA==
X-Google-Smtp-Source: ACHHUZ53wUdi4LT9XMF4JvfD1d3tAYBaD3u7i5nMO+lDl68xWVDAtO+zgjSOKfiJYwpLpCZ8UHg9KQ==
X-Received: by 2002:a17:906:6a1c:b0:966:5fac:2e52 with SMTP id
 qw28-20020a1709066a1c00b009665fac2e52mr12207619ejc.9.1683792498407; 
 Thu, 11 May 2023 01:08:18 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b00959c6cb82basm3635225ejc.105.2023.05.11.01.08.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:08:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 42/53] target/mips: Add missing default_tcg_memop_mask
Date: Thu, 11 May 2023 09:04:39 +0100
Message-Id: <20230511080450.860923-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511080450.860923-1-richard.henderson@linaro.org>
References: <20230511080450.860923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52a.google.com
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

Memory operations that are not already aligned, or otherwise
marked up, require addition of ctx->default_tcg_memop_mask.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/mxu_translate.c           |  3 ++-
 target/mips/tcg/micromips_translate.c.inc | 24 ++++++++++++++--------
 target/mips/tcg/mips16e_translate.c.inc   | 18 ++++++++++------
 target/mips/tcg/nanomips_translate.c.inc  | 25 +++++++++++------------
 4 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index bdd20709c0..be038b5f07 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -831,7 +831,8 @@ static void gen_mxu_s32ldd_s32lddr(DisasContext *ctx)
         tcg_gen_ori_tl(t1, t1, 0xFFFFF000);
     }
     tcg_gen_add_tl(t1, t0, t1);
-    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, MO_TESL ^ (sel * MO_BSWAP));
+    tcg_gen_qemu_ld_tl(t1, t1, ctx->mem_idx, (MO_TESL ^ (sel * MO_BSWAP)) |
+                       ctx->default_tcg_memop_mask);
 
     gen_store_mxu_gpr(t1, XRa);
 }
diff --git a/target/mips/tcg/micromips_translate.c.inc b/target/mips/tcg/micromips_translate.c.inc
index e8b193aeda..211d102cf6 100644
--- a/target/mips/tcg/micromips_translate.c.inc
+++ b/target/mips/tcg/micromips_translate.c.inc
@@ -977,20 +977,24 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
             gen_reserved_instruction(ctx);
             return;
         }
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL);
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL |
+                           ctx->default_tcg_memop_mask);
         gen_store_gpr(t1, rd);
         tcg_gen_movi_tl(t1, 4);
         gen_op_addr_add(ctx, t0, t0, t1);
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL);
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL |
+                           ctx->default_tcg_memop_mask);
         gen_store_gpr(t1, rd + 1);
         break;
     case SWP:
         gen_load_gpr(t1, rd);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
         tcg_gen_movi_tl(t1, 4);
         gen_op_addr_add(ctx, t0, t0, t1);
         gen_load_gpr(t1, rd + 1);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
         break;
 #ifdef TARGET_MIPS64
     case LDP:
@@ -998,20 +1002,24 @@ static void gen_ldst_pair(DisasContext *ctx, uint32_t opc, int rd,
             gen_reserved_instruction(ctx);
             return;
         }
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
+                           ctx->default_tcg_memop_mask);
         gen_store_gpr(t1, rd);
         tcg_gen_movi_tl(t1, 8);
         gen_op_addr_add(ctx, t0, t0, t1);
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
+                           ctx->default_tcg_memop_mask);
         gen_store_gpr(t1, rd + 1);
         break;
     case SDP:
         gen_load_gpr(t1, rd);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
+                           ctx->default_tcg_memop_mask);
         tcg_gen_movi_tl(t1, 8);
         gen_op_addr_add(ctx, t0, t0, t1);
         gen_load_gpr(t1, rd + 1);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUQ |
+                           ctx->default_tcg_memop_mask);
         break;
 #endif
     }
diff --git a/target/mips/tcg/mips16e_translate.c.inc b/target/mips/tcg/mips16e_translate.c.inc
index 602f5f0c02..5cffe0e412 100644
--- a/target/mips/tcg/mips16e_translate.c.inc
+++ b/target/mips/tcg/mips16e_translate.c.inc
@@ -172,22 +172,26 @@ static void gen_mips16_save(DisasContext *ctx,
     case 4:
         gen_base_offset_addr(ctx, t0, 29, 12);
         gen_load_gpr(t1, 7);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
         /* Fall through */
     case 3:
         gen_base_offset_addr(ctx, t0, 29, 8);
         gen_load_gpr(t1, 6);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
         /* Fall through */
     case 2:
         gen_base_offset_addr(ctx, t0, 29, 4);
         gen_load_gpr(t1, 5);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
         /* Fall through */
     case 1:
         gen_base_offset_addr(ctx, t0, 29, 0);
         gen_load_gpr(t1, 4);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |
+                           ctx->default_tcg_memop_mask);
     }
 
     gen_load_gpr(t0, 29);
@@ -196,7 +200,8 @@ static void gen_mips16_save(DisasContext *ctx,
         tcg_gen_movi_tl(t2, -4);                                 \
         gen_op_addr_add(ctx, t0, t0, t2);                        \
         gen_load_gpr(t1, reg);                                   \
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL); \
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL |       \
+                           ctx->default_tcg_memop_mask);         \
     } while (0)
 
     if (do_ra) {
@@ -298,7 +303,8 @@ static void gen_mips16_restore(DisasContext *ctx,
 #define DECR_AND_LOAD(reg) do {                            \
         tcg_gen_movi_tl(t2, -4);                           \
         gen_op_addr_add(ctx, t0, t0, t2);                  \
-        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL); \
+        tcg_gen_qemu_ld_tl(t1, t0, ctx->mem_idx, MO_TESL | \
+                           ctx->default_tcg_memop_mask);   \
         gen_store_gpr(t1, reg);                            \
     } while (0)
 
diff --git a/target/mips/tcg/nanomips_translate.c.inc b/target/mips/tcg/nanomips_translate.c.inc
index e08343414c..b96dcd2ae9 100644
--- a/target/mips/tcg/nanomips_translate.c.inc
+++ b/target/mips/tcg/nanomips_translate.c.inc
@@ -2641,52 +2641,49 @@ static void gen_p_lsx(DisasContext *ctx, int rd, int rs, int rt)
 
     switch (extract32(ctx->opcode, 7, 4)) {
     case NM_LBX:
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx,
-                           MO_SB);
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_SB);
         gen_store_gpr(t0, rd);
         break;
     case NM_LHX:
     /*case NM_LHXS:*/
         tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx,
-                           MO_TESW);
+                           MO_TESW | ctx->default_tcg_memop_mask);
         gen_store_gpr(t0, rd);
         break;
     case NM_LWX:
     /*case NM_LWXS:*/
         tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx,
-                           MO_TESL);
+                           MO_TESL | ctx->default_tcg_memop_mask);
         gen_store_gpr(t0, rd);
         break;
     case NM_LBUX:
-        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx,
-                           MO_UB);
+        tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx, MO_UB);
         gen_store_gpr(t0, rd);
         break;
     case NM_LHUX:
     /*case NM_LHUXS:*/
         tcg_gen_qemu_ld_tl(t0, t0, ctx->mem_idx,
-                           MO_TEUW);
+                           MO_TEUW | ctx->default_tcg_memop_mask);
         gen_store_gpr(t0, rd);
         break;
     case NM_SBX:
         check_nms(ctx);
         gen_load_gpr(t1, rd);
-        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx,
-                           MO_8);
+        tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_8);
         break;
     case NM_SHX:
     /*case NM_SHXS:*/
         check_nms(ctx);
         gen_load_gpr(t1, rd);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx,
-                           MO_TEUW);
+                           MO_TEUW | ctx->default_tcg_memop_mask);
         break;
     case NM_SWX:
     /*case NM_SWXS:*/
         check_nms(ctx);
         gen_load_gpr(t1, rd);
         tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx,
-                           MO_TEUL);
+                           MO_TEUL | ctx->default_tcg_memop_mask);
         break;
     case NM_LWC1X:
     /*case NM_LWC1XS:*/
@@ -3739,7 +3736,8 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                                                 addr_off);
 
                     tcg_gen_movi_tl(t0, addr);
-                    tcg_gen_qemu_ld_tl(cpu_gpr[rt], t0, ctx->mem_idx, MO_TESL);
+                    tcg_gen_qemu_ld_tl(cpu_gpr[rt], t0, ctx->mem_idx,
+                                       MO_TESL | ctx->default_tcg_memop_mask);
                 }
                 break;
             case NM_SWPC48:
@@ -3755,7 +3753,8 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *env, DisasContext *ctx)
                     tcg_gen_movi_tl(t0, addr);
                     gen_load_gpr(t1, rt);
 
-                    tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx, MO_TEUL);
+                    tcg_gen_qemu_st_tl(t1, t0, ctx->mem_idx,
+                                       MO_TEUL | ctx->default_tcg_memop_mask);
                 }
                 break;
             default:
-- 
2.34.1


