Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD7A445E8F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 04:23:23 +0100 (CET)
Received: from localhost ([::1]:57404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mipp4-0008AZ-VZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 23:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplf-0004Bi-Fn
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:51 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1miplc-00042H-Bc
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 23:19:51 -0400
Received: by mail-io1-xd30.google.com with SMTP id f9so9186680ioo.11
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 20:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Udkf5Bj8DHQz403fIOXAnPPsiGULH4u0FHoKKSQx2Lk=;
 b=cqvImYT6st5GrM5/d+84TMMFPR4bWjAh31wAnB9Mx3IP375K7LwCSuaFTRTTH5aU1u
 pZPoZR/DHMBjLfVyy3UXF2xI5ZEbyirroAAjPTCMCrmJPaaWEkWxiH8Vu1XawSkaGJx6
 4pN1pAYqZx5Ds98fsIMuk5tiZa1LPL3xReBg6o4AtC+/ENfWLDWDBtds2Jgv+2Lpq0R0
 yHcqz9bxZ/ieLaqNW4SldCnVBWjZf2v/tY5/ZJH9LAUWlCokOZ1tkrSmd/+xnY7DFKch
 gnljDQ0VJgY6kUKtnQRAwxh2Z9ROZVh352uC/XAtYAsy2EO+Xu9JsZ/M5uedbmT80Y8u
 Ar0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Udkf5Bj8DHQz403fIOXAnPPsiGULH4u0FHoKKSQx2Lk=;
 b=WIVWllyFtBBYYmCQMrlhk24N1bdb5FrOvtIHDl0kPMGRlCBpGXaV/DVEOhlu/VcC70
 2tOpeWoQB/j7fMv8kyQUFbIhZvDJycns6C0KdgwQhXM/h33uwx73V0fmHAEX3HIR44G+
 WGRwz8NDyruAhosBcscyS1BSqtdRzZHpJ4sHvmgWHrQk3TplLHTNnbqsIHGfXmja8chX
 Go0zuf6MjbnqnP98sQmPNQbvht/67ukM5negp6bWYaIuEvQyh7FFj4WGAl3gg+XxnQRr
 oDraiLibqhZqoeMYk8ICouURN7VkRD6+46N1MbIwM3J08msREcuENg58Bn0ywuZOGNV5
 yM4w==
X-Gm-Message-State: AOAM531QQUJ8neLMh599sADzHtWlr63C6vS4AkoCtsSUOT37tcjVFlbK
 2xBUrDXf2IQNlbokzGQ9zLFB8+gZvfJVQQ==
X-Google-Smtp-Source: ABdhPJy8CERtoQt0ODcZVDBZvci+RYjNCHNQ7ahWpWklHAXuVTlfK/v2UizkXUFGKjb/dqEsGWIHAQ==
X-Received: by 2002:a02:c647:: with SMTP id k7mr2388713jan.52.1636082386509;
 Thu, 04 Nov 2021 20:19:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id v4sm3508528ilq.57.2021.11.04.20.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:19:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/36] bsd-user: arm (32-bit) support
Date: Thu,  4 Nov 2021 21:18:41 -0600
Message-Id: <20211105031917.87837-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level. The arm and x86
code are now the same as in the bsd-user fork. For full context, the fork is at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz (though the the recent
sig{bus,segv} needed updates are incomplete).

v4 changes the following:
* Remove mips* -- the bsd-user fork has removed it, so clean up the clutter.
* Move target_os_ucontext.h patch earlier in the series and add check of
  ucontext_t and mcontext_t sizes to match native sizes.
* Move x86 patches earlier in the patch series and Fill in the i386 and
  x86_64 mcontext contents to match FreeBSD and define
  TARGET_[UM]CONTEXT_SIZE to enable size checking.
* generally: Move inlines from target_arch_signal.h to signal.c
* Collapse arm's definition mcontext and trapframe into one commit and
  add size with TARGET_[MU]CONTEXT_SIZE.
* Fix the saving of vfp context to use proper locking and fetching
  of target address to get/save it.
* Filter out low-order bits of pc in arm set_mcontext()

Where code just moved (maybe with trivial changes), I retained reviewed-by
tagging. When the changes were more substantial due to issues discovered
by getting the size right, I droppped prior review. The following thus
lack review:
    bsd-user/mips*: Remove
    bsd-user/freebsd: Create common target_os_ucontext.h file
    bsd-user: create a per-arch signal.c file
    bsd-user/i386/target_arch_signal.h: Update mcontext_t to match FreeBSD
    bsd-user/i386: Move the inlines into signal.c
    bsd-user/x86_64/target_arch_signal.h: Fill in mcontext_t
    bsd-user/x86_64: Move functions into signal.c
    bsd-user/arm/target_arch_signal.h: arm machine context and trapframe for signals
    bsd-user/arm/target_arch_signal.h: Define size of *context_t
    bsd-user/arm/target_arch_signal.c: arm get_mcontext
    bsd-user/arm/target_arch_signal.c: arm set_mcontext
    bsd-user/freebsd/target_os_ucontext.h: Require TARGET_*CONTEXT_SIZE

