Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B10DF81F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 00:42:14 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMgNR-0006hd-HS
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 18:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51880)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mrolnik@gmail.com>) id 1iMgJ4-0001X7-V6
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 18:37:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mrolnik@gmail.com>) id 1iMgJ2-0000xy-Nb
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 18:37:42 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:39303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mrolnik@gmail.com>) id 1iMgJ2-0000xn-GY
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 18:37:40 -0400
Received: by mail-wr1-x42f.google.com with SMTP id c6so3531631wrm.6
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Wrb/eh//pKqC5sqQg+JmF7gLP8TvTzApdrnvwmESS9w=;
 b=ABwcW+KMU2nT8/mlKWDjkD5s407n7XhLnFVsYS7wm6NFekXiTIuT4Pu87FltJY0iP1
 ooo/tHGQtALDsxLrJfHaV0XxfOnAP7w4T+JfkkaYSw8rFPHACO97xuXUzzz2R1+M/FXr
 9GipzwXlW3DMQ0qhJZ4oGCBqHPT0nzSprySCZAMLKAhE3nVJZBAUBqb1lquVxJ3mAvlR
 SHSgFFzc/2jZEk+NZtA/mNdxNJKZr3+XT0fh+9fkUetp2j9BD+5KZ4PsiFc/QoVYSML5
 ZzJwgYga0a+rhME75yNQHhsyhYU0IKZk8uixfw3C2SS5bN1DQE0TuvsxcDK3j36uWnQA
 0yGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Wrb/eh//pKqC5sqQg+JmF7gLP8TvTzApdrnvwmESS9w=;
 b=tbCZ6wWwZHPeMZ5aC4gXbH5XcD6gRsuBg1usyQ8OP9wglJkhs91XCfyK1B8e1oJry7
 8SKpHE6FmMaDbb2W8G/tsLXrUC5Dw7zP5xFGpmEyUVRs79dXWkQjQ6eERZnBG+l3ef7R
 w/5ajXombsYDk8orsxAJ+58LaWQsiwzemACiWOZR4kL5A+z2P1DU9Ba2RomRe8o3K+Nz
 NrcbgE+0kHkV556uDXIfgz5KMRiRxv1cdqRBkfUHu6dm88Za/DawYyCJuw8ffL1GrOks
 Ru7FVj4ycDO+tnGCM4NKrtW4b+HbTspcStW4h5lQm9Jyj2g8ZFAG6kb3zotN63w0RpdF
 YLUA==
X-Gm-Message-State: APjAAAVlSGtpMsDEg3yJdxfDbE79I/Cg3eh6x28iQLD3r6D+vdAiNkUD
 PrhnVWiiscOOjYHIP1n2YMsWNfud8kC8Sg==
X-Google-Smtp-Source: APXvYqyP/mLqDyzhkcFyo4OD3+yRMSYYknDGP4UndDjziNieY/vxIMr2OKhUw1Hyhs268Rctehzgaw==
X-Received: by 2002:a5d:4382:: with SMTP id i2mr447098wrq.387.1571697458910;
 Mon, 21 Oct 2019 15:37:38 -0700 (PDT)
Received: from 8c859074c0ff.ant.amazon.com.com
 (bzq-109-65-50-254.red.bezeqint.net. [109.65.50.254])
 by smtp.gmail.com with ESMTPSA id q66sm16951271wme.39.2019.10.21.15.37.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 21 Oct 2019 15:37:38 -0700 (PDT)
From: Michael Rolnik <mrolnik@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v33 02/13] target/avr: Add instruction helpers
Date: Tue, 22 Oct 2019 01:37:00 +0300
Message-Id: <20191021223711.66955-3-mrolnik@gmail.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
In-Reply-To: <20191021223711.66955-1-mrolnik@gmail.com>
References: <20191021223711.66955-1-mrolnik@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
 richard.henderson@linaro.org, dovgaluk@ispras.ru, imammedo@redhat.com,
 philmd@redhat.com, aleksandar.m.mail@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stubs for unimplemented instructions and helpers for instructions that need to interact with QEMU.
