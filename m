Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49188410914
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 03:59:15 +0200 (CEST)
Received: from localhost ([::1]:36168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRm6r-00068S-Ro
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 21:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm55-0003QI-To
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:23 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mRm54-000526-1Y
 for qemu-devel@nongnu.org; Sat, 18 Sep 2021 21:57:23 -0400
Received: by mail-pf1-x432.google.com with SMTP id c1so9945052pfp.10
 for <qemu-devel@nongnu.org>; Sat, 18 Sep 2021 18:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4jBh6uPrBdIEE6og9SOvCW6NJj594jME4C4cARcVqw=;
 b=nMAJrhYJpw3oRiEhDXpErCcGtOKftQfS1tQrjeoma4SFxXZKMZvOu9gS6dGo06qFam
 X1PHUv0b6WP1fwt+9PUA/bmEBSxc4yk7d1BjWvr6VYVRf5xDJbLLeT9H6Pu2A2rC5x/Y
 uSxm70IomKyPyO6/SztQNW+XhSQKpLeDxkfyOyBAhA2VF594hze+YrquBYAzCykAU77+
 +/Pchq58zRVZXJbqz1Kq48U+LXcYCpagIqddewewspabqt7m/ZcZpGz+pZoF2gqi4hDN
 A6vLmq7UBrki2FgNj6vNfasFv6Tz4mbm24U2j5WeUwPGteV2BI1LT4D5JL4mW4oA4ohL
 Rm+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4jBh6uPrBdIEE6og9SOvCW6NJj594jME4C4cARcVqw=;
 b=jJnoR9D8GnnWOlxGhXtWNJpbWOJ5G1kCpMezI9cPXJ1uJbY/Dq+KHXO9+4MUhWUlfH
 c7dcwSE2KXljk3ClEyIZrF4Ou5JDEgDcqqGjRs5grZ1eUOV+GjoKxUOUWQsWSdhuukCi
 brxwFi3UpcaNg8rDR9YQCL2qdM+ME9eHw2tsCmkc6owGKidhrgsxZQy3OKSYmzcj7VBy
 qVtm3xfXW5rULqRNyBZ+31VQqCPCjm/VGrGjBxrDnYyeeJOsBHGfGzw+wrVoS7GvhulW
 TKDX+846QDdPoDCqYbJiEbvCfCZTMOD0uI3sJiJ2W2udKjohYp7psLOGCBo72AuoYN6D
 dDQQ==
X-Gm-Message-State: AOAM531N/7Ad3EZRrXLMED16NRenN6lK/SRqEMIRkiyM8bAfllOy2n9A
 I9dBUGHZg2avzyi4MBHrR//0ys0kD7sbiA==
X-Google-Smtp-Source: ABdhPJz1KZ5S7yCxubaQq2rzU2vYEBRhQKrDYGJ8ubu9yjeruwKO4Cuww8CQSSyDaE4nf9XDM0orMA==
X-Received: by 2002:a63:4f:: with SMTP id 76mr358787pga.457.1632016639784;
 Sat, 18 Sep 2021 18:57:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id k14sm6747899pgg.92.2021.09.18.18.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Sep 2021 18:57:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/25] linux-user: Clean up siginfo_t handling
Date: Sat, 18 Sep 2021 18:56:53 -0700
Message-Id: <20210919015718.466207-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210918184527.408540-1-richard.henderson@linaro.org
("linux-user: Streamline handling of SIGSEGV")

which is in turn based on at least 3 other patch sets, so:

  https://gitlab.com/rth7680/qemu/-/commits/tcg-siginfo

Changes since v2:
  * Rebase on top of sigsegv cleanup, which eliminates about
    half of the places that needed updating to force_sig_fault.
  * target/mips cleanups+fixes for EXCP_BREAK and EXCP_TRAP.


r~


Peter Maydell (2):
  linux-user/arm: Use force_sig_fault()
  linux-user/aarch64: Use force_sig_fault()

Richard Henderson (23):
  linux-user/alpha: Set TRAP_UNK for bugchk and unknown gentrap
  linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
  linux-user/alpha: Use force_sig_fault
  linux-user/cris: Use force_sig_fault
  linux-user/hppa: Use force_sig_fault
  linux-user/hppa: Use the proper si_code for PRIV_OPR, PRIV_REG,
    OVERFLOW
  linux-user/hppa: Set FPE_CONDTRAP for COND
  linux-user/i386: Split out maybe_handle_vm86_trap
  linux-user/i386: Use force_sig, force_sig_fault
  linux-user/m68k: Use force_sig_fault
  linux-user/microblaze: Use force_sig_fault
  linux-user/microblaze: Fix SIGFPE si_codes
  linux-user/mips: Improve do_break
  linux-user/mips: Use force_sig_fault
  target/mips: Extract break code into env->error_code
  target/mips: Extract trap code into env->error_code
  linux-user/openrisc: Use force_sig_fault
  linux-user/ppc: Use force_sig_fault
  linux-user/riscv: Use force_sig_fault
  linux-user/s390x: Use force_sig_fault
  linux-user/sh4: Use force_sig_fault
  linux-user/sparc: Use force_sig_fault
  linux-user/xtensa: Use force_sig_fault

 linux-user/syscall_defs.h                 |   2 +
 target/mips/tcg/translate.h               |   1 +
 linux-user/aarch64/cpu_loop.c             |  34 ++---
 linux-user/alpha/cpu_loop.c               |  69 +++------
 linux-user/arm/cpu_loop.c                 |  53 ++-----
 linux-user/cris/cpu_loop.c                |  13 +-
 linux-user/hppa/cpu_loop.c                |  34 ++---
 linux-user/i386/cpu_loop.c                |  79 +++++-----
 linux-user/m68k/cpu_loop.c                |  26 +---
 linux-user/microblaze/cpu_loop.c          |  73 +++++-----
 linux-user/mips/cpu_loop.c                | 167 +++++-----------------
 linux-user/openrisc/cpu_loop.c            |  18 +--
 linux-user/ppc/cpu_loop.c                 | 146 +++++--------------
 linux-user/riscv/cpu_loop.c               |  32 +----
 linux-user/s390x/cpu_loop.c               |   7 +-
 linux-user/sh4/cpu_loop.c                 |   8 +-
 linux-user/sparc/cpu_loop.c               |  15 +-
 linux-user/xtensa/cpu_loop.c              |  28 ++--
 target/mips/tcg/translate.c               |  36 ++++-
 target/mips/tcg/micromips_translate.c.inc |  10 +-
 target/mips/tcg/mips16e_translate.c.inc   |   2 +-
 target/mips/tcg/nanomips_translate.c.inc  |   4 +-
 22 files changed, 279 insertions(+), 578 deletions(-)

-- 
2.25.1


