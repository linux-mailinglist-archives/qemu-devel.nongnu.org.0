Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9648631E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:47:45 +0100 (CET)
Received: from localhost ([::1]:56110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QJ6-0004z5-N8
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDW-0007eJ-5Q
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:58 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:49959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n5QDO-0004it-QT
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:41:57 -0500
Received: from quad ([82.142.12.178]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MKbc4-1morGY2nVM-00L126; Thu, 06
 Jan 2022 11:41:46 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] target/sh4: Implement prctl_unalign_sigbus
Date: Thu,  6 Jan 2022 11:41:22 +0100
Message-Id: <20220106104137.732883-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220106104137.732883-1-laurent@vivier.eu>
References: <20220106104137.732883-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qK3IYWdXldFT2qs49de94K53jCPohICyfYxMavRxHaGPipJZUI3
 v7fxV4WWtOGYlZqDPO/SyOTIsSRFe/yDNz3Hs385v4chADh+EdpC39bc9HgPyHd27gNlc3K
 dYwRhigvRmN4y7lLCji4Nz4RnO6v2e4rLcj8OtVMX14qOGyjm94rEt0n9OqgeH6frE/kO4i
 D3LFPOcgnHlRKTZjjJ/Og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iCTP67RgF8k=:pMbXKyIdwmMTT/QB8FghSA
 qV3BorisA4cTYu49oQNIms+EXNs0FyyUSusCNCQ58JX61FOExpEEETgdzST6IMOqlaN2Sf9bn
 XJi61m6Ie12/+wJh6u+kBygwGv9aX19wZWOfl+NaZyyDtMeu2LrU+txeeyjWPtRUIjADK/zli
 KjkxuKArESgyR/1jnqEUW49MoU0Wy3395A6smJYP+br+qJeLlxA4geSuomv/kec/Gi39O4zmL
 p8NNgDM62e07kQl+I/Odx3q9CRc4k+yliiKpXDuqN9368rMfUdDS7U3cg65rYHOebBy2VTGCn
 039jdx4sYdFu1N6L1LOn2IqtbXGkubR3Yow32InohRxaqLHiavYUDViqmknEQG0MwUDK79Gf6
 hcUavI1ClhfVW4qdW/RrK4TBgizZzq790MDHlPEn86bC3SikitiRYOsu85nCbhnHb/XWLxAFN
 T9hWH5BQb56dUBZdDTtgQnBUc1f5HNIzL93Jk/SBlzjw/xCk0EDcXVOvhOtrUOV1FIhWaEZne
 shCDhYU9m8FKKBlx0pgO5wIpKweumCAvCRHF4b863IHbKsR7gv1Oa9pviQ1qaidNy/uaxoHnd
 GAWEnk2euzaMu41mraUI/vJxGsZiEL9EuahjC77mhBi1cBOv0Lk/jskKdqlAhpgKT+mSa0EJ5
 1mQh2VpGV6p5Sd6mrioN7VNuhiJDvxhRlchHH7i2BRn1rvLaHrIOKWA092CP1qM8uIHs=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Leave TARGET_ALIGNED_ONLY set, but use the new CPUState
flag to set MO_UNALN for the instructions that the kernel
handles in the unaligned trap.

The Linux kernel does not handle all memory operations: no
floating-point and no MAC.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20211227150127.2659293-7-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/sh4/target_prctl.h |  2 +-
 target/sh4/cpu.h              |  4 +++
 target/sh4/translate.c        | 50 ++++++++++++++++++++++++-----------
 3 files changed, 39 insertions(+), 17 deletions(-)

diff --git a/linux-user/sh4/target_prctl.h b/linux-user/sh4/target_prctl.h
index eb53b31ad554..5629ddbf39cd 100644
--- a/linux-user/sh4/target_prctl.h
+++ b/linux-user/sh4/target_prctl.h
@@ -1 +1 @@
-/* No special prctl support required. */
+#include "../generic/target_prctl_unalign.h"
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 4cfb109f5668..fb9dd9db2ffd 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -83,6 +83,7 @@
 #define DELAY_SLOT_RTE         (1 << 2)
 
 #define TB_FLAG_PENDING_MOVCA  (1 << 3)
+#define TB_FLAG_UNALIGN        (1 << 4)
 
 #define GUSA_SHIFT             4
 #ifdef CONFIG_USER_ONLY
@@ -373,6 +374,9 @@ static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
             | (env->sr & ((1u << SR_MD) | (1u << SR_RB)))      /* Bits 29-30 */
             | (env->sr & (1u << SR_FD))                        /* Bit 15 */
             | (env->movcal_backup ? TB_FLAG_PENDING_MOVCA : 0); /* Bit 3 */
+#ifdef CONFIG_USER_ONLY
+    *flags |= TB_FLAG_UNALIGN * !env_cpu(env)->prctl_unalign_sigbus;
+#endif
 }
 
 #endif /* SH4_CPU_H */
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index ce5d674a520e..50493c61ea65 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -50,8 +50,10 @@ typedef struct DisasContext {
 
 #if defined(CONFIG_USER_ONLY)
 #define IS_USER(ctx) 1
+#define UNALIGN(C)   (ctx->tbflags & TB_FLAG_UNALIGN ? MO_UNALN : MO_ALIGN)
 #else
 #define IS_USER(ctx) (!(ctx->tbflags & (1u << SR_MD)))
+#define UNALIGN(C)   0
 #endif
 
 /* Target-specific values for ctx->base.is_jmp.  */
@@ -495,7 +497,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B11_8), B3_0 * 4);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -503,7 +506,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 4);
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -558,19 +562,23 @@ static void _decode_opc(DisasContext * ctx)
         tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_UB);
 	return;
     case 0x2001:		/* mov.w Rm,@Rn */
