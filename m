Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D035FBD2D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:48:07 +0200 (CEST)
Received: from localhost ([::1]:59378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiN6b-0004ub-T0
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMHL-0005zL-Sv; Tue, 11 Oct 2022 16:55:09 -0400
Received: from [200.168.210.66] (port=22547 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMHJ-0002M1-Nt; Tue, 11 Oct 2022 16:55:07 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 11 Oct 2022 17:48:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 2551C80077C;
 Tue, 11 Oct 2022 17:48:44 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v3 26/29] target/ppc: remove ppc_store_lpcr from
 CONFIG_USER_ONLY builds
Date: Tue, 11 Oct 2022 17:48:26 -0300
Message-Id: <20221011204829.1641124-27-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Oct 2022 20:48:44.0422 (UTC)
 FILETIME=[DA530260:01D8DDB2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Writes to LPCR are hypervisor privileged.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu.c | 2 ++
 target/ppc/cpu.h | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/ppc/cpu.c b/target/ppc/cpu.c
index 0ebac04bc4..e95b4c5ee1 100644
--- a/target/ppc/cpu.c
+++ b/target/ppc/cpu.c
@@ -73,6 +73,7 @@ void ppc_store_msr(CPUPPCState *env, target_ulong value)
     hreg_store_msr(env, value, 0);
 }
 
+#if !defined(CONFIG_USER_ONLY)
 void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
 {
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
@@ -82,6 +83,7 @@ void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
     /* The gtse bit affects hflags */
     hreg_compute_hflags(env);
 }
+#endif
 
 static inline void fpscr_set_rounding_mode(CPUPPCState *env)
 {
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 2433756973..ad758b00e5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1370,9 +1370,9 @@ void ppc_translate_init(void);
 
 #if !defined(CONFIG_USER_ONLY)
 void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 #endif /* !defined(CONFIG_USER_ONLY) */
 void ppc_store_msr(CPUPPCState *env, target_ulong value);
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 
 void ppc_cpu_list(void);
 
-- 
2.25.1


