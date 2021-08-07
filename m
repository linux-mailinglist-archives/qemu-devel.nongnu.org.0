Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F13E3732
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:48:33 +0200 (CEST)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUBE-0003uw-Dy
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5y-0006iR-Lj
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:06 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:33364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5w-0004oM-Qk
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:06 -0400
Received: by mail-io1-xd34.google.com with SMTP id n19so20055012ioz.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vgjTCAQowlCVaAJa2bIQiBMowZ7EIsXDX0deg8KnEcc=;
 b=fjPomm/8SM5bohubpBLG/RsG3Yy+RxnvV+4jH5HOgYD0YNpinDeJm3pFdjuUTgDPOr
 MW+0sIKShvQMkRLSQRQh+psYmpuJ/nN7L+8C5pxLYN+dpW1Wc4TxbrgsQNiDxGJqQv0u
 zo+7wPPupspCg0y7xEExSEM9gmg95TBPvjTMNA37NxGQu52aVr7g5zkSUAL2ivYTE+B6
 Rm0/PZSEhubpYpXSv1/x6KbsRTuf+KnIEACRvqXMa1oqyOCkTYD7ogdpkWL0fpQIUORy
 pMk9nQ/j6NEt8NZjiR15Cz930x5uQfDQEpsC/pFpRR3bjvIxhtwNlzMI9TGAmChNgMv1
 hGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vgjTCAQowlCVaAJa2bIQiBMowZ7EIsXDX0deg8KnEcc=;
 b=ke3TfGk0LHZ0YxsTMIuqsDmLC3BMWmte6SzWsL1qlCGtiU547EqLuppp3XAlZfv1HU
 EtYN1lBoItEn8HRmlMzfedOdth48xEK/g3CBzI9ox3KvLOMMsiBRQRWUMp78YO+zPuE9
 1GLyXLZTDNsiWi7cDyIdajAoER2lsk1aDwD64m9Vcfh0YbyQM7woVkVEzWaQHKQ6nJoW
 dw2uJ1OAEQh6zPUcEDyk3SAtnbWx3QM7uRp7oDY6cimMa+Y3F77KIgUdPEWC041uTXAK
 i4i4+fzJFSJq+9B482LZ06O6fNKGfo3LQ0ub2x0jntGlaO65s80PLK07gMOJShQPbz4Z
 odrA==
X-Gm-Message-State: AOAM532b6CZR9Ptpzuaf8oOjjbut30+X64VZSttaXR19KZEBTF6Sk/0O
 ihadE7r7PbEeHGXU1Qvgmt6YYy36nqeWfpxk
X-Google-Smtp-Source: ABdhPJy2t9Q9GWsmLUJzUv86DbbzSMOJhDtQIDlg3k0gW9rtlUfcuC4FClLraVojdII/8G7RjyDM/w==
X-Received: by 2002:a92:c266:: with SMTP id h6mr507338ild.273.1628372583482;
 Sat, 07 Aug 2021 14:43:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 13/49] bsd-user: Eliminate elf personality
Date: Sat,  7 Aug 2021 15:42:06 -0600
Message-Id: <20210807214242.82385-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The linux kernel supports a number of different ELF binaries. The Linux userland
emulator inheritted some of that. And we inheritted it from there. However, for
BSD there's only one kind of ELF file supported per platform, so there's no need
to cope with historical quirks. Simply the code as a result.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/elfload.c | 87 ----------------------------------------------
 bsd-user/qemu.h    |  1 -
 2 files changed, 88 deletions(-)

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 639673f5b7..e950732978 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -25,66 +25,6 @@
 
 #include "target_arch_elf.h"
 
