Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477E69D704
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 00:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUFYL-0003ee-Qy; Mon, 20 Feb 2023 18:26:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYI-0003eE-Vg
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:34 -0500
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYH-0000H1-1V
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 18:26:34 -0500
Received: by mail-pj1-x1043.google.com with SMTP id o16so2898092pjp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 15:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=t9yw/E43hG1ECC7dOsdcRXTK3p/swP0xBKKuJw06hJ8=;
 b=IdQgFmm1oKz7zEq2UDrLixMm+IWlU9QQknTocq1ryfG+MVS+UWWbQIMs7qGx0L/3cr
 imnh+eUSAQ01V4wBDjZnJnzPrtchmAix2FemgbySgTRbZ79+A0ytcgb0WXjCVUwdFS6g
 3D0fdjPsR0V9S7yqU3+lke3NzGcmOon98LrWQ3nlL1xGf3YwOUEhLoC4fv2R4GJufzMT
 nXgVB3MpKR/Id1EE2WXGtX3G9vv8hJM97HBuVPgJFonBS3xIOxFqaqgbQuqqjjXIVdJA
 5B9PxSUUBU6d4VBIaG4NM2VjPZBZPinCydEA7darEpCcw7gr01WjJ2A9VduXb6wVsdX0
 sr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t9yw/E43hG1ECC7dOsdcRXTK3p/swP0xBKKuJw06hJ8=;
 b=196FlOxOrswBY+rOhpLhnA6M9avn/4ZtXLz6ajy8q7eNy8DtlrXzxcEH2K37RAtDo3
 wlOAyKG2Vw94tjeQZEdBX4bRRqj7zyV/gCtOtYywsjuuvHXU7xT5rfZcfjpg3f9+x6Yq
 a0LOwQ9gNvmNDtcTzb4ui3lAzOhe9GPmAulkL31seCHOdcw4AzPYGjTi2jyeGJpnUxI5
 ptUBP1KaZzz4gcW1bDK+Gkgp6oqbHXCeWHLyOBSkym1HAoXKKpPYpq+6SxY0Do6bZnzv
 f3RoDRQN3jr+OLc51LUXCwsFUzcPjSB+KDhkD1Q8T9eksxGfEjVQ60er84c1ocaiJMjv
 Nb4g==
X-Gm-Message-State: AO0yUKUNFQoprafgvZiJcAeoapT3huFnAeoADvor0cRksU9vMTH9UfSy
 2zePT5G6XR9rl65XDEr9pMcGMLAKEpKdDRNyOswT+A==
X-Google-Smtp-Source: AK7set+34qc5LiwCMZkedsbbG2m//WjRSuvIk7Xl8N+R6Lt7Px/DkmagPD6/uvM5NWBAq2HE6B3Iug==
X-Received: by 2002:a17:902:d487:b0:19a:a6c4:6403 with SMTP id
 c7-20020a170902d48700b0019aa6c46403mr4772590plg.1.1676935591287; 
 Mon, 20 Feb 2023 15:26:31 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 00/21] target/arm: Implement FEAT_RME
Date: Mon, 20 Feb 2023 13:26:05 -1000
Message-Id: <20230220232626.429947-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is based on mainline, without any extra ARMv9-A dependencies
which are still under development.  This is good enough to pass
all of the tests within

    https://github.com/Huawei/Huawei_CCA_QEMU

Changes for v2:
  * Drop "Fix pmsav8 stage2 secure parameter".
  * Incorporate review feedback.
  * Mark last two patches as "NOTFORMERGE".


r~


Richard Henderson (21):
  target/arm: Rewrite check_s2_mmu_setup
  target/arm: Add isar_feature_aa64_rme
  target/arm: Update SCR and HCR for RME
  target/arm: SCR_EL3.NS may be RES1
  target/arm: Add RME cpregs
  target/arm: Introduce ARMSecuritySpace
  include/exec/memattrs: Add two bits of space to MemTxAttrs
  target/arm: Adjust the order of Phys and Stage2 ARMMMUIdx
  target/arm: Introduce ARMMMUIdx_Phys_{Realm,Root}
  target/arm: Pipe ARMSecuritySpace through ptw.c
  target/arm: NSTable is RES0 for the RME EL3 regime
  target/arm: Handle Block and Page bits for security space
  target/arm: Handle no-execute for Realm and Root regimes
  target/arm: Use get_phys_addr_with_struct in S1_ptw_translate
  target/arm: Move s1_is_el0 into S1Translate
  target/arm: Use get_phys_addr_with_struct for stage2
  target/arm: Add GPC syndrome
  target/arm: Implement GPC exceptions
  target/arm: Implement the granule protection check
  target/arm: Enable RME for -cpu max
  hw/arm/virt: Add some memory for Realm Management Monitor

 include/exec/memattrs.h |   9 +-
 include/hw/arm/virt.h   |   2 +
 target/arm/cpu-param.h  |   2 +-
 target/arm/cpu.h        | 148 ++++++--
 target/arm/internals.h  |  27 ++
 target/arm/syndrome.h   |  10 +
 hw/arm/virt.c           |  43 +++
 target/arm/cpu.c        |   4 +
 target/arm/cpu64.c      |  37 ++
 target/arm/helper.c     | 155 ++++++++-
 target/arm/ptw.c        | 748 ++++++++++++++++++++++++++++++----------
 target/arm/tlb_helper.c |  96 +++++-
 12 files changed, 1058 insertions(+), 223 deletions(-)

-- 
2.34.1


