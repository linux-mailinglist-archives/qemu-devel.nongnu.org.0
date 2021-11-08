Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79437449EC8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 23:53:01 +0100 (CET)
Received: from localhost ([::1]:50878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkDVc-0002LQ-41
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 17:53:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDTn-0000OS-2x; Mon, 08 Nov 2021 17:51:07 -0500
Received: from [2607:f8b0:4864:20::22b] (port=33736
 helo=mail-oi1-x22b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkDTk-0007N6-Fi; Mon, 08 Nov 2021 17:51:05 -0500
Received: by mail-oi1-x22b.google.com with SMTP id bl27so27350432oib.0;
 Mon, 08 Nov 2021 14:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeZQFyjaaDuaUVaVCqaVxB2IClPdIPK6d3+52cQH/vI=;
 b=XlYhWqGBrH+cA1feU83KM99JW5X4CpveeJZZrFmejoffkrfS9SwVHTN0qQgoynff+O
 KaooF6cBMV+qtczFwfI5fbxPD+NC5dAV0KmeoHk248+93gi5rimfwx0rDdw7Z0CmsfWC
 1y/jM+EG/3w6qlJYJxnuNgLBKPHHswj+YJJtsgCY85aixuSJsoP6W+fDPw50kcR1xU7/
 F3kS5iRu20BYRYJGFRiOvJqOvbg62EoBzrndBbcHRNEF1HInJUpEqtVQhWYe11kUGOy8
 Mtm9q1f8luJRx+b49TEulS17LinuhYNSSHHhg4GmuykryjQw5nFMif7XAADrCaZ597vQ
 SRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeZQFyjaaDuaUVaVCqaVxB2IClPdIPK6d3+52cQH/vI=;
 b=TbkKgtkyTsukI9UshnueQCrXP6vVDX99fHTL2XqC/AZArFqEozk28sinHtgcoEtDxB
 Pd8e1uGFzMghyUOuA5/vUW0ltktzoaUm1XHizghCrOl3Cdld6jQI/EN7xs1wPIfVGUXj
 o8FmC3V5nivEMYXe1898FMiwI7tS/vwp6VmD/8Yj3GXDDGMlZNUXrXA4iBcwcSXNOGeF
 oEDBDZw2tHuofgM5MVBMtXSHRSa+peJ2YcpwaiPbRbDuubC6PYnS1vDTnLHuwcnVQbi0
 f/UVrJ7y2RKJz7h2Jsktd1b0XpVxfhrvZQuh9cv/qpxqbbrJ47IxfxFbjqZPW6oisLgR
 93YQ==
X-Gm-Message-State: AOAM531Hgc0H/0qVklfykzdKhicMAXC5bj3j8P9AD4yNewZMclVM0jZZ
 F2tMKMdC0oT+RXglR28RCBmodfxNcMY=
X-Google-Smtp-Source: ABdhPJxmj5FfbnIFHHQARgGDdtOV/xkRzOBlZkDRBh85W1rUQFwseW6P074a0yprToiDlyT3au7T0w==
X-Received: by 2002:a54:4486:: with SMTP id v6mr1745512oiv.90.1636411862847;
 Mon, 08 Nov 2021 14:51:02 -0800 (PST)
Received: from rekt.ibmuc.com ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id h3sm6487249oih.23.2021.11.08.14.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 14:51:02 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/10] PMU-EBB support for PPC64 TCG
Date: Mon,  8 Nov 2021 19:50:37 -0300
Message-Id: <20211108225047.1733607-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22b.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This version contains changes proposed by Matheus in the
v5 review.

Changes from v5:
- patch 2:
  * added an extra argument to pmu_update_cycles() and pmc_is_active()
to consider the case where we want to consider the frozen counter bits
of a previous MMCR0 state
  * added additional logic to allow for FC14/FC56 bits to freeze their
individual counters without stopping the PMU 
- patch 3:
  * changed macro name to PMC_COUNTER_NEGATIVE_VAL and made it unsigned
  * fixed typo in comment
  * removed the extra space after '='
- patch 9:
  * check for FSCR[EBB] before firing the EBB exception

v5 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg00385.html

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
 target/ppc/excp_helper.c               |  93 ++++++
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
 14 files changed, 749 insertions(+), 13 deletions(-)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


