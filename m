Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1C34E57DA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 18:52:02 +0100 (CET)
Received: from localhost ([::1]:50690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX59N-0001Cn-9w
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 13:52:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u6-0008H8-16
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:15 -0400
Received: from [2607:f8b0:4864:20::530] (port=46829
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nX4u3-0005Tl-9H
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 13:36:13 -0400
Received: by mail-pg1-x530.google.com with SMTP id b130so293193pga.13
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 10:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=6uSggFfAaQs4U1h+AV6Kwn440TRAo/4Iv1yz4PaZlSeQubyjJ1+82P1uH1ezrPaUEw
 oi/I3QPxPmVHedOVSgNK3BYpI52OcZRNSFUr99irgY9YKezA9twR2hdPCO4tJzzJYf0r
 +FLCvIzElhQYkZ7Ax4zoyl9YnYKms2va2HRhW+CD3LLiVZyn7iNda2sHw0/DeyYClm0J
 cpkKXoyWxILWtu0FVnb7l/GCYjNHRkuXM1E/FKZB8rohNjDI8ZKHznb3bXhcOdavqCbR
 66/kHKmPbn185kWem1G0xDmJjWQ4rDu6FMcZzS9TBjSJWYlnWBkxnP15VquMAOvitNVw
 W38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=J2W2D3F3QXd1Do9qhDlUO/8CHJj9dLFMNksT5QTQEpdxne9hWoU0iSpVBmJFE3kP3B
 b+uRQU1/KU0zU7osOv/Ur2zsEiMV8nmv/14B8Z6xdHrtLVMcFWXCQZDDnyipLA43dF9X
 E8+XnmB9ef06Fou1A1e6jO1cj55AA63yGrnKAsv2ZKa7yzfEBV4bdamVS/FYR4Nx/wtZ
 MdpcM7/KUDCf9VsmBBv9HLx9vPqfVW4N9rclQsNoSCp9NpkzEN5Qt1ALAPXe3DLf8/HY
 1Vgga8t46FzODbfSpeWVmtAPG+VGcQT3j78zydXbwlezNzR7epJ2ttdAZvdLz34rkDZv
 LLFw==
X-Gm-Message-State: AOAM532XTkah9BxTeyOWShcjkqKQZHRfpNH/pe+gQqVgGEusQyZkPC9W
 4Eog0NGZYS1o/WNX+Z4x8C3K1fCZE3pgBA==
X-Google-Smtp-Source: ABdhPJz92TfazPCs9SwHpFd3jrmweZf41aJl/kE058C4/dblDRa7PQUeg757MWY/WWZkHqsTs8dgQw==
X-Received: by 2002:a65:6cc3:0:b0:382:9d3c:ff82 with SMTP id
 g3-20020a656cc3000000b003829d3cff82mr816953pgw.110.1648056969949; 
 Wed, 23 Mar 2022 10:36:09 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 w19-20020a056a0014d300b004fae5e3970csm553239pfu.35.2022.03.23.10.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 10:36:09 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 24 Mar 2022 01:35:39 +0800
Message-Id: <20220323173543.146442-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220323173543.146442-1-zongyuan.li@smartx.com>
References: <20220323173543.146442-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pg1-x530.google.com
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
 hw/arm/realview.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5..97ace560bf 100644
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
@@ -53,6 +55,24 @@ static const int realview_board_id[] = {
     0x76d
 };
 
+static bool split_irq_from_named(DeviceState *src, const char* outname,
+                                 qemu_irq out1, qemu_irq out2) {
+    DeviceState *splitter = qdev_new(TYPE_SPLIT_IRQ);
+
+    qdev_prop_set_uint32(splitter, "num-lines", 2);
+
+    if (!qdev_realize_and_unref(splitter, NULL, &error_fatal)) {
+        return false;
+    }
+
+    qdev_connect_gpio_out(splitter, 0, out1);
+    qdev_connect_gpio_out(splitter, 1, out2);
+    qdev_connect_gpio_out_named(src, outname, 0,
+                                qdev_get_gpio_in(splitter, 0));
+
+    return true;
+}
+
 static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
@@ -66,7 +86,6 @@ static void realview_init(MachineState *machine,
     DeviceState *dev, *sysctl, *gpio2, *pl041;
     SysBusDevice *busdev;
     qemu_irq pic[64];
-    qemu_irq mmc_irq[2];
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
     DriveInfo *dinfo;
@@ -229,14 +248,18 @@ static void realview_init(MachineState *machine,
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
+    if (!split_irq_from_named(dev, "card-read-only",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
+                   qdev_get_gpio_in(gpio2, 1))) {
+        return;
+    }
+
+    if (!split_irq_from_named(dev, "card-inserted",
+                   qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
+                   qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)))) {
+        return;
+    }
+
     dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
-- 
2.34.0


