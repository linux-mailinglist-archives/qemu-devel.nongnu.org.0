Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539A3BE004
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:04:01 +0200 (CEST)
Received: from localhost ([::1]:55024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v2m-0006yr-8z
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upC-0001f3-Ti
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:58 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up3-0006fO-Ei
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:58 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so2539496pjl.5
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KG9vmdKuvHiWB/mJT47jTSloEC6SI1jRyoZWluyCLDc=;
 b=MWuKwEzhiQNjlZAI7HtJdtDz/cbiASGgs0apm/xrdDdVLq7a1UR61QA46Gus4mIGOU
 bnr57u7Nx9cn8G03j1Tc38hUrax2rm4ejJPc1srPzzYNahmZkFSFl5fV2OyxdWojc8wg
 GuAVnbzN3TiADPuyNW1gLUAy/jvP03bs0z+14UWYKb8fGIluSw565uj36bbckZ0SHI5v
 aQKC46RNoL+c5s9bG/4vkiw+SVCC+tadsgjUCsvWzLmBBNqJ74H4UZNPXW2k/sYjiCMz
 YXQDHT3Kkh994JD/QlygnvqATeAadyI5hlhvdMvO1B4XXg1pZNJpq1xSP7VV0ApQm51x
 v8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KG9vmdKuvHiWB/mJT47jTSloEC6SI1jRyoZWluyCLDc=;
 b=NF734QVVSLSTx8ml3Yi3dtuXjt6pE0cjJuTg28944H8TjRqANtCjkdWRkVXO+n2N7L
 Agu9qMr2JMYPYfkNSSovQofdjU0FMH+OeOhg36pFKVioibLjOLM8i+SqsjS9TX/BA2tZ
 w09DBYOtE4arVxP1Cryj6v3EaBMzTgQJh7mRlfRuGJ726HhSHG41z40hXp/+z1QxJEpC
 oqKIzOKAiUzW+ArOeMm/MM69O9mR+GSLDfQ4SvSTEyQlLrlWaLApyt7AAuJnCOOu3JLX
 /TkKLdXZVHP+Ct9OTuVGTcFbOEYCeN81ZV4rHgrhIMXpnZM0Nsd2+lScpIt+X4/362Yd
 tXlg==
X-Gm-Message-State: AOAM533d0jsac+H9Wa566L+pBbUnX9oGLhHIGSMlWZEp7p5DzoQIZz8l
 8Tg8OdeuymDlknd1a2ePV2rkn+NX9hX7TA==
X-Google-Smtp-Source: ABdhPJxYhI2Moua8/1Yxqa1C/QeQ/ri5wmhcvWkLY7SOOR3sFJm5AMET8+jPXS+ds55JH8zFXLiOKA==
X-Received: by 2002:a17:902:d102:b029:128:e250:ebca with SMTP id
 w2-20020a170902d102b0290128e250ebcamr18973068plw.14.1625615387858; 
 Tue, 06 Jul 2021 16:49:47 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/36] linux-user/i386: Add vdso and use it for sigreturn
Date: Tue,  6 Jul 2021 16:49:18 -0700
Message-Id: <20210706234932.356913-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c          |  16 +++-
 linux-user/i386/signal.c      |  39 ++++-----
 linux-user/i386/Makefile.vdso |   5 ++
 linux-user/i386/meson.build   |   7 ++
 linux-user/i386/vdso.S        | 149 ++++++++++++++++++++++++++++++++++
 linux-user/i386/vdso.ld       |  76 +++++++++++++++++
 linux-user/i386/vdso.so       | Bin 0 -> 5528 bytes
 7 files changed, 271 insertions(+), 21 deletions(-)
 create mode 100644 linux-user/i386/Makefile.vdso
 create mode 100644 linux-user/i386/vdso.S
 create mode 100644 linux-user/i386/vdso.ld
 create mode 100755 linux-user/i386/vdso.so

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index ec3a854b44..7a598f9f76 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -276,12 +276,24 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
     (*regs)[15] = env->regs[R_ESP];
     (*regs)[16] = env->segs[R_SS].selector & 0xffff;
 }
