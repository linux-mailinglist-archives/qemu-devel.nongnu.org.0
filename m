Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35632D391
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:51:35 +0100 (CET)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnS2-0006PZ-KQ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:51:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnH2-00024c-TE; Thu, 04 Mar 2021 07:40:12 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:35830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lHnH1-00086L-3c; Thu, 04 Mar 2021 07:40:12 -0500
Received: by mail-pj1-x102c.google.com with SMTP id h13so324171pjt.0;
 Thu, 04 Mar 2021 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HjzpYT7hnoEJ4x3Tu4tXNH8mLvkB1uVrp6Y4N/W4R+E=;
 b=PdO9ccP/CWqPnsraafHp4hRBmAvsbwGzvEQORLtVaNqTXJy8BNcW0/Te7yWx9tg9RM
 AVgjGzgP2gmW8j0y3AdLltyFkVAhKKMWC1whLvCsk9tnXmptVjopTJD5niz6B7Iki9gR
 +Om2ZTD0LAVoxdbKGoT7iXX+QVI6AfJeHsBh5Ekg5XTfh6b6U0v8TOUUhdwDRACyzzQc
 PRSuL/CJrp6umTCgWydk+TcA0V+fDOlNv5hSCHwZkV6MIT0FYUECc0y71Za4yglLPWyK
 xhU+fxSVA5lheuWqqJariofg3U8g5F+ShtOVZB1Ih74vjAj0U3wWdNFcpqnePxDLIv7y
 Iu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HjzpYT7hnoEJ4x3Tu4tXNH8mLvkB1uVrp6Y4N/W4R+E=;
 b=R8QxLE9R9HlkKD0pl0JlnCfzcDjNC2one5VxtpIJQZkf9g7FTSvhf2DUkl9f/nRIEG
 neQASvvyDMjVc3SH6eRUCKQI5VPSOgQ3YplVKocNqPpqADSYIG2qQNzjNJhkxfE4gsCq
 RoyDJxtOL1wzHhX+VaFDfv0AOgh6ruNQLdHHoGQc/oulruXO0LgeawquBJ7SE3WFAQvZ
 X/V6i5VjiJkfAwxx5xJzFKfXFrnP2r1sog9dO7TqfbBXvOdKzRCnSZe1KE2h89Ts+Y97
 5Eng9NQO+KmHQ2/mrm81nLz9kCrGX92jm81sgoVRIozDT6Z1vQp0EhuQ1jgFMSzIP9oW
 BzvQ==
X-Gm-Message-State: AOAM533IYLtHJDb0Si6CfHagOBqgpnH/rTF40MRZM14SKyUqLY7pTMln
 1DGNTp8WJHD3LwMJUexr27Q=
X-Google-Smtp-Source: ABdhPJwC5Sy9Y+q+mXLixbNVS/abWBuQRxAZ6TkpbcykSXYERjf2HvbAOmqk0YQz0wQf/rvuz2ww4Q==
X-Received: by 2002:a17:90a:71ca:: with SMTP id
 m10mr4328610pjs.2.1614861608846; 
 Thu, 04 Mar 2021 04:40:08 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id r13sm29228237pfg.37.2021.03.04.04.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 04:40:07 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 1/2] tests/acceptance: Test ast2400 and ast2500 machines
Date: Thu,  4 Mar 2021 23:09:50 +1030
Message-Id: <20210304123951.163411-2-joel@jms.id.au>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210304123951.163411-1-joel@jms.id.au>
References: <20210304123951.163411-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=joel.stan@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test MTD images from the OpenBMC project on AST2400 and AST2500 SoCs
from ASPEED, by booting Palmetto and Romulus BMC machines.

The images are fetched from OpenBMC's release directory on github.

Co-developed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tests/acceptance/boot_linux_console.py | 46 ++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index eb012867997f..2f46a08fdc10 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -1048,6 +1048,52 @@ def test_arm_vexpressa9(self):
         self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
         self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
 
+    def test_arm_ast2400_palmetto_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:palmetto-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-palmetto.static.mtd')
+        image_hash = ('3e13bbbc28e424865dc42f35ad672b10f2e82cdb11846bb28fa625b48beafd0d')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
+
+    def test_arm_ast2500_romulus_openbmc_v2_9_0(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:romulus-bmc
+        """
+
+        image_url = ('https://github.com/openbmc/openbmc/releases/download/2.9.0/'
+                     'obmc-phosphor-image-romulus.static.mtd')
+        image_hash = ('820341076803f1955bc31e647a512c79f9add4f5233d0697678bab4604c7bb25')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.do_test_arm_aspeed(image_path)
+
+    def do_test_arm_aspeed(self, image):
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic')
+        self.vm.launch()
+
+        self.wait_for_console_pattern("U-Boot 2016.07")
+        self.wait_for_console_pattern("## Loading kernel from FIT Image at 20080000")
+        self.wait_for_console_pattern("Starting kernel ...")
+        self.wait_for_console_pattern("Booting Linux on physical CPU 0x0")
+        self.wait_for_console_pattern(
+                "aspeed-smc 1e620000.spi: read control register: 203b0641")
+        self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
+        self.wait_for_console_pattern("systemd[1]: Set hostname to")
+        # This often takes longer than the 90s timeout
+        # self.wait_for_console_pattern("login:")
+        self.vm.shutdown()
+
     def test_m68k_mcf5208evb(self):
         """
         :avocado: tags=arch:m68k
-- 
2.30.1


