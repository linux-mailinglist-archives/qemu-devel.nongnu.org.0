Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD6E430D3B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:05:26 +0200 (CEST)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcH5h-0000k0-G2
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2G-0006M3-EV; Sun, 17 Oct 2021 21:01:52 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:45907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2B-0008QX-18; Sun, 17 Oct 2021 21:01:48 -0400
Received: by mail-ua1-x92a.google.com with SMTP id a17so3335179uax.12;
 Sun, 17 Oct 2021 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCAzft8ux1yW2y4jn2Xe1oNts+Q33XP9t4sdV3SBiWA=;
 b=jMBp9ADJnj8ducUGCk2qCB5nCXWoWovBXwJRkMq22zRHWHEC1mWR1luBOU5pR3t58z
 TXJ2fhfHZTLYh93l4Aw7rPDESjnQTA/lJSk5Rd6ifa685ubyrgKE8Zuf34HTJtKv4JuL
 MfB4GiondYBZYuKa1euL9a/rrd8gWRvwcI133nXhfUJ+Dwu0UW0Mwgp0dVVbt9x7t9FF
 N+iunCcPeFcAgUVxXHF9vRdyR0+y9zMXMR0nOd0kiGtMhQ7gTFWvvYUktswHvrfr9B/U
 GknrIpiChlVpD1H9RS8uBW+LUtFjqbpRcExkDtGz/wz8OwfwBEbfMp3u/Xyy5pcIhMlo
 5E5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SCAzft8ux1yW2y4jn2Xe1oNts+Q33XP9t4sdV3SBiWA=;
 b=WbTR1BryKO0cOd4tAq4rw5WSDN7SKy/VbckTrPktnmCTHAJQyw1S4PXbJzkGm0kW6n
 5Cb/LkVXP4eK2N0sMu2uBg6c30p9A8aV+3P8w3n+UxqDgRAds9z9rYJD5CW6qkDfjNfT
 IkAS7yys8GMiX5WIPwgXwY+whVQilpl/IZBckgHstJAxEgcezvfX7dCFCWUtuo4ZWGHH
 70QDJIfP+HD4xovxV9O+EOaStAEJF531ie7USYbZpe5vi11m8wL6oG0st9/V9pjP3Jtf
 qgHn51ujZqWXjzMtH5BJBOAKn7kP9jef4+7iWswbUcqgp2mjJo8/mmnjDx3AuV2UznQQ
 Dthw==
X-Gm-Message-State: AOAM533sZD4wzSmRmXyjI9CC4RrErrDXswyJ3Q5gjsL+XC/c/Eb/hfT1
 tbnHCKXe+ybxEkqUat6nnQFNCaD/mcQ=
X-Google-Smtp-Source: ABdhPJzkX/Ut1XQh6p2J9Gfpmhpt1hY4RPxFkFFArbu9pcn35hJojne09IqOul8JzyC1ARIWHGVsVw==
X-Received: by 2002:ab0:63d1:: with SMTP id i17mr22915510uap.115.1634518904633; 
 Sun, 17 Oct 2021 18:01:44 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:01:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/15] PPC64/TCG: Implement 'rfebb' instruction
Date: Sun, 17 Oct 2021 22:01:18 -0300
Message-Id: <20211018010133.315842-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92a;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92a.google.com
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

This new version presents drastic design changes across all areas, most
of them based on the feedback received in v3.

- TCG reviewers: for people looking to review only TCG related changes,
here's a summmary of where are the TCG code in the series:

* Patches that have a lot of TCG/translation changes: 1-4, 9, 13
* Patches that have TCG/translation bits: 6, 7, 10, 11

- changes in v3:

The most drastic change is in the PMU. We're now working with an
abstraction called PMUEvent that holds all the event information that
the helper functions need to process it: the PMC, the event type and an
overflow timer for cycle events. The PMU will always have 6 PMCEvent
structs, one for each counter. Counters that aren't being used in that
moment will have event type 'invalid'. These events are populated only
when MMCR1 is written. Calculating the PMC values does not require
multiple calls to 'get_PMC_event()', which has been deleted. In fact,
this design change cut 60 lines of the power8-pmu.c file compared to the
previous version, resulting in a more concise logic that will allow for
easier extension of the PMU in the future.

Another change was related to PMCC bits and access control of problem
state to PMU registers. We're now exposing both PMCC bits and doing a
proper access control for groupA regs.

A new file was created to host the PMU translation code. The 300+ lines
of the new power8-pmu-regs.c.inc file would be dumped into translate.c.

I've also changed the patch order. The exclusive EBB patches were pushed to
the end of the series. I find it easier to add the placeholders for the
PMC interrupt right at the start but populate them later on, after all
the PMU logic has already been in place, instead of adding PMU code,
then EBB, then go back to PMU code again.

All other changes were result of these decisions described above.

- patch 13 (former 08):
  * renamed arg_RFEBB to arg_XL_s
  * added Matheus' R-b
- other patches:
  * The changes were so substancial that the patch breakdown with the diffs
turned out cumbersome and contraproductive.
- v3 link: https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg01250.html 


Daniel Henrique Barboza (13):
  target/ppc: add MMCR0 PMCC bits to hflags
  target/ppc: add user read/write functions for MMCR2
  target/ppc: adding user read/write functions for PMCs
  target/ppc: introduce PMU events
  target/ppc: initialize PMUEvents on MMCR1 write
  target/ppc: PMU basic cycle count for pseries TCG
  target/ppc: enable PMU counter overflow with cycle events
  target/ppc: enable PMU instruction count
  target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA) event
  target/ppc: PMU: handle setting of PMCs while running
  target/ppc/power8-pmu.c: handle overflow bits when PMU is running
  PPC64/TCG: Implement 'rfebb' instruction
  target/ppc/excp_helper.c: EBB handling adjustments

Gustavo Romero (2):
  target/ppc: add user read/write functions for MMCR0
  target/ppc: PMU Event-Based exception support

 hw/ppc/spapr_cpu_core.c                |   6 +
 target/ppc/cpu.h                       |  89 +++++-
 target/ppc/cpu_init.c                  |  38 +--
 target/ppc/excp_helper.c               |  92 ++++++
 target/ppc/helper.h                    |   5 +
 target/ppc/helper_regs.c               |  10 +
 target/ppc/insn32.decode               |   5 +
 target/ppc/meson.build                 |   1 +
 target/ppc/power8-pmu-regs.c.inc       | 320 +++++++++++++++++++
 target/ppc/power8-pmu.c                | 410 +++++++++++++++++++++++++
 target/ppc/power8-pmu.h                |  25 ++
 target/ppc/spr_tcg.h                   |  12 +
 target/ppc/translate.c                 |  67 ++++
 target/ppc/translate/branch-impl.c.inc |  33 ++
 14 files changed, 1093 insertions(+), 20 deletions(-)
 create mode 100644 target/ppc/power8-pmu-regs.c.inc
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


