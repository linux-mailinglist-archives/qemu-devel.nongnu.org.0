Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA1548573
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 15:35:37 +0200 (CEST)
Received: from localhost ([::1]:50702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0kEC-0003nu-Fz
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 09:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5C-0000Lh-0S; Mon, 13 Jun 2022 09:26:18 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:56243
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=yfRC=WU=kaod.org=clg@ozlabs.org>)
 id 1o0k5A-0004TS-1l; Mon, 13 Jun 2022 09:26:17 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LMC5155sCz4yZ4;
 Mon, 13 Jun 2022 23:26:13 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMC4w2nVYz4yXP;
 Mon, 13 Jun 2022 23:26:08 +1000 (AEST)
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
Subject: [PATCH v2 03/17] test/avocado/machine_aspeed.py: Add tests using
 buildroot images
Date: Mon, 13 Jun 2022 15:25:25 +0200
Message-Id: <20220613132539.2199772-4-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220613132539.2199772-1-clg@kaod.org>
References: <20220613132539.2199772-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
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

Buildroot images are smaller than the OpenBMC images and faster to
run. Built from source using :

  http://patchwork.ozlabs.org/project/buildroot/list/?series=303465

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 tests/avocado/machine_aspeed.py | 52 +++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 89bfad307661..31a0fb6cd865 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -5,8 +5,11 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
+import time
+
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado.utils import archive
 
@@ -84,3 +87,52 @@ def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
                                       algorithm='sha256')
 
         self.do_test_arm_aspeed(image_path)
+
+    def do_test_arm_aspeed_buidroot_start(self, image, cpu_id):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
+        self.wait_for_console_pattern('lease of 10.0.2.15')
+        self.wait_for_console_pattern('Aspeed EVB')
+        exec_command(self, 'root')
+        time.sleep(0.1)
+
+    def do_test_arm_aspeed_buidroot_poweroff(self):
+        exec_command_and_wait_for_pattern(self, 'poweroff',
+                                          'reboot: System halted');
+
+    def test_arm_ast2500_evb_builroot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2500-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2500-evb/buildroot-2022.05/flash.img')
+        image_hash = ('549db6e9d8cdaf4367af21c36385a68bb465779c18b5e37094fc7343decccd3f')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0x0')
+        self.do_test_arm_aspeed_buidroot_poweroff()
+
+    def test_arm_ast2600_evb_builroot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:ast2600-evb
+        """
+
+        image_url = ('https://github.com/legoater/qemu-aspeed-boot/raw/master/'
+                     'images/ast2600-evb/buildroot-2022.05/flash.img')
+        image_hash = ('6cc9e7d128fd4fa1fd01c883af67593cae8072c3239a0b8b6ace857f3538a92d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed_buidroot_start(image_path, '0xf00')
+        self.do_test_arm_aspeed_buidroot_poweroff()
-- 
2.35.3


