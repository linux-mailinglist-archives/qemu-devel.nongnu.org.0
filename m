Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1805865C609
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 19:24:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pClrg-0000Iy-Bk; Tue, 03 Jan 2023 13:18:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClr1-0008Ju-Kk
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:42 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pClqz-0005Eh-FL
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 13:17:39 -0500
Received: by mail-yb1-xb30.google.com with SMTP id 83so33160867yba.11
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 10:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pmw60XZJkaURtg8eJBBrSmnGqjJDvsMLyRzbxcUBtvE=;
 b=Qm55UOU3asWzTW1uAeuDFLJAey3+MCRxPgz3tOWphd4E8Yn//csomMhEWg4IZh7hRm
 Emi3ONbuuxcMAB+cW/WBptTH9FWB9ZH2ru3yICeQnm35Srzn2NlE1bBB85hHPJ1hYHmp
 F85LtQREfUXnKbODl7WsKw47zADZXOzuxA36s5hCNYGnASYfddDd6wnI9+7GoR/3Sybb
 rAnJ/a1NmULm1FyeRcr/wr7p0e85+NKuwPhFvY59qX324bsYJ9xMPwWcEsM8Wf6YeK1H
 Lin4825lvPzq55S8ilc/LOSLxfxa80mkPgrwbQgv9TrN2n/FXN8/TNWtgJk6w86hEglf
 fwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pmw60XZJkaURtg8eJBBrSmnGqjJDvsMLyRzbxcUBtvE=;
 b=toxWunf2iWnT+Gbo2I57JoaqzTSdjwzUToZ1TcudD4KAyRffitiVP7u9WUv58kX7wo
 mOF9vv/3yb4ZkPlm5Bprh1gNlUyNfc+6ST5W6IND7uh2YClmczT0grHOnUfS8IICwhAe
 KCi3x24LUCDvBQH2NTMXQxWVRHxI4QpdOrQzug91wYvkHnTUlBfcCFNlmunvZ4i/oWW3
 t5zgp6GaoawoX1yi8/+mBJL2us5tD3ipuWGs0fTu9BeuYAQ00qtsRyR48jHU+7O8XDd9
 uIr2TtJ9Hy0zu4cX8zhxlSU9+KgX1D9Y0ltpAgPiu4oCfrGhCWwSOEXihBVodTyLX6X1
 dO9A==
X-Gm-Message-State: AFqh2kqukfD6JSiyj9no6jKXNju3kybsknu6L7TS/hZhwq1uG9QJvGEt
 wMbC9jGE6a83MJdSAtCG7zSHMAxLZ89HgaG7XwA=
X-Google-Smtp-Source: AMrXdXs3vEnJ2CWolHHXlNrYLqKi8DUdUUtW7kt4NKjNcrjNKS39jAcOPWnmyjCRlkqqWPduByuSwg==
X-Received: by 2002:a25:bd0c:0:b0:767:b792:2a7e with SMTP id
 f12-20020a25bd0c000000b00767b7922a7emr35097941ybk.26.1672769854620; 
 Tue, 03 Jan 2023 10:17:34 -0800 (PST)
Received: from stoup.. ([2607:fb90:8060:51a2:184b:6e49:c396:be2])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05620a440200b006fed2788751sm23042354qkp.76.2023.01.03.10.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 10:17:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
Subject: [RFC PATCH 15/40] target/arm: Create arm_cpu_mp_affinity
Date: Tue,  3 Jan 2023 10:16:21 -0800
Message-Id: <20230103181646.55711-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103181646.55711-1-richard.henderson@linaro.org>
References: <20230103181646.55711-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Wrapper to return the mp affinity bits from the cpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h          | 5 +++++
 hw/arm/virt-acpi-build.c  | 2 +-
 hw/arm/virt.c             | 6 +++---
 hw/arm/xlnx-versal-virt.c | 3 ++-
 hw/misc/xlnx-versal-crl.c | 4 ++--
 target/arm/arm-powerctl.c | 2 +-
 target/arm/hvf/hvf.c      | 4 ++--
 target/arm/psci.c         | 2 +-
 8 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index dd72519fda..499d2a6028 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1039,6 +1039,11 @@ unsigned int gt_cntfrq_period_ns(ARMCPU *cpu);
 
 uint64_t arm_build_mp_affinity(int idx, uint8_t clustersz);
 
+static inline uint64_t arm_cpu_mp_affinity(ARMCPU *cpu)
+{
+    return cpu->mp_affinity;
+}
+
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_arm_cpu;
 
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4156111d49..40fa3faf47 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -759,7 +759,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
         build_append_int_noprefix(table_data, vgic_interrupt, 4);
         build_append_int_noprefix(table_data, 0, 8);    /* GICR Base Address*/
         /* MPIDR */
