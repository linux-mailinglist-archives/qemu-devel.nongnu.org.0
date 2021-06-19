Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B76E3AD798
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:56:06 +0200 (CEST)
Received: from localhost ([::1]:52294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luS5V-0003OG-7e
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRte-0000G7-06
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:50 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtT-00083s-0P
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:49 -0400
Received: by mail-pf1-x42e.google.com with SMTP id g192so1535332pfb.6
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kSp7KfgnjyVafFIoY3p7Wtj26SoZF+TYJt49SIfQL/o=;
 b=KVi5qQRhrgEDWhuK/xKMiaDbCXyel4gzapVmvNo+0y0YDXjZgXD3EPLhBIuJNsHMSu
 RPdyTTBKR3m+igs/+VylIlogfvOJq3HU0K9l/T56RRG71m+vTVemYLJgMrk3+DE45MRM
 Asm03Z7o5IP/ZN+D96MsuBTIy1ejIYeP80XACPwdTgQiPi+7RdbBFXBjQTTG7Y7fRjRy
 pISt1kb/eYkVJAxYYnr+Tmpxyio/dyYUJ4EO4ghJneVAech894EdlPVEAQZUbuKkhHtO
 15UepEzQMA8SUhwaBThLRAM2UUUNDAqak0gdo6AoaqBjcQeaxoif/C+3DGDKrWWG+qv7
 NmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kSp7KfgnjyVafFIoY3p7Wtj26SoZF+TYJt49SIfQL/o=;
 b=ZOC031IRECpqEeqGbqn7pE8qoQo4YW5x/WPON4R4ca+72kXPGnwVcA0ySmlOX/F3Rb
 Ca0JhyT+8282CePZ5gX1pT/9yB+0dei9IwcfsAOWXzwfvYmuZBuURqy3FrO9axMfrUtj
 JzK44fdGVkAx2CDSDrKPZa5G001H8nr+neAKbg1wW2foHyNa7El8mspm2sdi4HVoLhld
 tfg4K9Q0pF/PBNql13NcnE2Qfox9iI6gp1H445vjFYzGeaGQjflDB/G+BhkQOJOyBhOW
 vzVIB2jpCnQUXKaoBihj7ubjWF3fv7ll+/SAsVwGfQPYUiExdzJfT7T/ztNNrW4a1cTb
 mrEA==
X-Gm-Message-State: AOAM532pYGrIwS9dQalfcmyiQKNbwfg98LEmblSAFGSx++ixfHr4U+UB
 4nrImaC+plDDHcJ45BUhwksWtZGDcd9RDA==
X-Google-Smtp-Source: ABdhPJztlzsvRBSGN796AGtt8dReIGXywGydszl2hnZfvJW0/MvXOB69GHek7lDhN+tVAyvY4A+22w==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr12903165pgi.107.1624074217674; 
 Fri, 18 Jun 2021 20:43:37 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/12] linux-user/hppa: Add vdso and use it for rt_sigreturn
Date: Fri, 18 Jun 2021 20:43:29 -0700
Message-Id: <20210619034329.532318-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Building the vdso itself is not actually wired up to anything, since
we require a cross-compiler.  Just check in that file for now.

Drop the now-unused 9 trampoline words, and describe the frame
without the trampoline in __kernel_rt_sigreturn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c          |   3 +
 linux-user/hppa/signal.c      |   8 +-
 linux-user/hppa/Makefile.vdso |   4 +
 linux-user/hppa/meson.build   |   6 ++
 linux-user/hppa/vdso.S        | 149 ++++++++++++++++++++++++++++++++++
 linux-user/hppa/vdso.ld       |  75 +++++++++++++++++
 linux-user/hppa/vdso.so       | Bin 0 -> 5192 bytes
 7 files changed, 238 insertions(+), 7 deletions(-)
 create mode 100644 linux-user/hppa/Makefile.vdso
 create mode 100644 linux-user/hppa/vdso.S
 create mode 100644 linux-user/hppa/vdso.ld
 create mode 100755 linux-user/hppa/vdso.so

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index b70a5c48a2..6cea556b70 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1457,6 +1457,9 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define STACK_GROWS_DOWN 0
 #define STACK_ALIGNMENT  64
 
