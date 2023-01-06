Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71F565FA1E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:24:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdEq-0003YA-Pl; Thu, 05 Jan 2023 22:18:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDdET-0003R1-SF
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:17:26 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pDdER-00015K-L0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:17:25 -0500
Received: by mail-pl1-x62c.google.com with SMTP id d9so387935pll.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 19:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=10Bj6xu1zSZwE8wJJf84HieJP9AoVAZ80AY7fpAAbP8=;
 b=s13LjAxXNOdr+4P016nneG7afMBvAafISDLcjy5VkO7OOQgK+ALGxH/DRYQE2XSIcc
 r/LNSc/rrJPpVF46P21dEchigFeQoe3EUTp4nntkvGStzKBGTEFXwpSW8H02AczeN9VQ
 Js500q6JPHqFhdRQACIZdBiF7j5bgdy8eG0QY1/p8/UnXsvVza6EFl1UVPFAtFY80/Fm
 21ukXaiGwiWCou2rCS73zIK5TBQtunfnU5OgOqDMpLjw2Cs4wiQy4Wyc9bdZ+9VbEZL+
 5laPqOKtlrA0+cVgI4MtCSy+SXbOGO5aErMCKFckAAh8Kr9TuBjIxsqg91CADz/u/9vg
 e8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10Bj6xu1zSZwE8wJJf84HieJP9AoVAZ80AY7fpAAbP8=;
 b=dEJdxTVEwjSjimEN3/0ur/tjraUCURbiSuGjn9Ay1nlhA04EKvfZ4xQNwUpEwtoHkL
 v4uCU3Afu1DSYof52NvxnuLjwexBbH9eUVwV2OU7b+6i9Zxx2U5ptCTqaEgHUEeVBg7l
 H7tXqECmVlAt1NjBJxYqNmXrb8TTRiAin6T9YHV+0HgI5tDzF5skzC6tT/368dAmZPux
 cevjYisCwXc7pNMB0gW0hgzBwES1Z+y3IZEgO0VXL1JK2sL9MYnl0o3mDt4x7YbTwzLO
 NOZonYr0zLPflN/ETbGL/tOWq4WqkT+vAf5/tF2nrrLcw5c06HQurfh/xWH2XmcmgF08
 8D6Q==
X-Gm-Message-State: AFqh2koYe92RscQr/QYk5kmUmJptEVqWIQGiXevFmqJ+ciyLCs9AWiLs
 luGlBFHoAMkQ5wDU1+lKcie275GJLCVlEEwj
X-Google-Smtp-Source: AMrXdXumoQOS5K4m13/pyNrte82a+CC/lFJkr3Ztg8EhcB2sHNxHcXOIUiI283gbqfeXOvERiRhY5w==
X-Received: by 2002:a17:902:e846:b0:189:f990:24af with SMTP id
 t6-20020a170902e84600b00189f99024afmr79116417plg.20.1672975042048; 
 Thu, 05 Jan 2023 19:17:22 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:2cfd:802:a4a0:c8da])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a170902b18500b00193020e8a90sm1653508plr.294.2023.01.05.19.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 19:17:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL v2 00/47] tcg misc queue
Date: Thu,  5 Jan 2023 19:17:18 -0800
Message-Id: <20230106031720.1204672-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changes in patch 47, to reduce execution time with --enable-debug.
Changes in patch 19, to fix an i386 specific register allocation failure.


r~


