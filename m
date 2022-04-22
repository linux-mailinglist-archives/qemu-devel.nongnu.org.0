Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8580050C049
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:24:35 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhytO-0007hi-6T
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTe-0008IN-JO; Fri, 22 Apr 2022 14:57:58 -0400
Received: from [187.72.171.209] (port=45652 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTd-0000lo-3V; Fri, 22 Apr 2022 14:57:58 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8A416800902;
 Fri, 22 Apr 2022 15:54:55 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 18/20] target/ppc: Substitute msr_ts macro with new M_MSR_TS
 macro
Date: Fri, 22 Apr 2022 15:54:48 -0300
Message-Id: <20220422185450.107256-19-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:55.0796 (UTC)
 FILETIME=[75185F40:01D8567A]
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h     | 4 +++-
 target/ppc/kvm.c     | 4 ++--
 target/ppc/machine.c | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b957fc95e0..ee00b27818 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,9 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#define M_MSR_TS0 (1ull << MSR_TS0)
+#define M_MSR_TS1 (1ull << MSR_TS1)
+#define M_MSR_TS (M_MSR_TS0 | M_MSR_TS1)
 #define M_MSR_CM (1ull << MSR_CM)
 #define M_MSR_GS (1ull << MSR_GS)
 #define M_MSR_POW (1ull << MSR_POW)
@@ -486,7 +489,6 @@ typedef enum {
 #else
 #define msr_hv   (0)
 #endif
-#define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 1ca18f21b2..3cccac41fd 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -973,7 +973,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
 
 #ifdef TARGET_PPC64
-        if (msr_ts) {
+        if (env->msr & M_MSR_TS) {
             for (i = 0; i < ARRAY_SIZE(env->tm_gpr); i++) {
                 kvm_set_one_reg(cs, KVM_REG_PPC_TM_GPR(i), &env->tm_gpr[i]);
             }
@@ -1281,7 +1281,7 @@ int kvm_arch_get_registers(CPUState *cs)
         }
 
 #ifdef TARGET_PPC64
-        if (msr_ts) {
+        if (env->msr & M_MSR_TS) {
             for (i = 0; i < ARRAY_SIZE(env->tm_gpr); i++) {
                 kvm_get_one_reg(cs, KVM_REG_PPC_TM_GPR(i), &env->tm_gpr[i]);
             }
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index e673944597..51832c4bde 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -417,7 +417,7 @@ static bool tm_needed(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
-    return msr_ts;
+    return env->msr & M_MSR_TS;
 }
 
 static const VMStateDescription vmstate_tm = {
-- 
2.25.1


