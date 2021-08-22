Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F132D3F3D5B
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 05:57:34 +0200 (CEST)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHebw-0001xm-F4
	for lists+qemu-devel@lfdr.de; Sat, 21 Aug 2021 23:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaE-0007fP-In
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:42 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHeaC-0000Xj-Qv
 for qemu-devel@nongnu.org; Sat, 21 Aug 2021 23:55:42 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so4617139pjb.0
 for <qemu-devel@nongnu.org>; Sat, 21 Aug 2021 20:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qmRwysVHQbpTMXCBt5h+5HK4vACKaG0zad7qafluRU=;
 b=tITbr0OnvV1WzT5Ifk3x2WXR2JN4ovFlUfK7JhYduNx7bgbUGwIoPWUck1C8LjpZDC
 daWVpe+/83yXv61+vvgBV5kYJaIi7EsKnHrtVGnHsAx/yK4TbkN/No7NSAjtdW31qyXX
 3LBNUQD0D5rbBQOmcpcS9d75ms1pHn+R/ddfkOIHOXlU9yxQJ0gtHc2upVQrdezpOFCs
 BiekUoLt8Bq5GEonpHw3xjGL5y8OGhJx0p5ncN+6E+LYU8tzSPthQ/wADrCdQEmbdetJ
 QTsHSa+Gji4zwMHsvc16qO4EyavYwuyEbMG7EZmBHp727EfTVfpZukB76G4hU5I4BBSU
 CuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2qmRwysVHQbpTMXCBt5h+5HK4vACKaG0zad7qafluRU=;
 b=N4Hkkv3fM/Jwhj6NxbgTLypzn2C4gcey6DqKziCkc45gXhLoObMBhYjdLxIz135iW0
 VwdxydKT2El5/bB+ISeid14IbCljfjtqLASwoff7pMyjUEewWDJjQAzy3aT+dwPRPzqT
 3q8xc2KwWpbhwFHDhgRI3NsEQOja608gELlK9uRjWbku9TeI9taH1mGJP77Laif53CSH
 RJk8+68MqVFKi/8DvrKb8uT7849hC37bQ3P5xFnLWclPz/3LR4BbsVsOcz3KuX30Ef4/
 xZwhCydqy5h9WUfLpGf6X+bVgJJO5+EwE5sGNnQsV0ltNQxH78swwOhomuYQ1MNbjG85
 75ZQ==
X-Gm-Message-State: AOAM5320W5+7pPKJbaUL2Y+0uGedmQfGN4u1LnlMqtUjEt1E0nO4/BO/
 56cBLc5aKreAAwHTKC8Tpa/eLBTdlxWkuQ==
X-Google-Smtp-Source: ABdhPJyte4keGb9lsxwWdVYEIF6yah6cO8tFNlUrsxUlKtPtg9n1veKkS2/i1IZwcG0LFgVLDPZUTQ==
X-Received: by 2002:a17:90a:6009:: with SMTP id y9mr68724pji.93.1629604538829; 
 Sat, 21 Aug 2021 20:55:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id x12sm11560533pfu.21.2021.08.21.20.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Aug 2021 20:55:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] linux-user: Clean up siginfo_t handling
Date: Sat, 21 Aug 2021 20:55:07 -0700
Message-Id: <20210822035537.283193-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: 20210813131809.28655-1-peter.maydell@linaro.org
("linux-user: Clean up siginfo_t handling for arm, aarch64")

Changes from Peter's v1:
  * Introduce force_sigsegv_for_addr().
  * Convert the rest of the targets, except nios2
    (nios2 looks very wrong, and I can't test it).
  * Other misc cleanups to signal handling, while I
    was nearby and looking at kernel code.


r~


Peter Maydell (7):
  linux-user/aarch64: Set siginfo_t addr field for SIGTRAP signals
  linux-user/arm: Set siginfo_t addr field for SIGTRAP signals
  linux-user/arm: Use force_sig() to deliver fpa11 emulation SIGFPE
  linux-user: Zero out target_siginfo_t in force_sig()
  linux-user: Provide new force_sig_fault() function
  linux-user/arm: Use force_sig_fault()
  linux-user/aarch64: Use force_sig_fault()

Richard Henderson (23):
  linux-user: Provide new force_sigsegv_for_addr() function
  linux-user/alpha: Set TRAP_UNK for bugchk and unknown gentrap
  linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
  linux-user/alpha: Use force_sig_fault, force_sigsegv_code
  linux-user/cris: Use force_sig_fault, force_sigsegv_code
  linux-user/hexagon: Use force_sigsegv_code
  linux-user/hppa: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/hppa: Use the proper si_code for PRIV_OPR, PRIV_REG,
    OVERFLOW
  linux-user/hppa: Set FPE_CONDTRAP for COND
  linux-user/i386: Split out maybe_handle_vm86_trap
  linux-user/i386: Use force_sig, force_sig_fault,
    force_sigsegv_for_addr
  linux-user/m68k: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/microblaze: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/microblaze: Fix SIGFPE si_codes
  linux-user/mips: Improve do_break
  linux-user/mips: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/openrisc: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/ppc: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/riscv: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/s390x: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/sh4: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/sparc: Use force_sig_fault, force_sigsegv_for_addr
  linux-user/xtensa: Use force_sig_fault, force_sigsegv_for_addr

 linux-user/signal-common.h       |   2 +
 linux-user/syscall_defs.h        |   2 +
 linux-user/aarch64/cpu_loop.c    |  33 ++-----
 linux-user/alpha/cpu_loop.c      |  76 +++++------------
 linux-user/arm/cpu_loop.c        |  64 +++++---------
 linux-user/cris/cpu_loop.c       |  22 ++---
 linux-user/hexagon/cpu_loop.c    |  22 +----
 linux-user/hppa/cpu_loop.c       |  40 ++++-----
 linux-user/i386/cpu_loop.c       |  77 +++++++----------
 linux-user/m68k/cpu_loop.c       |  35 ++------
 linux-user/microblaze/cpu_loop.c |  83 +++++++++---------
 linux-user/mips/cpu_loop.c       |  92 +++++++++-----------
 linux-user/openrisc/cpu_loop.c   |  37 +++-----
 linux-user/ppc/cpu_loop.c        | 142 +++++++------------------------
 linux-user/riscv/cpu_loop.c      |  36 ++------
 linux-user/s390x/cpu_loop.c      |  16 ++--
 linux-user/sh4/cpu_loop.c        |  14 +--
 linux-user/signal.c              |  37 +++++++-
 linux-user/sparc/cpu_loop.c      |  38 ++-------
 linux-user/xtensa/cpu_loop.c     |  34 +++-----
 20 files changed, 310 insertions(+), 592 deletions(-)

-- 
2.25.1


