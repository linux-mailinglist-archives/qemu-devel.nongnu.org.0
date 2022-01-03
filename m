Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5334838DB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:49:15 +0100 (CET)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4W8g-0006Wc-CM
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:49:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7U-0003wO-A3; Mon, 03 Jan 2022 17:48:00 -0500
Received: from [2607:f8b0:4864:20::82c] (port=33474
 helo=mail-qt1-x82c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4W7S-0001G7-O6; Mon, 03 Jan 2022 17:48:00 -0500
Received: by mail-qt1-x82c.google.com with SMTP id v4so29785952qtk.0;
 Mon, 03 Jan 2022 14:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szp4giMfDMl27b2M7EPK5svZ7FkTW6j/VKFsBp1+fAM=;
 b=KGeMydFFVqN/DMl7NRiZGuhACN807jwINTRuj8gPuCNRuKah7eOw0VetEu68nsU8Ay
 ymYGYyJyb3pRRxOyqzvduTgvVsai0836Rrh2cE+jMq7kT3fUo17cnydKFI5J0lyXsAhU
 qioWRt5LGzxrPVnQAOOQVHJ2Su4+Ua8XEXvBU7pGFBjFlT3MfW8Cq7mQyLgEdYgQKNf5
 rvnjmXfrglcDiDt/PalQfUmwNNdgdhYv8OCV2UDcQkpjKvJdysAFzOtMmRa8BBOlzDaj
 GNABGWpY6i85J8et9+xHu4sZf7kaFIyQoAkP56ITp8huNL3JPM1/VBLnhY9bmfGqreiq
 qxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=szp4giMfDMl27b2M7EPK5svZ7FkTW6j/VKFsBp1+fAM=;
 b=kcMubR+wsUqZ175KA/nooMnu8fGUxUCSQpnMS/GzClnZPUTF/j6wUuhMTu8pgistM4
 ixgaSjNMZVNJKF+SWXJ0L/vlzd+coLjsg/kxJVCkg9SY3J92NBX0tsRQOtdG/ztOm/IW
 QVjkx0NSSfTc5byBw9u/COWGnago5AY8Ft3a0vfsOmyRvQeI7AdIA45Hz14oJBOcKHmL
 qazB98+191N49+/uuB6Ws0gD1Mu+ESWRAL25HSvF4am3rSqx7Q690MkNw8HdnYPP3fif
 j1dOhASyy7moTADyNKGgS7SKQBZXzQL/io1sAg7nkpz1o7SHx6H7Uz3Vi5MNUZv3WP2j
 dX1g==
X-Gm-Message-State: AOAM533nrjwd5Qd3sAbfXTew5LhGCGUGAOSkpkouz2A1/oE6UaRrEC5b
 LKAuoCTiFw098cXy+j3OEm6B6OmW4t4=
X-Google-Smtp-Source: ABdhPJwdjVTtzry1DFft7lOKjnZ04zrwyoCVdpCz8tpSpCpopMG3Yrify3VslMC/pU+ucec0bfsMlQ==
X-Received: by 2002:a05:622a:1789:: with SMTP id
 s9mr42662124qtk.604.1641250077104; 
 Mon, 03 Jan 2022 14:47:57 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id t123sm22917176qkb.135.2022.01.03.14.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 14:47:56 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] Reorg ppc64 pmu insn counting
Date: Mon,  3 Jan 2022 19:47:42 -0300
Message-Id: <20220103224746.167831-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This new version implements Richard's suggestions made in the
v2 review.

Changes from v2:
- Patch 1:
  * fixed "PMC[1-5]" comment in target/ppc/cpu.h
- Former patch 4: squashed into patch 1
- Patch 4 (former 5):
  * use boolean variables instead of uint32_t
  * added Richard's r-b
- v2 link: https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg00117.html


Daniel Henrique Barboza (1):
  target/ppc: do not call hreg_compute_hflags() in helper_store_mmcr0()

Richard Henderson (3):
  target/ppc: Cache per-pmc insn and cycle count settings
  target/ppc: Rewrite pmu_increment_insns
  target/ppc: Use env->pnc_cyc_cnt

 target/ppc/cpu.h         |   3 +
 target/ppc/cpu_init.c    |   1 +
 target/ppc/helper_regs.c |   2 +-
 target/ppc/machine.c     |   2 +
 target/ppc/power8-pmu.c  | 238 +++++++++++++++++----------------------
 target/ppc/power8-pmu.h  |  14 +--
 6 files changed, 117 insertions(+), 143 deletions(-)

-- 
2.33.1


