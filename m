Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244D445489
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:08:35 +0100 (CET)
Received: from localhost ([::1]:55326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1midPt-0000ut-GQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNa-0006LY-Q6
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:10 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:36378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNY-0000w7-Do
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:10 -0400
Received: by mail-il1-x136.google.com with SMTP id l8so6284271ilv.3
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I9QgGKzp09JnsWQORF7cArwlKHtls6JcUlDShV4oM8I=;
 b=bGiV0e0aaDI7eWd513C8JHRMlg7GNL0lTYeZiqaT+BnnUb4DcxBsvu7NYgHubc+jpj
 BH118+bDOAPoQxdO+yAL40tCZcsreYzTcOHDPsEUDeZ6mghXXKqDd2Hw6qr9Y0WAaB6e
 38UCrU2+3kK4mZaDjKDTpMX4e6ijOf2fnsfSt4Y6Rwo7ED+TGRoZGZW4haoubjrIrtZg
 dTeL++pcfl9fW5oqKZBUmcwlWQVfj5Z77fv7tWtLHwW9zFbe3J67VfX7Jn5pQ5YM71YF
 MavPG/v10UbL03BS2frbiXRg3KabNgh+efHPwaFMxExTbTCOuK1Lwh2aA74IsIS8Z6cs
 fBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I9QgGKzp09JnsWQORF7cArwlKHtls6JcUlDShV4oM8I=;
 b=uw8xipB/4RE7Ohve/NBogqGgd0gmgw1Zmt05O2SZ5Z9nYKu/o1apc2p1YGLraUm6Gr
 vJ17eXI6LGox7VXJ6PCzGzI4jmQJGvU/CkdZfraUoCa9mhRCu1XVlteNSwOeysEJG+8R
 JdCoxbwCOshPYYkzt7ii+aheb8K3I3i3B8tuTLausT8Kpj2i1iEq1VSpFdjzJaKrLGVb
 LGNw4nO1S04pPWJjZzAaqgzWYrBby+Tco1xCW5VCCyBLaFOwKjmTx+d5N4ibFasKNZEb
 CE57d/gGvaQ1go0iFpIr6AbwzReBLrZJSOrcsi1PPveiogvbLeNE7NhMbmOwZup9pBTQ
 qYKg==
X-Gm-Message-State: AOAM530OwPWbDScTVjxKiyKTcVGerGBI8GnuinBemcShM21EyTc/EzFN
 RQcXndroj08OYi/PEGV+/+BxB1BHAPP5Ow==
X-Google-Smtp-Source: ABdhPJzkcL85IUh3k4X7KWwb4FyFx6Sbb1SOR0cUjqecJsYndbAFdf8Hlk9vdigbrfmOou6LEr7DLQ==
X-Received: by 2002:a92:cd8b:: with SMTP id r11mr20093633ilb.320.1636034766332; 
 Thu, 04 Nov 2021 07:06:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:05 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/29] bsd-user: arm (32-bit) support
Date: Thu,  4 Nov 2021 08:05:07 -0600
Message-Id: <20211104140536.42573-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level. The arm and x86
code are now the same as in the bsd-user fork. For full context, the fork is at
https://github.com/qemu-bsd-user/qemu-bsd-user/tree/blitz (though the the recent
sig{bus,segv} needed updates are incomplete).

V3 addresses review comments:
   o Update target_arch_cpu.h to remove bogus unaligned check and notyet code.
   o Fixed target_thread_init to match FreeBSD's startup code and remove the
     cut-n-paste code from Linux's startup. Add comments.
   o Fixed various bugs with setting CPSR unaddressed from patch comments on v1
   o Use #defines instead of bare constants for user mode.

Following still need reviews:
    bsd-user/arm/target_arch_signal.h: arm machine context for signals
    bsd-user/arm/target_arch_cpu.h: Implement trivial EXCP exceptions

Warnings that should be ignored:
   o make checkpatch has a couple of complaints about the comments for the
     signal trampoline, since it's a false positive IMHO.
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,
WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

Warner Losh (29):
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
  bsd-user/freebsd: Create common target_os_ucontext.h file
  bsd-user/arm/target_arch_signal.h: arm specific signal registers and
    stack
  bsd-user/arm/target_arch_signal.h: arm machine context for signals
  bsd-user/arm/target_arch_signal.h: arm user context and trapframe for
    signals
  bsd-user/arm/target_arch_signal.h: arm set_sigtramp_args
  bsd-user/arm/target_arch_signal.h: arm get_mcontext
  bsd-user/arm/target_arch_signal.h: arm set_mcontext
  bsd-user/arm/target_arch_signal.h: arm get_ucontext_sigreturn
  bsd-user: add arm target build
  bsd-user/i386/target_arch_signal.h: Remove target_sigcontext
  bsd-user/x86_64/target_arch_signal.h: Remove target_sigcontext
  bsd-user/i386/target_arch_signal.h: use new target_os_ucontext.h
  bsd-user/x86_64/target_arch_signal.h: use new target_os_ucontext.h

 bsd-user/arm/target_arch.h            |  28 +++
 bsd-user/arm/target_arch_cpu.c        |  39 ++++
 bsd-user/arm/target_arch_cpu.h        | 211 +++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h        | 128 +++++++++++++
 bsd-user/arm/target_arch_reg.h        |  60 ++++++
 bsd-user/arm/target_arch_signal.h     | 258 ++++++++++++++++++++++++++
 bsd-user/arm/target_arch_sigtramp.h   |  49 +++++
 bsd-user/arm/target_arch_sysarch.h    |   6 +-
 bsd-user/arm/target_arch_thread.h     |  82 ++++++++
 bsd-user/arm/target_arch_vmparam.h    |  48 +++++
 bsd-user/arm/target_syscall.h         |  27 ++-
 bsd-user/freebsd/target_os_signal.h   |   3 -
 bsd-user/freebsd/target_os_ucontext.h |  26 +++
 bsd-user/i386/target_arch_signal.h    |  13 +-
 bsd-user/x86_64/target_arch_signal.h  |  13 +-
 configs/targets/arm-bsd-user.mak      |   2 +
 16 files changed, 959 insertions(+), 34 deletions(-)
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
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.33.0


