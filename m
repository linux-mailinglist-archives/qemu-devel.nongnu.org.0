Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D76D5122
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 21:18:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjPgD-00062B-Ui; Mon, 03 Apr 2023 15:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pjPg0-0005mv-9T; Mon, 03 Apr 2023 15:17:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1pjPfv-0001MY-KN; Mon, 03 Apr 2023 15:17:11 -0400
Received: by mail-wm1-x32e.google.com with SMTP id l37so17705530wms.2;
 Mon, 03 Apr 2023 12:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680549422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=umazF7VZj/F08C+hxxKy4xa5WZ917FA3AzdyapsIJ4k=;
 b=nsK/vzncFK4j9VPQL9dHiHM6JJbSf/mgdMArPT6eNNLeQ7AgSyGZL7uuTOu4gXTOxt
 VKhv9pV/1l8W9pPldlekBErozEthNmEtvVHJH8XWfIraPe2TLdKtb4lZmcVl7+AvI9Mm
 QMCmrg0JrkCbGowqp72Si0lYcgofY7D7ESphMow1nj1ug2OpcybJMeCmqXkCBbsBuIs3
 05wJkz1wZSaCYSDB+eavZ2VHyLhu53WURtRgvuuf5Np5QKxEfRGvM63hVs7ZynhGhzh4
 uV2NUmTtLwN+6EvEehiQsHGNx+2XTcn70YMbOczKX6DDU0ODz/7Ev9aT0/eqj4Hq9wR1
 4hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680549422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=umazF7VZj/F08C+hxxKy4xa5WZ917FA3AzdyapsIJ4k=;
 b=v8fwSqMkBH5CawAeJi6t8e2dThvxzG5XDWTfK8SPqx56hfMuuanxA6n+sQJ7bdjU7E
 urZAFRxaMUXl0tY6JYiU64vjdVVc1Z+zLjeGZIvJB56KDg+JsVjc+bdYOpzEyKfVxvIU
 2aJfTw64IYar5fmbnA3V2ly1/2pdQ3vkuWT/g5r2BR+TnyaaW2xepf6sbZe2rIBMlnHJ
 VnstMriBak7vOZufQUI6CMLSo5OMBir5nkmkCYWK9ub3/HSkcm3vQSh5B19XdanOsVP3
 Jq6Pv2EvOjtF/dzCaLX0vbDEAZL9OoyB6mNVFnJysRPgpylmJsby7dJqHL0Pc8lkNoQP
 Y7RQ==
X-Gm-Message-State: AAQBX9eQpJqj4ZfFv2kuiepkLpDEfVQhPsujJQB/uMTu93b+DgYelx2q
 W9OhSsFi3gnP/fOR1kKKjJ8x4k/4j+W4qw==
X-Google-Smtp-Source: AKy350ZtWRwGMc0+hERB/w+EnDXTnzRI22JKZxrzstBSVM/+jWOM+MiFDtVB/xrg3EFnyOTXkuUrMg==
X-Received: by 2002:a05:600c:2183:b0:3f0:3d45:9aec with SMTP id
 e3-20020a05600c218300b003f03d459aecmr410915wme.4.1680549421630; 
 Mon, 03 Apr 2023 12:17:01 -0700 (PDT)
Received: from omega.lan (233.87.95.79.rev.sfr.net. [79.95.87.233])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a7bc3c6000000b003ee1b2ab9a0sm12801051wmj.11.2023.04.03.12.17.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 03 Apr 2023 12:17:01 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon hosts
Date: Mon,  3 Apr 2023 21:16:00 +0200
Message-Id: <20230403191600.43487-3-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403191600.43487-1-fcagnin@quarkslab.com>
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Francesco Cagnin <fcagnin@quarkslab.com>

Support is added for single-stepping, software breakpoints, hardware
breakpoints and watchpoints. The code has been structured like the KVM
counterpart (and many parts are basically identical).

Guests can be debugged through the gdbstub.

While guest debugging is enabled, the guest can still read and write the
DBG*_EL1 registers but they don't have any effect.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 accel/hvf/hvf-accel-ops.c | 115 +++++++
 accel/hvf/hvf-all.c       |  23 ++
 include/sysemu/hvf.h      |  34 ++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 709 +++++++++++++++++++++++++++++++++++++-
 target/i386/hvf/hvf.c     |  33 ++
 6 files changed, 913 insertions(+), 2 deletions(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 24913ca9c4..c54301203d 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -52,6 +52,7 @@
 #include "qemu/main-loop.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
@@ -340,12 +341,18 @@ static int hvf_accel_init(MachineState *ms)
     return hvf_arch_init();
 }
 
+static inline int hvf_gdbstub_sstep_flags(void)
+{
+    return SSTEP_ENABLE | SSTEP_NOIRQ;
+}
+
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "HVF";
     ac->init_machine = hvf_accel_init;
     ac->allowed = &hvf_allowed;
