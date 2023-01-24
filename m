Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 123DA678C61
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:01:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6k3-0007d7-GL; Mon, 23 Jan 2023 19:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6k0-0007bK-Pe
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:44 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6jv-0001jO-Tu
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:44 -0500
Received: by mail-pf1-x434.google.com with SMTP id a184so10095830pfa.9
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CL44+ydYax+R/gEeZjkpX+Dp1aSuInc2mv+DfWtfLe0=;
 b=WA3u5HlY97U1esLHHkoQW3+tYvwBUsriRxADZ1NxPO9OlRWkxH/dnjRLCSLHA5xIYL
 DpXCx59bC1olRjnZvKbWbmEFb5kuzBOrBT3pIKMaz5QBcMOJF6JtseB47V88p5mj+HLk
 XiujGJHam0AUA1jpjRN3Do9DlfNc57EQ34JA9P4nL/mSWdCpk9arUFVhb4NVDVcmkGkZ
 nhfbIx25PB/fHQ4aAupuZbhVz/JnUbp0gI/4G/yMtvRSUIWgJWcEFhJy9NNVyA+iCU+Z
 4dGMgYm5IWhQzi8u8FdD3tqHFZ7exAx3sMRUYvh1to9taIkxCrrCrHX0Mi4qoFyH0C4L
 kIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CL44+ydYax+R/gEeZjkpX+Dp1aSuInc2mv+DfWtfLe0=;
 b=iB8/4qM1VjDneyI+Yuf6V8H0FI6/T9z6VKx7cEEPvvZKexciE9A0pYngVdw8UfgrMr
 PB7pj9qWWyn9mX1+7nzrUB7IHHSRRmdXGZI0br36b0pdvulxbPZNryEr+BkYXMAwvfUK
 XbFIPh8UtbbL+S/3KrgU3XkbAS0ru3Ip+vBnj+QdSiYu7Ua9ntAfZ7GekARq1TSKd/PK
 6iR5C/jqUpEPwbG7Xw6tIJeeerao9XoNMvFN1HgvA71/sHcdNHOZ+rYnCaPY+hmwmQER
 +Qp3jAxvYxKP17OeRagoMDQEFokEXR9oBnvScWTtpSc1D5dl8N2l+O7TlKcklPBcKtUg
 foVw==
X-Gm-Message-State: AFqh2kqca3gMe+Xsp5pTwIt9LQPIdxF1l2pj5EM3iyNSEcsnEcBJYmIe
 W6XCXvVVkgmkghVDx39o/cTIAzHrFaT+k5zP
X-Google-Smtp-Source: AMrXdXuMXDjhxUs9ltwqjjhFDuwwHTiOHu7buyFgPWumj63n57FhANPFU9Lo9pKdZAJQJxJhehEAXw==
X-Received: by 2002:a62:154f:0:b0:581:3557:f75b with SMTP id
 76-20020a62154f000000b005813557f75bmr51546963pfv.5.1674518432460; 
 Mon, 23 Jan 2023 16:00:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 00/22] target/arm: Implement FEAT_RME
Date: Mon, 23 Jan 2023 14:00:05 -1000
Message-Id: <20230124000027.3565716-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

With the exception of the final patch, all of the code below is my own.
The Huawei code was based on last year's qemu-6.2, and the Granule
Protection Check was done at the wrong level.  I have integrated the
GPC into the normal arm_cpu_tlb_fill code path.

The first two patches are bug fixes that are unrelated to RME.
The bug fixed by the second patch was uncovered by the VTCR_EL2
setting used by the Realm Management Monitor included with TF-A.

The final patch is more or less a hack, required by Huawei's changes
to TF-A.  Given that current TF-A supports QEMU virt board, using FDT,
I think the correct solution going forward is to *not* skip creating
the fdt node.  I have not yet tried to build mainline TF-A and TF-RMM,
or see what has been integrated into TF-A-TESTS.  See

    https://git.trustedfirmware.org/

for the relevant repos.


r~


Richard Henderson (22):
  target/arm: Fix pmsav8 stage2 secure parameter
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
  target/arm: Move s1_is_El0 into S1Translate
  target/arm: Use get_phys_addr_with_struct for stage2
  target/arm: Add GPC syndrome
  target/arm: Implement GPC exceptions
  target/arm: Implement the granule protection check
  target/arm: Enable RME for -cpu max
  hw/arm/virt: Add some memory for Realm Management Monitor

 include/exec/memattrs.h |   9 +-
 include/hw/arm/virt.h   |   2 +
 target/arm/cpu-param.h  |   2 +-
 target/arm/cpu.h        | 143 ++++++--
 target/arm/internals.h  |  27 ++
 target/arm/syndrome.h   |   9 +
 hw/arm/virt.c           |  43 +++
 target/arm/cpu.c        |   4 +
 target/arm/cpu64.c      |  37 ++
 target/arm/helper.c     | 138 +++++++-
 target/arm/ptw.c        | 749 ++++++++++++++++++++++++++++++----------
 target/arm/tlb_helper.c |  92 ++++-
 12 files changed, 1030 insertions(+), 225 deletions(-)

-- 
2.34.1


