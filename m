Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A705048A2
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 19:49:44 +0200 (CEST)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ng91q-0003vi-07
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 13:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wr-0000dT-1i
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:33 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wo-0003Df-Cg
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:44:31 -0400
Received: by mail-pg1-x530.google.com with SMTP id u2so14949915pgq.10
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49MEjBLreWKhHOhCC9qsitP3Mv6KOOFlXreHBHFuXAk=;
 b=D0wjodxvz/4IelW9f6Vy2T5Twi5ZZ/xK+Jm7Ej8g+FZrMqPbfkhlXP4SVyLuEZ1cqP
 3mBM3/Bigyh2MwwRQ9/j/bLRPUmjlzdAIJfwA9YnPoHh6M8UB95RzcePz9KxDTwyHw1v
 LRJ5VFci5wt/pAkMqbPDKEqeTL0R4fyLInyRGdKNnftpTwZAkImARzVbkIwYBnkvYubY
 8UejYj6QUqg4SBvqZuPc2v8z82w0B1XLt/3oKJzoELXPOsRCF3V4/5UPp3LxhD8TWlhY
 sGBMC0VtZ4kweaE5p4mCEGf4FMZ6EF2BaUStmKAQEmPqEwI3uc4jgJy89mcBE0UBSI8I
 SKIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=49MEjBLreWKhHOhCC9qsitP3Mv6KOOFlXreHBHFuXAk=;
 b=CLRQhqTeOpovA81cycV31djDQqUzhfJXZfVJ3sdpbwdWEgQrcouu+xriYRVtv5GW68
 1XMsveKAPEcu/6sYxmLmqQ8KO1ey+gN+FCesUqdVJB6/4bOAzT0HTKvEY6vDCFlIiFXp
 ODul0lyLlvsixv6+g1or+zQI/PWn1jaBy2aZeT1KhJSeSywTy85iTApvBihXmi14WS0p
 cajqG8Paxe5T5ZXRX7tU0h2u9kCm8wm7sOLBpZv/OMZ5tGKDZkeS5zOwvJYO0lwLgj9+
 Pg+HJLmduiP42vwYPiKR0sE18EfqpXDJYl1HJNwOXJlzB6+5LNzCiVMMlXVMGHc6v5q1
 nBVQ==
X-Gm-Message-State: AOAM5316limgVMRDQrbp25HWtIAuMgiCklLSyNk9dArMMERhR2P345It
 euRYsPnUZrKTj2bpJNDOM/KxoWWoaa2Law==
X-Google-Smtp-Source: ABdhPJyYaw8z3ikOpTff/1iQM2BXQ44/sgSyaZ1jqh5j4FtjoIPaHiaUvprz/M15DOs5M7twkXsYfA==
X-Received: by 2002:a65:530b:0:b0:382:b21d:82eb with SMTP id
 m11-20020a65530b000000b00382b21d82ebmr7128565pgq.215.1650217468629; 
 Sun, 17 Apr 2022 10:44:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/60] target/arm: Cleanups, new features, new cpus
Date: Sun, 17 Apr 2022 10:43:26 -0700
Message-Id: <20220417174426.711829-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Supercedes: 20220412003326.588530-1-richard.henderson@linaro.org
("target/arm: 8 new features, A76 and N1")

Changes for v3:
  * More field updates for H.a.  This is not nearly complete, but what
    I've encountered so far as I've begun implementing SME.
  * Use bool instead of uint32_t for env->{aarch64,thumb}.
    I had anticipated other changes for implementing PSTATE.{SM,FA},
    but dropped those; these seemed like worth keeping.
  * Use tcg_constant_* more -- got stuck on this while working on...
  * Lots of cleanups to ARMCPRegInfo.
  * Discard unreachable cpregs when ELx not available.
  * Transform EL2 regs to RES0 when EL3 present but EL2 isn't.
    This greatly simplifies registration of cpregs for new features.
    Changes contextidr_el2, minimal_ras_reginfo, scxtnum_reginfo
    within this patch set; other uses coming for SME.


r~


