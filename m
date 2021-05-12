Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C437C00F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:27:40 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgppr-00010K-K5
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpZ9-00064F-1Z; Wed, 12 May 2021 10:10:23 -0400
Received: from [201.28.113.2] (port=32758 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lgpZ5-0000Pm-3d; Wed, 12 May 2021 10:10:22 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 12 May 2021 11:08:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 3CA828000C2;
 Wed, 12 May 2021 11:08:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] target/ppc: added KVM fallback to fpscr manipulation
Date: Wed, 12 May 2021 11:08:09 -0300
Message-Id: <20210512140813.112884-8-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 12 May 2021 14:08:39.0384 (UTC)
 FILETIME=[4EA42580:01D74738]
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 luis.pires@eldorado.org.br, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 "Bruno Larsen \(billionai\)" <bruno.larsen@eldorado.org.br>,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

some common code needs to store information in fpscr, but this function
relies on TCG cde to work. This patch adds a kvm way to do it, and a
transparent way to call it when TCG is not compiled

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
---
 target/ppc/gdbstub.c |  1 +
 target/ppc/kvm.c     | 14 ++++++++++++++
 target/ppc/kvm_ppc.h |  6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 17e41fc113..65759e0c1c 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "internal.h"
 #include "helper_regs.h"
+#include "kvm_ppc.h"
 
 static int ppc_gdb_register_len_apple(int n)
 {
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 104a308abb..a8a720eb48 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2947,3 +2947,17 @@ bool kvm_arch_cpu_check_are_resettable(void)
 {
     return true;
 }
+
+void kvmppc_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask)
+{
+    CPUState *cs = env_cpu(env);
+    struct kvm_one_reg reg;
+    int ret;
+    reg.id = KVM_REG_PPC_FPSCR;
+    reg.addr = (uintptr_t) &env->fpscr;
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret < 0)
+    {
+        fprintf(stderr, "Unable to set FPSCR to KVM: %s", strerror(errno));
+    }
+}
diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
index 989f61ace0..ff365e57a6 100644
--- a/target/ppc/kvm_ppc.h
+++ b/target/ppc/kvm_ppc.h
@@ -86,6 +86,12 @@ void kvmppc_set_reg_tb_offset(PowerPCCPU *cpu, int64_t tb_offset);
 
 int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
 
+#ifndef CONFIG_TCG
+# define store_fpscr kvmppc_store_fpscr
+#endif
+void kvmppc_store_fpscr(CPUPPCState *env, uint64_t arg, uint32_t mask);
+
+
 #else
 
 static inline uint32_t kvmppc_get_tbfreq(void)
-- 
2.17.1