+    ac->gdbstub_supported_sstep_flags = hvf_gdbstub_sstep_flags;
 }
 
 static const TypeInfo hvf_accel_type = {
@@ -462,6 +469,108 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static int hvf_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+{
+    struct hvf_sw_breakpoint *bp;
+    int err;
+
+    if (type == GDB_BREAKPOINT_SW) {
+        bp = hvf_find_sw_breakpoint(cpu, addr);
+        if (bp) {
+            bp->use_count++;
+            return 0;
+        }
+
+        bp = g_new(struct hvf_sw_breakpoint, 1);
+        bp->pc = addr;
+        bp->use_count = 1;
+        err = hvf_arch_insert_sw_breakpoint(cpu, bp);
+        if (err) {
+            g_free(bp);
+            return err;
+        }
+
+        QTAILQ_INSERT_HEAD(&cpu->hvf->hvf_sw_breakpoints, bp, entry);
+    } else {
+        err = hvf_arch_insert_hw_breakpoint(addr, len, type);
+        if (err) {
+            return err;
+        }
+    }
+
+    CPU_FOREACH(cpu) {
+        err = hvf_update_guest_debug(cpu);
+        if (err) {
+            return err;
+        }
+    }
+    return 0;
+}
+
+static int hvf_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+{
+    struct hvf_sw_breakpoint *bp;
+    int err;
+
+    if (type == GDB_BREAKPOINT_SW) {
+        bp = hvf_find_sw_breakpoint(cpu, addr);
+        if (!bp) {
+            return -ENOENT;
+        }
+
+        if (bp->use_count > 1) {
+            bp->use_count--;
+            return 0;
+        }
+
+        err = hvf_arch_remove_sw_breakpoint(cpu, bp);
+        if (err) {
+            return err;
+        }
+
+        QTAILQ_REMOVE(&cpu->hvf->hvf_sw_breakpoints, bp, entry);
+        g_free(bp);
+    } else {
+        err = hvf_arch_remove_hw_breakpoint(addr, len, type);
+        if (err) {
+            return err;
+        }
+    }
+
+    CPU_FOREACH(cpu) {
+        err = hvf_update_guest_debug(cpu);
+        if (err) {
+            return err;
+        }
+    }
+    return 0;
+}
+
+static void hvf_remove_all_breakpoints(CPUState *cpu)
+{
+    struct hvf_sw_breakpoint *bp, *next;
+    CPUState *tmpcpu;
+
+    QTAILQ_FOREACH_SAFE(bp, &cpu->hvf->hvf_sw_breakpoints, entry, next) {
+        if (hvf_arch_remove_sw_breakpoint(cpu, bp) != 0) {
+            /* Try harder to find a CPU that currently sees the breakpoint. */
+            CPU_FOREACH(tmpcpu)
+            {
+                if (hvf_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
+                    break;
+                }
+            }
+        }
+        QTAILQ_REMOVE(&cpu->hvf->hvf_sw_breakpoints, bp, entry);
+        g_free(bp);
+    }
+    hvf_arch_remove_all_hw_breakpoints();
+
+    CPU_FOREACH(cpu) {
+        hvf_update_guest_debug(cpu);
+    }
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -473,6 +582,12 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
     ops->synchronize_state = hvf_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+
+    ops->insert_breakpoint = hvf_insert_breakpoint;
+    ops->remove_breakpoint = hvf_remove_breakpoint;
+    ops->remove_all_breakpoints = hvf_remove_all_breakpoints;
+    ops->update_guest_debug = hvf_update_guest_debug;
+    ops->supports_guest_debug = hvf_arch_supports_guest_debug;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 0043f4d308..292664bca0 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -44,3 +44,26 @@ void assert_hvf_ok(hv_return_t ret)
 
     abort();
 }
+
+struct hvf_sw_breakpoint *hvf_find_sw_breakpoint(CPUState *cpu, target_ulong pc)
+{
+    struct hvf_sw_breakpoint *bp;
+
+    QTAILQ_FOREACH(bp, &cpu->hvf->hvf_sw_breakpoints, entry) {
+        if (bp->pc == pc) {
+            return bp;
+        }
+    }
+    return NULL;
+}
+
+int hvf_sw_breakpoints_active(CPUState *cpu)
+{
+    return !QTAILQ_EMPTY(&cpu->hvf->hvf_sw_breakpoints);
+}
+
+int hvf_update_guest_debug(CPUState *cpu)
+{
+    hvf_arch_update_guest_debug(cpu);
+    return 0;
+}
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index bb70082e45..3c7a96d48f 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -17,6 +17,7 @@
 #include "qom/object.h"
 
 #ifdef NEED_CPU_H
+#include "cpu.h"
 
 #ifdef CONFIG_HVF
 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,
@@ -36,4 +37,37 @@ typedef struct HVFState HVFState;
 DECLARE_INSTANCE_CHECKER(HVFState, HVF_STATE,
                          TYPE_HVF_ACCEL)
 
+#ifdef NEED_CPU_H
+struct hvf_sw_breakpoint {
+    target_ulong pc;
+    target_ulong saved_insn;
+    int use_count;
+    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
+};
+
+struct hvf_sw_breakpoint *hvf_find_sw_breakpoint(CPUState *cpu, target_ulong pc);
+int hvf_sw_breakpoints_active(CPUState *cpu);
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp);
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp);
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len, int type);
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len, int type);
+void hvf_arch_remove_all_hw_breakpoints(void);
+
+/*
+ * hvf_update_guest_debug:
+ * @cs: CPUState for the CPU to update
+ *
+ * Update guest to enable or disable debugging. Per-arch specifics will be
+ * handled by calling down to hvf_arch_update_guest_debug.
+ */
+int hvf_update_guest_debug(CPUState *cpu);
+void hvf_arch_update_guest_debug(CPUState *cpu);
+
+/*
+ * Return whether the guest supports debugging.
+ */
+bool hvf_arch_supports_guest_debug(void);
+#endif /* NEED_CPU_H */
+
 #endif
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 6545f7cd61..a7957d046b 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -53,6 +53,7 @@ struct hvf_vcpu_state {
     void *exit;
     bool vtimer_masked;
     sigset_t unblock_ipi_mask;
+    QTAILQ_HEAD(, hvf_sw_breakpoint) hvf_sw_breakpoints;
 };
 
 void assert_hvf_ok(hv_return_t ret);
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ad65603445..b863dec036 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -31,6 +31,99 @@
 #include "trace/trace-target_arm_hvf.h"
 #include "migration/vmstate.h"
 
