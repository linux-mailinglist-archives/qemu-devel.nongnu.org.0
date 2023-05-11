Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7B6FED74
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 10:06:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px1IY-0006KF-An; Thu, 11 May 2023 04:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IG-0006I8-PK
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1px1IE-0000w2-LC
 for qemu-devel@nongnu.org; Thu, 11 May 2023 04:04:56 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-50db91640d3so4747579a12.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 01:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683792293; x=1686384293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=7rDL/CU9y6Iqd3bd8Za78RbSKjZBquUoxTz8vkdZ9Nc=;
 b=ivQQ9CxkvANMcMOxsTNcNaWwnqx9pfDoa3C/UUII4/g4hZRMnldQQ4p0v5AdK/ACcF
 /18oJwGrC3M4rim9kZE6rIO/R5XHYMQcIXccdCwRKfcKkXkImh/upCcHwSjsgPWd78ac
 4hIsxxVfpzquqADvKC03JoPx0Q9j/2kEO2GC4HTjQdNKoiL30gxlM3vl0iYC2ITdjoXa
 GIXP9DaVKq9nFWpejVIDqhAd1lEL0ncQy9YtyRywku8NRXcOSW15p0q2pHOpUdAsPrAT
 a7iJNxltFDWLlrLVBdiDimrwcPle/z4dIP138ekyQMOdOtCi5XOvwvl1yx8biL9pxDEt
 yd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683792293; x=1686384293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7rDL/CU9y6Iqd3bd8Za78RbSKjZBquUoxTz8vkdZ9Nc=;
 b=ORis0FGv8if1bI2tmHbgAawgtgMJDhyrlISAWcIaMqJm4qsxoWoV69ey1Au2fNX76a
 fskPSJSsNpPow2H3H8hzSDMgAYWsPdi7R2ULPGuy5x5B9zQiw9hQrec3RWh9UfTupc7W
 yd0ex7ECnE356/44NDxnyDoLD075d7KirztsVr5r18bOI71YG3zkOBWyz2+q38HCo80N
 doZaDtxuHZXjwdaLkO/pXntIoUHfE2+GJOHH6HC/ELZykkaQxn8go3cCUbZZli+TQDrU
 Hkd7Yz2/hdrrMYP4oTkGWsGyLFfg0Am7QzeMsN8Rzm8mcIc1qNk32DnkpNfW/YJlFq8h
 7WTw==
X-Gm-Message-State: AC+VfDy8zUHFdQyDt8ku+YPChawhOxwEZ/8pHboSUF9RxIBkVtcoKwuB
 m/vLRLw2XXHx7/796kQhfRmeShFTu7PD0NBmzBwRwg==
X-Google-Smtp-Source: ACHHUZ5ofgWtyFaZk8qEuVWDPH/m4rwBKR1N5KnBPHhhHnKWosuplbeLj+p4FwFWUTN0fVE0/+CKNw==
X-Received: by 2002:aa7:d549:0:b0:50b:f847:b3c3 with SMTP id
 u9-20020aa7d549000000b0050bf847b3c3mr15296032edr.5.1683792292845; 
 Thu, 11 May 2023 01:04:52 -0700 (PDT)
Received: from stoup.. ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7c70c000000b0050bd7267a5csm2662095edq.58.2023.05.11.01.04.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 01:04:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/53] tcg patch queue
Date: Thu, 11 May 2023 09:03:57 +0100
Message-Id: <20230511080450.860923-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit d530697ca20e19f7a626f4c1c8b26fccd0dc4470:

  Merge tag 'pull-testing-updates-100523-1' of https://gitlab.com/stsquad/qemu into staging (2023-05-10 16:43:01 +0100)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230511

for you to fetch changes up to b2d4d6616c22325dff802e0a35092167f2dc2268:

  target/loongarch: Do not include tcg-ldst.h (2023-05-11 06:06:04 +0100)

