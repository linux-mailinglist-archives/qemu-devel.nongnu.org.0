Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4732C689BF5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4Q-0006dG-Sg; Fri, 03 Feb 2023 09:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4H-0006ap-R4
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:34 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4F-00053Z-0q
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:33 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 hn2-20020a05600ca38200b003dc5cb96d46so6124993wmb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=rOglqmnKlXiUnvscEHWlqAHNqd4hmRxlODKJGHUABoQ=;
 b=xy1dJIQyNkosmuZ42o4vOspFSQlJYRIDBQ5cXHRVIaaWf6NUGm6Dw1qHZcILmRnMP8
 WzdZ87XJ6fh/CKTZYqVERtLcgyP155au6zHJ1Q9y02964zvesgjqfRtajXRs9aI1kmH7
 Xj7ED0o4eKHq5jj2jxx6NLXQ/rf9iOkjw+ofW4nzsvj+WFMV4sm8Ebr4A8TBH4LJh9zY
 s+r8jpOurUWG4khD4fVNkOFIUcyB/VMpJ87rUBiweNqgarN/HcPySOwZln5rOkJlFFE5
 IeJW9X0p/HBFnlo4Uu686GVXpmW2CEtSrDsUEM3AEeDCdgmPZqliCAb4tO94aLUbWCgy
 z8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rOglqmnKlXiUnvscEHWlqAHNqd4hmRxlODKJGHUABoQ=;
 b=VuKlqMAEzLWW4BT/rKD0GIfWl4uE5HLjmLbQfOtH+fUREpHjHzMX4gAAIPDbA1sBAE
 5gmDezaZgaNFJuowpv/GMGFK3Ch28c0GiqDCfqTNGw9p1x1smlB2r+M9fFmiuqEbYJl6
 C97a/KeUKvCXR1SPwZSIpblGbNoL1f/tLj7lrK/sLwZoyD2y31WBCy6w9ZDn9SGZUIa/
 X62pNC1OkMI/bUCSEgJ6eAYRWoIEN392fc9F2f5knNeUn6O6yWh7OTHEe8Ms1fBMYjIZ
 ft8+begXluIt1UuLMeN+hyjL9LLBCdnqC29+5QqrB7DuTOBVcV+br6lB5eGyzXhIJmD+
 XUeA==
X-Gm-Message-State: AO0yUKUw80tfWwUhhhq+iZOp3sjOk1DVi7bioeJykJsLMcavr/qWka+z
 U4LF95lfuals2fFVJTCEaJCLGsK0xzf3nG1n
X-Google-Smtp-Source: AK7set/Cs+ujLZfvcoHtN551gEObFwDQiX0z8IBkXGztwT0fKqWXCTWVYbMq2FBwph32R0J+qyYPlA==
X-Received: by 2002:a05:600c:1c0f:b0:3dd:1bd3:4f6d with SMTP id
 j15-20020a05600c1c0f00b003dd1bd34f6dmr9834041wms.32.1675434569369; 
 Fri, 03 Feb 2023 06:29:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/33] target-arm queue
Date: Fri,  3 Feb 2023 14:28:54 +0000
Message-Id: <20230203142927.834793-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

The following changes since commit bf4460a8d9a86f6cfe05d7a7f470c48e3a93d8b2:

  Merge tag 'pull-tcg-20230123' of https://gitlab.com/rth7680/qemu into staging (2023-02-03 09:30:45 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230203

for you to fetch changes up to bb18151d8bd9bedc497ee9d4e8d81b39a4e5bbf6:

  target/arm: Enable FEAT_FGT on '-cpu max' (2023-02-03 12:59:24 +0000)

----------------------------------------------------------------
target-arm queue:
 * Fix physical address resolution for Stage2
 * pl011: refactoring, implement reset method
 * Support GICv3 with hvf acceleration
 * sbsa-ref: remove cortex-a76 from list of supported cpus
 * Correct syndrome for ATS12NSO* traps at Secure EL1
 * Fix priority of HSTR_EL2 traps vs UNDEFs
 * Implement FEAT_FGT for '-cpu max'

