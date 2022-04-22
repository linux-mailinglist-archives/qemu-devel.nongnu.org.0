Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FA50BDA9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 18:55:27 +0200 (CEST)
Received: from localhost ([::1]:50986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhwZ3-0002mB-Rp
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 12:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWU-0008RB-BE
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:46 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwWS-0007Cl-AT
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:52:45 -0400
Received: by mail-pg1-x52d.google.com with SMTP id x191so7778667pgd.4
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tP8TUAYTnvt4U/lJPyLM3jYK488cIuSWL5LYLSNVnNY=;
 b=AlGzZmba+xX84Tp1VUo8lhcuXqsR0Z4HTp+FdrzOd2awYYcBOh6o/je24JoFqrLSHy
 SUSmJiTGsQEcCKNLRPeJhJZAnvYxO+WMD/0w1F5Hw6PcBYN+ypIVV9p1u/ieQAqmQFcE
 pAhmBZSsxgJBClMuWVK5pEiNe6q26qLjX51qHPuzvp6qN48tkfbDnA+TBg0XSj5iFmkQ
 LkK922DFRltn8Rm+pv5xHvSnaLmFYxUMX8akiV+4Dyb9yGuaW2X5awpws8VZPe2YQ8kT
 XlvLiXu8QU17483dlGlpir1+eywyH54nCjExg+a2iEhvm9vc6ijHlysC+piOZsQ5hfeE
 Q8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tP8TUAYTnvt4U/lJPyLM3jYK488cIuSWL5LYLSNVnNY=;
 b=hNTnOej5f9VU+pkC8+sYRcBmsI3YrPgS3obDX2fGgRamBAsqUfT4aIJxFN1TAg0+SQ
 llfknJS27Evrq1tPGVoq77Kdksqk0rnHMsPPxb5fllSZTNa2juBkfbAnWrhayRedaR4G
 Y5KnQAk6bR/+SrwG3NhDg9UeShHES+Tf1NN0dEcTk9IIY/UCx2QmUFj3wt9XVmiY0zPB
 E8DrB5U/oK6rPXzf4vOkPzauBMHArvLD4+pz6b9D324ue+f9anNXoqPP7GqQhKAmfOZc
 zX/AGAeYiBxitUsRDKQUcWq6QML3Off965cmDVlPHnCUv6Up+v9h/JisjRl6GTK7Q3L+
 RJlA==
X-Gm-Message-State: AOAM533n03zXIbPMafVWqmpCoSZVqWZalLBcs1UD/LF49+DhwxzRuMv5
 kYNkNi6dKQxeJ2qnK0z7YD0nc60euw0Z/A==
X-Google-Smtp-Source: ABdhPJxm/01JYyDpfk9R6QOHzc297aKkrsoyRC06GHFO7MFTC7cKCWlCx5blqHvf0z3PXdXqxzfc4A==
X-Received: by 2002:a63:5b61:0:b0:39d:2aef:c024 with SMTP id
 l33-20020a635b61000000b0039d2aefc024mr4652322pgm.589.1650646362178; 
 Fri, 22 Apr 2022 09:52:42 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 6-20020a17090a030600b001cd4989ff5fsm6835904pje.38.2022.04.22.09.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:52:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/68] nios2 fixes, cleanups, shadow reg sets
Date: Fri, 22 Apr 2022 09:51:30 -0700
Message-Id: <20220422165238.1971496-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v8:
  * Split one translator patch into 5.
  * Add missing copyright/spdx lines to new tests.

Patches needing review:
  44-target-nios2-Split-out-helpers-for-gen_i_cmpxx.patch
  45-target-nios2-Split-out-helpers-for-gen_i_math_log.patch
  46-target-nios2-Split-out-helpers-for-gen_r_math_log.patch
  47-target-nios2-Split-out-helpers-for-gen_rr_mul_hig.patch
  48-target-nios2-Split-out-helpers-for-gen_rr_shift.patch
  67-tests-tcg-nios2-Add-semihosting-multiarch-tests.patch


r~


Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>


Amir Gonnen (5):
  target/nios2: Check supervisor on eret
  target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
  target/nios2: Split out helper for eret instruction
  hw/intc: Vectored Interrupt Controller (VIC)
  hw/nios2: Machine with a Vectored Interrupt Controller

