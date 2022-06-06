Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7075E53E55A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:20:16 +0200 (CEST)
Received: from localhost ([::1]:55576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyEWd-0004qI-IC
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:20:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEKq-0004ph-UI; Mon, 06 Jun 2022 11:08:04 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:45919
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEKo-0005ws-Cy; Mon, 06 Jun 2022 11:08:04 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxgT4p5fz4xDK;
 Tue,  7 Jun 2022 01:07:49 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxgF0mrqz4xD5;
 Tue,  7 Jun 2022 01:07:36 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joe Komlodi <komlodi@google.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Klaus Jensen <k.jensen@samsung.com>, Peter Delevoryas <pdel@fb.com>,
 Corey Minyard <cminyard@mvista.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 00/21] aspeed: Extend ast2600 I2C model with new mode 
Date: Mon,  6 Jun 2022 17:07:11 +0200
Message-Id: <20220606150732.2282041-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Hello,

Here is a series aggregating recent changes proposed on the Aspeed
ast2600 I2C controller model. 

First comes a large set of changes converting the model to use the
registerfield interface and adding the I2C new register mode
(Joe). Since this is complex to review, extra tests are added to the
acceptance test suite to check that I2C devices are still functional
in the ast2600-evb machine. These tests use small buildroot images
available on GH. 

The ast1030 and ast2600 SoC share the same I2C logic. This series adds
I2C support to the ast1030 now that new register mode is supported.
There was a previous proposal from Troy doing the same but Joe's
patchset covers the same need (and converts the model to registerfield)

Follows a proposal from Klaus adding support for multi master in the
I2C core and the Aspeed I2C model, for the old register mode only. The
new register mode still needs to be addressed but this shouldn't take
too long once old register mode is merged.

Last, I have added the I2C echo device and test provided by Klaus. I
think it would be interesting to keep them for tests. Please, tell me.

Thanks,

C.

Cédric Le Goater (7):
  test/avocado/machine_aspeed.py: Move OpenBMC tests
  test/avocado/machine_aspeed.py: Add tests using buildroot images
  test/avocado/machine_aspeed.py: Add I2C tests to ast2600-evb
  test/avocado/machine_aspeed.py: Add an I2C RTC test
  aspeed/i2c: Add ast1030 controller models
  aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always
  test/avocado/machine_aspeed.py: Add I2C slave tests

Joe Komlodi (7):
  hw/registerfields: Add shared fields macros
  aspeed: i2c: Add ctrl_global_rsvd property
  aspeed: i2c: Migrate to registerfields API
  aspeed: i2c: Use reg array instead of individual vars
  aspeed: i2c: Add new mode support
  aspeed: i2c: Add PKT_DONE IRQ to trace
  aspeed: i2c: Move regs and helpers to header file

Klaus Jensen (6):
  hw/i2c/aspeed: rework raise interrupt trace event
  hw/i2c/aspeed: add DEV_ADDR in old register mode
  hw/i2c: support multiple masters
  hw/i2c: add asynchronous send
  hw/i2c/aspeed: add slave device in old register mode
  hw/misc: add a toy i2c echo device [DO NOT PULL]

Troy Lee (1):
  aspeed: Add I2C buses to AST1030 model

 include/hw/i2c/aspeed_i2c.h         | 299 ++++++++-
 include/hw/i2c/i2c.h                |  30 +
 include/hw/registerfields.h         |  70 +++
 hw/arm/aspeed.c                     |  13 +
 hw/arm/aspeed_ast10x0.c             |  18 +
 hw/arm/aspeed_ast2600.c             |   2 +
 hw/arm/pxa2xx.c                     |   2 +
 hw/display/sii9022.c                |   2 +
 hw/display/ssd0303.c                |   2 +
 hw/i2c/aspeed_i2c.c                 | 901 ++++++++++++++++++----------
 hw/i2c/core.c                       |  70 ++-
 hw/i2c/smbus_slave.c                |   4 +
 hw/misc/i2c-echo.c                  | 162 +++++
 hw/nvram/eeprom_at24c.c             |   2 +
 hw/sensor/lsm303dlhc_mag.c          |   2 +
 hw/i2c/trace-events                 |   4 +-
 hw/misc/meson.build                 |   2 +
 tests/avocado/boot_linux_console.py |  43 --
 tests/avocado/machine_aspeed.py     | 128 ++++
 19 files changed, 1393 insertions(+), 363 deletions(-)
 create mode 100644 hw/misc/i2c-echo.c

-- 
2.35.3


