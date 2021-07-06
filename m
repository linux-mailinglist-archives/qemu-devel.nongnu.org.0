Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A994A3BE00E
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 02:08:32 +0200 (CEST)
Received: from localhost ([::1]:41834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0v79-0008WA-MP
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 20:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0upB-0001cS-Tr
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:57 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:43824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0up3-0006fT-KB
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 19:49:57 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 x21-20020a17090aa395b029016e25313bfcso484432pjp.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 16:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yZhf1bHNA1vjB+M6QgN/FYYI6NUWFt0z8JMbCm/NEP0=;
 b=jaGl7tzYKuZQOs0oLhxjhSmwJIzGTOMQYC5e3/J0TUyFzcr75TCqDoEgd5ipGmfhQc
 v/ATGza0T6fvJis3waXptGUxSeKVk2aC6d0eJf6c2zkFfW0Po33yvhMqXqpI0/KTQeFS
 k8mktr3I549j2tV2TFJIMWs+06JWiajz6PLoD/yHUhTCJWSnOPfZiFH2dkgIJyS9GdYz
 BZ50bZeDLmvp4/YgVWqL4EmgcjpsrEywA+A6tfZGJ7BlowLmpULLFTW9VOuOz3+fV24M
 7fCcdH4grfMDuQGlltsJ2SeXj26o/UMz4tZbvjo8oyqGri4PXsltpDvmituFoEuRYp8S
 iEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZhf1bHNA1vjB+M6QgN/FYYI6NUWFt0z8JMbCm/NEP0=;
 b=AAOMuOXiWHr2VxQA+idVnVNIBHbFD2a5eaPACVT9NOCKK1zZRNcGBOfdeULOXKH7h/
 9uG1qTyGoq+ZO+elR9Vumv/WzhaxUjt2jCLZnDpD/fhtI1YzufKJs2h9FYT8Zq9J9x1F
 XqcStUelhTlROwTTgDRLXYw/YnrQtO1FRVzbRmoqoQ9K6xjtci+PVrEcDf1mPRNxVf5U
 ccmidAYHqkrLlZkypCxgOj2TFEUifDHYCAlLTO3jUfnb2QK4mlEhrhU78tTtv0LQsb/6
 +XF/DrlJSOCELCgOoxY32PMudyZ1Bajm8F4Y5kiw0bbpia40H54yjVlTAaGo8EMPT5P1
 H/tQ==
X-Gm-Message-State: AOAM532cTc5BP6c+vpcB/CZL4UXLvhPhALfZyT5mEoxQwZe0Z0R093C6
 LuaRLg42PSBCupHfKp1injW9FxScFzDorQ==
X-Google-Smtp-Source: ABdhPJxWYt9xXHum+ARsuHZs8+t4/FQKLl9TpnV2zXDnDCoFn3as6zKSbbDBnY+V+7EN8nJIP0XJng==
X-Received: by 2002:a17:90a:454b:: with SMTP id
 r11mr21972252pjm.60.1625615388410; 
 Tue, 06 Jul 2021 16:49:48 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b3sm18058114pfi.179.2021.07.06.16.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 16:49:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/36] linux-user/x86_64: Add vdso
Date: Tue,  6 Jul 2021 16:49:19 -0700
Message-Id: <20210706234932.356913-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706234932.356913-1-richard.henderson@linaro.org>
References: <20210706234932.356913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
 linux-user/elfload.c            |   4 +-
 linux-user/x86_64/Makefile.vdso |   5 ++
 linux-user/x86_64/meson.build   |   6 ++
 linux-user/x86_64/vdso.S        | 122 ++++++++++++++++++++++++++++++++
 linux-user/x86_64/vdso.ld       |  74 +++++++++++++++++++
 linux-user/x86_64/vdso.so       | Bin 0 -> 6008 bytes
 6 files changed, 209 insertions(+), 2 deletions(-)
 create mode 100644 linux-user/x86_64/Makefile.vdso
 create mode 100644 linux-user/x86_64/vdso.S
 create mode 100644 linux-user/x86_64/vdso.ld
 create mode 100755 linux-user/x86_64/vdso.so

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 7a598f9f76..43c985f318 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -284,12 +284,12 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 #define DLINFO_ARCH_ITEMS 1
 #define ARCH_DLINFO       NEW_AUX_ENT(AT_SYSINFO, vdso_info->entry);
 
+#endif /* TARGET_X86_64 */
+
 #include "vdso.c.inc"
 
 #define vdso_image_info()    &vdso_image_info
 
