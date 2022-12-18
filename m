Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9C64FF45
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 16:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6vVu-0005La-5H; Sun, 18 Dec 2022 10:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqo-0008Ay-7o; Sun, 18 Dec 2022 02:12:46 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balbi@kernel.org>)
 id 1p6nqm-0000lE-D7; Sun, 18 Dec 2022 02:12:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EBE9560C55;
 Sun, 18 Dec 2022 07:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4AD3C433D2;
 Sun, 18 Dec 2022 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671347555;
 bh=c1XmusrCQSDhjrjqD8NYv7uTw9yPJTWMLhWJ+qDZIns=;
 h=From:To:Cc:Subject:Date:From;
 b=F4k/KTSY+QIHNeniPwz3Ca+otPYCJFRNJBt4jaQ4RJ48n6LOLZbsLCWUxBSFlRHIn
 xX6fD6rw2MldIvmsSwo2QqiCncqSimt4V/zajIMl145hVxXt2HDPGxSp5eHyvyV5Gb
 /3QBMiEPFVAA3NmSYSA5mwyjmMvjy5SQcCAMyJYxEpQ7jgwugvEobSu1thaYGX8/Ub
 pd1LAbWJ2gR2SpudAJpsYKRU76ev2KPLzm4y6URw9N9vpqmOzSedFQSVFuG9J50/RN
 4qk0jMMFXYRAWOZAPh9hf/WLfopuO4W27FNFIyIwcE/jwyrpwJa9igGOttISxnSXEM
 TzldzQwG++3Cg==
From: Felipe Balbi <balbi@kernel.org>
To: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 0/2] hw/arm: Add support for STM32 H405 and fix STM32F405
 memory layout
Date: Sun, 18 Dec 2022 09:12:27 +0200
Message-Id: <20221218071229.484944-1-balbi@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=balbi@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 18 Dec 2022 10:23:41 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

The following patches pass checkpatch.pl and have been tested against today's
HEAD (55745005e90a).

Felipe Balbi (2):
  hw/arm/stm32f405: correctly describe the memory layout
  hw/arm: Add Olimex H405

 MAINTAINERS                             |  6 +++
 configs/devices/arm-softmmu/default.mak |  1 +
 hw/arm/Kconfig                          |  4 ++
 hw/arm/meson.build                      |  1 +
 hw/arm/olimex-stm32-h405.c              | 65 +++++++++++++++++++++++++
 hw/arm/stm32f405_soc.c                  |  8 +++
 include/hw/arm/stm32f405_soc.h          |  5 +-
 7 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/olimex-stm32-h405.c

-- 
2.38.1


