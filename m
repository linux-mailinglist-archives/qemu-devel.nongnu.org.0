Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E722EF53E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 16:57:53 +0100 (CET)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxu9A-0001Yc-2g
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 10:57:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtot-00053W-BA
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:55 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxtop-0002ye-AM
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 10:36:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id w5so9382173wrm.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 07:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=914fnl0pJhWjr3RTpGLKQ1skila3tieL+3miZYLqW2k=;
 b=j31kWkXiRRZM9er6yKN8ZJGXe2ymrCBMaLepbDycINGK1SqsUxXClkCYKbBe9W9deM
 9fISOP9oUsAiDt4t1UZm084+BxFRBbBI0BZNQX/dTuG3hW7iE3dTTPcpVE1qKkDYpEFl
 oJJJsB+V1ZkMTM/zm7hZsU1k73oI1HTh3POwxFF0xF7D8p3mUvzSCQ5BezUNyRQgIWC2
 mpa++2Kvu103NDAysslDiOJUXhOM0roUB9Dnnma9Jr7MgPDWXArhTVCGQ5ipaEHUrPOF
 ZoPQhHIHAxy5TGsg3HP/Ieu1sJNqmV6fvi/7fQ86DnJXhhjbG6hrGPzEwFnF2VVsqbal
 Qh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=914fnl0pJhWjr3RTpGLKQ1skila3tieL+3miZYLqW2k=;
 b=anOTuiIQw7B+8W30LMLAZqB8PE+MxiMGWsfjKijWltSrpFkQohMkX/xjjHpBltTay/
 l/FMKoRY8u/QxxWMBsI9V7CSHY2Gq3NeNoEPAgtigOWKh8WBQA7DfUfVOhT3t6iO/oyv
 OxNReQFa9xJNKTA7+CQlYoVxfxi0g2i6zzy2IZCbcLFNGYUv8CFFDQnir+xhkkOvWo/T
 GZnJvhdziTrvgLd7I5mfvpO5HNyDIqe3FNAqyxhfqgHqxdwTJmUa1HwonsD8a/oHo2vX
 4ACmFWGVKxyrk0uhtVIrl8cN8OfYWZuoAS39pPvLzEZhJkRaoZmPO/A5u36k+T7WIiEd
 OiYg==
X-Gm-Message-State: AOAM531xKK0SWWT0Y+sPNw+DlaVs518Cip16Y0rSGpKnDjTRyFJ+njhE
 pFTsZwIwhHbbc8t2XKUlDk/4mnkwaRc07Q==
X-Google-Smtp-Source: ABdhPJzsjvd4snxXwFAKsYhyaczhmavrUt98knWVDdrxeepEVUFkLUMR5JVTtXGUMaYip5QhlUfsEw==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr4190393wrm.60.1610120209659; 
 Fri, 08 Jan 2021 07:36:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f9sm15887572wrw.81.2021.01.08.07.36.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:36:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/23] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Fri,  8 Jan 2021 15:36:18 +0000
Message-Id: <20210108153621.3868-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108153621.3868-1-peter.maydell@linaro.org>
References: <20210108153621.3868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20210106063504.10841-2-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/imx6_ccm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/imx6_ccm.c b/hw/misc/imx6_ccm.c
index cb740427eca..7e031b67757 100644
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
2.20.1


