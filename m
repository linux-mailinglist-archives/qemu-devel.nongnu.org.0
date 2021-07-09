Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077AE3C1ED0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:19:59 +0200 (CEST)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ivd-0003vz-HE
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:19:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itZ-0000rm-IK; Fri, 09 Jul 2021 01:17:49 -0400
Received: from ozlabs.org ([203.11.71.1]:44035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itV-0001pJ-KH; Fri, 09 Jul 2021 01:17:49 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd0tGnz9sWq; Fri,  9 Jul 2021 15:17:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=NgKKvWQQ4LgL+Vxg0v2t69b+p8LZ8h4r1BzGx9jw3sY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S72yEXZgkCKohVBBBT1brp1UW20iGVlbG4ORaSdghJ1K6G64AqjS5f5LzpjGOF0X9
 HouSdMhuuHc6cMOrYtlxRc4pwEN/jHF4Xz+63EVkIXdRbbAJQ8IXjy0qDXh4evL2TO
 2f7X0vWVcO72S7DZRl9RXZSrysuZPPQQIExPzrFE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/33] target/ppc: Introduce ppc_interrupts_little_endian()
Date: Fri,  9 Jul 2021 15:16:56 +1000
Message-Id: <20210709051728.170203-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

PowerPC CPUs use big endian by default but starting with POWER7,
server grade CPUs use the ILE bit of the LPCR special purpose
register to decide on the endianness to use when handling
interrupts. This gives a clue to QEMU on the endianness the
guest kernel is running, which is needed when generating an
ELF dump of the guest or when delivering an FWNMI machine
check interrupt.

Commit 382d2db62bcb ("target-ppc: Introduce callback for interrupt
endianness") added a class method to PowerPCCPUClass to modelize
this : default implementation returns a fixed "big endian" value,
while POWER7 and newer do the LPCR_ILE check. This is suboptimal
as it forces to implement the method for every new CPU family, and
it is very unlikely that this will ever be different than what we
have today.

We basically only have three cases to consider:
a) CPU doesn't have an LPCR => big endian
b) CPU has an LPCR but doesn't support the ILE bit => big endian
c) CPU has an LPCR and supports the ILE bit => little or big endian

Instead of class methods, introduce an inline helper that checks the
ILE bit in the LPCR_MASK to decide on the outcome. The new helper
words little endian instead of big endian. This allows to drop a !
operator in ppc_cpu_do_fwnmi_machine_check().

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20210622140926.677618-2-groug@kaod.org>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/arch_dump.c   |  8 +++-----
 target/ppc/cpu.h         | 15 +++++++++++++++
 target/ppc/excp_helper.c |  3 +--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 9210e61ef4..bb392f6d88 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -227,22 +227,20 @@ int cpu_get_dump_info(ArchDumpInfo *info,
                       const struct GuestPhysBlockList *guest_phys_blocks)
 {
     PowerPCCPU *cpu;
-    PowerPCCPUClass *pcc;
 
     if (first_cpu == NULL) {
         return -1;
     }
 
     cpu = POWERPC_CPU(first_cpu);
-    pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     info->d_machine = PPC_ELF_MACHINE;
     info->d_class = ELFCLASS;
 
-    if ((*pcc->interrupts_big_endian)(cpu)) {
-        info->d_endian = ELFDATA2MSB;
-    } else {
+    if (ppc_interrupts_little_endian(cpu)) {
         info->d_endian = ELFDATA2LSB;
+    } else {
+        info->d_endian = ELFDATA2MSB;
     }
     /* 64KB is the max page size for pseries kernel */
     if (strncmp(object_get_typename(qdev_get_machine()),
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b4de0db7ff..93d308ac8f 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2643,6 +2643,21 @@ static inline bool ppc_has_spr(PowerPCCPU *cpu, int spr)
     return cpu->env.spr_cb[spr].name != NULL;
 }
 
+static inline bool ppc_interrupts_little_endian(PowerPCCPU *cpu)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+
+    /*
+     * Only models that have an LPCR and know about LPCR_ILE can do little
+     * endian.
+     */
+    if (pcc->lpcr_mask & LPCR_ILE) {
+        return !!(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
+    }
+
+    return false;
+}
+
 void dump_mmu(CPUPPCState *env);
 
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index fd147e2a37..a79a0ed465 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1099,7 +1099,6 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
     target_ulong msr = 0;
 
     /*
@@ -1108,7 +1107,7 @@ void ppc_cpu_do_fwnmi_machine_check(CPUState *cs, target_ulong vector)
      */
     msr = (1ULL << MSR_ME);
     msr |= env->msr & (1ULL << MSR_SF);
-    if (!(*pcc->interrupts_big_endian)(cpu)) {
+    if (ppc_interrupts_little_endian(cpu)) {
         msr |= (1ULL << MSR_LE);
     }
 
-- 
2.31.1


