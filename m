Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCF64D464D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 12:52:11 +0100 (CET)
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHL1-0006v1-1v
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 06:52:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGx9-0004nO-4z
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:31 -0500
Received: from [2607:f8b0:4864:20::529] (port=45854
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSGx7-0007ta-AX
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:27:30 -0500
Received: by mail-pg1-x529.google.com with SMTP id z4so4466560pgh.12
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BsKUB/NFfvZcHse8bnc3xe17iP5XmHNNWnWhErgFfo=;
 b=caFpMi4ELEnp619pgQ43fcLJDsgSNPyTtapCjjTQVBdqf9Mc5gw8Y32QAKowEab+Em
 D6zafgKSnZMfn77w6T5KAGCBufbWKVXONspBVOFvzo9NpCkKLq1GBq/bmVtYSjS3a+3Z
 Bojd11wZUlm9r31rbxd0RH492RTRmFqotPyjAJwnhk+9S/f4WTcsw0PdsBGJukRRdTMT
 dyZl86NymqsAwA6PFQde6t2CRuDONRy2LsWLzvTdG4F2+vJ1b+Z2j++WG46ejurEvIrr
 NbQpnGysKmTYYnnH3DJMIre+3FLmuaROGeYFWl1kuguAnRXE74euL1yk4pYQig0uYm7W
 osqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4BsKUB/NFfvZcHse8bnc3xe17iP5XmHNNWnWhErgFfo=;
 b=QAdCSv+eBYdyGGfuk0Mt9TtS/mHDQWhOsG4soI6pMZ7+ohnbjhqTwQnROTwtvlwq9b
 ZI5nq3C9V0dx6M5tq+idtA1oTBYTW+NHWz1yUeJyCAZnYQ3oIQSYHuj24si5IR5teQsS
 yhuRPqYDtb738sOIxm20CMn+S1vgOaSu7jdU6N3aLh1Bc+n+8x69kwGtfNyFAb7BAHcd
 WFkuUyZq7RTmnpev9iYCUJIdl8kKiwi10b4rfCiAtZ6GYNq92tOMArKDq4/IampBuavt
 COnaCcVW4ndbASVfY6MEW6n5TTEUYXnoRBovCd8sXytwv235SpGSLa/dVo7pHSZ+x8vs
 VSIA==
X-Gm-Message-State: AOAM532V8V352pN4hweXX+LJkS5PjyV8nWceIK+nBjxFQ+1F1XCrb9F9
 dZmBx9uwmOFYqjY7FD8vvKvmr3nMzy6hlw==
X-Google-Smtp-Source: ABdhPJzgrOtptx+kkLx9hIzxrMlKPXDzdAXJYSeygVwaC5dYjlHFC9ME9hianQVbQiJLFKWk3kJbbQ==
X-Received: by 2002:a63:571e:0:b0:378:9f08:129b with SMTP id
 l30-20020a63571e000000b003789f08129bmr3657853pgb.75.1646911647366; 
 Thu, 10 Mar 2022 03:27:27 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 js15-20020a17090b148f00b001bfc8614b93sm3114977pjb.1.2022.03.10.03.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:27:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/48] target/nios2: Shadow register set, EIC and VIC
Date: Thu, 10 Mar 2022 03:26:37 -0800
Message-Id: <20220310112725.570053-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This has grown quite beyond merely implementing $SUBJECT,
which are only the last 8 patches of the set.

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

Richard Henderson (43):
  target/nios2: Stop generating code if gen_check_supervisor fails
  target/nios2: Split PC out of env->regs[]
  target/nios2: Fix BRET instruction
  target/nios2: Do not create TCGv for control registers
  linux-user/nios2: Only initialize SP and PC in target_cpu_copy_regs
  target/nios2: Remove cpu_interrupts_enabled
  target/nios2: Split control registers away from general registers
  target/nios2: Do not zero the general registers on reset
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

 configs/targets/nios2-softmmu.mak |   1 +
 include/hw/intc/nios2_vic.h       |  64 ++++
 target/nios2/cpu.h                | 239 +++++++++-----
 target/nios2/helper.h             |   5 +
 hw/intc/nios2_vic.c               | 313 ++++++++++++++++++
 hw/nios2/10m50_devboard.c         | 115 +++++--
 linux-user/elfload.c              |   3 +-
 linux-user/nios2/cpu_loop.c       |  57 ++--
 linux-user/nios2/signal.c         |   6 +-
 target/nios2/cpu.c                | 202 +++++++++---
 target/nios2/helper.c             | 358 +++++++++++++--------
 target/nios2/mmu.c                |  78 ++---
 target/nios2/op_helper.c          |  67 ++++
 target/nios2/translate.c          | 519 ++++++++++++++++++------------
 hw/intc/Kconfig                   |   3 +
 hw/intc/meson.build               |   1 +
 hw/nios2/Kconfig                  |   1 +
 17 files changed, 1466 insertions(+), 566 deletions(-)
 create mode 100644 include/hw/intc/nios2_vic.h
 create mode 100644 hw/intc/nios2_vic.c

-- 
2.25.1


