Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9FB60AACE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:40:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxSD-0003AX-WD; Mon, 24 Oct 2022 09:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxS5-0003AC-PJ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omxS3-0003rN-SA
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:25:13 -0400
Received: by mail-pl1-x633.google.com with SMTP id f23so8432683plr.6
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=5ngXr6B0OEPvPUb/Tkt+WgL0Pz78/x24HWY8iTEIxyw=;
 b=lMvpP+J8s0e1VoxLJMuzA8YoMIw3DYzHOMEvu2ea4XorbggZDF5Ld4A0/Qp8gs7u2a
 eUty9/0SbW80+h4xrJ+pr0wLeGyFXDs+H/xOFjQwcbFbe39N1On+bXQTYpFLUQ7n4TcB
 dey516oYRKz6AxI9dRZkLQ53LMKv9qIyDpWxt+iQZTj+BzGFHp2zY3nt7OTbyL++0IRM
 F3VYL3kLKeLU4pyUFOYJdd0UtsCjcy7+InKnxN3fqPWg8yPS6VZFZeC2VcJLdZKNE5gB
 Hcy09q2EDvOcr83bWkXEv3nmcEIKH+tywVy31csPiRazaj4wwXBWsXINN75xXMpOu1jM
 +ZQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5ngXr6B0OEPvPUb/Tkt+WgL0Pz78/x24HWY8iTEIxyw=;
 b=OetznzKIOYv/O5962sAuaLq5mviHlF7Zpj++By3MQDa184iGvfye4YRuICWFNKcL+r
 04ZRQo5BVCQqarS11gNgAXT7E64c6lY6aD4Yj89Xm6ub9u1PJYjQVS3G4ELXRVJrozMB
 rOofVDqOjYigJOgKOKd4LWOXZHF0tqvWDFp6lHDoc2yvJhJsOGt9EA0mrRS1itHoaT4t
 lJN0n8Em2ariUFRREwXTlIOO3bliGeaxxXJlzwu+nZ3p+ZWvnP6ACWTjtS2P9fvNUJev
 PPKxTbZXuAW2JuUe/tV0kV2OwnWtIEptACDbhThUYZoThC0J0VsNLiFv/krsimEPmxP/
 ZWLw==
X-Gm-Message-State: ACrzQf1fDc2n2tRLIk+2L6werQ03Hhfm9aDnJdvFUfxZTQQFl7sXlyB/
 jfQyWf19L85Xa0l17Vw5JOatlQUKeyJglA==
