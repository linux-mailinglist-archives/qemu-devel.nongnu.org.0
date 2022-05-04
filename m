Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6521551B030
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:13:29 +0200 (CEST)
Received: from localhost ([::1]:52462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMJM-0006s3-Ep
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmME9-0001Vp-DO; Wed, 04 May 2022 17:08:05 -0400
Received: from [187.72.171.209] (port=62190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmME7-0007Ne-RF; Wed, 04 May 2022 17:08:05 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:48 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id E0650800902;
 Wed,  4 May 2022 18:07:47 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 04/22] target/ppc: Remove msr_le macro
Date: Wed,  4 May 2022 18:05:23 -0300
Message-Id: <20220504210541.115256-5-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:48.0289 (UTC)
 FILETIME=[02074310:01D85FFB]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

msr_le macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h        |  2 +-
 target/ppc/cpu_init.c   |  2 +-
 target/ppc/gdbstub.c    |  2 +-
 target/ppc/mem_helper.c | 16 ++++++++--------
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8f1dc4cb15..c561d664de 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -355,6 +355,7 @@ typedef enum {
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, LE, MSR_LE, 1)
 
 /* PMU bits */
 #define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
@@ -486,7 +487,6 @@ FIELD(MSR, PR, MSR_PR, 1)
 #define msr_ir   ((env->msr >> MSR_IR)   & 1)
 #define msr_dr   ((env->msr >> MSR_DR)   & 1)
 #define msr_ds   ((env->msr >> MSR_DS)   & 1)
-#define msr_le   ((env->msr >> MSR_LE)   & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ac16a64846..0c6b83406e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7210,7 +7210,7 @@ static bool ppc_cpu_is_big_endian(CPUState *cs)
 
     cpu_synchronize_state(cs);
 
-    return !msr_le;
+    return !FIELD_EX64(env->msr, MSR, LE);
 }
 
 #ifdef CONFIG_TCG
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 1252429a2a..1a0b9ca82c 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -95,7 +95,7 @@ static int ppc_gdb_register_len(int n)
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
 {
 #ifndef CONFIG_USER_ONLY
-    if (!msr_le) {
+    if (!FIELD_EX64(env->msr, MSR, LE)) {
         /* do nothing */
     } else if (len == 4) {
         bswap32s((uint32_t *)mem_buf);
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index fba7f84b7a..9af135e88e 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -33,9 +33,9 @@
 static inline bool needs_byteswap(const CPUPPCState *env)
 {
 #if TARGET_BIG_ENDIAN
-  return msr_le;
+  return FIELD_EX64(env->msr, MSR, LE);
 #else
-  return !msr_le;
+  return !FIELD_EX64(env->msr, MSR, LE);
 #endif
 }
 
@@ -470,8 +470,8 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
 #endif
 
 /*
- * We use msr_le to determine index ordering in a vector.  However,
- * byteswapping is not simply controlled by msr_le.  We also need to
+ * We use MSR_LE to determine index ordering in a vector.  However,
+ * byteswapping is not simply controlled by MSR_LE.  We also need to
  * take into account endianness of the target.  This is done for the
  * little-endian PPC64 user-mode target.
  */
@@ -484,7 +484,7 @@ uint32_t helper_stqcx_be_parallel(CPUPPCState *env, target_ulong addr,
         int adjust = HI_IDX * (n_elems - 1);                    \
         int sh = sizeof(r->element[0]) >> 1;                    \
         int index = (addr & 0xf) >> sh;                         \
-        if (msr_le) {                                           \
+        if (FIELD_EX64(env->msr, MSR, LE)) {                    \
             index = n_elems - index - 1;                        \
         }                                                       \
                                                                 \
@@ -511,7 +511,7 @@ LVE(lvewx, cpu_ldl_data_ra, bswap32, u32)
         int adjust = HI_IDX * (n_elems - 1);                            \
         int sh = sizeof(r->element[0]) >> 1;                            \
         int index = (addr & 0xf) >> sh;                                 \
-        if (msr_le) {                                                   \
+        if (FIELD_EX64(env->msr, MSR, LE)) {                            \
             index = n_elems - index - 1;                                \
         }                                                               \
                                                                         \
@@ -545,7 +545,7 @@ void helper_##name(CPUPPCState *env, target_ulong addr,                 \
     t.s128 = int128_zero();                                             \
     if (nb) {                                                           \
         nb = (nb >= 16) ? 16 : nb;                                      \
-        if (msr_le && !lj) {                                            \
+        if (FIELD_EX64(env->msr, MSR, LE) && !lj) {                     \
             for (i = 16; i > 16 - nb; i--) {                            \
                 t.VsrB(i - 1) = cpu_ldub_data_ra(env, addr, GETPC());   \
                 addr = addr_add(env, addr, 1);                          \
@@ -576,7 +576,7 @@ void helper_##name(CPUPPCState *env, target_ulong addr,           \
     }                                                             \
                                                                   \
     nb = (nb >= 16) ? 16 : nb;                                    \
-    if (msr_le && !lj) {                                          \
+    if (FIELD_EX64(env->msr, MSR, LE) && !lj) {                   \
         for (i = 16; i > 16 - nb; i--) {                          \
             cpu_stb_data_ra(env, addr, xt->VsrB(i - 1), GETPC()); \
             addr = addr_add(env, addr, 1);                        \
-- 
2.25.1


