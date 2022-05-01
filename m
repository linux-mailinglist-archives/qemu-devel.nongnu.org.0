Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F325516215
	for <lists+qemu-devel@lfdr.de>; Sun,  1 May 2022 07:56:28 +0200 (CEST)
Received: from localhost ([::1]:45690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nl2ZG-0001Y5-Pa
	for lists+qemu-devel@lfdr.de; Sun, 01 May 2022 01:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2TZ-0006jf-U9
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2TY-0001Du-26
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:33 -0400
Received: by mail-pl1-x62d.google.com with SMTP id c11so32112plg.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvWfOgiVlCa+nQRvoGR+8amS647lN/tp51n8nbuHT9A=;
 b=UYOh/JChReDOHzCABmR4USMKZY+xDB1iQy8go0UfcQIhQIosqjulUUedBDdOr6W/CV
 oHpJX2GmIIIRn+yQtcJnlZ8dWaK7z0kvYAXojNJqzgEqwxkMZdYwoMQC0eO2TiCJksU3
 MgHPkWRkcc5XecrJZ7K9RXeJhiFaEulygl2LMsMvAXXohieYX3PskwZN/rg6MYfSDRQS
 M67ftDdrx/X2GiFo6UGeNy6sevqyfJant+6XcCv9sJ7woROfw1RKasol0N/cWnrk3MiG
 Kz9WxPvKRv2SuAHYjDJ7z6hT5pFf/Twy7K22UeYC04730lEWn/czzq/t2IknASGNpnIY
 2PjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zvWfOgiVlCa+nQRvoGR+8amS647lN/tp51n8nbuHT9A=;
 b=mNeRgaNkyDrzW8z/+XxOdWRr9zxJPrbMleY6shMRu8/VXRtfOkt96iJJ1UqR+UqZ0j
 Uhq8MqxoUlBW9wxJULcD3aY7MgFP3eJmNlaIyjuinuiYvI3nkVj+sfoPeb4EN+rbVK79
 a5ye7Wxo5iQDgmSv0u4aaoVzuaRhRefCzAvp3ZKboyUsBI/bR6CohEdWOwNUWl0KKNZj
 mEHu6RQOB4mW4Ir7h1iGamLY+txlEsHix7oOedCrkPylwHf2W7Zj1jxUbkY3Ss1l2cAq
 KGK05bZFQZRPmaCM5v7BzWg95+5NRjrsX4+UVsjkBhNCupUyCAd9aMD+hvNxL76f6c33
 /KUg==
X-Gm-Message-State: AOAM5310yajbD1VNg4ykw4ypgooLY45HaUM6TdVgr84lnqOns701lfbz
 5kIvEB8wRQSJ47RTa7T9XCD3Jh3quoFx+g==
X-Google-Smtp-Source: ABdhPJwK4P33QRAHX/brZrY+0r1CiDlBUrAm1pA0kAK6WyHIl4o/CLuB7KycQiFXJXe+hN2/+BouXQ==
X-Received: by 2002:a17:90b:33ca:b0:1d7:d322:9aa2 with SMTP id
 lk10-20020a17090b33ca00b001d7d3229aa2mr7010713pjb.21.1651384230147; 
 Sat, 30 Apr 2022 22:50:30 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/45] target/arm: Cleanups, new features, new cpus
Date: Sat, 30 Apr 2022 22:49:42 -0700
Message-Id: <20220501055028.646596-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Rebase on master, where the first third is upstream.
  * Split changes to add_cpreg_to_hashtable into bite sized chunks.
  * Add ARM_CP_EL3_NO_EL2_{UNDEF,KEEP} flags.
  * Fix access check for SCXTNUM_ELx (damien).

Patches lacking review:
  05-target-arm-Reorg-ARMCPRegInfo-type-field-bits.patch
  06-target-arm-Avoid-bare-abort-or-assert-0.patch
  10-target-arm-Drop-always-true-test-in-define_arm_vh.patch
  11-target-arm-Store-cpregs-key-in-the-hash-table-dir.patch
  12-target-arm-Merge-allocation-of-the-cpreg-and-its-.patch
  13-target-arm-Hoist-computation-of-key-in-add_cpreg_.patch
  14-target-arm-Consolidate-cpreg-updates-in-add_cpreg.patch
  15-target-arm-Use-bool-for-is64-and-ns-in-add_cpreg_.patch
  16-target-arm-Hoist-isbanked-computation-in-add_cpre.patch
  17-target-arm-Perform-override-check-early-in-add_cp.patch
  18-target-arm-Reformat-comments-in-add_cpreg_to_hash.patch
  19-target-arm-Remove-HOST_BIG_ENDIAN-ifdef-in-add_cp.patch
  20-target-arm-Handle-cpreg-registration-for-missing-.patch
  21-target-arm-Drop-EL3-no-EL2-fallbacks.patch
  22-target-arm-Merge-zcr-reginfo.patch
  34-target-arm-Add-minimal-RAS-registers.patch
  41-target-arm-Enable-FEAT_CSV2_2-for-cpu-max.patch


r~


Richard Henderson (45):
  target/arm: Split out cpregs.h
  target/arm: Reorg CPAccessResult and access_check_cp_reg
  target/arm: Replace sentinels with ARRAY_SIZE in cpregs.h
  target/arm: Make some more cpreg data static const
  target/arm: Reorg ARMCPRegInfo type field bits
  target/arm: Avoid bare abort() or assert(0)
  target/arm: Change cpreg access permissions to enum
  target/arm: Name CPState type
  target/arm: Name CPSecureState type
  target/arm: Drop always-true test in
    define_arm_vh_e2h_redirects_aliases
  target/arm: Store cpregs key in the hash table directly
  target/arm: Merge allocation of the cpreg and its name
  target/arm: Hoist computation of key in add_cpreg_to_hashtable
  target/arm: Consolidate cpreg updates in add_cpreg_to_hashtable
  target/arm: Use bool for is64 and ns in add_cpreg_to_hashtable
  target/arm: Hoist isbanked computation in add_cpreg_to_hashtable
  target/arm: Perform override check early in add_cpreg_to_hashtable
  target/arm: Reformat comments in add_cpreg_to_hashtable
  target/arm: Remove HOST_BIG_ENDIAN ifdef in add_cpreg_to_hashtable
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
 target/arm/cpregs.h           | 462 +++++++++++++++++
 target/arm/cpu.h              | 416 ++--------------
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 +
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/pxa2xx.c               |   2 +-
 hw/arm/pxa2xx_pic.c           |   2 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 hw/intc/arm_gicv3_cpuif.c     |   6 +-
 hw/intc/arm_gicv3_kvm.c       |   3 +-
 target/arm/cpu.c              |  84 ++--
 target/arm/cpu64.c            | 353 +++++++------
 target/arm/cpu_tcg.c          | 232 ++++++---
 target/arm/gdbstub.c          |   5 +-
 target/arm/helper.c           | 909 ++++++++++++++++++----------------
 target/arm/hvf/hvf.c          |   2 +-
 target/arm/kvm-stub.c         |   4 +-
 target/arm/kvm.c              |   4 +-
 target/arm/machine.c          |   4 +-
 target/arm/op_helper.c        | 100 ++--
 target/arm/translate-a64.c    |  32 +-
 target/arm/translate-neon.c   |   2 +-
 target/arm/translate.c        |  36 +-
 28 files changed, 1604 insertions(+), 1126 deletions(-)
 create mode 100644 target/arm/cpregs.h

-- 
2.34.1


