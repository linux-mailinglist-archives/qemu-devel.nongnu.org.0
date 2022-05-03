Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9B1519171
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:32:40 +0200 (CEST)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm14R-0000LZ-4j
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz7n-0007I6-EM; Tue, 03 May 2022 16:27:59 -0400
Received: from [187.72.171.209] (port=8548 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz7l-0005tQ-NJ; Tue, 03 May 2022 16:27:59 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 3 May 2022 17:25:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CF1CA801109;
 Tue,  3 May 2022 17:25:39 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 18/21] target/ppc: Remove msr_ts macro
Date: Tue,  3 May 2022 17:24:38 -0300
Message-Id: <20220503202441.129549-19-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2022 20:25:40.0245 (UTC)
 FILETIME=[F4C89C50:01D85F2B]
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

msr_ts macro hides the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h     | 2 +-
 target/ppc/kvm.c     | 4 ++--
 target/ppc/machine.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cc7ca1d47d..daf1204a6a 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, TS, MSR_TS0, 2)
 FIELD(MSR, CM, MSR_CM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
 FIELD(MSR, POW, MSR_POW, 1)
@@ -493,7 +494,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #else
 #define msr_hv   (0)
 #endif
-#define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8276326de9..59db1b9227 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -973,7 +973,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
 
 #ifdef TARGET_PPC64
-        if (msr_ts) {
+        if (FIELD_EX64(env->msr, MSR, TS)) {
             for (i = 0; i < ARRAY_SIZE(env->tm_gpr); i++) {
                 kvm_set_one_reg(cs, KVM_REG_PPC_TM_GPR(i), &env->tm_gpr[i]);
             }
@@ -1281,7 +1281,7 @@ int kvm_arch_get_registers(CPUState *cs)
         }
 
 #ifdef TARGET_PPC64
-        if (msr_ts) {
+        if (FIELD_EX64(env->msr, MSR, TS)) {
             for (i = 0; i < ARRAY_SIZE(env->tm_gpr); i++) {
                 kvm_get_one_reg(cs, KVM_REG_PPC_TM_GPR(i), &env->tm_gpr[i]);
             }
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index e673944597..7104a5c67e 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -417,7 +417,7 @@ static bool tm_needed(void *opaque)
 {
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
-    return msr_ts;
+    return FIELD_EX64(env->msr, MSR, TS);
 }
 
 static const VMStateDescription vmstate_tm = {
-- 
2.25.1