X-Google-Smtp-Source: AMsMyM6pOIPqN13cFSalmAnKb2/Z0Q1Jphh22jvyWpzNBGatVfMdmBpgnRfbktHTBIkawExPTF1tJQ==
X-Received: by 2002:a17:90b:691:b0:20d:6171:c94 with SMTP id
 m17-20020a17090b069100b0020d61710c94mr71905055pjz.25.1666617909787; 
 Mon, 24 Oct 2022 06:25:09 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 b12-20020a1709027e0c00b00178ab008364sm17009216plm.37.2022.10.24.06.25.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 06:25:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/29] tcg: Fix x86 TARGET_TB_PCREL (#1269)
Date: Mon, 24 Oct 2022 23:24:29 +1000
Message-Id: <20221024132459.3229709-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As per #1269, this affects NetBSD installer boot.

The problem is that one of the x86 acpi callbacks modifies
env->eip during an mmio store, which means that the tracking
that translate.c does is thrown out of whack.

Introduce a method to extract unwind data without the
writeback to env.  This isn't a perfect abstraction, but I
couldn't think of anything better.  There's a couple of lines
of code duplication, but probably less than any abstration
that we might put on top

Move restore_state_to_opc to a tcg_ops hook.

Remove the last use of cpu_restore_state with will_exit=false
from openrisc, which was on shaky ground already with similar
modifications to translate.c variables.

Remove the will_exit/reset_icount parameters, which are now
always true.


r~


Richard Henderson (29):
  accel/tcg: Add restore_state_to_opc to TCGCPUOps
  target/alpha: Convert to tcg_ops restore_state_to_opc
  target/arm: Convert to tcg_ops restore_state_to_opc
  target/avr: Convert to tcg_ops restore_state_to_opc
  target/cris: Convert to tcg_ops restore_state_to_opc
  target/hexagon: Convert to tcg_ops restore_state_to_opc
  target/hppa: Convert to tcg_ops restore_state_to_opc
  target/i386: Convert to tcg_ops restore_state_to_opc
  target/loongarch: Convert to tcg_ops restore_state_to_opc
  target/m68k: Convert to tcg_ops restore_state_to_opc
  target/microblaze: Convert to tcg_ops restore_state_to_opc
  target/mips: Convert to tcg_ops restore_state_to_opc
  target/nios2: Convert to tcg_ops restore_state_to_opc
  target/openrisc: Convert to tcg_ops restore_state_to_opc
  target/ppc: Convert to tcg_ops restore_state_to_opc
  target/riscv: Convert to tcg_ops restore_state_to_opc
  target/rx: Convert to tcg_ops restore_state_to_opc
  target/s390x: Convert to tcg_ops restore_state_to_opc
  target/sh4: Convert to tcg_ops restore_state_to_opc
  target/sparc: Convert to tcg_ops restore_state_to_opc
  target/tricore: Convert to tcg_ops restore_state_to_opc
  target/xtensa: Convert to tcg_ops restore_state_to_opc
  accel/tcg: Remove restore_state_to_opc function
  accel/tcg: Introduce cpu_unwind_state_data
  target/i386: Use cpu_unwind_state_data for tpr access
  target/openrisc: Always exit after mtspr npc
  target/openrisc: Use cpu_unwind_state_data for mfspr
  accel/tcg: Remove will_exit argument from cpu_restore_state
  accel/tcg: Remove reset_icount argument from cpu_restore_state_from_tb

 include/exec/exec-all.h             | 23 +++++---
 include/hw/core/tcg-cpu-ops.h       | 11 ++++
 target/mips/tcg/tcg-internal.h      |  3 +
 target/s390x/s390x-internal.h       |  4 +-
 target/sparc/cpu.h                  |  3 +
 accel/tcg/cpu-exec-common.c         |  2 +-
 accel/tcg/translate-all.c           | 87 ++++++++++++++++++-----------
 target/alpha/cpu.c                  |  9 +++
 target/alpha/helper.c               |  2 +-
 target/alpha/mem_helper.c           |  2 +-
 target/alpha/translate.c            |  6 --
 target/arm/cpu.c                    | 26 +++++++++
 target/arm/op_helper.c              |  2 +-
 target/arm/tlb_helper.c             |  8 +--
 target/arm/translate.c              | 22 --------
 target/avr/cpu.c                    | 11 ++++
 target/avr/translate.c              |  6 --
 target/cris/cpu.c                   | 11 ++++
 target/cris/helper.c                |  2 +-
 target/cris/translate.c             |  6 --
 target/hexagon/cpu.c                |  9 ++-
 target/hppa/cpu.c                   | 19 +++++++
 target/hppa/translate.c             | 13 -----
 target/i386/helper.c                | 21 ++++++-
 target/i386/tcg/sysemu/svm_helper.c |  2 +-
 target/i386/tcg/tcg-cpu.c           | 19 +++++++
 target/i386/tcg/translate.c         | 15 -----
 target/loongarch/cpu.c              | 11 ++++
 target/loongarch/translate.c        |  6 --
 target/m68k/cpu.c                   | 14 +++++
 target/m68k/op_helper.c             |  4 +-
 target/m68k/translate.c             | 10 ----
 target/microblaze/cpu.c             | 11 ++++
 target/microblaze/helper.c          |  2 +-
 target/microblaze/translate.c       |  7 ---
 target/mips/cpu.c                   |  1 +
 target/mips/tcg/translate.c         |  8 ++-
 target/nios2/cpu.c                  | 11 ++++
 target/nios2/op_helper.c            |  2 +-
 target/nios2/translate.c            |  6 --
 target/openrisc/cpu.c               | 13 +++++
 target/openrisc/sys_helper.c        | 17 ++++--
 target/openrisc/translate.c         | 10 ----
 target/ppc/cpu_init.c               | 10 ++++
 target/ppc/excp_helper.c            |  2 +-
 target/ppc/translate.c              |  6 --
 target/riscv/cpu.c                  |  9 ++-
 target/rx/cpu.c                     | 10 ++++
 target/rx/translate.c               |  6 --
 target/s390x/cpu.c                  |  1 +
 target/s390x/tcg/excp_helper.c      |  2 +-
 target/s390x/tcg/translate.c        |  7 ++-
 target/sh4/cpu.c                    | 16 ++++++
 target/sh4/translate.c              | 10 ----
 target/sparc/cpu.c                  |  1 +
 target/sparc/translate.c            |  7 ++-
 target/tricore/cpu.c                | 11 ++++
 target/tricore/op_helper.c          |  2 +-
 target/tricore/translate.c          |  6 --
 target/xtensa/cpu.c                 | 10 ++++
 target/xtensa/helper.c              |  6 +-
 target/xtensa/translate.c           |  6 --
 62 files changed, 386 insertions(+), 219 deletions(-)

-- 
2.34.1