-#endif
+
+/*
+ * i386 is the only target which supplies AT_SYSINFO for the vdso.
+ * All others only supply AT_SYSINFO_EHDR.
+ */
+#define DLINFO_ARCH_ITEMS 1
+#define ARCH_DLINFO       NEW_AUX_ENT(AT_SYSINFO, vdso_info->entry);
+
+#include "vdso.c.inc"
+
+#define vdso_image_info()    &vdso_image_info
+
+#endif /* TARGET_X86_64 */
 
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
-#endif
+#endif /* TARGET_I386 */
 
 #ifdef TARGET_ARM
 
diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
index 9894e7c9ac..8e4677e800 100644
--- a/linux-user/i386/signal.c
+++ b/linux-user/i386/signal.c
@@ -313,7 +313,7 @@ get_sigframe(struct target_sigaction *ka, CPUX86State *env, size_t frame_size)
 void setup_frame(int sig, struct target_sigaction *ka,
                  target_sigset_t *set, CPUX86State *env)
 {
-    abi_ulong frame_addr;
+    abi_ulong frame_addr, retcode_addr;
     struct sigframe *frame;
     int i;
 
@@ -335,19 +335,19 @@ void setup_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        __put_user(ka->sa_restorer, &frame->pretcode);
+        retcode_addr = ka->sa_restorer;
     } else {
-        uint16_t val16;
-        abi_ulong retcode_addr;
-        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
-        __put_user(retcode_addr, &frame->pretcode);
-        /* This is popl %eax ; movl $,%eax ; int $0x80 */
-        val16 = 0xb858;
-        __put_user(val16, (uint16_t *)(frame->retcode+0));
+        /*
+         * This is popl %eax ; movl $,%eax ; int $0x80.
+         * This is no longer used, but is retained for ABI compatibility.
+         */
+        __put_user(0xb858, (uint16_t *)(frame->retcode+0));
         __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+6));
+        __put_user(0x80cd, (uint16_t *)(frame->retcode+6));
+
+        retcode_addr = default_sigreturn;
     }
+    __put_user(retcode_addr, &frame->pretcode);
 
     /* Set up registers for signal handler */
     env->regs[R_ESP] = frame_addr;
@@ -373,7 +373,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
                     target_siginfo_t *info,
                     target_sigset_t *set, CPUX86State *env)
 {
-    abi_ulong frame_addr;
+    abi_ulong frame_addr, retcode_addr;
 #ifndef TARGET_X86_64
     abi_ulong addr;
 #endif
@@ -412,22 +412,23 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     /* Set up to return from userspace.  If provided, use a stub
        already in userspace.  */
     if (ka->sa_flags & TARGET_SA_RESTORER) {
-        __put_user(ka->sa_restorer, &frame->pretcode);
+        retcode_addr = ka->sa_restorer;
     } else {
 #ifdef TARGET_X86_64
         /* For x86_64, SA_RESTORER is required ABI.  */
         goto give_sigsegv;
 #else
-        uint16_t val16;
-        addr = frame_addr + offsetof(struct rt_sigframe, retcode);
-        __put_user(addr, &frame->pretcode);
-        /* This is movl $,%eax ; int $0x80 */
+        /*
+         * This is movl $,%eax ; int $0x80
+         * This is no longer used, but is retained for ABI compatibility.
+         */
         __put_user(0xb8, (char *)(frame->retcode+0));
         __put_user(TARGET_NR_rt_sigreturn, (int *)(frame->retcode+1));
-        val16 = 0x80cd;
-        __put_user(val16, (uint16_t *)(frame->retcode+5));
+        __put_user(0x80cd, (uint16_t *)(frame->retcode+5));
+        retcode_addr = default_rt_sigreturn;
 #endif
     }
+    __put_user(retcode_addr, &frame->pretcode);
 
     /* Set up registers for signal handler */
     env->regs[R_ESP] = frame_addr;
diff --git a/linux-user/i386/Makefile.vdso b/linux-user/i386/Makefile.vdso
new file mode 100644
index 0000000000..42cfc1974b
--- /dev/null
+++ b/linux-user/i386/Makefile.vdso
@@ -0,0 +1,5 @@
+CROSS_CC ?= $(CC)
+
+vdso.so: vdso.S vdso.ld Makefile.vdso
+	$(CROSS_CC) -m32 -nostdlib -shared -Wl,-T,vdso.ld -Wl,--build-id=sha1 \
+	  -Wl,-h,linux-gate.so.1 -Wl,--hash-style=both vdso.S -o $@
diff --git a/linux-user/i386/meson.build b/linux-user/i386/meson.build
index ee523019a5..b729d73686 100644
--- a/linux-user/i386/meson.build
+++ b/linux-user/i386/meson.build
@@ -3,3 +3,10 @@ syscall_nr_generators += {
                     arguments: [ meson.current_source_dir() / 'syscallhdr.sh', '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@' ],
                     output: '@BASENAME@_nr.h')
 }