-/* from personality.h */
-
-/*
- * Flags for bug emulation.
- *
- * These occupy the top three bytes.
- */
-enum {
-        ADDR_NO_RANDOMIZE =     0x0040000,      /* disable randomization of VA space */
-        FDPIC_FUNCPTRS =        0x0080000,      /* userspace function ptrs point to descriptors
-                                                 * (signal handling)
-                                                 */
-        MMAP_PAGE_ZERO =        0x0100000,
-        ADDR_COMPAT_LAYOUT =    0x0200000,
-        READ_IMPLIES_EXEC =     0x0400000,
-        ADDR_LIMIT_32BIT =      0x0800000,
-        SHORT_INODE =           0x1000000,
-        WHOLE_SECONDS =         0x2000000,
-        STICKY_TIMEOUTS =       0x4000000,
-        ADDR_LIMIT_3GB =        0x8000000,
-};
-
-/*
- * Personality types.
- *
- * These go in the low byte.  Avoid using the top bit, it will
- * conflict with error returns.
- */
-enum {
-        PER_LINUX =             0x0000,
-        PER_LINUX_32BIT =       0x0000 | ADDR_LIMIT_32BIT,
-        PER_LINUX_FDPIC =       0x0000 | FDPIC_FUNCPTRS,
-        PER_SVR4 =              0x0001 | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
-        PER_SVR3 =              0x0002 | STICKY_TIMEOUTS | SHORT_INODE,
-        PER_SCOSVR3 =           0x0003 | STICKY_TIMEOUTS |
-                                         WHOLE_SECONDS | SHORT_INODE,
-        PER_OSR5 =              0x0003 | STICKY_TIMEOUTS | WHOLE_SECONDS,
-        PER_WYSEV386 =          0x0004 | STICKY_TIMEOUTS | SHORT_INODE,
-        PER_ISCR4 =             0x0005 | STICKY_TIMEOUTS,
-        PER_BSD =               0x0006,
-        PER_SUNOS =             0x0006 | STICKY_TIMEOUTS,
-        PER_XENIX =             0x0007 | STICKY_TIMEOUTS | SHORT_INODE,
-        PER_LINUX32 =           0x0008,
-        PER_LINUX32_3GB =       0x0008 | ADDR_LIMIT_3GB,
-        PER_IRIX32 =            0x0009 | STICKY_TIMEOUTS,/* IRIX5 32-bit */
-        PER_IRIXN32 =           0x000a | STICKY_TIMEOUTS,/* IRIX6 new 32-bit */
-        PER_IRIX64 =            0x000b | STICKY_TIMEOUTS,/* IRIX6 64-bit */
-        PER_RISCOS =            0x000c,
-        PER_SOLARIS =           0x000d | STICKY_TIMEOUTS,
-        PER_UW7 =               0x000e | STICKY_TIMEOUTS | MMAP_PAGE_ZERO,
-        PER_OSF4 =              0x000f,                  /* OSF/1 v4 */
-        PER_HPUX =              0x0010,
-        PER_MASK =              0x00ff,
-};
-
-/*
- * Return the base personality without flags.
- */
-#define personality(pers)       (pers & PER_MASK)
-
 /* this flag is uneffective under linux too, should be deleted */
 #ifndef MAP_DENYWRITE
 #define MAP_DENYWRITE 0
@@ -750,7 +690,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     abi_ulong load_addr, load_bias;
     int load_addr_set = 0;
     unsigned int interpreter_type = INTERPRETER_NONE;
-    unsigned char ibcs2_interpreter;
     int i;
     struct elf_phdr * elf_ppnt;
     struct elf_phdr *elf_phdata;
@@ -765,7 +704,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
 #endif
     char passed_fileno[6];
 
-    ibcs2_interpreter = 0;
     load_addr = 0;
     load_bias = 0;
     elf_ex = *((struct elfhdr *) bprm->buf);          /* exec-header */
@@ -856,20 +794,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
                 exit(-1);
             }
 
-            /* If the program interpreter is one of these two,
-               then assume an iBCS2 image. Otherwise assume
-               a native linux image. */
-
-            /* JRP - Need to add X86 lib dir stuff here... */
-
-            if (strcmp(elf_interpreter, "/usr/lib/libc.so.1") == 0 ||
-                strcmp(elf_interpreter, "/usr/lib/ld.so.1") == 0) {
-              ibcs2_interpreter = 1;
-            }
-
-#if 0
-            printf("Using ELF interpreter %s\n", path(elf_interpreter));
-#endif
             if (retval >= 0) {
                 retval = open(path(elf_interpreter), O_RDONLY);
                 if (retval >= 0) {
@@ -1099,7 +1023,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
         load_symbols(&elf_ex, bprm->fd);
 
     if (interpreter_type != INTERPRETER_AOUT) close(bprm->fd);
-    info->personality = (ibcs2_interpreter ? PER_SVR4 : PER_LINUX);
 
 #ifdef LOW_ELF_STACK
     info->start_stack = bprm->p = elf_stack - 4;
@@ -1135,16 +1058,6 @@ int load_elf_binary(struct bsd_binprm *bprm, struct target_pt_regs *regs,
     printf("(brk) %x\n" , info->brk);
 #endif
 
-    if (info->personality == PER_SVR4)
-    {
-            /* Why this, you ask???  Well SVr4 maps page 0 as read-only,
-               and some applications "depend" upon this behavior.
-               Since we do not have the power to recompile these, we
-               emulate the SVr4 behavior.  Sigh.  */
-            target_mmap(0, qemu_host_page_size, PROT_READ | PROT_EXEC,
-                                      MAP_FIXED | MAP_PRIVATE, -1, 0);
-    }
-
     info->entry = elf_entry;
 
     return 0;
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 6b601ce4b5..e85c164bab 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -66,7 +66,6 @@ struct image_info {
     abi_ulong entry;
     abi_ulong code_offset;
     abi_ulong data_offset;
-    int       personality;
 };
 
 #define MAX_SIGQUEUE_SIZE 1024
-- 
2.32.0