----------------------------------------------------------------
Alexander Graf (3):
      hvf: arm: Add support for GICv3
      hw/arm/virt: Consolidate GIC finalize logic
      hw/arm/virt: Make accels in GIC finalize logic explicit

Evgeny Iakovlev (4):
      hw/char/pl011: refactor FIFO depth handling code
      hw/char/pl011: add post_load hook for backwards-compatibility
      hw/char/pl011: implement a reset method
      hw/char/pl011: better handling of FIFO flags on LCR reset

Marcin Juszkiewicz (1):
      sbsa-ref: remove cortex-a76 from list of supported cpus

Peter Maydell (23):
      target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs correctly
      target/arm: Correct syndrome for ATS12NSO* at Secure EL1
      target/arm: Remove CP_ACCESS_TRAP_UNCATEGORIZED_{EL2, EL3}
      target/arm: Move do_coproc_insn() syndrome calculation earlier
      target/arm: All UNDEF-at-EL0 traps take priority over HSTR_EL2 traps
      target/arm: Make HSTR_EL2 traps take priority over UNDEF-at-EL1
      target/arm: Disable HSTR_EL2 traps if EL2 is not enabled
      target/arm: Define the FEAT_FGT registers
      target/arm: Implement FGT trapping infrastructure
      target/arm: Mark up sysregs for HFGRTR bits 0..11
      target/arm: Mark up sysregs for HFGRTR bits 12..23
      target/arm: Mark up sysregs for HFGRTR bits 24..35
      target/arm: Mark up sysregs for HFGRTR bits 36..63
      target/arm: Mark up sysregs for HDFGRTR bits 0..11
      target/arm: Mark up sysregs for HDFGRTR bits 12..63
      target/arm: Mark up sysregs for HFGITR bits 0..11
      target/arm: Mark up sysregs for HFGITR bits 12..17
      target/arm: Mark up sysregs for HFGITR bits 18..47
      target/arm: Mark up sysregs for HFGITR bits 48..63
      target/arm: Implement the HFGITR_EL2.ERET trap
      target/arm: Implement the HFGITR_EL2.SVC_EL0 and SVC_EL1 traps
      target/arm: Implement MDCR_EL2.TDCC and MDCR_EL3.TDCC traps
      target/arm: Enable FEAT_FGT on '-cpu max'

Richard Henderson (2):
      hw/arm: Use TYPE_ARM_SMMUV3
      target/arm: Fix physical address resolution for Stage2

 docs/system/arm/emulation.rst |   1 +
 include/hw/arm/virt.h         |  15 +-
 include/hw/char/pl011.h       |   5 +-
 target/arm/cpregs.h           | 484 +++++++++++++++++++++++++++++++++++++++++-
 target/arm/cpu.h              |  18 ++
 target/arm/internals.h        |  20 ++
 target/arm/syndrome.h         |  10 +
 target/arm/translate.h        |   6 +
 hw/arm/sbsa-ref.c             |   4 +-
 hw/arm/virt.c                 | 203 +++++++++---------
 hw/char/pl011.c               |  93 ++++++--
 hw/intc/arm_gicv3_cpuif.c     |  18 +-
 target/arm/cpu64.c            |   1 +
 target/arm/debug_helper.c     |  46 +++-
 target/arm/helper.c           | 245 ++++++++++++++++++++-
 target/arm/hvf/hvf.c          | 151 +++++++++++++
 target/arm/op_helper.c        |  58 ++++-
 target/arm/ptw.c              |   2 +-
 target/arm/translate-a64.c    |  22 +-
 target/arm/translate.c        | 125 +++++++----
 target/arm/hvf/trace-events   |   2 +
 21 files changed, 1340 insertions(+), 189 deletions(-)

