Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DF03F62BC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:35:19 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZOQ-0006dC-Bd
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZK5-0007Dj-Lj; Tue, 24 Aug 2021 12:30:49 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:36601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZK3-0008HC-Pj; Tue, 24 Aug 2021 12:30:49 -0400
Received: by mail-qt1-x82d.google.com with SMTP id t32so2017458qtc.3;
 Tue, 24 Aug 2021 09:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bBT6Xdid8L437pKlUldOWHQAm3WHpbTeQnC5TtfJ7fI=;
 b=MppsoAZlYbe5R3NKipbsGWbdSESebUSyM9oErKCOMNmG8xEcRnXPKympdfbZzvfBGK
 QhNRD3MLwitiRkB8COgcSYAl1HlCkCghGmvd4qAMGgW2dCQkuSEuDm3ZTsCJupFLFROr
 /h8lo2rSlSyd4742MH2xHVb638QiNnfaq4OopwwegAQ30Ke2fFsbWwiAo8MU28+9pa6J
 QPF5GfjhoYjQH1LgSt2U5nB0WNVjdg9N8UpbL87ilqSvqWP0z+w7VyzA9LrpQnfnskVF
 FIfunrKq2kelRylP7jUOOffrBICxST6rpc6iQIDKu1ffNR4EQxx3vPWRWgjkR3ieC0NM
 X2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bBT6Xdid8L437pKlUldOWHQAm3WHpbTeQnC5TtfJ7fI=;
 b=WQxrtCfrODaKqlhRAOLjaky77tkUgH7O33l+Bnc+m6unwfg/RqVvmjBt3Imy7YPxmJ
 bZUhExAi3VTPAb3Q1MUZDjrva+swN9WtOmDT1ay+mtqpL0SelH2qlgbzCkQ86Hm+X2fO
 3fnLxLYtt6K8kbA+O+joA0W7Pc9Z7ypTpi/P3evhFwGLyPfcAB3NFlSLtE2EE244muzB
 zlOCRp7i//2FdhwMgWtbRwmNi+XEY+fIRsEeJG9fnKZdOlzjmJUeO5k9eSwK8qRcXVB8
 GGt4r22BM9Dw+xHANjaomMApw634gj4tXmCnuvEnZotLJJ9La44IyT6zmr6bvNwu6Gbj
 vfCg==
X-Gm-Message-State: AOAM533I1YpPc7fU/mmkvaNO2iXhZez9DzAd48R+s8vdRQnmGKk4lK7q
 oYISY50Q5nQUC6FZzRjQTcQEdjWLteA=
X-Google-Smtp-Source: ABdhPJzZin3WV7ycTZDdr66jmEtsDDG8NCrkIg7T7mp9hOi3M2KCiyS06pmc8VtMUxXwAme/zzXCcQ==
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr12942511qtb.367.1629822644815; 
 Tue, 24 Aug 2021 09:30:44 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:30:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/16] PMU-EBB support for PPC64 TCG
Date: Tue, 24 Aug 2021 13:30:16 -0300
Message-Id: <20210824163032.394099-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82d.google.com
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
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This second version is considerably different than the first one.
All changes were made based on review comments from David and Richard,
along with some design changes I decided to make along the way.

Patches were rebased using current David's ppc-for-6.2 tree.

Changes from v1:
- all patches:
  * ppc64-linux-user build tested

- patches 1-3:
  * do not expose 'env->spr' to make MMCR0 access control
  * PMCC was added in hflags to make MMCR0 access control
  * do not use generalist functions with reg switches

- patches 4-8:
  * helper file was renamed to 'power8_pmu.c'
  * no longer use icount to count instructions and cycles
  * cycle counting is now made using time intervals
  * instruction counting now uses a helper inside translate.c that
  counts instructions during translation block end
  * PM_RUN_INST_CMPL (insns completed with run latch) is now implemented
  accordingly
  * PM_CMPLU_STALL events were dropped 

- patches 9-11:
  * rfebb was implemented from scratch using decode tree

- patches 12-16:
  * cycle overflow now uses 5 independent timers, one for each cycle
  capable counter
  * instruction overflow is now triggered via the translation.c helper
  * new patch (16): add capability to enable/disable cycle counter
  overflow when the PMU is running 

- documentation patch was dropped for now. I will re-send it when
this work is more ironed out.

v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg01477.html


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

Gustavo Romero (3):
  target/ppc: add user read functions for MMCR0 and MMCR2
  target/ppc: add exclusive user write function for MMCR0
  target/ppc: PMU Event-Based exception support

 hw/ppc/spapr_cpu_core.c                |   6 +
 target/ppc/cpu.h                       |  55 ++-
 target/ppc/cpu_init.c                  |  36 +-
 target/ppc/excp_helper.c               |  85 +++++
 target/ppc/helper.h                    |   4 +
 target/ppc/helper_regs.c               |   3 +
 target/ppc/insn32.decode               |   5 +
 target/ppc/meson.build                 |   1 +
 target/ppc/power8_pmu.c                | 467 +++++++++++++++++++++++++
 target/ppc/power8_pmu.h                |  25 ++
 target/ppc/spr_tcg.h                   |   7 +
 target/ppc/translate.c                 | 218 ++++++++++++
 target/ppc/translate/branch-impl.c.inc |  32 ++
 13 files changed, 925 insertions(+), 19 deletions(-)
 create mode 100644 target/ppc/power8_pmu.c
 create mode 100644 target/ppc/power8_pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