----------------------------------------------------------------
target/m68k: Fix gen_load_fp regression
accel/tcg: Ensure fairness with icount
disas: Move disas.c into the target-independent source sets
tcg: Use common routines for calling slow path helpers
tcg/*: Cleanups to qemu_ld/st constraints
tcg: Remove TARGET_ALIGNED_ONLY
accel/tcg: Reorg system mode load/store helpers

----------------------------------------------------------------
Jamie Iles (2):
      cpu: expose qemu_cpu_list_lock for lock-guard use
      accel/tcg/tcg-accel-ops-rr: ensure fairness with icount

Richard Henderson (49):
      target/m68k: Fix gen_load_fp for OS_LONG
      accel/tcg: Fix atomic_mmu_lookup for reads
      disas: Fix tabs and braces in disas.c
      disas: Move disas.c to disas/
      disas: Remove target_ulong from the interface
      disas: Remove target-specific headers
      tcg/i386: Introduce prepare_host_addr
      tcg/i386: Use indexed addressing for softmmu fast path
      tcg/aarch64: Introduce prepare_host_addr
      tcg/arm: Introduce prepare_host_addr
      tcg/loongarch64: Introduce prepare_host_addr
      tcg/mips: Introduce prepare_host_addr
      tcg/ppc: Introduce prepare_host_addr
      tcg/riscv: Introduce prepare_host_addr
      tcg/s390x: Introduce prepare_host_addr
      tcg: Add routines for calling slow-path helpers
      tcg/i386: Convert tcg_out_qemu_ld_slow_path
      tcg/i386: Convert tcg_out_qemu_st_slow_path
      tcg/aarch64: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/arm: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/loongarch64: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/mips: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/ppc: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/riscv: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/s390x: Convert tcg_out_qemu_{ld,st}_slow_path
      tcg/loongarch64: Simplify constraints on qemu_ld/st
      tcg/mips: Remove MO_BSWAP handling
      tcg/mips: Reorg tlb load within prepare_host_addr
      tcg/mips: Simplify constraints on qemu_ld/st
      tcg/ppc: Reorg tcg_out_tlb_read
      tcg/ppc: Adjust constraints on qemu_ld/st
      tcg/ppc: Remove unused constraints A, B, C, D
      tcg/ppc: Remove unused constraint J
      tcg/riscv: Simplify constraints on qemu_ld/st
      tcg/s390x: Use ALGFR in constructing softmmu host address
      tcg/s390x: Simplify constraints on qemu_ld/st
      target/mips: Add MO_ALIGN to gen_llwp, gen_scwp
      target/mips: Add missing default_tcg_memop_mask
      target/mips: Use MO_ALIGN instead of 0
      target/mips: Remove TARGET_ALIGNED_ONLY
      target/nios2: Remove TARGET_ALIGNED_ONLY
      target/sh4: Use MO_ALIGN where required
      target/sh4: Remove TARGET_ALIGNED_ONLY
      tcg: Remove TARGET_ALIGNED_ONLY
      accel/tcg: Add cpu_in_serial_context
      accel/tcg: Introduce tlb_read_idx
      accel/tcg: Reorg system mode load helpers
      accel/tcg: Reorg system mode store helpers
      target/loongarch: Do not include tcg-ldst.h

Thomas Huth (2):
      disas: Move softmmu specific code to separate file
      disas: Move disas.c into the target-independent source set

 configs/targets/mips-linux-user.mak       |    1 -
 configs/targets/mips-softmmu.mak          |    1 -
 configs/targets/mips64-linux-user.mak     |    1 -
 configs/targets/mips64-softmmu.mak        |    1 -
 configs/targets/mips64el-linux-user.mak   |    1 -
 configs/targets/mips64el-softmmu.mak      |    1 -
 configs/targets/mipsel-linux-user.mak     |    1 -
 configs/targets/mipsel-softmmu.mak        |    1 -
 configs/targets/mipsn32-linux-user.mak    |    1 -
 configs/targets/mipsn32el-linux-user.mak  |    1 -
 configs/targets/nios2-softmmu.mak         |    1 -
 configs/targets/sh4-linux-user.mak        |    1 -
 configs/targets/sh4-softmmu.mak           |    1 -
 configs/targets/sh4eb-linux-user.mak      |    1 -
 configs/targets/sh4eb-softmmu.mak         |    1 -
 meson.build                               |    3 -
 accel/tcg/internal.h                      |    9 +
 accel/tcg/tcg-accel-ops-icount.h          |    3 +-
 disas/disas-internal.h                    |   21 +
 include/disas/disas.h                     |   23 +-
 include/exec/cpu-common.h                 |    1 +
 include/exec/cpu-defs.h                   |    7 +-
 include/exec/cpu_ldst.h                   |   26 +-
 include/exec/memop.h                      |   13 +-
 include/exec/poison.h                     |    1 -
 tcg/loongarch64/tcg-target-con-set.h      |    2 -
 tcg/loongarch64/tcg-target-con-str.h      |    1 -
 tcg/mips/tcg-target-con-set.h             |   13 +-
 tcg/mips/tcg-target-con-str.h             |    2 -
 tcg/mips/tcg-target.h                     |    4 +-
 tcg/ppc/tcg-target-con-set.h              |   11 +-
 tcg/ppc/tcg-target-con-str.h              |    7 -
 tcg/riscv/tcg-target-con-set.h            |    2 -
 tcg/riscv/tcg-target-con-str.h            |    1 -
 tcg/s390x/tcg-target-con-set.h            |    2 -
 tcg/s390x/tcg-target-con-str.h            |    1 -
 accel/tcg/cpu-exec-common.c               |    3 +
 accel/tcg/cputlb.c                        | 1113 ++++++++++++++++-------------
 accel/tcg/tb-maint.c                      |    2 +-
 accel/tcg/tcg-accel-ops-icount.c          |   21 +-
 accel/tcg/tcg-accel-ops-rr.c              |   37 +-
 bsd-user/elfload.c                        |    5 +-
 cpus-common.c                             |    2 +-
 disas/disas-mon.c                         |   65 ++
 disas.c => disas/disas.c                  |  109 +--
 linux-user/elfload.c                      |   18 +-
 migration/dirtyrate.c                     |   26 +-
 replay/replay.c                           |    3 +-
 target/loongarch/csr_helper.c             |    1 -
 target/loongarch/iocsr_helper.c           |    1 -
 target/m68k/translate.c                   |    1 +
 target/mips/tcg/mxu_translate.c           |    3 +-
 target/nios2/translate.c                  |   10 +
 target/sh4/translate.c                    |  102 ++-
 tcg/tcg.c                                 |  480 ++++++++++++-
 trace/control-target.c                    |    9 +-
 target/mips/tcg/micromips_translate.c.inc |   24 +-
 target/mips/tcg/mips16e_translate.c.inc   |   18 +-
 target/mips/tcg/nanomips_translate.c.inc  |   32 +-
 tcg/aarch64/tcg-target.c.inc              |  347 ++++-----
 tcg/arm/tcg-target.c.inc                  |  455 +++++-------
 tcg/i386/tcg-target.c.inc                 |  453 +++++-------
 tcg/loongarch64/tcg-target.c.inc          |  313 +++-----
 tcg/mips/tcg-target.c.inc                 |  870 +++++++---------------
 tcg/ppc/tcg-target.c.inc                  |  512 ++++++-------
 tcg/riscv/tcg-target.c.inc                |  304 ++++----
 tcg/s390x/tcg-target.c.inc                |  314 ++++----
 disas/meson.build                         |    6 +-
 68 files changed, 2788 insertions(+), 3039 deletions(-)
 create mode 100644 disas/disas-internal.h
 create mode 100644 disas/disas-mon.c
 rename disas.c => disas/disas.c (79%)

