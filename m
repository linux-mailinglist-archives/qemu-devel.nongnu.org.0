Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B412506474
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:29:47 +0200 (CEST)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nghMw-0000mD-CG
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglt-00019L-1j
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:34 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglm-0004Od-JH
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id u3so20941253wrg.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ix/sBUkghawyvXNAtg4+299GFgUXewXIHtXQ1Ljug6g=;
 b=oyPETp0oN1Z1ZZs6+50mh4nqou3Nilo7qp85DlJ8VGiCAcpSnnby5MMGaWuLEvrLO4
 X5BP79HQlhavDvTd7jT7EmND1RnWN79LkY4043VSrnqFlhfqs7raeCK/+D6Ku3xMCX9k
 80KVhWU/+tRGVTSruonbIxZyu7mjWhLX6GPhYSChhdBv6w+mW8h3Ekf8BiFPHF20U4vw
 84TmXUhhnt7tqJYpiWb6oBNky+5+X4tEN6KFy6d/sANxse1kAguRqAGN5LWbjD45AvF8
 BUUxNZMrc/Xh5uHe+HRIo2TmP/+Sm2vQx+fEuPK4zLCZOi4WJOObx0VMXMb+cxwYbjDZ
 lGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ix/sBUkghawyvXNAtg4+299GFgUXewXIHtXQ1Ljug6g=;
 b=vsXYzpmxue7+Z5Ce/pOHCMdU05nAwSzzyuxg23KSEPmDKIHYfCBm+jwBt091FKHGiB
 r2rTRykoA/xk3AocVHVWMZSpnhkf3TO2UbQFuUiZ4lgN2O9g1k3wm6GFSTltv2dpx1Em
 X9CthdNeECLNusbYBAAVymtxz7lso5F1ZEWtHooWB73nm38heXyTt/0HItGGaTMz0Uxn
 EZma3WGH0TEB+rs1wbqNKvePAdxAhBz42599hKhrvgjUEVt0AdVbDJq1kOnnRqq2v3PL
 2KrFGvqQ0hp0zveYKRxAHI3L3ZNb4EP2xENH6zvG0cYFXyABLRZ9PEr9wXFYB3o6VsiP
 3rag==
X-Gm-Message-State: AOAM5327HDccAC6r1NwckUwrT3NsFrG6K8tUCEZgaiM3SMCVGK+haFNG
 XSdyR02L0syk34r6EqRR4A3w0voU2EiIiQ==
X-Google-Smtp-Source: ABdhPJw3y0qPvUzpPdNdeaEa8RKLLRxeFkzx3CuMdetNw+LcdpcListafot6A9nRD6rJFq7s0jTL8A==
X-Received: by 2002:adf:dc0b:0:b0:20a:a549:d3a6 with SMTP id
 t11-20020adfdc0b000000b0020aa549d3a6mr1898683wri.34.1650347480821; 
 Mon, 18 Apr 2022 22:51:20 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/53] Replace TARGET_WORDS_BIGENDIAN
