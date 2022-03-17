Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E252F4DBDFA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:08:55 +0100 (CET)
Received: from localhost ([::1]:46734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUiNa-00036A-WA
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:08:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKV-0000Ig-Uu
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:43 -0400
Received: from [2607:f8b0:4864:20::533] (port=44580
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiKT-0002Bk-UK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:05:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id c11so1809457pgu.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nkZhQu2Ww2087IDDMObUhYpvZv8Wi4M5cIenmYiJuKs=;
 b=XSDurKb9vdSNy6rEb0OF73KtzZWLSSjSkAknhLx9FzH8iLZCHTMjtvNNV1aDknJVAL
 uFZP8w32nmZO+qMT35Orne10Yv6m4N9XhvnKImTH9MybKOV7ge3zHWjyFvCxeJHSPqWR
 a9z1usqmqHbvuOiTRbsy6caDJ0LiP3jVC+59wxlEjIzssFlDFufX1+1YT8ktKbGL2s9i
 hb5c9lOJYGM7kIli76y5ma6NWE0qLCq4k0liQF1kO6pDvNzKczVmJhDI6alv3CKTeiIX
 OfJV2FLnjLQMz63O+6lx4AsaJrmRuUsF245A0o+NWGgV/MsO2qAwJGdmdMBH3kVXbgUC
 6NEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nkZhQu2Ww2087IDDMObUhYpvZv8Wi4M5cIenmYiJuKs=;
 b=gEjyDt2Sz5JNFDtsr7XNceldrMIgL37iGJyfpokDD8Di6HiFTBPlQTpAFxV3I3aZtJ
 vvhV1XYVxxJUillTWYJt7WL+E0GQ5puRZZQ8w4YcevmHlsMj7TVy8miJ8+zO22Sfvyfh
 wa6AiIYw/UtMu0ykYHk4B0mZ03UD5pULZ+EvFZC9ELEUhfaWOCXmKbE9iZD/ie4QaAed
 50vZeT+E8DZfTBEubSoGlZBMJ8j37jaJl2h9Rmv3D1AvUR86dwhmcH8F2noTueJH2Swe
 wui0rAIBMTtRcRPBcc2aPGfMrm7wyg23sNN8wkHSGiBasVEZ4Dp0KTLaCDi65I0V+doG
 E7kA==
X-Gm-Message-State: AOAM531M4xVR/HhN4BKajLy+kcXgE+3QMLjF2KnDMFmPsIh+gLiadt3X
 WJ5u1zAcTlkN+dA3+UMchuv/4ldbtPlrBQ==
X-Google-Smtp-Source: ABdhPJzUk3O9Zq13B0LO2iUFNGNJeA5yrZp6nxVh25jPnmRdfKRy5dQoLC7s7Fq+ojxyo/yVx3oV2w==
X-Received: by 2002:a63:41c5:0:b0:378:3b1e:7ac7 with SMTP id
 o188-20020a6341c5000000b003783b1e7ac7mr2295574pga.266.1647493540129; 
 Wed, 16 Mar 2022 22:05:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 h22-20020a056a001a5600b004f7c17b291asm5101357pfv.87.2022.03.16.22.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:05:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 00/51] target/nios2: Shadow register set,
 EIC and VIC
Date: Wed, 16 Mar 2022 22:04:47 -0700
Message-Id: <20220317050538.924111-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has grown quite beyond merely implementing $SUBJECT,
which are only the last 8 patches of the set.

Version 6 fixes a tcg problem with indirect global lowering,
and adds a test harness and regression test.

Version 5 addresses all of the feedback from v4, fixes some
further bugs in the base exception handling, implements
some missing exceptions.


r~


Amir Gonnen (5):
  target/nios2: Check supervisor on eret
  target/nios2: Add NUM_GP_REGS and NUM_CP_REGS
  target/nios2: Split out helper for eret instruction
  hw/intc: Vectored Interrupt Controller (VIC)
  hw/nios2: Machine with a Vectored Interrupt Controller

Richard Henderson (46):
  tcg: Fix indirect lowering vs TCG_OPF_COND_BRANCH
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
  target/nios2: Introduce dest_gpr
  target/nios2: Drop CR_STATUS_EH from tb->flags
  target/nios2: Enable unaligned traps for system mode
  target/nios2: Create gen_jumpr
  target/nios2: Hoist set of is_jmp into gen_goto_tb
  target/nios2: Use gen_goto_tb for DISAS_TOO_MANY
  target/nios2: Use tcg_gen_lookup_and_goto_ptr
  target/nios2: Implement Misaligned destination exception
  linux-user/nios2: Handle various SIGILL exceptions
  target/nios2: Introduce shadow register sets
  target/nios2: Implement rdprs, wrprs
  target/nios2: Update helper_eret for shadow registers
  target/nios2: Implement EIC interrupt processing
  hw/nios2: Introduce Nios2MachineState
  hw/nios2: Move memory regions into Nios2Machine
  tests/tcg: Expose AR to test build environment if needed
  test/tcg/nios2: Add semihosting multiarch tests
  tests/tcg/nios2: Add test-shadow-1

 include/hw/intc/nios2_vic.h             |  64 +++
 include/tcg/tcg.h                       |   2 +
 target/nios2/cpu.h                      | 239 +++++++----
 target/nios2/helper.h                   |   5 +
 tests/tcg/nios2/semicall.h              |  25 ++
 hw/intc/nios2_vic.c                     | 313 ++++++++++++++
 hw/nios2/10m50_devboard.c               | 115 ++++--
 linux-user/elfload.c                    |   3 +-
 linux-user/nios2/cpu_loop.c             |  57 ++-
 linux-user/nios2/signal.c               |   6 +-
 target/nios2/cpu.c                      | 209 ++++++++--
 target/nios2/helper.c                   | 358 +++++++++-------
 target/nios2/mmu.c                      |  78 ++--
 target/nios2/op_helper.c                |  67 +++
 target/nios2/translate.c                | 519 +++++++++++++++---------
 tcg/tcg.c                               |  10 +
 configs/targets/nios2-softmmu.mak       |   1 +
 hw/intc/Kconfig                         |   3 +
 hw/intc/meson.build                     |   1 +
 hw/nios2/Kconfig                        |   1 +
 tests/tcg/Makefile.qemu                 |   7 +
 tests/tcg/configure.sh                  |  14 +
 tests/tcg/nios2/10m50-ghrd.ld           |  59 +++
 tests/tcg/nios2/Makefile.softmmu-target |  33 ++
 tests/tcg/nios2/ml-ftm.S                |  20 +
 tests/tcg/nios2/ml-intr.S               |  21 +
 tests/tcg/nios2/ml-memcpy.S             |  68 ++++
 tests/tcg/nios2/ml-memset.S             |  88 ++++
 tests/tcg/nios2/ml-outc.S               |  31 ++
 tests/tcg/nios2/ml-start.S              |  46 +++
 tests/tcg/nios2/test-shadow-1.S         |  37 ++
 31 files changed, 1934 insertions(+), 566 deletions(-)
 create mode 100644 include/hw/intc/nios2_vic.h
 create mode 100644 tests/tcg/nios2/semicall.h
 create mode 100644 hw/intc/nios2_vic.c
 create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
 create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
 create mode 100644 tests/tcg/nios2/ml-ftm.S
 create mode 100644 tests/tcg/nios2/ml-intr.S
 create mode 100644 tests/tcg/nios2/ml-memcpy.S
 create mode 100644 tests/tcg/nios2/ml-memset.S
 create mode 100644 tests/tcg/nios2/ml-outc.S
 create mode 100644 tests/tcg/nios2/ml-start.S
 create mode 100644 tests/tcg/nios2/test-shadow-1.S

-- 
2.25.1


