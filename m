Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1314424C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 01:31:17 +0100 (CET)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhhhs-0005DW-MZ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 20:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAm-0003sZ-On; Mon, 01 Nov 2021 19:57:06 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:41614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mhhAk-0006EO-Ji; Mon, 01 Nov 2021 19:57:04 -0400
Received: by mail-qt1-x82b.google.com with SMTP id v4so3003062qtw.8;
 Mon, 01 Nov 2021 16:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jus9Lfq18OkGeJuASfgtiJryHusXicNqNq38/Niwa58=;
 b=Ew8zEuanML7VFjYV5Y0dh2guNak9TnUxJymb1a50StJiNGSfSJusWHTaFAAuZkaZRj
 JsN9lAAoXEu3aCG01/VV7XLvo6HE6YHvPxSEVeJ5iAcox/nFBypod7+lqdEJWtFZjmHh
 j1RwMght6hccahg320TuEVvTQQO1ULzTd9HOgKolzGshmIcl1K6gByC+raKTzis2P6yG
 d1F1rOZYHcbKqbc+NE4prV0HA1HbF+1UTukEzC7G+yUXVLNx9rLNiTvvLfZr9UD0+mdZ
 7Wsk9/ztJGo0JJ32v3tnFfXEvSnoD6X95Zc6nydRVyDKwD771tmqApDO03q3M01sBgqc
 seUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jus9Lfq18OkGeJuASfgtiJryHusXicNqNq38/Niwa58=;
 b=KiB4Gt+9C8qL1dXbUb5ftfjQI/Cdw5cyEMh4M/cyP8gq57sDBMtGwo1YnEVO8qEsR2
 35pFPXp93By9LZ+t/xaA1dZmnO3DlEDJcXjWILyZNRJrsJkKLa0p3wZ1G0trSDv0swOR
 oNt5a+Jp/2BMRCXNa0PfsJVi8BD9w4JVc/DlyZVe5BAG4TwMEg80Hqzsrp7oqgxsBe6Z
 5TmckRMvuYrK3OOs2Ix/KrwilzeuQ8JDPVhpG16Fnh7zIDo/voA48eSrHa1ROepcQk4z
 my1yd5NPgRGcviemG1ma/YDMHFblnxj9nXLiyEzzAB4uGpUC0hmmFCqRhGKp1cW9bg3/
 798g==
X-Gm-Message-State: AOAM530Vh+K6pN9oqxPT6CH3tsm1mh6tYI8r00nXZkLq2Y+rkga8uH4p
 cnoO/ewtJts6a7j4+T3Us6CS5J6ODwI=
X-Google-Smtp-Source: ABdhPJwiZqAiWsZhEzbL2pq5N5gZbHLlDh5mvn/+RWlddydxs3YK85+gwGWuKn/H1i7MoaaN3/Rnqw==
X-Received: by 2002:a05:622a:c2:: with SMTP id
 p2mr1828617qtw.258.1635811020635; 
 Mon, 01 Nov 2021 16:57:00 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.174])
 by smtp.gmail.com with ESMTPSA id p187sm10927212qkd.101.2021.11.01.16.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:57:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] PMU-EBB support for PPC64 TCG
Date: Mon,  1 Nov 2021 20:56:32 -0300
Message-Id: <20211101235642.926773-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

In this new version the concept of PMUEvent was removed. We're now
using only the PMUEventType enum and retrieving it on demand via a
new helper called getPMUEventType. This also means that we're not
trapping MMCR1 writes.

Changes from v4:
- patches 1-4 from v4: already upstream
- former patch 6 (initialize PMUEvents on MMCR1 write): removed
- patch 1 (former 6):
  * removed PMUEvent type
  * overflow timers are back to CPUPPCState
- patch 2 (former 7):
  * added a new getPMUEventType() function
- other patches were changed to accomodate the changes in patch 1 and 2
- v4 link: https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg03710.html

Daniel Henrique Barboza (9):
  target/ppc: introduce PMUEventType and PMU overflow timers
  target/ppc: PMU basic cycle count for pseries TCG
  target/ppc: enable PMU counter overflow with cycle events
  target/ppc: enable PMU instruction count
  target/ppc/power8-pmu.c: add PM_RUN_INST_CMPL (0xFA) event
  target/ppc: PMU: handle setting of PMCs while running
  target/ppc/power8-pmu.c: handle overflow bits when PMU is running
  PPC64/TCG: Implement 'rfebb' instruction
  target/ppc/excp_helper.c: EBB handling adjustments

Gustavo Romero (1):
  target/ppc: PMU Event-Based exception support

 hw/ppc/spapr_cpu_core.c                |   6 +
 target/ppc/cpu.h                       |  60 +++-
 target/ppc/cpu_init.c                  |  20 +-
 target/ppc/excp_helper.c               |  92 ++++++
 target/ppc/helper.h                    |   4 +
 target/ppc/helper_regs.c               |   4 +
 target/ppc/insn32.decode               |   5 +
 target/ppc/meson.build                 |   1 +
 target/ppc/power8-pmu-regs.c.inc       |  45 ++-
 target/ppc/power8-pmu.c                | 403 +++++++++++++++++++++++++
 target/ppc/power8-pmu.h                |  25 ++
 target/ppc/spr_tcg.h                   |   3 +
 target/ppc/translate.c                 |  60 ++++
 target/ppc/translate/branch-impl.c.inc |  33 ++
 14 files changed, 748 insertions(+), 13 deletions(-)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