+#include "exec/gdbstub.h"
+
+#define MDSCR_EL1_SS_SHIFT  0
+#define MDSCR_EL1_MDE_SHIFT 15
+
+static bool guest_debug_enabled;
+
+static uint16_t dbgbcr_regs[] = {
+    HV_SYS_REG_DBGBCR0_EL1,
+    HV_SYS_REG_DBGBCR1_EL1,
+    HV_SYS_REG_DBGBCR2_EL1,
+    HV_SYS_REG_DBGBCR3_EL1,
+    HV_SYS_REG_DBGBCR4_EL1,
+    HV_SYS_REG_DBGBCR5_EL1,
+    HV_SYS_REG_DBGBCR6_EL1,
+    HV_SYS_REG_DBGBCR7_EL1,
+    HV_SYS_REG_DBGBCR8_EL1,
+    HV_SYS_REG_DBGBCR9_EL1,
+    HV_SYS_REG_DBGBCR10_EL1,
+    HV_SYS_REG_DBGBCR11_EL1,
+    HV_SYS_REG_DBGBCR12_EL1,
+    HV_SYS_REG_DBGBCR13_EL1,
+    HV_SYS_REG_DBGBCR14_EL1,
+    HV_SYS_REG_DBGBCR15_EL1,
+};
+static uint16_t dbgbvr_regs[] = {
+    HV_SYS_REG_DBGBVR0_EL1,
+    HV_SYS_REG_DBGBVR1_EL1,
+    HV_SYS_REG_DBGBVR2_EL1,
+    HV_SYS_REG_DBGBVR3_EL1,
+    HV_SYS_REG_DBGBVR4_EL1,
+    HV_SYS_REG_DBGBVR5_EL1,
+    HV_SYS_REG_DBGBVR6_EL1,
+    HV_SYS_REG_DBGBVR7_EL1,
+    HV_SYS_REG_DBGBVR8_EL1,
+    HV_SYS_REG_DBGBVR9_EL1,
+    HV_SYS_REG_DBGBVR10_EL1,
+    HV_SYS_REG_DBGBVR11_EL1,
+    HV_SYS_REG_DBGBVR12_EL1,
+    HV_SYS_REG_DBGBVR13_EL1,
+    HV_SYS_REG_DBGBVR14_EL1,
+    HV_SYS_REG_DBGBVR15_EL1,
+};
+static uint16_t dbgwcr_regs[] = {
+    HV_SYS_REG_DBGWCR0_EL1,
+    HV_SYS_REG_DBGWCR1_EL1,
+    HV_SYS_REG_DBGWCR2_EL1,
+    HV_SYS_REG_DBGWCR3_EL1,
+    HV_SYS_REG_DBGWCR4_EL1,
+    HV_SYS_REG_DBGWCR5_EL1,
+    HV_SYS_REG_DBGWCR6_EL1,
+    HV_SYS_REG_DBGWCR7_EL1,
+    HV_SYS_REG_DBGWCR8_EL1,
+    HV_SYS_REG_DBGWCR9_EL1,
+    HV_SYS_REG_DBGWCR10_EL1,
+    HV_SYS_REG_DBGWCR11_EL1,
+    HV_SYS_REG_DBGWCR12_EL1,
+    HV_SYS_REG_DBGWCR13_EL1,
+    HV_SYS_REG_DBGWCR14_EL1,
+    HV_SYS_REG_DBGWCR15_EL1,
+};
+static uint16_t dbgwvr_regs[] = {
+    HV_SYS_REG_DBGWVR0_EL1,
+    HV_SYS_REG_DBGWVR1_EL1,
+    HV_SYS_REG_DBGWVR2_EL1,
+    HV_SYS_REG_DBGWVR3_EL1,
+    HV_SYS_REG_DBGWVR4_EL1,
+    HV_SYS_REG_DBGWVR5_EL1,
+    HV_SYS_REG_DBGWVR6_EL1,
+    HV_SYS_REG_DBGWVR7_EL1,
+    HV_SYS_REG_DBGWVR8_EL1,
+    HV_SYS_REG_DBGWVR9_EL1,
+    HV_SYS_REG_DBGWVR10_EL1,
+    HV_SYS_REG_DBGWVR11_EL1,
+    HV_SYS_REG_DBGWVR12_EL1,
+    HV_SYS_REG_DBGWVR13_EL1,
+    HV_SYS_REG_DBGWVR14_EL1,
+    HV_SYS_REG_DBGWVR15_EL1,
+};
+
+static void hvf_arm_init_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+
+    max_hw_bps = arm_num_brps(arm_cpu);
+    hw_breakpoints =
+        g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
+
+    max_hw_wps = arm_num_wrps(arm_cpu);
+    hw_watchpoints =
+        g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
+}
+
 #define HVF_SYSREG(crn, crm, op0, op1, op2) \
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
 #define PL1_WRITE_MASK 0x4
@@ -79,6 +172,71 @@
 #define SYSREG_PMCEID1_EL0    SYSREG(3, 3, 9, 12, 7)
 #define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 9, 13, 0)
 #define SYSREG_PMCCFILTR_EL0  SYSREG(3, 3, 14, 15, 7)
