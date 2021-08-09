Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DBD3E464B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:13:48 +0200 (CEST)
Received: from localhost ([::1]:48150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD56A-00053G-UX
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53g-00024z-4j; Mon, 09 Aug 2021 09:11:12 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:46051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD53d-000186-Fk; Mon, 09 Aug 2021 09:11:11 -0400
Received: by mail-qk1-x735.google.com with SMTP id bl17so10627536qkb.12;
 Mon, 09 Aug 2021 06:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MJctKj+2NkclgdNpY8JxGmncZS4s2kf2MK5lHxnmWg=;
 b=Gt0t348DwOS0KO1kHyukdcaATvFaszauz2FRqdmQOcWYQERre8Nd0v9M3VEhMdofwr
 jORURHNo/1cLFHXiUDBOPD/5fIingRjfk6s1y6S41QWfth5r6vy1vLAx972GTP61wxla
 11bq+bInlp5zl2bU60w6Tjj6xSqIvj2qAAcoCSX78grQWUjOjFazlYibRRVmsBvKvBqY
 wb2DPSTQP1dQoNos4pTxV7Gn8L/R8zKHua0e01qanq21HprtMm8kjOcPcsfe6se2VKi3
 Q4oTgLVtemyq+fkTuAl+5kgdrTgj65929L3w9qE58S8Ege7i1Ooi8xd6YA/NL/Z3jgAp
 3ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MJctKj+2NkclgdNpY8JxGmncZS4s2kf2MK5lHxnmWg=;
 b=PR05MAFhOfPFzhjLu+6ZBT9uob+oepFprYxo464R3p3IVzxGupihI+rDZfnFs8RYrA
 vGimSUmdrOTQFxpMowIhEdZ6J0mcung3hXy1Mrcq42Z6O+NbYUXMStFvkj9iJzH+u5Dg
 H7jIng4wmvlHmrZkByQYMvUSVSn/Rf4M5Mfz6iFqhN+zCBe5Um5/5uuJC6C5P2zo2ZA0
 PkkF4dbLA3bHuUGJQ799e6hK0c9h+u5u2bRUVaFUS3XYUNnyvepwj/ygZsLesLYjHYrT
 8hWV50u5n3FDbE9/1TVnuK1oNLbFL9Fkn48jctOFpJ8m5XYz8VwFaN0xu8cZxm1YxIJo
 9olQ==
X-Gm-Message-State: AOAM533MfhgHDJHsT8SNWPLRZns9B2GhbUOsXXkIN1OPw9dcZ8Mm0ZGo
 vak6poEecQLbX+GD9YszAqlUAgIpW+6kGw==
X-Google-Smtp-Source: ABdhPJxO9tPlGzgGQL0gcVd8e5gWDZK+u+fqT1A1lZM2HNQx2VYrqsaCL1LSqlKE+my9zoqaXke+Yw==
X-Received: by 2002:a05:620a:1134:: with SMTP id
 p20mr23028850qkk.397.1628514666272; 
 Mon, 09 Aug 2021 06:11:06 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:05 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/19] PMU-EBB support for PPC64 TCG
Date: Mon,  9 Aug 2021 10:10:38 -0300
Message-Id: <20210809131057.1694145-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x735.google.com
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this series we introduce Event-Based Branch (EBB) support for PPC64
TCG. EBB consists of a new instruction called 'rfebb' and interrupt/exception
logic that redirects the userspace next intruction pointer to another address,
and the rfebb instruction restores execution back afterwards.

One way to exercise EBB is the Linux kernel selftests, located in the
kernel tree tools/testing/selftests/powerpc/pmu/ebb). These tests uses
the PMU (Performance Monitor Unit). We don't have a PPC64 PMU implementation
available, so to validate the EBB implementation we also introduced a
rudimentary PPC64 PMU for TCG. The PMU will not count anything but instructions
and cycles. There is no support for sampled/random events that are enabled by MMCR2.
Not all MMCR0 bits are being used. The limitations and capabilities of
this PMU implementation is described in the docs in the last patch.