-#endif /* TARGET_X86_64 */
-
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
diff --git a/linux-user/x86_64/Makefile.vdso b/linux-user/x86_64/Makefile.vdso
new file mode 100644
index 0000000000..532c9d6964
--- /dev/null
+++ b/linux-user/x86_64/Makefile.vdso
@@ -0,0 +1,5 @@
+CROSS_CC ?= $(CC)
+
+vdso.so: vdso.S vdso.ld Makefile.vdso
+	$(CROSS_CC) -nostdlib -shared -Wl,-T,vdso.ld -Wl,--build-id=sha1 \
+	  -Wl,-h,linux-vdso.so.1 -Wl,--hash-style=both vdso.S -o $@
diff --git a/linux-user/x86_64/meson.build b/linux-user/x86_64/meson.build
index 203af9a60c..f6a0015953 100644
--- a/linux-user/x86_64/meson.build
+++ b/linux-user/x86_64/meson.build
@@ -3,3 +3,9 @@ syscall_nr_generators += {
                       arguments: [ meson.current_source_dir() / 'syscallhdr.sh', '@INPUT@', '@OUTPUT@', '@EXTRA_ARGS@' ],
                       output: '@BASENAME@_nr.h')
 }
+
+gen = [
+  gen_vdso.process('vdso.so')
+]
+
+linux_user_ss.add(when: 'TARGET_X86_64', if_true: gen)
diff --git a/linux-user/x86_64/vdso.S b/linux-user/x86_64/vdso.S
new file mode 100644
index 0000000000..bbd75a79aa
--- /dev/null
+++ b/linux-user/x86_64/vdso.S
@@ -0,0 +1,122 @@
+/*
+ * x86-64 linux replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <asm/unistd.h>
+
+	.globl	__vdso_clock_gettime
+	.type	__vdso_clock_gettime, @function
+	.balign	16
+	.cfi_startproc
+__vdso_clock_gettime:
+	mov	$__NR_clock_gettime, %eax
+	syscall
+	ret
+	.cfi_endproc
+	.size	__vdso_clock_gettime, . - __vdso_clock_gettime
+
+clock_gettime = __vdso_clock_gettime
+	.weak	clock_gettime
+
+	.globl	__vdso_clock_getres
+	.type	__vdso_clock_getres, @function
+	.balign	16
+	.cfi_startproc
+__vdso_clock_getres:
+	mov	$__NR_clock_getres, %eax
+	syscall
+	ret
+	.cfi_endproc
+	.size	__vdso_clock_getres, . - __vdso_clock_getres
+
+clock_getres = __vdso_clock_getres
+	.weak	clock_getres
+
+	.globl	__vdso_gettimeofday
+	.type	__vdso_gettimeofday, @function
+	.balign	16
+	.cfi_startproc
+__vdso_gettimeofday:
+	mov	$__NR_gettimeofday, %eax
+	syscall
+	ret
+	.cfi_endproc
+	.size	__vdso_gettimeofday, . - __vdso_gettimeofday
+
+gettimeofday = __vdso_gettimeofday
+	.weak	gettimeofday
+
+
+	.globl	__vdso_time
+	.type	__vdso_time, @function
+	.balign	16
+	.cfi_startproc
+__vdso_time:
+	mov	$__NR_time, %eax
+	syscall
+	ret
+	.cfi_endproc
+	.size	__vdso_time, . - __vdso_time
+
+time = __vdso_time
+	.weak	time
+
+
+	.globl	__vdso_getcpu
+	.type	__vdso_getcpu, @function
+	.balign	16
+	.cfi_startproc
+__vdso_getcpu:
+	/*
+         * ??? There is no syscall number for this allocated on x64.
+	 * We can handle this several ways:
+         *
+	 * (1) Invent a syscall number for use within qemu.
+         *     It should be easy enough to pick a number that
+         *     is well out of the way of the kernel numbers.
+         *
+         * (2) Force the emulated cpu to support the rdtscp insn,
+	 *     and initialize the TSC_AUX value the appropriate value.
+         *
+	 * (3) Pretend that we're always running on cpu 0.
+         *
+	 * This last is the one that's implemented here, with the
+	 * tiny bit of extra code to support rdtscp in place.
+         */
+	xor	%ecx, %ecx		/* rdtscp w/ tsc_aux = 0 */
+
+	/* if (cpu != NULL) *cpu = (ecx & 0xfff); */
+	test	%rdi, %rdi
+	jz	1f
+	mov	%ecx, %eax
+	and	$0xfff, %eax
+	mov	%eax, (%rdi)
+
+	/* if (node != NULL) *node = (ecx >> 12); */
+1:	test	%rsi, %rsi
+	jz	2f
+	shr	$12, %ecx
+	mov	%ecx, (%rsi)
+
+2:	xor	%eax, %eax
+	ret
+	.cfi_endproc
+	.size	__vdso_getcpu, . - __vdso_getcpu
+
+getcpu = __vdso_getcpu
+	.weak	getcpu
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
diff --git a/linux-user/x86_64/vdso.ld b/linux-user/x86_64/vdso.ld
new file mode 100644
index 0000000000..6630193079
--- /dev/null
+++ b/linux-user/x86_64/vdso.ld
@@ -0,0 +1,74 @@
+/*
+ * Linker script for linux x86-64 replacement vdso.
+ *
+ * Copyright 2021 Linaro, Ltd.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+VERSION {
+        LINUX_2.6 {
+        global:
+                clock_gettime;
+                __vdso_clock_gettime;
+                gettimeofday;
+                __vdso_gettimeofday;
+                getcpu;
+                __vdso_getcpu;
+                time;
+                __vdso_time;
+                clock_getres;
+                __vdso_clock_getres;
+
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
diff --git a/linux-user/x86_64/vdso.so b/linux-user/x86_64/vdso.so
new file mode 100755
index 0000000000000000000000000000000000000000..0397ef0f4f3c1e7006146a1113d49ba93b7f5042
GIT binary patch
literal 6008
zcmeHL&1+m$6hD*6bW%;4w2CP4BTB81(jh6O1S%zMlQ_{f#6U1z)R$>ynhDL!#F>{e
zBc*~EB_e)+D;LFL*V5(etQ1Pyzn}<i#QFh6bYXCzj^{V;{Khx8PhALZoHM!k-TS-e
z+>dkbd%SaAn>;?%6^jWaE{CPr8VHzi>!?3K4UusflWqFHUv?;pbZZ&6ZWm{5Xkw4)
zfrjm0$=yWILlj#N?3!KHCQm$N0}{!1DUWs5Z9Ogqn^pzu=Q?Na_*vME*?L?&pnVV`
zbRj^L_ia2EcSA{q2we#9K`n7D&&|xsOK11)tzA92?}KkI-@3ef_h>r#@}PF9=L1<V
zr2TCes{H(WqXZnX4qLvgS)0DE!!auN1t4X^`wbs9{IwB`7dT(!H*1@@{Alg3xDd1Z
zuL0-wl<4a1e()TJmEWcOki$P_`U4LCkm<YpsOh`o95($CXPimXcX?b3tjAqvUiqE!
zQ$wLmp4S%i$8CJ98}gzS?APUS4SKcUoN@N_gH~m`7MvT;9A}O7B(*?b%VR_xeJB`f
z^T1eQDkqnykFhSyfBA~s8octwz(*J7-W$ok`NGCGeeXX0`iIqv=O6jxSn=)Q>wETG
zIh`vkywwoTJD07LyrtFB(phgg=ld&#+&yGDS0QIAr8C(~ja=A9`<K?%Wp$;vUfqYG
zQ~Eb5$ERoJ7rgzcgSx)1$e(to#O!zJvmg5K+&!v=&lL99rTts$pT^M#!TCU9gYiRn
z=Hc5L>d0Be+lpDm?-Z+wzbL+=*rN{qSP{Z;Vz16gtU3@I>`nII-GF1o+-qvXvjR7w
zW!2#(l*>CD)|_>?Rpl0y<6Y5aM>-zpc%b8fjt4p(=y;&xfsP0M=N_nktq$l<T<d@0
zjix8+cbxX3)4ti>9=(~~X!zSVZ#>=T*XSUb-q`XJpMT%GxnuO|HC6pPiR-sD<KnPh
zT)(;*pSSaIVZ7STcMId*c0SRHf7|(OtvI-yPfAq$8pjtoKJ*=lYb3>dK)5Tek=0tH
z{-5z4^$}ylBKE7F?JD<<kN6@gzQs3wRNVNC@=<Xw;uVbJ#<zz|-;F1yjd%4^HqH=&
z6&1!VHLYWOH|{-ZygU9W<)h+Z<Riel<A^tLa^}d1>0=rbYM#WKOnXyvM@~$7>4~{e
z@MqCxR1j%_qZ^NgLeIz;wHbR#s!}WXnbV4XIlw$?#gd<sRJK;k6jqj+71fp0a&bMC
z&s6dO<Cg>GT&`SMDHYoqURF}MymzLYDdfC-RyEm@l%K2m>XCmhNFpKLXa0uIA#t}e
zMYq#_QrpM}AU^=%^Gei9-4y1TcrWal$guVz@4)%_ToZ>v_NdaH`6$Hoc*JPW=bt#C
zeGsmX_T0yQ?c36v744ZPBjWjhxb^`n@~rjIo_RGQ^Jvt!?XW3WUn4X>-#bL^lk;;P
zBJw`S!Li+XKiPX{%w~fBp~L+fEsI*gnrP4W7!kRRu+VShidqTV^L<A=Pens_{;JvY
zel!yx(6tMK_d!^AZ^(t`CI?(J#Rc0~pK{2Ra(?<1c`N!>t1YST3aS@cOi*#pZ>Q2x
M_6IFb{!jLQ0P{>E*#H0l

literal 0
HcmV?d00001

-- 
2.25.1


