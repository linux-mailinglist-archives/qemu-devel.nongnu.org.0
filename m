Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4130410B509
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 19:02:46 +0100 (CET)
Received: from localhost ([::1]:41226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia1eG-0007vS-LG
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 13:02:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1ia1VY-00025W-0p
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1ia1VT-0006UG-CF
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:43 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1ia1VR-0006Sd-Uw
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:53:38 -0500
Received: by mail-wr1-x444.google.com with SMTP id t2so27742284wrr.1
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 09:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=srNZ2+GtOzK9LYEcu98RxZAmT76/i890KzSVheyBeyo=;
 b=H5eInS0QrFrICAiQkbtaXDBIurSJQYnz9GzlO7oQIByUsS7qUanQIrydSdr1orM85v
 0F3MT6e78Xfsxs1BfR1YhAyCY50+F4huScAvDtk6wM8Ge2BmvSXwyd+fi6rXIMKBpj/2
 NQGaPoRCd+dbpu8gZ0nhZrIjIaKoDDrYFkwea+9r4EbhrJ8fOLtTLaS1B0BSrDgna1G7
 FlNS6i9FrfhK7lZ+oSkXvgInShEy9Wf8XCPyrscndvvHquQqrchcG5AuTkGhRots4k9e
 VMvw/HlNS+tGCNAArfGdEo1+iEpckBCj8i5c7v2+AjTmSsfpesdKtmkUNL4XBRafBiIc
 yqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=srNZ2+GtOzK9LYEcu98RxZAmT76/i890KzSVheyBeyo=;
 b=EL3Vebr826GUpaWj+IUJe1JhpH2fOxTB6YNJWkBTVK+Icn1Cg4UXpP1GLPy/5XkVCc
 t4f5VWO7LrfCZIY0CWNtG53uoM4g5RufRdrK07YyGb06h8Lhq0vu8hxSoyY0pKG/Gs82
 I21D/98JWSoQ+YQ0Ip9z+F/ZwlFwBeBhZ+g+VgcQNMnzI0DJm5Cl0kjinxzjepbdfT7z
 R38KLpCDxoqbHHhyx4/Bb3ZP7GymAp+TTzpeZMxyCWMnJ4JlHCt4FDAw0Rwy8iiatYyt
 FAWMqdz/DCjDDju1WMufaaNBgHjtZdA0w4sP8RIZy0NG0NAy748ByI5+1SFhFBD18rfS
 dswQ==
X-Gm-Message-State: APjAAAWz9QGXf5owfbNM1bta0m+SF/WP8XxQcLIj84FAGs3fwGi3ZR40
 CMkrGZ+rLmwyTjjwj5v10AjzG2NW1QzMzRaA
X-Google-Smtp-Source: APXvYqy0QtuowEVKjRmCBhvma5yxqvWlB3ACb+lLNy+xFpR7srTYBeMkyjHNnJlgI9bGjgFc3JwPIw==
X-Received: by 2002:adf:f343:: with SMTP id e3mr24131409wrp.55.1574877215579; 
 Wed, 27 Nov 2019 09:53:35 -0800 (PST)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-79-178-2-87.red.bezeqint.net. [79.178.2.87])
 by smtp.gmail.com with ESMTPSA id b2sm20238295wrr.76.2019.11.27.09.53.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 27 Nov 2019 09:53:35 -0800 (PST)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v37 01/17] target/avr: Add outward facing interfaces and core
 CPU logic
Date: Wed, 27 Nov 2019 19:52:41 +0200
Message-Id: <20191127175257.23480-2-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191127175257.23480-1-mrolnik@gmail.com>
References: <20191127175257.23480-1-mrolnik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: thuth@redhat.com, Michael Rolnik <mrolnik@gmail.com>,
 me@xcancerberox.com.ar, richard.henderson@linaro.org,
 Sarah Harris <S.E.Harris@kent.ac.uk>, dovgaluk@ispras.ru, imammedo@redhat.com,
 philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- CPU data structures
- object model classes and functions
- migration functions
- GDB hooks

