Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48593AD795
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 05:52:31 +0200 (CEST)
Received: from localhost ([::1]:47894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luS22-0000Ka-Ch
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 23:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtd-0000E0-1F
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:49 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luRtS-00083V-BD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 23:43:48 -0400
Received: by mail-pl1-x634.google.com with SMTP id x10so5680348plg.3
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 20:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jUXae3SraHm4OVG+O8NmkBHPeUZIHDauOpN34upW9DU=;
 b=Hxp8zVdKo0LHgnRJjsiw2rdWR5HgloN8+Hfji0V5HsaPQx92mKxV2mrYvrJbED9MI/
 buqXCi6b7VOjaeSIe0ZCtGM/MvsLc6zCpOFtDcxEqzIQ46DsDdO82U8NldodHks1ht2C
 UD3Xfv/A6r5pWaONEoQRHY4RoXecueAwPRQXdvk4/d018gHAbv5W0yc20XcNi8l2hYGE
 CAZsF2cRajFQbo9amEPrz+o7rOZVRbYdN1auXErRoPM6jRaBailyAe0Pzv5hgLnXoAqm
 zyx+jfMmDjh7cf8um/7JKeNEc6GnrK3DuySZ3cCgHgOhK3g5v3wAbsASWRCsmcx10B+V
 uujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jUXae3SraHm4OVG+O8NmkBHPeUZIHDauOpN34upW9DU=;
 b=Wpk+ZdNFJz5PIVDvCu/Juj5gomjmaidy7NeYv1l5I5SmvAT9zOLOVlkv/ILQEBe/GX
 gr8pkD8fSCImxFC0hIBSGxgVnQwDXDJJ8ddp4WZtwj33Y6W+fc+hxqtqfZQuGzzjfJjo
 8++JWoyloDb2SfePLv55KaQODTWKl/hbrzvbJABILJ1HFAtd9C5PuRq1JM1e40pmLSwL
 TiBsnVXABhdcnVruM2wJJfqqA4QG9Y1AZPSH3Wq6caBpetvVHxKJaHYaV4UUnm4Dj/Ai
 JCFxVCC5Xnr9ivWLTV2lOAGoF/tjMe6sV2yGAVHMVdJ+raYOSh8u8I9J7bvEaBPJBXFc
 +RAA==
X-Gm-Message-State: AOAM533wY6QBgdJkREqH8rvMGDsiarIlj14eWW/CswnDrMf5sejzRivl
 26WW1ne0eFq/KEd8u3OqPpU3zf1Gt5CMPg==
X-Google-Smtp-Source: ABdhPJzxl16x2N4awANguc1rOSJE+HU6wXHFSyTdlF9Nswz7ajgicPeI4WRjC6enAPQgPn/NzTRrZg==
X-Received: by 2002:a17:902:d4d0:b029:113:fb3d:3644 with SMTP id
 o16-20020a170902d4d0b0290113fb3d3644mr7545662plg.58.1624074216979; 
 Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm10045154pgs.24.2021.06.18.20.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 20:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] linux-user/x86_64: Add vdso
Date: Fri, 18 Jun 2021 20:43:28 -0700
Message-Id: <20210619034329.532318-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619034329.532318-1-richard.henderson@linaro.org>
References: <20210619034329.532318-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
 linux-user/elfload.c            |   3 +
 linux-user/x86_64/Makefile.vdso |   3 +
 linux-user/x86_64/meson.build   |   6 ++
 linux-user/x86_64/vdso.S        | 122 ++++++++++++++++++++++++++++++++
 linux-user/x86_64/vdso.ld       |  74 +++++++++++++++++++
 linux-user/x86_64/vdso.so       | Bin 0 -> 5912 bytes
 6 files changed, 208 insertions(+)
 create mode 100644 linux-user/x86_64/Makefile.vdso
 create mode 100644 linux-user/x86_64/vdso.S
 create mode 100644 linux-user/x86_64/vdso.ld
 create mode 100755 linux-user/x86_64/vdso.so

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index a6ad454617..b70a5c48a2 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -154,6 +154,9 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_CLASS      ELFCLASS64
 #define ELF_ARCH       EM_X86_64
 
+#define HAVE_VDSO 1
+#include "vdso.c.inc"
+
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
     regs->rax = 0;
