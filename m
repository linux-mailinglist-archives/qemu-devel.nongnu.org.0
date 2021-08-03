Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDCB3DE4F4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:16:52 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlrG-0005CM-MC
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpK-0002O9-5Y
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:50 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:52102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpI-0001x0-4S
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:49 -0400
Received: by mail-pj1-x1034.google.com with SMTP id mt6so28090997pjb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bZAionytfgvFaxGDgQ5bCHDuuGJZMTAPOQYZpJtn+qE=;
 b=HY04K7tQCEZtGasNVM6M41yIfZ4uGJgFkqZce3nhg0OCe18Frm0hY1AZs3piNJd2T/
 fdSKmW7zdDXABPT599nhKtRedN1LKDfJnwMDJUM1LY2z80EYgqpoqCqxWLyqDRaEmqEb
 h3jdr/bnh3X9TsaTe5cIcVWlFWaD/otGp0udjqk8+z1uvXw9Ju1usAPkSrKXy0FJrtsq
 bHmnwAd3k8Msi19AsunWyJto/2OYvqeXiNfASbfZB+SyCqmMHWKmvn1x0r6KUfv/id5B
 pHK1pys4qQHVOi/ynEgoEVuH9CxXNjAha0J/EbA4Cqvw8h+F9TDtHJEo0l+rRyEvJkhX
 o19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bZAionytfgvFaxGDgQ5bCHDuuGJZMTAPOQYZpJtn+qE=;
 b=I9YH1KlwJRgyNX5AQyoXdeVGnt8ZTSd+/KiQ3/0ohd09yRvYO0ha0gJky3VA/U6hSh
 oJFRRZsJwBXmXlmxClcGyYwW+Xj5ecCH1DsHmQDZMY6XP9URPJolRUjr/kOQ+vWT0Oen
 jEA3UUxHXwaHG8Edj8Lj2WekbK291rZRed24GOsdoSytQo5oYf/3EK36cWgjHKHXwlfW
 0ywLksOuBB7fIdi78L82AIjm4l4J7oLaRZqzotPTI/KoO3//5Tf335mL0fD74KoRNdk8
 ey/IvYpJJCEMcZWd5GMD7aF+9Ft2ZqSsRqJDi5ctIy1W1p/Jywrv2WQKPTSNwEM99Rf6
 np3g==
X-Gm-Message-State: AOAM531JNpZeOd1jmUYp4jyS1PpSDw0PduYkQIMTXuQAneS0VkU+YlUK
 wx8H7LNBjfiAqvJluW/t3+asjQRzlhdhhw==
X-Google-Smtp-Source: ABdhPJwIaJd26o7tU79m1T/W+8rwTzmG1hnOYyGUN8otqG7d08GkbnahQxvONiWhDWfxRTSubOZmcA==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr21152397pjo.22.1627964086358; 
 Mon, 02 Aug 2021 21:14:46 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/55] Unaligned access for user-only
Date: Mon,  2 Aug 2021 18:13:48 -1000
Message-Id: <20210803041443.55452-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
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

This began with Peter wanting a cpu_ldst.h interface that can handle
alignment info for Arm M-profile system mode, which will also compile
for user-only without ifdefs.  This is patch 32.

Once I had that interface, I thought I might as well enforce the
requested alignment in user-only.  There are plenty of cases where
we ought to have been doing that for quite a while.  This took rather
more work than I imagined to start.

So far only x86 host has been fully converted to handle unaligned
operations in user-only mode.  I'll get to the others later.  But
the added testcase is fairly broad, and caught lots of bugs and/or
missing code between target/ and linux-user/.

Changes for v2:
  * Cleanup prctl(2), add support for prctl(PR_GET/SET_UNALIGN).
  * Adjustments for ppc and sparc reporting address during alignment fault.


r~