Co-developed-by: Michael Rolnik <mrolnik@gmail.com>
Co-developed-by: Sarah Harris <S.E.Harris@kent.ac.uk>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Signed-off-by: Sarah Harris <S.E.Harris@kent.ac.uk>
Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/avr/cpu-param.h |  37 +++
 target/avr/cpu-qom.h   |  54 ++++
 target/avr/cpu.h       | 253 ++++++++++++++++++
 target/avr/cpu.c       | 576 +++++++++++++++++++++++++++++++++++++++++
 target/avr/gdbstub.c   |  85 ++++++
 target/avr/machine.c   | 121 +++++++++
 gdb-xml/avr-cpu.xml    |  49 ++++
 7 files changed, 1175 insertions(+)
 create mode 100644 target/avr/cpu-param.h
 create mode 100644 target/avr/cpu-qom.h
 create mode 100644 target/avr/cpu.h
 create mode 100644 target/avr/cpu.c
 create mode 100644 target/avr/gdbstub.c
 create mode 100644 target/avr/machine.c
 create mode 100644 gdb-xml/avr-cpu.xml

diff --git a/target/avr/cpu-param.h b/target/avr/cpu-param.h
new file mode 100644
index 0000000000..ccd1ea3429
--- /dev/null
+++ b/target/avr/cpu-param.h
@@ -0,0 +1,37 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#ifndef AVR_CPU_PARAM_H
+#define AVR_CPU_PARAM_H 1
+
+#define TARGET_LONG_BITS 32
+/*
+ * TARGET_PAGE_BITS cannot be more than 8 bits because
+ * 1.  all IO registers occupy [0x0000 .. 0x00ff] address range, and they
+ *     should be implemented as a device and not memory
+ * 2.  SRAM starts at the address 0x0100
+ */
+#define TARGET_PAGE_BITS 8
+#define TARGET_PHYS_ADDR_SPACE_BITS 24
+#define TARGET_VIRT_ADDR_SPACE_BITS 24
+#define NB_MMU_MODES 2
+
+
+#endif
diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
new file mode 100644
index 0000000000..e28b58c897
--- /dev/null
+++ b/target/avr/cpu-qom.h
@@ -0,0 +1,54 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#ifndef QEMU_AVR_QOM_H
+#define QEMU_AVR_QOM_H
+
+#include "hw/core/cpu.h"
+
+#define TYPE_AVR_CPU "avr-cpu"
+
+#define AVR_CPU_CLASS(klass) \
+    OBJECT_CLASS_CHECK(AVRCPUClass, (klass), TYPE_AVR_CPU)
+#define AVR_CPU(obj) \
+    OBJECT_CHECK(AVRCPU, (obj), TYPE_AVR_CPU)
+#define AVR_CPU_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(AVRCPUClass, (obj), TYPE_AVR_CPU)
+
+/**
+ *  AVRCPUClass:
+ *  @parent_realize: The parent class' realize handler.
+ *  @parent_reset: The parent class' reset handler.
+ *  @vr: Version Register value.
+ *
+ *  A AVR CPU model.
+ */
+typedef struct AVRCPUClass {
+    /*< private >*/
+    CPUClass parent_class;
+    /*< public >*/
+    DeviceRealize parent_realize;
+    void (*parent_reset)(CPUState *cpu);
+} AVRCPUClass;
+
+typedef struct AVRCPU AVRCPU;
+
+
+#endif /* !defined (QEMU_AVR_CPU_QOM_H) */
diff --git a/target/avr/cpu.h b/target/avr/cpu.h
new file mode 100644
index 0000000000..9ea5260165
--- /dev/null
+++ b/target/avr/cpu.h
@@ -0,0 +1,253 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#ifndef QEMU_AVR_CPU_H
+#define QEMU_AVR_CPU_H
+
+#include "cpu-qom.h"
+#include "exec/cpu-defs.h"
+
+#define TCG_GUEST_DEFAULT_MO 0
+
+#define CPU_RESOLVING_TYPE TYPE_AVR_CPU
+
+/*
+ * AVR has two memory spaces, data & code.
+ * e.g. both have 0 address
+ * ST/LD instructions access data space
+ * LPM/SPM and instruction fetching access code memory space
+ */
+#define MMU_CODE_IDX 0
+#define MMU_DATA_IDX 1
+
+#define EXCP_RESET 1
+#define EXCP_INT(n) (EXCP_RESET + (n) + 1)
+
+/* Number of CPU registers */
+#define NUMBER_OF_CPU_REGISTERS 32
+/* Number of IO registers accessible by ld/st/in/out */
+#define NUMBER_OF_IO_REGISTERS 64
+
+/*
+ * Offsets of AVR memory regions in host memory space.
+ *
+ * This is needed because the AVR has separate code and data address
+ * spaces that both have start from zero but have to go somewhere in
+ * host memory.
+ *
+ * It's also useful to know where some things are, like the IO registers.
+ */
+/* Flash program memory */
+#define OFFSET_CODE 0x00000000
+/* CPU registers, IO registers, and SRAM */
+#define OFFSET_DATA 0x00800000
+/* CPU registers specifically, these are mapped at the start of data */
+#define OFFSET_CPU_REGISTERS OFFSET_DATA
+/*
+ * IO registers, including status register, stack pointer, and memory
+ * mapped peripherals, mapped just after CPU registers
+ */
+#define OFFSET_IO_REGISTERS (OFFSET_DATA + NUMBER_OF_CPU_REGISTERS)
+
+enum avr_features {
+    AVR_FEATURE_SRAM,
+
+    AVR_FEATURE_1_BYTE_PC,
+    AVR_FEATURE_2_BYTE_PC,
+    AVR_FEATURE_3_BYTE_PC,
+
+    AVR_FEATURE_1_BYTE_SP,
+    AVR_FEATURE_2_BYTE_SP,
+
+    AVR_FEATURE_BREAK,
+    AVR_FEATURE_DES,
+    AVR_FEATURE_RMW, /* Read Modify Write - XCH LAC LAS LAT */
+
+    AVR_FEATURE_EIJMP_EICALL,
+    AVR_FEATURE_IJMP_ICALL,
+    AVR_FEATURE_JMP_CALL,
+
+    AVR_FEATURE_ADIW_SBIW,
+
+    AVR_FEATURE_SPM,
+    AVR_FEATURE_SPMX,
+
+    AVR_FEATURE_ELPMX,
+    AVR_FEATURE_ELPM,
+    AVR_FEATURE_LPMX,
+    AVR_FEATURE_LPM,
+
+    AVR_FEATURE_MOVW,
+    AVR_FEATURE_MUL,
+    AVR_FEATURE_RAMPD,
+    AVR_FEATURE_RAMPX,
+    AVR_FEATURE_RAMPY,
+    AVR_FEATURE_RAMPZ,
+};
+
+typedef struct CPUAVRState CPUAVRState;
+
+struct CPUAVRState {
+    uint32_t pc_w; /* 0x003fffff up to 22 bits */
+
+    uint32_t sregC; /* 0x00000001 1 bit */
+    uint32_t sregZ; /* 0x00000001 1 bit */
+    uint32_t sregN; /* 0x00000001 1 bit */
+    uint32_t sregV; /* 0x00000001 1 bit */
+    uint32_t sregS; /* 0x00000001 1 bit */
+    uint32_t sregH; /* 0x00000001 1 bit */
+    uint32_t sregT; /* 0x00000001 1 bit */
+    uint32_t sregI; /* 0x00000001 1 bit */
+
+    uint32_t rampD; /* 0x00ff0000 8 bits */
+    uint32_t rampX; /* 0x00ff0000 8 bits */
+    uint32_t rampY; /* 0x00ff0000 8 bits */
+    uint32_t rampZ; /* 0x00ff0000 8 bits */
+    uint32_t eind; /* 0x00ff0000 8 bits */
+
+    uint32_t r[NUMBER_OF_CPU_REGISTERS]; /* 8 bits each */
+    uint32_t sp; /* 16 bits */
+
+    uint32_t skip; /* if set skip instruction */
+
+    uint64_t intsrc; /* interrupt sources */
+    bool fullacc; /* CPU/MEM if true MEM only otherwise */
+
+    uint32_t features;
+};
+
+/**
+ *  AVRCPU:
+ *  @env: #CPUAVRState
+ *
+ *  A AVR CPU.
+ */
+typedef struct AVRCPU {
+    /*< private >*/
+    CPUState parent_obj;
+    /*< public >*/
+
+    CPUNegativeOffsetState neg;
+    CPUAVRState env;
+} AVRCPU;
+
+#ifndef CONFIG_USER_ONLY
+extern const struct VMStateDescription vms_avr_cpu;
+#endif
+
+void avr_cpu_do_interrupt(CPUState *cpu);
+bool avr_cpu_exec_interrupt(CPUState *cpu, int int_req);
+hwaddr avr_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+int avr_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
+int avr_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+
+static inline int avr_feature(CPUAVRState *env, int feature)
+{
+    return (env->features & (1U << feature)) != 0;
+}
+
+static inline void avr_set_feature(CPUAVRState *env, int feature)
+{
+    env->features |= (1U << feature);
+}
+
+#define cpu_list avr_cpu_list
+#define cpu_signal_handler cpu_avr_signal_handler
+#define cpu_mmu_index avr_cpu_mmu_index
+
+static inline int avr_cpu_mmu_index(CPUAVRState *env, bool ifetch)
+{
+    return ifetch ? MMU_CODE_IDX : MMU_DATA_IDX;
+}
+
+void avr_cpu_tcg_init(void);
+
+void avr_cpu_list(void);
+int cpu_avr_exec(CPUState *cpu);
+int cpu_avr_signal_handler(int host_signum, void *pinfo, void *puc);
+int avr_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int size,
+                                int rw, int mmu_idx);
+int avr_cpu_memory_rw_debug(CPUState *cs, vaddr address, uint8_t *buf,
+                                int len, bool is_write);
+
+enum {
+    TB_FLAGS_FULL_ACCESS = 1,
+    TB_FLAGS_SKIP = 2,
+};
+
+static inline void cpu_get_tb_cpu_state(CPUAVRState *env, target_ulong *pc,
+                                target_ulong *cs_base, uint32_t *pflags)
+{
+    uint32_t flags = 0;
+
+    *pc = env->pc_w * 2;
+    *cs_base = 0;
+
+    if (env->fullacc) {
+        flags |= TB_FLAGS_FULL_ACCESS;
+    }
+    if (env->skip) {
+        flags |= TB_FLAGS_SKIP;
+    }
+
+    *pflags = flags;
+}
+
+static inline int cpu_interrupts_enabled(CPUAVRState *env)
+{
+    return env->sregI != 0;
+}
+
+static inline uint8_t cpu_get_sreg(CPUAVRState *env)
+{
+    uint8_t sreg;
+    sreg = (env->sregC) << 0
+         | (env->sregZ) << 1
+         | (env->sregN) << 2
+         | (env->sregV) << 3
+         | (env->sregS) << 4
+         | (env->sregH) << 5
+         | (env->sregT) << 6
+         | (env->sregI) << 7;
+    return sreg;
+}
+
+static inline void cpu_set_sreg(CPUAVRState *env, uint8_t sreg)
+{
+    env->sregC = (sreg >> 0) & 0x01;
+    env->sregZ = (sreg >> 1) & 0x01;
+    env->sregN = (sreg >> 2) & 0x01;
+    env->sregV = (sreg >> 3) & 0x01;
+    env->sregS = (sreg >> 4) & 0x01;
+    env->sregH = (sreg >> 5) & 0x01;
+    env->sregT = (sreg >> 6) & 0x01;
+    env->sregI = (sreg >> 7) & 0x01;
+}
+
+bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr);
+
+typedef CPUAVRState CPUArchState;
+typedef AVRCPU ArchCPU;
+
+#include "exec/cpu-all.h"
+
+#endif /* !defined (QEMU_AVR_CPU_H) */
diff --git a/target/avr/cpu.c b/target/avr/cpu.c
new file mode 100644
index 0000000000..dae56d7845
--- /dev/null
+++ b/target/avr/cpu.c
@@ -0,0 +1,576 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/qemu-print.h"
+#include "exec/exec-all.h"
+#include "cpu.h"
+
+static void avr_cpu_set_pc(CPUState *cs, vaddr value)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+
+    cpu->env.pc_w = value / 2; /* internally PC points to words */
+}
+
+static bool avr_cpu_has_work(CPUState *cs)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    return (cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_RESET))
+            && cpu_interrupts_enabled(env);
+}
+
+static void avr_cpu_synchronize_from_tb(CPUState *cs, TranslationBlock *tb)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    env->pc_w = tb->pc / 2; /* internally PC points to words */
+}
+
+static void avr_cpu_reset(CPUState *cs)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    AVRCPUClass *mcc = AVR_CPU_GET_CLASS(cpu);
+    CPUAVRState *env = &cpu->env;
+
+    mcc->parent_reset(cs);
+
+    env->pc_w = 0;
+    env->sregI = 1;
+    env->sregC = 0;
+    env->sregZ = 0;
+    env->sregN = 0;
+    env->sregV = 0;
+    env->sregS = 0;
+    env->sregH = 0;
+    env->sregT = 0;
+
+    env->rampD = 0;
+    env->rampX = 0;
+    env->rampY = 0;
+    env->rampZ = 0;
+    env->eind = 0;
+    env->sp = 0;
+
+    env->skip = 0;
+
+    memset(env->r, 0, sizeof(env->r));
+
+    tlb_flush(cs);
+}
+
+static void avr_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
+{
+    info->mach = bfd_arch_avr;
+    info->print_insn = NULL;
+}
+
+static void avr_cpu_realizefn(DeviceState *dev, Error **errp)
+{
+    CPUState *cs = CPU(dev);
+    AVRCPUClass *mcc = AVR_CPU_GET_CLASS(dev);
+    Error *local_err = NULL;
+
+    cpu_exec_realizefn(cs, &local_err);
+    if (local_err != NULL) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    qemu_init_vcpu(cs);
+    cpu_reset(cs);
+
+    mcc->parent_realize(dev, errp);
+}
+
+static void avr_cpu_set_int(void *opaque, int irq, int level)
+{
+    AVRCPU *cpu = opaque;
+    CPUAVRState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    uint64_t mask = (1ull << irq);
+    if (level) {
+        env->intsrc |= mask;
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        env->intsrc &= ~mask;
+        if (env->intsrc == 0) {
+            cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+        }
+    }
+}
+
+static void avr_cpu_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+
+    cpu_set_cpustate_pointers(cpu);
+
+#ifndef CONFIG_USER_ONLY
+    /* Set the number of interrupts supported by the CPU. */
+    qdev_init_gpio_in(DEVICE(cpu), avr_cpu_set_int, 57);
+#endif
+}
+
+static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
+{
+    ObjectClass *oc;
+
+    oc = object_class_by_name(cpu_model);
+    if (object_class_dynamic_cast(oc, TYPE_AVR_CPU) == NULL ||
+        object_class_is_abstract(oc)) {
+        oc = NULL;
+    }
+    return oc;
+}
+
+static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+    int i;
+
+    qemu_fprintf(f, "\n");
+    qemu_fprintf(f, "PC:    %06x\n", env->pc_w);
+    qemu_fprintf(f, "SP:      %04x\n", env->sp);
+    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
+    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
+    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
+    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
+    qemu_fprintf(f, "EIND:      %02x\n", env->eind >> 16);
+    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
+    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
+    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
+    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
+                        env->sregI ? 'I' : '-',
+                        env->sregT ? 'T' : '-',
+                        env->sregH ? 'H' : '-',
+                        env->sregS ? 'S' : '-',
+                        env->sregV ? 'V' : '-',
+                        env->sregN ? '-' : 'N', /* Zf has negative logic */
+                        env->sregZ ? 'Z' : '-',
+                        env->sregC ? 'I' : '-');
+    qemu_fprintf(f, "SKIP:    %02x\n", env->skip);
+
+    qemu_fprintf(f, "\n");
+    for (i = 0; i < ARRAY_SIZE(env->r); i++) {
+        qemu_fprintf(f, "R[%02d]:  %02x   ", i, env->r[i]);
+
+        if ((i % 8) == 7) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+    qemu_fprintf(f, "\n");
+}
+
+static void avr_cpu_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    CPUClass *cc = CPU_CLASS(oc);
+    AVRCPUClass *mcc = AVR_CPU_CLASS(oc);
+
+    mcc->parent_realize = dc->realize;
+    dc->realize = avr_cpu_realizefn;
+
+    mcc->parent_reset = cc->reset;
+    cc->reset = avr_cpu_reset;
+
+    cc->class_by_name = avr_cpu_class_by_name;
+
+    cc->has_work = avr_cpu_has_work;
+    cc->do_interrupt = avr_cpu_do_interrupt;
+    cc->cpu_exec_interrupt = avr_cpu_exec_interrupt;
+    cc->dump_state = avr_cpu_dump_state;
+    cc->set_pc = avr_cpu_set_pc;
+#if !defined(CONFIG_USER_ONLY)
+    cc->memory_rw_debug = avr_cpu_memory_rw_debug;
+#endif
+#ifdef CONFIG_USER_ONLY
+    cc->handle_mmu_fault = avr_cpu_handle_mmu_fault;
+#else
+    cc->get_phys_page_debug = avr_cpu_get_phys_page_debug;
+    cc->vmsd = &vms_avr_cpu;
+#endif
+    cc->disas_set_info = avr_cpu_disas_set_info;
+    cc->tlb_fill = avr_cpu_tlb_fill;
+    cc->tcg_initialize = avr_cpu_tcg_init;
+    cc->synchronize_from_tb = avr_cpu_synchronize_from_tb;
+    cc->gdb_read_register = avr_cpu_gdb_read_register;
+    cc->gdb_write_register = avr_cpu_gdb_write_register;
+    cc->gdb_num_core_regs = 35;
+    cc->gdb_core_xml_file = "avr-cpu.xml";
+}
+
+static void avr_avr1_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+}
+
+static void avr_avr2_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+}
+
+static void avr_avr25_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+}
+
+static void avr_avr3_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+}
+
+static void avr_avr31_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+}
+
+static void avr_avr35_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+}
+
+static void avr_avr4_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+}
+
+static void avr_avr5_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+}
+
+static void avr_avr51_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_ELPMX);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+}
+
+static void avr_avr6_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_3_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_EIJMP_EICALL);
+    avr_set_feature(env, AVR_FEATURE_ELPMX);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+}
+
+static void avr_xmega2_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+    avr_set_feature(env, AVR_FEATURE_RMW);
+}
+
+static void avr_xmega4_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_ELPMX);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+    avr_set_feature(env, AVR_FEATURE_RMW);
+}
+
+static void avr_xmega5_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPD);
+    avr_set_feature(env, AVR_FEATURE_RAMPX);
+    avr_set_feature(env, AVR_FEATURE_RAMPY);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_ELPMX);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+    avr_set_feature(env, AVR_FEATURE_RMW);
+}
+
+static void avr_xmega6_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_3_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_EIJMP_EICALL);
+    avr_set_feature(env, AVR_FEATURE_ELPMX);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+    avr_set_feature(env, AVR_FEATURE_RMW);
+}
+
+static void avr_xmega7_initfn(Object *obj)
+{
+    AVRCPU *cpu = AVR_CPU(obj);
+    CPUAVRState *env = &cpu->env;
+
+    avr_set_feature(env, AVR_FEATURE_LPM);
+    avr_set_feature(env, AVR_FEATURE_IJMP_ICALL);
+    avr_set_feature(env, AVR_FEATURE_ADIW_SBIW);
+    avr_set_feature(env, AVR_FEATURE_SRAM);
+    avr_set_feature(env, AVR_FEATURE_BREAK);
+
+    avr_set_feature(env, AVR_FEATURE_3_BYTE_PC);
+    avr_set_feature(env, AVR_FEATURE_2_BYTE_SP);
+    avr_set_feature(env, AVR_FEATURE_RAMPD);
+    avr_set_feature(env, AVR_FEATURE_RAMPX);
+    avr_set_feature(env, AVR_FEATURE_RAMPY);
+    avr_set_feature(env, AVR_FEATURE_RAMPZ);
+    avr_set_feature(env, AVR_FEATURE_EIJMP_EICALL);
+    avr_set_feature(env, AVR_FEATURE_ELPMX);
+    avr_set_feature(env, AVR_FEATURE_ELPM);
+    avr_set_feature(env, AVR_FEATURE_JMP_CALL);
+    avr_set_feature(env, AVR_FEATURE_LPMX);
+    avr_set_feature(env, AVR_FEATURE_MOVW);
+    avr_set_feature(env, AVR_FEATURE_MUL);
+    avr_set_feature(env, AVR_FEATURE_RMW);
+}
+
+typedef struct AVRCPUInfo {
+    const char *name;
+    void (*initfn)(Object *obj);
+} AVRCPUInfo;
+
+
+static void avr_cpu_list_entry(gpointer data, gpointer user_data)
+{
+    const char *typename = object_class_get_name(OBJECT_CLASS(data));
+
+    qemu_printf("%s\n", typename);
+}
+
+void avr_cpu_list(void)
+{
+    GSList *list;
+    list = object_class_get_list_sorted(TYPE_AVR_CPU, false);
+    g_slist_foreach(list, avr_cpu_list_entry, NULL);
+    g_slist_free(list);
+}
+
+#define DEFINE_AVR_CPU_TYPE(model, initfn) \
+    { \
+        .parent = TYPE_AVR_CPU, \
+        .instance_init = initfn, \
+        .name = model "-avr-cpu", \
+    }
+
+static const TypeInfo avr_cpu_type_info[] = {
+    {
+        .name = TYPE_AVR_CPU,
+        .parent = TYPE_CPU,
+        .instance_size = sizeof(AVRCPU),
+        .instance_init = avr_cpu_initfn,
+        .class_size = sizeof(AVRCPUClass),
+        .class_init = avr_cpu_class_init,
+        .abstract = true,
+    },
+    DEFINE_AVR_CPU_TYPE("avr1", avr_avr1_initfn),
+    DEFINE_AVR_CPU_TYPE("avr2", avr_avr2_initfn),
+    DEFINE_AVR_CPU_TYPE("avr25", avr_avr25_initfn),
+    DEFINE_AVR_CPU_TYPE("avr3", avr_avr3_initfn),
+    DEFINE_AVR_CPU_TYPE("avr31", avr_avr31_initfn),
+    DEFINE_AVR_CPU_TYPE("avr35", avr_avr35_initfn),
+    DEFINE_AVR_CPU_TYPE("avr4", avr_avr4_initfn),
+    DEFINE_AVR_CPU_TYPE("avr5", avr_avr5_initfn),
+    DEFINE_AVR_CPU_TYPE("avr51", avr_avr51_initfn),
+    DEFINE_AVR_CPU_TYPE("avr6", avr_avr6_initfn),
+    DEFINE_AVR_CPU_TYPE("xmega2", avr_xmega2_initfn),
+    DEFINE_AVR_CPU_TYPE("xmega4", avr_xmega4_initfn),
+    DEFINE_AVR_CPU_TYPE("xmega5", avr_xmega5_initfn),
+    DEFINE_AVR_CPU_TYPE("xmega6", avr_xmega6_initfn),
+    DEFINE_AVR_CPU_TYPE("xmega7", avr_xmega7_initfn),
+};
+
+DEFINE_TYPES(avr_cpu_type_info)
diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
new file mode 100644
index 0000000000..20a5252482
--- /dev/null
+++ b/target/avr/gdbstub.c
@@ -0,0 +1,85 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "exec/gdbstub.h"
+
+int avr_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    /*  R */
+    if (n < 32) {
+        return gdb_get_reg8(mem_buf, env->r[n]);
+    }
+
+    /*  SREG */
+    if (n == 32) {
+        uint8_t sreg = cpu_get_sreg(env);
+
+        return gdb_get_reg8(mem_buf, sreg);
+    }
+
+    /*  SP */
+    if (n == 33) {
+        return gdb_get_reg16(mem_buf, env->sp & 0x0000ffff);
+    }
+
+    /*  PC */
+    if (n == 34) {
+        return gdb_get_reg32(mem_buf, env->pc_w * 2);
+    }
+
+    return 0;
+}
+
+int avr_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    /*  R */
+    if (n < 32) {
+        env->r[n] = *mem_buf;
+        return 1;
+    }
+
+    /*  SREG */
+    if (n == 32) {
+        cpu_set_sreg(env, *mem_buf);
+        return 1;
+    }
+
+    /*  SP */
+    if (n == 33) {
+        env->sp = lduw_p(mem_buf);
+        return 2;
+    }
+
+    /*  PC */
+    if (n == 34) {
+        env->pc_w = ldl_p(mem_buf) / 2;
+        return 4;
+    }
+
+    return 0;
+}
diff --git a/target/avr/machine.c b/target/avr/machine.c
new file mode 100644
index 0000000000..ba44bd042b
--- /dev/null
+++ b/target/avr/machine.c
@@ -0,0 +1,121 @@
+/*
+ * QEMU AVR CPU
+ *
+ * Copyright (c) 2019 Michael Rolnik
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see
+ * <http://www.gnu.org/licenses/lgpl-2.1.html>
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "migration/cpu.h"
+
+static int get_sreg(QEMUFile *f, void *opaque, size_t size,
+    const VMStateField *field)
+{
+    CPUAVRState *env = opaque;
+    uint8_t sreg;
+
+    sreg = qemu_get_byte(f);
+    cpu_set_sreg(env, sreg);
+    return 0;
+}
+
+static int put_sreg(
+    QEMUFile *f, void *opaque, size_t size,
+    const VMStateField *field, QJSON *vmdesc)
+{
+    CPUAVRState *env = opaque;
+    uint8_t sreg = cpu_get_sreg(env);
+
+    qemu_put_byte(f, sreg);
+    return 0;
+}
+
+static const VMStateInfo vms_sreg = {
+    .name = "sreg",
+    .get = get_sreg,
+    .put = put_sreg,
+};
+
+static int get_segment(
+    QEMUFile *f, void *opaque, size_t size, const VMStateField *field)
+{
+    uint32_t *ramp = opaque;
+    uint8_t temp;
+
+    temp = qemu_get_byte(f);
+    *ramp = ((uint32_t)temp) << 16;
+    return 0;
+}
+
+static int put_segment(
+    QEMUFile *f, void *opaque, size_t size,
+    const VMStateField *field, QJSON *vmdesc)
+{
+    uint32_t *ramp = opaque;
+    uint8_t temp = *ramp >> 16;
+
+    qemu_put_byte(f, temp);
+    return 0;
+}
+
+static const VMStateInfo vms_rampD = {
+    .name = "rampD",
+    .get = get_segment,
+    .put = put_segment,
+};
+static const VMStateInfo vms_rampX = {
+    .name = "rampX",
+    .get = get_segment,
+    .put = put_segment,
+};
+static const VMStateInfo vms_rampY = {
+    .name = "rampY",
+    .get = get_segment,
+    .put = put_segment,
+};
+static const VMStateInfo vms_rampZ = {
+    .name = "rampZ",
+    .get = get_segment,
+    .put = put_segment,
+};
+static const VMStateInfo vms_eind = {
+    .name = "eind",
+    .get = get_segment,
+    .put = put_segment,
+};
+
+const VMStateDescription vms_avr_cpu = {
+    .name = "cpu",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(env.pc_w, AVRCPU),
+        VMSTATE_UINT32(env.sp, AVRCPU),
+        VMSTATE_UINT32(env.skip, AVRCPU),
+
+        VMSTATE_UINT32_ARRAY(env.r, AVRCPU, NUMBER_OF_CPU_REGISTERS),
+
+        VMSTATE_SINGLE(env, AVRCPU, 0, vms_sreg, CPUAVRState),
+        VMSTATE_SINGLE(env.rampD, AVRCPU, 0, vms_rampD, uint32_t),
+        VMSTATE_SINGLE(env.rampX, AVRCPU, 0, vms_rampX, uint32_t),
+        VMSTATE_SINGLE(env.rampY, AVRCPU, 0, vms_rampY, uint32_t),
+        VMSTATE_SINGLE(env.rampZ, AVRCPU, 0, vms_rampZ, uint32_t),
+        VMSTATE_SINGLE(env.eind, AVRCPU, 0, vms_eind, uint32_t),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
diff --git a/gdb-xml/avr-cpu.xml b/gdb-xml/avr-cpu.xml
new file mode 100644
index 0000000000..c4747f5b40
--- /dev/null
+++ b/gdb-xml/avr-cpu.xml
@@ -0,0 +1,49 @@
+<?xml version="1.0"?>
+<!-- Copyright (C) 2018-2019 Free Software Foundation, Inc.
+
+     Copying and distribution of this file, with or without modification,
+     are permitted in any medium without royalty provided the copyright
+     notice and this notice are preserved.  -->
+
+<!-- Register numbers are hard-coded in order to maintain backward
+     compatibility with older versions of tools that didn't use xml
+     register descriptions.  -->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.riscv.cpu">
+  <reg name="r0" bitsize="8" type="int" regnum="0"/>
+  <reg name="r1" bitsize="8" type="int"/>
+  <reg name="r2" bitsize="8" type="int"/>
+  <reg name="r3" bitsize="8" type="int"/>
+  <reg name="r4" bitsize="8" type="int"/>
+  <reg name="r5" bitsize="8" type="int"/>
+  <reg name="r6" bitsize="8" type="int"/>
+  <reg name="r7" bitsize="8" type="int"/>
+  <reg name="r8" bitsize="8" type="int"/>
+  <reg name="r9" bitsize="8" type="int"/>
+  <reg name="r10" bitsize="8" type="int"/>
+  <reg name="r11" bitsize="8" type="int"/>
+  <reg name="r12" bitsize="8" type="int"/>
+  <reg name="r13" bitsize="8" type="int"/>
+  <reg name="r14" bitsize="8" type="int"/>
+  <reg name="r15" bitsize="8" type="int"/>
+  <reg name="r16" bitsize="8" type="int"/>
+  <reg name="r17" bitsize="8" type="int"/>
+  <reg name="r18" bitsize="8" type="int"/>
+  <reg name="r19" bitsize="8" type="int"/>
+  <reg name="r20" bitsize="8" type="int"/>
+  <reg name="r21" bitsize="8" type="int"/>
+  <reg name="r22" bitsize="8" type="int"/>
+  <reg name="r23" bitsize="8" type="int"/>
+  <reg name="r24" bitsize="8" type="int"/>
+  <reg name="r25" bitsize="8" type="int"/>
+  <reg name="r26" bitsize="8" type="int"/>
+  <reg name="r27" bitsize="8" type="int"/>
+  <reg name="r28" bitsize="8" type="int"/>
+  <reg name="r29" bitsize="8" type="int"/>
+  <reg name="r30" bitsize="8" type="int"/>
+  <reg name="r31" bitsize="8" type="int"/>
+  <reg name="sreg" bitsize="8" type="int"/>
+  <reg name="sp" bitsize="8" type="int"/>
+  <reg name="pc" bitsize="8" type="int"/>
+</feature>
-- 
2.17.2 (Apple Git-113)


