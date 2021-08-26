Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA31C3F8FD3
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:17:56 +0200 (CEST)
Received: from localhost ([::1]:47798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMl1-0005kw-V7
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:17:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfn-0005bw-LH
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:31 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:43809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfl-0006l9-Kx
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:31 -0400
Received: by mail-il1-x130.google.com with SMTP id v16so4698611ilo.10
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHS6Rdb0mnIzaMMDe+TiCha8i0FkDadRF9jxmF4Q8IQ=;
 b=xRjlnhd0TZP0o1wseLiyYJvHMuxvKv1dY5kpftySmch2zrDf/4ppDi53miCHj7fY6e
 SarcuaS/22AXCpdSRB1N4X67mG18qTX9FP2YcDkjiF6UluxssVOj3UD3Y4dBLP2dAq/F
 FGS5D3XnG1ZFPSJiOas2QYJUIIrdnNmt6CiYhhzRy/MqqKlMgLuPjF+102VHUJAeCz0L
 Y8cRbK74CziD5+/NWPB3PdhH2AlIZiJs8WPDkH56/4zISIa6Axug5jg/khsF5nHe9Kjb
 BoaSZsxdvtyB5/Oi0hue0QrN6vvefseeym8CGWPz4SrLjq7/vVlopbKd/OOdl3LbCN17
 m5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHS6Rdb0mnIzaMMDe+TiCha8i0FkDadRF9jxmF4Q8IQ=;
 b=tHs6qmpo89PBWJg4E/BGcYfWokaJ2jbtRg5PunFCmcxg3mWZ8lMgjNg5WuDs2TsG/f
 TUGyTt+O99HiRmGOjEUnvcDgR/ZvMWNi+9pHAFXOg5KtlGTDZkLWvaPYOVZwuYyIc3kL
 opwnpR1UkV3vZdM84x4zP0siEb1fzdNIzx7VQISRT6PVyLyEFxErfH4C8+gU5IB5CvqN
 WCqgtqDzPWGSM1kDDo0FYCCU5vzUXtFvYOjZ7Giu9WXxDOTJiaHl54+Jnyjz51M7KxpT
 UWvO8ajGaiUdCvSyqIhvqp9t0RQPOYO3TUdl/VEZfTR9Qe/IuwZsu1o2yEclMaX0ti5r
 aicQ==
X-Gm-Message-State: AOAM530Kv3DKc6h7GPsUfnekCi4LcMZHAYwyB22/O3seavkw6RgqM9iJ
 Ltu2njiW61pxYEr+Ed46081mOnf5lkgFFus2
X-Google-Smtp-Source: ABdhPJyqi7MXruArXxZENCcs2pcrVb0a9fqgf1uyZurMTOkPDgHLp5P68gKbOvtrPI8iqojU1yZTog==
X-Received: by 2002:a92:ca85:: with SMTP id t5mr4219646ilo.109.1630012348220; 
 Thu, 26 Aug 2021 14:12:28 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:27 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/43] bsd-user: Remove all non-x86 code from elfload.c
Date: Thu, 26 Aug 2021 15:11:24 -0600
Message-Id: <20210826211201.98877-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

bsd-user only builds x86 at the moment. Remove all non x86 code from
elfload.c. We'll move the x86 code to {i386,x86_64}/target_arch_elf.h
and bring it that support code from the forked bsd-user when the time
comes.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/elfload.c | 347 +--------------------------------------------
 1 file changed, 2 insertions(+), 345 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index ae62f3aab3..fffa24f041 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -23,15 +23,6 @@
 #include "disas/disas.h"
 #include "qemu/path.h"
 
-#ifdef _ARCH_PPC64
-#undef ARCH_DLINFO
-#undef ELF_PLATFORM
-#undef ELF_HWCAP
-#undef ELF_CLASS
-#undef ELF_DATA
-#undef ELF_ARCH
-#endif
-
 /* from personality.h */
 
 /*
@@ -144,7 +135,7 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
     }
 }
 
-#else
+#else /* !TARGET_X86_64 */
 
 #define ELF_START_MMAP 0x80000000
 
