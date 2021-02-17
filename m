Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E5531E32B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:45:05 +0100 (CET)
Received: from localhost ([::1]:46010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWVE-0004Nl-HU
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:45:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWR1-0007pi-3G
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:43 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWQx-0004aT-Vw
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:40:42 -0500
Received: by mail-pf1-x42c.google.com with SMTP id q20so25822pfu.8
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YFj2KkWo9Er/KLQUoi97QKZIncodD09gY47kBHWa6Ko=;
 b=EIrJW/ayJCj5iW9SLQS1c4vKgO0KdSgOMVH3oaYPxTsxD2VfPGwyiw6bLT9FBnziHq
 1ullETinsSPYo+7aEFXjfYso4BPGw2r6AKuxo01NI+SCIWEEyVmtFHTfDXILQ/snPti4
 UT9QLf39wJw4vtF7Y+ZaSA4U2Su8Kfzq1cE9I/MLwMV1BjQ88uhH/6PbZfHhsKzqP4Vm
 1RyDIWBqb5zmuJQi+sLpJa/6reJTygtVMj9XS5pMZc2vYpyREYmUg1VYtaPONqY9WUpS
 hCnDvD+dz89Hl0SE3SSjfXTNJZV0nrRLbigHfUN+k9pKbBu/sc4QVqtSC+15rChwTCfw
 4nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YFj2KkWo9Er/KLQUoi97QKZIncodD09gY47kBHWa6Ko=;
 b=k8byRBn0X/syymIwpq1hUlg++wohE/4Jp8bDKjsQtdmukhvBmZN7OAtRAVTRWxQzMo
 S1eaQoQ2+9VbjBUUzi/aNolJq6h3AgzVS8uPtbsorWt3q59txQD2ABXJRTIw7NDxZDkP
 Tf/2QMbHt41nn860z1t6fcgQoHeaE9VnGdr2SnIGp6vHW+kmvnQNhg6HDtTVFo5kTwhd
 zXzS/b6UYuQvruVEi5mnGVrPoYpM7qJLPmq3ZJYjC56/uN35t9mRVvzSEbA0J0HomS9G
 7UV26y1Tg/laI3J9yxo3CDcTllSe55PqfzngOiJADL6+TYVpt6AI8jhwXnwcpbJUyJ4O
 elEw==
X-Gm-Message-State: AOAM532Mf45rMoP0uJnQMYbdDWOtt5CtQsdEcJZRnC3+FsZvPmfLi2vX
 g2oXhPZVG6VzpoSOF9cMR439JONwuWUnsw==
X-Google-Smtp-Source: ABdhPJykQWDUGMFItD7qG+vz7QKasVg4q31nWPBoDICuk1xkt99DySJQQMaZIMZWl3rXB0G/iahWNQ==
X-Received: by 2002:aa7:991c:0:b029:1e8:b29:cd69 with SMTP id
 z28-20020aa7991c0000b02901e80b29cd69mr1616617pff.50.1613605238484; 
 Wed, 17 Feb 2021 15:40:38 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:40:37 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/35] Hexagon (target/hexagon) scalar core definition
Date: Wed, 17 Feb 2021 15:39:53 -0800
Message-Id: <20210217234023.1742406-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Add target state header, target definitions and initialization routines

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Message-Id: <1612763186-18161-5-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu-param.h |  29 ++++
 target/hexagon/cpu.h       | 159 +++++++++++++++++++
 target/hexagon/cpu_bits.h  |  58 +++++++
 target/hexagon/internal.h  |  35 ++++
 target/hexagon/cpu.c       | 318 +++++++++++++++++++++++++++++++++++++
 5 files changed, 599 insertions(+)
 create mode 100644 target/hexagon/cpu-param.h
 create mode 100644 target/hexagon/cpu.h
 create mode 100644 target/hexagon/cpu_bits.h
 create mode 100644 target/hexagon/internal.h
 create mode 100644 target/hexagon/cpu.c

