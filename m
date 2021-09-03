Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3DD4006B6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:37:05 +0200 (CEST)
Received: from localhost ([::1]:35266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFvs-00038m-Bs
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:37:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqY-0001hm-S9; Fri, 03 Sep 2021 16:31:34 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:37462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFqW-0001Qh-U3; Fri, 03 Sep 2021 16:31:34 -0400
Received: by mail-qt1-x82f.google.com with SMTP id l24so289776qtj.4;
 Fri, 03 Sep 2021 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uo9k3bay7dZrJBF09WKN/aKfuJTCDeWSNlu+9w6eF5c=;
 b=MrF0IkcGwu8ZveIkIDNwSewBw7UNj77zShPHPRLu5yAwzYM87hUDDnK5DahMcIaT0w
 13AxCUnluiyj8Lmm2TogcGPOl5R/lYPx8O9gtnoHP60oRBCEHj7Q4DdWQ+TqWUOkDSAf
 kXM1I2h5STw8hXUfEJO+jspTeVZSpaXm37YGvg4zJxmqTc2CLQo+ZBG3dq1jnzJw5qAt
 mgbFmh4yTXm0ForfmnQKhbOgnuO7nFgzKTruAJB0I6ijgaitwbVjJ2eSJ7wT7ml43EGl
 ZTG4ecM9GyIJJCFvdlm0H1B3KFIgX+czDE7dntEVinanNGmI4O1gprqTraSDC2ka8tJk
 TDRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Uo9k3bay7dZrJBF09WKN/aKfuJTCDeWSNlu+9w6eF5c=;
 b=jSsWM+VHChFG8Ki75wxnsgAkPzzjCswIjnTeJuLnntWr91DDzYSV39FhUEpnIYDbFN
 oA7ZJDoLIgKAJwbvwHwPZdImy8D1lEdDvdf2EGmFMo3Bz5PINqoHu1Q3XPCf0U3WSnFn
 IyWP7gHa6fMEpD4Zi4q9VArKC7TWc6mzlwAYjqs7cqgn4EewHGLQ07c5+vYD5VR3A2+3
 4ZQ4Vm45fJ8BTf+Vlxan3J+CNaXXIAtBMzjbUwGxZHnYp/VZuvOs6DV5ALomvxkP4WgE
 2FaLGI7yefbw+UPaRY27NsBrebRtJ1h2MPzt/cZLJWEbHbUNRpDWtXDi5MJTM+KIUnyP
 01CA==
X-Gm-Message-State: AOAM533foLsyMv3FroBFuW03/cxj9czUdw5Mzv2LZa41xz8/0F6aplHJ
 KOUXbO90G7Ij2p+ovKgHdUcfziiaTYA=
X-Google-Smtp-Source: ABdhPJxLSAFeUk2r7TNlWMpNy83Kzn2lhG6xzNQAXCaiCMQRbmpgB5QYO0qY/XDY+jqixgpRgzzD5Q==
X-Received: by 2002:ac8:5290:: with SMTP id s16mr774989qtn.412.1630701090983; 
 Fri, 03 Sep 2021 13:31:30 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:31:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/15] PMU-EBB support for PPC64 TCG
Date: Fri,  3 Sep 2021 17:31:01 -0300
Message-Id: <20210903203116.80628-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This version contains changes suggested by David and Matheus. No big
design changes were made.


Changes from v2:
- former patch 1: merged into patch 2 (former 3)
- patches 1 and 2 (former 2 and 3):
  * no more intermediate write reg functions that will replaced shortly after
  * do not name specialized write callbacks with '_generic'
  * put the read/write MMCR0 ureg bits in a macro
- patch 3 (former 4): 
  * do not call 'helper_store_mmcr0' in spr_write_MMCR0_ureg
- patch 4 (former 5):
  * use extract64 when extracting MMCR1 events
- patch 5 (former 6):
  * MMCR0_FC is now represented in a DisasContext flag to avoid poking into
  registers before calling the instruction count helper
- patch 6 (former 7):
  * writing SPR_CTRL now forces a new translation block
- patch 8 (former 9):
  * rename device_tree rfebb format and argument
  * crop EBBRR when !msr_is_64bit
  * put the helper inside an "#if defined(TARGET_PPPC64)"
  * use gen_invalid() when CONFIG_USER_ONLY
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg04062.html


Daniel Henrique Barboza (13):
  target/ppc: add user write access control for PMU SPRs
  target/ppc: PMU basic cycle count for pseries TCG
  target/ppc/power8_pmu.c: enable PMC1-PMC4 events
  target/ppc: PMU: add instruction counting
  target/ppc/power8_pmu.c: add PM_RUN_INST_CMPL (0xFA) event
  target/ppc/power8_pmu.c: add PMC14/PMC56 counter freeze bits
  PPC64/TCG: Implement 'rfebb' instruction
  target/ppc/excp_helper.c: EBB handling adjustments
  target/ppc/power8_pmu.c: enable PMC1 counter negative overflow
  target/ppc/power8_pmu.c: cycles overflow with all PMCs
  target/ppc: PMU: insns counter negative overflow support
  target/ppc/translate: PMU: handle setting of PMCs while running
  target/ppc/power8_pmu.c: handle overflow bits when PMU is running

Gustavo Romero (2):
  target/ppc: add user read functions for MMCR0 and MMCR2
  target/ppc: PMU Event-Based exception support

 hw/ppc/spapr_cpu_core.c                |   6 +
 target/ppc/cpu.h                       |  61 +++-
 target/ppc/cpu_init.c                  |  38 +-
 target/ppc/excp_helper.c               |  92 +++++
 target/ppc/helper.h                    |   4 +
 target/ppc/helper_regs.c               |   6 +
 target/ppc/insn32.decode               |   5 +
 target/ppc/meson.build                 |   1 +
 target/ppc/power8_pmu.c                | 470 +++++++++++++++++++++++++
 target/ppc/power8_pmu.h                |  25 ++
 target/ppc/spr_tcg.h                   |   9 +-
 target/ppc/translate.c                 | 214 ++++++++++-
 target/ppc/translate/branch-impl.c.inc |  33 ++
 13 files changed, 942 insertions(+), 22 deletions(-)
 create mode 100644 target/ppc/power8_pmu.c
 create mode 100644 target/ppc/power8_pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


