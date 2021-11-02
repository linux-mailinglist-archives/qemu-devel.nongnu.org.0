Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B00443595
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:29:14 +0100 (CET)
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyX3-0008Pv-2k
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTO-0005fr-UX
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:27 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:46922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhyTM-0004DR-26
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:25:26 -0400
Received: by mail-qk1-x72e.google.com with SMTP id bl12so6235417qkb.13
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZ8jbPHuutNMQo4+y79myRiaCVlrVDNnYi0kShgMey4=;
 b=zXoBjf0Zv0Hadizg7WxjlWvcX5Pb2gq6evr8Mi3VJNtVIU0+xTzuUON6/NLuKzH4An
 KoEHHyU1uvRql+XR09JLbBdl5OuUY+diGoa9jdRMizIarnlwy4TfE8RUvXZbHmVWdHTF
 BBp88gRdKwCUcYl8c7PTCZUPjieXO5cSKfhbaqZs3eBHTcHJXehmHZQqJa229Odx8s41
 yF1oEaJyuMQoSSQb3SZW1c61B+kx7hEaVvW4LAKqDJP5uWGW+DIgEBnX6TpT8TLT8FLc
 qa5zKuMB5NpSaSCUIJBvBHOZy0HNfk19m8sgXjdEA7oQuoQD1cUN1ze7mkWnPdKoRc+d
 2xaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZ8jbPHuutNMQo4+y79myRiaCVlrVDNnYi0kShgMey4=;
 b=XLS6c9BM3LGPhADBvXcxNOiOFyaAijz9VAB/LQWQb4xG2dN3Q7EaPPmlwebu8Q/h4q
 9WvL/VsOY7w4e39EzOB2HLlPtAUKLBd6GSNI5l2MguZj82vTKg3XgmRoSimzelIs/CSO
 XYOFcDj8QT+M61ytFu3qJbHINFLZuh3d4s+6sFvlQHlhgSEKWQwRVntoEvrAU5VFP02V
 ZFupcoQvppM7AvBqGBXQXoeKColpE/KsEvYP/Pl1dMnKHmmF6ga4ksf26uzMM0iBQmL+
 rMqKs5I73Fp7WZu9Vn38trsAI0kzmEeDI7HH66zVNFQiSOstEaDWFFqHYYucRCYW1DXF
 0vIw==
X-Gm-Message-State: AOAM530Af6m4v+C05i4UWhvJLE1TFLMYAjkhhPNYlg6VtWmLf72BPgoE
 IiukkMnDMqe26bhf0cMCkRq7UyGTfHl3sw==
X-Google-Smtp-Source: ABdhPJzNIEvMtg5/5e/9BANVnEPKH0WCj+IZpk+jVuCKxPbTQXE1sWlufI5v9RBXnxyRWuelCa5JEg==
X-Received: by 2002:a05:620a:4550:: with SMTP id
 u16mr10148328qkp.112.1635877522033; 
 Tue, 02 Nov 2021 11:25:22 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id y9sm13701081qko.74.2021.11.02.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 11:25:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 02/12] hw/arm: Add Nuvoton SD module to board
Date: Tue,  2 Nov 2021 14:25:09 -0400
Message-Id: <20211102182519.320319-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102182519.320319-1-richard.henderson@linaro.org>
References: <20211102182519.320319-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Tyrone Ting <kfting@nuvoton.com>,
 Shengtan Mao <stmao@google.com>, Chris Rauer <crauer@google.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shengtan Mao <stmao@google.com>

Signed-off-by: Shengtan Mao <stmao@google.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20211008002628.1958285-3-wuhaotsh@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/arm/npcm7xx.h |  2 ++
 hw/arm/npcm7xx.c         | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 61ecc57ab9..ce593235d9 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -35,6 +35,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/usb/hcd-ohci.h"
 #include "target/arm/cpu.h"
+#include "hw/sd/npcm7xx_sdhci.h"
 
 #define NPCM7XX_MAX_NUM_CPUS    (2)
 
@@ -103,6 +104,7 @@ typedef struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxSDHCIState   mmc;
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 2ab0080e0b..878c2208e0 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -63,6 +63,8 @@
 #define NPCM7XX_ROM_BA          (0xffff0000)
 #define NPCM7XX_ROM_SZ          (64 * KiB)
 
+/* SDHCI Modules */
+#define NPCM7XX_MMC_BA          (0xf0842000)
 
 /* Clock configuration values to be fixed up when bypassing bootloader */
 
@@ -83,6 +85,7 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART3_IRQ,
     NPCM7XX_EMC1RX_IRQ          = 15,
     NPCM7XX_EMC1TX_IRQ,
+    NPCM7XX_MMC_IRQ             = 26,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -443,6 +446,8 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
+
+    object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -707,6 +712,12 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
                            &error_abort);
     memory_region_add_subregion(get_system_memory(), NPCM7XX_ROM_BA, &s->irom);
 
+    /* SDHCI */
+    sysbus_realize(SYS_BUS_DEVICE(&s->mmc), &error_abort);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->mmc), 0, NPCM7XX_MMC_BA);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->mmc), 0,
+            npcm7xx_irq(s, NPCM7XX_MMC_IRQ));
+
     create_unimplemented_device("npcm7xx.shm",          0xc0001000,   4 * KiB);
     create_unimplemented_device("npcm7xx.vdmx",         0xe0800000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
@@ -736,7 +747,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.usbd[8]",      0xf0838000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[9]",      0xf0839000,   4 * KiB);
     create_unimplemented_device("npcm7xx.sd",           0xf0840000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.mmc",          0xf0842000,   8 * KiB);
     create_unimplemented_device("npcm7xx.pcimbx",       0xf0848000, 512 * KiB);
     create_unimplemented_device("npcm7xx.aes",          0xf0858000,   4 * KiB);
     create_unimplemented_device("npcm7xx.des",          0xf0859000,   4 * KiB);
-- 
2.25.1


