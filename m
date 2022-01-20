Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 924584954CE
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 20:17:28 +0100 (CET)
Received: from localhost ([::1]:54676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAcw3-0005je-5t
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 14:17:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgi-0004JI-MY
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:14 -0500
Received: from [2a00:1450:4864:20::32b] (port=40952
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAWgZ-0003IX-Ab
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:37:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 r9-20020a1c4409000000b0034e043aaac7so477796wma.5
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TVpyhUb/uqMHor++qPKwohsK4EfXn5eG3Z8q9ZVcGMk=;
 b=J9f/B6uRKTN4HtXgVYgvVmL6u4oGVSk6Zo6mMn/bRHq86zAOWp164JDJfrlaimI2m6
 JvhCS8dnYeT0jq2TSxAoYPKQ5HgHyBlIOWwb8A3tFzGSlEgyKzOG0wzReDwS2fdxltcG
 R6CR5iVoYe7dE/VtRL33Itb3obtybfPpi5dyVfS1CKuSAan2q4C+P4dsRDgWXmcQI3uA
 MOeR84ULbb0CHKAPIXDbBj29kPfKxvuyepTGUYNRmXMyqFteN4wiER3R7OJzyz7Ylo4R
 4TNc68DdS49paOfggmYErFI6BrAF1gFtpkP65hNd7GHal1e3FDRq7hNclgQLvGgCrvIx
 UytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVpyhUb/uqMHor++qPKwohsK4EfXn5eG3Z8q9ZVcGMk=;
 b=kezpMdHMqRsPWkkKFCKC+J911h8wXPo0CVrj8RySY/bUk+6i3e29HWW3o7Jostcl0B
 DagB/ocjA7Rpz4Qc+a+eS6c7QpJ4Ik/7NXXSvIPwbU0YTF9po8om7bXRiUH7EWTMrroJ
 P7y5KoRiH0aepZOugr/dQ6uE2h1XxZQA20X6vfGyiRj98cJwcKv61HjyGWgtqpjUcqmp
 A7XVOsLun/tEMVg62eOyP0LKM69zccDkoDVxRuIzBBBihUK8x+DV2gGot+VDyr6kobze
 c6ign2S8T/6oC26ZvsybQKDMadXmOeqDI3mNZHVqN6f8ZOpHGo8OlaqUltgaOR7JL069
 j1BQ==
X-Gm-Message-State: AOAM531XdLP8LDa0qYn39ldanvFwa3VcX3VLa9Em3IL0m4gvQedIn6nl
 OEX4RXJ1OUSyTvOgZIJ/HA+ci7GABav39g==
X-Google-Smtp-Source: ABdhPJwtmsuVBv4Cwuy1EzbI5Oc7qsg62PxNqqP2sjx6iihjuPyzCeeKF7UEAx3j8QSU9zWaKft9qw==
X-Received: by 2002:a05:6000:1862:: with SMTP id
 d2mr32983476wri.211.1642682221131; 
 Thu, 20 Jan 2022 04:37:01 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t8sm7993324wmq.43.2022.01.20.04.37.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 04:37:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/38] hw/arm/aspeed: Add the i3c device to the AST2600 SoC
Date: Thu, 20 Jan 2022 12:36:16 +0000
Message-Id: <20220120123630.267975-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120123630.267975-1-peter.maydell@linaro.org>
References: <20220120123630.267975-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

From: Troy Lee <troy_lee@aspeedtech.com>

Add the new i3c device to the AST2600 SoC.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Reviewed-by: Graeme Gregory <quic_ggregory@quicinc.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Graeme Gregory <quic_ggregory@quicinc.com>
Message-id: 20220111084546.4145785-3-troy_lee@aspeedtech.com
[PMM: tidied commit message]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/aspeed_soc.h |  3 +++
 hw/arm/aspeed_ast2600.c     | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
index 18fb7eed461..cae9906684c 100644
--- a/include/hw/arm/aspeed_soc.h
+++ b/include/hw/arm/aspeed_soc.h
@@ -21,6 +21,7 @@
 #include "hw/timer/aspeed_timer.h"
 #include "hw/rtc/aspeed_rtc.h"
 #include "hw/i2c/aspeed_i2c.h"
+#include "hw/misc/aspeed_i3c.h"
 #include "hw/ssi/aspeed_smc.h"
 #include "hw/misc/aspeed_hace.h"
 #include "hw/watchdog/wdt_aspeed.h"
@@ -51,6 +52,7 @@ struct AspeedSoCState {
     AspeedRtcState rtc;
     AspeedTimerCtrlState timerctrl;
     AspeedI2CState i2c;
+    AspeedI3CState i3c;
     AspeedSCUState scu;
     AspeedHACEState hace;
     AspeedXDMAState xdma;
@@ -141,6 +143,7 @@ enum {
     ASPEED_DEV_HACE,
     ASPEED_DEV_DPMCU,
     ASPEED_DEV_DP,
+    ASPEED_DEV_I3C,
 };
 
 #endif /* ASPEED_SOC_H */
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index e33483fb5dd..8f37bdb1d87 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -61,6 +61,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
     [ASPEED_DEV_UART1]     = 0x1E783000,
     [ASPEED_DEV_UART5]     = 0x1E784000,
     [ASPEED_DEV_VUART]     = 0x1E787000,
+    [ASPEED_DEV_I3C]       = 0x1E7A0000,
     [ASPEED_DEV_SDRAM]     = 0x80000000,
 };
 
@@ -108,6 +109,7 @@ static const int aspeed_soc_ast2600_irqmap[] = {
     [ASPEED_DEV_ETH4]      = 33,
     [ASPEED_DEV_KCS]       = 138,   /* 138 -> 142 */
     [ASPEED_DEV_DP]        = 62,
+    [ASPEED_DEV_I3C]       = 102,   /* 102 -> 107 */
 };
 
 static qemu_irq aspeed_soc_get_irq(AspeedSoCState *s, int ctrl)
@@ -223,6 +225,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
     object_initialize_child(obj, "hace", &s->hace, typename);
+
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 }
 
 /*
@@ -523,6 +527,18 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->hace), 0, sc->memmap[ASPEED_DEV_HACE]);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
                        aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
+
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->a7mpcore),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST2600 I3C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
 }
 
 static void aspeed_soc_ast2600_class_init(ObjectClass *oc, void *data)
-- 
2.25.1


