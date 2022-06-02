Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC1C53C07F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 23:52:41 +0200 (CEST)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwskC-0007iR-El
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 17:52:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgc-0004P9-Vb
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:48:58 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:44776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgb-0008Tw-4n
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:48:58 -0400
Received: by mail-pl1-x631.google.com with SMTP id h1so5510463plf.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OitQ2SIT8JxOXgi8ExKWXndeS9DSsD7obLpaP8kADgM=;
 b=w4eHUhhNiLNhw8bPvnHInRKMQrctc6eok8ivDZSlP2k1cnFOyb2IZALnWirN6eaygc
 6e+YbLM8rUU+EYIDfcv6aJczjp9CkmAQqmr/UIhcaf0sNar8bAbz1MjBEGGafkPdXXlt
 A9Vah5b7oOkq9mPaTZJszw9nZswxQKbbsD+/+e1WGyxPaUt+KTcG1YF3Gc/vnEW4cJr2
 MheL/nV7yC7GchFHGsN69xPZ/hafkivbEVz4Ml0gFN5CJJdduV9TV5WOLmDpGktrZvgs
 QiST8DMVU8oVaWhgL54D4KfDzB5bvXsTZL1UUm1fSU30J8+NVX6oQTK9VDXe1US2T8zm
 KcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OitQ2SIT8JxOXgi8ExKWXndeS9DSsD7obLpaP8kADgM=;
 b=Kp0hrcDUlQ+Y5nySfpI2r2y1P0B5G8ps1LGAuTvPrnJjqKZpwXKKASbJBOhHMsu4qd
 +zrxkBGLvNvJBrYhQuu/ow5iFJYoOjA56495B7VwIGlWM6QXCdDoXCbWLZsVhAM4aVBT
 IIqfei2OevZndIQ9U7+HvdMEl5sZYitGfipFoXkdCgXY8GzsKP9PRupDEAC6W/gUAdIv
 yDad8sH1Krh+nGQ97EdymniLU39pBBiQvJc7c2pXSNVgd0fyG0TJsswMO2rhbGRXNGaR
 mYxehIxy5e7CTiom2Hr+G6J/tKeXPricA7G20gZxxmMbe5zRUuzrX7M/MzTn+BLkSAk+
 EZ0w==
X-Gm-Message-State: AOAM532JzkXp2/xTm6vyq/Q4/24Zvjxbw5NFiML/a8OlVBQfDWJT3gJG
 pbell9KShqtydjPaFJ3zuYxpUskQGbU35A==
X-Google-Smtp-Source: ABdhPJxuBIvFbHnvCwvyZRLSFxTjoq6RctF7fugrXKx/dIYAjSW2i0Flvnn9Or9SAYUbMI2OvB7E/Q==
X-Received: by 2002:a17:90b:33ca:b0:1dc:e5b8:482b with SMTP id
 lk10-20020a17090b33ca00b001dce5b8482bmr42242549pjb.165.1654206534729; 
 Thu, 02 Jun 2022 14:48:54 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:48:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/71] target/arm: Scalable Matrix Extension
Date: Thu,  2 Jun 2022 14:47:42 -0700
Message-Id: <20220602214853.496211-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

Implement FEAT_SME and most optional extensions, which are really
pretty trivial compared to the main feature.  FEAT_EBF16 is still
on the to-do list.

Includes linux-user support, based on Mark Brown's code that has been
merged into linux 5.19-rc1.

Mark's kselftest suite is in fact all of the testing that I have done,
since the current public Arm FVP does not include support for SME.
On the bright side, Mark's tests handle all of the new mode switching,
which IMO is the hairy part, and wouldn't be tested by RISU anyway.

All prerequisites are either merged or dropped.

Supercedes: 20220527180623.185261-1-richard.henderson@linaro.org
("[PATCH v3 00/15] target/arm: SME prep patches")


r~


Richard Henderson (71):
  target/arm: Rename TBFLAG_A64 ZCR_LEN to VL
  linux-user/aarch64: Introduce sve_vq_cached
  target/arm: Remove route_to_el2 check from sve_exception_el
  target/arm: Remove fp checks from sve_exception_el
  target/arm: Add el_is_in_host
  target/arm: Use el_is_in_host for sve_zcr_len_for_el
  target/arm: Use el_is_in_host for sve_exception_el
  target/arm: Hoist arm_is_el2_enabled check in sve_exception_el
  target/arm: Do not use aarch64_sve_zcr_get_valid_len in reset
  target/arm: Merge aarch64_sve_zcr_get_valid_len into caller
  target/arm: Use uint32_t instead of bitmap for sve vq's
  target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
  target/arm: Split out load/store primitives to sve_ldst_internal.h
  target/arm: Export sve contiguous ldst support functions
  target/arm: Move expand_pred_b to vec_internal.h
  target/arm: Use expand_pred_b in mve_helper.c
  target/arm: Move expand_pred_h to vec_internal.h
  target/arm: Export bfdotadd from vec_helper.c
  target/arm: Add isar_feature_aa64_sme
  target/arm: Add ID_AA64SMFR0_EL1
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

 docs/system/arm/emulation.rst     |    4 +
 linux-user/aarch64/target_cpu.h   |    5 +-
 linux-user/aarch64/target_prctl.h |   76 +-
 target/arm/cpregs.h               |    5 +
 target/arm/cpu.h                  |  146 +++-
 target/arm/helper-sme.h           |  146 ++++
 target/arm/helper-sve.h           |    4 +
 target/arm/helper.h               |   19 +
 target/arm/internals.h            |   22 +-
 target/arm/kvm_arm.h              |    7 +-
 target/arm/sve_ldst_internal.h    |  221 ++++++
 target/arm/syndrome.h             |   13 +
 target/arm/translate-a64.h        |   55 +-
 target/arm/translate.h            |   16 +-
 target/arm/vec_internal.h         |   28 +-
 target/arm/sme-fa64.decode        |   89 +++
 target/arm/sme.decode             |   88 +++
 target/arm/sve.decode             |   31 +-
 linux-user/aarch64/cpu_loop.c     |    9 +
 linux-user/aarch64/signal.c       |  238 +++++-
 linux-user/elfload.c              |   20 +
 linux-user/syscall.c              |   28 +-
 target/arm/arch_dump.c            |    2 +-
 target/arm/cpu.c                  |   39 +-
 target/arm/cpu64.c                |  311 +++++---
 target/arm/gdbstub64.c            |    2 +-
 target/arm/helper.c               |  395 ++++++++--
 target/arm/kvm64.c                |   45 +-
 target/arm/machine.c              |   36 +
 target/arm/mve_helper.c           |    6 +-
 target/arm/sme_helper.c           | 1173 +++++++++++++++++++++++++++++
 target/arm/sve_helper.c           |  260 ++-----
 target/arm/translate-a64.c        |  147 +++-
 target/arm/translate-sme.c        |  353 +++++++++
 target/arm/translate-sve.c        |  283 +++++--
 target/arm/translate-vfp.c        |   13 +
 target/arm/translate.c            |    1 +
 target/arm/vec_helper.c           |   52 +-
 target/arm/meson.build            |    4 +
 39 files changed, 3800 insertions(+), 592 deletions(-)
 create mode 100644 target/arm/helper-sme.h
 create mode 100644 target/arm/sve_ldst_internal.h
 create mode 100644 target/arm/sme-fa64.decode
 create mode 100644 target/arm/sme.decode
 create mode 100644 target/arm/sme_helper.c
 create mode 100644 target/arm/translate-sme.c

-- 
2.34.1