The following changes since commit cb9c6a8e5ad6a1f0ce164d352e3102df46986e22:

  .gitlab-ci.d/windows: Work-around timeout and OpenGL problems of the MSYS2 jobs (2023-01-04 18:58:33 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230105

for you to fetch changes up to d4846c33ebe04d2141dcc613b5558d2f1d8077af:

  tests/tcg/multiarch: add vma-pthread.c (2023-01-05 11:41:29 -0800)

----------------------------------------------------------------
Fix race conditions in new user-only vma tracking.
Add tcg backend paired register allocation.
Cleanup tcg backend function call abi.

----------------------------------------------------------------
Ilya Leoshkevich (1):
      tests/tcg/multiarch: add vma-pthread.c

Mark Cave-Ayland (1):
      tcg: convert tcg/README to rst

Philippe Mathieu-Daudé (5):
      tcg/s390x: Fix coding style
      tcg: Massage process_op_defs()
      tcg: Pass number of arguments to tcg_emit_op() / tcg_op_insert_*()
      tcg: Convert typecode_to_ffi from array to function
      tcg: Factor init_ffi_layouts() out of tcg_context_init()

Richard Henderson (40):
      meson: Move CONFIG_TCG_INTERPRETER to config_host
      tcg: Cleanup trailing whitespace
      qemu/main-loop: Introduce QEMU_IOTHREAD_LOCK_GUARD
      hw/mips: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_mips_irq_request
      target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_maybe_interrupt
      target/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in cpu_interrupt_exittb
      target/riscv: Use QEMU_IOTHREAD_LOCK_GUARD in riscv_cpu_update_mip
      hw/ppc: Use QEMU_IOTHREAD_LOCK_GUARD in ppc_set_irq
      accel/tcg: Use QEMU_IOTHREAD_LOCK_GUARD in io_readx/io_writex
      tcg: Tidy tcg_reg_alloc_op
      tcg: Remove TCG_TARGET_STACK_GROWSUP
      tci: MAX_OPC_PARAM_IARGS is no longer used
      tcg: Fix tcg_reg_alloc_dup*
      tcg: Centralize updates to reg_to_temp
      tcg: Remove check_regs
      tcg: Introduce paired register allocation
      accel/tcg: Set cflags_next_tb in cpu_common_initfn
      target/sparc: Avoid TCGV_{LOW,HIGH}
      tcg: Move TCG_{LOW,HIGH} to tcg-internal.h
      tcg: Add temp_subindex to TCGTemp
      tcg: Simplify calls to temp_sync vs mem_coherent
      tcg: Allocate TCGTemp pairs in host memory order
      tcg: Move TCG_TYPE_COUNT outside enum
      tcg: Introduce tcg_type_size
      tcg: Introduce TCGCallReturnKind and TCGCallArgumentKind
      tcg: Replace TCG_TARGET_CALL_ALIGN_ARGS with TCG_TARGET_CALL_ARG_I64
      tcg: Replace TCG_TARGET_EXTEND_ARGS with TCG_TARGET_CALL_ARG_I32
      tcg: Use TCG_CALL_ARG_EVEN for TCI special case
      accel/tcg/plugin: Don't search for the function pointer index
      accel/tcg/plugin: Avoid duplicate copy in copy_call
      accel/tcg/plugin: Use copy_op in append_{udata,mem}_cb
      tcg: Vary the allocation size for TCGOp
      tcg: Use output_pref wrapper function
      tcg: Reorg function calls
      tcg: Move ffi_cif pointer into TCGHelperInfo
      tcg/aarch64: Merge tcg_out_callr into tcg_out_call
      tcg: Add TCGHelperInfo argument to tcg_out_call
      accel/tcg: Fix tb_invalidate_phys_page_unwind
      accel/tcg: Use g_free_rcu for user-exec interval trees
      accel/tcg: Handle false negative lookup in page_check_range

 include/exec/helper-head.h           |    2 +-
 include/qemu/main-loop.h             |   29 +
 include/tcg/tcg-op.h                 |   35 +-
 include/tcg/tcg.h                    |   96 +-
 tcg/aarch64/tcg-target.h             |    4 +-
 tcg/arm/tcg-target.h                 |    4 +-
 tcg/i386/tcg-target.h                |    2 +
 tcg/loongarch64/tcg-target.h         |    3 +-
 tcg/mips/tcg-target.h                |    4 +-
 tcg/riscv/tcg-target.h               |    7 +-
 tcg/s390x/tcg-target.h               |    3 +-
 tcg/sparc64/tcg-target.h             |    3 +-
 tcg/tcg-internal.h                   |   58 +-
 tcg/tci/tcg-target.h                 |    7 +
 tests/tcg/multiarch/nop_func.h       |   25 +
 accel/tcg/cputlb.c                   |   25 +-
 accel/tcg/plugin-gen.c               |   54 +-
 accel/tcg/tb-maint.c                 |   78 +-
 accel/tcg/user-exec.c                |   59 +-
 hw/core/cpu-common.c                 |    1 +
 hw/mips/mips_int.c                   |   11 +-
 hw/ppc/ppc.c                         |   10 +-
 target/ppc/excp_helper.c             |   11 +-
 target/ppc/helper_regs.c             |   14 +-
 target/riscv/cpu_helper.c            |   10 +-
 target/sparc/translate.c             |   21 +-
 tcg/optimize.c                       |   10 +-
 tcg/tcg-op-vec.c                     |   10 +-
 tcg/tcg-op.c                         |   49 +-
 tcg/tcg.c                            | 1663 +++++++++++++++++++++-------------
 tcg/tci.c                            |    1 -
 tests/tcg/multiarch/munmap-pthread.c |   16 +-
 tests/tcg/multiarch/vma-pthread.c    |  207 +++++
 docs/devel/atomics.rst               |    2 +
 docs/devel/index-tcg.rst             |    1 +
 docs/devel/tcg-ops.rst               |  941 +++++++++++++++++++
 docs/devel/tcg.rst                   |    2 +-
 meson.build                          |    4 +-
 tcg/README                           |  784 ----------------
 tcg/aarch64/tcg-target.c.inc         |   19 +-
 tcg/arm/tcg-target.c.inc             |   10 +-
 tcg/i386/tcg-target.c.inc            |    5 +-
 tcg/loongarch64/tcg-target.c.inc     |    7 +-
 tcg/mips/tcg-target.c.inc            |    3 +-
 tcg/ppc/tcg-target.c.inc             |   36 +-
 tcg/riscv/tcg-target.c.inc           |    7 +-
 tcg/s390x/tcg-target.c.inc           |   32 +-
 tcg/sparc64/tcg-target.c.inc         |    3 +-
 tcg/tci/tcg-target.c.inc             |    7 +-
 tests/tcg/multiarch/Makefile.target  |    3 +
 50 files changed, 2635 insertions(+), 1763 deletions(-)
 create mode 100644 tests/tcg/multiarch/nop_func.h
 create mode 100644 tests/tcg/multiarch/vma-pthread.c
 create mode 100644 docs/devel/tcg-ops.rst
 delete mode 100644 tcg/README

