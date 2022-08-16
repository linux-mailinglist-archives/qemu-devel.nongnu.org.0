Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A156596411
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 22:59:18 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oO3ed-0003SN-Lr
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 16:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gm-0004oa-Vc
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:38 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:46689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oO3Gd-0004Vs-L7
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 16:34:36 -0400
Received: by mail-oi1-x22e.google.com with SMTP id o184so13277699oif.13
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=G8c2iuTDo4UvuF2iefnqT1KVHhsC+sQtSAyF/QMhIQM=;
 b=w0zIOOHS7ryC5iuQg72ubsMeLLPgjTuOPJ3tFEDfwQ0gavk1eJC5h6KXYzA1Z9RnO4
 tEPS0+udpkEiQL7Nc7k3KbhaPSwAbtFuxu/n8Uieg4uEfru4qO8Ur9/G9iUHvKsniM/C
 P3rLqCU1agm8OMMDBJjcieJj8//JywAe9NbPnZtYA/oPf5VunaMQpAgtxLQUCuZ2pGJ6
 MkWj5lcTgiqi0F9yWU07choNbBVU6dV56MrLbl2kT2HtwQQTDx55wf3SrRHJELLz2WAX
 FART2Hd9BzXN9DJYowsdP6+i5pPMXwqjPbwu9jOQpTEO95tPZ8MgfJ5zjux9/Pv2v/Ov
 TWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=G8c2iuTDo4UvuF2iefnqT1KVHhsC+sQtSAyF/QMhIQM=;
 b=fI26xcHHA2mLPvJ6rBKX9A/8K1OI1RwH7qptqYbpUkvTUgtEC7Wk5uJMnn5+TDdB0D
 PjB3w6LSfRc8rn+fr5x+Y+wp4Jn+cE7Byvk+jLJ6O9+Myk4GXznJi0BOV5/0y12bpJe5
 u3rVecIBsOXbzWFmpQXDlAOOsUnqJWEeJaLyM/1tWCJAbp00rdVuxrlrnoIbdmjJigrB
 XPrMxEXXs9KPb+X5j+ljWtIcizT5x56Tj00QXUYSs+gwFGO/YYsw8Ta/UCfVKFh4a4yY
 2d96XL3U2frXnixAV+1APgktO7SBNXW3xt3UvPexyFlfj+l395QLp5biDv7vkTfnAljp
 Y1hw==
X-Gm-Message-State: ACgBeo3lV46+SHZe01uhljdpDkoJAzKbKJTziIs37s2MvG/SmR2m5kkg
 iUnj/BqwLIUOyYhogn+nyl/KY9HVMxWvWA==
X-Google-Smtp-Source: AA6agR57vG6MWxm9HtEq/26etcPAHY6doS70J5mZFCvIR+qFsBYS7CXodpCUKk45F/ZXRssjwiAnTg==
X-Received: by 2002:aca:6088:0:b0:343:75a6:d6a3 with SMTP id
 u130-20020aca6088000000b0034375a6d6a3mr155569oib.92.1660682045494; 
 Tue, 16 Aug 2022 13:34:05 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 13:34:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 00/33] accel/tcg + target/arm: pc-relative translation
Date: Tue, 16 Aug 2022 15:33:27 -0500
Message-Id: <20220816203400.161187-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Supercedes: 20220812180806.2128593-1-richard.henderson@linaro.org
("accel/tcg: minimize tlb lookups during translate + user-only PROT_EXEC fixes")

A few changes to the PROT_EXEC work that I posted last week, and
then continuing to the main event.

My initial goal was to reduce the overhead of TB flushing, which
Alex Bennee identified as a significant issue with respect to
booting AArch64 kernels under avocado.  Our initial guess was that
we need a more efficient data structure for walking TBs associated
with a physical page.

While I was looking at some of those numbers, I noted that we were
seeing up to 16000 TBs attached to a single page, which is well more
than I expected to see, and means that a new data structure isn't
going to help as much as simply reducing the number of translations.

It turns out the retranslation is due to the guest kernel's userland
address space randomization.  Each process gets e.g. libc mapped to
a different virtual address, which caused a new translation.

This, then, introduces some infrastructure for writing "pc-relative"
translation blocks, in which the guest pc is treated as a variable
just like any other guest cpu register.  The hashing for these TBs
are adjusted to compare the physical address.  The target/arm backend
is adjusted to use the new feature.

This does result in a significant reduction in translation.  From the
BootLinuxAarch64.test_virt_tcg_gicv2 test, at the login prompt:

    Before:

    gen code size       160684739/1073736704
    TB count            289808
    TB flush count      1
    TB invalidate count 235143

    After:

    gen code size       277992547/1073736704
    TB count            503882
    TB flush count      0
    TB invalidate count 69282

Before TARGET_TB_PCREL, we generate approximately 1.1GB of TBs
(overflow 1GB, flush, and fill 153MB again).  Afterward, we only
generate 265MB of TBs.

Surprisingly, this does not affect wall-clock times nearly as
much as I would have expected:

                                       before   after   change
 BootLinuxAarch64.test_virt_tcg_gicv2:  97.35    85.11   -12%
 BootLinuxAarch64.test_virt_tcg_gicv3: 102.75    96.87    -5%