This work was started by Gustavo Romero in 2020. You can find Gustavo's
patches in his branch at [1]. Gustavo's current work email is CCed in
the patches so he can follow and participate in the review process if he
wants to.

These patches can be divided in 3 parts: 

- Patches 1 to 8: basic PMU support for instructions/cycles counting
- Patches 9 to 11: EBB implementation
- Patches 12 to 18: implement counter negative PMU alerts to trigger EBB
exceptions

Both the PMU and EBB are based on the PowerISA 3.1 specification. 

One notable limitation of the PMU implementation is the icount
precision. Using the PMU powerpc kernel tests, located in
tools/testing/selftests/powerpc/pmu, we will consistently fall short in
tests where 10M or more instructions are sampled, with an error rate of
around 0,07%.  I am not certain whether this has to do with the logic
implemented here or with an icount precision limit, or both. Since our
objective here is to validate the EBB logic I am overlooking these
errors. All that said, any input/feedback related to how we can improve
the instruction count is welcome.

The benchmark for this implementation is the EBB powerpc kernel tests,
located in the kernel tree in tools/testing/selftests/powerpc/pmu/ebb.
Of the current 22 EBB tests presented in the kernel v5.13 we can pass 20
of those all the time. . 'instructions_count_test' suffers from the same
limitations of the PMU tests mentioned above. 'lost_exception_test' will
pass sometimes, although the most common scenario is a failure. Since
this is a heavy focused PMU test that happens to use EBB I am also
overlooking its failure.

[1] https://github.com/gromero/qemu/commits/ebb


Daniel Henrique Barboza (15):
  target/ppc: add exclusive Book3S PMU reg read/write functions
  target/ppc: PMU Book3s basic insns count for pseries TCG
  target/ppc/pmu_book3s_helper.c: eliminate code repetition
  target/ppc/pmu_book3s_helper: enable PMC1-PMC4 events
  target/ppc/pmu_book3s_helper.c: icount fine tuning
  target/ppc/pmu_book3s_helper.c: do an actual cycles calculation
  target/ppc/excp_helper.c: POWERPC_EXCP_EBB adjustments
  target/ppc/pmu_book3s_helper.c: enable PMC1 counter negative EBB
  target/ppc/translate: PMU: handle setting of PMCs while running
  target/ppc/pmu_book3s_helper.c: add generic timeout helpers
  target/ppc/pmu_book3s_helper: enable counter negative for all PMCs
  target/ppc/pmu_book3s_helper: adding 0xFA event
  target/ppc/pmu_book3s_helper.c: add PMC14/PMC56 counter freeze bits
  target/ppc/pmu_book3s_helper.c: add PM_CMPLU_STALL mock events
  docs/specs: add PPC64 TCG PMU-EBB documentation

Gustavo Romero (4):
  target/ppc: add exclusive user read function for PMU regs
  target/ppc: add exclusive user write function for PMU regs
  PPC64/TCG: Implement 'rfebb' instruction
  target/ppc: PMU Event-Based exception support

 docs/specs/index.rst           |   1 +
 docs/specs/ppc-tcg-pmu-ebb.rst |  71 +++++
 hw/ppc/spapr_cpu_core.c        |   6 +
 target/ppc/cpu.h               |  47 +++-
 target/ppc/cpu_init.c          |  54 ++--
 target/ppc/excp_helper.c       |  61 +++++
 target/ppc/helper.h            |   2 +
 target/ppc/meson.build         |   1 +
 target/ppc/pmu_book3s_helper.c | 466 +++++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h           |   4 +
 target/ppc/translate.c         | 151 ++++++++++-
 11 files changed, 834 insertions(+), 30 deletions(-)
 create mode 100644 docs/specs/ppc-tcg-pmu-ebb.rst
 create mode 100644 target/ppc/pmu_book3s_helper.c

-- 
2.31.1


