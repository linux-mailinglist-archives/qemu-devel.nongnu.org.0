Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8C7552331
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:55:56 +0200 (CEST)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Lcx-0000BR-Bd
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZp-0005Pu-Gv
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZm-0001JH-J3
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:41 -0400
Received: by mail-pl1-x636.google.com with SMTP id g8so10386292plt.8
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OR8FhoVyw4gtbkUIQHYT5bkd+xvaPMvkY5EgT+9fAqg=;
 b=OiecWRXxrP4zyXOjPSqdukKEwn4qOVJ4SgeWjGaigE9EHIYPbvpv8tSM3M/zBlKPvr
 Qik8+vIf9WOSdehOMV6MaUuu6U2QWgIVfzVCn7Poo1qarlJobLlYA4zwMBdQppkBQXaO
 bJeSOge0oIRfBZ9tMFrx0EC4ZiE35ktWSZuKtMX70LFhnzl94a7dtC9vVQ8ptknqNLX9
 qpGGtOjA4L5Lld6LZjOvNph4cbM8joxJeNuA2jEmpD4O/NnvZvz/p3bs15biSvBn+Ncj
 ZulfcLEsob1C3+C2vw16l65f5b6R2vlCrbochFsDZGw4w1AFBQf1yZPypoq9wWTW0oLF
 Y7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OR8FhoVyw4gtbkUIQHYT5bkd+xvaPMvkY5EgT+9fAqg=;
 b=5fF13FmC3zQaaiadcWDw+jYimgcCqtWigZh8M5sIFg+fjlSlRst3dkDYpNFDZUXc+Z
 gzZoPTg0/P5UER4NdazuzSXiiNtDtphxm53d6pJf1cYeJPXaVvidniiiBWXtLR0hY/i6
 brmdnbzCfUYVOkStgXKaqRV9lndLb1nh19tZ2RU5e+PI/ImWigNjO7SZEP3d0T7sTqdH
 IzU0pGYHciAi4BxMCDVcj98ndSZWuH8WOvgdP2aIVEZVhG32sxxYQCwpZnCIdEHjzFFF
 J+jOZnZYhQQf4sktJgFvaNkRyBacFSCbMsFGw7gLBuOhUE6pG+x1mSO8bKmMgrhuW+j6
 hRyA==
X-Gm-Message-State: AJIora9xnjCALfkTIcTv3PijBH4jhD352aKtpcinUOVMqwPo/AvQY4BR
 PMHdew/O7075Ka3IpmNtbv+YNfoVvVN8JQ==
X-Google-Smtp-Source: AGRyM1uGG3AkwK+ugHbkchKuNOUx5GnxpM3G94MkVkbsFy5KC3cVX7jBuI51evsWj7O/ABWOX01Fxw==
X-Received: by 2002:a17:902:d4c4:b0:16a:2a8c:c4aa with SMTP id
 o4-20020a170902d4c400b0016a2a8cc4aamr4331579plg.138.1655747557074; 
 Mon, 20 Jun 2022 10:52:37 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 00/51] target/arm: Scalable Matrix Extension
Date: Mon, 20 Jun 2022 10:51:44 -0700
Message-Id: <20220620175235.60881-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

Changes for v3:
  * Rebase on mainline (20 patches upstreamed; new conflicts resolved).
  * Test bit 31 before disas_sme.

The first 21 patches, excepting 17, have been reviewed.


r~


Richard Henderson (51):
  target/arm: Implement TPIDR2_EL0
  target/arm: Add SMEEXC_EL to TB flags
  target/arm: Add syn_smetrap
  target/arm: Add ARM_CP_SME
  target/arm: Add SVCR
  target/arm: Add SMCR_ELx
  target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
  target/arm: Add PSTATE.{SM,ZA} to TB flags
  target/arm: Add the SME ZA storage to CPUARMState
  target/arm: Implement SMSTART, SMSTOP
  target/arm: Move error for sve%d property to arm_cpu_sve_finalize
  target/arm: Create ARMVQMap
  target/arm: Generalize cpu_arm_{get,set}_vq
  target/arm: Generalize cpu_arm_{get,set}_default_vec_len
  target/arm: Move arm_cpu_*_finalize to internals.h
  target/arm: Unexport aarch64_add_*_properties
  target/arm: Add cpu properties for SME
  target/arm: Introduce sve_vqm1_for_el_sm
  target/arm: Add SVL to TB flags
  target/arm: Move pred_{full,gvec}_reg_{offset,size} to translate-a64.h
  target/arm: Add infrastructure for disas_sme
  target/arm: Trap AdvSIMD usage when Streaming SVE is active
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

 docs/system/arm/cpu-features.rst  |   56 ++
 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   56 +-
 target/arm/cpregs.h               |    5 +
 target/arm/cpu.h                  |   95 ++-
 target/arm/helper-sme.h           |  146 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   19 +
 target/arm/internals.h            |    4 +
 target/arm/syndrome.h             |   14 +
 target/arm/translate-a64.h        |   53 ++
 target/arm/translate.h            |   14 +
 target/arm/sme-fa64.decode        |   89 +++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   31 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  242 +++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/cpu.c                  |   34 +-
 target/arm/cpu64.c                |  216 ++++--
 target/arm/helper.c               |  276 ++++++-
 target/arm/kvm64.c                |    2 +-
 target/arm/machine.c              |   34 +
 target/arm/sme_helper.c           | 1174 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |   28 +
 target/arm/translate-a64.c        |  141 +++-
 target/arm/translate-sme.c        |  353 +++++++++
 target/arm/translate-sve.c        |  283 +++++--
 target/arm/translate-vfp.c        |   12 +
 target/arm/translate.c            |    1 +
 target/arm/vec_helper.c           |   24 +
 target/arm/meson.build            |    4 +
 34 files changed, 3367 insertions(+), 197 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/sme_helper.c
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1


