Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6963FDDFF
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 16:50:39 +0200 (CEST)
Received: from localhost ([::1]:37226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLRZW-0000Th-Kl
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 10:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <2014500726@smail.xtu.edu.cn>)
 id 1mLNgm-000868-BT
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:41:52 -0400
Received: from smtpbgeu1.qq.com ([52.59.177.22]:44900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <2014500726@smail.xtu.edu.cn>)
 id 1mLNgf-0000to-Tp
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:41:51 -0400
X-QQ-mid: bizesmtp50t1630492892tewf9ssh
Received: from localhost.localdomain (unknown [114.91.2.95])
 by esmtp6.qq.com (ESMTP) with 
 id ; Wed, 01 Sep 2021 18:41:31 +0800 (CST)
X-QQ-SSF: 0140000000700070R000B00A0000000
X-QQ-FEAT: Q1yiNCT1ez4fbPXBeC6Bm3VQ2PP3bbKDosNG1uYhLFxyMZ/nTsMXs4fpEGtAZ
 uvxMwWW3pO6sMCAOUwGV087M4b3x93+/oQwZaovu5FphFhD1OwetBo0WYwT1jvxx89aZ839
 v5VHm4mhyySW5+dCsOqiGZV7z5EiAawtN15QubM9iAMTm5F6r2BG5dDLTWTFMEbPGolrPp/
 n2sJk9R+L46K+h4qDiw7V3f3vrXC/sDJm5vPrlJzGcXkX+bGEDvwiZRFO2EinQe8CUKArnc
 UmyxyZ1kc5PMKZQnr/HExNSb7pV/WyBzPL3oG8yTpjYSy1srBHvnB9u9j5ucBmg1GX2w==
X-QQ-GoodBg: 2
From: xiaoming <2014500726@smail.xtu.edu.cn>
To: Gabriel Somlo <somlo@cmu.edu>
Subject: [PATCH] [PATCH] drivers/firmware/qemu_fw_cfg: add RISCV support
Date: Wed,  1 Sep 2021 18:41:30 +0800
Message-Id: <20210901104130.10185-1-2014500726@smail.xtu.edu.cn>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:smail.xtu.edu.cn:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=52.59.177.22;
 envelope-from=2014500726@smail.xtu.edu.cn; helo=smtpbgeu1.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 01 Sep 2021 10:43:12 -0400
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
Cc: linux-kernel@vger.kernel.org, xiaoming <2014500726@smail.xtu.edu.cn>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the latest release of qemu (qemu 6.0.0 or higher) riscv virt already supports fw_cfg, but
drivers/firmware/qemu_fw_cfg not support.

Signed-off-by: xiaoming <2014500726@smail.xtu.edu.cn>
---
 drivers/firmware/Kconfig       | 2 +-
 drivers/firmware/qemu_fw_cfg.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 1db738d5b..4eb8d8a3a 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -186,7 +186,7 @@ config RASPBERRYPI_FIRMWARE
 
 config FW_CFG_SYSFS
 	tristate "QEMU fw_cfg device support in sysfs"
-	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || SPARC || X86)
+	depends on SYSFS && (ARM || ARM64 || PARISC || PPC_PMAC || SPARC || X86 || RISCV)
 	depends on HAS_IOPORT_MAP
 	default n
 	help
diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 172c751a4..36b5b2612 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -225,6 +225,10 @@ static void fw_cfg_io_cleanup(void)
 #  define FW_CFG_CTRL_OFF 0x00
 #  define FW_CFG_DATA_OFF 0x01
 #  define FW_CFG_DMA_OFF 0x04
+# elif defined(CONFIG_RISCV)
+#  define FW_CFG_CTRL_OFF 0x08
+#  define FW_CFG_DATA_OFF 0x00
+#  define FW_CFG_DMA_OFF 0x10
 # else
 #  error "QEMU FW_CFG not available on this architecture!"
 # endif
-- 
2.17.1




