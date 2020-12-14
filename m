Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082B2D9968
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:06:52 +0100 (CET)
Received: from localhost ([::1]:45608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kooV0-0003H2-Tt
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRh-0001W9-7i
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:25 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:36948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooRd-0003tZ-Fm
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:24 -0500
Received: by mail-oi1-x232.google.com with SMTP id l207so19265165oib.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0QGB+FhcOAEAJczecxaBIan3P4cKAw5rnKrVmNGtDU=;
 b=jfGeQrSOEyonQvI4PInltQxGxsUvzK5O7vlvk0xWuZYaJG2ckf6yoVXbJRRfKy/dfo
 8e34ZqV7CZbP0+M7uZ/AJ8pvoakoZlkyIlWduqNzL6AiyhOfG8k5O6BuxhUPEF0VYySz
 QQsqIiACkyV2RnvgSeViw6TmRAmGspWwg0WlEn9JU4exgIuwq/9X//8nJWfSPZFM8j+g
 JOFml3DKG+vxDpuCarqmfVduyax5AbqdlVcT0vRIPgZ+fsE2IDwcQ/pGHrM6bZtoumcm
 cG//KmYqj2MNpebleJr1v7JpUfvF3RwLfOZTbj7gTcE9/1d0WZwAmys7tR/H33uWm8Oq
 dojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L0QGB+FhcOAEAJczecxaBIan3P4cKAw5rnKrVmNGtDU=;
 b=XtH4Yy+YvBZqj6f+e5rkvsj8CCJ1K5YHyVbF+ra9teheaVKXSLFxulugc+KQn7r9An
 elV/wsbA/frdS6Ucl61YdjxLrSmjuM6Lhz2GSfz/EI3SkJgcepVznrBPpNIdO46Sp7+I
 GuskRJbE2y/sntnKDv/QjfK8oaA9gZz/xlTqvaZq/dt2bS1hVdugPHZTdix2jFL8mOVe
 Bx2tc920XaTS+EZc8UwvbpiIrLBOL/thMzijixe3Z3R1L2a84QRZ5saiz1GJxRAZBW1w
 NBrHzfFJL8ZWNKbSxznUVVGZa5TAbjbdgffJAU6Io30X9TVpZlB54gVCWljRyKKyipft
 +xwg==
X-Gm-Message-State: AOAM5335/yY26io5myHYQz2pMd8hJ3Q+ocLkgCMR4Y98gzHO5QH8VEmQ
 zNLbx3VOaYcRdKvPT1wyrnvdbjiZOccP8IYv
X-Google-Smtp-Source: ABdhPJziLJl2ixQSrJ6+VOiTmwiN+BepfLaPAPqgjQ6iL8AZykFlfjwnY/KOc3aYFCJlznbCCN+P4w==
X-Received: by 2002:a05:6808:68a:: with SMTP id
 k10mr18482072oig.55.1607954596788; 
 Mon, 14 Dec 2020 06:03:16 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/43] Mirror map JIT memory for TCG
Date: Mon, 14 Dec 2020 08:02:31 -0600
Message-Id: <20201214140314.18544-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Move flush_icache_range to util/.
    The fixme that I added before to softmmu/physmem.c actually
    happened now that we're building aarch64 xen in gitlab-ci.
  * Fix ifdefs for "Remove TCG_TARGET_SUPPORT_MIRROR".


r~


