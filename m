Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF6E5FAB17
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 05:23:24 +0200 (CEST)
Received: from localhost ([::1]:59228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi5rW-0007vh-Q1
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 23:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nc-0002Di-NE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:22 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:47076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nX-0002z5-K9
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:19:16 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y8so12319827pfp.13
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CxVI4rO5bFW1ai6WrTjeyj0rW1YdO7UMXKRiY4kqRj8=;
 b=F83CPI5s+qVqIR0FBsFOGjjsllNHz7/R7XbbhbAul5uffCcHpkWH0WvuJqbQoJb1hQ
 TNHTpb8vFWYXYhSs+nqriP+1ZW4ISfGcQZldoOpRvl9y4RsHfWP5bJAzsrdy6hkZOUnk
 aOlu0vEP4gAl3EEmy4L/4jdMZlHd1CmpaqxIVIeCcdNAiAHi15VTi6oj3Xmte24rqslN
 Fe38iMXfNJax4TNJ6+X0HFQ/0Ocv9tQs0kYOUnEYFKq2/yg7a/iRlKc1z65E1SJTEU4P
 c4V9Q0g5AluN4dUhBuCDI5dcoLAbCNxK3T1l/RSwGx1Bk0eVaI4DduWlxuZSXWuz8Ywl
 aDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CxVI4rO5bFW1ai6WrTjeyj0rW1YdO7UMXKRiY4kqRj8=;
 b=mqtUlVqJ9hk2afEKtVnfdrhgQXfqeRAQyY33XKoFBuVle5LFZbKL9/GLpvIkdh44py
 D20oDDZyE6hYPQMuRz//R2Ej+MYu4+m5MYN5ftYWM4Y80326NxJ7hRwaD/LeWY3qxloZ
 D+PVi4TufLN10XfHua7q1PFyLOCPGg4BRuv/haljKm9MoHDSRNBmQENg7Y9qnfiIrK8x
 uvWVMo69Q8byCi+9Cys82IHu1ItpjvesA2NRd7EkmZGKwSPt/iRraDwWByfUKGUgGW5y
 LYHZVmK0e5mEHFOU7q8AicOWJFsUAFHn95j9l+rwgnGjti5b8AYvhX4Kof7bEIF8lJec
 /7BA==
X-Gm-Message-State: ACrzQf0ehU407QfoeXTn+069P8ZFHmTnNLdVQk5mFjrT4SEqOuxrFM1d
 NqAVJDOJMrU9AoEvHmozaUIHUh/JUOGtHw==
X-Google-Smtp-Source: AMsMyM5kUmF9Z/4nHRVvKciB6TpeDRzwCaH/om8xodedrxxsI3DPv7d+8RSyn9MDAa0jHW5wMOckQA==
X-Received: by 2002:aa7:8893:0:b0:563:89e0:2d43 with SMTP id
 z19-20020aa78893000000b0056389e02d43mr4994480pfe.25.1665458353954; 
 Mon, 10 Oct 2022 20:19:13 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 00/24] target/arm: Implement FEAT_HAFDBS
Date: Mon, 10 Oct 2022 20:18:47 -0700
Message-Id: <20221011031911.2408754-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changes for v4:
  * Rebase on today's target-arm.next pull, including 21 patches.
  * Split AF and DB enablement into two patches.
  * Perform only one atomic update per PTE.
  * Raise Permission fault if atomic update reqd to read-only PTE.
  * More use of S1Translate struct, which is perhaps now mis-named but
    more generally useful/used; suggestions for better naming solicited.
  * Other minor updates per review.


r~


Based-on: 20221010142730.502083-1-peter.maydell@linaro.org
("[PULL 00/28] target-arm queue")


Richard Henderson (24):
  target/arm: Enable TARGET_PAGE_ENTRY_EXTRA
  target/arm: Use probe_access_full for MTE
  target/arm: Use probe_access_full for BTI
  target/arm: Add ARMMMUIdx_Phys_{S,NS}
  target/arm: Move ARMMMUIdx_Stage2 to a real tlb mmu_idx
  target/arm: Restrict tlb flush from vttbr_write to vmid change
  target/arm: Split out S1Translate type
  target/arm: Plumb debug into S1Translate
  target/arm: Move be test for regime into S1TranslateResult
  target/arm: Use softmmu tlbs for page table walking
  target/arm: Split out get_phys_addr_twostage
  target/arm: Use bool consistently for get_phys_addr subroutines
  target/arm: Add ptw_idx to S1Translate
  target/arm: Add isar predicates for FEAT_HAFDBS
  target/arm: Extract HA and HD in aa64_va_parameters
  target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
  target/arm: Add ARMFault_UnsuppAtomicUpdate
  target/arm: Remove loop from get_phys_addr_lpae
  target/arm: Fix fault reporting in get_phys_addr_lpae
  target/arm: Don't shift attrs in get_phys_addr_lpae
  target/arm: Consider GP an attribute in get_phys_addr_lpae
  target/arm: Implement FEAT_HAFDBS, access flag portion
  target/arm: Implement FEAT_HAFDBS, dirty bit portion
  target/arm: Use the max page size in a 2-stage ptw

 docs/system/arm/emulation.rst  |   1 +
 target/arm/cpu-param.h         |  15 +-
 target/arm/cpu.h               |  57 +-
 target/arm/internals.h         |   7 +
 target/arm/sve_ldst_internal.h |   1 +
 target/arm/cpu64.c             |   1 +
 target/arm/helper.c            | 163 ++++--
 target/arm/mte_helper.c        |  62 +--
 target/arm/ptw.c               | 945 ++++++++++++++++++++++-----------
 target/arm/sve_helper.c        |  54 +-
 target/arm/tlb_helper.c        |  24 +-
 target/arm/translate-a64.c     |  21 +-
 12 files changed, 862 insertions(+), 489 deletions(-)

-- 
2.34.1


