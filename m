Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46ABAFDA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 10:43:48 +0200 (CEST)
Received: from localhost ([::1]:53744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCJwd-00032k-RR
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 04:43:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48434)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1iCJun-0001bW-2t
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:41:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1iCJul-0005s7-HF
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 04:41:48 -0400
Received: from ozlabs.ru ([107.173.13.209]:44440)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1iCJul-0005ll-Bn; Mon, 23 Sep 2019 04:41:47 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id B73ACAE80017;
 Mon, 23 Sep 2019 04:40:39 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu] ppc/kvm: Skip writing DPDES back when in run time state
Date: Mon, 23 Sep 2019 18:41:10 +1000
Message-Id: <20190923084110.34643-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On POWER8 systems the Directed Privileged Door-bell Exception State
register (DPDES) stores doorbell pending status, one bit per a thread
of a core, set by "msgsndp" instruction. The register is shared among
threads of the same core and KVM on POWER9 emulates it in a similar way
(POWER9 does not have DPDES).

DPDES is shared but QEMU assumes all SPRs are per thread so the only safe
way to write DPDES back to VCPU before running a guest is doing so
while all threads are pulled out of the guest so DPDES cannot change.
There is only one situation when this condition is met: incoming migration
when all threads are stopped. Otherwise any QEMU HMP/QMP command causing
kvm_arch_put_registers() (for example printing registers or dumping memory)
can clobber DPDES in a race with other vcpu threads.

This changes DPDES handling so it is not written to KVM at runtime.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 target/ppc/kvm.c                | 5 +++++
 target/ppc/translate_init.inc.c | 9 ++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 8c5b1f25cc95..820724cc7d15 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -993,6 +993,10 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
 
         kvm_set_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &env->tb_env->tb_offset);
+
+        if (level > KVM_PUT_RUNTIME_STATE) {
+            kvm_put_one_spr(cs, KVM_REG_PPC_DPDES, SPR_DPDES);
+        }
 #endif /* TARGET_PPC64 */
     }
 
@@ -1297,6 +1301,7 @@ int kvm_arch_get_registers(CPUState *cs)
         }
 
         kvm_get_one_reg(cs, KVM_REG_PPC_TB_OFFSET, &env->tb_env->tb_offset);
+        kvm_get_one_spr(cs, KVM_REG_PPC_DPDES, SPR_DPDES);
 #endif
     }
 
diff --git a/target/ppc/translate_init.inc.c b/target/ppc/translate_init.inc.c
index 0fb11c7ac6da..ba726dec4d00 100644
--- a/target/ppc/translate_init.inc.c
+++ b/target/ppc/translate_init.inc.c
@@ -8200,11 +8200,10 @@ static void gen_spr_power8_dpdes(CPUPPCState *env)
 {
 #if !defined(CONFIG_USER_ONLY)
     /* Directed Privileged Door-bell Exception State, used for IPI */
-    spr_register_kvm_hv(env, SPR_DPDES, "DPDES",
-                        SPR_NOACCESS, SPR_NOACCESS,
-                        &spr_read_generic, SPR_NOACCESS,
-                        &spr_read_generic, &spr_write_generic,
-                        KVM_REG_PPC_DPDES, 0x00000000);
+    spr_register(env, SPR_DPDES, "DPDES",
+                 SPR_NOACCESS, SPR_NOACCESS,
+                 &spr_read_generic, SPR_NOACCESS,
+                 0x00000000);
 #endif
 }
 
-- 
2.17.1