@@ -174,343 +165,13 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
        A value of 0 tells we have no such handler.  */
     regs->edx = 0;
 }
-#endif
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE       4096
-
-#endif
-
-#ifdef TARGET_ARM
-
-#define ELF_START_MMAP 0x80000000
-
-#define elf_check_arch(x) ((x) == EM_ARM)
-
-#define ELF_CLASS       ELFCLASS32
-#ifdef TARGET_WORDS_BIGENDIAN
-#define ELF_DATA        ELFDATA2MSB
-#else
-#define ELF_DATA        ELFDATA2LSB
-#endif
-#define ELF_ARCH        EM_ARM
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    abi_long stack = infop->start_stack;
-    memset(regs, 0, sizeof(*regs));
-    regs->ARM_cpsr = 0x10;
-    if (infop->entry & 1)
-        regs->ARM_cpsr |= CPSR_T;
-    regs->ARM_pc = infop->entry & 0xfffffffe;
-    regs->ARM_sp = infop->start_stack;
-    /* FIXME - what to for failure of get_user()? */
-    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
-    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
-    /* XXX: it seems that r0 is zeroed after ! */
-    regs->ARM_r0 = 0;
-    /* For uClinux PIC binaries.  */
-    /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
-    regs->ARM_r10 = infop->start_data;
-}
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE       4096
-
-enum
-{
-  ARM_HWCAP_ARM_SWP       = 1 << 0,
-  ARM_HWCAP_ARM_HALF      = 1 << 1,
-  ARM_HWCAP_ARM_THUMB     = 1 << 2,
-  ARM_HWCAP_ARM_26BIT     = 1 << 3,
-  ARM_HWCAP_ARM_FAST_MULT = 1 << 4,
-  ARM_HWCAP_ARM_FPA       = 1 << 5,
-  ARM_HWCAP_ARM_VFP       = 1 << 6,
-  ARM_HWCAP_ARM_EDSP      = 1 << 7,
-};
-
-#define ELF_HWCAP (ARM_HWCAP_ARM_SWP | ARM_HWCAP_ARM_HALF              \
-                    | ARM_HWCAP_ARM_THUMB | ARM_HWCAP_ARM_FAST_MULT     \
-                    | ARM_HWCAP_ARM_FPA | ARM_HWCAP_ARM_VFP)
-
-#endif
-
-#ifdef TARGET_SPARC
-#ifdef TARGET_SPARC64
-
-#define ELF_START_MMAP 0x80000000
-
-#ifndef TARGET_ABI32
-#define elf_check_arch(x) ((x) == EM_SPARCV9 || (x) == EM_SPARC32PLUS)
-#else
-#define elf_check_arch(x) ((x) == EM_SPARC32PLUS || (x) == EM_SPARC)
-#endif
-
-#define ELF_CLASS   ELFCLASS64
-#define ELF_DATA    ELFDATA2MSB
-#define ELF_ARCH    EM_SPARCV9
-
-#define STACK_BIAS              2047
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-#ifndef TARGET_ABI32
-    regs->tstate = 0;
-#endif
-    regs->pc = infop->entry;
-    regs->npc = regs->pc + 4;
-    regs->y = 0;
-#ifdef TARGET_ABI32
-    regs->u_regs[14] = infop->start_stack - 16 * 4;
-#else
-    if (personality(infop->personality) == PER_LINUX32)
-        regs->u_regs[14] = infop->start_stack - 16 * 4;
-    else {
-        regs->u_regs[14] = infop->start_stack - 16 * 8 - STACK_BIAS;
-        if (bsd_type == target_freebsd) {
-            regs->u_regs[8] = infop->start_stack;
-            regs->u_regs[11] = infop->start_stack;
-        }
-    }
-#endif
-}
-
-#else
-#define ELF_START_MMAP 0x80000000
-
-#define elf_check_arch(x) ((x) == EM_SPARC)
-
-#define ELF_CLASS   ELFCLASS32
-#define ELF_DATA    ELFDATA2MSB
-#define ELF_ARCH    EM_SPARC
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->psr = 0;
-    regs->pc = infop->entry;
-    regs->npc = regs->pc + 4;
-    regs->y = 0;
-    regs->u_regs[14] = infop->start_stack - 16 * 4;
-}
-
-#endif
-#endif
-
-#ifdef TARGET_PPC
-
-#define ELF_START_MMAP 0x80000000
-
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
-
-#define elf_check_arch(x) ((x) == EM_PPC64)
-
-#define ELF_CLASS       ELFCLASS64
-
-#else
-
-#define elf_check_arch(x) ((x) == EM_PPC)
-
-#define ELF_CLASS       ELFCLASS32
-
-#endif
-
-#ifdef TARGET_WORDS_BIGENDIAN
-#define ELF_DATA        ELFDATA2MSB
-#else
-#define ELF_DATA        ELFDATA2LSB
-#endif
-#define ELF_ARCH        EM_PPC
-
-/*
- * We need to put in some extra aux table entries to tell glibc what
- * the cache block size is, so it can use the dcbz instruction safely.
- */
-#define AT_DCACHEBSIZE          19
-#define AT_ICACHEBSIZE          20
-#define AT_UCACHEBSIZE          21
-/* A special ignored type value for PPC, for glibc compatibility.  */
-#define AT_IGNOREPPC            22
-/*
- * The requirements here are:
- * - keep the final alignment of sp (sp & 0xf)
- * - make sure the 32-bit value at the first 16 byte aligned position of
- *   AUXV is greater than 16 for glibc compatibility.
- *   AT_IGNOREPPC is used for that.
- * - for compatibility with glibc ARCH_DLINFO must always be defined on PPC,
- *   even if DLINFO_ARCH_ITEMS goes to zero or is undefined.
- */
-#define DLINFO_ARCH_ITEMS       5
-#define ARCH_DLINFO                                                     \
-do {                                                                    \
-        NEW_AUX_ENT(AT_DCACHEBSIZE, 0x20);                              \
-        NEW_AUX_ENT(AT_ICACHEBSIZE, 0x20);                              \
-        NEW_AUX_ENT(AT_UCACHEBSIZE, 0);                                 \
-        /*                                                              \
-         * Now handle glibc compatibility.                              \
-         */                                                             \
-        NEW_AUX_ENT(AT_IGNOREPPC, AT_IGNOREPPC);                        \
-        NEW_AUX_ENT(AT_IGNOREPPC, AT_IGNOREPPC);                        \
- } while (0)
-
-static inline void init_thread(struct target_pt_regs *_regs, struct image_info *infop)
-{
-    abi_ulong pos = infop->start_stack;
-    abi_ulong tmp;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
-    abi_ulong entry, toc;
-#endif
-
-    _regs->gpr[1] = infop->start_stack;
-#if defined(TARGET_PPC64) && !defined(TARGET_ABI32)
-    get_user_u64(entry, infop->entry);
-    entry += infop->load_addr;
-    get_user_u64(toc, infop->entry + 8);
-    toc += infop->load_addr;
-    _regs->gpr[2] = toc;
-    infop->entry = entry;
-#endif
-    _regs->nip = infop->entry;
-    /* Note that isn't exactly what regular kernel does
-     * but this is what the ABI wants and is needed to allow
-     * execution of PPC BSD programs.
-     */
-    /* FIXME - what to for failure of get_user()? */
-    get_user_ual(_regs->gpr[3], pos);
-    pos += sizeof(abi_ulong);
-    _regs->gpr[4] = pos;
-    for (tmp = 1; tmp != 0; pos += sizeof(abi_ulong)) {
-        get_user_ual(tmp, pos);
-    }
-    _regs->gpr[5] = pos;
-}
+#endif /* !TARGET_X86_64 */
 
 #define USE_ELF_CORE_DUMP
 #define ELF_EXEC_PAGESIZE       4096
 
 #endif
 
