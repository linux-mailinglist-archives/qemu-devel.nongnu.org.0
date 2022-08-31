Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D7B5A8749
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:10:54 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTU33-0003TQ-G0
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpv-0006Ac-GN; Wed, 31 Aug 2022 14:53:15 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:40574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSpt-0008Hc-US; Wed, 31 Aug 2022 14:53:15 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso18008822fac.7; 
 Wed, 31 Aug 2022 11:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=AmInlDqEHfuu3swwa+7g4/0jjqsbRC2H+c9Gqp+h5lE=;
 b=JhhJwIjdeadA7BNhKTQ+iO9EUq2wYsYVwcdDRtelHxRxWsFQFlDAwHPcb5iGVdf5o7
 qJTlgHjebAS/Kk3trKlHl7TsBqvVddC8rcVPBVUBXlstuLIIa0EXXdElSuTjcKvSAUuZ
 UE1bINCwh6oDuhR92jBzG66sRP01LML/XXDF1JLjkNM/EYfIK3KSvMeeg20Wm1ph/FKD
 Dpp1QV3bIDSMIO02eUueq6VR7mablSON1eRyCzs8KFJ+Sxr0+KaD+wU8Sr9l7F9my/w7
 FppBuTEoXunbRdAoHmyPF+/pI9k7JNuQr+cOs0bngMr+jcnkI3na1bOwjqKuAI+9JBVd
 37eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AmInlDqEHfuu3swwa+7g4/0jjqsbRC2H+c9Gqp+h5lE=;
 b=RgLd7+hA7MChHBVYutrQ/ONoCo0sZxYxINIt+Q3kb/BdDwBxarP8QcBuS0Z1finG87
 DffZkT/Qnwl1H3lker3riEnS/NaHhGPkuaq3Nu1RZrRIxoMdYkPMlC3IXZ7zFYoNoBOU
 qVyWRujoD8ElMpXk2Luw2rIHFn8hzo/Uxk7DpHSAG1scf/JpOPh5kIg2KZ9LWsOzFi0g
 6E3Fwek0gEAP4iZhLB5K6zOzC+d4ZS/mDk5bQFZmSrojadGiWHkZuRjZv4Nq3o+lHznZ
 NCkXKgpOgeibEMW4Yy1ritacD0DIV2qvdWxGJKwFAMzfqOmF/T5jtRVUpdL8iS68c9z9
 fLPA==
X-Gm-Message-State: ACgBeo1PZhrUaj5HWn0r/SRMCUsMgzW3apQaB1SHxHnF6hgC8gL5DCDo
 zTjVhz4eFCu3jePiCgiUiYPVi2od6JM=
X-Google-Smtp-Source: AA6agR6MV2yvCJdSfApWb7ojVuwb/2eJE9acjrOX/QqMQFAvWvRv1h5A2E/TgMlhvngG2j5VlYqWHQ==
X-Received: by 2002:a05:6870:a446:b0:11e:9189:b25d with SMTP id
 n6-20020a056870a44600b0011e9189b25dmr2286346oal.206.1661971992408; 
 Wed, 31 Aug 2022 11:53:12 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:53:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 54/60] ppc/ppc405: Use an explicit I2C object
Date: Wed, 31 Aug 2022 15:50:28 -0300
Message-Id: <20220831185034.23240-55-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Cédric Le Goater <clg@kaod.org>

Having an explicit I2C model object will help if one day we want to
add I2C devices on the bus from the machine init routine.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
[balaton: Symplify sysbus device casts for readibility]
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <68eb8b5ac408ca8cc981ebf53a3e154c0d34c7f6.1660746880.git.balaton@eik.bme.hu>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc405.h    |  2 ++
 hw/ppc/ppc405_uc.c | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/ppc405.h b/hw/ppc/ppc405.h
index 67f4c14f50..efa29fdfb1 100644
--- a/hw/ppc/ppc405.h
+++ b/hw/ppc/ppc405.h
@@ -28,6 +28,7 @@
 #include "qom/object.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/intc/ppc-uic.h"
+#include "hw/i2c/ppc4xx_i2c.h"
 
 #define PPC405EP_SDRAM_BASE 0x00000000
 #define PPC405EP_NVRAM_BASE 0xF0000000
@@ -215,6 +216,7 @@ struct Ppc405SoCState {
     Ppc405OcmState ocm;
     Ppc405GpioState gpio;
     Ppc405DmaState dma;
+    PPC4xxI2CState i2c;
     Ppc4xxEbcState ebc;
     Ppc405OpbaState opba;
     Ppc405PobState pob;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index dc17d5bdb5..189f49a138 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1096,6 +1096,8 @@ static void ppc405_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "dma", &s->dma, TYPE_PPC405_DMA);
 
+    object_initialize_child(obj, "i2c", &s->i2c, TYPE_PPC4xx_I2C);
+
     object_initialize_child(obj, "ebc", &s->ebc, TYPE_PPC4xx_EBC);
 
     object_initialize_child(obj, "opba", &s->opba, TYPE_PPC405_OPBA);
@@ -1188,8 +1190,12 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* I2C controller */
-    sysbus_create_simple(TYPE_PPC4xx_I2C, 0xef600500,
-                         qdev_get_gpio_in(DEVICE(&s->uic), 2));
+    sbd = SYS_BUS_DEVICE(&s->i2c);
+    if (!sysbus_realize(sbd, errp)) {
+        return;
+    }
+    sysbus_mmio_map(sbd, 0, 0xef600500);
+    sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(DEVICE(&s->uic), 2));
 
     /* GPIO */
     sbd = SYS_BUS_DEVICE(&s->gpio);
-- 
2.37.2


