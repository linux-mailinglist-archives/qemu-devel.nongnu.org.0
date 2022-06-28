Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E6B55BE0A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:25:18 +0200 (CEST)
Received: from localhost ([::1]:51572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62mr-00042N-DH
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62j8-00014G-Oy
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:26 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:45835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62j6-0003cs-TF
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:21:26 -0400
Received: by mail-pf1-x431.google.com with SMTP id 128so10859853pfv.12
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILJ4Kz68ASRNzR6UBmLHINCe4zgwapAsaTAlt+05Ed8=;
 b=nLPbe7q5Wql7A/8XQ+XnINuS8M59VAhkVNRnhQRJwMOakD+FwPDZUUd0xe1j+T6ac9
 RT+EH57wyqoBcAV+nct0M38Hx0BuAp5y3iJybu3mLtGEZuoQEoCrsve/RFUP6v/yY2uq
 qkpr2LlZTKmQ5kUPTLq98ExQkZj9g4Xt2+/DfN7AzYD9KQ4a3W3EW6H3XBCU5rq+a+bb
 nPJvUbMH5Ne3AfAp+kac+ItASGcvNHHwaSoNpsMcQcOwVIgdN1BJpa0mmzD8CcDx6aR4
 cnO8Ok+MoxK9SeOYXkUgf9HKSzgavKqw1TtH21t1RI4Va6z3Q7Yx1/ja5LyNEaEseCEM
 veGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ILJ4Kz68ASRNzR6UBmLHINCe4zgwapAsaTAlt+05Ed8=;
 b=pBzP4jnvO0k7EeZSCDEx99XPAzH0DeZjlk/RQaxSx/s/YS7fQFya6eqBm+64PkFqfG
 2bZ4HMiB8B7gytrJ4LMxKOknRrW5FBa+NYJ2IfhKfQsj2E7W8wgkYxUMCoJcLKLWurkt
 147l0rVZ7lo91QeL/YMZQzq6PTq8m4cmZMBP46qCcEzqGDX8HwOWLR6Y+9YFtn4H4vDJ
 1YwlQc5v3TIQ8OzC9klQTOoM8k4Q+ZVG4nxdju5ULz2aAzIzjdAgy6L/rWrBmi34uU4s
 k5e9Duz/ev0PC+2GmVNNch/c+MxPCMGC90B60txqt8axMy/YPuCFmxfPY8s2CQ/gLqVe
 0Ypw==
X-Gm-Message-State: AJIora9dYhzC9PzXAe9/FcTPcIgsB5lhV2dbiJGNFfq9Ah8v0lEvQebh
 GrTnrnhH0eu5DTJSKIz9rSEQDnqDjixExg==
X-Google-Smtp-Source: AGRyM1sSqwUBLHAgxLD+VCDy+QWHEsh6833PoYw2rXMzEPD5qODe8kPl6UiIk7C8TFp98yfdH0M+Lg==
X-Received: by 2002:a65:6e9b:0:b0:3fc:587a:6dcd with SMTP id
 bm27-20020a656e9b000000b003fc587a6dcdmr15549810pgb.200.1656390083008; 
 Mon, 27 Jun 2022 21:21:23 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 00/45] target/arm: Scalable Matrix Extension
Date: Tue, 28 Jun 2022 09:50:32 +0530
Message-Id: <20220628042117.368549-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Rebase on mainline (20 patches upstreamed).
  * Adjust sve_access_check when PSTATE.SM set.
  * Adjust sve insns to indicate not valid while streaming.
  * Other misc adjustments per review.


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
 target/arm/sme-fa64.decode        |   59 ++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   41 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  242 ++++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   35 +-
 target/arm/cpu64.c                |   11 +
 target/arm/helper.c               |   57 +-
 target/arm/sme_helper.c           | 1104 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  103 ++-
 target/arm/translate-sme.c        |  376 ++++++++++
 target/arm/translate-sve.c        |  387 ++++++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    2 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    3 +
 28 files changed, 2776 insertions(+), 134 deletions(-)
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1


