Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC3C35A231
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 17:44:23 +0200 (CEST)
Received: from localhost ([::1]:53712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtJ0-00075s-EZ
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 11:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCb-0002S8-LT; Fri, 09 Apr 2021 11:37:45 -0400
Received: from [201.28.113.2] (port=41884 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lUtCY-0002YS-3q; Fri, 09 Apr 2021 11:37:45 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 9 Apr 2021 12:19:21 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 6B82A800172;
 Fri,  9 Apr 2021 12:19:21 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] target/ppc: added solutions for building with disable-tcg
Date: Fri,  9 Apr 2021 12:19:14 -0300
Message-Id: <20210409151916.97326-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
References: <20210409151916.97326-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 09 Apr 2021 15:19:21.0594 (UTC)
 FILETIME=[B79045A0:01D72D53]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: lucas.araujo@eldorado.org.br, lagarcia@br.ibm.com,
 luis.pires@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, andre.silva@eldorado.org.br,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this commit presents 2 possible solutions for substituting TCG emulation
with KVM calls. One - used in machine.c and arch_dump.c - explicitly
adds the KVM function and has the possibility of adding the TCG one
for more generic compilation, prioritizing te KVM option. The second
option, implemented in kvm_ppc.h, transparently changes the helper
into the KVM call, if TCG is not enabled. I believe the first solution
is better, but it is less readable, so I wanted to have some feedback

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/arch_dump.c | 17 +++++++++++++++++
 target/ppc/kvm.c       | 30 ++++++++++++++++++++++++++++++
 target/ppc/kvm_ppc.h   | 11 +++++++++++
 target/ppc/machine.c   | 33 ++++++++++++++++++++++++++++++++-
 4 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index 9ab04b2c38..c53e01011a 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -17,7 +17,10 @@
 #include "elf.h"
 #include "sysemu/dump.h"
 #include "sysemu/kvm.h"
+#include "kvm_ppc.h"
+#if defined(CONFIG_TCG)
 #include "exec/helper-proto.h"
+#endif /* CONFIG_TCG */
 
 #ifdef TARGET_PPC64
 #define ELFCLASS ELFCLASS64
@@ -176,7 +179,21 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
             vmxregset->avr[i].u64[1] = avr->u64[1];
         }
     }
+    /* This is the first solution implemented. My personal favorite as it
+     * allows for explicit error handling, however it is much less readable */
+#if defined(CONFIG_KVM)
+    if(kvm_enabled()){
+        vmxregset->vscr.u32[3] = cpu_to_dump32(s, kvmppc_mfvscr(cpu));
+    }else
+#endif
+
+#if defined(CONFIG_TCG)
     vmxregset->vscr.u32[3] = cpu_to_dump32(s, helper_mfvscr(&cpu->env));
+#else
+    {
+        /* TODO: add proper error handling, even tough this should never be reached */
+    }
+#endif
 }
 
 static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb..8ed54d12d8 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -51,6 +51,7 @@
 #include "elf.h"
 #include "sysemu/kvm_int.h"
 
+
 #define PROC_DEVTREE_CPU      "/proc/device-tree/cpus/"
 
 #define DEBUG_RETURN_GUEST 0
@@ -2947,3 +2948,32 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+/* Functions added to replace helper_m(t|f)vscr from int_helper.c */
+int kvmppc_mtvscr(PowerPCCPU *cpu, uint32_t val){
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int ret;
+    reg.id = KVM_REG_PPC_VSCR;
+    reg.addr = (uintptr_t) &env->vscr;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if(ret < 0){
+        fprintf(stderr, "Unable to set VSCR to KVM: %s", strerror(errno));
+    }
+    return ret;
+}
+
+int kvmppc_mfvscr(PowerPCCPU *cpu){
+    CPUState *cs = CPU(cpu);
+    CPUPPCState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    int ret;
+    reg.id = KVM_REG_PPC_VSCR;
+    reg.addr = (uintptr_t) &env->vscr;
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if(ret < 0){
+        fprintf(stderr, "Unable to get VSCR to KVM: %s", strerror(errno));
+    }
+    return ret;
+}
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 989f61ace0..f618cb28b1 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -86,6 +86,17 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
 
 int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
 
+int kvmppc_mtvscr(PowerPCCPU*, uint32_t);
+int kvmppc_mfvscr(PowerPCCPU*);
+
+/* This is the second (quick and dirty) solution. Not my personal favorite
+ * as it hides what is actually happening from the user and doesn't allow
+ * for error checking. but it requires less change in other files */
+#ifndef CONFIG_TCG
+#define helper_mtvscr(env, val) kvmppc_mtvscr(env_archcpu(env),val)
+#define helper_mfvscr(env) kvmppc_mfvscr(env_archcpu(env))
+#endif
+
 #else
 
 static inline uint32_t kvmppc_get_tbfreq(void)
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 283db1d28a..d92bc18859 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -8,7 +8,9 @@
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "kvm_ppc.h"
+#ifdef CONFIG_TCG
 #include "exec/helper-proto.h"
+#endif /*CONFIG_TCG*/
 
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
 {
@@ -95,7 +97,18 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
         ppc_store_sdr1(env, sdr1);
     }
     qemu_get_be32s(f, &vscr);
-    helper_mtvscr(env, vscr);
+#if defined(CONFIG_KVM)
+    if(kvm_enabled()){
+        kvmppc_mtvscr(cpu, vscr);
+    }else
+#endif
+#if defined(CONFIG_TCG)
+        helper_mtvscr(env, vscr);
+#else
+    {
+        /* TODO: Add correct error handling, even though this should never be reached */
+    }
+#endif
     qemu_get_be64s(f, &env->spe_acc);
     qemu_get_be32s(f, &env->spe_fscr);
     qemu_get_betls(f, &env->msr_mask);
@@ -450,7 +463,16 @@ static int get_vscr(QEMUFile *f, void *opaque, size_t size,
                     const VMStateField *field)
 {
     PowerPCCPU *cpu = opaque;
+#if defined(CONFIG_KVM)
+    if(kvm_enabled()){
+        kvmppc_mtvscr(cpu, qemu_get_be32(f));
+        return 0;
+    }
+#endif /*CONFIG_KVM*/
+
+#if defined(CONFIG_TCG)
     helper_mtvscr(&cpu->env, qemu_get_be32(f));
+#endif /*CONFIG_TCG*/
     return 0;
 }
 
@@ -458,7 +480,16 @@ static int put_vscr(QEMUFile *f, void *opaque, size_t size,
                     const VMStateField *field, JSONWriter *vmdesc)
 {
     PowerPCCPU *cpu = opaque;
+#if defined(CONFIG_KVM)
+    if(kvm_enabled()){
+        qemu_put_be32(f, kvmppc_mfvscr(cpu));
+        return 0;
+    }
+#endif /*CONFIG_KVM*/
+
+#if defined(CONFIG_TCG)
     qemu_put_be32(f, helper_mfvscr(&cpu->env));
+#endif /*CONFIG_TCG*/
     return 0;
 }
 
-- 
2.17.1