Date: Tue, 19 Apr 2022 07:50:28 +0200
Message-Id: <20220419055109.142788-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Convert the TARGET_WORDS_BIGENDIAN macro, similarly to what was done
with HOST_BIG_ENDIAN. The new TARGET_BIG_ENDIAN macro is either 0 or 1,
and thus should always be defined to prevent misuse.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Suggested-by: Halil Pasic <pasic@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-8-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c                        |  2 +-
 bsd-user/qemu.h                            |  2 +-
 configs/targets/aarch64_be-linux-user.mak  |  2 +-
 configs/targets/armeb-linux-user.mak       |  2 +-
 configs/targets/hppa-linux-user.mak        |  2 +-
 configs/targets/hppa-softmmu.mak           |  2 +-
 configs/targets/m68k-linux-user.mak        |  2 +-
 configs/targets/m68k-softmmu.mak           |  2 +-
 configs/targets/microblaze-linux-user.mak  |  2 +-
 configs/targets/microblaze-softmmu.mak     |  2 +-
 configs/targets/mips-linux-user.mak        |  2 +-
 configs/targets/mips-softmmu.mak           |  2 +-
 configs/targets/mips64-linux-user.mak      |  2 +-
 configs/targets/mips64-softmmu.mak         |  2 +-
 configs/targets/mipsn32-linux-user.mak     |  2 +-
 configs/targets/or1k-linux-user.mak        |  2 +-
 configs/targets/or1k-softmmu.mak           |  2 +-
 configs/targets/ppc-linux-user.mak         |  2 +-
 configs/targets/ppc-softmmu.mak            |  2 +-
 configs/targets/ppc64-linux-user.mak       |  2 +-
 configs/targets/ppc64-softmmu.mak          |  2 +-
 configs/targets/s390x-linux-user.mak       |  2 +-
 configs/targets/s390x-softmmu.mak          |  2 +-
 configs/targets/sh4eb-linux-user.mak       |  2 +-
 configs/targets/sh4eb-softmmu.mak          |  2 +-
 configs/targets/sparc-linux-user.mak       |  2 +-
 configs/targets/sparc-softmmu.mak          |  2 +-
 configs/targets/sparc32plus-linux-user.mak |  2 +-
 configs/targets/sparc64-linux-user.mak     |  2 +-
 configs/targets/sparc64-softmmu.mak        |  2 +-
 configs/targets/xtensaeb-linux-user.mak    |  2 +-
 configs/targets/xtensaeb-softmmu.mak       |  2 +-
 cpu.c                                      |  2 +-
 disas.c                                    |  2 +-
 docs/devel/loads-stores.rst                |  2 +-
 hw/arm/armv7m.c                            |  2 +-
 hw/display/vga.c                           |  2 +-
 hw/microblaze/boot.c                       |  2 +-
 hw/mips/gt64xxx_pci.c                      |  6 +++---
 hw/mips/jazz.c                             |  2 +-
 hw/mips/malta.c                            | 24 +++++++++++-----------
 hw/mips/mipssim.c                          |  2 +-
 hw/nios2/boot.c                            |  2 +-
 hw/xtensa/sim.c                            |  2 +-
 hw/xtensa/xtfpga.c                         |  4 ++--
 include/exec/cpu-all.h                     |  7 +++----
 include/exec/cpu_ldst.h                    |  2 +-
 include/exec/gdbstub.h                     |  2 +-
 include/exec/memop.h                       |  2 +-
 include/exec/memory.h                      |  2 +-
 include/exec/poison.h                      |  2 +-
 include/hw/core/cpu.h                      |  2 +-
 include/hw/mips/bios.h                     |  2 +-
 include/hw/virtio/virtio-access.h          |  2 +-
 linux-user/aarch64/cpu_loop.c              |  2 +-
 linux-user/aarch64/signal.c                |  4 ++--
 linux-user/aarch64/target_syscall.h        |  2 +-
 linux-user/arm/cpu_loop.c                  |  2 +-
 linux-user/arm/target_syscall.h            |  2 +-
 linux-user/elfload.c                       |  6 +++---
 linux-user/ppc/signal.c                    |  4 ++--
 linux-user/ppc/target_syscall.h            |  2 +-
 linux-user/qemu.h                          |  2 +-
 linux-user/syscall.c                       |  6 +++---
 linux-user/uname.c                         |  2 +-
 linux-user/user-internals.h                |  2 +-
 linux-user/xtensa/signal.c                 |  2 +-
 linux-user/xtensa/target_structs.h         |  2 +-
 meson.build                                |  5 +++++
 softmmu/memory.c                           |  2 +-
 softmmu/qtest.c                            |  2 +-
 target/arm/cpu.c                           |  2 +-
 target/arm/cpu.h                           |  8 ++++----
 target/mips/cpu.c                          |  4 ++--
 target/mips/tcg/msa_helper.c               | 10 ++++-----
 target/ppc/cpu_init.c                      |  2 +-
 target/ppc/gdbstub.c                       |  4 ++--
 target/ppc/mem_helper.c                    |  2 +-
 target/ppc/translate.c                     |  2 +-
 target/xtensa/cpu.h                        |  2 +-
 target/xtensa/overlay_tool.h               |  2 +-
 target/xtensa/translate.c                  |  6 +++---
 tests/tcg/xtensa/Makefile.softmmu-target   |  2 +-
 83 files changed, 120 insertions(+), 116 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 1c129dc90c..8d9d2367ee 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1202,7 +1202,7 @@ void kvm_hwpoison_page_add(ram_addr_t ram_addr)
 
 static uint32_t adjust_ioeventfd_endianness(uint32_t val, uint32_t size)
 {
-#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN)
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
     /* The kernel expects ioeventfd values in HOST_BIG_ENDIAN
      * endianness, but the memory core hands them in target endianness.
      * For example, PPC is always treated as big-endian even if running
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 21c06f2e70..be6105385e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -465,7 +465,7 @@ static inline void *lock_user_string(abi_ulong guest_addr)
 static inline uint64_t target_arg64(uint32_t word0, uint32_t word1)
 {
 #if TARGET_ABI_BITS == 32
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     return ((uint64_t)word0 << 32) | word1;
 #else
     return ((uint64_t)word1 << 32) | word0;
diff --git a/configs/targets/aarch64_be-linux-user.mak b/configs/targets/aarch64_be-linux-user.mak
index d3ee10c00f..7794424745 100644
--- a/configs/targets/aarch64_be-linux-user.mak
+++ b/configs/targets/aarch64_be-linux-user.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=aarch64
 TARGET_BASE_ARCH=arm
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/aarch64-core.xml gdb-xml/aarch64-fpu.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/armeb-linux-user.mak b/configs/targets/armeb-linux-user.mak
index f81e5bf1fe..a249cc2e29 100644
--- a/configs/targets/armeb-linux-user.mak
+++ b/configs/targets/armeb-linux-user.mak
@@ -1,7 +1,7 @@
 TARGET_ARCH=arm
 TARGET_SYSTBL_ABI=common,oabi
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
 TARGET_HAS_BFLT=y
 CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
diff --git a/configs/targets/hppa-linux-user.mak b/configs/targets/hppa-linux-user.mak
index f01e0a7b9e..db873a8796 100644
--- a/configs/targets/hppa-linux-user.mak
+++ b/configs/targets/hppa-linux-user.mak
@@ -2,4 +2,4 @@ TARGET_ARCH=hppa
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/hppa-softmmu.mak b/configs/targets/hppa-softmmu.mak
index e3e71eb21b..44f07b0332 100644
--- a/configs/targets/hppa-softmmu.mak
+++ b/configs/targets/hppa-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=hppa
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/configs/targets/m68k-linux-user.mak b/configs/targets/m68k-linux-user.mak
index 805d16c6ab..579b5d299c 100644
--- a/configs/targets/m68k-linux-user.mak
+++ b/configs/targets/m68k-linux-user.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=m68k
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/cf-core.xml gdb-xml/cf-fp.xml gdb-xml/m68k-core.xml gdb-xml/m68k-fp.xml
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/m68k-softmmu.mak b/configs/targets/m68k-softmmu.mak
index 5df1a2b7d7..bbcd0bada6 100644
--- a/configs/targets/m68k-softmmu.mak
+++ b/configs/targets/m68k-softmmu.mak
@@ -1,3 +1,3 @@
 TARGET_ARCH=m68k
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/cf-core.xml gdb-xml/cf-fp.xml gdb-xml/m68k-core.xml gdb-xml/m68k-fp.xml
diff --git a/configs/targets/microblaze-linux-user.mak b/configs/targets/microblaze-linux-user.mak
index 2a25bf2fa3..4249a37f65 100644
--- a/configs/targets/microblaze-linux-user.mak
+++ b/configs/targets/microblaze-linux-user.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=microblaze
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/microblaze-softmmu.mak b/configs/targets/microblaze-softmmu.mak
index 33f2a00402..8385e2d333 100644
--- a/configs/targets/microblaze-softmmu.mak
+++ b/configs/targets/microblaze-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=microblaze
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_NEED_FDT=y
diff --git a/configs/targets/mips-linux-user.mak b/configs/targets/mips-linux-user.mak
index 19f5779831..71fa77d464 100644
--- a/configs/targets/mips-linux-user.mak
+++ b/configs/targets/mips-linux-user.mak
@@ -3,4 +3,4 @@ TARGET_ABI_MIPSO32=y
 TARGET_SYSTBL_ABI=o32
 TARGET_SYSTBL=syscall_o32.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mips-softmmu.mak b/configs/targets/mips-softmmu.mak
index 8a49999a47..7787a4d94c 100644
--- a/configs/targets/mips-softmmu.mak
+++ b/configs/targets/mips-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=mips
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/configs/targets/mips64-linux-user.mak b/configs/targets/mips64-linux-user.mak
index 32fd1acdf2..5a4771f22d 100644
--- a/configs/targets/mips64-linux-user.mak
+++ b/configs/targets/mips64-linux-user.mak
@@ -4,4 +4,4 @@ TARGET_BASE_ARCH=mips
 TARGET_SYSTBL_ABI=n64
 TARGET_SYSTBL=syscall_n64.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mips64-softmmu.mak b/configs/targets/mips64-softmmu.mak
index ece25b9624..568d66650c 100644
--- a/configs/targets/mips64-softmmu.mak
+++ b/configs/targets/mips64-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=mips64
 TARGET_BASE_ARCH=mips
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/mipsn32-linux-user.mak b/configs/targets/mipsn32-linux-user.mak
index b8c2441ad0..1e80b302fc 100644
--- a/configs/targets/mipsn32-linux-user.mak
+++ b/configs/targets/mipsn32-linux-user.mak
@@ -5,4 +5,4 @@ TARGET_BASE_ARCH=mips
 TARGET_SYSTBL_ABI=n32
 TARGET_SYSTBL=syscall_n32.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/or1k-linux-user.mak b/configs/targets/or1k-linux-user.mak
index 1dfb93e46d..39558f77ec 100644
--- a/configs/targets/or1k-linux-user.mak
+++ b/configs/targets/or1k-linux-user.mak
@@ -1,2 +1,2 @@
 TARGET_ARCH=openrisc
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/or1k-softmmu.mak b/configs/targets/or1k-softmmu.mak
index 9e1d4a1fb1..263e970870 100644
--- a/configs/targets/or1k-softmmu.mak
+++ b/configs/targets/or1k-softmmu.mak
@@ -1,3 +1,3 @@
 TARGET_ARCH=openrisc
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_NEED_FDT=y
diff --git a/configs/targets/ppc-linux-user.mak b/configs/targets/ppc-linux-user.mak
index ca4187e4aa..cc0439a528 100644
--- a/configs/targets/ppc-linux-user.mak
+++ b/configs/targets/ppc-linux-user.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=ppc
 TARGET_SYSTBL_ABI=common,nospu,32
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/power-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml
diff --git a/configs/targets/ppc-softmmu.mak b/configs/targets/ppc-softmmu.mak
index f4eef1819a..774440108f 100644
--- a/configs/targets/ppc-softmmu.mak
+++ b/configs/targets/ppc-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=ppc
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/power-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/ppc64-linux-user.mak b/configs/targets/ppc64-linux-user.mak
index 3133346676..4d81969f4a 100644
--- a/configs/targets/ppc64-linux-user.mak
+++ b/configs/targets/ppc64-linux-user.mak
@@ -3,5 +3,5 @@ TARGET_BASE_ARCH=ppc
 TARGET_ABI_DIR=ppc
 TARGET_SYSTBL_ABI=common,nospu,64
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/power64-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml gdb-xml/power-vsx.xml
diff --git a/configs/targets/ppc64-softmmu.mak b/configs/targets/ppc64-softmmu.mak
index 84fbf46be9..ddf0c39617 100644
--- a/configs/targets/ppc64-softmmu.mak
+++ b/configs/targets/ppc64-softmmu.mak
@@ -1,6 +1,6 @@
 TARGET_ARCH=ppc64
 TARGET_BASE_ARCH=ppc
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/power64-core.xml gdb-xml/power-fpu.xml gdb-xml/power-altivec.xml gdb-xml/power-spe.xml gdb-xml/power-vsx.xml
 TARGET_NEED_FDT=y
diff --git a/configs/targets/s390x-linux-user.mak b/configs/targets/s390x-linux-user.mak
index 9e31ce6457..e2978248ed 100644
--- a/configs/targets/s390x-linux-user.mak
+++ b/configs/targets/s390x-linux-user.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=s390x
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
diff --git a/configs/targets/s390x-softmmu.mak b/configs/targets/s390x-softmmu.mak
index fd9fbd870d..258b4cf358 100644
--- a/configs/targets/s390x-softmmu.mak
+++ b/configs/targets/s390x-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=s390x
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
 TARGET_XML_FILES= gdb-xml/s390x-core64.xml gdb-xml/s390-acr.xml gdb-xml/s390-fpr.xml gdb-xml/s390-vx.xml gdb-xml/s390-cr.xml gdb-xml/s390-virt.xml gdb-xml/s390-gs.xml
diff --git a/configs/targets/sh4eb-linux-user.mak b/configs/targets/sh4eb-linux-user.mak
index 9b6fb4c1bb..6724165efe 100644
--- a/configs/targets/sh4eb-linux-user.mak
+++ b/configs/targets/sh4eb-linux-user.mak
@@ -2,5 +2,5 @@ TARGET_ARCH=sh4
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/sh4eb-softmmu.mak b/configs/targets/sh4eb-softmmu.mak
index 382e9a80f8..dc8b30bf7a 100644
--- a/configs/targets/sh4eb-softmmu.mak
+++ b/configs/targets/sh4eb-softmmu.mak
@@ -1,3 +1,3 @@
 TARGET_ARCH=sh4
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc-linux-user.mak b/configs/targets/sparc-linux-user.mak
index 53dc7aaed5..00e7bc1f07 100644
--- a/configs/targets/sparc-linux-user.mak
+++ b/configs/targets/sparc-linux-user.mak
@@ -2,4 +2,4 @@ TARGET_ARCH=sparc
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc-softmmu.mak b/configs/targets/sparc-softmmu.mak
index 9ba3d7b07f..a849190f01 100644
--- a/configs/targets/sparc-softmmu.mak
+++ b/configs/targets/sparc-softmmu.mak
@@ -1,3 +1,3 @@
 TARGET_ARCH=sparc
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc32plus-linux-user.mak b/configs/targets/sparc32plus-linux-user.mak
index e4c51df3dc..a65c0951a1 100644
--- a/configs/targets/sparc32plus-linux-user.mak
+++ b/configs/targets/sparc32plus-linux-user.mak
@@ -5,4 +5,4 @@ TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,32
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc64-linux-user.mak b/configs/targets/sparc64-linux-user.mak
index 9d23ab4a26..20fcb93fa4 100644
--- a/configs/targets/sparc64-linux-user.mak
+++ b/configs/targets/sparc64-linux-user.mak
@@ -4,4 +4,4 @@ TARGET_ABI_DIR=sparc
 TARGET_SYSTBL_ABI=common,64
 TARGET_SYSTBL=syscall.tbl
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/sparc64-softmmu.mak b/configs/targets/sparc64-softmmu.mak
index 8dd3217800..c626ac3eae 100644
--- a/configs/targets/sparc64-softmmu.mak
+++ b/configs/targets/sparc64-softmmu.mak
@@ -1,4 +1,4 @@
 TARGET_ARCH=sparc64
 TARGET_BASE_ARCH=sparc
 TARGET_ALIGNED_ONLY=y
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
diff --git a/configs/targets/xtensaeb-linux-user.mak b/configs/targets/xtensaeb-linux-user.mak
index 1ea0f1ba91..bce2d1d65d 100644
--- a/configs/targets/xtensaeb-linux-user.mak
+++ b/configs/targets/xtensaeb-linux-user.mak
@@ -1,5 +1,5 @@
 TARGET_ARCH=xtensa
 TARGET_SYSTBL_ABI=common
 TARGET_SYSTBL=syscall.tbl
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_HAS_BFLT=y
diff --git a/configs/targets/xtensaeb-softmmu.mak b/configs/targets/xtensaeb-softmmu.mak
index 405cf5acbb..b02e11b820 100644
--- a/configs/targets/xtensaeb-softmmu.mak
+++ b/configs/targets/xtensaeb-softmmu.mak
@@ -1,3 +1,3 @@
 TARGET_ARCH=xtensa
-TARGET_WORDS_BIGENDIAN=y
+TARGET_BIG_ENDIAN=y
 TARGET_SUPPORTS_MTTCG=y
diff --git a/cpu.c b/cpu.c
index be1f8b074c..d34c3439bb 100644
--- a/cpu.c
+++ b/cpu.c
@@ -469,7 +469,7 @@ int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
 
 bool target_words_bigendian(void)
 {
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
     return true;
 #else
     return false;
diff --git a/disas.c b/disas.c
index 2d2565ac57..8c16e55c7e 100644
--- a/disas.c
+++ b/disas.c
@@ -126,7 +126,7 @@ static void initialize_debug_target(CPUDebug *s, CPUState *cpu)
     s->cpu = cpu;
     s->info.read_memory_func = target_read_memory;
     s->info.print_address_func = print_address;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     s->info.endian = BFD_ENDIAN_BIG;
 #else
     s->info.endian = BFD_ENDIAN_LITTLE;
diff --git a/docs/devel/loads-stores.rst b/docs/devel/loads-stores.rst
index 8f0035c821..ad5dfe133e 100644
--- a/docs/devel/loads-stores.rst
+++ b/docs/devel/loads-stores.rst
@@ -275,7 +275,7 @@ called during the translator callback ``translate_insn``.
 
 There is a set of functions ending in ``_swap`` which, if the parameter
 is true, returns the value in the endianness that is the reverse of
-the guest native endianness, as determined by ``TARGET_WORDS_BIGENDIAN``.
+the guest native endianness, as determined by ``TARGET_BIG_ENDIAN``.
 
 Function names follow the pattern:
 
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 41cfca0f22..32349ec94b 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -577,7 +577,7 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     int asidx;
     CPUState *cs = CPU(cpu);
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     big_endian = 1;
 #else
     big_endian = 0;
diff --git a/hw/display/vga.c b/hw/display/vga.c
index 737cfbde98..5dca2d1528 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2242,7 +2242,7 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
      * into a device attribute set by the machine/platform to remove
      * all target endian dependencies from this file.
      */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     s->default_endian_fb = true;
 #else
     s->default_endian_fb = false;
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 8821d009f1..03c030aa2c 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -138,7 +138,7 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu, hwaddr ddr_base,
         uint32_t base32;
         int big_endian = 0;
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         big_endian = 1;
 #endif
 
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index e0ff1b5566..19d0d9889f 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -986,7 +986,7 @@ static void gt64120_reset(DeviceState *dev)
     /* FIXME: Malta specific hw assumptions ahead */
 
     /* CPU Configuration */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     s->regs[GT_CPU]           = 0x00000000;
 #else
     s->regs[GT_CPU]           = 0x00001000;
@@ -1097,7 +1097,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_TC_CONTROL]    = 0x00000000;
 
     /* PCI Internal */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     s->regs[GT_PCI0_CMD]      = 0x00000000;
 #else
     s->regs[GT_PCI0_CMD]      = 0x00010001;
