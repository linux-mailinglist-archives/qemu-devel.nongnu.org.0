Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DB8442C17
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:03:47 +0100 (CET)
Received: from localhost ([::1]:59384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhrZy-0001oW-LY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrVz-0007HR-NQ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:39 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:38574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrVx-0006qo-Nx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 06:59:39 -0400
Received: by mail-qk1-x736.google.com with SMTP id bi29so19188092qkb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 03:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZ8jbPHuutNMQo4+y79myRiaCVlrVDNnYi0kShgMey4=;
 b=expS31den/rdIslwD9iTjzplKePiOZDROIcR0GaWJb1MAYZDvU3KjVwDkIRY008+9r
 CxsJTQJwE11l5kNHjV2at28/itidqTosWE52T8mw0mIWubz9UsjdqS2fw1VWsUTIOVTV
 wm+c6F+4UYDKzFTNNHyruwY/mqwKFIoVu/vHKBi8FBtaQitL3rd9HJB0Lfrkgx82GMC9
 ZAZ8+sOOFD1qxicASvMhuSod34ExvSxk0bTp/JHuDSvhk2/pUSW3tweBXKEoncV6qRYE
 ETf6MbCEfA2kVJa/rEHOaHHdmDgT1rrAE+QkGJq3sUoobi52eRgzRe2o+i6+a9uEofr6
 vJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZ8jbPHuutNMQo4+y79myRiaCVlrVDNnYi0kShgMey4=;
 b=JkJXueJqZr/TknnGNrVzdWa5ELvpJWLjzUwuk6pwyNLSmkGNm3cOJ8phKWb0chcvPD
 NMWp0N1qno8o0jsT4TQ7BzlgazGI36cK+1QdTgAn3l8n8WTkfsVTnua89xJxiieDl2WO
 JCil3KUb8k+nydX+/M7l7nkQ39l7KZ0c0ZS9pICTGDiO0mPvbGiO8tWVsC3mblsqLC6g
 1zFsr7CN72L5Xz3HyqrDPlIgANXdqeZeCZa4eVZ3lvvnOIPAJe6bCPt3To5hUpqrMNUX
 UsmxL0Q/mj95MiM9hQ5WmNdDzNKdl9f9k63XVEC9Tx9jZr96l2Po4USG9eNMXkkVPumP
 nDSA==
X-Gm-Message-State: AOAM530D8mZ5b1gQswVxb1Xc4U4KA4MS/fuGxxU0LDXqsXCUQsE0mODM
 HqAEFLWdwmElPlJ71N/vsKkgPzk9xlMgnA==
X-Google-Smtp-Source: ABdhPJyQO0CpQ2CNKwZSLhE6LpFqmHKwHI7WZ/ef4GYY9WP9wNe/+EZ1xwmMo5ppTORZfNgs3OZ9+A==
X-Received: by 2002:a05:620a:4455:: with SMTP id
 w21mr12251340qkp.140.1635850776694; 
 Tue, 02 Nov 2021 03:59:36 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z26sm11789510qko.13.2021.11.02.03.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 03:59:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/12] hw/arm: Add Nuvoton SD module to board
Date: Tue,  2 Nov 2021 06:59:24 -0400
Message-Id: <20211102105934.214596-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102105934.214596-1-richard.henderson@linaro.org>
References: <20211102105934.214596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x736.google.com
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


