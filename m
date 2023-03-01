Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A56A65DA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 03:57:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCeD-0007s9-1U; Tue, 28 Feb 2023 21:56:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCeA-0007rP-Pv
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:50 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCe8-0002za-Cj
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 21:56:50 -0500
Received: by mail-pj1-x1043.google.com with SMTP id oj5so7939091pjb.5
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 18:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CAMkzkMGA0NdgHeC/uXoF9ZBCIoS1ialTlGWcdjUUjM=;
 b=RWwdV01loSJW5eGxqqZ8CXVn3AWJh6LAbAklQFnR40zk7aT9zqYgq6kkaJE1y/sEok
 frBRExAbxr4MpFsSH+6eiD4UtmOwW5NazxGZJYEaAH92Kibwd6T3AXVOAgA6gCOKP5xW
 i4jOVPgRSfXwD403PYEHSTHMEONW17plUm0kFifpTyN0AtgQSM9f1uyfXjjDo7VrPEwC
 cwswFrdTFdotxzHS50fJn9v4Kn6+LhI9BPEDKC/KuniAHN1hhNIdnKDBvyk09oK49Ldr
 hA4XTqHxRti73/xSPsh5oO+HKv5AsXGQSwaoMtyuLVZSYus+CSHfL6hfFSk7ZY7g7WRF
 e8Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CAMkzkMGA0NdgHeC/uXoF9ZBCIoS1ialTlGWcdjUUjM=;
 b=ZmtSrDZdrE0+SZPTGjecKXIYRtPaPQgkSdGwznR62wvaaS0kD5TVfuproj2hhMb3yf
 qQ+E/etedlCuIVDqDI5LpD4m2Rb5plJXVirUz+qVq/P/0sUpDP29FYgYnuT30K+DRTyc
 udVkDt9rvQ4LPdz7xPuknNBROWQJ2xbxB/bOcjo+SNfby5KFHNclR39EWsukLODQnnPy
 fi/BAE4Yc9hGGSPK/IBFF8rkavonNr7hoCVodqIbVjnQON2aMCdLGtTfIy40HUJY+Xy1
 TkYobLXbg8Yer4aiTUKw+P5XqtVyj7XrAj6CLON3/HQkgw16ZnDqSqj+vasJutYeh+dS
 nkwA==
X-Gm-Message-State: AO0yUKWYFc4CDEmPzkzG83RPG7tmCuxVNqc4KGvi0jC0Y+BBHU8gOm+u
 vNBr6Tc27ywEX+FQyVLRxt+gpFVUWQLFalg1S+NLrQ==
X-Google-Smtp-Source: AK7set9mM0PugEF3dWQLTY33R1wcYOmgSqt+eIsU5uwbZApazv1T5Zuwnx3wUZdc0AAiwHlzfkmoQA==
X-Received: by 2002:a17:902:c1c5:b0:19c:dc38:3eb5 with SMTP id
 c5-20020a170902c1c500b0019cdc383eb5mr4259124plc.14.1677639406639; 
 Tue, 28 Feb 2023 18:56:46 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm7210120plb.235.2023.02.28.18.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 18:56:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 00/62] tcg patch queue
Date: Tue, 28 Feb 2023 16:55:41 -1000
Message-Id: <20230301025643.1227244-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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

The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230228

for you to fetch changes up to c7fbf10db8718d2eba87712bc3410b671157a377:

  tcg: Update docs/devel/tcg-ops.rst for temporary changes (2023-02-28 10:36:19 -1000)

----------------------------------------------------------------
helper-head: Add fpu/softfloat-types.h
softmmu: Use memmove in flatview_write_continue
tcg: Add sign param to probe_access_flags, probe_access_full
tcg: Convert TARGET_TB_PCREL to CF_PCREL
tcg: Simplify temporary lifetimes for translators

----------------------------------------------------------------
Akihiko Odaki (1):
      softmmu: Use memmove in flatview_write_continue