+
+gen = [
+  gen_vdso.process('vdso.so', extra_args: ['-s', '__kernel_sigreturn',
+                                           '-r', '__kernel_rt_sigreturn'])
+]
+
+linux_user_ss.add(when: 'TARGET_I386', if_true: gen)
diff --git a/linux-user/i386/vdso.S b/linux-user/i386/vdso.S
new file mode 100644
index 0000000000..6938c577ec
--- /dev/null
+++ b/linux-user/i386/vdso.S
@@ -0,0 +1,149 @@
+/*
+ * i386 linux replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <asm/unistd.h>
+
+	.balign	16
+__kernel_vsyscall:
+	.cfi_startproc
+	int	$0x80
+	ret
+	.cfi_endproc
+
+	.globl	__kernel_vsyscall
+	.type	__kernel_vsyscall, @function
+	.size	__kernel_vsyscall, . - __kernel_vsyscall
+
+	.balign	16
+	.cfi_startproc
+__vdso_clock_gettime:
+	mov	$__NR_clock_gettime, %eax
+	int	$0x80
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_clock_gettime
+	.type	__vdso_clock_gettime, @function
+	.size	__vdso_clock_gettime, . - __vdso_clock_gettime
+
+	.balign	16
+	.cfi_startproc
+__vdso_clock_gettime64:
+	mov	$__NR_clock_gettime64, %eax
+	int	$0x80
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_clock_gettime64
+	.type	__vdso_clock_gettime64, @function
+	.size	__vdso_clock_gettime64, . - __vdso_clock_gettime64
+
+	.balign	16
+	.cfi_startproc
+__vdso_clock_getres:
+	mov	$__NR_clock_getres, %eax
+	int	$0x80
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_clock_getres
+	.type	__vdso_clock_getres, @function
+	.size	__vdso_clock_getres, . - __vdso_clock_getres
+
+	.balign	16
+	.cfi_startproc
+__vdso_gettimeofday:
+	mov	$__NR_gettimeofday, %eax
+	int	$0x80
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_gettimeofday
+	.type	__vdso_gettimeofday, @function
+	.size	__vdso_gettimeofday, . - __vdso_gettimeofday
+
+	.balign	16
+	.cfi_startproc
+__vdso_time:
+	mov	$__NR_time, %eax
+	int	$0x80
+	ret
+	.cfi_endproc
+
+	.globl	__vdso_time
+	.type	__vdso_time, @function
+	.size	__vdso_time, . - __vdso_time
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
+	.balign 16
+	.cfi_startproc simple
+	.cfi_signal_frame
+
+	/*
+	 * For convenience, put the cfa just above eip in sigcontext,
+	 * and count offsets backward from there.  Re-compute the cfa
+	 * in the several contexts we have for signal unwinding.
+         * This is far simpler than the DW_CFA_expression form that
+         * the kernel uses, and is equally correct.
+	 */
+#define IA32_SIGCONTEXT_cfa           60
+#define IA32_RT_SIGFRAME_sigcontext  164
+
+	.cfi_def_cfa	%esp, IA32_SIGCONTEXT_cfa + 4
+	.cfi_offset	%eip, -4
+			/* err, -8 */
+			/* trapno, -12 */
+	.cfi_offset	%eax, -16
+	.cfi_offset	%ecx, -20
+	.cfi_offset	%edx, -24
+	.cfi_offset	%ebx, -28
+	.cfi_offset	%esp, -32
+	.cfi_offset	%ebp, -36
+	.cfi_offset	%esi, -40
+	.cfi_offset	%edi, -44
+
+	nop
+__kernel_sigreturn:
+	popl	%eax	/* pop sig */
+	.cfi_adjust_cfa_offset -4
+	movl	$__NR_sigreturn, %eax
+	int	$0x80
+
+	.globl	__kernel_sigreturn
+	.type	__kernel_sigreturn, @function
+	.size	__kernel_sigreturn, . - __kernel_sigreturn
+
+	.cfi_adjust_cfa_offset IA32_RT_SIGFRAME_sigcontext - 4
+	nop
+__kernel_rt_sigreturn:
+	movl	$__NR_rt_sigreturn, %eax
+	int	$0x80
+
+	.globl	__kernel_rt_sigreturn
+	.type	__kernel_rt_sigreturn, @function
+	.size	__kernel_rt_sigreturn, . - __kernel_rt_sigreturn
+	.cfi_endproc
+
+/*
+ * ??? Perhaps add elf notes.  E.g.
+ *
+ * #include <linux/elfnote.h>
+ * ELFNOTE_START(Linux, 0, "a")
+ *   .long LINUX_VERSION_CODE
+ * ELFNOTE_END
+ *
+ * but what version number would we set for QEMU?
+ */
diff --git a/linux-user/i386/vdso.ld b/linux-user/i386/vdso.ld
new file mode 100644
index 0000000000..18937710c9
--- /dev/null
+++ b/linux-user/i386/vdso.ld
@@ -0,0 +1,76 @@
+/*
+ * Linker script for linux x86-64 replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+ENTRY(__kernel_vsyscall)
+
+VERSION {
+        LINUX_2.6 {
+        global:
+                __vdso_clock_gettime;
+                __vdso_gettimeofday;
+                __vdso_time;
+                __vdso_clock_getres;
+                __vdso_clock_gettime64;
+        };
+
+        LINUX_2.5 {
+        global:
+                __kernel_vsyscall;
+                __kernel_sigreturn;
+                __kernel_rt_sigreturn;
+        local: *;
+        };
+}
+
+PHDRS {
+        phdr            PT_PHDR         FLAGS(4) PHDRS;
+        data            PT_LOAD         FLAGS(6) FILEHDR PHDRS;
+        text            PT_LOAD         FLAGS(5);
+        dynamic         PT_DYNAMIC      FLAGS(4);
+        eh_frame_hdr    PT_GNU_EH_FRAME;
+        note            PT_NOTE         FLAGS(4);
+}
+
+SECTIONS {
+        /* ??? We can't really prelink to any address without knowing
+           something about the virtual memory space of the host, since
+           that leaks over into the available memory space of the guest.  */
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
+        .rodata         : { *(.rodata*) }
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
+        .text           : { *(.text*) }         :text   =0x90909090
+}
diff --git a/linux-user/i386/vdso.so b/linux-user/i386/vdso.so
new file mode 100755
index 0000000000000000000000000000000000000000..7a78ee23182f904f091b3fca9fbb354282372773
GIT binary patch
literal 5528
zcmeHLPi$007@yZy=(f<MATgSvwh5tx;7cW?hDhQ9TPR7}lp>)fB#*WG*j?E_y6?5N
z#^{0-H&LW0haU9gflC!kh}nzDCPohi3<r)}<-iG((i6J=e)DE_->x+=@n+uFeEa>K
zZ{~e7lk_(qjEo&M3`1x#g(;-fBg7D#v8VjVkmwT|#cr`hL?Qhc<K(L1c1Uug8Vu0(
z4L)<6KwVv*I{9q~GSZ~o2JsA%G?!qLb^XcTyky;gGmaQp$0=6>yc0S(7~c-t1Rt9?
zCB9ob@Kf9A7ovM_qz1m~e=yMY@P|85#J*HxMzNsBf7S|RNUrf7B)?@DYwUuof;WNr
zIZtY}!U_ui0m=H0Ag@vRkEDCXQrj@wNyr!`j41n6$iaZU8+Kp7c3~$1b_(`n!2TY#
zrmf=l+9eooBHjVX`FIR^0{JUC8It*27keQ07_t+ri9O<;GKYJ>9`buwo9ibrMj!K7
zqvPdBe=M@2r1Mzg*5cfC@k{T`sVjr&!*?s)4{nz}@BZxhi{(8(?|OJ;{_3+|AIX0L
zUD)<{r<ixL_ME%m&Lpx~c;=FB!Jf$$X3pCw$MZ5dXI<y;(BIre$JIVHvT!b$SkOLI
zO3mnIQbos`E#?tcuA*l*yxB~CcK*dw!gDOQV7(;9j!&GLw)a`Xb!|Vs)I=ZnN68yW
zo&E9uu0Hy83(xNkFwZE-@0}smX1_IcOz#n6yw#6YjQM)Mjb8JW7;Nr^*et{uh#ttd
zAp0N}AqOFsA!Cp$kdu&A$g_}7AUPk&cy~$|??sH>&F$@FOp4>;uMr1>`%9v45WEbZ
z-h2Au;A<_uY50~}d|CKDZSj@hD+hc#VUw_)lX^k1vQcWku;Jpy4?7kkA9Y^p`goIE
z_g>_k!Pu=Fa5#GKSoA*I6;jxNumfQS!VZKT2s;pVAnZWcf&XO(?v#GKd}|j!?XrXf
zl}`No+i)&bzG$(#TI>l74d!<@+e_1xccf>j@{N@ES&vqgQ@uV&>`xc54~bZtL^MPq
zCMTH^QR4sqx-DN3Bu4k+J|fi^-1L!-AV&A&3WX4uf=q>6<8_<J6GV^#GJ$fr6uwQ6
z46ILPsC**d=lqcTB{m+QhVh(|So#2D3^r$`Jr1df`KMt7v3Cx35ZhmX-4_^7Y!<}k
zY;+LoS78USzOdu3PaGOQegqg5?;rNasC{(m(D;Zw8lS4e(BTGvZAH;dC|Cp7{f+!4
zz}t$v18BMljjsc|{~1|JFfYTxau;%5;tfcz=*zU$@&(TkR&pVq$Yo}vf?Q#x^0QVt
z;ii3$SM)t|PSMR2@=b=F6qb{=&lM9n$4)1asV!l7&b)`d{#)urA~80PDbG4t<5Z~X
z6bsQ0ohO!OCHVg3pJG3c=VlKWuvOOM-5}qD%{-{G9*&3@2J=R6UfvmU47xi0GLJ`h
zA9xLKRm|gEB9E<;cToA5$9FJt6}l$QO^SnSsvhqi`Dys{yc|zH0p?p7b>2zxYtVHM
z^tCz*A8RvDFPd{`(s_9}bRO?8`L0fa)OqtNPxh6K0`m=06I~=-%eRE^5GcXf4F}%{
lS&zAV@6z7}RjlGc;WiaTtV7~ELolzpO^Ekp#Q)KGe*q5id-MPR

literal 0
HcmV?d00001

-- 
2.25.1


