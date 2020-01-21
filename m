Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62319143FB6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 15:38:34 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itufp-0004Tb-0P
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 09:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34452)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ittla-0003oO-Fl
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1ittlV-00034M-NU
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:26 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:54251 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1ittlV-0002TQ-B6
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 08:40:21 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id D8E861A4593;
 Tue, 21 Jan 2020 14:39:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 87BBA1A458E;
 Tue, 21 Jan 2020 14:39:15 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/5] target/mips: Add support for MIPS<32|64>R6 CRC32 ISA
Date: Tue, 21 Jan 2020 14:38:54 +0100
Message-Id: <1579613937-5774-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579613937-5774-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1579613937-5774-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: aleksandar.rikalo@rt-rk.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Add support for eight CRC-related MIPS<32|64>R6 instructions.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 disas/mips.c            |   8 +++
 target/mips/helper.h    |   2 +
 target/mips/op_helper.c |  19 ++++++++
 target/mips/translate.c | 127 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 156 insertions(+)

diff --git a/disas/mips.c b/disas/mips.c
index dfefe5e..75c48b3 100644
--- a/disas/mips.c
+++ b/disas/mips.c
@@ -1409,6 +1409,14 @@ const struct mips_opcode mips_builtin_opcodes[] =
 {"dvp",        "t",     0x41600024, 0xffe0ffff, TRAP|WR_t,            0, I32R6},
 {"evp",        "",      0x41600004, 0xffffffff, TRAP,                 0, I32R6},
 {"evp",        "t",     0x41600004, 0xffe0ffff, TRAP|WR_t,            0, I32R6},
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
index 7b8ad74..2095330 100644
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
index 18fcee4..5cd396d 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -27,6 +27,8 @@
 #include "exec/memop.h"
 #include "sysemu/kvm.h"
 #include "fpu/softfloat.h"
+#include "qemu/crc32c.h"
+#include <zlib.h>
 
 /*****************************************************************************/
 /* Exceptions processing helpers */
@@ -350,6 +352,23 @@ target_ulong helper_rotx(target_ulong rs, uint32_t shift, uint32_t shiftx,
     return (int64_t)(int32_t)(uint32_t)tmp5;
 }
 
+/* these crc32 functions are based on target/arm/helper-a64.c */
+target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
+{
+    uint8_t buf[8];
+
+    stq_le_p(buf, m);
+    return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
+}
+
+target_ulong helper_crc32c(target_ulong val, target_ulong m, uint32_t sz)
+{
+    uint8_t buf[8];
+
+    stq_le_p(buf, m);
+    return (int32_t) (crc32c(val, buf, sz) ^ 0xffffffff);
+}
+
 #ifndef CONFIG_USER_ONLY
 
 static inline hwaddr do_translate_address(CPUMIPSState *env,
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 4bff585..1b38356 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -451,6 +451,7 @@ enum {
     OPC_LWE            = 0x2F | OPC_SPECIAL3,
 
     /* R6 */
+    OPC_CRC32          = 0x0F | OPC_SPECIAL3,
     R6_OPC_PREF        = 0x35 | OPC_SPECIAL3,
     R6_OPC_CACHE       = 0x25 | OPC_SPECIAL3,
     R6_OPC_LL          = 0x36 | OPC_SPECIAL3,
@@ -2547,6 +2548,7 @@ typedef struct DisasContext {
     bool nan2008;
     bool abs2008;
     bool saar;
+    bool crcp;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -27117,11 +27119,96 @@ static void decode_opc_special2_legacy(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
+static void gen_crc32(DisasContext *ctx, int rd, int rs, int rt, int sz,
+                      int crc32c)
+{
+    TCGv t0;
+    TCGv t1;
+    TCGv_i32 tsz = tcg_const_i32(1 << sz);
+    uint64_t mask = 0;
+
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
+    if (sz != 3) {
+        switch (sz) {
+        case 0:
+            mask = 0xFF;
+            break;
+        case 1:
+            mask = 0xFFFF;
+            break;
+        case 2:
+            mask = 0xFFFFFFFF;
+            break;
+        }
+        tcg_gen_andi_tl(t1, t1, mask);
+    }
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
+static void gen_crc32b(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 0, 0);
+}
+
+static void gen_crc32h(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 1, 0);
+}
+
+static void gen_crc32w(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 2, 0);
+}
+
+static void gen_crc32d(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 3, 0);
+}
+
+static void gen_crc32cb(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 0, 1);
+}
+
+static void gen_crc32ch(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 1, 1);
+}
+
+static void gen_crc32cw(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 2, 1);
+}
+
+static void gen_crc32cd(DisasContext *ctx, int rd, int rs, int rt)
+{
+    gen_crc32(ctx, rd, rs, rt, 3, 1);
+}
+
 static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd, sa;
     uint32_t op1, op2;
     int16_t imm;
+    int sz, crc32c;
 
     rs = (ctx->opcode >> 21) & 0x1f;
     rt = (ctx->opcode >> 16) & 0x1f;
@@ -27131,6 +27218,45 @@ static void decode_opc_special3_r6(CPUMIPSState *env, DisasContext *ctx)
 
     op1 = MASK_SPECIAL3(ctx->opcode);
     switch (op1) {
+    case OPC_CRC32:
+        sz = extract32(ctx->opcode, 6, 2);
+        crc32c = extract32(ctx->opcode, 8, 3);
+        if (unlikely(!ctx->crcp) ||
+            unlikely((sz == 3) && (!(ctx->hflags & MIPS_HFLAG_64))) ||
+            unlikely((crc32c >= 2))) {
+            generate_exception_end(ctx, EXCP_RI);
+        }
+        switch (sz) {
+        case 0:
+            if (crc32c) {
+                gen_crc32cb(ctx, rt, rs, rt);
+            } else {
+                gen_crc32b(ctx, rt, rs, rt);
+            }
+            break;
+        case 1:
+            if (crc32c) {
+                gen_crc32ch(ctx, rt, rs, rt);
+            } else {
+                gen_crc32h(ctx, rt, rs, rt);
+            }
+            break;
+        case 2:
+            if (crc32c) {
+                gen_crc32cw(ctx, rt, rs, rt);
+            } else {
+                gen_crc32w(ctx, rt, rs, rt);
+            }
+            break;
+        case 3:
+            if (crc32c) {
+                gen_crc32cd(ctx, rt, rs, rt);
+            } else {
+                gen_crc32d(ctx, rt, rs, rt);
+            }
+            break;
+        }
+        break;
     case R6_OPC_PREF:
         if (rt >= 24) {
             /* hint codes 24-31 are reserved and signal RI */
@@ -30727,6 +30853,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
     ctx->nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
+    ctx->crcp = (env->CP0_Config5 >> CP0C5_CRCP) & 1;
     restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
         ctx->mem_idx = MIPS_HFLAG_UM;
-- 
2.7.4