Richard Henderson (63):
  linux-user/nios2: Hoist pc advance to the top of EXCP_TRAP
  linux-user/nios2: Fix clone child return
  linux-user/nios2: Drop syscall 0 "workaround"
  linux-user/nios2: Adjust error return
  linux-user/nios2: Handle special qemu syscall return values
  linux-user/nios2: Remove do_sigreturn
  linux-user/nios2: Use QEMU_ESIGRETURN from do_rt_sigreturn
  tests/tcg/nios2: Re-enable linux-user tests
  target/nios2: Remove user-only nios2_cpu_do_interrupt
  target/nios2: Remove nios2_cpu_record_sigsegv
  target/nios2: Build helper.c for system only
  linux-user/nios2: Use force_sig_fault for EXCP_DEBUG
  target/nios2: Stop generating code if gen_check_supervisor fails
  target/nios2: Split PC out of env->regs[]
  target/nios2: Fix BRET instruction
  target/nios2: Do not create TCGv for control registers
  linux-user/nios2: Only initialize SP and PC in target_cpu_copy_regs
  target/nios2: Remove cpu_interrupts_enabled
  target/nios2: Split control registers away from general registers
  target/nios2: Clean up nios2_cpu_dump_state
  target/nios2: Use hw/registerfields.h for CR_STATUS fields
  target/nios2: Use hw/registerfields.h for CR_EXCEPTION fields
  target/nios2: Use hw/registerfields.h for CR_TLBADDR fields
  target/nios2: Use hw/registerfields.h for CR_TLBACC fields
  target/nios2: Rename CR_TLBMISC_WR to CR_TLBMISC_WE
  target/nios2: Use hw/registerfields.h for CR_TLBMISC fields
  target/nios2: Move R_FOO and CR_BAR into enumerations
  target/nios2: Create EXCP_SEMIHOST for semi-hosting
  target/nios2: Clean up nios2_cpu_do_interrupt
  target/nios2: Hoist CPU_LOG_INT logging
  target/nios2: Handle EXCP_UNALIGN and EXCP_UNALIGND
  target/nios2: Cleanup set of CR_EXCEPTION for do_interrupt
  target/nios2: Clean up handling of tlbmisc in do_exception
  target/nios2: Prevent writes to read-only or reserved control fields
  target/nios2: Implement cpuid
  target/nios2: Implement CR_STATUS.RSIE
  target/nios2: Remove CPU_INTERRUPT_NMI
  target/nios2: Support division error exception
  target/nios2: Use tcg_constant_tl
  target/nios2: Split out named structs for [IRJ]_TYPE
  target/nios2: Split out helpers for gen_i_cmpxx
  target/nios2: Split out helpers for gen_i_math_logic
  target/nios2: Split out helpers for gen_r_math_logic
  target/nios2: Split out helpers for gen_rr_mul_high
  target/nios2: Split out helpers for gen_rr_shift
  target/nios2: Introduce dest_gpr
  target/nios2: Drop CR_STATUS_EH from tb->flags
  target/nios2: Enable unaligned traps for system mode
  target/nios2: Create gen_jumpr
  target/nios2: Hoist set of is_jmp into gen_goto_tb
  target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
  target/nios2: Use tcg_gen_lookup_and_goto_ptr
  target/nios2: Implement Misaligned destination exception
  target/nios2: Introduce shadow register sets
  target/nios2: Implement rdprs, wrprs
  target/nios2: Update helper_eret for shadow registers
  target/nios2: Implement EIC interrupt processing
  target/nios2: Advance pc when raising exceptions
  linux-user/nios2: Handle various SIGILL exceptions
  hw/nios2: Introduce Nios2MachineState
  hw/nios2: Move memory regions into Nios2Machine
  tests/tcg/nios2: Add semihosting multiarch tests
  tests/tcg/nios2: Add test-shadow-1

 include/hw/intc/nios2_vic.h             |  64 ++
 linux-user/nios2/target_cpu.h           |   1 +
 target/nios2/cpu.h                      | 250 +++++---
 target/nios2/helper.h                   |   5 +
 tests/tcg/nios2/semicall.h              |  28 +
 hw/intc/nios2_vic.c                     | 313 ++++++++++
 hw/nios2/10m50_devboard.c               | 115 +++-
 linux-user/elfload.c                    |   3 +-
 linux-user/nios2/cpu_loop.c             |  96 ++-
 linux-user/nios2/signal.c               |  25 +-
 target/nios2/cpu.c                      | 213 +++++--
 target/nios2/helper.c                   | 383 ++++++------
 target/nios2/mmu.c                      |  78 +--
 target/nios2/op_helper.c                |  88 +++
 target/nios2/translate.c                | 749 +++++++++++++++---------
 configs/targets/nios2-softmmu.mak       |   1 +
 hw/intc/Kconfig                         |   3 +
 hw/intc/meson.build                     |   1 +
 hw/nios2/Kconfig                        |   1 +
 target/nios2/meson.build                |   7 +-
 tests/tcg/nios2/10m50-ghrd.ld           |  66 +++
 tests/tcg/nios2/Makefile.softmmu-target |  33 ++
 tests/tcg/nios2/Makefile.target         |  11 -
 tests/tcg/nios2/boot.S                  | 218 +++++++
 tests/tcg/nios2/intr.S                  |  31 +
 tests/tcg/nios2/test-shadow-1.S         |  40 ++
 26 files changed, 2113 insertions(+), 710 deletions(-)
 create mode 100644 include/hw/intc/nios2_vic.h
 create mode 100644 tests/tcg/nios2/semicall.h
 create mode 100644 hw/intc/nios2_vic.c
 create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
 create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
 delete mode 100644 tests/tcg/nios2/Makefile.target
 create mode 100644 tests/tcg/nios2/boot.S
 create mode 100644 tests/tcg/nios2/intr.S
 create mode 100644 tests/tcg/nios2/test-shadow-1.S

-- 
2.34.1


