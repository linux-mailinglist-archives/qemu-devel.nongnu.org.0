Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE65153E599
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 17:54:42 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyF3x-00016o-Ll
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 11:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMh-0008UC-GL; Mon, 06 Jun 2022 11:09:59 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:55939
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gtQ3=WN=kaod.org=clg@ozlabs.org>)
 id 1nyEMf-0006Ez-KD; Mon, 06 Jun 2022 11:09:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LGxjs22WFz4xZf;
 Tue,  7 Jun 2022 01:09:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LGxjl6kQ7z4xZY;
 Tue,  7 Jun 2022 01:09:47 +1000 (AEST)
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
Subject: [PATCH 21/21] test/avocado/machine_aspeed.py: Add I2C slave tests
Date: Mon,  6 Jun 2022 17:07:32 +0200
Message-Id: <20220606150732.2282041-22-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220606150732.2282041-1-clg@kaod.org>
References: <20220606150732.2282041-1-clg@kaod.org>
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

Test extracted from :

  https://lists.nongnu.org/archive/html/qemu-devel/2022-06/msg00183.html

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 28b8a4c8124b..89447dbebcb9 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -138,6 +138,8 @@ def test_arm_ast2600_evb_builroot(self):
                          'tmp423,bus=aspeed.i2c.bus.15,address=0x4c');
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.15,address=0x32');
+        self.vm.add_args('-device',
+                         'i2c-echo,bus=aspeed.i2c.bus.15,address=0x42');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
         exec_command_and_wait_for_pattern(self,
                                           'i2cget -y 15 0x4c 0xff', '0x23');
@@ -150,4 +152,13 @@ def test_arm_ast2600_evb_builroot(self):
         year = time.strftime("%Y")
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
+        exec_command_and_wait_for_pattern(self,
+             'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-15/new_device',
+             'i2c i2c-15: new_device: Instantiated device slave-24c02 at 0x64');
+        exec_command(self, 'i2cset -y 15 0x42 0x64 0x00 0xaa i');
+        time.sleep(0.1)
+        exec_command_and_wait_for_pattern(self,
+             'hexdump /sys/bus/i2c/devices/15-1064/slave-eeprom',
+             '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


