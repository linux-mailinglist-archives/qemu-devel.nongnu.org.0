Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBC696B49
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:20:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyxD-0001fI-Rf; Tue, 14 Feb 2023 12:18:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyxB-0001eb-AY; Tue, 14 Feb 2023 12:18:53 -0500
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org>)
 id 1pRyx9-0004pp-CY; Tue, 14 Feb 2023 12:18:53 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4PGSbh1Pn8z4x7W;
 Wed, 15 Feb 2023 04:18:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGSbc6kyxz4x5W;
 Wed, 15 Feb 2023 04:18:36 +1100 (AEDT)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 0/8] aspeed: I2C fixes, -drive removal (first step)
Date: Tue, 14 Feb 2023 18:18:22 +0100
Message-Id: <20230214171830.681594-1-clg@kaod.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=ZGUx=6K=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hello,

This series starts with a first set of patches fixing I2C slave mode
in the Aspeed I2C controller, a test device and its associated test in
avocado.

Follow some cleanups which allow the use of block devices instead of
drives. So that, instead of specifying :

  -drive file=./flash-ast2600-evb,format=raw,if=mtd
  -drive file=./ast2600-evb.pnor,format=raw,if=mtd
  ...

and guessing from the order which bus the device is attached to, we
can use :

  -blockdev node-name=fmc0,driver=file,filename=./bmc.img
  -device mx66u51235f,bus=ssi.0,drive=fmc0
  -blockdev node-name=fmc1,driver=file,filename=./bmc-alt.img
  -device mx66u51235f,bus=ssi.0,drive=fmc1 
  -blockdev node-name=pnor,driver=file,filename=./pnor
  -device mx66l1g45g,bus=ssi.1,drive=pnor
  ...

It is not perfect, the CS index still depends on the order, but it is
now possible to run a machine without -drive ...,if=mtd.

This lacks the final patch enabling the '-nodefaults' option by not
creating the default devices if specified on the command line. It
needs some more evaluation of the possible undesired effects. 
Thanks,

C.

Cédric Le Goater (6):
  m25p80: Improve error when the backend file size does not match the
    device
  tests/avocado/machine_aspeed.py: Add I2C slave tests
  aspeed/smc: Replace SysBus IRQs with GPIO lines
  aspeed/smc: Wire CS lines at reset
  aspeed: Introduce a spi_boot region under the SoC
  aspeed: Add a boot_rom overlap region in the SoC spi_boot container

Klaus Jensen (2):
  hw/i2c: only schedule pending master when bus is idle
  hw/misc: add a toy i2c echo device

 include/hw/arm/aspeed_soc.h     |   3 +
 include/hw/i2c/i2c.h            |   2 +
 hw/arm/aspeed.c                 |  60 ++++++------
 hw/arm/aspeed_ast2600.c         |  13 +++
 hw/arm/aspeed_soc.c             |  14 +++
 hw/arm/fby35.c                  |   8 +-
 hw/block/m25p80.c               |   4 +-
 hw/i2c/aspeed_i2c.c             |   2 +
 hw/i2c/core.c                   |  37 +++++---
 hw/misc/i2c-echo.c              | 156 ++++++++++++++++++++++++++++++++
 hw/ssi/aspeed_smc.c             |  29 +++++-
 hw/misc/meson.build             |   2 +
 tests/avocado/machine_aspeed.py |  10 ++
 13 files changed, 279 insertions(+), 61 deletions(-)
 create mode 100644 hw/misc/i2c-echo.c

-- 
2.39.1


