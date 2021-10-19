Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59068433D05
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 19:09:17 +0200 (CEST)
Received: from localhost ([::1]:53018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcsc0-0001r4-FX
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEg-0008Ft-9A
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:10 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcsEc-00008s-0O
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 12:45:09 -0400
Received: by mail-io1-xd35.google.com with SMTP id h196so21163344iof.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWqt0w9nIvtuJKPGlQZh/j+NHfSlj1plNPQmtP76IXE=;
 b=IMQNB5CbCn0q06lAZ/fjqBFoi8Ws3ZOMhqlRxG//A2Jk3QYxMw9Oijzgs6Nmb3+9fh
 WWuY9N+TaRVlaseHv/fBirr+l8oPV2yDncGqPqM9octbvfbCdnU8EMSkV7kq0qXMPpdO
 c9usm59SX/iM65rWzRrF08mjaq3uWiZK4AvYG22or70i9lE4z5qtnEu2NqhPlrjWphY3
 /Q6Y3JbistAfT1Nzc4eZnomO3FYTOBo0gpj0yxnBwpPXkqcRToTRpq6q3D+GSUT7dmqY
 douN4UsCzyuswhsc8JuRuZ9idI1/CHyk0OKZ2yH1XlhahtF3AldTIBrNM4MJQNrXi7RV
 7qSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rWqt0w9nIvtuJKPGlQZh/j+NHfSlj1plNPQmtP76IXE=;
 b=gAzrTRJyDmiZ9x2DEEQbJxYcjvGTV2fI1Eq9hzO9M9QD1RQuOfl72BKAJbPc04i2fw
 d0MnYL3Ti5+E7fe+nO/sXOua85IGZNYyNS5J4UKhr4tWnUSYzDme9+G00L8qHGT40Auy
 vE82VSpD/1t/nG4ic9eT5ELDjBEqV5fs27q847/lJ4wDvh1eBcipfHopbmAX05s5AdLU
 oVPNfqFh8pZtbRiuwQhHJ4OV7EBafg5qx9neM2OBdzRBJZBTNXOW3GoBOQMYHA7qibow
 UuTSSnwxfzq70QENPbjYVkZLSJrTK81TXnCYy1i75u00UYXPhbmKvLRC/HSzVHN75Wif
 wT7g==
X-Gm-Message-State: AOAM530J1dr3cc7YR5OVK/WsT8E/5zikB/ilbeeo29CVx+o3oEWhgv1z
 H1DY6R2eA+xlCD8c36KtsegFbrgArbLP2w==
X-Google-Smtp-Source: ABdhPJyNRIa++mgRdnVuZigD04N4m6nLVCxLc4rQNXVSNcJ16DYeC66TAXa5CSGsQMcJk943CRPA0w==
X-Received: by 2002:a02:ce82:: with SMTP id y2mr4930765jaq.121.1634661903805; 
 Tue, 19 Oct 2021 09:45:03 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q7sm1133951ilv.48.2021.10.19.09.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 09:45:03 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/24] bsd-user: arm (32-bit) support
Date: Tue, 19 Oct 2021 10:44:23 -0600
Message-Id: <20211019164447.16359-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@freebsd.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series of patches brings in 32-bit arm support for bsd-user.  It implements
all the bits needed to do image activation, signal handling, stack management
and threading. This allows us to get to the "Hello World" level and also to
satisfy all linking requirements. I've sliced up the current bsd-user fork
versions of all this code into what I hope are right-sized reviewable chunks.

make checkpatch has a couple of complaints about the comments for the signal
trampoline:
WARNING: Block comments use a leading /* on a separate line
+    /* 8 */ sys_sigreturn,

WARNING: Block comments use a leading /* on a separate line
+    /* 9 */ sys_exit

that I think should be ignored.

Warner Losh (24):
  bsd-user/arm/target_arch_sysarch.h: Use consistent include guards
  bsd-user/arm/target_syscall.h: Add copyright and update name
  bsd-user/arm/target_arch_cpu.c: Target specific TLS routines
  bsd-user/arm/target_arch_cpu.h: CPU Loop definitions
  bsd-user/arm/target_arch_cpu.h: Implement target_cpu_clone_regs
  bsd-user/arm/target_arch_cpu.h: Dummy target_cpu_loop implementation
  bsd-user/arm/target_arch_cpu.h: Implment trivial EXCP exceptions
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
  bsd-user/arm/target_arch_signal.h: arm machine context for signals
  bsd-user/arm/target_arch_signal.h: arm user context and trapframe for
    signals
  bsd-user/arm/target_arch_signal.h: arm set_sigtramp_args
  bsd-user/arm/target_arch_signal.h: arm get_mcontext
  bsd-user/arm/target_arch_signal.h: arm set_mcontext
  bsd-user/arm/target_arch_signal.h: arm get_ucontext_sigreturn
  bsd-user: add arm target build

 bsd-user/arm/target_arch.h          |  28 +++
 bsd-user/arm/target_arch_cpu.c      |  39 +++++
 bsd-user/arm/target_arch_cpu.h      | 206 ++++++++++++++++++++++
 bsd-user/arm/target_arch_elf.h      | 128 ++++++++++++++
 bsd-user/arm/target_arch_reg.h      |  60 +++++++
 bsd-user/arm/target_arch_signal.h   | 253 ++++++++++++++++++++++++++++
 bsd-user/arm/target_arch_sigtramp.h |  52 ++++++
 bsd-user/arm/target_arch_sysarch.h  |   6 +-
 bsd-user/arm/target_arch_thread.h   |  71 ++++++++
 bsd-user/arm/target_arch_vmparam.h  |  48 ++++++
 bsd-user/arm/target_syscall.h       |  27 ++-
 configs/targets/arm-bsd-user.mak    |   2 +
 12 files changed, 913 insertions(+), 7 deletions(-)
 create mode 100644 bsd-user/arm/target_arch.h
 create mode 100644 bsd-user/arm/target_arch_cpu.c
 create mode 100644 bsd-user/arm/target_arch_cpu.h
 create mode 100644 bsd-user/arm/target_arch_elf.h
 create mode 100644 bsd-user/arm/target_arch_reg.h
 create mode 100644 bsd-user/arm/target_arch_signal.h
 create mode 100644 bsd-user/arm/target_arch_sigtramp.h
 create mode 100644 bsd-user/arm/target_arch_thread.h
 create mode 100644 bsd-user/arm/target_arch_vmparam.h
 create mode 100644 configs/targets/arm-bsd-user.mak

-- 
2.32.0