-        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUW);
+        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx,
+                            MO_TEUW | UNALIGN(ctx));
 	return;
     case 0x2002:		/* mov.l Rm,@Rn */
-        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx, MO_TEUL);
+        tcg_gen_qemu_st_i32(REG(B7_4), REG(B11_8), ctx->memidx,
+                            MO_TEUL | UNALIGN(ctx));
 	return;
     case 0x6000:		/* mov.b @Rm,Rn */
         tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_SB);
 	return;
     case 0x6001:		/* mov.w @Rm,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESW | UNALIGN(ctx));
 	return;
     case 0x6002:		/* mov.l @Rm,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESL | UNALIGN(ctx));
 	return;
     case 0x2004:		/* mov.b Rm,@-Rn */
 	{
@@ -586,7 +594,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 2);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
 	    tcg_temp_free(addr);
 	}
@@ -595,7 +604,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_subi_i32(addr, REG(B11_8), 4);
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_gen_mov_i32(REG(B11_8), addr);
         tcg_temp_free(addr);
 	}
@@ -606,12 +616,14 @@ static void _decode_opc(DisasContext * ctx)
 		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 1);
 	return;
     case 0x6005:		/* mov.w @Rm+,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESW);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESW | UNALIGN(ctx));
 	if ( B11_8 != B7_4 )
 		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 2);
 	return;
     case 0x6006:		/* mov.l @Rm+,Rn */
-        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx, MO_TESL);
+        tcg_gen_qemu_ld_i32(REG(B11_8), REG(B7_4), ctx->memidx,
+                            MO_TESL | UNALIGN(ctx));
 	if ( B11_8 != B7_4 )
 		tcg_gen_addi_i32(REG(B7_4), REG(B7_4), 4);
 	return;
@@ -627,7 +639,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -635,7 +648,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B11_8), REG(0));
-            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx, MO_TEUL);
+            tcg_gen_qemu_st_i32(REG(B7_4), addr, ctx->memidx,
+                                MO_TEUL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -651,7 +665,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -659,7 +674,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_add_i32(addr, REG(B7_4), REG(0));
-            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx, MO_TESL);
+            tcg_gen_qemu_ld_i32(REG(B11_8), addr, ctx->memidx,
+                                MO_TESL | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -1253,7 +1269,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
-            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx, MO_TEUW);
+            tcg_gen_qemu_st_i32(REG(0), addr, ctx->memidx,
+                                MO_TEUW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
@@ -1269,7 +1286,8 @@ static void _decode_opc(DisasContext * ctx)
 	{
 	    TCGv addr = tcg_temp_new();
 	    tcg_gen_addi_i32(addr, REG(B7_4), B3_0 * 2);
-            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx, MO_TESW);
+            tcg_gen_qemu_ld_i32(REG(0), addr, ctx->memidx,
+                                MO_TESW | UNALIGN(ctx));
 	    tcg_temp_free(addr);
 	}
 	return;
-- 
2.33.1


