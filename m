Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C044C4FC94F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 02:37:11 +0200 (CEST)
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ne4Ws-0004o8-De
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 20:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TL-0001kP-TX
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:31 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ne4TK-0001me-4F
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 20:33:31 -0400
Received: by mail-pg1-x534.google.com with SMTP id t13so15629115pgn.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoMxry4KNroNrInw/qLutWh0oJmp0gorOIKFQjnhW+k=;
 b=ihPLMmKnQT5sBs++Z911A0mKTiAJg9WeuoCW/PvZGBtvRETVYoMHF/b1XsRwro2G1t
 ARMKtSdAVFQxoHE5xK5djzNYWBqs/OP4XrDUUTKOHiznT6vwzedV0b7YBnsWmDhf3Oa+
 MRK/asBBxLjttkXjnL/s31mNQICds9LSwgBQb9/KLpluIX7OzhlrTv1u+A7MM+qctS/2
 DFP2WJJ/2VDO2lNli0By06iEtNYRBLwCyyu/3T4T9MlmYEtQplQ1zLpAQ8UtTDSn0AFC
 lX2R8sRR87XVlCCzXhyubaKNR+51BpZ/gvbT2ozEPo9FWopj6hdnQjudKhimKyAj9pO6
 f9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoMxry4KNroNrInw/qLutWh0oJmp0gorOIKFQjnhW+k=;
 b=2eDOHNKCyETYp+m2wf3TESOrx/ttAKSctJ9J1Q+RoyhePQP9a7Nj+MhwrsTImqMT6J
 LxzkXfrRAD1krPdq+wVDWkmJ1wSOGTFPB1/uiaaKy+kVpSOD2xpaP1dt0eZHqxl9HITF
 GNYwDDzrDCJ1MS0E+b8IVAIjLJChMbVSfl07FgefjFmMV44nMYWry5vb898zj9ysKBIm
 5IEm0L4/PmwpXYUuLsJ5ChkrR5Me1ntvqMMQSgoVkr1NsAJMBxnih6kp6FHAD+FVt3cS
 EiQL9Zy47e4Dn1cwRatt3o5WL0tT/eW/Cb+vBInKaDihXQqmjhhgNoCgqiaWRohcKExZ
 +gHg==
X-Gm-Message-State: AOAM533ZP3pmZrz3QPCDrx+wQnDZciY5/z55WlhOk2WXKnt45/I8bYnz
 4+oRuhL4CR2pmuQ6WamLjp5qwD9JA4xGyA==
X-Google-Smtp-Source: ABdhPJwT2je+lXEezkSivaSVQvspMZr+i1SY35Qu2Cf0TfLtCEG3ls5qaylqkGz8qkSsMYLnRPo5bQ==
X-Received: by 2002:a05:6a00:124f:b0:4fb:2608:78de with SMTP id
 u15-20020a056a00124f00b004fb260878demr34798582pfi.27.1649723608564; 
 Mon, 11 Apr 2022 17:33:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g15-20020a056a0023cf00b004e17e11cb17sm38346669pfc.111.2022.04.11.17.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 17:33:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/24] target/arm: 8 new features, A76 and N1
Date: Mon, 11 Apr 2022 17:33:02 -0700
Message-Id: <20220412003326.588530-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

For v2, combine two previous patch sets and address comments.

Patches lacking review:
  03-target-arm-Move-cortex-impdef-sysregs-to-cpu_tcg..patch
  04-target-arm-Update-qemu-system-arm-cpu-max-to-cort.patch
  06-target-arm-Split-out-arm32_max_features.patch
  12-target-arm-Add-minimal-RAS-registers.patch
  14-target-arm-Implement-virtual-SError-exceptions.patch
  20-target-arm-Enable-FEAT_CSV2_2-for-cpu-max.patch
  23-target-arm-Define-cortex-a76.patch
  24-target-arm-Define-neoverse-n1.patch


r~


Richard Henderson (24):
  target/arm: Add isar predicates for FEAT_Debugv8p2
  target/arm: Adjust definition of CONTEXTIDR_EL2
  target/arm: Move cortex impdef sysregs to cpu_tcg.c
  target/arm: Update qemu-system-arm -cpu max to cortex-a57
  target/arm: Set ID_DFR0.PerfMon for qemu-system-arm -cpu max
  target/arm: Split out arm32_max_features
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
  target/arm: Update ISAR fields for ARMv8.8
  target/arm: Enable FEAT_CSV2_2 for -cpu max
  target/arm: Enable FEAT_CSV3 for -cpu max
  target/arm: Enable FEAT_DGH for -cpu max
  target/arm: Define cortex-a76
  target/arm: Define neoverse-n1

 docs/system/arm/emulation.rst |  10 +
 docs/system/arm/virt.rst      |   2 +
 target/arm/cpu.h              |  72 +++++++
 target/arm/helper.h           |   1 +
 target/arm/internals.h        |  16 ++
 target/arm/syndrome.h         |   5 +
 target/arm/a32.decode         |  16 +-
 target/arm/t32.decode         |  18 +-
 hw/arm/sbsa-ref.c             |   2 +
 hw/arm/virt.c                 |   2 +
 target/arm/cpu.c              |  61 +++++-
 target/arm/cpu64.c            | 349 +++++++++++++++++++---------------
 target/arm/cpu_tcg.c          | 228 ++++++++++++++++------
 target/arm/helper.c           | 246 +++++++++++++++++++++++-
 target/arm/op_helper.c        |  43 +++++
 target/arm/translate-a64.c    |  18 ++
 target/arm/translate.c        |  23 +++
 17 files changed, 866 insertions(+), 246 deletions(-)

-- 
2.25.1