+#define SYSREG_MDSCR_EL1      SYSREG(2, 0, 0, 2, 2)
+#define SYSREG_DBGBVR0_EL1    SYSREG(2, 0, 0, 0, 4)
+#define SYSREG_DBGBCR0_EL1    SYSREG(2, 0, 0, 0, 5)
+#define SYSREG_DBGWVR0_EL1    SYSREG(2, 0, 0, 0, 6)
+#define SYSREG_DBGWCR0_EL1    SYSREG(2, 0, 0, 0, 7)
+#define SYSREG_DBGBVR1_EL1    SYSREG(2, 0, 0, 1, 4)
+#define SYSREG_DBGBCR1_EL1    SYSREG(2, 0, 0, 1, 5)
+#define SYSREG_DBGWVR1_EL1    SYSREG(2, 0, 0, 1, 6)
+#define SYSREG_DBGWCR1_EL1    SYSREG(2, 0, 0, 1, 7)
+#define SYSREG_DBGBVR2_EL1    SYSREG(2, 0, 0, 2, 4)
+#define SYSREG_DBGBCR2_EL1    SYSREG(2, 0, 0, 2, 5)
+#define SYSREG_DBGWVR2_EL1    SYSREG(2, 0, 0, 2, 6)
+#define SYSREG_DBGWCR2_EL1    SYSREG(2, 0, 0, 2, 7)
+#define SYSREG_DBGBVR3_EL1    SYSREG(2, 0, 0, 3, 4)
+#define SYSREG_DBGBCR3_EL1    SYSREG(2, 0, 0, 3, 5)
+#define SYSREG_DBGWVR3_EL1    SYSREG(2, 0, 0, 3, 6)
+#define SYSREG_DBGWCR3_EL1    SYSREG(2, 0, 0, 3, 7)
+#define SYSREG_DBGBVR4_EL1    SYSREG(2, 0, 0, 4, 4)
+#define SYSREG_DBGBCR4_EL1    SYSREG(2, 0, 0, 4, 5)
+#define SYSREG_DBGWVR4_EL1    SYSREG(2, 0, 0, 4, 6)
+#define SYSREG_DBGWCR4_EL1    SYSREG(2, 0, 0, 4, 7)
+#define SYSREG_DBGBVR5_EL1    SYSREG(2, 0, 0, 5, 4)
+#define SYSREG_DBGBCR5_EL1    SYSREG(2, 0, 0, 5, 5)
+#define SYSREG_DBGWVR5_EL1    SYSREG(2, 0, 0, 5, 6)
+#define SYSREG_DBGWCR5_EL1    SYSREG(2, 0, 0, 5, 7)
+#define SYSREG_DBGBVR6_EL1    SYSREG(2, 0, 0, 6, 4)
+#define SYSREG_DBGBCR6_EL1    SYSREG(2, 0, 0, 6, 5)
+#define SYSREG_DBGWVR6_EL1    SYSREG(2, 0, 0, 6, 6)
+#define SYSREG_DBGWCR6_EL1    SYSREG(2, 0, 0, 6, 7)
+#define SYSREG_DBGBVR7_EL1    SYSREG(2, 0, 0, 7, 4)
+#define SYSREG_DBGBCR7_EL1    SYSREG(2, 0, 0, 7, 5)
+#define SYSREG_DBGWVR7_EL1    SYSREG(2, 0, 0, 7, 6)
+#define SYSREG_DBGWCR7_EL1    SYSREG(2, 0, 0, 7, 7)
+#define SYSREG_DBGBVR8_EL1    SYSREG(2, 0, 0, 8, 4)
+#define SYSREG_DBGBCR8_EL1    SYSREG(2, 0, 0, 8, 5)
+#define SYSREG_DBGWVR8_EL1    SYSREG(2, 0, 0, 8, 6)
+#define SYSREG_DBGWCR8_EL1    SYSREG(2, 0, 0, 8, 7)
+#define SYSREG_DBGBVR9_EL1    SYSREG(2, 0, 0, 9, 4)
+#define SYSREG_DBGBCR9_EL1    SYSREG(2, 0, 0, 9, 5)
+#define SYSREG_DBGWVR9_EL1    SYSREG(2, 0, 0, 9, 6)
+#define SYSREG_DBGWCR9_EL1    SYSREG(2, 0, 0, 9, 7)
+#define SYSREG_DBGBVR10_EL1   SYSREG(2, 0, 0, 10, 4)
+#define SYSREG_DBGBCR10_EL1   SYSREG(2, 0, 0, 10, 5)
+#define SYSREG_DBGWVR10_EL1   SYSREG(2, 0, 0, 10, 6)
+#define SYSREG_DBGWCR10_EL1   SYSREG(2, 0, 0, 10, 7)
+#define SYSREG_DBGBVR11_EL1   SYSREG(2, 0, 0, 11, 4)
+#define SYSREG_DBGBCR11_EL1   SYSREG(2, 0, 0, 11, 5)
+#define SYSREG_DBGWVR11_EL1   SYSREG(2, 0, 0, 11, 6)
+#define SYSREG_DBGWCR11_EL1   SYSREG(2, 0, 0, 11, 7)
+#define SYSREG_DBGBVR12_EL1   SYSREG(2, 0, 0, 12, 4)
+#define SYSREG_DBGBCR12_EL1   SYSREG(2, 0, 0, 12, 5)
+#define SYSREG_DBGWVR12_EL1   SYSREG(2, 0, 0, 12, 6)
+#define SYSREG_DBGWCR12_EL1   SYSREG(2, 0, 0, 12, 7)
+#define SYSREG_DBGBVR13_EL1   SYSREG(2, 0, 0, 13, 4)
+#define SYSREG_DBGBCR13_EL1   SYSREG(2, 0, 0, 13, 5)
+#define SYSREG_DBGWVR13_EL1   SYSREG(2, 0, 0, 13, 6)
+#define SYSREG_DBGWCR13_EL1   SYSREG(2, 0, 0, 13, 7)
+#define SYSREG_DBGBVR14_EL1   SYSREG(2, 0, 0, 14, 4)
+#define SYSREG_DBGBCR14_EL1   SYSREG(2, 0, 0, 14, 5)
+#define SYSREG_DBGWVR14_EL1   SYSREG(2, 0, 0, 14, 6)
+#define SYSREG_DBGWCR14_EL1   SYSREG(2, 0, 0, 14, 7)
+#define SYSREG_DBGBVR15_EL1   SYSREG(2, 0, 0, 15, 4)
+#define SYSREG_DBGBCR15_EL1   SYSREG(2, 0, 0, 15, 5)
+#define SYSREG_DBGWVR15_EL1   SYSREG(2, 0, 0, 15, 6)
+#define SYSREG_DBGWCR15_EL1   SYSREG(2, 0, 0, 15, 7)
 
 #define SYSREG_ICC_AP0R0_EL1     SYSREG(3, 0, 12, 8, 4)
 #define SYSREG_ICC_AP0R1_EL1     SYSREG(3, 0, 12, 8, 5)