@@ -1118,7 +1118,7 @@ static void gt64120_reset(DeviceState *dev)
     s->regs[GT_PCI0_SSCS10_BAR] = 0x00000000;
     s->regs[GT_PCI0_SSCS32_BAR] = 0x01000000;
     s->regs[GT_PCI0_SCS3BT_BAR] = 0x1f000000;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     s->regs[GT_PCI1_CMD]      = 0x00000000;
 #else
     s->regs[GT_PCI1_CMD]      = 0x00010001;
diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 44f0d48bfd..4d6b44de34 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -158,7 +158,7 @@ static void mips_jazz_init(MachineState *machine,
         [JAZZ_PICA61] = {33333333, 4},
     };
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     big_endian = 1;
 #else
     big_endian = 0;
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 6288511723..c4474b927c 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -367,7 +367,7 @@ static uint64_t malta_fpga_read(void *opaque, hwaddr addr,
 
     /* STATUS Register */
     case 0x00208:
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         val = 0x00000012;
 #else
         val = 0x00000010;
@@ -695,7 +695,7 @@ static void write_bootloader_nanomips(uint8_t *base, uint64_t run_addr,
     stw_p(p++, 0xe040); stw_p(p++, 0x0681);
                                 /* lui t1, %hi(0xb4000000)      */
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 
     stw_p(p++, 0xe020); stw_p(p++, 0x0be1);
                                 /* lui t0, %hi(0xdf000000)      */
@@ -894,7 +894,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
     /* Load BAR registers as done by YAMON */
     stl_p(p++, 0x3c09b400);                  /* lui t1, 0xb400 */
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c08df00);                  /* lui t0, 0xdf00 */
 #else
     stl_p(p++, 0x340800df);                  /* ori t0, r0, 0x00df */
@@ -903,39 +903,39 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
 
     stl_p(p++, 0x3c09bbe0);                  /* lui t1, 0xbbe0 */
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c08c000);                  /* lui t0, 0xc000 */
 #else
     stl_p(p++, 0x340800c0);                  /* ori t0, r0, 0x00c0 */
 #endif
     stl_p(p++, 0xad280048);                  /* sw t0, 0x0048(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c084000);                  /* lui t0, 0x4000 */
 #else
     stl_p(p++, 0x34080040);                  /* ori t0, r0, 0x0040 */
 #endif
     stl_p(p++, 0xad280050);                  /* sw t0, 0x0050(t1) */
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c088000);                  /* lui t0, 0x8000 */
 #else
     stl_p(p++, 0x34080080);                  /* ori t0, r0, 0x0080 */
 #endif
     stl_p(p++, 0xad280058);                  /* sw t0, 0x0058(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c083f00);                  /* lui t0, 0x3f00 */
 #else
     stl_p(p++, 0x3408003f);                  /* ori t0, r0, 0x003f */
 #endif
     stl_p(p++, 0xad280060);                  /* sw t0, 0x0060(t1) */
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c08c100);                  /* lui t0, 0xc100 */
 #else
     stl_p(p++, 0x340800c1);                  /* ori t0, r0, 0x00c1 */
 #endif
     stl_p(p++, 0xad280080);                  /* sw t0, 0x0080(t1) */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     stl_p(p++, 0x3c085e00);                  /* lui t0, 0x5e00 */
 #else
     stl_p(p++, 0x3408005e);                  /* ori t0, r0, 0x005e */
