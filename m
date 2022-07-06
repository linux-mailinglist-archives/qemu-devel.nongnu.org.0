Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FD55681F8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 10:46:18 +0200 (CEST)
Received: from localhost ([::1]:43626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o90fp-00041k-K1
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 04:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Kd-0005eD-7G
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:26 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:44558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90KZ-0000Ii-CB
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:24:22 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o3-20020a17090a744300b001ef8f7f3dddso6602871pjk.3
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSlsGv42K1iHLlEGMRNsQfc8mMOX07uLk1pgqzKzfP4=;
 b=Huk9Pqu4UUMiEz4vDexzMAZXIXF6/QoYW6wExBkgE1XXE8AJ3KnC5mekYP8Wrv7os6
 gDFqPbLLrrUmzuvPk2CrekLOkr1/alNuibCDyydIkRYADFm437F/sfxwuoeZZozcika2
 +v7fwHq2Qq7bU1w2ll/lLHRclwenYQ+sdZKVjDcf/VFOGZcXIEtHLHvMU7+vq2SYcoJO
 Xvib00PktQrAIq4/StmrCdUby0OuwydI3BXYVGVowsxnqAY8dPZBkvdt5taSumkUiI5B
 D1DGAXu7cUEzKyCSTj00b+yfrxCn0Vm/r8eQuVOcwpnLaTWlhyP2QVCe6Lekbs5wLaZq
 BGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mSlsGv42K1iHLlEGMRNsQfc8mMOX07uLk1pgqzKzfP4=;
 b=ZeRkpa/tYyfSXToE81qLbG62Ed63k6y65LAdTbu2QjsDNOrYXrQqAP/RkXW+i91iJ+
 s6NrbUCMT/2DdKlvZQ/Fx4dRt5uCSbEV8JH1CNRLeNgVeIhaZVm9hB/jsThvD/r1tpB5
 INpu9x0MW7+KF9hbEz5ksIE6ixIV2QCBYquW9KSjjtL1GxSA5nwysUAz3ZksUgq7lKEc
 oXRyAoTgrUb7hlUYDcZnU512bqMJ6a82w39lF6PVLpvp9DpGekjthA+GcXGofI1voNn4
 JAr+1JbrvTQUFu1MW4NfdKmPTGq3KoSPENyKR8ZVakOd0t90jEYx0hmwtFIm1P1WYEak
 V3cg==
X-Gm-Message-State: AJIora9tZ0nA6Ffhlu/H7eSt5sbSsgp3dQpJqqfPuXJYN8znCB/33ukU
 cFz91ORGiKbe9hqZw9/NSEoixU8QQxuoxCuu
X-Google-Smtp-Source: AGRyM1vDCKfssTCGWF8Z1w0Msr5bIVYCRuKXUVcbnWQ3tvLjzu0OE/Vu9iTYKsLBGEitnHH+rieRqg==
X-Received: by 2002:a17:902:e943:b0:16b:db5b:4fe8 with SMTP id
 b3-20020a170902e94300b0016bdb5b4fe8mr18719032pll.38.1657095856371; 
 Wed, 06 Jul 2022 01:24:16 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:24:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 00/45] target/arm: Scalable Matrix Extension
Date: Wed,  6 Jul 2022 13:53:26 +0530
Message-Id: <20220706082411.1664825-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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

Changes for v5:
  * Use macros for vertical tile slice addressing.
  * Other misc adjustments per review.

Patches without r-b:
  03-target-arm-Trap-non-streaming-usage-when-Streamin.patch
  07-target-arm-Mark-PMULL-FMMLA-as-non-streaming.patch
  19-target-arm-Implement-SME-MOVA.patch
  20-target-arm-Implement-SME-LD1-ST1.patch
  23-target-arm-Implement-SME-ADDHA-ADDVA.patch
  24-target-arm-Implement-FMOPA-FMOPS-non-widening.patch
  25-target-arm-Implement-BFMOPA-BFMOPS.patch
  26-target-arm-Implement-FMOPA-FMOPS-widening.patch
  35-linux-user-aarch64-Add-SM-bit-to-SVE-signal-conte.patch
  37-linux-user-aarch64-Do-not-allow-duplicate-or-shor.patch


r~


Richard Henderson (45):
  target/arm: Handle SME in aarch64_cpu_dump_state
  target/arm: Add infrastructure for disas_sme
  target/arm: Trap non-streaming usage when Streaming SVE is active
  target/arm: Mark ADR as non-streaming
  target/arm: Mark RDFFR, WRFFR, SETFFR as non-streaming
  target/arm: Mark BDEP, BEXT, BGRP, COMPACT, FEXPA, FTSSEL as
    non-streaming
  target/arm: Mark PMULL, FMMLA as non-streaming
  target/arm: Mark FTSMUL, FTMAD, FADDA as non-streaming
  target/arm: Mark SMMLA, UMMLA, USMMLA as non-streaming
  target/arm: Mark string/histo/crypto as non-streaming
  target/arm: Mark gather/scatter load/store as non-streaming
  target/arm: Mark gather prefetch as non-streaming
  target/arm: Mark LDFF1 and LDNF1 as non-streaming
  target/arm: Mark LD1RO as non-streaming
  target/arm: Add SME enablement checks
  target/arm: Handle SME in sve_access_check
  target/arm: Implement SME RDSVL, ADDSVL, ADDSPL
  target/arm: Implement SME ZERO
  target/arm: Implement SME MOVA
  target/arm: Implement SME LD1, ST1
  target/arm: Export unpredicated ld/st from translate-sve.c
  target/arm: Implement SME LDR, STR
  target/arm: Implement SME ADDHA, ADDVA
  target/arm: Implement FMOPA, FMOPS (non-widening)
  target/arm: Implement BFMOPA, BFMOPS
  target/arm: Implement FMOPA, FMOPS (widening)
  target/arm: Implement SME integer outer product
  target/arm: Implement PSEL
  target/arm: Implement REVD
  target/arm: Implement SCLAMP, UCLAMP
  target/arm: Reset streaming sve state on exception boundaries
  target/arm: Enable SME for -cpu max
  linux-user/aarch64: Clear tpidr2_el0 if CLONE_SETTLS
  linux-user/aarch64: Reset PSTATE.SM on syscalls
  linux-user/aarch64: Add SM bit to SVE signal context
  linux-user/aarch64: Tidy target_restore_sigframe error return
  linux-user/aarch64: Do not allow duplicate or short sve records
  linux-user/aarch64: Verify extra record lock succeeded
  linux-user/aarch64: Move sve record checks into restore
  linux-user/aarch64: Implement SME signal handling
  linux-user: Rename sve prctls
  linux-user/aarch64: Implement PR_SME_GET_VL, PR_SME_SET_VL
  target/arm: Only set ZEN in reset if SVE present
  target/arm: Enable SME for user-only
  linux-user/aarch64: Add SME related hwcap entries

 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   56 +-
 target/arm/cpu.h                  |    7 +
 target/arm/helper-sme.h           |  126 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   18 +
 target/arm/translate-a64.h        |   45 ++
 target/arm/translate.h            |   16 +
 target/arm/sme-fa64.decode        |   60 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  243 ++++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   56 +-
 target/arm/sme_helper.c           | 1124 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 ++-
 target/arm/translate-sme.c        |  373 ++++++++++
 target/arm/translate-sve.c        |  393 ++++++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2799 insertions(+), 135 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1


