Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366BA4EDD46
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:36:35 +0200 (CEST)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwqg-0006BC-9c
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:36:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfM-00034L-Io; Thu, 31 Mar 2022 11:24:52 -0400
Received: from [187.72.171.209] (port=51585 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1nZwfJ-0004ne-OX; Thu, 31 Mar 2022 11:24:52 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Thu, 31 Mar 2022 12:24:02 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7992E8010D7;
 Thu, 31 Mar 2022 11:58:43 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [RFC PATCH v2 3/5] tests/tcg/ppc64: add basic softmmu test support
Date: Thu, 31 Mar 2022 11:58:11 -0300
Message-Id: <20220331145813.21719-4-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
References: <20220331145813.21719-1-leandro.lupori@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Mar 2022 15:24:02.0390 (UTC)
 FILETIME=[59FD5760:01D84513]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Leandro Lupori <leandro.lupori@eldorado.org.br>, danielhb413@gmail.com,
 richard.henderson@linaro.org, groug@kaod.org, clg@kaod.org,
 pbonzini@redhat.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add support to build and run the multiarch hello test, that simply
prints a message and exits.

The linker script, console code and related header files were
imported from https://github.com/legoater/pnv-test, that are the
Microwatt tests adapted to use a PowerNV console.
Some other changes were made on top of these, mainly on boot.S,
that was based on pnv-test/mmu/head.S, to better integrate with
QEMU test infrastructure.

Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 MAINTAINERS                              |   2 +
 tests/tcg/ppc64/Makefile.softmmu-target  |  59 ++++++++
 tests/tcg/ppc64/system/include/asm.h     |  62 ++++++++
 tests/tcg/ppc64/system/include/console.h |  15 ++
 tests/tcg/ppc64/system/include/io.h      |  61 ++++++++
 tests/tcg/ppc64/system/include/pnv.h     |  21 +++
 tests/tcg/ppc64/system/include/uart.h    |  54 +++++++
 tests/tcg/ppc64/system/lib/boot.S        |  68 +++++++++
 tests/tcg/ppc64/system/lib/console.c     | 173 +++++++++++++++++++++++
 tests/tcg/ppc64/system/lib/powerpc.lds   |  27 ++++
 10 files changed, 542 insertions(+)
 create mode 100644 tests/tcg/ppc64/Makefile.softmmu-target
 create mode 100644 tests/tcg/ppc64/system/include/asm.h
 create mode 100644 tests/tcg/ppc64/system/include/console.h
 create mode 100644 tests/tcg/ppc64/system/include/io.h
 create mode 100644 tests/tcg/ppc64/system/include/pnv.h
 create mode 100644 tests/tcg/ppc64/system/include/uart.h
 create mode 100644 tests/tcg/ppc64/system/lib/boot.S
 create mode 100644 tests/tcg/ppc64/system/lib/console.c
 create mode 100644 tests/tcg/ppc64/system/lib/powerpc.lds

diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef7..e8fde33562 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -266,6 +266,7 @@ M: Cédric Le Goater <clg@kaod.org>
 M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
+R: Leandro Lupori <leandro.lupori@eldorado.org.br>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: target/ppc/
@@ -273,6 +274,7 @@ F: hw/ppc/ppc.c
 F: hw/ppc/ppc_booke.c
 F: include/hw/ppc/ppc.h
 F: disas/ppc.c
+F: tests/tcg/ppc64/
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
diff --git a/tests/tcg/ppc64/Makefile.softmmu-target b/tests/tcg/ppc64/Makefile.softmmu-target
new file mode 100644
index 0000000000..8f9925ca5a
--- /dev/null
+++ b/tests/tcg/ppc64/Makefile.softmmu-target
@@ -0,0 +1,59 @@
+#
+# PowerPC64 system tests
+#
+
+# For now, disable tests that are failing
+DISABLED_TESTS := memory
+DISABLED_EXTRA_RUNS := run-gdbstub-memory
+
+PPC64_SYSTEM_SRC=$(SRC_PATH)/tests/tcg/ppc64/system
+VPATH+=$(PPC64_SYSTEM_SRC)
+
+# These objects provide the basic boot code and helper functions for all tests
+CRT_PATH=$(PPC64_SYSTEM_SRC)/lib
+CRT_OBJS=boot.o console.o
+
+PPC64_TEST_SRCS=$(wildcard $(PPC64_SYSTEM_SRC)/*.c)
+PPC64_TESTS=$(patsubst $(PPC64_SYSTEM_SRC)/%.c, %, $(PPC64_TEST_SRCS))
+
+LINK_SCRIPT=$(CRT_PATH)/powerpc.lds
+# NOTE: --build-id is stored before the first code section in the linked
+#       binary, which causes problems for most tests, that expect to
+#       begin at address 0.
+LDFLAGS=-Wl,-T$(LINK_SCRIPT) -Wl,--build-id=none -static -nostdlib \
+    $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
+TESTS += $(filter-out $(DISABLED_TESTS),$(PPC64_TESTS) $(MULTIARCH_TESTS))
+EXTRA_RUNS += $(filter-out $(DISABLED_EXTRA_RUNS),$(MULTIARCH_RUNS))
+
+# NOTE: -Os doesn't work well with -Wl,--oformat=binary
+#       Some linker generated functions, such as savegpr*/restgpr*,
+#       end up being undefined.
+CFLAGS = -O -g -Wall -std=c99 -msoft-float -mno-vsx -mno-altivec \
+         -fno-stack-protector -ffreestanding \
+         -I $(PPC64_SYSTEM_SRC)/include $(MINILIB_INC) \
+         -mcpu=power8
+
+# Leave the .elf files, to make debugging easier
+.PRECIOUS: $(CRT_OBJS) $(addsuffix .elf,$(TESTS))
+
+# Build CRT objects
+%.o: $(CRT_PATH)/%.S
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -x assembler-with-cpp -c $< -o $@
+
+%.o: $(CRT_PATH)/%.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) -c $< -o $@
+
+# Build and link the tests
+
+# The .elf files are just for debugging
+%.elf: %.c $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+
+%: %.c %.elf $(LINK_SCRIPT) $(CRT_OBJS) $(MINILIB_OBJS)
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS) -Wl,--oformat=binary
+
+memory: CFLAGS+=-DCHECK_UNALIGNED=1
+
+# Running
+QEMU_BASE_MACHINE=-cpu power9 -M powernv9 -m 1G -vga none -nographic
+QEMU_OPTS+=$(QEMU_BASE_MACHINE) -serial chardev:output -bios
diff --git a/tests/tcg/ppc64/system/include/asm.h b/tests/tcg/ppc64/system/include/asm.h
new file mode 100644
index 0000000000..60bc08cd5c
--- /dev/null
+++ b/tests/tcg/ppc64/system/include/asm.h
@@ -0,0 +1,62 @@
+#ifndef PPC64_ASM_H
+#define PPC64_ASM_H
+
+#define XCONCAT(a, b)       a ## b
+#define CONCAT(a, b)        XCONCAT(a, b)
+
+/* Load an immediate 64-bit value into a register */
+#define LOAD_IMM64(r, e)                        \
+    lis     r, (e)@highest;                     \
+    ori     r, r, (e)@higher;                   \
+    rldicr  r, r, 32, 31;                       \
+    oris    r, r, (e)@h;                        \
+    ori     r, r, (e)@l;
+
+/* Switch CPU to little-endian mode, if needed */
+#define FIXUP_ENDIAN \
+    tdi   0, 0, 0x48;   /* Reverse endian of b . + 8 */             \
+    b     $ + 44;       /* Skip trampoline if endian is good */     \
+    .long 0xa600607d;   /* mfmsr r11 */                             \
+    .long 0x01006b69;   /* xori r11,r11,1 */                        \
+    .long 0x00004039;   /* li r10,0 */                              \
+    .long 0x6401417d;   /* mtmsrd r10,1 */                          \
+    .long 0x05009f42;   /* bcl 20,31,$+4 */                         \
+    .long 0xa602487d;   /* mflr r10 */                              \
+    .long 0x14004a39;   /* addi r10,r10,20 */                       \
+    .long 0xa6035a7d;   /* mtsrr0 r10 */                            \
+    .long 0xa6037b7d;   /* mtsrr1 r11 */                            \
+    .long 0x2400004c    /* rfid */
+
+/* Handle differences between ELFv1 and ELFv2 ABIs */
+
+#define DOT_LABEL(name)     CONCAT(., name)
+
+#if !defined(_CALL_ELF) || _CALL_ELF == 1
+#define FUNCTION(name)                          \
+    .section ".opd", "aw";                      \
+    .p2align 3;                                 \
+    .globl   name;                              \
+name:                                           \
+    .quad   DOT_LABEL(name), .TOC.@tocbase, 0;  \
+    .previous;                                  \
+DOT_LABEL(name):
+
+#define CALL(fn)                                \
+    LOAD_IMM64(%r12, fn);                       \
+    ld      %r12, 0(%r12);                      \
+    mtctr   %r12;                               \
+    bctrl
+
+#else
+#define FUNCTION(name)                          \
+    .globl   name;                              \
+name:
+
+#define CALL(fn)                                \
+    LOAD_IMM64(%r12, fn);                       \
+    mtctr   %r12;                               \
+    bctrl
+
+#endif
+
+#endif
diff --git a/tests/tcg/ppc64/system/include/console.h b/tests/tcg/ppc64/system/include/console.h
new file mode 100644
index 0000000000..37ea45827b
--- /dev/null
+++ b/tests/tcg/ppc64/system/include/console.h
@@ -0,0 +1,15 @@
+#ifndef PPC64_CONSOLE_H
+#define PPC64_CONSOLE_H
+
+#include <stdbool.h>
+#include <stddef.h>
+
+void console_init(void);
+void console_set_irq_en(bool rx_irq, bool tx_irq);
+int getchar(void);
+int putchar(int c);
+int puts(const char *str);
+
+size_t strlen(const char *s);
+
+#endif
diff --git a/tests/tcg/ppc64/system/include/io.h b/tests/tcg/ppc64/system/include/io.h
new file mode 100644
index 0000000000..92932a5b75
--- /dev/null
+++ b/tests/tcg/ppc64/system/include/io.h
@@ -0,0 +1,61 @@
+#ifndef PPC64_IO_H
+#define PPC64_IO_H
+
+static inline uint8_t readb(unsigned long addr)
+{
+    uint8_t val;
+    __asm__ volatile("sync; lbzcix %0,0,%1"
+                     : "=r" (val) : "r" (addr) : "memory");
+    return val;
+}
+
+static inline uint16_t readw(unsigned long addr)
+{
+    uint16_t val;
+    __asm__ volatile("sync; lhzcix %0,0,%1"
+                     : "=r" (val) : "r" (addr) : "memory");
+    return val;
+}
+
+static inline uint32_t readl(unsigned long addr)
+{
+    uint32_t val;
+    __asm__ volatile("sync; lwzcix %0,0,%1"
+                     : "=r" (val) : "r" (addr) : "memory");
+    return val;
+}
+
+static inline uint64_t readq(unsigned long addr)
+{
+    uint64_t val;
+    __asm__ volatile("sync; ldcix %0,0,%1"
+                     : "=r" (val) : "r" (addr) : "memory");
+    return val;
+}
+
+static inline void writeb(uint8_t val, unsigned long addr)
+{
+    __asm__ volatile("sync; stbcix %0,0,%1"
+                     : : "r" (val), "r" (addr) : "memory");
+}
+
+static inline void writew(uint16_t val, unsigned long addr)
+{
+    __asm__ volatile("sync; sthcix %0,0,%1"
+                     : : "r" (val), "r" (addr) : "memory");
+}
+
+static inline void writel(uint32_t val, unsigned long addr)
+{
+    __asm__ volatile("sync; stwcix %0,0,%1"
+                     : : "r" (val), "r" (addr) : "memory");
+}
+
+static inline void writeq(uint64_t val, unsigned long addr)
+{
+    __asm__ volatile("sync; stdcix %0,0,%1"
+                     : : "r" (val), "r" (addr) : "memory");
+}
+
+#endif /* PPC64_IO_H */
+
diff --git a/tests/tcg/ppc64/system/include/pnv.h b/tests/tcg/ppc64/system/include/pnv.h
new file mode 100644
index 0000000000..0990a9fad9
--- /dev/null
+++ b/tests/tcg/ppc64/system/include/pnv.h
@@ -0,0 +1,21 @@
+#ifndef PPC64_PNV_H
+#define PPC64_PNV_H
+
+#define LPC_BASE_ADDR   0x0006030000000000
+#define LPC_IO_SPACE    0xd0010000
+#define LPC_FW_SPACE    0xf0000000
+
+#define UART_BASE       (LPC_BASE_ADDR + LPC_IO_SPACE + 0x3f8);
+
+#define MSR_HV (1ULL << (63 - 3))
+
+static inline bool is_pnv()
+{
+    unsigned long msr;
+
+    __asm__ volatile ("mfmsr %0"
+              : "=r" (msr)
+              : : "memory");
+    return !!(msr & MSR_HV);
+}
+#endif
diff --git a/tests/tcg/ppc64/system/include/uart.h b/tests/tcg/ppc64/system/include/uart.h
new file mode 100644
index 0000000000..77610e2ec2
--- /dev/null
+++ b/tests/tcg/ppc64/system/include/uart.h
@@ -0,0 +1,54 @@
+#ifndef PPC64_UART_H
+#define PPC64_UART_H
+
+/*
+ * Register definitions for our standard (16550 style) UART
+ */
+#define UART_REG_RX             0x00
+#define UART_REG_TX             0x00
+#define UART_REG_DLL            0x00
+#define UART_REG_IER            0x04
+#define   UART_REG_IER_RDI      0x01
+#define   UART_REG_IER_THRI     0x02
+#define   UART_REG_IER_RLSI     0x04
+#define   UART_REG_IER_MSI      0x08
+#define UART_REG_DLM            0x04
+#define UART_REG_IIR            0x08
+#define UART_REG_FCR            0x08
+#define   UART_REG_FCR_EN_FIFO  0x01
+#define   UART_REG_FCR_CLR_RCVR 0x02
+#define   UART_REG_FCR_CLR_XMIT 0x04
+#define   UART_REG_FCR_TRIG1    0x00
+#define   UART_REG_FCR_TRIG4    0x40
+#define   UART_REG_FCR_TRIG8    0x80
+#define   UART_REG_FCR_TRIG14   0xc0
+#define UART_REG_LCR            0x0c
+#define   UART_REG_LCR_5BIT     0x00
+#define   UART_REG_LCR_6BIT     0x01
+#define   UART_REG_LCR_7BIT     0x02
+#define   UART_REG_LCR_8BIT     0x03
+#define   UART_REG_LCR_STOP     0x04
+#define   UART_REG_LCR_PAR      0x08
+#define   UART_REG_LCR_EVEN_PAR 0x10
+#define   UART_REG_LCR_STIC_PAR 0x20
+#define   UART_REG_LCR_BREAK    0x40
+#define   UART_REG_LCR_DLAB     0x80
+#define UART_REG_MCR            0x10
+#define   UART_REG_MCR_DTR      0x01
+#define   UART_REG_MCR_RTS      0x02
+#define   UART_REG_MCR_OUT1     0x04
+#define   UART_REG_MCR_OUT2     0x08
+#define   UART_REG_MCR_LOOP     0x10
+#define UART_REG_LSR            0x14
+#define   UART_REG_LSR_DR       0x01
+#define   UART_REG_LSR_OE       0x02
+#define   UART_REG_LSR_PE       0x04
+#define   UART_REG_LSR_FE       0x08
+#define   UART_REG_LSR_BI       0x10
+#define   UART_REG_LSR_THRE     0x20
+#define   UART_REG_LSR_TEMT     0x40
+#define   UART_REG_LSR_FIFOE    0x80
+#define UART_REG_MSR            0x18
+#define UART_REG_SCR            0x1c
+
+#endif
diff --git a/tests/tcg/ppc64/system/lib/boot.S b/tests/tcg/ppc64/system/lib/boot.S
new file mode 100644
index 0000000000..607945fba4
--- /dev/null
+++ b/tests/tcg/ppc64/system/lib/boot.S
@@ -0,0 +1,68 @@
+/* Copyright 2013-2014 IBM Corp.
+ *
+ * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
+ * You may obtain a copy of the License at
+ *
+ *     http://www.apache.org/licenses/LICENSE-2.0
+ *
+ * Unless required by applicable law or agreed to in writing, software
+ * distributed under the License is distributed on an "AS IS" BASIS,
+ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
+ * implied.
+ * See the License for the specific language governing permissions and
+ * limitations under the License.
+ */
+
+#include "asm.h"
+
+#define SPR_HID0                0x3f0
+#define SPR_HID0_POWER9_HILE    0x0800000000000000
+
+    .section ".head","ax"
+
+    /* Microwatt currently enters in LE mode at 0x0 */
+    . = 0
+_start:
+    b start
+
+    /* QEMU enters in BE at 0x10 by default */
+    . = 0x10
+.global start
+start:
+    FIXUP_ENDIAN
+
+    /* Setup TOC */
+    LOAD_IMM64(%r2, .TOC.)
+
+    /* Configure interrupt endian */
+#ifdef __LITTLE_ENDIAN__
+    mfspr   %r10, SPR_HID0
+    LOAD_IMM64(%r11, SPR_HID0_POWER9_HILE)
+    or      %r10, %r10, %r11
+    mtspr   SPR_HID0, %r10
+#endif
+
+    /* Clear .bss */
+    LOAD_IMM64(%r10,__bss_start)
+    LOAD_IMM64(%r11,__bss_end)
+    subf    %r11,%r10,%r11
+    addi    %r11,%r11,63
+    srdi.   %r11,%r11,6
+    beq     2f
+    mtctr   %r11
+1:  dcbz    0,%r10
+    addi    %r10,%r10,64
+    bdnz    1b
+
+    /* Setup stack */
+2:  LOAD_IMM64(%r1,__stack_top)
+    li      %r0,0
+    stdu    %r0,-16(%r1)
+
+    CALL(console_init)
+    CALL(main)
+
+    /* Terminate on exit */
+    attn
+    b       .
diff --git a/tests/tcg/ppc64/system/lib/console.c b/tests/tcg/ppc64/system/lib/console.c
new file mode 100644
index 0000000000..a4d8b02e21
--- /dev/null
+++ b/tests/tcg/ppc64/system/lib/console.c
@@ -0,0 +1,173 @@
+#include <stdint.h>
+#include <stdbool.h>
+
+#include "console.h"
+#include "pnv.h"
+#include "io.h"
+#include "uart.h"
+
+#define UART_BAUDS          115200
+#define H_PUT_TERM_CHAR     88
+
+/*
+ * Core UART functions to implement for a port
+ */
+
+static uint64_t uart_base;
+
+struct console_ops {
+    int (*putchar)(int c);
+} ops;
+
+
+static unsigned long uart_divisor(unsigned long uart_freq, unsigned long bauds)
+{
+    return uart_freq / (bauds * 16);
+}
+
+static bool std_uart_rx_empty(void)
+{
+    return !(readb(uart_base + UART_REG_LSR) & UART_REG_LSR_DR);
+}
+
+static uint8_t std_uart_read(void)
+{
+    return readb(uart_base + UART_REG_RX);
+}
+
+static bool std_uart_tx_full(void)
+{
+    /* TODO: check UART LSR */
+    return 0;
+}
+
+static void std_uart_write(uint8_t c)
+{
+    writeb(c, uart_base + UART_REG_TX);
+}
+
+static void std_uart_set_irq_en(bool rx_irq, bool tx_irq)
+{
+    uint8_t ier = 0;
+
+    if (tx_irq) {
+        ier |= UART_REG_IER_THRI;
+    }
+    if (rx_irq) {
+        ier |= UART_REG_IER_RDI;
+    }
+    writeb(ier, uart_base + UART_REG_IER);
+}
+
+static void std_uart_init(uint64_t uart_freq)
+{
+    unsigned long div = uart_divisor(uart_freq, UART_BAUDS);
+
+    writeb(UART_REG_LCR_DLAB,     uart_base + UART_REG_LCR);
+    writeb(div & 0xff,            uart_base + UART_REG_DLL);
+    writeb(div >> 8,              uart_base + UART_REG_DLM);
+    writeb(UART_REG_LCR_8BIT,     uart_base + UART_REG_LCR);
+    writeb(UART_REG_MCR_DTR |
+           UART_REG_MCR_RTS,      uart_base + UART_REG_MCR);
+    writeb(UART_REG_FCR_EN_FIFO |
+           UART_REG_FCR_CLR_RCVR |
+           UART_REG_FCR_CLR_XMIT, uart_base + UART_REG_FCR);
+}
+
+int getchar(void)
+{
+    while (std_uart_rx_empty()) {
+        ;   /* Do nothing */
+    }
+    return std_uart_read();
+}
+
+int putchar(int c)
+{
+    return ops.putchar(c);
+}
+
+void __sys_outc(char c)
+{
+    putchar(c);
+}
+
+static int putchar_uart(int c)
+{
+    while (std_uart_tx_full()) {
+        ;   /* Do Nothing */
+    }
+    std_uart_write(c);
+    return c;
+}
+
+static int putchar_hvc(int c)
+{
+    register unsigned long hcall __asm__("r3") = H_PUT_TERM_CHAR;
+    register unsigned long termno __asm__("r4") = 0;
+    register unsigned long length __asm__("r5") = 1;
+    register unsigned long str __asm__("r6") = __builtin_bswap64(c);
+
+    __asm__ volatile ("sc 1" : : "r" (hcall), "r" (termno), "r" (length),
+                      "r" (str) : );
+    return c;
+}
+
+int puts(const char *str)
+{
+    unsigned int i;
+
+    for (i = 0; *str; i++) {
+        char c = *(str++);
+        if (c == 10) {
+            putchar(13);
+        }
+        putchar(c);
+    }
+    return 0;
+}
+
+size_t strlen(const char *s)
+{
+    size_t len = 0;
+
+    while (*s++) {
+        len++;
+    }
+
+    return len;
+}
+
+struct console_ops pseries_console = {
+    .putchar = putchar_hvc,
+};
+
+struct console_ops pnv_console = {
+    .putchar = putchar_uart,
+};
+
+void uart_init(void)
+{
+    uint64_t proc_freq; /* TODO */
+
+    proc_freq = 0; /* TODO */
+
+    uart_base = UART_BASE
+
+    std_uart_init(proc_freq);
+}
+
+void console_init(void)
+{
+    if (is_pnv()) {
+        ops = pnv_console;
+        uart_init();
+    } else {
+        ops = pseries_console;
+    }
+}
+
+void console_set_irq_en(bool rx_irq, bool tx_irq)
+{
+    std_uart_set_irq_en(rx_irq, tx_irq);
+}
diff --git a/tests/tcg/ppc64/system/lib/powerpc.lds b/tests/tcg/ppc64/system/lib/powerpc.lds
new file mode 100644
index 0000000000..db451e1fb9
--- /dev/null
+++ b/tests/tcg/ppc64/system/lib/powerpc.lds
@@ -0,0 +1,27 @@
+SECTIONS
+{
+    . = 0;
+    _start = .;
+    .head : {
+        KEEP(*(.head))
+    }
+    . = ALIGN(0x1000);
+    .text : { *(.text) *(.text.*) *(.rodata) *(.rodata.*) }
+    . = ALIGN(0x1000);
+    .data : { *(.data) *(.data.*) *(.got) *(.toc) }
+    . = ALIGN(0x80);
+    __bss_start = .;
+    .bss : {
+        *(.dynsbss)
+        *(.sbss)
+        *(.scommon)
+        *(.dynbss)
+        *(.bss)
+        *(.common)
+        *(.bss.*)
+    }
+    . = ALIGN(0x80);
+    __bss_end = .;
+    . = . + 0x4000;
+    __stack_top = .;
+}
-- 
2.25.1


