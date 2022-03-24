Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6264E67CF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 18:28:02 +0100 (CET)
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRFh-0006zV-UQ
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 13:28:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6n-0006eX-6R
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:18:53 -0400
Received: from [2607:f8b0:4864:20::1036] (port=52188
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nXR6k-0007pt-L3
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:18:48 -0400
Received: by mail-pj1-x1036.google.com with SMTP id gb19so5275528pjb.1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
 b=0xrFg3ftAZkcawE+gB1ZWvMv6rKVucbksmbWNfM7joQKGhN/X8klYC2BkPIZsSALWf
 f9raFXVOVjJLSqgUer0vEMtguSlCMUWKtMg+csS/zb6A5dzdsjJ8CPsolRLg+iimCf1g
 pIQ1KO2rfbQ+OC5B1mJdTkIZMdlda7mzxEl89ckKHWBCdvFWqI4si74jFdAtdOaj0Osc
 ue0XLLgHeCpQS69sj5CxiW3r1Yl4mYwL0pSQajDRnvXMk+xMF1p0qNxlQhZrqbLS5MzG
 AWnYooXEPppusfRt5HwHj0K3cW3GzF+StSnpU0NT7KRwuu6gZHz46mMSaxP9PNMHStBT
 eigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dh5aVmO3EARkPNjd2r1sV1+I0MHmPFomuINkwCaVeDs=;
 b=5iN4C//yrGrfWHmgjeh0eK97I2bICPnq6RGcXr+C+3DpK/EKAj2hKXObrhqm6JWbYV
 c9Hb0syq+rB1ckFhyX2KfgRTJ/NEmfTrbsTvwNR1PuroQg9koJOCRrehhNJK3qTcfMDy
 b+CYaRz4zOqSEvqeQxefYVQdIGYNCJAEKMUBM0oUrduIgsETWP5X23vFHzo5u6naKxZ7
 1LTFtkVNw9CiRT2AcC0GFYLAf9GmUIpbod5p8GCtoOJjSTuS+oPZWGnoQPtpemi9+8bQ
 hk0yqa03P8xgcGNq854a99E7E6lSpfnn9EvrIzHlrIO648nTuzaGSjeeSoNrngmvJ/2/
 CxCw==
X-Gm-Message-State: AOAM533AUvra7S+lMEuXYg3eZJt5bEw8RvLFAUS0h3dcUbrBWgfKdebB
 RHAHMGkPtxXBBkttaVrPiPBkJE9L8p6QrA==
X-Google-Smtp-Source: ABdhPJwfCW4eScXOvXVkrKe/HqSD8vKH9oSWX05sVl+ydlMtMLH9V/6tAlB0SUKWSvq8+z4upS9jYg==
X-Received: by 2002:a17:90b:4a0d:b0:1c6:f480:b7f2 with SMTP id
 kk13-20020a17090b4a0d00b001c6f480b7f2mr19623205pjb.79.1648142325190; 
 Thu, 24 Mar 2022 10:18:45 -0700 (PDT)
Received: from dev.lizongyuan.local ([103.177.44.10])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm3937412pfb.102.2022.03.24.10.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 10:18:44 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] hw/arm/stellaris: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Fri, 25 Mar 2022 01:17:54 +0800
Message-Id: <20220324171756.196654-3-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220324171756.196654-1-zongyuan.li@smartx.com>
References: <20220324171756.196654-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1036.google.com
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
 "open list:Stellaris" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
---
 hw/arm/stellaris.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index b6c8a5d609..12c673c917 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -9,6 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "hw/core/split-irq.h"
 #include "hw/sysbus.h"
 #include "hw/sd/sd.h"
 #include "hw/ssi/ssi.h"
@@ -1160,6 +1161,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
             DeviceState *ssddev;
             DriveInfo *dinfo;
             DeviceState *carddev;
+            DeviceState *gpio_d_splitter;
             BlockBackend *blk;
 
             /*
@@ -1237,9 +1239,18 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                                    &error_fatal);
 
             ssddev = ssi_create_peripheral(bus, "ssd0323");
-            gpio_out[GPIO_D][0] = qemu_irq_split(
-                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0),
+
+            gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
+            qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
+            qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal);
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 0,
+                    qdev_get_gpio_in_named(sddev, SSI_GPIO_CS, 0));
+            qdev_connect_gpio_out(
+                    gpio_d_splitter, 1,
                     qdev_get_gpio_in_named(ssddev, SSI_GPIO_CS, 0));
+            gpio_out[GPIO_D][0] = qdev_get_gpio_in(gpio_d_splitter, 0);
+
             gpio_out[GPIO_C][7] = qdev_get_gpio_in(ssddev, 0);
 
             /* Make sure the select pin is high.  */
-- 
2.34.0


