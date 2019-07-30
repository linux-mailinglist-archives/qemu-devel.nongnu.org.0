Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E937B2BA
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 20:55:50 +0200 (CEST)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsXHp-0007vL-Vb
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 14:55:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsXGZ-0006gt-2d
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hsXGX-0001An-IG
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:31 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35265 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hsXGX-0008Sb-6s
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 14:54:29 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 9306F1A221F;
 Tue, 30 Jul 2019 20:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 66BE11A221A;
 Tue, 30 Jul 2019 20:53:24 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 30 Jul 2019 20:53:14 +0200
Message-Id: <1564512798-25527-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564512798-25527-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564512798-25527-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v3 2/6] target/mips: Amend CP0 WatchHi
 register implementation
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

WatchHi is extended by the field MemoryMapID with the GINVT instruction.
The field is accessible by MTHC0/MFHC0 in 32-bit architectures and DMTC0/
DMFC0 in 64-bit architectures.

Signed-off-by: Yongbok Kim <yongbok.kim@mips.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/cpu.h       |  2 +-
 target/mips/helper.h    |  3 +++
 target/mips/machine.c   |  6 +++---
 target/mips/op_helper.c | 23 +++++++++++++++++++++--
 target/mips/translate.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 69 insertions(+), 7 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 90a2ed8..6406ba8 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -898,7 +898,7 @@ struct CPUMIPSState {
 /*
  * CP0 Register 19
  */
-    int32_t CP0_WatchHi[8];
+    uint64_t CP0_WatchHi[8];
 #define CP0WH_ASID 16
 /*
  * CP0 Register 20
diff --git a/target/mips/helper.h b/target/mips/helper.h
index 51f0e1c..aad0951 100644
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
index eb2d970..c3e52f8 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -213,8 +213,8 @@ const VMStateDescription vmstate_tlb = {
 
 const VMStateDescription vmstate_mips_cpu = {
     .name = "cpu",
-    .version_id = 18,
-    .minimum_version_id = 18,
+    .version_id = 19,
+    .minimum_version_id = 19,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         /* Active TC */
@@ -297,7 +297,7 @@ const VMStateDescription vmstate_mips_cpu = {
         VMSTATE_INT32(env.CP0_MAARI, MIPSCPU),
         VMSTATE_UINTTL(env.lladdr, MIPSCPU),
         VMSTATE_UINTTL_ARRAY(env.CP0_WatchLo, MIPSCPU, 8),
-        VMSTATE_INT32_ARRAY(env.CP0_WatchHi, MIPSCPU, 8),
+        VMSTATE_UINT64_ARRAY(env.CP0_WatchHi, MIPSCPU, 8),
         VMSTATE_UINTTL(env.CP0_XContext, MIPSCPU),
         VMSTATE_INT32(env.CP0_Framemask, MIPSCPU),
         VMSTATE_INT32(env.CP0_Debug, MIPSCPU),
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index f7b8c4d..52853e9 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -979,7 +979,12 @@ target_ulong helper_mfc0_watchlo(CPUMIPSState *env, uint32_t sel)
 
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
@@ -1055,6 +1060,11 @@ target_ulong helper_dmfc0_saar(CPUMIPSState *env)
     }
     return 0;
 }
+
+target_ulong helper_dmfc0_watchhi(CPUMIPSState *env, uint32_t sel)
+{
+    return env->CP0_WatchHi[sel];
+}
 #endif /* TARGET_MIPS64 */
 
 void helper_mtc0_index(CPUMIPSState *env, target_ulong arg1)
@@ -1892,11 +1902,20 @@ void helper_mtc0_watchlo(CPUMIPSState *env, target_ulong arg1, uint32_t sel)
 
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
index 4ebeabe..8c298f5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -2547,6 +2547,7 @@ typedef struct DisasContext {
     bool nan2008;
     bool abs2008;
     bool saar;
+    bool mi;
 } DisasContext;
 
 #define DISAS_STOP       DISAS_TARGET_0
@@ -6680,6 +6681,25 @@ static void gen_mfhc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         break;
+    case CP0_REGISTER_19:
+        switch (sel) {
+        case 0:
+        case 1:
+        case 2:
+        case 3:
+        case 4:
+        case 5:
+        case 6:
+        case 7:
+            /* upper 32 bits are only available when Config5MI != 0 */
+            CP0_CHECK(ctx->mi);
+            gen_mfhc0_load64(arg, offsetof(CPUMIPSState, CP0_WatchHi[sel]), 0);
+            rn = "WatchHi";
+            break;
+        default:
+            goto cp0_unimplemented;
+        }
+        break;
     case CP0_REGISTER_28:
         switch (sel) {
         case 0:
@@ -6766,6 +6786,25 @@ static void gen_mthc0(DisasContext *ctx, TCGv arg, int reg, int sel)
             goto cp0_unimplemented;
         }
         break;
+    case CP0_REGISTER_19:
+        switch (sel) {
+        case 0:
+        case 1:
+        case 2:
+        case 3:
+        case 4:
+        case 5:
+        case 6:
+        case 7:
+            /* upper 32 bits are only available when Config5MI != 0 */
+            CP0_CHECK(ctx->mi);
+            gen_helper_0e1i(mthc0_watchhi, arg, sel);
+            rn = "WatchHi";
+            break;
+        default:
+            goto cp0_unimplemented;
+        }
+        break;
     case CP0_REGISTER_28:
         switch (sel) {
         case 0:
@@ -8805,7 +8844,7 @@ static void gen_dmfc0(DisasContext *ctx, TCGv arg, int reg, int sel)
         case 6:
         case 7:
             CP0_CHECK(ctx->CP0_Config1 & (1 << CP0C1_WR));
-            gen_helper_1e0i(mfc0_watchhi, arg, sel);
+            gen_helper_1e0i(dmfc0_watchhi, arg, sel);
             register_name = "WatchHi";
             break;
         default:
@@ -29965,6 +30004,7 @@ static void mips_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mrp = (env->CP0_Config5 >> CP0C5_MRP) & 1;
     ctx->nan2008 = (env->active_fpu.fcr31 >> FCR31_NAN2008) & 1;
     ctx->abs2008 = (env->active_fpu.fcr31 >> FCR31_ABS2008) & 1;
+    ctx->mi = (env->CP0_Config5 >> CP0C5_MI) & 1;
     restore_cpu_state(env, ctx);
 #ifdef CONFIG_USER_ONLY
         ctx->mem_idx = MIPS_HFLAG_UM;
-- 
2.7.4


