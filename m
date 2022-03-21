Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4AD4E20B5
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:53:22 +0100 (CET)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWBur-0005KG-2r
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:53:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nWBmX-0002Jr-10
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:44:45 -0400
Received: from [2607:f8b0:4864:20::1035] (port=43992
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nWBmT-0006aV-Ua
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 02:44:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so7464463pjq.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=6va+yBZdRMa8OiX41zIcE4L7cxT25XfysiaWalijZO7kkFauoDyXEtfvwtoVy/YnYw
 ZxDKHagdGaRLLXZk1q9kQuVxeFrlOUQyJAD9lZUbAJxZmTVY3lLa79cnVFRiQAN4Iwjs
 iRlzi9MfXSne4YAHl/yHdZtBRFsN6vjQ+HYWBuVGsQicbb6DfPP2YTzfI+CHW34GNxop
 84HNvqw3HR6bl9Gh0CYKz+eTzoVu/coZ4nnkac1ru5KECoak/jj1XZofpMq6w7ylVcR/
 SctYHGPzIUdLQWX6DdSxK1d8G5plB9rvBLckBVU1QXJ3MqOj6RMzDMz+jPmetKFil2Kg
 nVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SXPFckhjjqOPFa0Mt1YU+0EelaVejpES613ER/BKATM=;
 b=v105nhBQZ1u5GbVTNZ6B9bkP7PNFFeJZ3yUKA9obzLiffZo2Z/qp+TFL4s2b2BIB/3
 5+iKtcJ9x8f+n7xMujZhLU8tCo+HXGY8LEaaRiuEK/6IAVuru0zjqRvOhC9IghSgLDwZ
 CWcBDWByIp3XgKjlQdH7LboCOpQHfygxIahn/CEjzKvB7/E0SbSHKnE5B9TJeED7QnZk
 TkThyP6yUAvWcahTkczhA/YMige3eF5jAFX3krLY7xxP70rLIbehFwEQ97pBh+OHVP7U
 K6IhrA5rqftIs+YhhlIclUxHEcfbeYPtC+oXjTMZa84v6a+FuUuMWaW7y1/giukjEPA3
 JJ+w==
X-Gm-Message-State: AOAM532CCCOCywM3rjaxRUaGVnYgfqZOUOAMpoTTbDSx6DLCr0UYVW5A
 m6KXHnTzk8EtBcZHeq+xWya5uEXk1Fx2cw==
X-Google-Smtp-Source: ABdhPJyUzQ/W4hjH5kFbcacMZFsgwZAnjqvjWO0qSNWz3OsaCitbRKYIqcObZ3yQ/Mrdt81+iS2ABg==
X-Received: by 2002:a17:902:a508:b0:14d:bfd8:58be with SMTP id
 s8-20020a170902a50800b0014dbfd858bemr11668079plq.10.1647845079698; 
 Sun, 20 Mar 2022 23:44:39 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.11])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm18628842pfj.43.2022.03.20.23.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 23:44:39 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/1] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Mon, 21 Mar 2022 14:44:35 +0800
Message-Id: <20220321064435.126799-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220321064435.126799-1-zongyuan.li@smartx.com>
References: <20220321064435.126799-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1035;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1035.google.com
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


