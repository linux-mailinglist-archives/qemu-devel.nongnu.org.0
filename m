Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C50554514
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:06:56 +0200 (CEST)
Received: from localhost ([::1]:51026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xGB-0004Eg-HI
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5O-0005jD-1k; Wed, 22 Jun 2022 05:55:46 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:44207
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=05Ho=W5=kaod.org=clg@ozlabs.org>)
 id 1o3x5L-0004lo-7l; Wed, 22 Jun 2022 05:55:45 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LSdzw1Zxsz4xZp;
 Wed, 22 Jun 2022 19:55:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSdzt16jrz4xD9;
 Wed, 22 Jun 2022 19:55:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Subject: [PULL 06/19] test/avocado/machine_aspeed.py: Add an I2C RTC test
Date: Wed, 22 Jun 2022 11:55:07 +0200
Message-Id: <20220622095520.3683321-7-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220622095520.3683321-1-clg@kaod.org>
References: <20220622095520.3683321-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=05Ho=W5=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Add an RTC device and check that the output of the hwclock command
matches the current year.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 0a1ceec13eb1..3b8f784a57b6 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -149,6 +149,8 @@ def test_arm_ast2600_evb_builroot(self):
 
         self.vm.add_args('-device',
                          'tmp105,bus=aspeed.i2c.bus.3,address=0x4d,id=tmp-test');
+        self.vm.add_args('-device',
+                         'ds1338,bus=aspeed.i2c.bus.3,address=0x32');
         self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
 
         exec_command_and_wait_for_pattern(self,
@@ -161,4 +163,10 @@ def test_arm_ast2600_evb_builroot(self):
         exec_command_and_wait_for_pattern(self,
                              'cat /sys/class/hwmon/hwmon0/temp1_input', '18000')
 
+        exec_command_and_wait_for_pattern(self,
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-3/device/new_device',
+             'i2c i2c-3: new_device: Instantiated device ds1307 at 0x32');
+        year = time.strftime("%Y")
+        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
+
         self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


