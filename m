Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE29409F7C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 00:11:03 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPuAI-0008D1-Pk
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 18:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5O-0001o5-Ga
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:06:00 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:42596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPu5M-0007LD-I2
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 18:05:58 -0400
Received: by mail-pf1-x435.google.com with SMTP id 18so10165463pfh.9
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXqswQXiT92NbddBCeyWIbWveAakpbNjptnTmhnToVY=;
 b=S3JN/J3Ov24PXkWPoO4Moomfucrt4ryW8CjH6HszaeDckP6uXpg709UMOVlzvV5hOA
 fWjAdkF8v7933V2SBI6rsLLBmY39RHoQMMDA86rNm40pWjbUNmQ+ysfe7WVVzC/b8Gp0
 oQPyT7qCT2cq2GJVxhDMBc9geO+c2q0oWwcyRvDNS74FhhfmicglWnDvPE/TaNGiS+BP
 cpb5Mn+DtXRl91y2SN0YUPQUOmayN15B62dDo/mH7fSH9+8LSCRa8+/wTiLRZhpqpSEH
 nx3COI3RBM0SQfHWhFYPgCZB1e7F7LbyDh7GoouT8v7YmpmwLOI1Elfmie1VGWgHKhRd
 4zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXqswQXiT92NbddBCeyWIbWveAakpbNjptnTmhnToVY=;
 b=aKzJo1Fa+BBS4NqnJ5h4BRMDDRv34DDZxgBCj4Dd0DxEMIYc4pEt76ilzb8wLtaL+w
 ZuSyYXXnLvEMDgP7iVCkf7LS7CDpFYHA3+S/3pQbS+YdREUHEn8TWamOeCul81j8ClbU
 AL7wQ+o9UdACs+M7ZNBoEeK3lYuKZ4EXlxyzNsOVAHA8qX1guFUw3d7DjjAi/9whCNtH
 XoLoAevMpKOL0A+xNkiZ0AnYxKB7rarT/UDgREabXnruT4H1WV7z8Uyjjq2eUVRw+ASs
 3oEkz/43CP2n2Ww8304McZIpnhXVlrWCTEcpUGGc7WLCsTACoH+Q6I7o5eYRJagg/59k
 PMJg==
X-Gm-Message-State: AOAM531dwpw4z4xoMlacVj3endvwssBJx+7LtNhcZ2fhYioF00CFEf5x
 Eq1uL7rPzOgso+h6hBxp5J6hbzpnABw36A==
X-Google-Smtp-Source: ABdhPJznzDygS1bytB+JfzO4Y8Qrr0WBdLtMIUzrz41Y6P9z0oLQdC9ai4CobAmRitVsprJpoXUSIg==
X-Received: by 2002:a62:7b0e:0:b0:43d:dbad:a09 with SMTP id
 w14-20020a627b0e000000b0043ddbad0a09mr1479968pfc.51.1631570754547; 
 Mon, 13 Sep 2021 15:05:54 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 17sm7721404pfx.167.2021.09.13.15.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 15:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/7] linux-user: Streamline handling of SIGSEGV/SIGBUS
Date: Mon, 13 Sep 2021 15:05:45 -0700
Message-Id: <20210913220552.604064-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu, imp@bsdimp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our current setup is:

  host_signal_handler
  cpu_signal_handler
     handle_cpu_signal
        cc->tcg_ops->tlb_fill
           raise_exception
  cpu_loop
     queue_signal

and in the process lose information from the host siginfo_t,
which we (mostly) do not recreate properly.  Moreover, the
intermediate cpu_signal_handler handles the host-specific
portions of extracting pc + is_write from the ucontext_t.

I'm replacing this with

  host_signal_handler
    host_signal_pc
    host_sigsegv_write
    adjust_signal_pc
    handle_sigsegv_accerr_write
    queue_signal
    raise_exception
  cpu_loop

All of the really tcg-specific portions are still in user-exec.c,
and all of the really host-specific portions are now ditributed
across linux-user/host/<arch>/.  Importantly, SEGV_MAPERR and
SEGV_ACCERR are now passed through from the host kernel -- or at
least there's a single place from which to manage it [1].