Change in profile, top 10 entries before, matched up with after:

  before                                                           after
   9.01%  qemu-system-aar  [.] helper_lookup_tb_ptr                10.67%
   4.92%  qemu-system-aar  [.] qht_lookup_custom                    5.06%
   4.79%  qemu-system-aar  [.] get_phys_addr_lpae                   5.24%
   2.57%  qemu-system-aar  [.] address_space_ldq_le                 2.77%
   2.33%  qemu-system-aar  [.] liveness_pass_1                      0.60%
   2.24%  qemu-system-aar  [.] cpu_get_tb_cpu_state                 2.58%
   1.76%  qemu-system-aar  [.] address_space_translate_internal     1.75%
   1.71%  qemu-system-aar  [.] tb_lookup_cmp                        1.92%
   1.65%  qemu-system-aar  [.] tcg_gen_code                         0.44%
   1.64%  qemu-system-aar  [.] do_tb_phys_invalidate                0.09%


r~


Ilya Leoshkevich (1):
  accel/tcg: Introduce is_same_page()

Richard Henderson (32):
  linux-user/arm: Mark the commpage executable
  linux-user/hppa: Allocate page zero as a commpage
  linux-user/x86_64: Allocate vsyscall page as a commpage
  linux-user: Honor PT_GNU_STACK
  tests/tcg/i386: Move smc_code2 to an executable section
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Make tb_htable_lookup static
  accel/tcg: Move qemu_ram_addr_from_host_nofail to physmem.c
  accel/tcg: Properly implement get_page_addr_code for user-only
  accel/tcg: Use probe_access_internal for softmmu
    get_page_addr_code_hostp
  accel/tcg: Add nofault parameter to get_page_addr_code_hostp
  accel/tcg: Unlock mmap_lock after longjmp
  accel/tcg: Raise PROT_EXEC exception early
  accel/tcg: Remove translator_ldsw
  accel/tcg: Add pc and host_pc params to gen_intermediate_code
  accel/tcg: Add fast path for translator_ld*
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  include/hw/core: Create struct CPUJumpCache
  accel/tcg: Introduce tb_pc and tb_pc_log
  accel/tcg: Introduce TARGET_TB_PCREL
  accel/tcg: Split log_cpu_exec into inline and slow path
  target/arm: Introduce curr_insn_len
  target/arm: Change gen_goto_tb to work on displacements
  target/arm: Change gen_*set_pc_im to gen_*update_pc
  target/arm: Change gen_exception_insn* to work on displacements
  target/arm: Change gen_exception_internal to work on displacements
  target/arm: Change gen_jmp* to work on displacements
  target/arm: Introduce gen_pc_plus_diff for aarch64
  target/arm: Introduce gen_pc_plus_diff for aarch32
  target/arm: Enable TARGET_TB_PCREL

 include/elf.h                           |   1 +
 include/exec/cpu-common.h               |   1 +
 include/exec/cpu-defs.h                 |   3 +
 include/exec/exec-all.h                 | 138 +++++++-------
 include/exec/plugin-gen.h               |   7 +-
 include/exec/translator.h               |  85 +++++++--
 include/hw/core/cpu.h                   |   9 +-
 linux-user/arm/target_cpu.h             |   4 +-
 linux-user/qemu.h                       |   1 +
 target/arm/cpu-param.h                  |   2 +
 target/arm/translate-a32.h              |   2 +-
 target/arm/translate.h                  |  21 ++-
 accel/tcg/cpu-exec.c                    | 222 +++++++++++++---------
 accel/tcg/cputlb.c                      |  98 +++-------
 accel/tcg/plugin-gen.c                  |  23 +--
 accel/tcg/translate-all.c               | 197 +++++++-------------
 accel/tcg/translator.c                  | 122 +++++++++---
 accel/tcg/user-exec.c                   |  15 ++
 linux-user/elfload.c                    |  81 +++++++-
 softmmu/physmem.c                       |  12 ++
 target/alpha/translate.c                |   5 +-
 target/arm/cpu.c                        |  23 +--
 target/arm/translate-a64.c              | 174 ++++++++++-------
 target/arm/translate-m-nocp.c           |   6 +-
 target/arm/translate-mve.c              |   2 +-
 target/arm/translate-vfp.c              |  10 +-
 target/arm/translate.c                  | 237 +++++++++++++++---------
 target/avr/cpu.c                        |   2 +-
 target/avr/translate.c                  |   5 +-
 target/cris/translate.c                 |   5 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hexagon/translate.c              |   6 +-
 target/hppa/cpu.c                       |   4 +-
 target/hppa/translate.c                 |   5 +-
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/i386/tcg/translate.c             |   7 +-
 target/loongarch/cpu.c                  |   2 +-
 target/loongarch/translate.c            |   6 +-
 target/m68k/translate.c                 |   5 +-
 target/microblaze/cpu.c                 |   2 +-
 target/microblaze/translate.c           |   5 +-
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/mips/tcg/translate.c             |   5 +-
 target/nios2/translate.c                |   5 +-
 target/openrisc/cpu.c                   |   2 +-
 target/openrisc/translate.c             |   6 +-
 target/ppc/translate.c                  |   5 +-
 target/riscv/cpu.c                      |   4 +-
 target/riscv/translate.c                |   5 +-
 target/rx/cpu.c                         |   2 +-
 target/rx/translate.c                   |   5 +-
 target/s390x/tcg/translate.c            |   5 +-
 target/sh4/cpu.c                        |   4 +-
 target/sh4/translate.c                  |   5 +-
 target/sparc/cpu.c                      |   2 +-
 target/sparc/translate.c                |   5 +-
 target/tricore/cpu.c                    |   2 +-
 target/tricore/translate.c              |   6 +-
 target/xtensa/translate.c               |   6 +-
 tcg/tcg.c                               |   6 +-
 tests/tcg/i386/test-i386.c              |   2 +-
 62 files changed, 979 insertions(+), 666 deletions(-)

-- 
2.34.1