@@ -397,6 +555,92 @@ int hvf_get_registers(CPUState *cpu)
             continue;
         }
 
+        if (guest_debug_enabled) {
+            /* Handle debug registers */
+            switch (hvf_sreg_match[i].reg) {
+            case HV_SYS_REG_DBGBVR0_EL1:
+            case HV_SYS_REG_DBGBCR0_EL1:
+            case HV_SYS_REG_DBGWVR0_EL1:
+            case HV_SYS_REG_DBGWCR0_EL1:
+            case HV_SYS_REG_DBGBVR1_EL1:
+            case HV_SYS_REG_DBGBCR1_EL1:
+            case HV_SYS_REG_DBGWVR1_EL1:
+            case HV_SYS_REG_DBGWCR1_EL1:
+            case HV_SYS_REG_DBGBVR2_EL1:
+            case HV_SYS_REG_DBGBCR2_EL1:
+            case HV_SYS_REG_DBGWVR2_EL1:
+            case HV_SYS_REG_DBGWCR2_EL1:
+            case HV_SYS_REG_DBGBVR3_EL1:
+            case HV_SYS_REG_DBGBCR3_EL1:
+            case HV_SYS_REG_DBGWVR3_EL1:
+            case HV_SYS_REG_DBGWCR3_EL1:
+            case HV_SYS_REG_DBGBVR4_EL1:
+            case HV_SYS_REG_DBGBCR4_EL1:
+            case HV_SYS_REG_DBGWVR4_EL1:
+            case HV_SYS_REG_DBGWCR4_EL1:
+            case HV_SYS_REG_DBGBVR5_EL1:
+            case HV_SYS_REG_DBGBCR5_EL1:
+            case HV_SYS_REG_DBGWVR5_EL1:
+            case HV_SYS_REG_DBGWCR5_EL1:
+            case HV_SYS_REG_DBGBVR6_EL1:
+            case HV_SYS_REG_DBGBCR6_EL1:
+            case HV_SYS_REG_DBGWVR6_EL1:
+            case HV_SYS_REG_DBGWCR6_EL1:
+            case HV_SYS_REG_DBGBVR7_EL1:
+            case HV_SYS_REG_DBGBCR7_EL1:
+            case HV_SYS_REG_DBGWVR7_EL1:
+            case HV_SYS_REG_DBGWCR7_EL1:
+            case HV_SYS_REG_DBGBVR8_EL1:
+            case HV_SYS_REG_DBGBCR8_EL1:
+            case HV_SYS_REG_DBGWVR8_EL1:
+            case HV_SYS_REG_DBGWCR8_EL1:
+            case HV_SYS_REG_DBGBVR9_EL1:
+            case HV_SYS_REG_DBGBCR9_EL1:
+            case HV_SYS_REG_DBGWVR9_EL1:
+            case HV_SYS_REG_DBGWCR9_EL1:
+            case HV_SYS_REG_DBGBVR10_EL1:
+            case HV_SYS_REG_DBGBCR10_EL1:
+            case HV_SYS_REG_DBGWVR10_EL1:
+            case HV_SYS_REG_DBGWCR10_EL1:
+            case HV_SYS_REG_DBGBVR11_EL1:
+            case HV_SYS_REG_DBGBCR11_EL1:
+            case HV_SYS_REG_DBGWVR11_EL1:
+            case HV_SYS_REG_DBGWCR11_EL1:
+            case HV_SYS_REG_DBGBVR12_EL1:
+            case HV_SYS_REG_DBGBCR12_EL1:
+            case HV_SYS_REG_DBGWVR12_EL1:
+            case HV_SYS_REG_DBGWCR12_EL1:
+            case HV_SYS_REG_DBGBVR13_EL1:
+            case HV_SYS_REG_DBGBCR13_EL1:
+            case HV_SYS_REG_DBGWVR13_EL1:
+            case HV_SYS_REG_DBGWCR13_EL1:
+            case HV_SYS_REG_DBGBVR14_EL1:
+            case HV_SYS_REG_DBGBCR14_EL1:
+            case HV_SYS_REG_DBGWVR14_EL1:
+            case HV_SYS_REG_DBGWCR14_EL1:
+            case HV_SYS_REG_DBGBVR15_EL1:
+            case HV_SYS_REG_DBGBCR15_EL1:
+            case HV_SYS_REG_DBGWVR15_EL1:
+            case HV_SYS_REG_DBGWCR15_EL1: {
+                /*
+                 * If the guest is being debugged, the vCPU's debug registers
+                 * are holding the gdbstub's view of the registers (set in
+                 * hvf_arch_update_guest_debug()).
+                 * Since the environment is used to store only the guest's view
+                 * of the registers, don't update it with the values from the
+                 * vCPU but simply keep the values from the previous
+                 * environment.
+                 */
+                const ARMCPRegInfo *ri;
+                ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_sreg_match[i].key);
+                val = read_raw_cp_reg(env, ri);
+
+                arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;
+                continue;
+            }
+            }
+        }
+
         ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
         assert_hvf_ok(ret);
 