diff --git a/target/hexagon/cpu-param.h b/target/hexagon/cpu-param.h
new file mode 100644
index 0000000000..e8ed5468d9
--- /dev/null
+++ b/target/hexagon/cpu-param.h
@@ -0,0 +1,29 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_CPU_PARAM_H
+#define HEXAGON_CPU_PARAM_H
+
+#define TARGET_PAGE_BITS 16     /* 64K pages */
+#define TARGET_LONG_BITS 32
+
+#define TARGET_PHYS_ADDR_SPACE_BITS 36
+#define TARGET_VIRT_ADDR_SPACE_BITS 32
+
+#define NB_MMU_MODES 1
+
+#endif
diff --git a/target/hexagon/cpu.h b/target/hexagon/cpu.h
new file mode 100644
index 0000000000..e04eac591c
--- /dev/null
+++ b/target/hexagon/cpu.h
@@ -0,0 +1,159 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_CPU_H
+#define HEXAGON_CPU_H
+
+/* Forward declaration needed by some of the header files */
+typedef struct CPUHexagonState CPUHexagonState;
+
+#include "fpu/softfloat-types.h"
+
+#include "qemu-common.h"
+#include "exec/cpu-defs.h"
+#include "hex_regs.h"
+
+#define NUM_PREGS 4
+#define TOTAL_PER_THREAD_REGS 64
+
+#define SLOTS_MAX 4
+#define STORES_MAX 2
+#define REG_WRITES_MAX 32
+#define PRED_WRITES_MAX 5                   /* 4 insns + endloop */
+
+#define TYPE_HEXAGON_CPU "hexagon-cpu"
+
+#define HEXAGON_CPU_TYPE_SUFFIX "-" TYPE_HEXAGON_CPU
+#define HEXAGON_CPU_TYPE_NAME(name) (name HEXAGON_CPU_TYPE_SUFFIX)
+#define CPU_RESOLVING_TYPE TYPE_HEXAGON_CPU
+
+#define TYPE_HEXAGON_CPU_V67 HEXAGON_CPU_TYPE_NAME("v67")
+
+#define MMU_USER_IDX 0
+
+typedef struct {
+    target_ulong va;
+    uint8_t width;
+    uint32_t data32;
+    uint64_t data64;
+} MemLog;
+
+#define EXEC_STATUS_OK          0x0000
+#define EXEC_STATUS_STOP        0x0002
+#define EXEC_STATUS_REPLAY      0x0010
+#define EXEC_STATUS_LOCKED      0x0020
+#define EXEC_STATUS_EXCEPTION   0x0100
+
+
+#define EXCEPTION_DETECTED      (env->status & EXEC_STATUS_EXCEPTION)
+#define REPLAY_DETECTED         (env->status & EXEC_STATUS_REPLAY)
+#define CLEAR_EXCEPTION         (env->status &= (~EXEC_STATUS_EXCEPTION))
+#define SET_EXCEPTION           (env->status |= EXEC_STATUS_EXCEPTION)
+
+struct CPUHexagonState {
+    target_ulong gpr[TOTAL_PER_THREAD_REGS];
+    target_ulong pred[NUM_PREGS];
+    target_ulong branch_taken;
+    target_ulong next_PC;
+
+    /* For comparing with LLDB on target - see adjust_stack_ptrs function */
+    target_ulong last_pc_dumped;
+    target_ulong stack_start;
+
+    uint8_t slot_cancelled;
+    target_ulong new_value[TOTAL_PER_THREAD_REGS];
+
+    /*
+     * Only used when HEX_DEBUG is on, but unconditionally included
+     * to reduce recompile time when turning HEX_DEBUG on/off.
+     */
+    target_ulong this_PC;
+    target_ulong reg_written[TOTAL_PER_THREAD_REGS];
+
+    target_ulong new_pred_value[NUM_PREGS];
+    target_ulong pred_written;
+
+    MemLog mem_log_stores[STORES_MAX];
+    target_ulong pkt_has_store_s1;
+    target_ulong dczero_addr;
+
+    float_status fp_status;
+
+    target_ulong llsc_addr;
+    target_ulong llsc_val;
+    uint64_t     llsc_val_i64;
+
+    target_ulong is_gather_store_insn;
+    target_ulong gather_issued;
+};
+
+#define HEXAGON_CPU_CLASS(klass) \
+    OBJECT_CLASS_CHECK(HexagonCPUClass, (klass), TYPE_HEXAGON_CPU)
+#define HEXAGON_CPU(obj) \
+    OBJECT_CHECK(HexagonCPU, (obj), TYPE_HEXAGON_CPU)
+#define HEXAGON_CPU_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(HexagonCPUClass, (obj), TYPE_HEXAGON_CPU)
+
+typedef struct HexagonCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+    DeviceReset parent_reset;
+} HexagonCPUClass;
+
+typedef struct HexagonCPU {
+    /*< private >*/
+    CPUState parent_obj;
+    /*< public >*/
+    CPUNegativeOffsetState neg;
+    CPUHexagonState env;
+
+    bool lldb_compat;
+    target_ulong lldb_stack_adjust;
+} HexagonCPU;
+
+static inline HexagonCPU *hexagon_env_get_cpu(CPUHexagonState *env)
+{
+    return container_of(env, HexagonCPU, env);
+}
+
+#include "cpu_bits.h"
+
+#define cpu_signal_handler cpu_hexagon_signal_handler
+int cpu_hexagon_signal_handler(int host_signum, void *pinfo, void *puc);
+
+static inline void cpu_get_tb_cpu_state(CPUHexagonState *env, target_ulong *pc,
+                                        target_ulong *cs_base, uint32_t *flags)
+{
+    *pc = env->gpr[HEX_REG_PC];
+    *cs_base = 0;
+#ifdef CONFIG_USER_ONLY
+    *flags = 0;
+#else
+#error System mode not supported on Hexagon yet
+#endif
+}
+
+typedef struct CPUHexagonState CPUArchState;
+typedef HexagonCPU ArchCPU;
+
+void hexagon_translate_init(void);
+
+#include "exec/cpu-all.h"
+
+#endif /* HEXAGON_CPU_H */
diff --git a/target/hexagon/cpu_bits.h b/target/hexagon/cpu_bits.h
new file mode 100644
index 0000000000..96af834d0e
--- /dev/null
+++ b/target/hexagon/cpu_bits.h
@@ -0,0 +1,58 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_CPU_BITS_H
+#define HEXAGON_CPU_BITS_H
+
+#include "qemu/bitops.h"
+
+#define HEX_EXCP_FETCH_NO_UPAGE  0x012
+#define HEX_EXCP_INVALID_PACKET  0x015
+#define HEX_EXCP_INVALID_OPCODE  0x015
+#define HEX_EXCP_PRIV_NO_UREAD   0x024
+#define HEX_EXCP_PRIV_NO_UWRITE  0x025
+
+#define HEX_EXCP_TRAP0           0x172
+
+#define PACKET_WORDS_MAX         4
+
+static inline uint32_t parse_bits(uint32_t encoding)
+{
+    /* The parse bits are [15:14] */
+    return extract32(encoding, 14, 2);
+}
+
+static inline uint32_t iclass_bits(uint32_t encoding)
+{
+    /* The instruction class is encoded in bits [31:28] */
+    uint32_t iclass = extract32(encoding, 28, 4);
+    /* If parse bits are zero, this is a duplex */
+    if (parse_bits(encoding) == 0) {
+        iclass += 16;
+    }
+    return iclass;
+}
+
+static inline int is_packet_end(uint32_t endocing)
+{
+    uint32_t bits = parse_bits(endocing);
+    return ((bits == 0x3) || (bits == 0x0));
+}
+
+int disassemble_hexagon(uint32_t *words, int nwords, bfd_vma pc, GString *buf);
+
+#endif
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
new file mode 100644
index 0000000000..c839796cd1
--- /dev/null
+++ b/target/hexagon/internal.h
@@ -0,0 +1,35 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HEXAGON_INTERNAL_H
+#define HEXAGON_INTERNAL_H
+
+/*
+ * Change HEX_DEBUG to 1 to turn on debugging output
+ */
+#define HEX_DEBUG 0
+#if HEX_DEBUG
+#define HEX_DEBUG_LOG(...) qemu_log(__VA_ARGS__)
+#else
+#define HEX_DEBUG_LOG(...) do { } while (0)
+#endif
+
+void hexagon_debug(CPUHexagonState *env);
+
+extern const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS];
+
+#endif
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
new file mode 100644
index 0000000000..b0b3040dd1
--- /dev/null
+++ b/target/hexagon/cpu.c
@@ -0,0 +1,318 @@
+/*
+ *  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/qemu-print.h"
+#include "cpu.h"
+#include "internal.h"
+#include "exec/exec-all.h"
+#include "qapi/error.h"
+#include "hw/qdev-properties.h"
+
+static void hexagon_v67_cpu_init(Object *obj)
+{
+}
+
+static ObjectClass *hexagon_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+    char *typename;
+    char **cpuname;
+
+    cpuname = g_strsplit(cpu_model, ",", 1);
+    typename = g_strdup_printf(HEXAGON_CPU_TYPE_NAME("%s"), cpuname[0]);
+    oc = object_class_by_name(typename);
+    g_strfreev(cpuname);
+    g_free(typename);
+    if (!oc || !object_class_dynamic_cast(oc, TYPE_HEXAGON_CPU) ||
+        object_class_is_abstract(oc)) {
+        return NULL;
+    }
+    return oc;
+}
+
+static Property hexagon_lldb_compat_property =
+    DEFINE_PROP_BOOL("lldb-compat", HexagonCPU, lldb_compat, false);
+static Property hexagon_lldb_stack_adjust_property =
+    DEFINE_PROP_UNSIGNED("lldb-stack-adjust", HexagonCPU, lldb_stack_adjust,
+                         0, qdev_prop_uint32, target_ulong);
+
+const char * const hexagon_regnames[TOTAL_PER_THREAD_REGS] = {
+   "r0", "r1",  "r2",  "r3",  "r4",   "r5",  "r6",  "r7",
+   "r8", "r9",  "r10", "r11", "r12",  "r13", "r14", "r15",
+  "r16", "r17", "r18", "r19", "r20",  "r21", "r22", "r23",
+  "r24", "r25", "r26", "r27", "r28",  "r29", "r30", "r31",
+  "sa0", "lc0", "sa1", "lc1", "p3_0", "c5",  "m0",  "m1",
+  "usr", "pc",  "ugp", "gp",  "cs0",  "cs1", "c14", "c15",
+  "c16", "c17", "c18", "c19", "pkt_cnt",  "insn_cnt", "c22", "c23",
+  "c24", "c25", "c26", "c27", "c28",  "c29", "c30", "c31",
+};
+
+/*
+ * One of the main debugging techniques is to use "-d cpu" and compare against
+ * LLDB output when single stepping.  However, the target and qemu put the
+ * stacks at different locations.  This is used to compensate so the diff is
+ * cleaner.
+ */
+static inline target_ulong adjust_stack_ptrs(CPUHexagonState *env,
+                                             target_ulong addr)
+{
+    HexagonCPU *cpu = container_of(env, HexagonCPU, env);
+    target_ulong stack_adjust = cpu->lldb_stack_adjust;
+    target_ulong stack_start = env->stack_start;
+    target_ulong stack_size = 0x10000;
+
+    if (stack_adjust == 0) {
+        return addr;
+    }
+
+    if (stack_start + 0x1000 >= addr && addr >= (stack_start - stack_size)) {
+        return addr - stack_adjust;
+    }
+    return addr;
+}
+
+/* HEX_REG_P3_0 (aka C4) is an alias for the predicate registers */
+static inline target_ulong read_p3_0(CPUHexagonState *env)
+{
+    int32_t control_reg = 0;
+    int i;
+    for (i = NUM_PREGS - 1; i >= 0; i--) {
+        control_reg <<= 8;
+        control_reg |= env->pred[i] & 0xff;
+    }
+    return control_reg;
+}
+
+static void print_reg(FILE *f, CPUHexagonState *env, int regnum)
+{
+    target_ulong value;
+
+    if (regnum == HEX_REG_P3_0) {
+        value = read_p3_0(env);
+    } else {
+        value = regnum < 32 ? adjust_stack_ptrs(env, env->gpr[regnum])
+                            : env->gpr[regnum];
+    }
+
+    qemu_fprintf(f, "  %s = 0x" TARGET_FMT_lx "\n",
+                 hexagon_regnames[regnum], value);
+}
+
+static void hexagon_dump(CPUHexagonState *env, FILE *f)
+{
+    HexagonCPU *cpu = container_of(env, HexagonCPU, env);
+
+    if (cpu->lldb_compat) {
+        /*
+         * When comparing with LLDB, it doesn't step through single-cycle
+         * hardware loops the same way.  So, we just skip them here
+         */
+        if (env->gpr[HEX_REG_PC] == env->last_pc_dumped) {
+            return;
+        }
+        env->last_pc_dumped = env->gpr[HEX_REG_PC];
+    }
+
+    qemu_fprintf(f, "General Purpose Registers = {\n");
+    for (int i = 0; i < 32; i++) {
+        print_reg(f, env, i);
+    }
+    print_reg(f, env, HEX_REG_SA0);
+    print_reg(f, env, HEX_REG_LC0);
+    print_reg(f, env, HEX_REG_SA1);
+    print_reg(f, env, HEX_REG_LC1);
+    print_reg(f, env, HEX_REG_M0);
+    print_reg(f, env, HEX_REG_M1);
+    print_reg(f, env, HEX_REG_USR);
+    print_reg(f, env, HEX_REG_P3_0);
+    print_reg(f, env, HEX_REG_GP);
+    print_reg(f, env, HEX_REG_UGP);
+    print_reg(f, env, HEX_REG_PC);
+#ifdef CONFIG_USER_ONLY
+    /*
+     * Not modelled in user mode, print junk to minimize the diff's
+     * with LLDB output
+     */
+    qemu_fprintf(f, "  cause = 0x000000db\n");
+    qemu_fprintf(f, "  badva = 0x00000000\n");
+    qemu_fprintf(f, "  cs0 = 0x00000000\n");
+    qemu_fprintf(f, "  cs1 = 0x00000000\n");
+#else
+    print_reg(f, env, HEX_REG_CAUSE);
+    print_reg(f, env, HEX_REG_BADVA);
+    print_reg(f, env, HEX_REG_CS0);
+    print_reg(f, env, HEX_REG_CS1);
+#endif
+    qemu_fprintf(f, "}\n");
+}
+
+static void hexagon_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+
+    hexagon_dump(env, f);
+}
+
+void hexagon_debug(CPUHexagonState *env)
+{
+    hexagon_dump(env, stdout);
+}
+
+static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+    env->gpr[HEX_REG_PC] = value;
+}
+
+static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
+                                            const TranslationBlock *tb)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    CPUHexagonState *env = &cpu->env;
+    env->gpr[HEX_REG_PC] = tb->pc;
+}
+
+static bool hexagon_cpu_has_work(CPUState *cs)
+{
+    return true;
+}
+
+void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
+                          target_ulong *data)
+{
+    env->gpr[HEX_REG_PC] = data[0];
+}
+
+static void hexagon_cpu_reset(DeviceState *dev)
+{
+    CPUState *cs = CPU(dev);
+    HexagonCPU *cpu = HEXAGON_CPU(cs);
+    HexagonCPUClass *mcc = HEXAGON_CPU_GET_CLASS(cpu);
+
+    mcc->parent_reset(dev);
+}
+
+static void hexagon_cpu_disas_set_info(CPUState *s, disassemble_info *info)
+{
+    info->print_insn = print_insn_hexagon;
+}
+
+static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    HexagonCPUClass *mcc = HEXAGON_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    qemu_init_vcpu(cs);
+    cpu_reset(cs);
+
+    mcc->parent_realize(dev, errp);
+}
+
+static void hexagon_cpu_init(Object *obj)
+{
+    HexagonCPU *cpu = HEXAGON_CPU(obj);
+
+    cpu_set_cpustate_pointers(cpu);
+    qdev_property_add_static(DEVICE(obj), &hexagon_lldb_compat_property);
+    qdev_property_add_static(DEVICE(obj), &hexagon_lldb_stack_adjust_property);
+}
+
+static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
+                             MMUAccessType access_type, int mmu_idx,
+                             bool probe, uintptr_t retaddr)
+{
+#ifdef CONFIG_USER_ONLY
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        cs->exception_index = HEX_EXCP_FETCH_NO_UPAGE;
+        break;
+    case MMU_DATA_LOAD:
+        cs->exception_index = HEX_EXCP_PRIV_NO_UREAD;
+        break;
+    case MMU_DATA_STORE:
+        cs->exception_index = HEX_EXCP_PRIV_NO_UWRITE;
+        break;
+    }
+    cpu_loop_exit_restore(cs, retaddr);
+#else
+#error System mode not implemented for Hexagon
+#endif
+}
+
+#include "hw/core/tcg-cpu-ops.h"
+
+static struct TCGCPUOps hexagon_tcg_ops = {
+    .initialize = hexagon_translate_init,
+    .synchronize_from_tb = hexagon_cpu_synchronize_from_tb,
+    .tlb_fill = hexagon_tlb_fill,
+};
+
+static void hexagon_cpu_class_init(ObjectClass *c, void *data)
+{
+    HexagonCPUClass *mcc = HEXAGON_CPU_CLASS(c);
+    CPUClass *cc = CPU_CLASS(c);
+    DeviceClass *dc = DEVICE_CLASS(c);
+
+    device_class_set_parent_realize(dc, hexagon_cpu_realize,
+                                    &mcc->parent_realize);
+
+    device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
+
+    cc->class_by_name = hexagon_cpu_class_by_name;
+    cc->has_work = hexagon_cpu_has_work;
+    cc->dump_state = hexagon_dump_state;
+    cc->set_pc = hexagon_cpu_set_pc;
+    cc->gdb_read_register = hexagon_gdb_read_register;
+    cc->gdb_write_register = hexagon_gdb_write_register;
+    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
+    cc->gdb_stop_before_watchpoint = true;
+    cc->disas_set_info = hexagon_cpu_disas_set_info;
+    cc->tcg_ops = &hexagon_tcg_ops;
+}
+
+#define DEFINE_CPU(type_name, initfn)      \
+    {                                      \
+        .name = type_name,                 \
+        .parent = TYPE_HEXAGON_CPU,        \
+        .instance_init = initfn            \
+    }
+
+static const TypeInfo hexagon_cpu_type_infos[] = {
+    {
+        .name = TYPE_HEXAGON_CPU,
+        .parent = TYPE_CPU,
+        .instance_size = sizeof(HexagonCPU),
+        .instance_init = hexagon_cpu_init,
+        .abstract = true,
+        .class_size = sizeof(HexagonCPUClass),
+        .class_init = hexagon_cpu_class_init,
+    },
+    DEFINE_CPU(TYPE_HEXAGON_CPU_V67,              hexagon_v67_cpu_init),
+};
+
+DEFINE_TYPES(hexagon_cpu_type_infos)
-- 
2.25.1