SPM and WDR are unimplemented because they require emulation of complex peripherals.
The implementation of SLEEP is very limited due to the lack of peripherals to generate wake interrupts.
Memory access instructions are implemented here because some address ranges actually refer to CPU registers.

Signed-off-by: Michael Rolnik <mrolnik@gmail.com>
---
 target/avr/helper.c | 354 ++++++++++++++++++++++++++++++++++++++++++++
 target/avr/helper.h |  29 ++++
 2 files changed, 383 insertions(+)
 create mode 100644 target/avr/helper.c
 create mode 100644 target/avr/helper.h

diff --git a/target/avr/helper.c b/target/avr/helper.c
new file mode 100644
index 0000000000..f0f0d4f15a
--- /dev/null
+++ b/target/avr/helper.c
@@ -0,0 +1,354 @@
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
+
+#include "cpu.h"
+#include "hw/irq.h"
+#include "hw/sysbus.h"
+#include "sysemu/sysemu.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "exec/helper-proto.h"
+#include "exec/ioport.h"
+#include "qemu/host-utils.h"
+#include "qemu/error-report.h"
+
+bool avr_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    bool ret = false;
+    CPUClass *cc = CPU_GET_CLASS(cs);
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    if (interrupt_request & CPU_INTERRUPT_RESET) {
+        if (cpu_interrupts_enabled(env)) {
+            cs->exception_index = EXCP_RESET;
+            cc->do_interrupt(cs);
+
+            cs->interrupt_request &= ~CPU_INTERRUPT_RESET;
+
+            ret = true;
+        }
+    }
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        if (cpu_interrupts_enabled(env) && env->intsrc != 0) {
+            int index = ctz32(env->intsrc);
+            cs->exception_index = EXCP_INT(index);
+            cc->do_interrupt(cs);
+
+            env->intsrc &= env->intsrc - 1; /* clear the interrupt */
+            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
+
+            ret = true;
+        }
+    }
+    return ret;
+}
+
+void avr_cpu_do_interrupt(CPUState *cs)
+{
+    AVRCPU *cpu = AVR_CPU(cs);
+    CPUAVRState *env = &cpu->env;
+
+    uint32_t ret = env->pc_w;
+    int vector = 0;
+    int size = avr_feature(env, AVR_FEATURE_JMP_CALL) ? 2 : 1;
+    int base = 0;
+
+    if (cs->exception_index == EXCP_RESET) {
+        vector = 0;
+    } else if (env->intsrc != 0) {
+        vector = ctz32(env->intsrc) + 1;
+    }
+
+    if (avr_feature(env, AVR_FEATURE_3_BYTE_PC)) {
+        cpu_stb_data(env, env->sp--, (ret & 0x0000ff));
+        cpu_stb_data(env, env->sp--, (ret & 0x00ff00) >> 8);
+        cpu_stb_data(env, env->sp--, (ret & 0xff0000) >> 16);
+    } else if (avr_feature(env, AVR_FEATURE_2_BYTE_PC)) {
+        cpu_stb_data(env, env->sp--, (ret & 0x0000ff));
+        cpu_stb_data(env, env->sp--, (ret & 0x00ff00) >> 8);
+    } else {
+        cpu_stb_data(env, env->sp--, (ret & 0x0000ff));
+    }
+
+    env->pc_w = base + vector * size;
+    env->sregI = 0; /* clear Global Interrupt Flag */
+
+    cs->exception_index = -1;
+}
+
+int avr_cpu_memory_rw_debug(CPUState *cs, vaddr addr, uint8_t *buf,
+                                int len, bool is_write)
+{
+    return cpu_memory_rw_debug(cs, addr, buf, len, is_write);
+}
+
+hwaddr avr_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
+{
+    return addr; /* I assume 1:1 address correspondance */
+}
+
+int avr_cpu_handle_mmu_fault(
+    CPUState *cs, vaddr address, int size, int rw, int mmu_idx)
+{
+    /* currently it's assumed that this will never happen */
+    cs->exception_index = EXCP_DEBUG;
+    cpu_dump_state(cs, stderr, 0);
+    return 1;
+}
+
+bool avr_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                        MMUAccessType access_type, int mmu_idx,
+                        bool probe, uintptr_t retaddr)
+{
+    int prot = 0;
+    MemTxAttrs attrs = {};
+    uint32_t paddr;
+
+    address &= TARGET_PAGE_MASK;
+
+    if (mmu_idx == MMU_CODE_IDX) {
+        /* access to code in flash */
+        paddr = OFFSET_CODE + address;
+        prot = PAGE_READ | PAGE_EXEC;
+        if (paddr + TARGET_PAGE_SIZE > OFFSET_DATA) {
+            error_report("execution left flash memory");
+            exit(1);
+        }
+    } else if (address < NO_CPU_REGISTERS + NO_IO_REGISTERS) {
+        /*
+         * access to CPU registers, exit and rebuilt this TB to use full access
+         * incase it touches specially handled registers like SREG or SP
+         */
+        AVRCPU *cpu = AVR_CPU(cs);
+        CPUAVRState *env = &cpu->env;
+        env->fullacc = 1;
+        cpu_loop_exit_restore(cs, retaddr);
+    } else {
+        /* access to memory. nothing special */
+        paddr = OFFSET_DATA + address;
+        prot = PAGE_READ | PAGE_WRITE;
+    }
+
+    tlb_set_page_with_attrs(
+        cs, address, paddr, attrs, prot, mmu_idx, TARGET_PAGE_SIZE);
+
+    return true;
+}
+
+void helper_sleep(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_HLT;
+    cpu_loop_exit(cs);
+}
+
+void helper_unsupported(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    /*
+     *  I count not find what happens on the real platform, so
+     *  it's EXCP_DEBUG for meanwhile
+     */
+    cs->exception_index = EXCP_DEBUG;
+    if (qemu_loglevel_mask(LOG_UNIMP)) {
+        qemu_log("UNSUPPORTED\n");
+        cpu_dump_state(cs, qemu_logfile, 0);
+    }
+    cpu_loop_exit(cs);
+}
+
+void helper_debug(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+void helper_break(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+void helper_wdr(CPUAVRState *env)
+{
+    CPUState *cs = env_cpu(env);
+
+    /* WD is not implemented yet, placeholder */
+    cs->exception_index = EXCP_DEBUG;
+    cpu_loop_exit(cs);
+}
+
+/*
+ * This function implements IN instruction
+ *
+ * It does the following
+ * a.  if an IO register belongs to CPU, its value is read and returned
+ * b.  otherwise io address is translated to mem address and physical memory
+ *     is read.
+ * c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementation
+ *
+ */
+target_ulong helper_inb(CPUAVRState *env, uint32_t port)
+{
+    target_ulong data = 0;
+
+    switch (port) {
+    case 0x38: /* RAMPD */
+        data = 0xff & (env->rampD >> 16);
+        break;
+    case 0x39: /* RAMPX */
+        data = 0xff & (env->rampX >> 16);
+        break;
+    case 0x3a: /* RAMPY */
+        data = 0xff & (env->rampY >> 16);
+        break;
+    case 0x3b: /* RAMPZ */
+        data = 0xff & (env->rampZ >> 16);
+        break;
+    case 0x3c: /* EIND */
+        data = 0xff & (env->eind >> 16);
+        break;
+    case 0x3d: /* SPL */
+        data = env->sp & 0x00ff;
+        break;
+    case 0x3e: /* SPH */
+        data = env->sp >> 8;
+        break;
+    case 0x3f: /* SREG */
+        data = cpu_get_sreg(env);
+        break;
+    default:
+        /* not a special register, pass to normal memory access */
+        cpu_physical_memory_read(OFFSET_IO_REGISTERS + port, &data, 1);
+    }
+
+    return data;
+}
+
+/*
+ *  This function implements OUT instruction
+ *
+ *  It does the following
+ *  a.  if an IO register belongs to CPU, its value is written into the register
+ *  b.  otherwise io address is translated to mem address and physical memory
+ *      is written.
+ *  c.  it caches the value for sake of SBI, SBIC, SBIS & CBI implementation
+ *
+ */
+void helper_outb(CPUAVRState *env, uint32_t port, uint32_t data)
+{
+    data &= 0x000000ff;
+
+    switch (port) {
+    case 0x38: /* RAMPD */
+        if (avr_feature(env, AVR_FEATURE_RAMPD)) {
+            env->rampD = (data & 0xff) << 16;
+        }
+        break;
+    case 0x39: /* RAMPX */
+        if (avr_feature(env, AVR_FEATURE_RAMPX)) {
+            env->rampX = (data & 0xff) << 16;
+        }
+        break;
+    case 0x3a: /* RAMPY */
+        if (avr_feature(env, AVR_FEATURE_RAMPY)) {
+            env->rampY = (data & 0xff) << 16;
+        }
+        break;
+    case 0x3b: /* RAMPZ */
+        if (avr_feature(env, AVR_FEATURE_RAMPZ)) {
+            env->rampZ = (data & 0xff) << 16;
+        }
+        break;
+    case 0x3c: /* EIDN */
+        env->eind = (data & 0xff) << 16;
+        break;
+    case 0x3d: /* SPL */
+        env->sp = (env->sp & 0xff00) | (data);
+        break;
+    case 0x3e: /* SPH */
+        if (avr_feature(env, AVR_FEATURE_2_BYTE_SP)) {
+            env->sp = (env->sp & 0x00ff) | (data << 8);
+        }
+        break;
+    case 0x3f: /* SREG */
+        cpu_set_sreg(env, data);
+        break;
+    default:
+        /* not a special register, pass to normal memory access */
+        cpu_physical_memory_write(OFFSET_IO_REGISTERS + port, &data, 1);
+    }
+}
+
+/*
+ *  this function implements LD instruction when there is a posibility to read
+ *  from a CPU register
+ */
+target_ulong helper_fullrd(CPUAVRState *env, uint32_t addr)
+{
+    uint8_t data;
+
+    env->fullacc = false;
+
+    if (addr < NO_CPU_REGISTERS) {
+        /* CPU registers */
+        data = env->r[addr];
+    } else if (addr < NO_CPU_REGISTERS + NO_IO_REGISTERS) {
+        /* IO registers */
+        data = helper_inb(env, addr - NO_CPU_REGISTERS);
+    } else {
+        /* memory */
+        cpu_physical_memory_read(OFFSET_DATA + addr, &data, 1);
+    }
+    return data;
+}
+
+/*
+ *  this function implements ST instruction when there is a posibility to write
+ *  into a CPU register
+ */
+void helper_fullwr(CPUAVRState *env, uint32_t data, uint32_t addr)
+{
+    env->fullacc = false;
+
+    /* Following logic assumes this: */
+    assert(OFFSET_CPU_REGISTERS == OFFSET_DATA);
+    assert(OFFSET_IO_REGISTERS == OFFSET_CPU_REGISTERS + NO_CPU_REGISTERS);
+
+    if (addr < NO_CPU_REGISTERS) {
+        /* CPU registers */
+        env->r[addr] = data;
+    } else if (addr < NO_CPU_REGISTERS + NO_IO_REGISTERS) {
+        /* IO registers */
+        helper_outb(env, addr - NO_CPU_REGISTERS, data);
+    } else {
+        /* memory */
+        cpu_physical_memory_write(OFFSET_DATA + addr, &data, 1);
+    }
+}
diff --git a/target/avr/helper.h b/target/avr/helper.h
new file mode 100644
index 0000000000..bf087504a8
--- /dev/null
+++ b/target/avr/helper.h
@@ -0,0 +1,29 @@
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
+DEF_HELPER_1(wdr, void, env)
+DEF_HELPER_1(debug, void, env)
+DEF_HELPER_1(break, void, env)
+DEF_HELPER_1(sleep, void, env)
+DEF_HELPER_1(unsupported, void, env)
+DEF_HELPER_3(outb, void, env, i32, i32)
+DEF_HELPER_2(inb, tl, env, i32)
+DEF_HELPER_3(fullwr, void, env, i32, i32)
+DEF_HELPER_2(fullrd, tl, env, i32)
-- 
2.17.2 (Apple Git-113)


