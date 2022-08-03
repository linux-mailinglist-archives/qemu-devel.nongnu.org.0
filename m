Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D701588E46
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 16:10:06 +0200 (CEST)
Received: from localhost ([::1]:57902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJF4X-00066n-GN
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 10:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEga-0002u1-DD; Wed, 03 Aug 2022 09:45:21 -0400
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oJEgO-0004me-VH; Wed, 03 Aug 2022 09:45:10 -0400
Received: by mail-vs1-xe34.google.com with SMTP id 125so17871054vsd.5;
 Wed, 03 Aug 2022 06:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=x1paQIhjwjwO6KemPMIz425gp2/OgyCnHqPvFbYQelY=;
 b=OsZ1+NagSgEet+T7nJxwq5e3eTL4dXAQVr17e4dyhGibI1Kz1SKAA8mkY2gIh8TS78
 okRndrwKFYp8TAgukzTi1crfE3+mpEUUq2MbKm1ogwZdw6+So/uam8kdoAhb5/VS/Znd
 5fcmdW+XZEfhNzGPfDvlCojMg57L++0VmIaGsQ0IW6N5pEzdvxJR5Lcssfnl8TEuUawk
 H/sqUzqUndPp26Ttt7bphawj5tIXD38h6y1caErNtHw18QQtnmKcYiAZth10i+8dYgMk
 /1J1BoPFEz8RnZgaqBinH97Ql8twppJhTgJfbF6Vvj/x0eiPzo0tImNgr5P3JT02bwoj
 wCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=x1paQIhjwjwO6KemPMIz425gp2/OgyCnHqPvFbYQelY=;
 b=qMmOYQjG0dcnmh/LbsCuMNEIsWKbro6Ky+QQyI+WlxDtESQTdAYy4z+Dalie2qX5aD
 k6NB59zc9IBpUNyUx7J9RezzxHuZTZFLd57GfqMN9y4FoCYZFNfAXpMr/uQLRECnn5IM
 S+PJT4MQU+dBiT1kmtonAireiMnuZKSUWisUZiAvZ5rFILg87odlBgU0Ojtwuj8KgzK9
 7e+QV8k6o051Ih9lt42/rWRmErX7LSeoGLlbhDQZcxdZJlqX/bwPmtfotyc4siuiCWcT
 svjPaPxCrBt4X/CsyayopenodEpmFzcNTe+UAa1cqjbYJzzE1l5IgRn59eTqng89sLBX
 KnWw==
X-Gm-Message-State: ACgBeo2zMa93J73V9/Xq9DSIMSuMGWOgLmwZNUF++uSpG1pH/j1Jy9s+
 pJM721EDyUOsoP7WVGd6q2hYL5eYq0o=
X-Google-Smtp-Source: AA6agR4g4YZC78p9/v/ZsShi5qLXZskkFspOJsyglbxNgjbFeDMx0bmIosZ6lfeFZMe6GKEFN6I/vg==
X-Received: by 2002:a05:6102:d89:b0:379:2914:9cfa with SMTP id
 d9-20020a0561020d8900b0037929149cfamr7584685vst.18.1659534307139; 
 Wed, 03 Aug 2022 06:45:07 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:52e2:fb25:323c:5709:7237])
 by smtp.gmail.com with ESMTPSA id
 q201-20020a1f2ad2000000b00377fba67271sm932420vkq.34.2022.08.03.06.45.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 06:45:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH for-7.2 00/10] enable pnv-phb user created devices
Date: Wed,  3 Aug 2022 10:44:49 -0300
Message-Id: <20220803134459.2633902-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e34;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a rebase on top of ppc-7.2 of the previous patches sent
here:

https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg01542.html

Now that we have the pnv-phb rework in the tree.

As a recap, the changes introduced in this series compared to what we've
done in "[PATCH v2 00/16] powernv: introduce pnv-phb base/proxy
devices" [1], is:

- the Root Buses objects are now inheriting phb-id and chip-id. This
turned out to be a clean way of keeping the code QOM compliant, without
having to do things like dev->parent_bus->parent. All the attributes
that the root port needs are found in its bus parent;

- the logic exclusive to user created devices is all centered in a
single helper inside pnv-phb realize(). PHB3/PHB4 realize() are
oblivious to whether the device is user created or not. I believe this
approach is clearer than what I was doing before.

[1] https://lists.gnu.org/archive/html/qemu-devel/2022-05/msg06254.html

Daniel Henrique Barboza (10):
  ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
  ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
  ppc/pnv: set root port chassis and slot using Bus properties
  ppc/pnv: add helpers for pnv-phb user devices
  ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
  ppc/pnv: enable user created pnv-phb for powernv8
  ppc/pnv: add PHB4 helpers for user created pnv-phb
  ppc/pnv: enable user created pnv-phb powernv9
  ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
  ppc/pnv: user creatable pnv-phb for powernv10

 hw/pci-host/pnv_phb.c          | 166 ++++++++++++++++++++++++++++++---
 hw/pci-host/pnv_phb3.c         |  50 ++++++++++
 hw/pci-host/pnv_phb4.c         |  51 ++++++++++
 hw/pci-host/pnv_phb4_pec.c     |   6 +-
 hw/ppc/pnv.c                   |  30 +++++-
 include/hw/pci-host/pnv_phb3.h |   9 +-
 include/hw/pci-host/pnv_phb4.h |  10 ++
 include/hw/ppc/pnv.h           |   6 +-
 8 files changed, 308 insertions(+), 20 deletions(-)

-- 
2.36.1