diff --git a/linux-user/x86_64/Makefile.vdso b/linux-user/x86_64/Makefile.vdso
new file mode 100644
index 0000000000..6111d6f21c
--- /dev/null
+++ b/linux-user/x86_64/Makefile.vdso
@@ -0,0 +1,3 @@
+vdso.so: vdso.S vdso.ld Makefile.vdso
+	$(CC) -nostdlib -shared -Wl,-T,vdso.ld -Wl,--build-id=none \
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
index 0000000000..7d0d653526
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
index 0000000000..baf261f045
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
index 0000000000000000000000000000000000000000..0cdb8f1706893abf221e42d3443d9f5d49fef080
GIT binary patch
literal 5912
zcmeHL&ud&&6h4#5G>PWNw2COv8bm7;9TF)LD3qy9;>5Ng1_DtiuhYzHCzzShnU^w=
zQbCLwDVjwW#YJgxFIg5hDiyK*1ybnF3T~t>3@+61eDlsXyt#d~g5c_%<jr^Qch5QR
z-gDm@=DY7qADih(rG%E2L(=YLLndznmmZ>rNM0somwpb*kfKPhUU?gKao$oB`^^tD
zV((?&WWo`m*nAMz9<n}p;t5MgB;TVv=DB6_aWP!9I@mbpIe$ASAuen4aq)nT!HDpM
z0oiU7_xa%chRtuukU6%~A@SQ^tr}XtTi>Q71#@Igx3FNf2SSj#;e&>c8vfA=^Zj7)
ze_G$d<&O2g;6yC${|40ODXhl!o%PzU{2t}U9R3OO&pP}g=I`<o=I`b?Wd7q$o@w)U
zc|1Otk2}w@^1J2NmO_`kqCNQMEkEWBdsQ#2*X6P8gL+|~vG=TlHf2CB?3>=bZP;tf
zr!VXZV!4fIV+<E^Z627+%=mJZ{>XKH@zz`N{pj}1?5CF(J{d2+e{|!gp^x{zd$D=>
z++&{|seZKo+kN}CPx+Ol4_e}RXG@Kmx4c?ge#1NC2f<3kzl*H<4RYpEJ6$TSlZ(da
z`0|@;vbs`TYd(+EIsKoIW3zLMOWq5)7j=F;v41+Cma@OAU;Z-mu=XF<i|-WH*rVe+
zYoDhv2E+cqQlsgEc$ZPzJ6gzjkXp!+LRPV<IHq_(aa{3=B8+)bZ!buynN5uj_VwdC
z2HT2zU(#IMD{$j_U39o9<+dCSbH3nktIB<-9G?~KCYDqnsX$VJqyk9=k_sdhNGgz2
z;9phX+K=islDR(e<a=%ZYqy>LNvD6KyFYQGu+a(zHotqOHKHn_uduNbWWN4+aC3O#
ztLy6ePnOo-;MCz!zqI~3r+)3`(?T8G&G&Zna5tan=;CgEm&EDWv??X);BNo^j{fiF
z2c!U@;8;4M|2PEA0ZrnrSAWK<-JKtLBTnz)H-DUtd{+559Sr?~Jg(k7X#TFgoHgF{
z&sm-^h!-_#nRRU=zpH~^GTzO9Lisp-jPnWbZXWTbUYk37eD;WH#Fyt5z3GBCvvBzM
zv{#r~h=@T`pK+qngruuaBT_V0v$nOU<QnUhpm<6#sE1f)tF&G%R#uiJrw#Rz+?ncH
zu3T)CLnf$)%vrzQSgBRJI$lX~e%U)+FIIf7TvAW=Bp3M2Kx^?|ZB!FL*F)#S_}mfo
zQEVF@U+$-EuRN`zDsS~o42|z2aV!##CgXXo1bvI#jOTkxoC?!+#u?vh{Bw#sdiKP4
zo_7)PT*Eld_>dLB`2g0=ah{J6c^*c8TMoN=3M$fy+@IeUM6Q$hT|BDsI7=hX?-k;t
z-HA1F=l{BnV@`~}*SVvm>747ZUv}d8Jw-f6M??4is1NSX^ThT+27K)S!FwDvJ~!l|
zb0-HpX^weY7|ybW^y2+lSDZib+0|ypuIve$=Q~W;aQAPw(sA*7?Hs##pZLE4>E9DK

literal 0
HcmV?d00001

-- 
2.25.1


