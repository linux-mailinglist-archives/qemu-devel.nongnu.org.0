Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B87BE4B8561
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:18:05 +0100 (CET)
Received: from localhost ([::1]:47018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHNs-00080V-SB
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:18:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHI-00046o-0W; Wed, 16 Feb 2022 05:11:16 -0500
Received: from [2607:f8b0:4864:20::236] (port=33470
 helo=mail-oi1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nKHHG-00027e-90; Wed, 16 Feb 2022 05:11:15 -0500
Received: by mail-oi1-x236.google.com with SMTP id x193so1946398oix.0;
 Wed, 16 Feb 2022 02:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TGfrQCAUgiOU3yV0Qgw5Sh4DJszJcIO/Bsr1yYZPDU=;
 b=GAuij8BthxGr+cCwjeK4FpjWLUhq+JaB/vGlISU/8HPbJGAKXTrCs539mJYuWyllrV
 joUqR9llODj+KWkalDffwB7mKsvu429INI2cX+WqVF6wa331DRB5Lv1vUrBqmID7rM6B
 VyfGxGSnheqos13nsFOTT504xVilZ2aR/pp2JitVisDQG+TBL6SY9QMjwNlxlJIInJlP
 eet1sXTHXrakL1eOpZ1cj4T5CVtmWJqslN5sbAgDJyA0QxWUM8cO/6yhop1Rrz1FjPH1
 oN195dYXC2S9xswVFJV5FglfcsbTieX8ISfeJCkQFDWOR5biMXtbCV/mNJIvydxXfcm+
 jyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TGfrQCAUgiOU3yV0Qgw5Sh4DJszJcIO/Bsr1yYZPDU=;
 b=RUXCNSAteZWYJbtWFiqwsPCsFMNvh7l/NGZMc5Cnd1k7FA1Fi8e9wKGx5V02mJ/js4
 XnIeGDLps1Mo7z2DS+UI0IRSJN31xIsn7f2BlceePngvAb/0yTNgShyIl5R1ObHJtktx
 TAVG6UCLnU6FCRjUc3anpdRJ350BkOaoag8urUeu5tmhNhC4wemw0tsTr2XBbfBBKty3
 801YEJuQcfnnpSpm5TgCiCJdnLYwHH3q0l+lXwlP32EV46Zrwr8iOHrVMe1j3RTonnor
 DuYBEEjvleH9hwDitnCTUZWcI3be8QK8AhthmFIKA4VSgvQZFcrFK8Ipm2OKhYqXzgGZ
 WhxA==
X-Gm-Message-State: AOAM531RjuAnK1V3GKtyw9lxtUpah1Xgyt0HZw3sVaV5Mjs2zRoojCR9
 ehIrOjo/Fg5+TWiVLHzeXqUZQMpNU1s=
X-Google-Smtp-Source: ABdhPJxA2T/T33Z5zNYfkpWEzr0Uk4RcHEC6+dP9K8Q6TQ3fm4dZJ1/aR5hquamCMPt0fWQgT6EWDg==
X-Received: by 2002:a05:6808:118f:b0:2d4:13f1:8504 with SMTP id
 j15-20020a056808118f00b002d413f18504mr300158oil.90.1645006272597; 
 Wed, 16 Feb 2022 02:11:12 -0800 (PST)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:367f:eb9c:8725:6b7f:76b3])
 by smtp.gmail.com with ESMTPSA id
 y1sm17612689oad.38.2022.02.16.02.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 02:11:12 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 0/5] PMU-EBB support for PPC64 TCG
Date: Wed, 16 Feb 2022 07:10:57 -0300
Message-Id: <20220216101102.179158-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::236
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version adds a new patch (patch 2) that fixes --disable-tcg
--disable-linux-user compilation.

The series was based on upstream master.

Changes from v12:
- patch 2 (new):
  * make power8-pmu.c compile only with CONFIG_TCG available
- patch 4 (former 3):
  * added Cedric's r-b
- v11 link: https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02693.html

Daniel Henrique Barboza (5):
  target/ppc: fix indent of powerpc_set_excp_state()
  target/ppc: make power8-pmu.c CONFIG_TCG only
  target/ppc: finalize pre-EBB PMU logic
  target/ppc: add PPC_INTERRUPT_EBB and EBB exceptions
  target/ppc: trigger PERFM EBBs from power8-pmu.c

 target/ppc/cpu.h         |  5 ++-
 target/ppc/cpu_init.c    |  9 +++--
 target/ppc/excp_helper.c | 83 +++++++++++++++++++++++++++++++++++++++-
 target/ppc/helper.h      |  1 +
 target/ppc/machine.c     |  2 +
 target/ppc/meson.build   |  2 +-
 target/ppc/power8-pmu.c  | 39 +++++++++++++++++--
 target/ppc/power8-pmu.h  |  4 +-
 8 files changed, 133 insertions(+), 12 deletions(-)

-- 
2.34.1


