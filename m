Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADDE45765C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:25:44 +0100 (CET)
Received: from localhost ([::1]:44300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8Zz-0006nY-HB
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:25:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8X3-0003zG-OI; Fri, 19 Nov 2021 13:22:41 -0500
Received: from [2607:f8b0:4864:20::935] (port=36575
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8X2-0001mO-6C; Fri, 19 Nov 2021 13:22:41 -0500
Received: by mail-ua1-x935.google.com with SMTP id r15so23054653uao.3;
 Fri, 19 Nov 2021 10:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4R7RlqmOfL95uK+03Ngd9IjIcYwI/i3hxwyXnljgcQ=;
 b=UtOtt2NsRyMHSscz2DH7LrpiajkmSwmNJQMX5hqJ2farksUe+G636exqvEzkRePZYi
 W0qM4p9hXAyJ0t79kw9wmI/DOaZ+Z1MvCK4WCJz16hEUV/CA2Sf7Wgh9U0O6OZyywquS
 7fxvlvKwbB7YdtpA64XpERlZqj5ejaKWOA3aErtLGlOgOOoN30GJDIUZPv6al3ZaeawB
 /8B/Pa7gG7ixDAvjHvpdvTHWXgAjWkwOUxgC3cTmpBhpdSwlTjjC0Jg9CgOXw9ERYWI0
 tgLbJX+KP+/VxyNVBJzNvbd0pUL/OeCe/hpuE2VQvHKMvtmDIf3lOaK4f2xI+chlv5Nb
 tS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4R7RlqmOfL95uK+03Ngd9IjIcYwI/i3hxwyXnljgcQ=;
 b=jgbGGAjwbta7Bej6EMboSV6dIev4GLQlDGFGhEv7/CIyNoTWapTTF5g2fNcRIBpOwh
 yuoqk8Eo4L+h5VCMTtCrjITLYhpykz6WOz61ZRLottclkAPv1eYCHH0m9G4ldsk1vHxo
 CTacbqa4zrnP+shfsEbCBLqJADHWyZ+eo8b7584rqxbsxkK+97y4WD34I1oN0BCK6DKX
 0efYhAfY3UWy7tZxxmXkc9OWyGlL+AHvgVO5KwZlXIcVLcQPGdLHxp+8QFqQup5vXP5L
 KXUAu4OOwK0XJCMOWW7g+pc7pypnP8/fWZZsUCKO37ao7h2X4ynr0MRVJO+mRcmi63pi
 bHWQ==
X-Gm-Message-State: AOAM5319cz7iwKE6gAFn2Ep9FaF4VSMc31jMbBByR8OnW95NtIyIh2i6
 SdCuLwdlQrlt3hUkj6moqbyrKC6qaohB6g==
X-Google-Smtp-Source: ABdhPJzdZjyZar9jQ3hvA+OXCsSChKpQTux6CglJMPb5qtl2nGLZkuWBxDTOj7h063H04maAmCEWhw==
X-Received: by 2002:ab0:6ecf:: with SMTP id c15mr53875673uav.113.1637346157255; 
 Fri, 19 Nov 2021 10:22:37 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:37 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 00/10] PMU-EBB support for PPC64 TCG
Date: Fri, 19 Nov 2021 15:22:06 -0300
Message-Id: <20211119182216.628676-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x935.google.com
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

This new version contains a change in patch 1 requested by David
in the v6 review.

Changes from v6:
- patch 1:
  * move the PMU overflow timer initialization from spapr_cpu_core.c to
init_proc_POWER* functions in cpu_init.c
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01968.html

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

 hw/ppc/spapr_cpu_core.c                |   1 +
 target/ppc/cpu.h                       |  60 +++-
 target/ppc/cpu_init.c                  |  44 ++-
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
 14 files changed, 768 insertions(+), 13 deletions(-)
 create mode 100644 target/ppc/power8-pmu.c
 create mode 100644 target/ppc/power8-pmu.h
 create mode 100644 target/ppc/translate/branch-impl.c.inc

-- 
2.31.1