@@ -448,6 +692,82 @@ int hvf_put_registers(CPUState *cpu)
             continue;
         }
 
+        if (guest_debug_enabled) {
+            /* Handle debug registers */
+            switch (hvf_sreg_match[i].reg) {
+            case HV_SYS_REG_DBGBVR0_EL1:
+            case HV_SYS_REG_DBGBCR0_EL1:
+            case HV_SYS_REG_DBGWVR0_EL1:
+            case HV_SYS_REG_DBGWCR0_EL1:
+            case HV_SYS_REG_DBGBVR1_EL1:
+            case HV_SYS_REG_DBGBCR1_EL1:
+            case HV_SYS_REG_DBGWVR1_EL1:
+            case HV_SYS_REG_DBGWCR1_EL1:
+            case HV_SYS_REG_DBGBVR2_EL1:
+            case HV_SYS_REG_DBGBCR2_EL1:
+            case HV_SYS_REG_DBGWVR2_EL1:
+            case HV_SYS_REG_DBGWCR2_EL1:
+            case HV_SYS_REG_DBGBVR3_EL1:
+            case HV_SYS_REG_DBGBCR3_EL1:
+            case HV_SYS_REG_DBGWVR3_EL1:
+            case HV_SYS_REG_DBGWCR3_EL1:
+            case HV_SYS_REG_DBGBVR4_EL1:
+            case HV_SYS_REG_DBGBCR4_EL1:
+            case HV_SYS_REG_DBGWVR4_EL1:
+            case HV_SYS_REG_DBGWCR4_EL1:
+            case HV_SYS_REG_DBGBVR5_EL1:
+            case HV_SYS_REG_DBGBCR5_EL1:
+            case HV_SYS_REG_DBGWVR5_EL1:
+            case HV_SYS_REG_DBGWCR5_EL1:
+            case HV_SYS_REG_DBGBVR6_EL1:
+            case HV_SYS_REG_DBGBCR6_EL1:
+            case HV_SYS_REG_DBGWVR6_EL1:
+            case HV_SYS_REG_DBGWCR6_EL1:
+            case HV_SYS_REG_DBGBVR7_EL1:
+            case HV_SYS_REG_DBGBCR7_EL1:
+            case HV_SYS_REG_DBGWVR7_EL1:
+            case HV_SYS_REG_DBGWCR7_EL1:
+            case HV_SYS_REG_DBGBVR8_EL1:
+            case HV_SYS_REG_DBGBCR8_EL1:
+            case HV_SYS_REG_DBGWVR8_EL1:
+            case HV_SYS_REG_DBGWCR8_EL1:
+            case HV_SYS_REG_DBGBVR9_EL1:
+            case HV_SYS_REG_DBGBCR9_EL1:
+            case HV_SYS_REG_DBGWVR9_EL1:
+            case HV_SYS_REG_DBGWCR9_EL1:
+            case HV_SYS_REG_DBGBVR10_EL1:
+            case HV_SYS_REG_DBGBCR10_EL1:
+            case HV_SYS_REG_DBGWVR10_EL1:
+            case HV_SYS_REG_DBGWCR10_EL1:
+            case HV_SYS_REG_DBGBVR11_EL1:
+            case HV_SYS_REG_DBGBCR11_EL1:
+            case HV_SYS_REG_DBGWVR11_EL1:
+            case HV_SYS_REG_DBGWCR11_EL1:
+            case HV_SYS_REG_DBGBVR12_EL1:
+            case HV_SYS_REG_DBGBCR12_EL1:
+            case HV_SYS_REG_DBGWVR12_EL1:
+            case HV_SYS_REG_DBGWCR12_EL1:
+            case HV_SYS_REG_DBGBVR13_EL1:
+            case HV_SYS_REG_DBGBCR13_EL1:
+            case HV_SYS_REG_DBGWVR13_EL1:
+            case HV_SYS_REG_DBGWCR13_EL1:
+            case HV_SYS_REG_DBGBVR14_EL1:
+            case HV_SYS_REG_DBGBCR14_EL1:
+            case HV_SYS_REG_DBGWVR14_EL1:
+            case HV_SYS_REG_DBGWCR14_EL1:
+            case HV_SYS_REG_DBGBVR15_EL1:
+            case HV_SYS_REG_DBGBCR15_EL1:
+            case HV_SYS_REG_DBGWVR15_EL1:
+            case HV_SYS_REG_DBGWCR15_EL1:
+                /*
+                 * If the guest is being debugged, the vCPU's debug registers
+                 * are already holding the gdbstub's view of the registers (set
+                 * in hvf_arch_update_guest_debug()).
+                 */
+                continue;
+            }
+        }
+
         val = arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx];
         ret = hv_vcpu_set_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, val);
         assert_hvf_ok(ret);
@@ -648,6 +968,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               &arm_cpu->isar.id_aa64mmfr0);
     assert_hvf_ok(ret);
 
+    hvf_arm_init_debug(cpu);
+
     return 0;
 }
 
@@ -933,6 +1255,78 @@ static int hvf_sysreg_read(CPUState *cpu, uint32_t reg, uint32_t rt)
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         }
         break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        val = env->cp15.dbgbvr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        val = env->cp15.dbgbcr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        val = env->cp15.dbgwvr[SYSREG_CRM(reg)];
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        val = env->cp15.dbgwcr[SYSREG_CRM(reg)];
+        break;
     default:
         if (is_id_sysreg(reg)) {
             /* ID system registers read as RES0 */
@@ -1172,6 +1566,81 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
             hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
         }
         break;