@@ -1030,7 +1030,7 @@ static uint64_t load_kernel(void)
     int prom_index = 0;
     uint64_t (*xlate_to_kseg0) (void *opaque, uint64_t addr);
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     big_endian = 1;
 #else
     big_endian = 0;
@@ -1272,7 +1272,7 @@ void mips_malta_init(MachineState *machine)
                                     ram_low_postio);
     }
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     be = 1;
 #else
     be = 0;
@@ -1353,7 +1353,7 @@ void mips_malta_init(MachineState *machine)
          * In little endian mode the 32bit words in the bios are swapped,
          * a neat trick which allows bi-endian firmware.
          */
-#ifndef TARGET_WORDS_BIGENDIAN
+#if !TARGET_BIG_ENDIAN
         {
             uint32_t *end, *addr;
             const size_t swapsize = MIN(bios_size, 0x3e0000);
diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
index 27a46bd538..30bc1c4f08 100644
--- a/hw/mips/mipssim.c
+++ b/hw/mips/mipssim.c
@@ -65,7 +65,7 @@ static uint64_t load_kernel(void)
     ram_addr_t initrd_offset;
     int big_endian;
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     big_endian = 1;
 #else
     big_endian = 0;
diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 5b3e4efed5..e889595d5c 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -140,7 +140,7 @@ void nios2_load_kernel(Nios2CPU *cpu, hwaddr ddr_base,
         uint64_t entry, high;
         int big_endian = 0;
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         big_endian = 1;
 #endif
 
diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 2028fe793d..946c71cb5b 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -96,7 +96,7 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
 void xtensa_sim_load_kernel(XtensaCPU *cpu, MachineState *machine)
 {
     const char *kernel_filename = machine->kernel_filename;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     int big_endian = true;
 #else
     int big_endian = false;
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index c1e004e882..2a5556a35f 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -219,7 +219,7 @@ static const MemoryRegionOps xtfpga_io_ops = {
 
 static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
 {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     int be = 1;
 #else
     int be = 0;
@@ -430,7 +430,7 @@ static void xtfpga_init(const XtfpgaBoardDesc *board, MachineState *machine)
         }
         if (entry_point != env->pc) {
             uint8_t boot[] = {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
                 0x60, 0x00, 0x08,       /* j    1f */
                 0x00,                   /* .literal_position */
                 0x00, 0x00, 0x00, 0x00, /* .literal entry_pc */
diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index f77070da5f..5d5290deb5 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -37,11 +37,10 @@
  * HOST_BIG_ENDIAN : whether the host cpu is big endian and
  * otherwise little endian.
  *
- * TARGET_WORDS_BIGENDIAN : if defined, the host cpu is big endian and otherwise
- * little endian.
+ * TARGET_BIG_ENDIAN : same for the target cpu
  */
 
-#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN)
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 #define BSWAP_NEEDED
 #endif
 
@@ -121,7 +120,7 @@ static inline void tswap64s(uint64_t *s)
 /* Target-endianness CPU memory access functions. These fit into the
  * {ld,st}{type}{sign}{size}{endian}_p naming scheme described in bswap.h.
  */
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
 #define lduw_p(p) lduw_be_p(p)
 #define ldsw_p(p) ldsw_be_p(p)
 #define ldl_p(p) ldl_be_p(p)
diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 6adacf8928..d0c7c0d5fe 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -377,7 +377,7 @@ static inline CPUTLBEntry *tlb_entry(CPUArchState *env, uintptr_t mmu_idx,
 
 #endif /* defined(CONFIG_USER_ONLY) */
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 # define cpu_lduw_data        cpu_lduw_be_data
 # define cpu_ldsw_data        cpu_ldsw_be_data
 # define cpu_ldl_data         cpu_ldl_be_data
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index 89edf94d28..c35d7334b4 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -110,7 +110,7 @@ static inline int gdb_get_reg128(GByteArray *buf, uint64_t val_hi,
                                  uint64_t val_lo)
 {
     uint64_t to_quad;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     to_quad = tswap64(val_hi);
     g_byte_array_append(buf, (uint8_t *) &to_quad, 8);
     to_quad = tswap64(val_lo);
diff --git a/include/exec/memop.h b/include/exec/memop.h
index 44f923ed46..25d027434a 100644
--- a/include/exec/memop.h
+++ b/include/exec/memop.h
@@ -36,7 +36,7 @@ typedef enum MemOp {
     MO_BE    = MO_BSWAP,
 #endif
 #ifdef NEED_CPU_H
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     MO_TE    = MO_BE,
 #else
     MO_TE    = MO_LE,
diff --git a/include/exec/memory.h b/include/exec/memory.h
index e40653f0d1..f1c19451bc 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2931,7 +2931,7 @@ static inline MemOp devend_memop(enum device_endian end)
     QEMU_BUILD_BUG_ON(DEVICE_HOST_ENDIAN != DEVICE_LITTLE_ENDIAN &&
                       DEVICE_HOST_ENDIAN != DEVICE_BIG_ENDIAN);
 
-#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN)
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
     /* Swap if non-host endianness or native (target) endianness */
     return (end == DEVICE_HOST_ENDIAN) ? 0 : MO_BSWAP;
 #else
diff --git a/include/exec/poison.h b/include/exec/poison.h
index 7c5c02f03f..9f1ca3409c 100644
--- a/include/exec/poison.h
+++ b/include/exec/poison.h
@@ -38,7 +38,7 @@
 #pragma GCC poison TARGET_HAS_BFLT
 #pragma GCC poison TARGET_NAME
 #pragma GCC poison TARGET_SUPPORTS_MTTCG
-#pragma GCC poison TARGET_WORDS_BIGENDIAN
+#pragma GCC poison TARGET_BIG_ENDIAN
 #pragma GCC poison BSWAP_NEEDED
 
 #pragma GCC poison TARGET_LONG_BITS
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b0e2e5b9d2..13adb251b2 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1028,7 +1028,7 @@ void cpu_exec_unrealizefn(CPUState *cpu);
  * target_words_bigendian:
  * Returns true if the (default) endianness of the target is big endian,
  * false otherwise. Note that in target-specific code, you can use
- * TARGET_WORDS_BIGENDIAN directly instead. On the other hand, common
+ * TARGET_BIG_ENDIAN directly instead. On the other hand, common
  * code should normally never need to know about the endianness of the
  * target, so please do *not* use this function unless you know very well
  * what you are doing!
diff --git a/include/hw/mips/bios.h b/include/hw/mips/bios.h
index c03007999a..44acb6815b 100644
--- a/include/hw/mips/bios.h
+++ b/include/hw/mips/bios.h
@@ -5,7 +5,7 @@
 #include "cpu.h"
 
 #define BIOS_SIZE (4 * MiB)
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 #define BIOS_FILENAME "mips_bios.bin"
 #else
 #define BIOS_FILENAME "mipsel_bios.bin"
diff --git a/include/hw/virtio/virtio-access.h b/include/hw/virtio/virtio-access.h
index 90cbb77782..07aae69042 100644
--- a/include/hw/virtio/virtio-access.h
+++ b/include/hw/virtio/virtio-access.h
@@ -28,7 +28,7 @@ static inline bool virtio_access_is_big_endian(VirtIODevice *vdev)
 {
 #if defined(LEGACY_VIRTIO_IS_BIENDIAN)
     return virtio_is_big_endian(vdev);
-#elif defined(TARGET_WORDS_BIGENDIAN)
+#elif TARGET_BIG_ENDIAN
     if (virtio_vdev_has_feature(vdev, VIRTIO_F_VERSION_1)) {
         /* Devices conforming to VIRTIO 1.0 or later are always LE. */
         return false;
diff --git a/linux-user/aarch64/cpu_loop.c b/linux-user/aarch64/cpu_loop.c
index 1737e2ea65..31a66a4fa0 100644
--- a/linux-user/aarch64/cpu_loop.c
+++ b/linux-user/aarch64/cpu_loop.c
@@ -202,7 +202,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     }
     env->pc = regs->pc;
     env->xregs[31] = regs->sp;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     env->cp15.sctlr_el[1] |= SCTLR_E0E;
     for (i = 1; i < 4; ++i) {
         env->cp15.sctlr_el[i] |= SCTLR_EE;
diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index df9e39a4ba..7de4c96eb9 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -147,7 +147,7 @@ static void target_setup_fpsimd_record(struct target_fpsimd_context *fpsimd,
 
     for (i = 0; i < 32; i++) {
         uint64_t *q = aa64_vfp_qreg(env, i);
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         __put_user(q[0], &fpsimd->vregs[i * 2 + 1]);
         __put_user(q[1], &fpsimd->vregs[i * 2]);
 #else
@@ -233,7 +233,7 @@ static void target_restore_fpsimd_record(CPUARMState *env,
 
     for (i = 0; i < 32; i++) {
         uint64_t *q = aa64_vfp_qreg(env, i);
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         __get_user(q[0], &fpsimd->vregs[i * 2 + 1]);
         __get_user(q[1], &fpsimd->vregs[i * 2]);
 #else
diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index a98f568ab4..c055133725 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -8,7 +8,7 @@ struct target_pt_regs {
     uint64_t        pstate;
 };
 
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
 #define UNAME_MACHINE "aarch64_be"
 #else
 #define UNAME_MACHINE "aarch64"
diff --git a/linux-user/arm/cpu_loop.c b/linux-user/arm/cpu_loop.c
index aae375d617..e4bca93749 100644
--- a/linux-user/arm/cpu_loop.c
+++ b/linux-user/arm/cpu_loop.c
@@ -519,7 +519,7 @@ void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
     for(i = 0; i < 16; i++) {
         env->regs[i] = regs->uregs[i];
     }
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     /* Enable BE8.  */
     if (EF_ARM_EABI_VERSION(info->elf_flags) >= EF_ARM_EABI_VER4
         && (info->elf_flags & EF_ARM_BE8)) {
diff --git a/linux-user/arm/target_syscall.h b/linux-user/arm/target_syscall.h
index f04f9c9e3d..412ad434cf 100644
--- a/linux-user/arm/target_syscall.h
+++ b/linux-user/arm/target_syscall.h
@@ -18,7 +18,7 @@ struct target_pt_regs {
 #define ARM_NR_set_tls	  (ARM_NR_BASE + 5)
 #define ARM_NR_get_tls    (ARM_NR_BASE + 6)
 
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
 #define UNAME_MACHINE "armv5teb"
 #else
 #define UNAME_MACHINE "armv5tel"
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index c45da4d633..c501c246dc 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -105,7 +105,7 @@ int info_is_fdpic(struct image_info *info)
 #define ELIBBAD 80
 #endif
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 #define ELF_DATA        ELFDATA2MSB
 #else
 #define ELF_DATA        ELFDATA2LSB
@@ -483,7 +483,7 @@ static const char *get_elf_platform(void)
 {
     CPUARMState *env = thread_cpu->env_ptr;
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 # define END  "b"
 #else
 # define END  "l"
@@ -514,7 +514,7 @@ static const char *get_elf_platform(void)
 
 #define ELF_ARCH        EM_AARCH64
 #define ELF_CLASS       ELFCLASS64
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 # define ELF_PLATFORM    "aarch64_be"
 #else
 # define ELF_PLATFORM    "aarch64"
diff --git a/linux-user/ppc/signal.c b/linux-user/ppc/signal.c
index ca29d64579..07729c1653 100644
--- a/linux-user/ppc/signal.c
+++ b/linux-user/ppc/signal.c
@@ -215,7 +215,7 @@ static target_ulong get_sigframe(struct target_sigaction *ka,
     return (oldsp - frame_size) & ~0xFUL;
 }
 
-#if defined(TARGET_WORDS_BIGENDIAN) == HOST_BIG_ENDIAN
+#if TARGET_BIG_ENDIAN == HOST_BIG_ENDIAN
 #define PPC_VEC_HI      0
 #define PPC_VEC_LO      1
 #else
@@ -542,7 +542,7 @@ void setup_rt_frame(int sig, struct target_sigaction *ka,
     env->nip = (target_ulong) ka->_sa_handler;
 #endif
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     /* Signal handlers are entered in big-endian mode.  */
     ppc_store_msr(env, env->msr & ~(1ull << MSR_LE));
 #else
diff --git a/linux-user/ppc/target_syscall.h b/linux-user/ppc/target_syscall.h
index 7df9118937..77b36d0b46 100644
--- a/linux-user/ppc/target_syscall.h
+++ b/linux-user/ppc/target_syscall.h
@@ -59,7 +59,7 @@ struct target_revectored_struct {
  */
 
 #if defined(TARGET_PPC64)
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 #define UNAME_MACHINE "ppc64"
 #else
 #define UNAME_MACHINE "ppc64le"
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 98dfbf2096..46550f5e21 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -236,7 +236,7 @@ static inline bool access_ok(CPUState *cpu, int type,
     } while (0)
 
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 # define __put_user(x, hptr)  __put_user_e(x, hptr, be)
 # define __get_user(x, hptr)  __get_user_e(x, hptr, be)
 #else
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 31ca8cc229..dd0d92ba4e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8132,7 +8132,7 @@ static int is_proc_myself(const char *filename, const char *entry)
     return 0;
 }
 
-#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN) || \
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN || \
     defined(TARGET_SPARC) || defined(TARGET_M68K) || defined(TARGET_HPPA)
 static int is_proc(const char *filename, const char *entry)
 {
@@ -8140,7 +8140,7 @@ static int is_proc(const char *filename, const char *entry)
 }
 #endif
 
-#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN)
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
 static int open_net_route(void *cpu_env, int fd)
 {
     FILE *fp;
@@ -8226,7 +8226,7 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
         { "stat", open_self_stat, is_proc_myself },
         { "auxv", open_self_auxv, is_proc_myself },
         { "cmdline", open_self_cmdline, is_proc_myself },
-#if HOST_BIG_ENDIAN != defined(TARGET_WORDS_BIGENDIAN)
+#if HOST_BIG_ENDIAN != TARGET_BIG_ENDIAN
         { "/proc/net/route", open_net_route, is_proc },
 #endif
 #if defined(TARGET_SPARC) || defined(TARGET_HPPA)
diff --git a/linux-user/uname.c b/linux-user/uname.c
index 1d82608c10..0856783b21 100644
--- a/linux-user/uname.c
+++ b/linux-user/uname.c
@@ -41,7 +41,7 @@ const char *cpu_to_uname_machine(void *cpu_env)
 
     /* in theory, endianness is configurable on some ARM CPUs, but this isn't
      * used in user mode emulation */
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 #define utsname_suffix "b"
 #else
 #define utsname_suffix "l"
diff --git a/linux-user/user-internals.h b/linux-user/user-internals.h
index ee152ccfaa..2a80bc83ae 100644
--- a/linux-user/user-internals.h
+++ b/linux-user/user-internals.h
@@ -115,7 +115,7 @@ static inline int is_error(abi_long ret)
 #if (TARGET_ABI_BITS == 32) && !defined(TARGET_ABI_MIPSN32)
 static inline uint64_t target_offset64(uint32_t word0, uint32_t word1)
 {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     return ((uint64_t)word0 << 32) | word1;
 #else
     return ((uint64_t)word1 << 32) | word0;
diff --git a/linux-user/xtensa/signal.c b/linux-user/xtensa/signal.c
index 06d91a37ec..f5fb8b5cbe 100644
--- a/linux-user/xtensa/signal.c
+++ b/linux-user/xtensa/signal.c
@@ -130,7 +130,7 @@ static int setup_sigcontext(struct target_rt_sigframe *frame,
 
 static void install_sigtramp(uint8_t *tramp)
 {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     /* Generate instruction:  MOVI a2, __NR_rt_sigreturn */
     __put_user(0x22, &tramp[0]);
     __put_user(0x0a, &tramp[1]);
diff --git a/linux-user/xtensa/target_structs.h b/linux-user/xtensa/target_structs.h
index 9cde6844b8..cb1b3411cf 100644
--- a/linux-user/xtensa/target_structs.h
+++ b/linux-user/xtensa/target_structs.h
@@ -15,7 +15,7 @@ struct target_ipc_perm {
 
 struct target_semid64_ds {
   struct target_ipc_perm sem_perm;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
   abi_ulong __unused1;
   abi_ulong sem_otime;
   abi_ulong __unused2;
diff --git a/meson.build b/meson.build
index 9abc30d5ce..08f8183a66 100644
--- a/meson.build
+++ b/meson.build
@@ -2186,6 +2186,9 @@ foreach target : target_dirs
   if 'TARGET_ABI_DIR' not in config_target
     config_target += {'TARGET_ABI_DIR': config_target['TARGET_ARCH']}
   endif
+  if 'TARGET_BIG_ENDIAN' not in config_target
+    config_target += {'TARGET_BIG_ENDIAN': 'n'}
+  endif
 
   foreach k, v: disassemblers
     if host_arch.startswith(k) or config_target['TARGET_BASE_ARCH'].startswith(k)
@@ -2210,6 +2213,8 @@ foreach target : target_dirs
       config_target_data.set_quoted(k, v)
     elif v == 'y'
       config_target_data.set(k, 1)
+    elif v == 'n'
+      config_target_data.set(k, 0)
     else
       config_target_data.set(k, v)
     endif
diff --git a/softmmu/memory.c b/softmmu/memory.c
index bfa5d5178c..7ba2048836 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -350,7 +350,7 @@ static void flatview_simplify(FlatView *view)
 
 static bool memory_region_big_endian(MemoryRegion *mr)
 {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     return mr->ops->endianness != DEVICE_LITTLE_ENDIAN;
 #else
     return mr->ops->endianness == DEVICE_BIG_ENDIAN;
diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 010d11513d..f8acef2628 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -714,7 +714,7 @@ static void qtest_process_command(CharBackend *chr, gchar **words)
         qtest_send(chr, "OK\n");
     } else if (strcmp(words[0], "endianness") == 0) {
         qtest_send_prefix(chr);
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
         qtest_sendf(chr, "OK big\n");
 #else
         qtest_sendf(chr, "OK little\n");
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 5d4ca7a227..0980d33901 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -812,7 +812,7 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
 
     sctlr_b = arm_sctlr_b(env);
     if (bswap_code(sctlr_b)) {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         info->endian = BFD_ENDIAN_LITTLE;
 #else
         info->endian = BFD_ENDIAN_BIG;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 816aa0394e..ccf635ac5c 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3549,12 +3549,12 @@ static inline int cpu_mmu_index(CPUARMState *env, bool ifetch)
 static inline bool bswap_code(bool sctlr_b)
 {
 #ifdef CONFIG_USER_ONLY
-    /* BE8 (SCTLR.B = 0, TARGET_WORDS_BIGENDIAN = 1) is mixed endian.
-     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_WORDS_BIGENDIAN=0
+    /* BE8 (SCTLR.B = 0, TARGET_BIG_ENDIAN = 1) is mixed endian.
+     * The invalid combination SCTLR.B=1/CPSR.E=1/TARGET_BIG_ENDIAN=0
      * would also end up as a mixed-endian mode with BE code, LE data.
      */
     return
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         1 ^
 #endif
         sctlr_b;
@@ -3570,7 +3570,7 @@ static inline bool bswap_code(bool sctlr_b)
 static inline bool arm_cpu_bswap_data(CPUARMState *env)
 {
     return
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
        1 ^
 #endif
        arm_cpu_data_is_big_endian(env);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index af287177d5..ad74fbe636 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -189,7 +189,7 @@ static void mips_cpu_reset(DeviceState *dev)
     /* Reset registers to their default values */
     env->CP0_PRid = env->cpu_model->CP0_PRid;
     env->CP0_Config0 = env->cpu_model->CP0_Config0;
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     env->CP0_Config0 |= (1 << CP0C0_BE);
 #endif
     env->CP0_Config1 = env->cpu_model->CP0_Config1;
@@ -418,7 +418,7 @@ static void mips_cpu_disas_set_info(CPUState *s, disassemble_info *info)
     CPUMIPSState *env = &cpu->env;
 
     if (!(env->insn_flags & ISA_NANOMIPS32)) {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
         info->print_insn = print_insn_big_mips;
 #else
         info->print_insn = print_insn_little_mips;
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 389c42e4ba..4dde5d639a 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -8218,7 +8218,7 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #define MEMOP_IDX(DF)
 #endif
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 static inline uint64_t bswap16x4(uint64_t x)
 {
     uint64_t m = 0x00ff00ff00ff00ffull;
@@ -8258,7 +8258,7 @@ void helper_msa_ld_h(CPUMIPSState *env, uint32_t wd,
      */
     d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
     d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     d0 = bswap16x4(d0);
     d1 = bswap16x4(d1);
 #endif
@@ -8279,7 +8279,7 @@ void helper_msa_ld_w(CPUMIPSState *env, uint32_t wd,
      */
     d0 = cpu_ldq_le_data_ra(env, addr + 0, ra);
     d1 = cpu_ldq_le_data_ra(env, addr + 8, ra);
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     d0 = bswap32x2(d0);
     d1 = bswap32x2(d1);
 #endif
@@ -8345,7 +8345,7 @@ void helper_msa_st_h(CPUMIPSState *env, uint32_t wd,
     /* Store 8 bytes at a time.  See helper_msa_ld_h. */
     d0 = pwd->d[0];
     d1 = pwd->d[1];
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     d0 = bswap16x4(d0);
     d1 = bswap16x4(d1);
 #endif
@@ -8366,7 +8366,7 @@ void helper_msa_st_w(CPUMIPSState *env, uint32_t wd,
     /* Store 8 bytes at a time.  See helper_msa_ld_w. */
     d0 = pwd->d[0];
     d1 = pwd->d[1];
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     d0 = bswap32x2(d0);
     d1 = bswap32x2(d1);
 #endif
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 073fd10168..5062d0e478 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7150,7 +7150,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 #if defined(TARGET_PPC64)
     msr |= (target_ulong)1 << MSR_TM; /* Transactional memory */
 #endif
-#if !defined(TARGET_WORDS_BIGENDIAN)
+#if !TARGET_BIG_ENDIAN
     msr |= (target_ulong)1 << MSR_LE; /* Little-endian user mode */
     if (!((env->msr_mask >> MSR_LE) & 1)) {
         fprintf(stderr, "Selected CPU does not support little-endian.\n");
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 105c2f7dd1..1252429a2a 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -87,9 +87,9 @@ static int ppc_gdb_register_len(int n)
 /*
  * We need to present the registers to gdb in the "current" memory
  * ordering.  For user-only mode we get this for free;
- * TARGET_WORDS_BIGENDIAN is set to the proper ordering for the
+ * TARGET_BIG_ENDIAN is set to the proper ordering for the
  * binary, and cannot be changed.  For system mode,
- * TARGET_WORDS_BIGENDIAN is always set, and we must check the current
+ * TARGET_BIG_ENDIAN is always set, and we must check the current
  * mode of the chip to see if we're running in little-endian.
  */
 void ppc_maybe_bswap_register(CPUPPCState *env, uint8_t *mem_buf, int len)
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index f1c76a7750..c4ff8fd632 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -32,7 +32,7 @@
 
 static inline bool needs_byteswap(const CPUPPCState *env)
 {
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
   return msr_le;
 #else
   return !msr_le;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 408ae26173..f14f8d7309 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -193,7 +193,7 @@ struct DisasContext {
 /* Return true iff byteswap is needed in a scalar memop */
 static inline bool need_byteswap(const DisasContext *ctx)
 {
-#if defined(TARGET_WORDS_BIGENDIAN)
+#if TARGET_BIG_ENDIAN
      return ctx->le_mode;
 #else
      return !ctx->le_mode;
diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
index a572e831ae..f10cfabdc3 100644
--- a/target/xtensa/cpu.h
+++ b/target/xtensa/cpu.h
@@ -590,7 +590,7 @@ void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
 #define XTENSA_CPU_TYPE_NAME(model) model XTENSA_CPU_TYPE_SUFFIX
 #define CPU_RESOLVING_TYPE TYPE_XTENSA_CPU
 
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
 #define XTENSA_DEFAULT_CPU_MODEL "fsf"
 #define XTENSA_DEFAULT_CPU_NOMMU_MODEL "fsf"
 #else
diff --git a/target/xtensa/overlay_tool.h b/target/xtensa/overlay_tool.h
index 78720734fe..701c00eed2 100644
--- a/target/xtensa/overlay_tool.h
+++ b/target/xtensa/overlay_tool.h
@@ -449,7 +449,7 @@
 
 #endif
 
-#if (defined(TARGET_WORDS_BIGENDIAN) != 0) == (XCHAL_HAVE_BE != 0)
+#if TARGET_BIG_ENDIAN == (XCHAL_HAVE_BE != 0)
 #define REGISTER_CORE(core) \
     static void __attribute__((constructor)) register_core(void) \
     { \
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index b1491ed625..fc4e9d2c9a 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -1471,14 +1471,14 @@ static void translate_b(DisasContext *dc, const OpcodeArg arg[],
 static void translate_bb(DisasContext *dc, const OpcodeArg arg[],
                          const uint32_t par[])
 {
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     TCGv_i32 bit = tcg_const_i32(0x80000000u);
 #else
     TCGv_i32 bit = tcg_const_i32(0x00000001u);
 #endif
     TCGv_i32 tmp = tcg_temp_new_i32();
     tcg_gen_andi_i32(tmp, arg[1].in, 0x1f);
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     tcg_gen_shr_i32(bit, bit, tmp);
 #else
     tcg_gen_shl_i32(bit, bit, tmp);
@@ -1493,7 +1493,7 @@ static void translate_bbi(DisasContext *dc, const OpcodeArg arg[],
                           const uint32_t par[])
 {
     TCGv_i32 tmp = tcg_temp_new_i32();
-#ifdef TARGET_WORDS_BIGENDIAN
+#if TARGET_BIG_ENDIAN
     tcg_gen_andi_i32(tmp, arg[0].in, 0x80000000u >> arg[1].imm);
 #else
     tcg_gen_andi_i32(tmp, arg[0].in, 0x00000001u << arg[1].imm);
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index 9530cac2ad..973e55298e 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -2,7 +2,7 @@
 # Xtensa softmmu tests
 #
 
-ifneq ($(TARGET_WORDS_BIGENDIAN),y)
+ifneq ($(TARGET_BIG_ENDIAN),y)
 
 XTENSA_SRC = $(SRC_PATH)/tests/tcg/xtensa
 XTENSA_ALL = $(filter-out $(XTENSA_SRC)/linker.ld.S,$(wildcard $(XTENSA_SRC)/*.S))
-- 
2.35.1



