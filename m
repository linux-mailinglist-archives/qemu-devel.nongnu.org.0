Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1F3B93F1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:29:49 +0200 (CEST)
Received: from localhost ([::1]:46830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyydQ-0004c8-HC
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZb-0004PU-VV
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:53 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:44760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZS-00088a-6v
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:25:51 -0400
Received: by mail-pg1-x529.google.com with SMTP id u14so6384894pga.11
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nIG5skwsoJ2VOn6EzUyN/5n06c8nQn3a2NDT4nud5s=;
 b=uzTrvguYzntiSxEUzcMvkXFRQlNxmW7OY7aWQBA05h1xW53+UHESb1mcZyhLkxav20
 WQLc6Am/ThYErCMqj6WSG14e3cEIuxCEoJsMGkByHWqwTUryTaADo+s105mmvWYanRmu
 tK6+7ZxiAEJca2IFttkZvWHyN4fsoYX1gGWm8F7bZsIpe9yGaQJn3jQ2Mw5Xjp88kmPH
 509ldkjRdhmulfncfE0olQr2Y+lZOHpaTpIm6RiVNcmsEYioDQ4Pm72fO9ImK7oQmlfI
 M0rS0Ni1KHDCxtizpJOyoz337WSxq1UGGfS7KUUDpvlDLw7zHoM3MgGMvAjsnevf3FdQ
 rsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1nIG5skwsoJ2VOn6EzUyN/5n06c8nQn3a2NDT4nud5s=;
 b=foeAziRwuEXO7mXyWmPK8UTXB/nY+0jb/NCfny0cxN/ykR7WIXEPKXQaNV+4K5H23y
 aE56r+BORKToK6IfNZTXlca5A2voe3UORxRnSo4ftFTemDLIpLav2eDDN+Cb607DjuwI
 octCmAJ+0UB/jV/OpF6KqRMYqJL+CB5sBqgamQ9rAdExXMluP44VjiDEGVVS8RaQ1f6D
 fIZeryUxVse0GavfNOEsDSO2BPaH7XZn+Oi6nl2ocHWqa7uH/k7gMUzdX9szkfcK1rBb
 0gHUsKtAaGv6lLGkAgagnH7HhfgV4CQ0kMDk7fmtTM0A5+2hwVXO3V91AXtSUyJdnEKS
 N0AQ==
X-Gm-Message-State: AOAM532nzN5Yth1ZTMrgv/HUBkwbnCP/HyOyKnForHJBFKROWeRHbxGm
 cK2kvIDNe5T22EE8rm8JJAxllTnwYMP+CA==
X-Google-Smtp-Source: ABdhPJxFWPs3HIf0CgTJQZE8HsD9By7RKTJ/6log9aVXfx/b2dc58A6kt20s14xYhFVwyIH2Xrb+7w==
X-Received: by 2002:a63:48f:: with SMTP id 137mr146175pge.257.1625153138905;
 Thu, 01 Jul 2021 08:25:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/17] tcg: breakpoint reorg
Date: Thu,  1 Jul 2021 08:25:20 -0700
Message-Id: <20210701152537.3330420-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210630183226.3290849-1-richard.henderson@linaro.org>
("[PATCH v2 00/28] accel/tcg: Introduce translator_use_goto_tb")

This is my attempt at fixing #404 ("windows xp boot takes much longer...").

I don't actually have windows xp available myself, so I don't know
if this has worked, really.  I can still boot windows 7, but from
the lack of tracepoint firings I guess it doesn't play any silly
games with breakpoints.

This scheme is not without its drawbacks.  In exchange for no bookkeeping
and invalidation whatsoever, other code on the same page as an active
breakpoint runs one insn per tb, doing indirect chaining through
helper_lookup_tb_ptr to see if we hit the breakpoint.

The minor testing that I did seemed fast enough though, with gdb
responding quickly.  So before I go off and try to complicate
things again with extra bookkeeping, I thought I'd get some feedback.


r~


Richard Henderson (17):
  target/i386: Use cpu_breakpoint_test in breakpoint_handler
  accel/tcg: Move helper_lookup_tb_ptr to cpu-exec.c
  accel/tcg: Move tb_lookup to cpu-exec.c
  accel/tcg: Split out log_cpu_exec
  accel/tcg: Log tb->cflags with -d exec
  tcg: Remove TCG_TARGET_HAS_goto_ptr
  accel/tcg: Reduce CF_COUNT_MASK to match TCG_MAX_INSNS
  accel/tcg: Move curr_cflags into cpu-exec.c
  accel/tcg: Add CF_NO_GOTO_TB and CF_NO_GOTO_PTR
  accel/tcg: Drop CF_NO_GOTO_PTR from -d nochain
  accel/tcg: Handle -singlestep in curr_cflags
  accel/tcg: Use CF_NO_GOTO_{TB,PTR} in cpu_exec_step_atomic
  accel/tcg: Move cflags lookup into tb_find
  accel/tcg: Adjust interface of TranslatorOps.breakpoint_check
  accel/tcg: Hoist tb_cflags to a local in translator_loop
  accel/tcg: Encode breakpoint info into tb->cflags
  cpu: Add breakpoint tracepoints

 accel/tcg/tb-lookup.h               |  49 ------
 include/exec/exec-all.h             |  30 ++--
 include/exec/translator.h           |  17 +-
 include/tcg/tcg-opc.h               |   3 +-
 tcg/aarch64/tcg-target.h            |   1 -
 tcg/arm/tcg-target.h                |   1 -
 tcg/i386/tcg-target.h               |   1 -
 tcg/mips/tcg-target.h               |   1 -
 tcg/ppc/tcg-target.h                |   1 -
 tcg/riscv/tcg-target.h              |   1 -
 tcg/s390/tcg-target.h               |   1 -
 tcg/sparc/tcg-target.h              |   1 -
 tcg/tci/tcg-target.h                |   1 -
 accel/tcg/cpu-exec.c                | 238 +++++++++++++++++++++++-----
 accel/tcg/tcg-runtime.c             |  22 ---
 accel/tcg/translate-all.c           |   7 +-
 accel/tcg/translator.c              |  79 ++++++---
 cpu.c                               |  35 +---
 target/alpha/translate.c            |  12 +-
 target/arm/translate-a64.c          |  14 +-
 target/arm/translate.c              |  20 +--
 target/avr/translate.c              |   6 +-
 target/cris/translate.c             |  14 +-
 target/hexagon/translate.c          |  13 +-
 target/hppa/translate.c             |   7 +-
 target/i386/tcg/sysemu/bpt_helper.c |  12 +-
 target/i386/tcg/translate.c         |  15 +-
 target/m68k/translate.c             |  14 +-
 target/microblaze/translate.c       |  14 +-
 target/mips/tcg/translate.c         |  14 +-
 target/nios2/translate.c            |  13 +-
 target/openrisc/translate.c         |  11 +-
 target/ppc/translate.c              |  13 +-
 target/riscv/translate.c            |  11 +-
 target/rx/translate.c               |   8 +-
 target/s390x/translate.c            |  12 +-
 target/sh4/translate.c              |  12 +-
 target/sparc/translate.c            |   9 +-
 target/tricore/translate.c          |  13 +-
 target/xtensa/translate.c           |  12 +-
 tcg/tcg-op.c                        |  28 ++--
 tcg/tcg.c                           |   8 +-
 trace-events                        |   5 +
 43 files changed, 386 insertions(+), 413 deletions(-)
 delete mode 100644 accel/tcg/tb-lookup.h

-- 
2.25.1


