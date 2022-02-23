Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCAD4C1E86
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:34:20 +0100 (CET)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nN0DD-0001Bx-O8
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:34:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Ah-0006HT-TL
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:43 -0500
Received: from [2607:f8b0:4864:20::434] (port=46622
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nN0Af-0001Ap-Me
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:31:43 -0500
Received: by mail-pf1-x434.google.com with SMTP id i21so170830pfd.13
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 14:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rchUU4zOX0BPe/9YEpHNPbaJ9WTLO7q01iqF+jngknc=;
 b=sr84YBsS3UhI193reYUNlrpbz1BB3SE0Uio3w14BppvEDCj5d1bPawlf/wh2wKQfFl
 9h2BrihJAxylrkfOCbLOibgU0zJoTQToZ66fkISS9misUsnxc/RrxCtXw7e08spg17GJ
 Q95q5/eHVCi0iOnw9iDRNpQ+boVRxLRKU587gzyDO2NWZqR1K2KIAJdkQ1jrj8BkXqtL
 stk+rm/3JMQSQjWo04tSPgEcJsizc2aV1mQnlmnlOVnWozzNuMpmEtsmnmPCjIhU3k49
 AmdfSixKPZg/AMiFHnfUsj1rAr+UZmkZ3O70L/VSFkJvsD/TBDw9NwrsOUJ3liFuZ2mV
 Z3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rchUU4zOX0BPe/9YEpHNPbaJ9WTLO7q01iqF+jngknc=;
 b=I/zQ8RKZZ4paX4t8llUwNpNalMbti+QdZCUxXTWaBt35kYdfs2xR2iI3BY1lrZWyhZ
 14CmQH+GZ9STkVJIQ9XlNvSndJNd62FCKo3ZaRKWngUrvy7W7HkSxBxMck+S7uKoT8w3
 cBNfyAc77HzR+/gYHD+HYwYuFX8wznfxZUR8e65w3SmmDwyhLWjwbPYkieeaCcxXw5mX
 +0OksfZvC+7vw7dBhixbJeeqzh8/YtV1twPAjpKyQjDmFY0V3BogWBS8VMBZixLDRGkm
 pLCpYRa591VaQF1/Prwo0VzEkxRAxYDLzvdm17sxnM5NbjUwgerbT1MWr2P0022rFYTo
 rO2A==
X-Gm-Message-State: AOAM531ElNUNR00D7MPXx6yasuXiAB3qkw4DFI8FKBZEnwu2r+IKWY76
 THdPDfOYqtOQpqnGUHfIhJxfl9BcHL97mg==
X-Google-Smtp-Source: ABdhPJxJ7JSuqO8yDmIZuHMWOwO70U0ClbEVxPLemGmKSnV6c9daLtqo+FI/zOdsr3Mj1u+0yMFSvA==
X-Received: by 2002:a62:7ad5:0:b0:4e1:5bda:823b with SMTP id
 v204-20020a627ad5000000b004e15bda823bmr1786609pfc.75.1645655500355; 
 Wed, 23 Feb 2022 14:31:40 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id f8sm533815pfv.100.2022.02.23.14.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 14:31:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
Date: Wed, 23 Feb 2022 12:31:20 -1000
Message-Id: <20220223223137.114264-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v3:
  * Update emulation.rst.
  * Split out separate update to ID_AA64MMFR0.
  * Hack for avocado.

If the avocado hack isn't acceptable, perhaps just drop the
last two patches for now?


r~


Richard Henderson (17):
  hw/registerfields: Add FIELD_SEX<N> and FIELD_SDP<N>
  target/arm: Set TCR_EL1.TSZ for user-only
  target/arm: Fault on invalid TCR_ELx.TxSZ
  target/arm: Move arm_pamax out of line
  target/arm: Pass outputsize down to check_s2_mmu_setup
  target/arm: Use MAKE_64BIT_MASK to compute indexmask
  target/arm: Honor TCR_ELx.{I}PS
  target/arm: Prepare DBGBVR and DBGWVR for FEAT_LVA
  target/arm: Implement FEAT_LVA
  target/arm: Implement FEAT_LPA
  target/arm: Extend arm_fi_to_lfsc to level -1
  target/arm: Introduce tlbi_aa64_get_range
  target/arm: Fix TLBIRange.base for 16k and 64k pages
  target/arm: Validate tlbi TG matches translation granule in use
  target/arm: Advertise all page sizes for -cpu max
  tests/avocado: Limit test_virt_tcg_gicv[23] to cortex-a72
  target/arm: Implement FEAT_LPA2

 docs/system/arm/emulation.rst |   3 +
 include/hw/registerfields.h   |  48 ++++-
 target/arm/cpu-param.h        |   4 +-
 target/arm/cpu.h              |  27 +++
 target/arm/internals.h        |  58 +++---
 target/arm/cpu.c              |   3 +-
 target/arm/cpu64.c            |   8 +-
 target/arm/helper.c           | 332 ++++++++++++++++++++++++++--------
 tests/avocado/boot_linux.py   |   4 +-
 9 files changed, 384 insertions(+), 103 deletions(-)

-- 
2.25.1


