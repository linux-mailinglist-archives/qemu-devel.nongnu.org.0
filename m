Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FB14C18F
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 21:22:14 +0100 (CET)
Received: from localhost ([::1]:37288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwXNF-0001Ou-6K
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 15:22:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iwXKf-0005Mk-1D
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iwXKd-0001Ah-65
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:32 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:41527 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iwXKc-0006fq-RH
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 15:19:31 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id EDD5D1A2013;
 Tue, 28 Jan 2020 21:10:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id D26A51A1E9A;
 Tue, 28 Jan 2020 21:10:00 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] target/mips: Amend CP0 WatchHi register implementation
Date: Tue, 28 Jan 2020 21:09:20 +0100
Message-Id: <1580242161-20333-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580242161-20333-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1580242161-20333-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
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
Cc: peter.maydell@linaro.org, Yongbok Kim <yongbok.kim@mips.com>,
 amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yongbok Kim <yongbok.kim@mips.com>

WatchHi is extended by the field MemoryMapID with the GINVT instruction.
The field is accessible by MTHC0/MFHC0 in 32-bit architectures and DMTC0/
DMFC0 in 64-bit architectures.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>
Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1579883929-1517-4-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/cpu.h       |  2 +-
 target/mips/helper.h    |  3 +++
 target/mips/machine.c   |  6 +++---
 target/mips/op_helper.c | 23 +++++++++++++++++++++--
 target/mips/translate.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index c218ccc..7cf1b49 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -961,7 +961,7 @@ struct CPUMIPSState {
 /*
  * CP0 Register 19
  */
-    int32_t CP0_WatchHi[8];
+    uint64_t CP0_WatchHi[8];
 #define CP0WH_ASID 16
 /*
  * CP0 Register 20
diff --git a/target/mips/helper.h b/target/mips/helper.h
index 7b8ad74..5b1f8bb 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -78,6 +78,7 @@ DEF_HELPER_1(mfc0_maar, tl, env)
 DEF_HELPER_1(mfhc0_maar, tl, env)
 DEF_HELPER_2(mfc0_watchlo, tl, env, i32)
 DEF_HELPER_2(mfc0_watchhi, tl, env, i32)
+DEF_HELPER_2(mfhc0_watchhi, tl, env, i32)
 DEF_HELPER_1(mfc0_debug, tl, env)
 DEF_HELPER_1(mftc0_debug, tl, env)
 #ifdef TARGET_MIPS64
@@ -89,6 +90,7 @@ DEF_HELPER_1(dmfc0_tcschefback, tl, env)
 DEF_HELPER_1(dmfc0_lladdr, tl, env)
 DEF_HELPER_1(dmfc0_maar, tl, env)
 DEF_HELPER_2(dmfc0_watchlo, tl, env, i32)
+DEF_HELPER_2(dmfc0_watchhi, tl, env, i32)
 DEF_HELPER_1(dmfc0_saar, tl, env)
 #endif /* TARGET_MIPS64 */
 
@@ -159,6 +161,7 @@ DEF_HELPER_2(mthc0_maar, void, env, tl)
 DEF_HELPER_2(mtc0_maari, void, env, tl)
 DEF_HELPER_3(mtc0_watchlo, void, env, tl, i32)
 DEF_HELPER_3(mtc0_watchhi, void, env, tl, i32)
+DEF_HELPER_3(mthc0_watchhi, void, env, tl, i32)
 DEF_HELPER_2(mtc0_xcontext, void, env, tl)
 DEF_HELPER_2(mtc0_framemask, void, env, tl)
 DEF_HELPER_2(mtc0_debug, void, env, tl)
diff --git a/target/mips/machine.c b/target/mips/machine.c
index c139239..8d5b18b 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -212,8 +212,8 @@ const VMStateDescription vmstate_tlb = {
 
 const VMStateDescription vmstate_mips_cpu = {
     .name = "cpu",
-    .version_id = 18,
-    .minimum_version_id = 18,
+    .version_id = 19,
+    .minimum_version_id = 19,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         /* Active TC */
@@ -296,7 +296,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_INT32(env.CP0_MAARI, MIPSCPU),
         VMSTATE_UINTTL(env.lladdr, MIPSCPU),
         VMSTATE_UINTTL_ARRAY(env.CP0_WatchLo, MIPSCPU, 8),
-        VMSTATE_INT32_ARRAY(env.CP0_WatchHi, MIPSCPU, 8),
+        VMSTATE_UINT64_ARRAY(env.CP0_WatchHi, MIPSCPU, 8),
         VMSTATE_UINTTL(env.CP0_XContext, MIPSCPU),
         VMSTATE_INT32(env.CP0_Framemask, MIPSCPU),
         VMSTATE_INT32(env.CP0_Debug, MIPSCPU),
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 79d44da..7425a88 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -945,7 +945,12 @@ target_ulong helper_mfc0_watchlo(CPUMIPSState *env, uint32_t sel)
 
 target_ulong helper_mfc0_watchhi(CPUMIPSState *env, uint32_t sel)
 {
-    return env->CP0_WatchHi[sel];
+    return (int32_t) env->CP0_WatchHi[sel];
+}
+
+target_ulong helper_mfhc0_watchhi(CPUMIPSState *env, uint32_t sel)
+{
+    return env->CP0_WatchHi[sel] >> 32;
 }
 
 target_ulong helper_mfc0_debug(CPUMIPSState *env)
@@ -1016,6 +1021,11 @@ target_ulong helper_dmfc0_watchlo(CPUMIPSState *env, uint32_t sel)
     return env->CP0_WatchLo[sel];
 }
 
+target_ulong helper_dmfc0_watchhi(CPUMIPSState *env, uint32_t sel)
+{
+    return env->CP0_WatchHi[sel];
+}
+
 target_ulong helper_dmfc0_saar(CPUMIPSState *env)
 {
     if ((env->CP0_SAARI & 0x3f) < 2) {
@@ -1869,11 +1879,20 @@ void helper_mtc0_watchlo(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 
 void helper_mtc0_watchhi(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 {
-    int mask = 0x40000FF8 | (env->CP0_EntryHi_ASID_mask << CP0WH_ASID);
+    uint64_t mask = 0x40000FF8 | (env->CP0_EntryHi_ASID_mask << CP0WH_ASID);
+    if ((env->CP0_Config5 >> CP0C5_MI) & 1) {
+        mask |= 0xFFFFFFFF00000000ULL; /* MMID */
+    }
     env->CP0_WatchHi[sel] = arg1 & mask;
     env->CP0_WatchHi[sel] &= ~(env->CP0_WatchHi[sel] & arg1 & 0x7);
 }
 
+void helper_mthc0_watchhi(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
+{
+    env->CP0_WatchHi[sel] = ((uint64_t) (arg1) << 32) |
+                            (env->CP0_WatchHi[sel] & 0x00000000ffffffffULL);
+}
+
 void helper_mtc0_xcontext(CPUMIPSState *env, target_ulong arg1)
 {
     target_ulong mask = (1ULL << (env->SEGBITS - 7)) - 1;
diff --git a/target/mips/translate.c b/target/mips/translate.c
index efe75e6..d51330c 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2547,6 +2547,7 @@ typedef struct DisasContext {
     bool nan2008;
     bool abs2008;
     bool saar;
+    bool mi;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -6783,6 +6784,25 @@ static void gen_mfhc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         break;
+    case CP0_REGISTER_19:
+        switch (sel) {
+        case CP0_REG19__WATCHHI0:
+        case CP0_REG19__WATCHHI1:
+        case CP0_REG19__WATCHHI2:
+        case CP0_REG19__WATCHHI3:
+        case CP0_REG19__WATCHHI4:
+        case CP0_REG19__WATCHHI5:
+        case CP0_REG19__WATCHHI6:
+        case CP0_REG19__WATCHHI7:
+            /* upper 32 bits are only available when Config5MI != 0 */
+            CP0_CHECK(ctx->mi);
+            gen_mfhc0_load64(arg, offsetof(CPUMIPSState, CP0_WatchHi[sel]), 0);
+            register_name = "WatchHi";
+            break;
+        default:
+            goto cp0_unimplemented;
+        }
+        break;
     case CP0_REGISTER_28:
         switch (sel) {
         case 0:
@@ -6869,6 +6889,25 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         break;
+    case CP0_REGISTER_19:
+        switch (sel) {
+        case CP0_REG19__WATCHHI0:
+        case CP0_REG19__WATCHHI1:
+        case CP0_REG19__WATCHHI2:
+        case CP0_REG19__WATCHHI3:
+        case CP0_REG19__WATCHHI4:
+        case CP0_REG19__WATCHHI5:
+        case CP0_REG19__WATCHHI6:
+        case CP0_REG19__WATCHHI7:
+            /* upper 32 bits are only available when Config5MI != 0 */
+            CP0_CHECK(ctx->mi);
+            gen_helper_0e1i(mthc0_watchhi, arg, sel);
+            register_name = "WatchHi";
+            break;
+        default:
+            goto cp0_unimplemented;
+        }
+        break;
     case CP0_REGISTER_28:
         switch (sel) {
         case 0:
@@ -8922,7 +8961,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case CP0_REG19__WATCHHI6:
         case CP0_REG19__WATCHHI7:
             CP0_CHECK(ctx->CP0_Config1 & (1 << CP0C1_WR));
-            gen_helper_1e0i(mfc0_watchhi, arg, sel);
+            gen_helper_1e0i(dmfc0_watchhi, arg, sel);
             register_name = "WatchHi";
             break;
         default:
@@ -30727,6 +30766,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
     ctx->nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
+    ctx->mi = (env->CP0_Config5 >> CP0C5_MI) & 1;
     restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
         ctx->mem_idx = MIPS_HFLAG_UM;
-- 
2.7.4


