Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 750265F49F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 21:58:09 +0200 (CEST)
Received: from localhost ([::1]:57456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofo3L-0007hc-Rt
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 15:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyA-0001hE-VM
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:47 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofny8-0000F3-Bj
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:52:46 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so1954740pjb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3RBM8NyGboVoRk3jOiO6rEyHjw9N5wA6yHvtDwtV/u0=;
 b=LphNH8qoP8qIsNgKDO/5RN7LcTwq5kkxKR3X3Rjdnh1gs9L9kdr6XGMpTka9ANPqAO
 /pHGj+yTk0dA2yL38QpWAnQ8e3mA1jBceeNWlXnhS/dcsfcFiDKzY0Ft4blT9c6zaf/2
 T3Rs9YiGtzyg29xDmprzagU3duntEsGlp4YdXtPXn8T3Ei8B/K6fvpqvbtYJDjfR3sTF
 UV+Rk7w25kqUsJuYUFIiXYmo/Pc0QpSnKKuJdARdHmeNhz+yqE4wwFXexkNVn820vI/+
 ybF1Q1aVelUNFwuBjgVuuYNW5zQbVH5rUJea86q9jN/OSYD+Afy9MRXIBdVkzxu4yP6I
 ZJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3RBM8NyGboVoRk3jOiO6rEyHjw9N5wA6yHvtDwtV/u0=;
 b=e+uBTjd0MT4bZjYy0ARWxFusDqni4w9Y9NLEYpyGQD8xTAa3TfqTW4vtMVZCWM7rRq
 CWGlBN03Ld4SkGS3eFIG2nAvw4zfrr1AIlvqh/7DwLLmj62hFlVTCsjMZBDfRTJVZyia
 roOHRcLYuDrRIjaakz6pkvKJZkwV9ztAKy0Qb4bzK6VxlPxCTDktynFWHffudj+GN6aW
 Ml+S+lDD/7fHP4Bkt/OoF73hsutTYlP3q1JCLzI1wxpjFM0ZMpPqPJU2ncXzSnnn2801
 WdsNbHW5a1Wtax/sS7kQuiNPhVwsDKkIApQF+GfuD1SWNJzQ3a9eCsOcXywGbbfvF53B
 W3Vg==
X-Gm-Message-State: ACrzQf1EsPKJjHR9sixw+6TB2Vr4GZY6sfYIWIXoO5BEBR/bG5HdoeXm
 xt24H0ZxBE894AVdscvWlCAUgwVxPeUujA==
X-Google-Smtp-Source: AMsMyM6cvYueWbSCGiP4qBhrUgwbzHYnTGuI+/NDiT3hCpE8/id1KwTywKnbzYRY7hHITEea+oqI9g==
X-Received: by 2002:a17:902:8549:b0:178:6399:3e0f with SMTP id
 d9-20020a170902854900b0017863993e0fmr28904950plo.35.1664913162650; 
 Tue, 04 Oct 2022 12:52:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com
Subject: [PULL 00/20] tcg patch queue
Date: Tue,  4 Oct 2022 12:52:21 -0700
Message-Id: <20221004195241.46491-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

TCG patch queue, plus one target/sh4 patch that
Yoshinori Sato asked me to process.


r~


The following changes since commit efbf38d73e5dcc4d5f8b98c6e7a12be1f3b91745:

  Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-10-03 15:06:07 -0400)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20221004

for you to fetch changes up to ab419fd8a035a65942de4e63effcd55ccbf1a9fe:

  target/sh4: Fix TB_FLAG_UNALIGN (2022-10-04 12:33:05 -0700)

----------------------------------------------------------------
Cache CPUClass for use in hot code paths.
Add CPUTLBEntryFull, probe_access_full, tlb_set_page_full.
Add generic support for TARGET_TB_PCREL.
tcg/ppc: Optimize 26-bit jumps using STQ for POWER 2.07
target/sh4: Fix TB_FLAG_UNALIGN

----------------------------------------------------------------
Alex Bennée (3):
      cpu: cache CPUClass in CPUState for hot code paths
      hw/core/cpu-sysemu: used cached class in cpu_asidx_from_attrs
      cputlb: used cached CPUClass in our hot-paths