Richard Henderson (43):
  tcg: Do not flush icache for interpreter
  util: Extract flush_icache_range to cacheflush.c
  util: Enhance flush_icache_range with separate data pointer
  util: Specialize flush_idcache_range for aarch64
  tcg: Move tcg prologue pointer out of TCGContext
  tcg: Move tcg epilogue pointer out of TCGContext
  tcg: Add in_code_gen_buffer
  tcg: Introduce tcg_splitwx_to_{rx,rw}
  tcg: Adjust TCGLabel for const
  tcg: Adjust tcg_out_call for const
  tcg: Adjust tcg_out_label for const
  tcg: Adjust tcg_register_jit for const
  tcg: Adjust tb_target_set_jmp_target for split-wx
  tcg: Make DisasContextBase.tb const
  tcg: Make tb arg to synchronize_from_tb const
  tcg: Use Error with alloc_code_gen_buffer
  tcg: Add --accel tcg,split-wx property
  accel/tcg: Support split-wx for linux with memfd
  accel/tcg: Support split-wx for darwin/iOS with vm_remap
  tcg: Return the TB pointer from the rx region from exit_tb
  tcg/i386: Support split-wx code generation
  tcg/aarch64: Use B not BL for tcg_out_goto_long
  tcg/aarch64: Support split-wx code generation
  disas: Push const down through host disasassembly
  tcg/tci: Push const down through bytecode reading
  tcg: Introduce tcg_tbrel_diff
  tcg/ppc: Use tcg_tbrel_diff
  tcg/ppc: Use tcg_out_mem_long to reset TCG_REG_TB
  tcg/ppc: Support split-wx code generation
  tcg/sparc: Use tcg_tbrel_diff
  tcg/sparc: Support split-wx code generation
  tcg/s390: Use tcg_tbrel_diff
  tcg/s390: Support split-wx code generation
  tcg/riscv: Fix branch range checks
  tcg/riscv: Remove branch-over-branch fallback
  tcg/riscv: Support split-wx code generation
  accel/tcg: Add mips support to alloc_code_gen_buffer_splitwx_memfd
  tcg/mips: Do not assert on relocation overflow
  tcg/mips: Support split-wx code generation
  tcg/arm: Support split-wx code generation
  tcg: Remove TCG_TARGET_SUPPORT_MIRROR
  tcg: Constify tcg_code_gen_epilogue
  tcg: Constify TCGLabelQemuLdst.raddr

 accel/tcg/tcg-runtime.h      |   2 +-
 include/disas/dis-asm.h      |   4 +-
 include/disas/disas.h        |   2 +-
 include/exec/exec-all.h      |   2 +-
 include/exec/gen-icount.h    |   4 +-
 include/exec/log.h           |   2 +-
 include/exec/translator.h    |   2 +-
 include/hw/core/cpu.h        |   3 +-
 include/qemu/cacheflush.h    |  35 ++++
 include/sysemu/tcg.h         |   3 +-
 include/tcg/tcg-op.h         |   2 +-
 include/tcg/tcg.h            |  56 +++++--
 tcg/aarch64/tcg-target.h     |   7 +-
 tcg/arm/tcg-target.h         |   7 +-
 tcg/i386/tcg-target.h        |  10 +-
 tcg/mips/tcg-target.h        |  13 +-
 tcg/ppc/tcg-target.h         |   3 +-
 tcg/riscv/tcg-target.h       |   7 +-
 tcg/s390/tcg-target.h        |  12 +-
 tcg/sparc/tcg-target.h       |  10 +-
 tcg/tci/tcg-target.h         |  10 +-
 accel/tcg/cpu-exec.c         |  41 +++--
 accel/tcg/tcg-all.c          |  26 ++-
 accel/tcg/tcg-runtime.c      |   4 +-
 accel/tcg/translate-all.c    | 309 +++++++++++++++++++++++++++--------
 accel/tcg/translator.c       |   4 +-
 bsd-user/main.c              |   2 +-
 disas.c                      |   2 +-
 disas/capstone.c             |   2 +-
 linux-user/main.c            |   2 +-
 softmmu/physmem.c            |   3 +-
 target/arm/cpu.c             |   3 +-
 target/arm/translate-a64.c   |   2 +-
 target/avr/cpu.c             |   3 +-
 target/hppa/cpu.c            |   3 +-
 target/i386/cpu.c            |   3 +-
 target/microblaze/cpu.c      |   3 +-
 target/mips/cpu.c            |   3 +-
 target/riscv/cpu.c           |   3 +-
 target/rx/cpu.c              |   3 +-
 target/sh4/cpu.c             |   3 +-
 target/sparc/cpu.c           |   3 +-
 target/tricore/cpu.c         |   2 +-
 tcg/tcg-op.c                 |  15 +-
 tcg/tcg.c                    |  91 +++++++++--
 tcg/tci.c                    |  60 ++++---
 util/cacheflush.c            | 146 +++++++++++++++++
 util/cacheinfo.c             |   8 +-
 MAINTAINERS                  |   2 +
 accel/tcg/trace-events       |   2 +-
 tcg/aarch64/tcg-target.c.inc |  75 +++++----
 tcg/arm/tcg-target.c.inc     |  41 ++---
 tcg/i386/tcg-target.c.inc    |  36 ++--
 tcg/mips/tcg-target.c.inc    |  97 +++++------
 tcg/ppc/tcg-target.c.inc     | 110 ++++++-------
 tcg/riscv/tcg-target.c.inc   | 125 +++++---------
 tcg/s390/tcg-target.c.inc    |  91 +++++------
 tcg/sparc/tcg-target.c.inc   |  58 +++----
 tcg/tcg-ldst.c.inc           |   2 +-
 tcg/tcg-pool.c.inc           |   6 +-
 tcg/tci/tcg-target.c.inc     |   2 +-
 util/meson.build             |   2 +-
 62 files changed, 1003 insertions(+), 591 deletions(-)
 create mode 100644 include/qemu/cacheflush.h
 create mode 100644 util/cacheflush.c

-- 
2.25.1