+    case SYSREG_MDSCR_EL1:
+        env->cp15.mdscr_el1 = val;
+        break;
+    case SYSREG_DBGBVR0_EL1:
+    case SYSREG_DBGBVR1_EL1:
+    case SYSREG_DBGBVR2_EL1:
+    case SYSREG_DBGBVR3_EL1:
+    case SYSREG_DBGBVR4_EL1:
+    case SYSREG_DBGBVR5_EL1:
+    case SYSREG_DBGBVR6_EL1:
+    case SYSREG_DBGBVR7_EL1:
+    case SYSREG_DBGBVR8_EL1:
+    case SYSREG_DBGBVR9_EL1:
+    case SYSREG_DBGBVR10_EL1:
+    case SYSREG_DBGBVR11_EL1:
+    case SYSREG_DBGBVR12_EL1:
+    case SYSREG_DBGBVR13_EL1:
+    case SYSREG_DBGBVR14_EL1:
+    case SYSREG_DBGBVR15_EL1:
+        env->cp15.dbgbvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGBCR0_EL1:
+    case SYSREG_DBGBCR1_EL1:
+    case SYSREG_DBGBCR2_EL1:
+    case SYSREG_DBGBCR3_EL1:
+    case SYSREG_DBGBCR4_EL1:
+    case SYSREG_DBGBCR5_EL1:
+    case SYSREG_DBGBCR6_EL1:
+    case SYSREG_DBGBCR7_EL1:
+    case SYSREG_DBGBCR8_EL1:
+    case SYSREG_DBGBCR9_EL1:
+    case SYSREG_DBGBCR10_EL1:
+    case SYSREG_DBGBCR11_EL1:
+    case SYSREG_DBGBCR12_EL1:
+    case SYSREG_DBGBCR13_EL1:
+    case SYSREG_DBGBCR14_EL1:
+    case SYSREG_DBGBCR15_EL1:
+        env->cp15.dbgbcr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWVR0_EL1:
+    case SYSREG_DBGWVR1_EL1:
+    case SYSREG_DBGWVR2_EL1:
+    case SYSREG_DBGWVR3_EL1:
+    case SYSREG_DBGWVR4_EL1:
+    case SYSREG_DBGWVR5_EL1:
+    case SYSREG_DBGWVR6_EL1:
+    case SYSREG_DBGWVR7_EL1:
+    case SYSREG_DBGWVR8_EL1:
+    case SYSREG_DBGWVR9_EL1:
+    case SYSREG_DBGWVR10_EL1:
+    case SYSREG_DBGWVR11_EL1:
+    case SYSREG_DBGWVR12_EL1:
+    case SYSREG_DBGWVR13_EL1:
+    case SYSREG_DBGWVR14_EL1:
+    case SYSREG_DBGWVR15_EL1:
+        env->cp15.dbgwvr[SYSREG_CRM(reg)] = val;
+        break;
+    case SYSREG_DBGWCR0_EL1:
+    case SYSREG_DBGWCR1_EL1:
+    case SYSREG_DBGWCR2_EL1:
+    case SYSREG_DBGWCR3_EL1:
+    case SYSREG_DBGWCR4_EL1:
+    case SYSREG_DBGWCR5_EL1:
+    case SYSREG_DBGWCR6_EL1:
+    case SYSREG_DBGWCR7_EL1:
+    case SYSREG_DBGWCR8_EL1:
+    case SYSREG_DBGWCR9_EL1:
+    case SYSREG_DBGWCR10_EL1:
+    case SYSREG_DBGWCR11_EL1:
+    case SYSREG_DBGWCR12_EL1:
+    case SYSREG_DBGWCR13_EL1:
+    case SYSREG_DBGWCR14_EL1:
+    case SYSREG_DBGWCR15_EL1:
+        env->cp15.dbgwcr[SYSREG_CRM(reg)] = val;
+        break;
     default:
         cpu_synchronize_state(cpu);
         trace_hvf_unhandled_sysreg_write(env->pc, reg,
@@ -1317,11 +1786,12 @@ int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
+    int ret;
     hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
     hv_return_t r;
     bool advance_pc = false;
 
-    if (hvf_inject_interrupts(cpu)) {
+    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) && hvf_inject_interrupts(cpu)) {
         return EXCP_INTERRUPT;
     }
 
@@ -1339,6 +1809,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint64_t syndrome = hvf_exit->exception.syndrome;
     uint32_t ec = syn_get_ec(syndrome);
 
+    ret = 0;
     qemu_mutex_lock_iothread();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
@@ -1358,6 +1829,49 @@ int hvf_vcpu_exec(CPUState *cpu)
     hvf_sync_vtimer(cpu);
 
     switch (ec) {
+    case EC_SOFTWARESTEP: {
+        ret = EXCP_DEBUG;
+
+        if (!cpu->singlestep_enabled) {
+            error_report("EC_SOFTWARESTEP but single-stepping not enabled");
+        }
+        break;
+    }
+    case EC_AA64_BKPT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        if (!hvf_find_sw_breakpoint(cpu, env->pc)) {
+            /* Re-inject into the guest */
+            ret = 0;
+            hvf_raise_exception(cpu, EXCP_BKPT, syn_aa64_bkpt(0));
+        }
+        break;
+    }
+    case EC_BREAKPOINT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        if (!find_hw_breakpoint(cpu, env->pc)) {
+            error_report("EC_BREAKPOINT but unknown hw breakpoint");
+        }
+        break;
+    }
+    case EC_WATCHPOINT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        CPUWatchpoint *wp =
+            find_hw_watchpoint(cpu, hvf_exit->exception.virtual_address);
+        if (!wp) {
+            error_report("EXCP_DEBUG but unknown hw watchpoint");
+        }
+        cpu->watchpoint_hit = wp;
+        break;
+    }
     case EC_DATAABORT: {
         bool isv = syndrome & ARM_EL_ISV;
         bool iswrite = (syndrome >> 6) & 1;
@@ -1462,9 +1976,14 @@ int hvf_vcpu_exec(CPUState *cpu)
         pc += 4;
         r = hv_vcpu_set_reg(cpu->hvf->fd, HV_REG_PC, pc);
         assert_hvf_ok(r);
+
+        /* Handle single-stepping over instructions which trigger a VM exit */
+        if (cpu->singlestep_enabled) {
+            ret = EXCP_DEBUG;
+        }
     }
 
