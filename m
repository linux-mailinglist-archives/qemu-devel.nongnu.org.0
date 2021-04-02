Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9E3530D3
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 23:44:00 +0200 (CEST)
Received: from localhost ([::1]:38892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSRaB-0002J4-Uy
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 17:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYe-0000Ci-PU
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:24 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:42796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSRYb-0007ed-N7
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 17:42:24 -0400
Received: by mail-pl1-x635.google.com with SMTP id t5so1068859plg.9
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 14:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=my/oizYOfGSKHjqFxgz12b0sXRSUCcnmLjwztszRaTU=;
 b=o+DedswhFh64UOZRWa8ZDzOkY4AboQ9SjPcJrxTk+bH2jQCI0OdTW66zJsafs9Pu3H
 SuhVjV1u0BkD6oWEc0m4L8nKmV1e2hf61jr0ul5tsCGMIylkzmhHCnSNBYQp3o91AhA+
 nJvYlfI67vgqw5MLIi53cbfeew3cGcg0SIOkZlNa5uCfP+IM3xe0dJ9MSfpGAafViYK5
 CQZQSkvjFHcOvXK2ZGkKNnir+CQ78XAOBIjpLFCT1xyJFYLuWWBnwSJ34d3ERfDxQ8jh
 8Qoe13qytOC39C11In849TvPapoLm8Sxe4aFdsk412JGRWILA3RH7DPJdbFs3MtM2/xW
 3FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=my/oizYOfGSKHjqFxgz12b0sXRSUCcnmLjwztszRaTU=;
 b=H5gfUbBciAiDyZDEmv+sA2teOZuIUFH3A3xLOFbECv3ZP+FVC26HQO0i3c2XErg3UV
 YddPCBm7r8kxHZaZL4vf05+dY+9eKDwinhH9iIEUjppqixI+TLKodNRz8+OsCIXx8Ibv
 dZpP/fpJdu3VceRfjf02SZWkfs0/z/kI940zMLhlqWKvhVb3j5F6i62M7zmsV72WX+Ja
 mYoSByVS3TEDbvF2sKpw085F4LiVrI/2URuHdVbUacQiFohJDZjNOtdha0kD61gQ/PY8
 cIWpW2O2IcB+YV9aCNBMCVHLCfVS7vFzB97C9M2kqjQ0K6qziqoqyGOpkNR6tE3648lu
 QbGQ==
X-Gm-Message-State: AOAM532GJtKNfGAGPBgWsdjpsIz59X9GH7bPkCqRAUxL/cwuBOX7XrVF
 hxZYETXnXvOdwhYmpKbzcxBg6Cqa1IYB7w==
X-Google-Smtp-Source: ABdhPJx2b5xxIhwnmAcHaTzjD2KEHEHLnFP+bccGHBV8o43iQBHnP2xRvX5fqqumIZgY5WXxc8rxdA==
X-Received: by 2002:a17:903:18a:b029:e6:7fc1:1c2a with SMTP id
 z10-20020a170903018ab02900e67fc11c2amr14202455plg.5.1617399740136; 
 Fri, 02 Apr 2021 14:42:20 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id f16sm7923329pfj.220.2021.04.02.14.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 14:42:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/11] target/arm mte fixes
Date: Fri,  2 Apr 2021 14:42:06 -0700
Message-Id: <20210402214217.422585-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Changes for v3:
  * linux-user mprotect fix moved to start, just to get it out
    of the way while I reworked the others.

  * Patch 2, the fix for unaligned accesses, has been split into 9.
    Hopefully these are much easier to review than previously.

    Technically only patches 1-6,11 are required for bug fixing.
    Patches 7-10 are only cleanups, but I think they're important
    for clarity post bug fixing.


r~


Richard Henderson (11):
  accel/tcg: Preserve PAGE_ANON when changing page permissions
  target/arm: Check PAGE_WRITE_ORG for MTE writeability
  target/arm: Fix unaligned mte checks for mte_checkN
  target/arm: Split out mte_probe_int
  target/arm: Fix unaligned checks for mte_check1, mte_probe1
  test/tcg/aarch64: Add mte-5
  target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
  target/arm: Merge mte_check1, mte_checkN
  target/arm: Rename mte_probe1 to mte_probe
  target/arm: Simplify sve mte checking
  target/arm: Remove log2_esize parameter to gen_mte_checkN

 target/arm/helper-a64.h           |   3 +-
 target/arm/internals.h            |  10 +-
 target/arm/translate-a64.h        |   2 +-
 tests/tcg/aarch64/mte.h           |   3 +-
 accel/tcg/translate-all.c         |   9 +-
 target/arm/mte_helper.c           | 169 ++++++++++++------------------
 target/arm/sve_helper.c           | 100 ++++++------------
 target/arm/translate-a64.c        |  22 ++--
 target/arm/translate-sve.c        |   9 +-
 tests/tcg/aarch64/mte-5.c         |  44 ++++++++
 tests/tcg/aarch64/mte-6.c         |  43 ++++++++
 tests/tcg/aarch64/Makefile.target |   2 +-
 12 files changed, 216 insertions(+), 200 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-5.c
 create mode 100644 tests/tcg/aarch64/mte-6.c

-- 
2.25.1


