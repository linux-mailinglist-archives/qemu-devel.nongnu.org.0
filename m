Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6313F8FDB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:23:14 +0200 (CEST)
Received: from localhost ([::1]:36736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJMq9-0000O4-SR
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfr-0005s8-Ug
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:35 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:34458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMfq-0006oc-3d
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:35 -0400
Received: by mail-il1-x130.google.com with SMTP id j15so4766067ila.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbEdUvbo/mrg2leYF7EcbjbkdggBVAu4KQwCBbiNYLY=;
 b=1vyhn53sri7br23ykNfZzKsgIDw/xs72fG8shsTgIpdr90npUEy1PwfnTmq+Qr8uJR
 9QJE6k7JLKq84610e3DR3JbLWzE6978D6ZxOa340alEOpHv6BdNn4mqS3ImKPOqFlG9z
 VsgXXY+H41rToLZi1vB6XMTnR+BIPyX2kA7Igm9znMG4ZS8CJeTlObS2FU6uaM0gDeUW
 oAOFh89r+6l3c0Q7HQ1ZPaMlwioJAy44AafTwKeeDrA3jDob6iNIWkActmI3rYUBxCr2
 xwpxCzBjWipmgt+gQ6g5nISYlnqgCGFel75SS6fiWR3HUfE14n4yFOe/FC9FuBwXZwH4
 m9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbEdUvbo/mrg2leYF7EcbjbkdggBVAu4KQwCBbiNYLY=;
 b=K9UrJ5q+ihXRQfRE+lyfx0KlASlA+Y2dFKlTR9zeMuGLnH1Jmh/Q5+Dmy7EvcZhgiw
 oEtoBLmhGoAVQDJwU0HrrxdVu4vqm2YG0JKjTMP+xujmqolEORY/Jrj1RV1vachkf1o8
 4iZJIo/LhgaPKE4awJkTWvA3ZvAqtYmrJyfTfI7WmzJnjnlO94k2yxxElcEGPkaArykZ
 Mm0Sb4buo5i7pVKQFCzozMWE+vLczQ3M95GpD/Owzkz65vMF8wFv7HtcW31B6Y/+Z9lj
 kHNiH0npqDPgWHXQS6xy4GHrPSLD0ykncU4iJsB01Wt2+X3XsdEERf+xpuiAn1QGCcW+
 oh6A==
X-Gm-Message-State: AOAM532cnRKB595teinGEqoejhe48NPfxdtX9JnFogK/BSWMGxusYNx0
 xM6ZFUKVQW33VG08pksTbKo5XA6JzRQDSb1X
X-Google-Smtp-Source: ABdhPJyJW7s8BpavmjfKFUnAjOSQC/o6z02OeVr8kd0lX9qTLb6KC+tnFF//JXahchrVwQaRW2uNjA==
X-Received: by 2002:a05:6e02:e8b:: with SMTP id
 t11mr4056611ilj.175.1630012352869; 
 Thu, 26 Aug 2021 14:12:32 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:32 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/43] bsd-user: Eliminate elf personality
Date: Thu, 26 Aug 2021 15:11:29 -0600
Message-Id: <20210826211201.98877-12-imp@bsdimp.com>
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

The linux kernel supports a number of different ELF binaries. The Linux userland
emulator inheritted some of that. And we inheritted it from there. However, for
BSD there's only one kind of ELF file supported per platform, so there's no need
to cope with historical quirks. Simply the code as a result.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


