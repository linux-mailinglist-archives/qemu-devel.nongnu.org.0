Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7C7B2BF
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 20:56:56 +0200 (CEST)
Received: from localhost ([::1]:35818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsXIt-0001vI-LA
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 14:56:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50018)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsXGa-0006hB-GD
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsXGY-0001CX-T9
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:32 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35521 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hsXGY-0001BC-HB
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:30 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id CB1E61A223B;
 Tue, 30 Jul 2019 20:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 82F3E1A221B;
 Tue, 30 Jul 2019 20:53:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jul 2019 20:53:16 +0200
Message-Id: <1564512798-25527-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564512798-25527-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564512798-25527-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v3 4/6] target/mips: Add emulation of
 CRC32 instructions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, sw@weilnetz.de, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yongbok Kim <yongbok.kim@mips.com>

Add emulation of MIPS' CRC32 (Cyclic Redundancy Check) instructions.
Reuse zlib crc32() and Linux crc32c(). Note that, at the time being,
there is no MIPS CPU that supports CRC32 instructions (they are an
optional part of MIPS64/32 R6 anf nanoMIPS ISAs).

Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 disas/mips.c            |  8 ++++++++
 target/mips/helper.h    |  2 ++
 target/mips/op_helper.c | 22 ++++++++++++++++++++++
 target/mips/translate.c | 41 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 73 insertions(+)

diff --git a/disas/mips.c b/disas/mips.c
index c3a3059..b9a5204 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -1411,6 +1411,14 @@ const struct mips_opcode mips_builtin_opcodes[] =
 {"evp",        "t",     0x41600004, 0xffe0ffff, TRAP|WR_t,            0, I32R6},
 {"ginvi",      "v",     0x7c00003d, 0xfc1ffcff, TRAP | INSN_TLB,      0, I32R6},
 {"ginvt",      "v",     0x7c0000bd, 0xfc1ffcff, TRAP | INSN_TLB,      0, I32R6},
+{"crc32b",     "t,v,t", 0x7c00000f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
+{"crc32h",     "t,v,t", 0x7c00004f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
+{"crc32w",     "t,v,t", 0x7c00008f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
+{"crc32d",     "t,v,t", 0x7c0000cf, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I64R6},
+{"crc32cb",    "t,v,t", 0x7c00010f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
+{"crc32ch",    "t,v,t", 0x7c00014f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
+{"crc32cw",    "t,v,t", 0x7c00018f, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I32R6},
+{"crc32cd",    "t,v,t", 0x7c0001cf, 0xfc00ff3f, WR_d | RD_s | RD_t,   0, I64R6},
 
 /* MSA */
 {"sll.b",   "+d,+e,+f", 0x7800000d, 0xffe0003f, WR_VD|RD_VS|RD_VT,  0, MSA},
diff --git a/target/mips/helper.h b/target/mips/helper.h
index c7d35bd..0e61043 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -40,6 +40,8 @@ DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 DEF_HELPER_FLAGS_1(dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 #endif
 
+DEF_HELPER_3(crc32, tl, tl, tl, i32)
+DEF_HELPER_3(crc32c, tl, tl, tl, i32)
 DEF_HELPER_FLAGS_4(rotx, TCG_CALL_NO_RWG_SE, tl, tl, i32, i32, i32)
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 9b3bf4b..93f5ee5 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -25,6 +25,8 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "sysemu/kvm.h"
+#include "qemu/crc32c.h"
+#include <zlib.h>
 
 /*****************************************************************************/
 /* Exceptions processing helpers */
@@ -343,6 +345,26 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
     return (int64_t)(int32_t)(uint32_t)tmp5;
 }
 
+/* these crc32 functions are based on target/arm/helper-a64.c */
+target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
+{
+    uint8_t buf[8];
+    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
+
+    m &= mask;
+    stq_le_p(buf, m);
+    return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
+}
+
+target_ulong helper_crc32c(target_ulong val, target_ulong m, uint32_t sz)
+{
+    uint8_t buf[8];
+    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
+    m &= mask;
+    stq_le_p(buf, m);
+    return (int32_t) (crc32c(val, buf, sz) ^ 0xffffffff);
+}
+
 #ifndef CONFIG_USER_ONLY
 
 static inline hwaddr do_translate_address(CPUMIPSState *env,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8103b46..345e07c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -452,6 +452,7 @@ enum {
     OPC_LWE            = 0x2F | OPC_SPECIAL3,
 
     /* R6 */
+    OPC_CRC32          = 0x0F | OPC_SPECIAL3,
     R6_OPC_PREF        = 0x35 | OPC_SPECIAL3,
     R6_OPC_CACHE       = 0x25 | OPC_SPECIAL3,
     R6_OPC_LL          = 0x36 | OPC_SPECIAL3,
@@ -2553,6 +2554,7 @@ typedef struct DisasContext {
     int gi;
 >>>>>>> 4c5da27... target/mips: Implement Global Invalidate TLB instruction
     bool mi;
+    bool crcp;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -27044,6 +27046,33 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
+static void gen_crc32(DisasContext *ctx, int rd, int rs, int rt, int sz,
+                      int crc32c)
+{
+    TCGv t0;
+    TCGv t1;
+    TCGv_i32 tsz = tcg_const_i32(1 << sz);
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, rt);
+    gen_load_gpr(t1, rs);
+
+    if (crc32c) {
+        gen_helper_crc32c(cpu_gpr[rd], t0, t1, tsz);
+    } else {
+        gen_helper_crc32(cpu_gpr[rd], t0, t1, tsz);
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free_i32(tsz);
+}
+
 static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd, sa;
@@ -27058,6 +27087,17 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL3(ctx->opcode);
     switch (op1) {
+    case OPC_CRC32:
+        if (unlikely(!ctx->crcp) ||
+            unlikely((extract32(ctx->opcode, 6, 2) == 3) &&
+                     (!(ctx->hflags & MIPS_HFLAG_64))) ||
+            unlikely((extract32(ctx->opcode, 8, 3) >= 2))) {
+            generate_exception_end(ctx, EXCP_RI);
+        }
+        gen_crc32(ctx, rt, rs, rt,
+                  extract32(ctx->opcode, 6, 2),
+                  extract32(ctx->opcode, 8, 3));
+        break;
     case R6_OPC_PREF:
         if (rt >= 24) {
             /* hint codes 24-31 are reserved and signal RI */
@@ -30052,6 +30092,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
     ctx->mi = (env->CP0_Config5 >> CP0C5_MI) & 1;
     ctx->gi = (env->CP0_Config5 >> CP0C5_GI) & 3;
+    ctx->crcp = (env->CP0_Config5 >> CP0C5_CRCP) & 1;
     restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
         ctx->mem_idx = MIPS_HFLAG_UM;
-- 
2.7.4