Anton Johansson via (27):
      include/exec: Introduce `CF_PCREL`
      target/i386: set `CF_PCREL` in `x86_cpu_realizefn`
      target/arm: set `CF_PCREL` in `arm_cpu_realizefn`
      accel/tcg: Replace `TARGET_TB_PCREL` with `CF_PCREL`
      include/exec: Replace `TARGET_TB_PCREL` with `CF_PCREL`
      target/arm: Replace `TARGET_TB_PCREL` with `CF_PCREL`
      target/i386: Replace `TARGET_TB_PCREL` with `CF_PCREL`
      include/exec: Remove `TARGET_TB_PCREL` define
      target/arm: Remove `TARGET_TB_PCREL` define
      target/i386: Remove `TARGET_TB_PCREL` define
      accel/tcg: Move jmp-cache `CF_PCREL` checks to caller
      accel/tcg: Replace `tb_pc()` with `tb->pc`
      target/tricore: Replace `tb_pc()` with `tb->pc`
      target/sparc: Replace `tb_pc()` with `tb->pc`
      target/sh4: Replace `tb_pc()` with `tb->pc`
      target/rx: Replace `tb_pc()` with `tb->pc`
      target/riscv: Replace `tb_pc()` with `tb->pc`
      target/openrisc: Replace `tb_pc()` with `tb->pc`
      target/mips: Replace `tb_pc()` with `tb->pc`
      target/microblaze: Replace `tb_pc()` with `tb->pc`
      target/loongarch: Replace `tb_pc()` with `tb->pc`
      target/i386: Replace `tb_pc()` with `tb->pc`
      target/hppa: Replace `tb_pc()` with `tb->pc`
      target/hexagon: Replace `tb_pc()` with `tb->pc`
      target/avr: Replace `tb_pc()` with `tb->pc`
      target/arm: Replace `tb_pc()` with `tb->pc`
      include/exec: Remove `tb_pc()`

Daniel Henrique Barboza (1):
      accel/tcg: Add 'size' param to probe_access_flags()

Philippe Mathieu-Daudé (1):
      exec/helper-head: Include missing "fpu/softfloat-types.h" header