+#define HAVE_VDSO 1
+#include "vdso.c.inc"
+
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
 {
diff --git a/linux-user/hppa/signal.c b/linux-user/hppa/signal.c
index 0e266f472d..44e2db6d3e 100644
--- a/linux-user/hppa/signal.c
+++ b/linux-user/hppa/signal.c
@@ -40,7 +40,6 @@ struct target_ucontext {
 };
 
 struct target_rt_sigframe {
-    abi_uint tramp[9];
     target_siginfo_t info;
     struct target_ucontext uc;
     /* hidden location of upper halves of pa2.0 64-bit gregs */
@@ -138,14 +137,9 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
 
     setup_sigcontext(&frame->uc.tuc_mcontext, env);
 
-    __put_user(0x34190000, frame->tramp + 0); /* ldi 0,%r25 */
-    __put_user(0x3414015a, frame->tramp + 1); /* ldi __NR_rt_sigreturn,%r20 */
-    __put_user(0xe4008200, frame->tramp + 2); /* be,l 0x100(%sr2,%r0) */
-    __put_user(0x08000240, frame->tramp + 3); /* nop */
-
     unlock_user_struct(frame, frame_addr, 1);
 
-    env->gr[2] = h2g(frame->tramp);
+    env->gr[2] = default_rt_sigreturn;
     env->gr[30] = sp;
     env->gr[26] = sig;
     env->gr[25] = h2g(&frame->info);
diff --git a/linux-user/hppa/Makefile.vdso b/linux-user/hppa/Makefile.vdso
new file mode 100644
index 0000000000..ce92d51a37
--- /dev/null
+++ b/linux-user/hppa/Makefile.vdso
@@ -0,0 +1,4 @@
+vdso.so: vdso.S vdso.ld Makefile.vdso
+	hppa-linux-gnu-gcc -nostdlib -shared -Wl,-T,vdso.ld \
+	  -Wl,-h,linux-vdso.so.1 -Wl,--build-id=none \
+	  -Wl,--hash-style=both vdso.S -o $@
diff --git a/linux-user/hppa/meson.build b/linux-user/hppa/meson.build
index 4709508a09..3febe8523a 100644
--- a/linux-user/hppa/meson.build
+++ b/linux-user/hppa/meson.build
@@ -3,3 +3,9 @@ syscall_nr_generators += {
                     arguments: [ meson.current_source_dir() / 'syscallhdr.sh', '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@' ],
                     output: '@BASENAME@_nr.h')
 }
+
+gen = [
+  gen_vdso.process('vdso.so')
+]
+
+linux_user_ss.add(when: 'TARGET_HPPA', if_true: gen)
diff --git a/linux-user/hppa/vdso.S b/linux-user/hppa/vdso.S
new file mode 100644
index 0000000000..eeae2c999a
--- /dev/null
+++ b/linux-user/hppa/vdso.S
@@ -0,0 +1,149 @@
+/*
+ * hppa linux kernel vdso replacement.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <asm/unistd.h>
+
+	.text
+
+#define sizeof_rt_sigframe		696
+#define offsetof_sigcontext		152
+#define offsetof_sigcontext_gr		offsetof_sigcontext + 4
+#define offsetof_sigcontext_fr		offsetof_sigcontext_gr + 32 * 4
+#define offsetof_sigcontext_iasq	offsetof_sigcontext_fr + 32 * 8
+#define offsetof_sigcontext_iaoq	offsetof_sigcontext_iasq + 8
+#define offsetof_sigcontext_sar		offsetof_sigcontext_iaoq + 8
+
+	/*
+	 * While this frame is marked as a signal frame, that only applies
+	 * to how this return address is handled for the outer frame.
+	 * The return address that arrived here, from the inner frame, is
+	 * not marked as a signal frame and so the unwinder still tries to
+	 * subtract 1 to examine the presumed call insn.  Thus we must
+	 * extend the unwind info to a nop before the start.
+	 */
+
+	.cfi_startproc simple
+	.cfi_signal_frame
+
+	/* Compare pa32_fallback_frame_state from libgcc. */
+
+	/* Record the size of the stack frame. */
+	.cfi_def_cfa	30, -sizeof_rt_sigframe
+
+	/* Record save offset of general registers. */
+	.cfi_offset	1, offsetof_sigcontext_gr + 1 * 4
+	.cfi_offset	2, offsetof_sigcontext_gr + 2 * 4
+	.cfi_offset	3, offsetof_sigcontext_gr + 3 * 4
+	.cfi_offset	4, offsetof_sigcontext_gr + 4 * 4
+	.cfi_offset	5, offsetof_sigcontext_gr + 5 * 4
+	.cfi_offset	6, offsetof_sigcontext_gr + 6 * 4
+	.cfi_offset	7, offsetof_sigcontext_gr + 7 * 4
+	.cfi_offset	8, offsetof_sigcontext_gr + 8 * 4
+	.cfi_offset	9, offsetof_sigcontext_gr + 9 * 4
+	.cfi_offset	10, offsetof_sigcontext_gr + 10 * 4
+	.cfi_offset	11, offsetof_sigcontext_gr + 11 * 4
+	.cfi_offset	12, offsetof_sigcontext_gr + 12 * 4
+	.cfi_offset	13, offsetof_sigcontext_gr + 13 * 4
+	.cfi_offset	14, offsetof_sigcontext_gr + 14 * 4
+	.cfi_offset	15, offsetof_sigcontext_gr + 15 * 4
+	.cfi_offset	16, offsetof_sigcontext_gr + 16 * 4
+	.cfi_offset	17, offsetof_sigcontext_gr + 17 * 4
+	.cfi_offset	18, offsetof_sigcontext_gr + 18 * 4
+	.cfi_offset	19, offsetof_sigcontext_gr + 19 * 4
+	.cfi_offset	20, offsetof_sigcontext_gr + 20 * 4
+	.cfi_offset	21, offsetof_sigcontext_gr + 21 * 4
+	.cfi_offset	22, offsetof_sigcontext_gr + 22 * 4
+	.cfi_offset	23, offsetof_sigcontext_gr + 23 * 4
+	.cfi_offset	24, offsetof_sigcontext_gr + 24 * 4
+	.cfi_offset	25, offsetof_sigcontext_gr + 25 * 4
+	.cfi_offset	26, offsetof_sigcontext_gr + 26 * 4
+	.cfi_offset	27, offsetof_sigcontext_gr + 27 * 4
+	.cfi_offset	28, offsetof_sigcontext_gr + 28 * 4
+	.cfi_offset	29, offsetof_sigcontext_gr + 29 * 4
+	.cfi_offset	30, offsetof_sigcontext_gr + 30 * 4
+	.cfi_offset	31, offsetof_sigcontext_gr + 31 * 4
+
+	/* Record save offset of fp registers, left and right halves. */
+	.cfi_offset	32, offsetof_sigcontext_fr + 4 * 8
+	.cfi_offset	33, offsetof_sigcontext_fr + 4 * 8 + 4
+	.cfi_offset	34, offsetof_sigcontext_fr + 5 * 8
+	.cfi_offset	35, offsetof_sigcontext_fr + 5 * 8 + 4
+	.cfi_offset	36, offsetof_sigcontext_fr + 6 * 8
+	.cfi_offset	37, offsetof_sigcontext_fr + 6 * 8 + 4
+	.cfi_offset	38, offsetof_sigcontext_fr + 7 * 8
+	.cfi_offset	39, offsetof_sigcontext_fr + 7 * 8 + 4
+	.cfi_offset	40, offsetof_sigcontext_fr + 8 * 8
+	.cfi_offset	41, offsetof_sigcontext_fr + 8 * 8 + 4
+	.cfi_offset	42, offsetof_sigcontext_fr + 9 * 8
+	.cfi_offset	43, offsetof_sigcontext_fr + 9 * 8 + 4
+	.cfi_offset	44, offsetof_sigcontext_fr + 10 * 8
+	.cfi_offset	45, offsetof_sigcontext_fr + 10 * 8 + 4
+	.cfi_offset	46, offsetof_sigcontext_fr + 11 * 8
+	.cfi_offset	47, offsetof_sigcontext_fr + 11 * 8 + 4
+	.cfi_offset	48, offsetof_sigcontext_fr + 12 * 8
+	.cfi_offset	49, offsetof_sigcontext_fr + 12 * 8 + 4
+	.cfi_offset	50, offsetof_sigcontext_fr + 13 * 8
+	.cfi_offset	51, offsetof_sigcontext_fr + 13 * 8 + 4
+	.cfi_offset	52, offsetof_sigcontext_fr + 14 * 8
+	.cfi_offset	53, offsetof_sigcontext_fr + 14 * 8 + 4
+	.cfi_offset	54, offsetof_sigcontext_fr + 15 * 8
+	.cfi_offset	55, offsetof_sigcontext_fr + 15 * 8 + 4
+	.cfi_offset	56, offsetof_sigcontext_fr + 16 * 8
+	.cfi_offset	57, offsetof_sigcontext_fr + 16 * 8 + 4
+	.cfi_offset	58, offsetof_sigcontext_fr + 17 * 8
+	.cfi_offset	59, offsetof_sigcontext_fr + 17 * 8 + 4
+	.cfi_offset	60, offsetof_sigcontext_fr + 18 * 8
+	.cfi_offset	61, offsetof_sigcontext_fr + 18 * 8 + 4
+	.cfi_offset	62, offsetof_sigcontext_fr + 19 * 8
+	.cfi_offset	63, offsetof_sigcontext_fr + 19 * 8 + 4
+	.cfi_offset	64, offsetof_sigcontext_fr + 20 * 8
+	.cfi_offset	65, offsetof_sigcontext_fr + 20 * 8 + 4
+	.cfi_offset	66, offsetof_sigcontext_fr + 21 * 8
+	.cfi_offset	67, offsetof_sigcontext_fr + 21 * 8 + 4
+	.cfi_offset	68, offsetof_sigcontext_fr + 22 * 8
+	.cfi_offset	69, offsetof_sigcontext_fr + 22 * 8 + 4
+	.cfi_offset	70, offsetof_sigcontext_fr + 23 * 8
+	.cfi_offset	71, offsetof_sigcontext_fr + 23 * 8 + 4
+	.cfi_offset	72, offsetof_sigcontext_fr + 24 * 8
+	.cfi_offset	73, offsetof_sigcontext_fr + 24 * 8 + 4
+	.cfi_offset	74, offsetof_sigcontext_fr + 25 * 8
+	.cfi_offset	75, offsetof_sigcontext_fr + 25 * 8 + 4
+	.cfi_offset	76, offsetof_sigcontext_fr + 26 * 8
+	.cfi_offset	77, offsetof_sigcontext_fr + 26 * 8 + 4
+	.cfi_offset	78, offsetof_sigcontext_fr + 27 * 8
+	.cfi_offset	79, offsetof_sigcontext_fr + 27 * 8 + 4
+	.cfi_offset	80, offsetof_sigcontext_fr + 28 * 8
+	.cfi_offset	81, offsetof_sigcontext_fr + 28 * 8 + 4
+	.cfi_offset	82, offsetof_sigcontext_fr + 29 * 8
+	.cfi_offset	83, offsetof_sigcontext_fr + 29 * 8 + 4
+	.cfi_offset	84, offsetof_sigcontext_fr + 30 * 8
+	.cfi_offset	85, offsetof_sigcontext_fr + 30 * 8 + 4
+	.cfi_offset	86, offsetof_sigcontext_fr + 31 * 8
+	.cfi_offset	87, offsetof_sigcontext_fr + 31 * 8 + 4
+
+	/* Record save offset of %sar */
+	.cfi_offset	88, offsetof_sigcontext_sar
+
+	/* Record save offset of return address, iaoq[0]. */
+	.cfi_return_column 89
+	.cfi_offset	89, offsetof_sigcontext_iaoq
+
+	nop
+
+__kernel_rt_sigreturn:
+
+	ldi	0, %r25
+	ldi	__NR_rt_sigreturn, %r20
+	be,l	0x100(%sr2, %r0), %sr0, %r31
+	nop
+
+	.cfi_endproc
+
+	.size	__kernel_rt_sigreturn, . - __kernel_rt_sigreturn
+	.type	__kernel_rt_sigreturn, @function
+	.globl	__kernel_rt_sigreturn
diff --git a/linux-user/hppa/vdso.ld b/linux-user/hppa/vdso.ld
new file mode 100644
index 0000000000..fed994c3eb
--- /dev/null
+++ b/linux-user/hppa/vdso.ld
@@ -0,0 +1,75 @@
+/*
+ * Linker script for linux hppa vdso.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+/*
+ * Note that the kernel does not implement a vdso for hppa.
+ * Mirror the symbol that other targets use for this, e.g. i386.
+ */
+
+VERSION {
+        QEMU {
+        global:
+                __kernel_rt_sigreturn;
+        local: *;
+        };
+}
+
+
+PHDRS {
+        phdr            PT_PHDR         FLAGS(4) PHDRS;
+        data            PT_LOAD         FLAGS(6) FILEHDR PHDRS;
+        text            PT_LOAD         FLAGS(5);
+        dynamic         PT_DYNAMIC      FLAGS(4);
+        note            PT_NOTE         FLAGS(4);
+        eh_frame_hdr    PT_GNU_EH_FRAME;
+}
+
+SECTIONS {
+        . = SIZEOF_HEADERS;
+
+        /* The following, including the FILEHDRS and PHDRS, are modified
+           when we relocate the binary.  We want them to be initially
+           writable for the relocation; we'll force them read-only after.  */
+        .note           : { *(.note*) }         :data :note
+        .dynamic        : { *(.dynamic) }       :data :dynamic
+        .dynsym         : { *(.dynsym) }        :data
+        .data           : {
+                /* There ought not be any real read-write data.
+                   But since we manipulated the segment layout,
+                   we have to put these sections somewhere.  */
+                *(.data*)
+                *(.sdata*)
+                *(.got.plt) *(.got)
+                *(.gnu.linkonce.d.*)
+                *(.bss*)
+                *(.dynbss*)
+                *(.gnu.linkonce.b.*)
+        }
+
+        .rodata         : { *(.rodata) }
+        .hash           : { *(.hash) }
+        .gnu.hash       : { *(.gnu.hash) }
+        .dynstr         : { *(.dynstr) }
+        .gnu.version    : { *(.gnu.version) }
+        .gnu.version_d  : { *(.gnu.version_d) }
+        .gnu.version_r  : { *(.gnu.version_r) }
+        .eh_frame_hdr   : { *(.eh_frame_hdr) }  :data :eh_frame_hdr
+        .eh_frame       : { *(.eh_frame) }      :data
+
+        . = ALIGN(4096);
+        .text           : { *(.text*) }         :text
+}
diff --git a/linux-user/hppa/vdso.so b/linux-user/hppa/vdso.so
new file mode 100755
index 0000000000000000000000000000000000000000..a314dc70f2ae8548bfb1e4137039f983fad094e6
GIT binary patch
literal 5192
zcmeHLS#MiK6rOQ1r7WRN6$wxP@lZs8)^rJ_&;oH{J1IDuleA3;+`6?Jn<h@Uz6nkV
zDNPr;0BzZq0xguKQ1-Ad<p=P@ZvY7i2^9%=DunNwJ5whp4@gKn-J=|zb<Umn=H%hb
zj(9R5L$X3xst^mHN+H7Z)Cp02Mu<=t+ErqnSd8e!@XzyOjBEZDl3ZyR>t|BMun=Uf
z({)XK>e{Y>LRQ8OLH}(A?}JXZ^(p5f9nW|_wqwtIW!AM>->&BwF7a(SH8lO#?>O>z
zu<?C)1`_*}<B%7Cmw+z>bECkC`O{}ndlBTH@P#0;CUiOU|4P@`0@Y&rSLnovdk!!3
z_drZY#FuwQoGj5to06=KX~>|#9zSsM?2*!;pM~RW%esZ^fa7{jG2icIy%Dz{2J(fG
z($djPaVUbn<)S0r(#>@tQ&FO#tor5jarlTM&r1CKFNF|Qy;s9xjHJ&YYb(}3CvMnJ
z)d@dY{KN#gJ=G~HD|=+^!YjX@*tvM}+FjS}zJAY=y-OdC?7LzAvIENxu6ShSqjitn
zcxct(n~to0{N^Wad2-EDYoEULncJSd{ki(*qc1cZZG18IQvBt_v9{ywuXMbcI??%B
z*X!MHtbcRE$&GLIyxn{1u6O$0z5Bg;-giFO^kMp=%~M-G&U}*nbn9pRpXa{Fe|hg$
z+rA$7X7F@D)eouYuxhwZHM%NRRB=xwMpV<NYQA5sE2%ri)ScT^@&VN{u38^dZ4;_}
zhw6Aps?<)YIwz&-+9g%@ZmHJqk!r(UsWu*zs%Jm1K%X7GanVue7908l3J?eo2oMMm
z2oMMm2oMMm2oMMm2oU(+5tuJR^>vqFh_8{oKZr>|Tg***_T&KUhxL5SA=J#E@)Z5B
zIhTUu6n|lGeg*0Inl@%^ZDTIdalR#h{P`L2^NhWS683y!_Zj<qV-FjfGdhT4rq1WA
z&OPe=N`H<<4&MVbas3rY(fc*=l_n<4+`St0%5%39>uHU)tZT&Z+|=6b#G9Q&D%uiv
znqw*9G$q>_qDiMMk?4$fIbG3)WZd!R=eb915h;!hdg;xOp6kn;)iPs+^k9CAh(JLW
zWZFxMNPl4@l1mqJzTb0w&uG>y=7$Qi3@0NZ*_^Z0O%G<BTn3re5)m(3^6WAHjjTly
z?*><J?k$FIFy_AWz4C5&PsAL3z@E^3vCQQ09yE@Sd`F>;dc<DiZ|)Y}^4rWR=<E^J
zLl5aby41JvTh3d7cb7kWKYL5}7x!ZN@!VU_TKISd)<e(f_Z{xVlIdp=L%nG@k;h)t
z{m8T0dX(f2`|bl1-y;k3i^hd<o|m)<%-ZnTx2Rcf05-2MBM&_t0^2PiQm$7rdDv4J
xDtT5tyU2W#VN$pT^_W}*=Gz{>OPl`(#KllG&(UfvNL#NO`pi5R_QXH){sy-o1nd9+

literal 0
HcmV?d00001

-- 
2.25.1


