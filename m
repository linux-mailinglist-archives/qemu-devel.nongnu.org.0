Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C387645DCF6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:10:28 +0100 (CET)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGOI-000595-Mn
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:10:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMQ-0002UP-Qs; Thu, 25 Nov 2021 10:08:30 -0500
Received: from [2607:f8b0:4864:20::a2a] (port=37548
 helo=mail-vk1-xa2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mqGMO-00020K-NR; Thu, 25 Nov 2021 10:08:30 -0500
Received: by mail-vk1-xa2a.google.com with SMTP id e27so4130430vkd.4;
 Thu, 25 Nov 2021 07:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHLvdvLcQb9H19EuG4R7X/kgHzkvCdKl1KuA85PV8VI=;
 b=Xr7EpCZhlwZr2RPGLrtomENjWOWq+r9/hREWrrs5ziEXOX+tLjQxAGtgJrlaZFlVVG
 C4jVRJUexZzisM3v6oj/EBemDnftBIs+aoBEe6cxVfp1Ja+KyYeMaZG3EZyiyogq6tBG
 Zu0cSxeFWZiYgogkLEOuLzyHENnY9l0YNlHBX5l0PfscqLJEBYTogMTrhcwI2IbNg6mL
 8JA2aWZ0v2Dqgm0flmAFIaARc5c0Ea6RvayE0qVLsfP5U94Zk76cYron02fyr1e0xUXe
 qHoRxNnwmNb1ND6GSSaCs2iWv9QF8xIgVcYjHaoASLOOZ/4y8ea6v1eIVRcL5r9zt2HY
 iOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FHLvdvLcQb9H19EuG4R7X/kgHzkvCdKl1KuA85PV8VI=;
 b=aZEVwpqcj81uDYQXjGMs703cBnv1uhmgqUGi/10XSkHj0ZDPqcJHsvtYyS/w6gn4XT
 D+ePvziYB1shKJGvL3aChhOQ4QyEka0sS4HSjFHGyUgBlePIccfZhqyfzOW/kwlzhDil
 WfUS6rYh40IBxjCJV7nBkulcVRu6mOP90hawGip9yUUmmlZ27sQUZcu2U/an4HAIYA31
 hBZt2TUufSzOan2lOpgzHL82x0Z6vCq7ljCAd5X1QWuh0fT+Mq9Ck4Em3ZySl00Vm6HY
 x3RgUaNfv2/7JPqKJIn72Fs0ct/0RVdxx6GnQ699HWUPtoZzIjorqchYuMVzd2fRnkT+
 LQcA==
X-Gm-Message-State: AOAM532kCakJoQD/5LrR98vDDvOCcc3To4wyY5r1sgQu54rUdsvyBU+y
 +8jkDCpgMvCQzNhRMAPl6bUJIWsPnPw=
X-Google-Smtp-Source: ABdhPJw2N3ERRK9QrI0vJ6d9/BoEcdQktmkq5y22/IiqZUcgUnXzJtpKOqIR2KQvyGt/KwrYEReT4Q==
X-Received: by 2002:a05:6122:218b:: with SMTP id
 j11mr12314247vkd.11.1637852907159; 
 Thu, 25 Nov 2021 07:08:27 -0800 (PST)
Received: from rekt.ibmuc.com ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id i27sm2081057uab.8.2021.11.25.07.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:08:26 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/10]  PMU-EBB support for PPC64 TCG
Date: Thu, 25 Nov 2021 12:08:07 -0300
Message-Id: <20211125150817.573204-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2a;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa2a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this new version considerable changes were made based on David's
feedback of the previous version. All the counter frozen logic was
moved from the body of helper_store_mmcr0 to pmc_get_event() via a
new PMUEventType called PMU_EVENT_INACTIVE. The function
pmu_update_cycles() is now called in multiple instances to update
the counter values before a change in the PMU state might be made.

All this changes culminated into the removal of the 'cycle session'
idea that was present in the previous version. The logic is now more
straightforward for all the other aspects of the PMU.

Changes from v7:
- patch 1:
  * added David's R-b
  * added PMU_EVENT_INACTIVE event
- patch 2:
  * 'cycle count session' concept was removed
  * pmc_update_cycles() is now a helper that can be called at
all times to update the PMCs using the current MMCR0/MMCR1 states
  * logic using curr_FC and old_FC inside helper_store_mmcr0
was removed
  * renamed getPMUEventType() to pmc_get_event()
- patch 3 (former patch 6):
  * moved up and now also handles PMC updates on PMC read
- patch 4 (new):
  * update counters on MMCR1 write
- patch 5 (former 3):
  * a new helper 'pmc_update_overflow_timer' was added to handle
changes on a single overflow counter
  * writes on a PMC, instead of trigger an update on all overflow
timers, will update just its own timer
- former patch 7: merged into patch 5
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg04185.html


Daniel Henrique Barboza (9):
  target/ppc: introduce PMUEventType and PMU overflow timers
  target/ppc: PMU basic cycle count for pseries TCG
  target/ppc: PMU: update counters on PMCs r/w
  target/ppc: PMU: update counters on MMCR1 write
  target/ppc: enable PMU counter overflow with cycle events
  target/ppc: enable PMU instruction count
  target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA) event
  PPC64/TCG: Implement 'rfebb' instruction
  target/ppc/excp_helper.c: EBB handling adjustments

Gustavo Romero (1):
  target/ppc: PMU Event-Based exception support

 hw/ppc/spapr_cpu_core.c                |   1 +
 target/ppc/cpu.h                       |  61 +++-
 target/ppc/cpu_init.c                  |  46 +++-
 target/ppc/excp_helper.c               |  93 +++++++
 target/ppc/helper.h                    |   6 +
 target/ppc/helper_regs.c               |   4 +
 target/ppc/insn32.decode               |   5 +
 target/ppc/meson.build                 |   1 +
 target/ppc/power8-pmu-regs.c.inc       |  69 ++++-
 target/ppc/power8-pmu.c                | 368 +++++++++++++++++++++++++
 target/ppc/power8-pmu.h                |  25 ++
 target/ppc/spr_tcg.h                   |   5 +
 target/ppc/translate.c                 |  60 ++++
 target/ppc/translate/branch-impl.c.inc |  33 +++
 14 files changed, 762 insertions(+), 15 deletions(-)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


