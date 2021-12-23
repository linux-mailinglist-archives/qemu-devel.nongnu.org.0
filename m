Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6047E8BD
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 21:24:03 +0100 (CET)
Received: from localhost ([::1]:57210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0Ud8-0003vT-IK
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 15:24:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXn-0003KL-QA; Thu, 23 Dec 2021 15:18:31 -0500
Received: from [2607:f8b0:4864:20::92d] (port=43614
 helo=mail-ua1-x92d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n0UXk-0004LQ-Vp; Thu, 23 Dec 2021 15:18:31 -0500
Received: by mail-ua1-x92d.google.com with SMTP id 107so11776542uaj.10;
 Thu, 23 Dec 2021 12:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hkN0yapJrY3Nuz4NnCxwQaHGJ631iFTMyENnOFIEp8=;
 b=i8U7QXdhLixReDjvD7PCtG2uUCQQzLI7NG5HCl3bG4WuWu2zY1ygjTWys0eohHShwV
 O+DkjUpQGetHDXAduFxxY5vQoxqkLLmMQ3a7/M6DcCxNt6/69K7fJCIWSOLfwCJdZ/wW
 NlOpkE35d6GxtndC86njjAl3qDeN55UVal8scz9Aie/aJCGqVPYWiL9X2YZP5IqGRyaZ
 Dgyr+6TsZ9qfmgtDJ5OB3bCOpMOSb/A/cuADitebdUBKeOAYs97/1BQB93TMybRnYX29
 2GPbSZtCAeC+ecxm0vqvlPj9o0/WssjeBpW9jG4iKQU6Lmeo0EatQ0hfoNjKHnMBTPK5
 lVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hkN0yapJrY3Nuz4NnCxwQaHGJ631iFTMyENnOFIEp8=;
 b=MHJAi1DoladLYjlB7fbzu9vYNMEvtTa/dajWH3ztyQVNzIzr3euBWjGAwKy87UHzej
 vRdG+WzeAYZy8/uLfuk42yB31IcblDBYzWS4THaOyeB/atTyEz2V/F7oij+9AX4tfnUH
 18H/EqP5GR7fRN73MWl+q4vr7uSKg6tzIw1SDVcVqABeRLM88TiQSI4aGtezrBVyVMsw
 h45HvWFOZ2C/4XAiiXSx5Sgs0gOiWcCBxQTDA9zZzTlPNkTTY5WmYWa4WY/8r5A3V1MG
 vedSe9ztvXAwpODQ4ulUPcGinrCShqYv1dPVT5bj/rIIdfDIx1XwntJt1vpIY5EaCaTu
 CXcQ==
X-Gm-Message-State: AOAM530LlyYUVNHk++HO5D2JOPjy4MiSTcGnKoh3g2ck5tURnMtwJyBf
 7qyzEjulYd0zPJv96SHdmcoMssmRmxA=
X-Google-Smtp-Source: ABdhPJzysoXAyk7IvTKcMnRr+Kk2bOKfP7x5QazADp5PcMkQIBe/FDbgk1Q93yrKs6z4x04mKmdHSg==
X-Received: by 2002:a67:24c3:: with SMTP id k186mr393577vsk.74.1640290702797; 
 Thu, 23 Dec 2021 12:18:22 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:7ce4:b718:2cc0:32df:97ee])
 by smtp.gmail.com with ESMTPSA id f20sm1185114vsl.31.2021.12.23.12.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 12:18:22 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5]  Re-write PPC64 PMU instruction count using TCG Ops
Date: Thu, 23 Dec 2021 17:18:07 -0300
Message-Id: <20211223201812.846495-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
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
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

In this version the tedious repetition was taken away from the
code by using a helper that increments the PMCs based on specified
conditions.

As far as Avocado test goes, the performance is the same as the previous
version. All PMU-EBB kernel selftests are also passing. Basically we have
the same benefits from v1 but 150+ lines shorter.

changes from v1:
- former patches 2-6: removed
- new patch 2:
  * added inc_spr_if_cond() helper
- new patch 3:
  * add insn count for PMCs 1-4
- patch 4 (former 7):
  * use a loop to reduce code repetition when checking for counter
overflows 
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03871.html


Daniel Henrique Barboza (5):
  target/ppc: introduce power8-pmu-insn-cnt.c.inc
  target/ppc/power8-pmu-insn-cnt: introduce inc_spr_if_cond()
  target/ppc/power8-pmu-insn-cnt: add PMCs1-4 insn count
  target/ppc/power8-pmu-insn-cnt: add pmu_check_overflow()
  target/ppc/power8-pmu.c: remove helper_insns_inc()

 target/ppc/helper.h                  |   2 +-
 target/ppc/power8-pmu-insn-cnt.c.inc | 213 +++++++++++++++++++++++++++
 target/ppc/power8-pmu.c              |  60 +-------
 target/ppc/translate.c               |  44 +-----
 4 files changed, 220 insertions(+), 99 deletions(-)
 create mode 100644 target/ppc/power8-pmu-insn-cnt.c.inc

-- 
2.33.1