Richard Henderson (60):
  tcg: Add tcg_constant_ptr
  target/arm: Update ISAR fields for ARMv8.8
  target/arm: Update SCR_EL3 bits to ARMv8.8
  target/arm: Update SCTLR bits to ARMv9.2
  target/arm: Change DisasContext.aarch64 to bool
  target/arm: Change CPUArchState.aarch64 to bool
  target/arm: Extend store_cpu_offset to take field size
  target/arm: Change DisasContext.thumb to bool
  target/arm: Change CPUArchState.thumb to bool
  target/arm: Remove fpexc32_access
  target/arm: Split out set_btype_raw
  target/arm: Split out gen_rebuild_hflags
  target/arm: Use tcg_constant in translate-a64.c
  target/arm: Simplify GEN_SHIFT in translate.c
  target/arm: Simplify gen_sar
  target/arm: Simplify aa32 DISAS_WFI
  target/arm: Use tcg_constant in translate.c
  target/arm: Use tcg_constant in translate-m-nocp.c
  target/arm: Use tcg_constant in translate-neon.c
  target/arm: Use smin/smax for do_sat_addsub_32
  target/arm: Use tcg_constant in translate-sve.c
  target/arm: Use tcg_constant in translate-vfp.c
  target/arm: Use tcg_constant_i32 in translate.h
  target/arm: Split out cpregs.h
  target/arm: Reorg CPAccessResult and access_check_cp_reg
  target/arm: Replace sentinels with ARRAY_SIZE in cpregs.h
  target/arm: Make some more cpreg data static const
  target/arm: Reorg ARMCPRegInfo type field bits
  target/arm: Change cpreg access permissions to enum
  target/arm: Name CPState type
  target/arm: Name CPSecureState type
  target/arm: Update sysreg fields when redirecting for E2H
  target/arm: Store cpregs key in the hash table directly
  target/arm: Cleanup add_cpreg_to_hashtable
  target/arm: Handle cpreg registration for missing EL
  target/arm: Drop EL3 no EL2 fallbacks
  target/arm: Merge zcr reginfo
  target/arm: Add isar predicates for FEAT_Debugv8p2
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Move cortex impdef sysregs to cpu_tcg.c
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out aa32_max_features
  target/arm: Annotate arm_max_initfn with FEAT identifiers
  target/arm: Use field names for manipulating EL2 and EL3 modes
  target/arm: Enable FEAT_Debugv8p2 for -cpu max
  target/arm: Enable FEAT_Debugv8p4 for -cpu max
  target/arm: Add isar_feature_{aa64,any}_ras
  target/arm: Add minimal RAS registers
  target/arm: Enable SCR and HCR bits for RAS
  target/arm: Implement virtual SError exceptions
  target/arm: Implement ESB instruction
  target/arm: Enable FEAT_RAS for -cpu max
  target/arm: Enable FEAT_IESB for -cpu max
  target/arm: Enable FEAT_CSV2 for -cpu max
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 include/tcg/tcg.h             |   2 +
 target/arm/cpregs.h           | 459 +++++++++++++++++
 target/arm/cpu.h              | 475 ++++--------------
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 +
 target/arm/syndrome.h         |   5 +
 target/arm/translate-a32.h    |  13 +-
 target/arm/translate.h        |  17 +-
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/pxa2xx.c               |   2 +-
 hw/arm/pxa2xx_pic.c           |   2 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 hw/intc/arm_gicv3_cpuif.c     |   6 +-
 hw/intc/arm_gicv3_kvm.c       |   3 +-
 linux-user/arm/cpu_loop.c     |   2 +-
 target/arm/cpu.c              |  88 ++--
 target/arm/cpu64.c            | 349 +++++++------
 target/arm/cpu_tcg.c          | 232 ++++++---
 target/arm/gdbstub.c          |   5 +-
 target/arm/helper-a64.c       |   4 +-
 target/arm/helper.c           | 897 ++++++++++++++++++----------------
 target/arm/hvf/hvf.c          |   2 +-
 target/arm/m_helper.c         |   6 +-
 target/arm/op_helper.c        | 113 +++--
 target/arm/translate-a64.c    | 395 ++++++---------
 target/arm/translate-m-nocp.c |  12 +-
 target/arm/translate-neon.c   |  21 +-
 target/arm/translate-sve.c    | 207 +++-----
 target/arm/translate-vfp.c    |  76 +--
 target/arm/translate.c        | 400 +++++++--------
 34 files changed, 2026 insertions(+), 1834 deletions(-)
 create mode 100644 target/arm/cpregs.h

-- 
2.25.1