Richard Henderson (32):
      accel/tcg: Add 'size' param to probe_access_full
      tcg: Adjust TCGContext.temps_in_use check
      accel/tcg: Pass max_insn to gen_intermediate_code by pointer
      accel/tcg: Use more accurate max_insns for tb_overflow
      tcg: Remove branch-to-next regardless of reference count
      tcg: Rename TEMP_LOCAL to TEMP_TB
      tcg: Use noinline for major tcg_gen_code subroutines
      tcg: Add liveness_pass_0
      tcg: Remove TEMP_NORMAL
      tcg: Pass TCGTempKind to tcg_temp_new_internal
      tcg: Use tcg_constant_i32 in tcg_gen_io_start
      tcg: Add tcg_gen_movi_ptr
      tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
      tcg: Use tcg_temp_ebb_new_* in tcg/
      tcg: Use tcg_constant_ptr in do_dup
      accel/tcg/plugin: Use tcg_temp_ebb_*
      accel/tcg/plugin: Tidy plugin_gen_disable_mem_helpers
      tcg: Don't re-use TEMP_TB temporaries
      tcg: Change default temp lifetime to TEMP_TB
      target/arm: Drop copies in gen_sve_{ldr,str}
      target/arm: Don't use tcg_temp_local_new_*
      target/cris: Don't use tcg_temp_local_new
      target/hexagon: Don't use tcg_temp_local_new_*
      target/hexagon/idef-parser: Drop gen_tmp_local
      target/hppa: Don't use tcg_temp_local_new
      target/i386: Don't use tcg_temp_local_new
      target/mips: Don't use tcg_temp_local_new
      target/ppc: Don't use tcg_temp_local_new
      target/xtensa: Don't use tcg_temp_local_new_*
      exec/gen-icount: Don't use tcg_temp_local_new_i32
      tcg: Remove tcg_temp_local_new_*, tcg_const_local_*
      tcg: Update docs/devel/tcg-ops.rst for temporary changes

 docs/devel/tcg-ops.rst                      | 230 +++++++++++++----------
 target/hexagon/idef-parser/README.rst       |   4 +-
 accel/tcg/internal.h                        |  10 +-
 accel/tcg/tb-jmp-cache.h                    |  42 +----
 include/exec/cpu-defs.h                     |   3 -
 include/exec/exec-all.h                     |  26 +--
 include/exec/gen-icount.h                   |  12 +-
 include/exec/helper-head.h                  |   2 +
 include/exec/translator.h                   |   4 +-
 include/tcg/tcg-op.h                        |   7 +-
 include/tcg/tcg.h                           |  64 ++++---
 target/arm/cpu-param.h                      |   2 -
 target/arm/tcg/translate-a64.h              |   1 -
 target/arm/tcg/translate.h                  |   2 +-
 target/hexagon/gen_tcg.h                    |   4 +-
 target/i386/cpu-param.h                     |   4 -
 accel/stubs/tcg-stub.c                      |   2 +-
 accel/tcg/cpu-exec.c                        |  62 ++++--
 accel/tcg/cputlb.c                          |  21 ++-
 accel/tcg/perf.c                            |   2 +-
 accel/tcg/plugin-gen.c                      |  32 ++--
 accel/tcg/tb-maint.c                        |  10 +-
 accel/tcg/translate-all.c                   |  18 +-
 accel/tcg/translator.c                      |   6 +-
 accel/tcg/user-exec.c                       |   5 +-
 semihosting/uaccess.c                       |   2 +-
 softmmu/physmem.c                           |   2 +-
 target/alpha/translate.c                    |   2 +-
 target/arm/cpu.c                            |  17 +-
 target/arm/ptw.c                            |   4 +-
 target/arm/tcg/mte_helper.c                 |   4 +-
 target/arm/tcg/sve_helper.c                 |   4 +-
 target/arm/tcg/translate-a64.c              |  16 +-
 target/arm/tcg/translate-sve.c              |  38 +---
 target/arm/tcg/translate.c                  |  14 +-
 target/avr/cpu.c                            |   3 +-
 target/avr/translate.c                      |   2 +-
 target/cris/translate.c                     |   8 +-
 target/hexagon/cpu.c                        |   4 +-
 target/hexagon/genptr.c                     |  16 +-
 target/hexagon/idef-parser/parser-helpers.c |  26 +--
 target/hexagon/translate.c                  |   4 +-
 target/hppa/cpu.c                           |   8 +-
 target/hppa/translate.c                     |   5 +-
 target/i386/cpu.c                           |   5 +
 target/i386/helper.c                        |   2 +-
 target/i386/tcg/sysemu/excp_helper.c        |   4 +-
 target/i386/tcg/tcg-cpu.c                   |   8 +-
 target/i386/tcg/translate.c                 |  55 +++---
 target/loongarch/cpu.c                      |   6 +-
 target/loongarch/translate.c                |   2 +-
 target/m68k/translate.c                     |   2 +-
 target/microblaze/cpu.c                     |   4 +-
 target/microblaze/translate.c               |   2 +-
 target/mips/tcg/exception.c                 |   3 +-
 target/mips/tcg/sysemu/special_helper.c     |   2 +-
 target/mips/tcg/translate.c                 |  59 ++----
 target/nios2/translate.c                    |   2 +-
 target/openrisc/cpu.c                       |   4 +-
 target/openrisc/translate.c                 |   2 +-
 target/ppc/translate.c                      |   8 +-
 target/riscv/cpu.c                          |   7 +-
 target/riscv/translate.c                    |   2 +-
 target/rx/cpu.c                             |   3 +-
 target/rx/translate.c                       |   2 +-
 target/s390x/tcg/mem_helper.c               |   2 +-
 target/s390x/tcg/translate.c                |   2 +-
 target/sh4/cpu.c                            |   6 +-
 target/sh4/translate.c                      |   2 +-
 target/sparc/cpu.c                          |   4 +-
 target/sparc/translate.c                    |   2 +-
 target/tricore/cpu.c                        |   3 +-
 target/tricore/translate.c                  |   2 +-
 target/xtensa/translate.c                   |  18 +-
 tcg/optimize.c                              |   2 +-
 tcg/tcg-op-gvec.c                           | 189 ++++++++++---------
 tcg/tcg-op.c                                | 258 ++++++++++++-------------
 tcg/tcg.c                                   | 280 ++++++++++++++++------------
 target/cris/translate_v10.c.inc             |  10 +-
 target/mips/tcg/nanomips_translate.c.inc    |   4 +-
 target/ppc/translate/spe-impl.c.inc         |   8 +-
 target/ppc/translate/vmx-impl.c.inc         |   4 +-
 target/hexagon/README                       |   8 +-
 target/hexagon/gen_tcg_funcs.py             |  18 +-
 84 files changed, 870 insertions(+), 890 deletions(-)