-        build_append_int_noprefix(table_data, armcpu->mp_affinity, 8);
+        build_append_int_noprefix(table_data, arm_cpu_mp_affinity(armcpu), 8);
         /* Processor Power Efficiency Class */
         build_append_int_noprefix(table_data, 0, 1);
         /* Reserved */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3642604dea..aed86997c0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -391,7 +391,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
     for (cpu = 0; cpu < smp_cpus; cpu++) {
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
 
-        if (armcpu->mp_affinity & ARM_AFF3_MASK) {
+        if (arm_cpu_mp_affinity(armcpu) & ARM_AFF3_MASK) {
             addr_cells = 2;
             break;
         }
@@ -418,10 +418,10 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
         if (addr_cells == 2) {
             qemu_fdt_setprop_u64(ms->fdt, nodename, "reg",
-                                 armcpu->mp_affinity);
+                                 arm_cpu_mp_affinity(armcpu));
         } else {
             qemu_fdt_setprop_cell(ms->fdt, nodename, "reg",
-                                  armcpu->mp_affinity);
+                                  arm_cpu_mp_affinity(armcpu));
         }
 
         if (ms->possible_cpus->cpus[cs->cpu_index].props.has_node_id) {
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 37fc9b919c..50d983c239 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -104,7 +104,8 @@ static void fdt_add_cpu_nodes(VersalVirt *s, uint32_t psci_conduit)
         ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
 
         qemu_fdt_add_subnode(s->fdt, name);
-        qemu_fdt_setprop_cell(s->fdt, name, "reg", armcpu->mp_affinity);
+        qemu_fdt_setprop_cell(s->fdt, name, "reg",
+                              arm_cpu_mp_affinity(armcpu));
         if (psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
             qemu_fdt_setprop_string(s->fdt, name, "enable-method", "psci");
         }
diff --git a/hw/misc/xlnx-versal-crl.c b/hw/misc/xlnx-versal-crl.c
index 767106b7a3..267aa55106 100644
--- a/hw/misc/xlnx-versal-crl.c
+++ b/hw/misc/xlnx-versal-crl.c
@@ -67,9 +67,9 @@ static void crl_reset_cpu(XlnxVersalCRL *s, ARMCPU *armcpu,
                           bool rst_old, bool rst_new)
 {
     if (rst_new) {
-        arm_set_cpu_off(armcpu->mp_affinity);
+        arm_set_cpu_off(arm_cpu_mp_affinity(armcpu));
     } else {
-        arm_set_cpu_on_and_reset(armcpu->mp_affinity);
+        arm_set_cpu_on_and_reset(arm_cpu_mp_affinity(armcpu));
     }
 }
 
diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
index b75f813b40..5a6dfdfb83 100644
--- a/target/arm/arm-powerctl.c
+++ b/target/arm/arm-powerctl.c
@@ -36,7 +36,7 @@ CPUState *arm_get_cpu_by_id(uint64_t id)
     CPU_FOREACH(cpu) {
         ARMCPU *armcpu = ARM_CPU(cpu);
 
-        if (armcpu->mp_affinity == id) {
+        if (arm_cpu_mp_affinity(armcpu) == id) {
             return cpu;
         }
     }
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..e0ba91f5c6 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -645,7 +645,7 @@ static void hvf_raise_exception(CPUState *cpu, uint32_t excp,
 
 static void hvf_psci_cpu_off(ARMCPU *arm_cpu)
 {
-    int32_t ret = arm_set_cpu_off(arm_cpu->mp_affinity);
+    int32_t ret = arm_set_cpu_off(arm_cpu_mp_affinity(arm_cpu));
     assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
 }
 
@@ -674,7 +674,7 @@ static bool hvf_handle_psci_call(CPUState *cpu)
     int32_t ret = 0;
 
     trace_hvf_psci_call(param[0], param[1], param[2], param[3],
-                        arm_cpu->mp_affinity);
+                        arm_cpu_mp_affinity(arm_cpu));
 
     switch (param[0]) {
     case QEMU_PSCI_0_2_FN_PSCI_VERSION:
diff --git a/target/arm/psci.c b/target/arm/psci.c
index 6c1239bb96..b49d406e39 100644
--- a/target/arm/psci.c
+++ b/target/arm/psci.c
@@ -215,7 +215,7 @@ err:
     return;
 
 cpu_off:
-    ret = arm_set_cpu_off(cpu->mp_affinity);
+    ret = arm_set_cpu_off(arm_cpu_mp_affinity(cpu));
     /* notreached */
     /* sanity check in case something failed */
     assert(ret == QEMU_ARM_POWERCTL_RET_SUCCESS);
-- 
2.34.1


