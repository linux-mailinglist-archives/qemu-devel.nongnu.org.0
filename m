Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73D6509F25
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:58:03 +0200 (CEST)
Received: from localhost ([::1]:49924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVRi-0001gK-Mw
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqX-0003Nc-AO
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:37 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqS-0003Xm-US
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:35 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso5654523wml.1
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=c+3p6Fbz730AqqAeRKPa+9fqaNknD7WBGqtKg8sQzjk=;
 b=dAll3k0YjZvgD8NsoQayAtE85398/oh29v8IvYyQzzlNSjJdFkP0mhcWD35FAHnUpN
 Oko1uVeU6Ug8Xf76FqYaIqrVHbF5ACH6kY2VRcGk5Ha/BeCE33xN/nVygL6L5SQdkc0o
 tNdCAeeGua3R6JUn5KqLDhcEb1FIpFsXLvE/DCw6/GKpb3NqPCGhEtAHl69XFHzPYUHG
 5cVXVBsR+NFxJkjUF5x0GWLj4G5otN1AnYxv6UJN/ytlCQYZcE5HY+XTkSJq3bM6jcsH
 c1mf4OSCFVMGcySBREJuCOx3PR6J7tD1z64Hq8pgszQuHR/p1JtuZvZJ1oVCyFWtEuHB
 E5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+3p6Fbz730AqqAeRKPa+9fqaNknD7WBGqtKg8sQzjk=;
 b=vGaIG1TXwRqrFeDojoDUTF/91/lbQO4QXut0FJK4totP7mBXtgcgdCeB0JHh5d+ux5
 HoFYwqLYGpX9QE78BBeQG0UBmwTi+SLhiAhjNWbbGjx8hp7ht5BivlzcEx/IioQ1KT1Y
 /gi+k2tJCyRpO9cUUNAwIyID2iM6e6Tt9el73qKHuRxLBqIqh0axFOzAYfLMkKLJfGpr
 214sDGvJ7fIrEbmDkIUbkqlkAZkMcvo24b9vWEpQpUeinmcR+6xN1i1zKGSk2Bk/1F57
 HHSqkLG6kcJcVaxST20xRaKMquqW94kVnu16aLnF4016GH71FQUn/N0UTEW8U6S6u4/O
 Nqxg==
X-Gm-Message-State: AOAM532yxzRhSXwl5iSKchBkWBuFKfDa4KG2V6rbDtG5klUhbzkQPoUD
 NnOl8HDQwo6R8DzF5zDgvldoik3peQXE6g==
X-Google-Smtp-Source: ABdhPJwpuJkmU/Qzf9XBrNSuRF2abl2Y8DnRAEIJtXRZN3cVhIeRmo21WsIx26/8Uf0MRS++iY5ixA==
X-Received: by 2002:a7b:cb0d:0:b0:38e:aaf3:b08f with SMTP id
 u13-20020a7bcb0d000000b0038eaaf3b08fmr8135396wmj.12.1650539953371; 
 Thu, 21 Apr 2022 04:19:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/31] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Thu, 21 Apr 2022 12:18:41 +0100
Message-Id: <20220421111846.2011565-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Zongyuan Li <zongyuan.li@smartx.com>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220324181557.203805-2-zongyuan.li@smartx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/realview.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5f..d2dc8a89525 100644
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
2.25.1


