Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB08954856A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:30:58 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0k9h-0004MC-TB
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:30:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k55-0000FO-CM; Mon, 13 Jun 2022 09:26:11 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:37371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k53-0004SB-59; Mon, 13 Jun 2022 09:26:11 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC4h1BmMz4yY5;
 Mon, 13 Jun 2022 23:25:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC4R56Ybz4yXP;
 Mon, 13 Jun 2022 23:25:43 +1000 (AEST)
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
Subject: [PATCH v2 00/17] aspeed: Extend ast2600 I2C model with new mode
Date: Mon, 13 Jun 2022 15:25:22 +0200
Message-Id: <20220613132539.2199772-1-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=yfRC=WU=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
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

Klaus made a proposal to add support for multi master in the I2C core
and the Aspeed I2C model. The last patches add the required bits to
let this happen.  

Thanks,

C.

Changes in v2:

 - reworked I2C avocado tests
 - dropped ctrl_global_rsvd property
 - removed support for multiple masters from Klaus. this change should
   come in its own series.
  

Cédric Le Goater (8):
  aspeed: Remove fake RTC device on ast2500-evb
  test/avocado/machine_aspeed.py: Move OpenBMC tests
  test/avocado/machine_aspeed.py: Add tests using buildroot images
  test/avocado/machine_aspeed.py: Add I2C tests to ast2500-evb
  test/avocado/machine_aspeed.py: Add I2C tests to ast2600-evb
  test/avocado/machine_aspeed.py: Add an I2C RTC test
  aspeed/i2c: Add ast1030 controller models
  aspeed/i2c: Enable SLAVE_ADDR_RX_MATCH always

Joe Komlodi (6):
  hw/registerfields: Add shared fields macros
  aspeed: i2c: Migrate to registerfields API
  aspeed: i2c: Use reg array instead of individual vars
  aspeed: i2c: Add new mode support
  aspeed: i2c: Add PKT_DONE IRQ to trace
  aspeed: i2c: Move regs and helpers to header file

Klaus Jensen (2):
  hw/i2c/aspeed: rework raise interrupt trace event
  hw/i2c/aspeed: add DEV_ADDR in old register mode

Troy Lee (1):
  aspeed: Add I2C buses to AST1030 model

 include/hw/i2c/aspeed_i2c.h         | 289 +++++++++-
 include/hw/registerfields.h         |  70 +++
 hw/arm/aspeed.c                     |  17 +-
 hw/arm/aspeed_ast10x0.c             |  18 +
 hw/i2c/aspeed_i2c.c                 | 820 +++++++++++++++++-----------
 hw/i2c/trace-events                 |   2 +-
 tests/avocado/boot_linux_console.py |  43 --
 tests/avocado/machine_aspeed.py     | 136 +++++
 8 files changed, 1030 insertions(+), 365 deletions(-)

-- 
2.35.3


