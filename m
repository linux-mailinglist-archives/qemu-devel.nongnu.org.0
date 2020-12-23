Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625982E1926
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 07:58:25 +0100 (CET)
Received: from localhost ([::1]:33964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kry6K-0003JR-4N
	for lists+qemu-devel@lfdr.de; Wed, 23 Dec 2020 01:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbM-0005wW-87; Wed, 23 Dec 2020 01:26:24 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krxbK-0001y1-Ck; Wed, 23 Dec 2020 01:26:24 -0500
Received: by mail-qk1-x72b.google.com with SMTP id p14so14169394qke.6;
 Tue, 22 Dec 2020 22:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=j8t49DEBS83dY7ANND9n6teA2PnlK0M21YEXBIleMjA=;
 b=I3GcjVkMNTvz5ksBtj8GmebyLEU3WaeFkP+bSJyenGcQqNnT5Apt0LWIqFS/9pfvUb
 DM4/8hrPR/o1G5GDG6T4VLIb6k5eO3WqO4/3BwTFm9zJJUO8N5H79xhx+JbeaH5XafZ1
 PATX1Q/mTpemz1HWykfcbTFRHITXUt6YFVxz1T/pFNr3RvknwS5Yhhjl2Z8QfwaNctjf
 685uY/XbFbk6e1GEmmm9onwKCnqFeYAZrvJAwEScUHTtO/6CNM9TA1eitF16YElBuQ0x
 XKEh4p6BycLCEdTP9RnEgCwzLL3YwSAMl3Z0EwToULt5XF5W6KbVrX3h/uH4dO22gERF
 YHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=j8t49DEBS83dY7ANND9n6teA2PnlK0M21YEXBIleMjA=;
 b=D6xDvne4S6gXH+iOuMapEfpjK8cB6LutM7XXoWCa0sthZgWvqZoviKAWXQ3B9/Q+fH
 ah2x354qeg3Jrz2z5B3oEBJWFTkvDMHewgdFWlPwYeiPQS7tKedF/EMOk06uCOR7aQvI
 /fuF1YR6mRp+uK7EJ+w9weYNjx+pRNFCeYb9LXX+3uCrDZsqC2bcSI6QCGtUNty/gM8T
 ITqQLVtT7/rbm6UXohqRNFORkKuP7DB4gmrAKusAEsTi4EgGxmhS8UEl2CcdBAVD7lvt
 WXGBc0q6SxWgZ1idgR8ZAsOCNDVQLbWdC0PbVw+Fc7eillZyIW6nm1iz74zF3ofUVkNh
 hlPA==
X-Gm-Message-State: AOAM533V68Nojj7/SwQPK8T/kqXzB9Bom7Njn4EKRWifwiIuXSrkA8Yz
 KGNCwftHmAZa1psxEYgcYDGQfDvSjJs=
X-Google-Smtp-Source: ABdhPJyhgKRPV7Djrt3r+cq1sOevbyI8Njg2+F4Do80DIxqU/KFzn/iEPnUjoyCaGQAWqsDY5iCOjQ==
X-Received: by 2002:a37:a0c6:: with SMTP id
 j189mr26196558qke.142.1608704780961; 
 Tue, 22 Dec 2020 22:26:20 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id q32sm14518589qtb.0.2020.12.22.22.26.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 22:26:20 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Wed, 23 Dec 2020 14:26:04 +0800
Message-Id: <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
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

$ qemu-system-arm -M sabrelite -smp 4 -m 1G -kernel u-boot \
    -display none -serial null -serial stdio

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

(no changes since v1)

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