Warnings that should be ignored:
   o make checkpatch has a couple of complaints about the comments for the
     signal trampoline, since it's a false positive IMHO.
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,
WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

Warner Losh (36):
  bsd-user/mips*: Remove
  bsd-user/freebsd: Create common target_os_ucontext.h file
  bsd-user: create a per-arch signal.c file
  bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
  bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/i386/target_arch_signal.h: Update mcontext_t to match FreeBSD
  bsd-user/i386: Move the inlines into signal.c
  bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
  bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/x86_64/target_arch_signal.h: Fill in mcontext_t
  bsd-user/x86_64: Move functions into signal.c
  bsd-user/arm/target_arch_sysarch.h: Use consistent include guards
  bsd-user/arm/target_syscall.h: Add copyright and update name
  bsd-user/arm/target_arch_cpu.c: Target specific TLS routines
  bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
  bsd-user/arm/target_arch_cpu.h: Implement target_cpu_clone_regs
  bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop implementation
  bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP exceptions
  bsd-user/arm/target_arch_cpu.h: Implement data abort exceptions
  bsd-user/arm/target_arch_cpu.h: Implement system call dispatch
  bsd-user/arm/target_arch_reg.h: Implement core dump register copying
  bsd-user/arm/target_arch_vmparam.h: Parameters for arm address space
  bsd-user/arm/target_arch_sigtramp.h: Signal Trampoline for arm
  bsd-user/arm/target_arch_thread.h: Routines to create and switch to a
    thread
  bsd-user/arm/target_arch_elf.h: arm defines for ELF
  bsd-user/arm/target_arch_elf.h: arm get hwcap
  bsd-user/arm/target_arch_elf.h: arm get_hwcap2 impl
  bsd-user/arm/target_arch_signal.h: arm specific signal registers and
    stack
  bsd-user/arm/target_arch_signal.h: arm machine context and trapframe
    for signals
  bsd-user/arm/target_arch_signal.h: Define size of *context_t
  bsd-user/arm/target_arch_signal.c: arm set_sigtramp_args
  bsd-user/arm/target_arch_signal.c: arm get_mcontext
  bsd-user/arm/target_arch_signal.c: arm set_mcontext
  bsd-user/arm/target_arch_signal.c: arm get_ucontext_sigreturn
  bsd-user/freebsd/target_os_ucontext.h: Require TARGET_*CONTEXT_SIZE
  bsd-user: add arm target build

 bsd-user/arm/signal.c                 | 199 ++++++++++++++++++++++++
 bsd-user/arm/target_arch.h            |  28 ++++
 bsd-user/arm/target_arch_cpu.c        |  39 +++++
 bsd-user/arm/target_arch_cpu.h        | 211 ++++++++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h        | 128 ++++++++++++++++
 bsd-user/arm/target_arch_reg.h        |  60 ++++++++
 bsd-user/arm/target_arch_signal.h     |  97 ++++++++++++
 bsd-user/arm/target_arch_sigtramp.h   |  49 ++++++
 bsd-user/arm/target_arch_sysarch.h    |   6 +-
 bsd-user/arm/target_arch_thread.h     |  82 ++++++++++
 bsd-user/arm/target_arch_vmparam.h    |  48 ++++++
 bsd-user/arm/target_syscall.h         |  27 +++-
 bsd-user/freebsd/target_os_signal.h   |   3 -
 bsd-user/freebsd/target_os_ucontext.h |  33 ++++
 bsd-user/i386/signal.c                |  55 +++++++
 bsd-user/i386/target_arch_signal.h    | 102 +++++++------
 bsd-user/mips/target_arch_sysarch.h   |  69 ---------
 bsd-user/mips/target_syscall.h        |  52 -------
 bsd-user/mips64/target_arch_sysarch.h |  69 ---------
 bsd-user/mips64/target_syscall.h      |  53 -------
 bsd-user/x86_64/signal.c              |  55 +++++++
 bsd-user/x86_64/target_arch_signal.h  | 110 ++++++++------
 configs/targets/arm-bsd-user.mak      |   2 +
 meson.build                           |   2 +-
 24 files changed, 1231 insertions(+), 348 deletions(-)
 create mode 100644 bsd-user/arm/signal.c
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/arm/target_arch_elf.h
 create mode 100644 bsd-user/arm/target_arch_reg.h
 create mode 100644 bsd-user/arm/target_arch_signal.h
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h
 create mode 100644 bsd-user/arm/target_arch_thread.h
 create mode 100644 bsd-user/arm/target_arch_vmparam.h
 create mode 100644 bsd-user/freebsd/target_os_ucontext.h
 create mode 100644 bsd-user/i386/signal.c
 delete mode 100644 bsd-user/mips/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips/target_syscall.h
 delete mode 100644 bsd-user/mips64/target_arch_sysarch.h
 delete mode 100644 bsd-user/mips64/target_syscall.h
 create mode 100644 bsd-user/x86_64/signal.c
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.33.0