Note that I've dropped all of the BSD (and Solaris!) code from
user-exec.c.  I thought about moving it similar to linux-user,
but I've caught Warner in the middle of his re-org and the whole
of bsd-user/signal.c is currently empty.  I think it will be
easier to create the new interfaces from scratch when ready.

Still to-do:
  * Make cc->tcg_ops->tlb_fill sysemu only (once again).
  * Drop all of the code from cpu_loop that interfaced with tlb_fill.


r~


[1] I've just this minute realized that the reserved_va mapping that we
do for emulating 32-bit guests will incorrectly give SEGV_ACCERR for pages
that are not mapped by the guest, and should result in SEGV_MAPERR.


Richard Henderson (7):
  include/exec: Move cpu_signal_handler declaration
  accel/tcg: Split out adjust_signal_pc
  accel/tcg: Split out handle_sigsegv_accerr_write
  accel/tcg: Move clear_helper_retaddr to cpu loop
  accel/tcg: Fold cpu_exit_tb_from_sighandler into caller
  linux-user: Handle SIGSEGV/SIGBUS in host_to_target_siginfo_noswap
  linux-user: Reorg cpu_signal_handler

 include/exec/exec-all.h               |  21 +
 linux-user/host/aarch64/host-signal.h |  73 +++
 linux-user/host/alpha/host-signal.h   |  41 ++
 linux-user/host/arm/host-signal.h     |  30 +
 linux-user/host/i386/host-signal.h    |  24 +
 linux-user/host/mips/host-signal.h    |  61 ++
 linux-user/host/ppc/host-signal.h     |  24 +
 linux-user/host/ppc64/host-signal.h   |   1 +
 linux-user/host/riscv32/host-signal.h |  57 ++
 linux-user/host/riscv64/host-signal.h |   1 +
 linux-user/host/s390/host-signal.h    |  92 +++
 linux-user/host/s390x/host-signal.h   |   1 +
 linux-user/host/sparc/host-signal.h   |  53 ++
 linux-user/host/sparc64/host-signal.h |   1 +
 linux-user/host/x86_64/host-signal.h  |  24 +
 target/alpha/cpu.h                    |   6 -
 target/arm/cpu.h                      |   7 -
 target/avr/cpu.h                      |   2 -
 target/cris/cpu.h                     |   8 -
 target/hexagon/cpu.h                  |   3 -
 target/hppa/cpu.h                     |   3 -
 target/i386/cpu.h                     |   7 -
 target/m68k/cpu.h                     |   8 -
 target/microblaze/cpu.h               |   7 -
 target/mips/cpu.h                     |   3 -
 target/mips/internal.h                |   2 -
 target/nios2/cpu.h                    |   2 -
 target/openrisc/cpu.h                 |   2 -
 target/ppc/cpu.h                      |   7 -
 target/riscv/cpu.h                    |   2 -
 target/rx/cpu.h                       |   4 -
 target/s390x/cpu.h                    |   7 -
 target/sh4/cpu.h                      |   3 -
 target/sparc/cpu.h                    |   2 -
 target/tricore/cpu.h                  |   2 -
 target/xtensa/cpu.h                   |   2 -
 accel/tcg/cpu-exec.c                  |   3 +-
 accel/tcg/user-exec.c                 | 807 ++------------------------
 linux-user/signal.c                   | 102 ++--
 39 files changed, 635 insertions(+), 870 deletions(-)
 create mode 100644 linux-user/host/aarch64/host-signal.h
 create mode 100644 linux-user/host/alpha/host-signal.h
 create mode 100644 linux-user/host/arm/host-signal.h
 create mode 100644 linux-user/host/i386/host-signal.h
 create mode 100644 linux-user/host/mips/host-signal.h
 create mode 100644 linux-user/host/ppc/host-signal.h
 create mode 100644 linux-user/host/ppc64/host-signal.h
 create mode 100644 linux-user/host/riscv32/host-signal.h
 create mode 100644 linux-user/host/riscv64/host-signal.h
 create mode 100644 linux-user/host/s390/host-signal.h
 create mode 100644 linux-user/host/s390x/host-signal.h
 create mode 100644 linux-user/host/sparc/host-signal.h
 create mode 100644 linux-user/host/sparc64/host-signal.h
 create mode 100644 linux-user/host/x86_64/host-signal.h

-- 
2.25.1


