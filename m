Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A3950A40B
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:26:54 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYhp-0004q8-Rv
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:26:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYYx-0006Zz-13
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:43 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYYu-0006C2-RU
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:17:42 -0400
Received: by mail-pf1-x432.google.com with SMTP id j6so2968047pfe.13
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SoWF1n0tw/T/M2+r6mq3f3tGTkkAeLVlcRiByR9Jk14=;
 b=vZKJZ/97RagV+pEqoklUsnlKSlG/LKntMmyFTIGly4pdpcZZgbNTQJByZtOhU8bjXz
 QQc8rgeid4uVcaGP3T6jWQ3lTW1RJPlS0llylQ0LMsBT8VuhwXF0muU7nC+cRjAEJ5xl
 ZahGbd8Q1affQsgw68oDr1H8pej/xC7jgzWdCHVH7EozxkENy8TzyRcHYxEQlEyq29in
 9LlS9bAGCG7B9whpnWgCCD4CnGGojwgOxNFm8AyhsJNa5wvYOd2B3126kJf2SInOvE+D
 uOzGq/n7J1JGpsHj42M84zKvbuQockpi/o7rh35MvWvJt/Fdwld+n7cayD0/6Oqi9FIX
 sWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SoWF1n0tw/T/M2+r6mq3f3tGTkkAeLVlcRiByR9Jk14=;
 b=lfS/ILsS2A2zqwBN40mvr2YELV9SRSfq0anK5ifNCdrBfZNVB9nyZQAMGalaVFVqbi
 Wq2oCkYy6WnKGuL2W2E+YuDcYLdpQgo8s0fJ8AmNi/DxBTdnwyFDNRpOBeZF6A2uZg2I
 XWj3GSqaQ/uskwEbrDbpS1MH6ddiEFqLJpl6cIxQbAjIu/1y2+Qv7ZPY9IXZauOjhz9R
 vYLOPfAYaoRoqaQiMW6OX9l4MbMdMX+h2KYZpTnczEu6EwXwUGmKDo7V8CFHAyaf5gIR
 fNZIOD3Zs9x3TWWbx/oVI9TLdMMdUVFHPmhnSS7UgmHOFUSysjQACBccMWw63KBQs9A2
 f8zg==
X-Gm-Message-State: AOAM531Gbp2KN1BJGRvGfCqg4YUCppqivJaqAb9mgafugwKkrharUxKh
 TGhfVqG/z4EN+BEVNhs7YNgyFBKuFvBxLw==
X-Google-Smtp-Source: ABdhPJzL3GN4rwwd8jXYXGa7xZFixj0LAMeHoDI5SaF1uACxf1s1+XetJxA5ogl+HViqzssOD+KrUA==
X-Received: by 2002:a05:6a00:8c9:b0:4fe:ecc:9bcd with SMTP id
 s9-20020a056a0008c900b004fe0ecc9bcdmr34895pfu.34.1650554259263; 
 Thu, 21 Apr 2022 08:17:39 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:17:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/64] nios2 fixes, cleanups, shadow reg sets
Date: Thu, 21 Apr 2022 08:16:31 -0700
Message-Id: <20220421151735.31996-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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

New in v7 is changing exceptions to advance the pc before raising
the exception, to match the hardware.  This caused a number of
conflicts with my outstanding linux-user patches, so I've merged
the two patch sets.

Supercedes: <20220317050538.924111-1-richard.henderson@linaro.org>
("target/nios2: Shadow register set, EIC and VIC")

Supercedes: <20220325195250.386071-1-richard.henderson@linaro.org>
("linux-user/nios2: Fix clone and sigreturn")

Patches needing review:
  09-target-nios2-Remove-user-only-nios2_cpu_do_interr.patch
  10-target-nios2-Remove-nios2_cpu_record_sigsegv.patch
  11-target-nios2-Build-helper.c-for-system-only.patch
  12-linux-user-nios2-Use-force_sig_fault-for-EXCP_DEB.patch
  34-target-nios2-Handle-EXCP_UNALIGN-and-EXCP_UALIGND.patch
  37-target-nios2-Prevent-writes-to-read-only-or-reser.patch
  43-target-nios2-Split-out-named-structs-for-IRJ-_TYP.patch
  44-target-nios2-Split-out-helpers-for-gen_-translate.patch
  53-target-nios2-Introduce-shadow-register-sets.patch
  56-target-nios2-Implement-EIC-interrupt-processing.patch
  57-target-nios2-Advance-pc-when-raising-exceptions.patch
  63-tests-tcg-nios2-Add-semihosting-multiarch-tests.patch
  64-tests-tcg-nios2-Add-test-shadow-1.patch


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

Richard Henderson (59):
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
  target/nios2: Handle EXCP_UNALIGN and EXCP_UALIGND
  target/nios2: Cleanup set of CR_EXCEPTION for do_interrupt
  target/nios2: Clean up handling of tlbmisc in do_exception
  target/nios2: Prevent writes to read-only or reserved control fields
  target/nios2: Implement cpuid
  target/nios2: Implement CR_STATUS.RSIE
  target/nios2: Remove CPU_INTERRUPT_NMI
  target/nios2: Support division error exception
  target/nios2: Use tcg_constant_tl
  target/nios2: Split out named structs for [IRJ]_TYPE
  target/nios2: Split out helpers for gen_* translate macros
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

 configs/targets/nios2-softmmu.mak       |   1 +
 include/hw/intc/nios2_vic.h             |  64 ++
 linux-user/nios2/target_cpu.h           |   1 +
 target/nios2/cpu.h                      | 250 +++++---
 target/nios2/helper.h                   |   5 +
 tests/tcg/nios2/semicall.h              |  25 +
 hw/intc/nios2_vic.c                     | 313 ++++++++++
 hw/nios2/10m50_devboard.c               | 115 +++-
 linux-user/elfload.c                    |   3 +-
 linux-user/nios2/cpu_loop.c             |  96 ++-
 linux-user/nios2/signal.c               |  25 +-
 target/nios2/cpu.c                      | 213 +++++--
 target/nios2/helper.c                   | 383 ++++++------
 target/nios2/mmu.c                      |  78 +--
 target/nios2/op_helper.c                |  88 +++
 target/nios2/translate.c                | 748 +++++++++++++++---------
 hw/intc/Kconfig                         |   3 +
 hw/intc/meson.build                     |   1 +
 hw/nios2/Kconfig                        |   1 +
 target/nios2/meson.build                |   7 +-
 tests/tcg/nios2/10m50-ghrd.ld           |  59 ++
 tests/tcg/nios2/Makefile.softmmu-target |  30 +
 tests/tcg/nios2/Makefile.target         |  11 -
 tests/tcg/nios2/boot.S                  | 218 +++++++
 tests/tcg/nios2/intr.S                  |  31 +
 tests/tcg/nios2/test-shadow-1.S         |  37 ++
 26 files changed, 2096 insertions(+), 710 deletions(-)
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


