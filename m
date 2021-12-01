Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B710465161
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:21:16 +0100 (CET)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRQ3-0000YP-0H
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:21:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMl-0006Hs-5M; Wed, 01 Dec 2021 10:17:51 -0500
Received: from [2607:f8b0:4864:20::92d] (port=46053
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMi-0003IR-FH; Wed, 01 Dec 2021 10:17:49 -0500
Received: by mail-ua1-x92d.google.com with SMTP id ay21so49719099uab.12;
 Wed, 01 Dec 2021 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5sOEeO53erDUsRaTRSKcJLN6UTgERc36yywqIzYDFGU=;
 b=myE3nTcCmnPQGH9yJrUfp6STh0wTfN+hIyZWJu1kAQ8ZUnaULhIpJAdf/U7rfM62QU
 YzBuRxkBTxK8mKd/gjhsnI33vwFp50rywoTm6MZEHq5AzRKvSiQUdmWFnD5Jx8znOUU5
 cmKs1ZNQLyUOkv5eXFUV3xYcu6TllwfLjnlpF78GkvYspqUgOQvwTp9uZP7h9pelQBM0
 YylTyIFBVSTaM/rFfCfZOwc2QRn4k81+UidCCzcu3Gcl6HGUY3Dd5/TMc3UQ2cnDV0iO
 TiQsQR7Ndn03WiYXqabgxgfTGRNo7fnTobRyBiMSqHObFIC+yneLbE4HlPk5vKTsvMGY
 D0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5sOEeO53erDUsRaTRSKcJLN6UTgERc36yywqIzYDFGU=;
 b=UiaTXowZyWDU5eJZxU2NBh32qZREQShL3bUb4RlsiKrLf19NpUtFEGZLHNcUSw57TC
 ubZngkG0IOxBu/RiyDEmp2iInVpyTKYCwFb95ZutdjW4+H3LDJy3BUyvXmhhxHiogKaC
 el0e9R+nMhwzU3gWYz6By8qy6df4Kc7Y/Ahq5Z0SPBi9kaOUqEVcWZD4cUu1kQOZ3UHu
 oQCdjWrgXoqQGSkeDugqhZ+Y3AujwfMgEp3pkeU2l4J0HhC5DS52huEO+8OcDe3JgxqG
 ye45ARdldO6n2x+1wu2UbdLk9TyKVsUCcFKGZP5eS6SD6SvffHUkJ7fLIShe3tPyIO98
 1P5w==
X-Gm-Message-State: AOAM533wJQ67hHGCeOF1T+IqmozxpJTn9MPgJb6pFTokFyBhXyL2c/pz
 G4LfRwKhXJkGZ2MwqveuLvx5PxcyZE0=
X-Google-Smtp-Source: ABdhPJzD7gajT4lA6KurdzRvyE153qk/kf+tyq4EVB0B1XjhQnZ60KV3ldoXJFFrlcFsF0SgbfjNJg==
X-Received: by 2002:ab0:7488:: with SMTP id n8mr8298572uap.64.1638371867114;
 Wed, 01 Dec 2021 07:17:47 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:17:46 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 00/10] PMU-EBB support for PPC64 TCG
Date: Wed,  1 Dec 2021 12:17:24 -0300
Message-Id: <20211201151734.654994-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92d;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92d.google.com
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

In this new version the most significant change is in patch 6,
where a new hflag allows us to not call the instruction helper
inside translate.c unless we're absolutely certain that there
is an instruction count event being sampled and active in the
PMU. This change turned out to be a big boost in performance
in the PMU emulation overall, most notably when dealing with
cycle events that were calling the helper needlessly. 

This and all other changes were suggested by David in his review
of the previous version.


Changes from v8:
- patch 5:
  * overflow timer of PMC5 is now marked as NULL instead of absent
- patch 6:
  * new hflags HFLAGS_INSN_CNT added to track instruction count state
  * previous HFLAGS_MMCR0FC flag removed
  * pmu_count_insns() now works partially with user mode
- patch 9:
  * fixed interrupt comment
- v8 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg05160.html


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
 target/ppc/cpu.h                       |  60 +++-
 target/ppc/cpu_init.c                  |  46 ++-
 target/ppc/excp_helper.c               |  93 ++++++
 target/ppc/helper.h                    |   6 +
 target/ppc/helper_regs.c               |   7 +
 target/ppc/insn32.decode               |   5 +
 target/ppc/meson.build                 |   1 +
 target/ppc/power8-pmu-regs.c.inc       |  69 ++++-
 target/ppc/power8-pmu.c                | 386 +++++++++++++++++++++++++
 target/ppc/power8-pmu.h                |  26 ++
 target/ppc/spr_tcg.h                   |   5 +
 target/ppc/translate.c                 |  78 +++++
 target/ppc/translate/branch-impl.c.inc |  33 +++
 14 files changed, 801 insertions(+), 15 deletions(-)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


