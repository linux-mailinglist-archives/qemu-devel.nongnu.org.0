Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E6D5730E4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 10:22:26 +0200 (CEST)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBXdY-0002Ag-I6
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 04:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBq-0008Ae-RS; Wed, 13 Jul 2022 03:53:46 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:52951
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=zHgX=XS=kaod.org=clg@ozlabs.org>)
 id 1oBXBo-0002bb-Jz; Wed, 13 Jul 2022 03:53:46 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LjVHV1kl6z4ySg;
 Wed, 13 Jul 2022 17:53:42 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LjVHS32vpz4ySW;
 Wed, 13 Jul 2022 17:53:40 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 14/19] test/avocado/machine_aspeed.py: Add SDK tests
Date: Wed, 13 Jul 2022 09:52:50 +0200
Message-Id: <20220713075255.2248923-15-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713075255.2248923-1-clg@kaod.org>
References: <20220713075255.2248923-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=zHgX=XS=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

The Aspeed SDK kernel usually includes support for the lastest HW
features. This is interesting to exercise QEMU and discover the gaps
in the models.

Add extra I2C tests for the AST2600 EVB machine to check the new
register interface.

Message-Id: <20220707091239.1029561-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 68 +++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 3b8f784a57b6..b4e35a3d0743 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -170,3 +170,71 @@ def test_arm_ast2600_evb_builroot(self):
         exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
 
         self.do_test_arm_aspeed_buidroot_poweroff()
+
+
+    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
+
+    def test_arm_ast2500_evb_sdk(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2500-evb
+        """
+
+        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
+                     'download/v08.01/ast2500-default-obmc.tar.gz')
+        image_hash = ('5375f82b4c43a79427909342a1e18b4e48bd663e38466862145d27bb358796fd')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+        archive.extract(image_path, self.workdir)
+
+        self.do_test_arm_aspeed_sdk_start(
+            self.workdir + '/ast2500-default/image-bmc', '0x0')
+        self.wait_for_console_pattern('ast2500-default login:')
+
+    def test_arm_ast2600_evb_sdk(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
+                     'download/v08.01/ast2600-default-obmc.tar.gz')
+        image_hash = ('f12ef15e8c1f03a214df3b91c814515c5e2b2f56119021398c1dbdd626817d15')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+        archive.extract(image_path, self.workdir)
+
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
+        self.vm.add_args('-device',
+                         'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
+        self.do_test_arm_aspeed_sdk_start(
+            self.workdir + '/ast2600-default/image-bmc', '0xf00')
+        self.wait_for_console_pattern('ast2600-default login:')
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
+             'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
+        self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
+                        property='temperature', value=18000);
+        exec_command_and_wait_for_pattern(self,
+                             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
+
+        exec_command_and_wait_for_pattern(self,
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
+             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
+        year = time.strftime("%Y")
+        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
-- 
2.35.3


