Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED870488423
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:12:16 +0100 (CET)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6DOB-0003y8-Gb
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1n6DME-0002VC-Fq; Sat, 08 Jan 2022 10:10:14 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>)
 id 1n6DM7-0003Dg-Cz; Sat, 08 Jan 2022 10:10:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFDD160BCB;
 Sat,  8 Jan 2022 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD685C36AEF;
 Sat,  8 Jan 2022 15:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641654602;
 bh=p9cA6hHTu7BoB3BC5S1lTAOtIKToutjhOTgjSPoxQYs=;
 h=From:To:Cc:Subject:Date:From;
 b=bEfz4QDpGdkrwq2mszFlle0eblBBZ7CsGHABH68QxiaOvuSAB0+zsd7JtVCKuy003
 oVyZFHBvg9zZZHbXxnWpV8NzyZiv1tY/HMHrRUGjvOdB5y4YWj1inKRzRT7kLftST0
 n32H1b9V+45XMpFgvrWpYK4TEFcnoIOPgDR50tuQlO39JEPNes4LdJkj4LdaKReOIf
 CwQh/cYAf8ZFc2MiDVZYUkWozyHLGVS5NRG1k3GD4ktci4fClYm2s/nCngozA3EK1t
 X7uLvcwPvb7RQHlvwgHdHkp5V2Osw1cAnAVcAieonTHGH59Z7hDIxUXgViM0Xl4Mz8
 PAsHrrDgiAkyw==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Subject: [PATCH v2] target/arm/cpu64: Use 32-bit GDBstub when running in
 32-bit KVM mode
Date: Sat,  8 Jan 2022 16:09:52 +0100
Message-Id: <20220108150952.1483911-1-ardb@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Bennee <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running under KVM, we may decide to run the CPU in 32-bit mode, by
setting the 'aarch64=off' CPU option. In this case, we need to switch to
the 32-bit version of the GDB stub too, so that GDB has the correct view
of the CPU state. Without this, GDB debugging does not work at all, and
errors out upon connecting to the target with a mysterious 'g' packet
length error.

Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennee <alex.bennee@linaro.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: refactor existing CPUClass::gdb_... member assignments for the
    32-bit code so we can reuse it for the 64-bit code

 target/arm/cpu.c   | 16 +++++++++++-----
 target/arm/cpu.h   |  2 ++
 target/arm/cpu64.c |  3 +++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a211804fd3df..ae8e78fc1472 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2049,6 +2049,15 @@ static const struct TCGCPUOps arm_tcg_ops = {
 };
 #endif /* CONFIG_TCG */
 
+void arm_cpu_class_gdb_init(CPUClass *cc)
+{
+    cc->gdb_read_register = arm_cpu_gdb_read_register;
+    cc->gdb_write_register = arm_cpu_gdb_write_register;
+    cc->gdb_num_core_regs = 26;
+    cc->gdb_core_xml_file = "arm-core.xml";
+    cc->gdb_arch_name = arm_gdb_arch_name;
+}
+
 static void arm_cpu_class_init(ObjectClass *oc, void *data)
 {
     ARMCPUClass *acc = ARM_CPU_CLASS(oc);
@@ -2061,18 +2070,15 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_props(dc, arm_cpu_properties);
     device_class_set_parent_reset(dc, arm_cpu_reset, &acc->parent_reset);
 
+    arm_cpu_class_gdb_init(cc);
+
     cc->class_by_name = arm_cpu_class_by_name;
     cc->has_work = arm_cpu_has_work;
     cc->dump_state = arm_cpu_dump_state;
     cc->set_pc = arm_cpu_set_pc;
-    cc->gdb_read_register = arm_cpu_gdb_read_register;
-    cc->gdb_write_register = arm_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
     cc->sysemu_ops = &arm_sysemu_ops;
 #endif
-    cc->gdb_num_core_regs = 26;
-    cc->gdb_core_xml_file = "arm-core.xml";
-    cc->gdb_arch_name = arm_gdb_arch_name;
     cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = arm_disas_set_info;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e33f37b70ada..208da8e35697 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1064,6 +1064,8 @@ int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
  */
 const char *arm_gdb_get_dynamic_xml(CPUState *cpu, const char *xmlname);
 
+void arm_cpu_class_gdb_init(CPUClass *cc);
+
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque);
 int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 15245a60a8c7..df7667864e11 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -906,6 +906,7 @@ static bool aarch64_cpu_get_aarch64(Object *obj, Error **errp)
 static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
 {
     ARMCPU *cpu = ARM_CPU(obj);
+    CPUClass *cc = CPU_GET_CLASS(obj);
 
     /* At this time, this property is only allowed if KVM is enabled.  This
      * restriction allows us to avoid fixing up functionality that assumes a
@@ -919,6 +920,8 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
             return;
         }
         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
+
+        arm_cpu_class_gdb_init(cc)
     } else {
         set_feature(&cpu->env, ARM_FEATURE_AARCH64);
     }
-- 
2.30.2