-    return 0;
+    return ret;
 }
 
 static const VMStateDescription vmstate_hvf_vtimer = {
@@ -1498,3 +2017,189 @@ int hvf_arch_init(void)
     qemu_add_vm_change_state_handler(hvf_vm_state_change, &vtimer);
     return 0;
 }
+
+static const uint32_t brk_insn = 0xd4200000;
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    if (cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
+        cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    static uint32_t brk;
+
+    if (cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        brk != brk_insn ||
+        cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return insert_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return insert_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return delete_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return delete_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+void hvf_arch_remove_all_hw_breakpoints(void)
+{
+    if (cur_hw_wps > 0) {
+        g_array_remove_range(hw_watchpoints, 0, cur_hw_wps);
+    }
+    if (cur_hw_bps > 0) {
+        g_array_remove_range(hw_breakpoints, 0, cur_hw_bps);
+    }
+}
+
+static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
+{
+    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
+}
+
+/*
+ * Update the vCPU with the gdbstub's view of debug registers. This view
+ * consists of all hardware breakpoints and watchpoints inserted so far while
+ * debugging the guest.
+ */
+static void hvf_put_gdbstub_debug_registers(CPUState *cpu)
+{
+    hv_return_t r = HV_SUCCESS;
+    int i;
+
+    for (i = 0; i < cur_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], bp->bcr);
+        assert_hvf_ok(r);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], bp->bvr);
+        assert_hvf_ok(r);
+    }
+    for (i = cur_hw_bps; i < max_hw_bps; i++) {
+        HWBreakpoint *bp = get_hw_bp(i);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], 0);
+        assert_hvf_ok(r);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], 0);
+        assert_hvf_ok(r);
+    }
+
+    for (i = 0; i < cur_hw_wps; i++) {
+        HWWatchpoint *bp = get_hw_wp(i);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], bp->wcr);
+        assert_hvf_ok(r);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], bp->wvr);
+        assert_hvf_ok(r);
+    }
+    for (i = cur_hw_wps; i < max_hw_wps; i++) {
+        HWWatchpoint *bp = get_hw_wp(i);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], 0);
+        assert_hvf_ok(r);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], 0);
+        assert_hvf_ok(r);
+    }
+}
+
+/*
+ * Update the vCPU with the guest's view of debug registers. This view is kept
+ * in the environment at all times.
+ */
+static void hvf_put_guest_debug_registers(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t r = HV_SUCCESS;
+    int i;
+
+    for (i = 0; i < max_hw_bps; i++) {
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], env->cp15.dbgbcr[i]);
+        assert_hvf_ok(r);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], env->cp15.dbgbvr[i]);
+        assert_hvf_ok(r);
+    }
+
+    for (i = 0; i < max_hw_wps; i++) {
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], env->cp15.dbgwcr[i]);
+        assert_hvf_ok(r);
+        r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], env->cp15.dbgwvr[i]);
+        assert_hvf_ok(r);
+    }
+}
+
+void hvf_arch_update_guest_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t r = HV_SUCCESS;
+
+    /* Check whether guest debugging is enabled */
+    guest_debug_enabled = cpu->singlestep_enabled ||
+                          hvf_sw_breakpoints_active(cpu) ||
+                          hvf_arm_hw_debug_active(cpu);
+
+    /* Update debug registers */
+    if (guest_debug_enabled) {
+        hvf_put_gdbstub_debug_registers(cpu);
+    } else {
+        hvf_put_guest_debug_registers(cpu);
+    }
+
+    cpu_synchronize_state(cpu);
+
+    /* Enable/disable single-stepping */
+    if (cpu->singlestep_enabled) {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
+        pstate_write(env, pstate_read(env) | PSTATE_SS);
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
+    }
+
+    /* Enable/disable Breakpoint exceptions */
+    if (hvf_arm_hw_debug_active(cpu)) {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
+    }
+
+    /* Set whether debug exceptions exit the guest */
+    r = hv_vcpu_set_trap_debug_exceptions(cpu->hvf->fd, guest_debug_enabled);
+    assert_hvf_ok(r);
+
+    /* Set whether accesses to debug registers exit the guest */
+    r = hv_vcpu_set_trap_debug_reg_accesses(cpu->hvf->fd, guest_debug_enabled);
+    assert_hvf_ok(r);
+}
+
+inline bool hvf_arch_supports_guest_debug(void)
+{
+    return true;
+}
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 8d2248bb3f..f6775c942a 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -679,3 +679,36 @@ int hvf_vcpu_exec(CPUState *cpu)
 
     return ret;
 }
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    return -ENOSYS;
+}
+
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    return -ENOSYS;
+}
+
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    return -ENOSYS;
+}
+
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    return -ENOSYS;
+}
+
+void hvf_arch_remove_all_hw_breakpoints(void)
+{
+}
+
+void hvf_arch_update_guest_debug(CPUState *cpu)
+{
+}
+
+inline bool hvf_arch_supports_guest_debug(void)
+{
+    return false;
+}
-- 
2.40.0


