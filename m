Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54282D94E4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 10:21:05 +0100 (CET)
Received: from localhost ([::1]:41892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kok2S-0005gY-Mc
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 04:21:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0g-00041b-RI; Mon, 14 Dec 2020 04:19:16 -0500
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:42183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kok0d-0000h1-CP; Mon, 14 Dec 2020 04:19:14 -0500
Received: by mail-il1-x144.google.com with SMTP id 2so15173816ilg.9;
 Mon, 14 Dec 2020 01:19:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KqZyQlxZep5FPbrFL3HJFB2aFUNB9J2hzOC5R8+/04Q=;
 b=hE52Ig2YALU6sE084rgm03nCtX+rpAA7qE3pOpNCLedkSmD38/ABviCQYW/8LM7FVm
 zsTO5FACgobG+FJv9+WvI+0r9SWogWvoiBrpvSCcS6IA6qy5UtqFPIpM/pus03Pq5wmi
 rHd0n/FSL17n97bOzXc4pyMnjlRS0Pu9KWj+Z/GBt8U3vhz78CiUZrw7zYWnjjw0XPAN
 ZZXOTzszeHQlUSwCTbbKxPsKU6ZNPSZ8jHTESPinbYZ30+7hGYY0jmsF+Mdji8x3OjvR
 WEToQz0ipZhi8kqUNkYKZkLJvr4C8uzwiKVuj2N42bSP8tAquogQtaBI2OSDBZZA6xlT
 brsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KqZyQlxZep5FPbrFL3HJFB2aFUNB9J2hzOC5R8+/04Q=;
 b=D5TG3Dpz2CcjyokUYqYdC9tZmrP4Lpg3i7rQd21DvJYLlmcBKz2NI+yzA3X7YoxlaM
 X6fgxlnaK1JR5+TRyTuhLBBjr2t7pmDXYSwluIcaWfEM/fkTDbqhay3hv6BspijaTDiX
 kqqdPqEtB10YwoTJQIdZ8SyFQ12e133lwYw9bE9SwRNp9yGbUh9+6O9aSheu8ReQOeP/
 k0qnrEvVHG0xLn/bwPJ6BqYptRKul/nsDTm2O3w8ZOE9EmkUhR7gSk/HlXm6p+duLOrc
 JHYfiqvO0wofqWEF+e24e2MZeqYcIwCeeWf1hqx745Q669TqV/0KLt9rKasJ8+AN0N5Z
 2gpQ==
X-Gm-Message-State: AOAM533jaA3cppEP9ZR4KzBITziuy8HvSYgvRflYWdaJGDFHbAZvjA7L
 C0heg3eIzeHmCKKnF9DvzcQ=
X-Google-Smtp-Source: ABdhPJxHAmVdbhGXee6ZEYxBEvkuVxhBjjkVcEojenOpJNe26t1u2QmrsDjwJOfLAx5Vb/O+NyYkzg==
X-Received: by 2002:a05:6e02:1187:: with SMTP id
 y7mr33268979ili.143.1607937549705; 
 Mon, 14 Dec 2020 01:19:09 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id o10sm11618094ili.82.2020.12.14.01.19.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Dec 2020 01:19:09 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Mon, 14 Dec 2020 17:18:56 +0800
Message-Id: <1607937538-69471-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
References: <1607937538-69471-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::144;
 envelope-from=bmeng.cn@gmail.com; helo=mail-il1-x144.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
bandgap has stabilized.

With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
sabrelite board (mx6qsabrelite_defconfig), with a slight change made
by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
shell on QEMU with the following command:

$ qemu-system-arm -M sabrelite -m 1G -kernel u-boot -display none \
    -serial null -serial stdio

Boot log below:

  U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)

  CPU:   Freescale i.MX?? rev1.0 at 792 MHz
  Reset cause: POR
  Model: Freescale i.MX6 Quad SABRE Lite Board
  Board: SABRE Lite
  I2C:   ready
  DRAM:  1 GiB
  force_idle_bus: sda=0 scl=0 sda.gp=0x5c scl.gp=0x55
  force_idle_bus: failed to clear bus, sda=0 scl=0
  force_idle_bus: sda=0 scl=0 sda.gp=0x6d scl.gp=0x6c
  force_idle_bus: failed to clear bus, sda=0 scl=0
  force_idle_bus: sda=0 scl=0 sda.gp=0xcb scl.gp=0x5
  force_idle_bus: failed to clear bus, sda=0 scl=0
  MMC:   FSL_SDHC: 0, FSL_SDHC: 1
  Loading Environment from MMC... *** Warning - No block device, using default environment

  In:    serial
  Out:   serial
  Err:   serial
  Net:   Board Net Initialization Failed
  No ethernet found.
  starting USB...
  Bus usb@2184000: usb dr_mode not found
  USB EHCI 1.00
  Bus usb@2184200: USB EHCI 1.00
  scanning bus usb@2184000 for devices... 1 USB Device(s) found
  scanning bus usb@2184200 for devices... 1 USB Device(s) found
         scanning usb for storage devices... 0 Storage Device(s) found
         scanning usb for ethernet devices... 0 Ethernet Device(s) found
  Hit any key to stop autoboot:  0
  =>

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index cb74042..7e031b6 100644
--- a/hw/misc/imx6_ccm.c
+++ b/hw/misc/imx6_ccm.c
@@ -450,7 +450,7 @@ static void imx6_ccm_reset(DeviceState *dev)
     s->analog[PMU_REG_3P0] = 0x00000F74;
     s->analog[PMU_REG_2P5] = 0x00005071;
     s->analog[PMU_REG_CORE] = 0x00402010;
-    s->analog[PMU_MISC0] = 0x04000000;
+    s->analog[PMU_MISC0] = 0x04000080;
     s->analog[PMU_MISC1] = 0x00000000;
     s->analog[PMU_MISC2] = 0x00272727;
 
-- 
2.7.4