Richard Henderson (55):
  hw/core: Make do_unaligned_access noreturn
  hw/core: Make do_unaligned_access available to user-only
  target/alpha: Implement do_unaligned_access for user-only
  target/arm: Implement do_unaligned_access for user-only
  target/hppa: Implement do_unaligned_access for user-only
  target/microblaze: Do not set MO_ALIGN for user-only
  target/mips: Implement do_unaligned_access for user-only
  target/ppc: Move SPR_DSISR setting to powerpc_excp
  target/ppc: Set fault address in ppc_cpu_do_unaligned_access
  target/ppc: Implement do_unaligned_access for user-only
  target/riscv: Implement do_unaligned_access for user-only
  target/s390x: Implement do_unaligned_access for user-only
  target/sh4: Set fault address in superh_cpu_do_unaligned_access
  target/sh4: Implement do_unaligned_access for user-only
  target/sparc: Remove DEBUG_UNALIGNED
  target/sparc: Split out build_sfsr
  target/sparc: Set fault address in sparc_cpu_do_unaligned_access
  target/sparc: Implement do_unaligned_access for user-only
  target/xtensa: Implement do_unaligned_access for user-only
  accel/tcg: Report unaligned atomics for user-only
  accel/tcg: Drop signness in tracing in cputlb.c
  tcg: Expand MO_SIZE to 3 bits
  tcg: Rename TCGMemOpIdx to MemOpIdx
  tcg: Split out MemOpIdx to exec/memopidx.h
  trace/mem: Pass MemOpIdx to trace_mem_get_info
  accel/tcg: Pass MemOpIdx to atomic_trace_*_post
  plugins: Reorg arguments to qemu_plugin_vcpu_mem_cb
  trace: Split guest_mem_before
  target/arm: Use MO_128 for 16 byte atomics
  target/i386: Use MO_128 for 16 byte atomics
  target/ppc: Use MO_128 for 16 byte atomics
  target/s390x: Use MO_128 for 16 byte atomics
  target/hexagon: Implement cpu_mmu_index
  accel/tcg: Add cpu_{ld,st}*_mmu interfaces
  accel/tcg: Move cpu_atomic decls to exec/cpu_ldst.h
  target/mips: Use cpu_*_data_ra for msa load/store
  target/mips: Use 8-byte memory ops for msa load/store
  target/s390x: Use cpu_*_mmu instead of helper_*_mmu
  target/sparc: Use cpu_*_mmu instead of helper_*_mmu
  target/arm: Use cpu_*_mmu instead of helper_*_mmu
  tcg: Move helper_*_mmu decls to tcg/tcg-ldst.h
  tcg: Add helper_unaligned_mmu for user-only sigbus
  tcg/i386: Support raising sigbus for user-only
  tests/tcg/multiarch: Add sigbus.c
  linux-user: Split out do_prctl and subroutines
  linux-user: Disable more prctl subcodes
  hw/core/cpu: Re-sort the non-pointers to the end of CPUClass
  linux-user: Add code for PR_GET/SET_UNALIGN
  hw/core/cpu: Move cpu properties to cpu-sysemu.c
  hw/core/cpu: Add prctl-unalign-sigbus property for user-only
  target/alpha: Reorg fp memory operations
  target/alpha: Reorg integer memory operations
  target/alpha: Implement prctl_unalign_sigbus
  target/hppa: Implement prctl_unalign_sigbus
  target/sh4: Implement prctl_unalign_sigbus

 docs/devel/loads-stores.rst         |  52 +-
 accel/tcg/atomic_template.h         |  73 ++-
 accel/tcg/internal.h                |   4 +
 hw/core/cpu-common.h                |  17 +
 include/exec/cpu_ldst.h             | 332 ++++++-------
 include/exec/memop.h                |  14 +-
 include/exec/memopidx.h             |  55 +++
 include/hw/core/cpu.h               |  14 +-
 include/hw/core/tcg-cpu-ops.h       |  15 +-
 include/qemu/plugin.h               |  26 +-
 include/tcg/tcg-ldst.h              |  79 ++++
 include/tcg/tcg.h                   | 197 +-------
 linux-user/aarch64/target_syscall.h |  23 -
 linux-user/mips/target_syscall.h    |   6 -
 linux-user/mips64/target_syscall.h  |   6 -
 target/alpha/cpu.h                  |   9 +-
 target/arm/internals.h              |   3 +-
 target/hexagon/cpu.h                |   9 +
 target/hppa/cpu.h                   |   5 +-
 target/microblaze/cpu.h             |   2 +-
 target/mips/tcg/tcg-internal.h      |   4 +-
 target/nios2/cpu.h                  |   4 +-
 target/ppc/internal.h               |   4 +-
 target/riscv/cpu.h                  |   2 +-
 target/s390x/s390x-internal.h       |   4 +-
 target/sh4/cpu.h                    |   8 +-
 target/xtensa/cpu.h                 |   4 +-
 tcg/i386/tcg-target.h               |   2 -
 trace/mem.h                         |  63 ---
 accel/tcg/cpu-exec-common.c         |  12 +
 accel/tcg/cputlb.c                  | 495 +++++++------------
 accel/tcg/plugin-gen.c              |   5 +-
 accel/tcg/user-exec.c               | 435 +++++++----------
 hw/core/cpu-common.c                |  18 +-
 hw/core/cpu-sysemu.c                |  24 +
 hw/core/cpu-user.c                  |  37 ++
 linux-user/aarch64/cpu_loop.c       |   4 +
 linux-user/arm/cpu_loop.c           |  43 +-
 linux-user/hppa/cpu_loop.c          |   2 +-
 linux-user/mips/cpu_loop.c          |  20 +-
 linux-user/ppc/cpu_loop.c           |   2 +-
 linux-user/riscv/cpu_loop.c         |   7 +
 linux-user/sh4/cpu_loop.c           |   8 +
 linux-user/sparc/cpu_loop.c         |  11 +
 linux-user/syscall.c                | 709 +++++++++++++++++-----------
 plugins/api.c                       |  19 +-
 plugins/core.c                      |  10 +-
 target/alpha/cpu.c                  |   2 +-
 target/alpha/mem_helper.c           |   8 +-
 target/alpha/translate.c            | 188 ++++----
 target/arm/cpu.c                    |   2 +-
 target/arm/cpu_tcg.c                |   2 +-
 target/arm/helper-a64.c             |  77 +--
 target/arm/m_helper.c               |   8 +-
 target/arm/translate-a64.c          |   2 +-
 target/hppa/cpu.c                   |  16 +-
 target/hppa/translate.c             |  19 +-
 target/i386/tcg/mem_helper.c        |   4 +-
 target/m68k/op_helper.c             |   3 +-
 target/microblaze/translate.c       |  16 +
 target/mips/cpu.c                   |   2 +-
 target/mips/tcg/msa_helper.c        | 395 ++++------------
 target/mips/tcg/op_helper.c         |   3 +-
 target/mips/tcg/user/tlb_helper.c   |  23 +-
 target/ppc/cpu_init.c               |   2 +-
 target/ppc/excp_helper.c            |  35 +-
 target/ppc/mem_helper.c             |   1 -
 target/ppc/translate.c              |  12 +-
 target/riscv/cpu.c                  |   2 +-
 target/riscv/cpu_helper.c           |   8 +-
 target/s390x/cpu.c                  |   2 +-
 target/s390x/tcg/excp_helper.c      |  28 +-
 target/s390x/tcg/mem_helper.c       |  31 +-
 target/sh4/cpu.c                    |   2 +-
 target/sh4/op_helper.c              |   8 +-
 target/sh4/translate.c              |  50 +-
 target/sparc/cpu.c                  |   2 +-
 target/sparc/ldst_helper.c          |  38 +-
 target/sparc/mmu_helper.c           |  92 +++-
 target/xtensa/cpu.c                 |   2 +-
 target/xtensa/helper.c              |  30 +-
 tcg/optimize.c                      |   2 +-
 tcg/tcg-op.c                        |  60 +--
 tcg/tcg.c                           |   3 +-
 tcg/tci.c                           |  15 +-
 tests/tcg/multiarch/sigbus.c        |  68 +++
 accel/tcg/atomic_common.c.inc       |  43 +-
 accel/tcg/ldst_common.c.inc         | 307 ++++++++++++
 target/s390x/tcg/translate_vx.c.inc |   2 +-
 tcg/aarch64/tcg-target.c.inc        |  18 +-
 tcg/arm/tcg-target.c.inc            |  14 +-
 tcg/i386/tcg-target.c.inc           | 128 ++++-
 tcg/mips/tcg-target.c.inc           |  16 +-
 tcg/ppc/tcg-target.c.inc            |  18 +-
 tcg/riscv/tcg-target.c.inc          |  20 +-
 tcg/s390/tcg-target.c.inc           |  14 +-
 tcg/sparc/tcg-target.c.inc          |  20 +-
 tcg/tcg-ldst.c.inc                  |   2 +-
 hw/core/meson.build                 |   4 +
 trace-events                        |  18 +-
 100 files changed, 2549 insertions(+), 2235 deletions(-)
 create mode 100644 hw/core/cpu-common.h
 create mode 100644 include/exec/memopidx.h
 create mode 100644 include/tcg/tcg-ldst.h
 delete mode 100644 trace/mem.h
 create mode 100644 hw/core/cpu-user.c
 create mode 100644 tests/tcg/multiarch/sigbus.c
 create mode 100644 accel/tcg/ldst_common.c.inc

-- 
2.25.1


