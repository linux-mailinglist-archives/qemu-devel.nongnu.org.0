Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D78B49FE16
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:32:46 +0100 (CET)
Received: from localhost ([::1]:57984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUB2-0001hN-DW
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:32:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDD-0002B3-C3
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:58 -0500
Received: from [2a00:1450:4864:20::332] (port=35729
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD1-0006Pj-3w
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:48 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso8475713wmj.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=SswMcNdhH2avjkSQoRFehyrrJuGL4jyozjNMZJykN2k=;
 b=Vg5kzl948niLUIOJUmbKRQJrCVHLNQ6A4BosQJYkiapCmaL+6c2EwrTNhrTLW4IsTY
 JcKxs2deDGzft0Q04xKFvUwGCebVz7kdN2ay25njnOvm4EtBmDtGEaG1qtPAvamSIVCU
 qIL3N4qXMJ/6X1+t5OKn7ovLSyDaY8fP5GJK1fNSTJhq4AxuZ6QyV/lTcfqvzDrhIXwQ
 79xKh5HMm/E95gk/qkTWtIp529T8Rtl/mfT45o2gbyym7P8wcpcF+zUXQsu7g8OxxDjc
 74D7O6CDGJXZdWtiq0QtB285KW0qyDUQZhuZn77xhsCIYCjY6PHIB3eEihCsfVodTxnF
 aseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SswMcNdhH2avjkSQoRFehyrrJuGL4jyozjNMZJykN2k=;
 b=c80m560dc9YJ8kqhOc87iqFw2tOXm5KZiOx05nCZfK/cF21ZoV7wb6UjCo5X3Jy4K1
 +PWp1HvayBw41Mlo00uga5zgod5PrCW5K+DHLvYN40dhsfXg+A7/d2u+K7Gvvxfv5TUV
 Qb0ieGY4XdPjkfGRL1TTDzQRLn7sokzru6CoBSEFmZi/y2kZRIuBABBV/xRktcUL5Vns
 s8LOmL12LuXHezp2wJF3xkXJYn24SHt7UZuPTvGu6NMeRxF2TMXk3Q8p+CCciwEo29aq
 T5HWiP8iKXrxtN/uYoVG5RXaXimCLtmc/oYt9p7Ieej9zMUIMvZKVbawPxyqn1y/glq4
 TKaA==
X-Gm-Message-State: AOAM533V63YrRDLDjNlysHP9RHFpEiGww/dkv8nZdvfbHx+3vycOpdw2
 HpzgVLoPu/rYunovo7R0RYG7523u0OTflg==
X-Google-Smtp-Source: ABdhPJyDkOT11IyZ/FgnL2LWLdmeYJn5WFrgVPQVFFgXyohXvAFY5uaqG0cHDzOeBrjsXB+s43hyxw==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr10691043wmb.169.1643383829183; 
 Fri, 28 Jan 2022 07:30:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 13/32] hw/arm/xlnx-versal-virt: Connect mt35xu01g flashes to
 the OSPI
Date: Fri, 28 Jan 2022 15:29:50 +0000
Message-Id: <20220128153009.2467560-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Francisco Iglesias <francisco.iglesias@xilinx.com>

Connect Micron Xccela mt35xu01g flashes to the OSPI flash memory
controller.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220121161141.14389-10-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-versal-virt.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 8ea9979710f..3f56ae28eea 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -25,6 +25,8 @@
 #define TYPE_XLNX_VERSAL_VIRT_MACHINE MACHINE_TYPE_NAME("xlnx-versal-virt")
 OBJECT_DECLARE_SIMPLE_TYPE(VersalVirt, XLNX_VERSAL_VIRT_MACHINE)
 
+#define XLNX_VERSAL_NUM_OSPI_FLASH 4
+
 struct VersalVirt {
     MachineState parent_obj;
 
@@ -691,6 +693,27 @@ static void versal_virt_init(MachineState *machine)
             exit(EXIT_FAILURE);
         }
     }
+
+    for (i = 0; i < XLNX_VERSAL_NUM_OSPI_FLASH; i++) {
+        BusState *spi_bus;
+        DeviceState *flash_dev;
+        qemu_irq cs_line;
+        DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
+
+        spi_bus = qdev_get_child_bus(DEVICE(&s->soc.pmc.iou.ospi), "spi0");
+
+        flash_dev = qdev_new("mt35xu01g");
+        if (dinfo) {
+            qdev_prop_set_drive_err(flash_dev, "drive",
+                                    blk_by_legacy_dinfo(dinfo), &error_fatal);
+        }
+        qdev_realize_and_unref(flash_dev, spi_bus, &error_fatal);
+
+        cs_line = qdev_get_gpio_in_named(flash_dev, SSI_GPIO_CS, 0);
+
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->soc.pmc.iou.ospi),
+                           i + 1, cs_line);
+    }
 }
 
 static void versal_virt_machine_instance_init(Object *obj)
-- 
2.25.1