Leandro Lupori (1):
      tcg/ppc: Optimize 26-bit jumps

Richard Henderson (16):
      accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
      accel/tcg: Drop addr member from SavedIOTLB
      accel/tcg: Suppress auto-invalidate in probe_access_internal
      accel/tcg: Introduce probe_access_full
      accel/tcg: Introduce tlb_set_page_full
      include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
      accel/tcg: Remove PageDesc code_bitmap
      accel/tcg: Use bool for page_find_alloc
      accel/tcg: Use DisasContextBase in plugin_gen_tb_start
      accel/tcg: Do not align tb->page_addr[0]
      accel/tcg: Inline tb_flush_jmp_cache
      include/hw/core: Create struct CPUJumpCache
      hw/core: Add CPUClass.get_pc
      accel/tcg: Introduce tb_pc and log_pc
      accel/tcg: Introduce TARGET_TB_PCREL
      target/sh4: Fix TB_FLAG_UNALIGN

 accel/tcg/internal.h                    |  10 ++
 accel/tcg/tb-hash.h                     |   1 +
 accel/tcg/tb-jmp-cache.h                |  65 ++++++++
 include/exec/cpu-common.h               |   1 +
 include/exec/cpu-defs.h                 |  48 ++++--
 include/exec/exec-all.h                 |  75 ++++++++-
 include/exec/plugin-gen.h               |   7 +-
 include/hw/core/cpu.h                   |  28 ++--
 include/qemu/typedefs.h                 |   2 +
 include/tcg/tcg.h                       |   2 +-
 target/sh4/cpu.h                        |  56 ++++---
 accel/stubs/tcg-stub.c                  |   4 +
 accel/tcg/cpu-exec.c                    |  80 +++++-----
 accel/tcg/cputlb.c                      | 259 ++++++++++++++++++--------------
 accel/tcg/plugin-gen.c                  |  22 +--
 accel/tcg/translate-all.c               | 214 ++++++++++++--------------
 accel/tcg/translator.c                  |   2 +-
 cpu.c                                   |   9 +-
 hw/core/cpu-common.c                    |   3 +-
 hw/core/cpu-sysemu.c                    |   5 +-
 linux-user/sh4/signal.c                 |   6 +-
 plugins/core.c                          |   2 +-
 target/alpha/cpu.c                      |   9 ++
 target/arm/cpu.c                        |  17 ++-
 target/arm/mte_helper.c                 |  14 +-
 target/arm/sve_helper.c                 |   4 +-
 target/arm/translate-a64.c              |   2 +-
 target/avr/cpu.c                        |  10 +-
 target/cris/cpu.c                       |   8 +
 target/hexagon/cpu.c                    |  10 +-
 target/hppa/cpu.c                       |  12 +-
 target/i386/cpu.c                       |   9 ++
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/loongarch/cpu.c                  |  11 +-
 target/m68k/cpu.c                       |   8 +
 target/microblaze/cpu.c                 |  10 +-
 target/mips/cpu.c                       |   8 +
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/nios2/cpu.c                      |   9 ++
 target/openrisc/cpu.c                   |  10 +-
 target/ppc/cpu_init.c                   |   8 +
 target/riscv/cpu.c                      |  17 ++-
 target/rx/cpu.c                         |  10 +-
 target/s390x/cpu.c                      |   8 +
 target/s390x/tcg/mem_helper.c           |   4 -
 target/sh4/cpu.c                        |  18 ++-
 target/sh4/helper.c                     |   6 +-
 target/sh4/translate.c                  |  90 +++++------
 target/sparc/cpu.c                      |  10 +-
 target/tricore/cpu.c                    |  11 +-
 target/xtensa/cpu.c                     |   8 +
 tcg/tcg.c                               |   8 +-
 trace/control-target.c                  |   2 +-
 tcg/ppc/tcg-target.c.inc                | 119 +++++++++++----
 55 files changed, 915 insertions(+), 462 deletions(-)
 create mode 100644 accel/tcg/tb-jmp-cache.h

