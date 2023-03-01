Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C36A71A8
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 17:58:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXPl1-0000eV-03; Wed, 01 Mar 2023 11:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPkv-0000dQ-On; Wed, 01 Mar 2023 11:56:44 -0500
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=znpK=6Z=kaod.org=clg@ozlabs.org>)
 id 1pXPkt-0007bN-RK; Wed, 01 Mar 2023 11:56:41 -0500
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PRgPB1PHKz4x7v;
 Thu,  2 Mar 2023 03:56:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PRgP76H3pz4x1R;
 Thu,  2 Mar 2023 03:56:27 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 00/11] aspeed queue
Date: Wed,  1 Mar 2023 17:56:08 +0100
Message-Id: <20230301165619.2171090-1-clg@kaod.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=znpK=6Z=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

Here is the aspeed series I plan to send as a PR this week.

 - fix for the Aspeed I2C slave mode, an I2C echo device from Klaus
   and its associated test in avocado.   
 - initial cleanups to allow the use of block devices instead of
   drives on the command line.
 - new facebook machines and eeprom fixes for the Fuji
 - readline fix ! 

Thanks,

C.

Cédric Le Goater (4):
  tests/avocado/machine_aspeed.py: Add an I2C slave test
  aspeed: Introduce a spi_boot region under the SoC
  aspeed: Add a boot_rom overlap region in the SoC spi_boot container
  aspeed/smc: Replace SysBus IRQs with GPIO lines

Dongli Zhang (1):
  readline: fix hmp completion issue

Karthikeyan Pasupathi (2):
  hw/arm/aspeed: Adding new machine Yosemitev2 in QEMU
  hw/arm/aspeed: Adding new machine Tiogapass in QEMU

Klaus Jensen (2):
  hw/i2c: only schedule pending master when bus is idle
  hw/misc: add a toy i2c echo device

Sittisak Sinprem (2):
  hw/at24c : modify at24c to support 1 byte address mode
  aspeed/fuji : correct the eeprom size

 docs/system/arm/aspeed.rst      |   2 +
 hw/arm/aspeed_eeprom.h          |   6 ++
 include/hw/arm/aspeed_soc.h     |   5 +
 include/hw/i2c/i2c.h            |   2 +
 hw/arm/aspeed.c                 | 159 ++++++++++++++++++++++----------
 hw/arm/aspeed_ast2600.c         |  13 +++
 hw/arm/aspeed_eeprom.c          |  45 +++++++++
 hw/arm/aspeed_soc.c             |  14 +++
 hw/arm/fby35.c                  |   8 +-
 hw/i2c/aspeed_i2c.c             |   2 +
 hw/i2c/core.c                   |  37 +++++---
 hw/misc/i2c-echo.c              | 156 +++++++++++++++++++++++++++++++
 hw/nvram/eeprom_at24c.c         |  30 +++++-
 hw/ssi/aspeed_smc.c             |   5 +-
 monitor/hmp.c                   |   8 +-
 hw/misc/meson.build             |   2 +
 tests/avocado/machine_aspeed.py |  10 ++
 17 files changed, 421 insertions(+), 83 deletions(-)
 create mode 100644 hw/misc/i2c-echo.c

-- 
2.39.2