-#ifdef TARGET_MIPS
-
-#define ELF_START_MMAP 0x80000000
-
-#define elf_check_arch(x) ((x) == EM_MIPS)
-
-#ifdef TARGET_MIPS64
-#define ELF_CLASS   ELFCLASS64
-#else
-#define ELF_CLASS   ELFCLASS32
-#endif
-#ifdef TARGET_WORDS_BIGENDIAN
-#define ELF_DATA        ELFDATA2MSB
-#else
-#define ELF_DATA        ELFDATA2LSB
-#endif
-#define ELF_ARCH    EM_MIPS
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->cp0_status = 2 << CP0St_KSU;
-    regs->cp0_epc = infop->entry;
-    regs->regs[29] = infop->start_stack;
-}
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE        4096
-
-#endif /* TARGET_MIPS */
-
-#ifdef TARGET_SH4
-
-#define ELF_START_MMAP 0x80000000
-
-#define elf_check_arch(x) ((x) == EM_SH)
-
-#define ELF_CLASS ELFCLASS32
-#define ELF_DATA  ELFDATA2LSB
-#define ELF_ARCH  EM_SH
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-  /* Check other registers XXXXX */
-  regs->pc = infop->entry;
-  regs->regs[15] = infop->start_stack;
-}
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE        4096
-
-#endif
-
-#ifdef TARGET_CRIS
-
-#define ELF_START_MMAP 0x80000000
-
-#define elf_check_arch(x) ((x) == EM_CRIS)
-
-#define ELF_CLASS ELFCLASS32
-#define ELF_DATA  ELFDATA2LSB
-#define ELF_ARCH  EM_CRIS
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-  regs->erp = infop->entry;
-}
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE        8192
-
-#endif
-
-#ifdef TARGET_M68K
-
-#define ELF_START_MMAP 0x80000000
-
-#define elf_check_arch(x) ((x) == EM_68K)
-
-#define ELF_CLASS       ELFCLASS32
-#define ELF_DATA        ELFDATA2MSB
-#define ELF_ARCH        EM_68K
-
-/* ??? Does this need to do anything?
-#define ELF_PLAT_INIT(_r) */
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->usp = infop->start_stack;
-    regs->sr = 0;
-    regs->pc = infop->entry;
-}
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE       8192
-
-#endif
-
-#ifdef TARGET_ALPHA
-
-#define ELF_START_MMAP (0x30000000000ULL)
-
-#define elf_check_arch(x) ((x) == ELF_ARCH)
-
-#define ELF_CLASS      ELFCLASS64
-#define ELF_DATA       ELFDATA2MSB
-#define ELF_ARCH       EM_ALPHA
-
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
-{
-    regs->pc = infop->entry;
-    regs->ps = 8;
-    regs->usp = infop->start_stack;
-    regs->unique = infop->start_data; /* ? */
-    printf("Set unique value to " TARGET_FMT_lx " (" TARGET_FMT_lx ")\n",
-           regs->unique, infop->start_data);
-}
-
-#define USE_ELF_CORE_DUMP
-#define ELF_EXEC_PAGESIZE        8192
-
-#endif /* TARGET_ALPHA */
-
 #ifndef ELF_PLATFORM
 #define ELF_PLATFORM (NULL)
 #endif
@@ -1119,10 +780,6 @@ static void load_symbols(struct elfhdr *hdr, int fd)
             }
             continue;
         }
-#if defined(TARGET_ARM) || defined(TARGET_MIPS)
-        /* The bottom address bit marks a Thumb or MIPS16 symbol.  */
-        syms[i].st_value &= ~(target_ulong)1;
-#endif
         i++;
     }
 
-- 
2.32.0


