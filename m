Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476394E67C0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:26:01 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRDk-00041Q-83
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:26:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6d-0006PZ-LE
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:18:39 -0400
Received: from [2607:f8b0:4864:20::632] (port=41915
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6Z-0007oJ-Uc
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:18:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id j13so5425126plj.8
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
 b=VvpnpxAWwf9ervUcb2DR1t9oLzzhm3XJ506OsPjNuImD1kwoA7rnJH7XZ72UMcDUki
 4+F3qqlmjHs6jq4gVx6+vxrMmZ01GVkCKuwKKYOtaJF5AtoZQw7YPlyMzGm2EQo4zsei
 SIr+bjPlOflAMsM0NBGrVADnrOoT2V4V8Ok2CD55+mTF668K28gFmHrtnqnQwWvS1kjN
 bBwLjdNjJfpLrhqO/fxlujmuOCwGhwm28IZt6/RVURpG4+xa08ngXtsqEGt2LudqP38J
 4lxbhz9ROj932+rRkPiRo3I7tRRYEGIjxPhVt8fj3gy/BRjvAYlB44R9QenNf6dMGLAl
 +YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5SrYGGx56D5KZCgDRAE+ARenQHiw5A2xBeYHRC7blJI=;
 b=iTdVRENWVAkQ3ZHa7CvgK6haq/ovjS0WMOiX4IIqcQclkQbzZGRJMu33ZQnS5dJhe4
 jBQ5iDWdmAifksjgha8obwzxOKQ3DXAObrtqXe65OHwGeEstHVundIhXRMgdWC0a9F1F
 1QdLszgkhYmxYCc3jjvApuSBOZpCCBAeszTPR+GfJWdoGMA+D0lt/liOM8aD6qqjI8Bx
 iPDFtuBHQO4LYDEq4H6WMha4fACkxytLH6P4VM4K6An/+SyXzGnMw6IeUHb1XdIGq8nc
 E5bTL54Pg35kblWHHxpmM/pyQf2c8HCTCq3N/0D3Wxps3qs4lCg/67/34SbWg+NRsnIz
 Fc/Q==
X-Gm-Message-State: AOAM532KFLMfZjtXpsFNRp+/Jvamr7le4W1pbvdNzO6ral+mh89F1sAp
 VUkPTWgCnP2wDXaghTpjrKVUK8b6kYZkWA==
X-Google-Smtp-Source: ABdhPJzOvVbAAlVeK+pRC/AZaNhIZ+ibCuDZy5lAlntTVxjqBKN6uzf/nG2+CUVO3VPhziFcGgdKLg==
X-Received: by 2002:a17:902:c215:b0:153:8d90:a108 with SMTP id
 21-20020a170902c21500b001538d90a108mr7115631pll.172.1648142314336; 
 Thu, 24 Mar 2022 10:18:34 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.10])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm3937412pfb.102.2022.03.24.10.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:18:33 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 01:17:53 +0800
Message-Id: <20220324171756.196654-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324171756.196654-1-zongyuan.li@smartx.com>
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Real View" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/realview.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5..d2dc8a8952 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -13,9 +13,11 @@
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
+#include "hw/core/split-irq.h"
 #include "hw/net/lan9118.h"
 #include "hw/net/smc91c111.h"
 #include "hw/pci/pci.h"
+#include "hw/qdev-core.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
@@ -53,6 +55,20 @@ static const int realview_board_id[] = {
     0x76d
 };
 
+static void split_irq_from_named(DeviceState *src, const char* outname,
+                                 qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    qdev_realize_and_unref(splitter, NULL, &error_fatal);
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+    qdev_connect_gpio_out_named(src, outname, 0,
+                                qdev_get_gpio_in(splitter, 0));
+}
+
 static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
@@ -66,7 +82,6 @@ static void realview_init(MachineState *machine,
     DeviceState *dev, *sysctl, *gpio2, *pl041;
     SysBusDevice *busdev;
     qemu_irq pic[64];
-    qemu_irq mmc_irq[2];
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
     DriveInfo *dinfo;
@@ -229,14 +244,14 @@ static void realview_init(MachineState *machine,
      * and the PL061 has them the other way about. Also the card
      * detect line is inverted.
      */
-    mmc_irq[0] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
-        qdev_get_gpio_in(gpio2, 1));
-    mmc_irq[1] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
-        qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
-    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
-    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
+    split_irq_from_named(dev, "card-read-only",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
+                   qdev_get_gpio_in(gpio2, 1));
+
+    split_irq_from_named(dev, "card-inserted",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
+                   qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
+
     dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
-- 
2.34.0


