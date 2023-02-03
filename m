Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BFA68A486
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 22:18:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO3Qd-0000LU-Bx; Fri, 03 Feb 2023 16:17:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QR-0000FS-AX
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:56 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO3QP-0006DH-4X
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 16:16:51 -0500
Received: by mail-ej1-x636.google.com with SMTP id bk15so18819875ejb.9
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 13:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9y7uNtLNirw+zlKhCFqLJUYA0wqOcSYOS5zDaJZAL3I=;
 b=fp5xuNSOeWx+FOL1AZf1Uhu1bKt9gKU/5sUloE8hEEBxt1xu6Vhs9xSRx7iG7fXgf3
 Qhn6oaTA71+yHD+2qAscE1BenprPraKVAUcWSuNYVjyEUsM43Zdsa5lle7tAToOYAu9K
 kNh+t1x/p0UaMYWfckbY4Ioie5TxbZS4V0fxxrRMKIZCp0BiSDDgLhHoalh9sQJc4YuT
 UGkYiBC4BaJgc1lOZ5nqSx5mA37kN/OgHQ9Osiryfx1B/IpqGagHR1Lm8/YUZajiVvv+
 e6i4tsOKD4QyDYAVQJttqEhowSWb+Wjt42z1bfMW32PwQ+b/F9zjsL2vvjU7eDhFoCfO
 RgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9y7uNtLNirw+zlKhCFqLJUYA0wqOcSYOS5zDaJZAL3I=;
 b=U2gdtwdGnmNVUR/BsrF45Q5Qx9dmuMIidEFIMSawUZ4TlrbkHfol77m7H0ccgDfU6z
 qoG/FFDwIl7JE0mSHG0FHq6ayTe7TO72Sle1mWaNL9v0Gd3sa4xlbchkO0WCXBUT+qRr
 oUtrznG5gnmJqQ3oG/YEd7siqwWEqpAizCyPz/TuVJpgzSQ9MEtgRLHWNWi23ADDlSzc
 otfVCAehpw29KfOWm7uV1JWO6baQ9wCEN+2u4MJpBfEXvKLdhR2MyPvr/nudXGS9leXr
 HCPGAbXXkOQwVR8p6RqA/Zv2z6UZaCHgHGGzlW3VDpZIDoZDTxM4ActEWIYYdtOb0Yx7
 lsDQ==
X-Gm-Message-State: AO0yUKWrMp4quwA+ijlvtCVuM2tRWp1jA7A9w4jzbu+Im6opHBA0sZdH
 R9YyIJ3qsIB0geo4xBNAQjHTk3h29i+SOg1r
X-Google-Smtp-Source: AK7set9e/g8XI0JnbBzcz0KV6uaXu3+rjfLdfy9DHYyvFH9AFAZ8ZDe8DpKtY97SmLYnDWB12CY3+g==
X-Received: by 2002:a17:906:5181:b0:885:dd71:89b5 with SMTP id
 y1-20020a170906518100b00885dd7189b5mr11456513ejk.41.1675459007118; 
 Fri, 03 Feb 2023 13:16:47 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a170906c30d00b0088842b00241sm1871504ejz.114.2023.02.03.13.16.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 13:16:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/ppc/ppc4xx: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 22:16:21 +0100
Message-Id: <20230203211623.50930-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203211623.50930-1-philmd@linaro.org>
References: <20230203211623.50930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

All calls use either errp=&error_abort or &error_fatal,
so converting to the QDev API is almost a no-op (QDev
API always uses &error_abort).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/e500.c          | 3 +--
 hw/ppc/ppc405_boards.c | 6 ++----
 hw/ppc/ppc405_uc.c     | 6 +++---
 hw/ppc/ppc440_bamboo.c | 3 +--
 hw/ppc/ppc4xx_devs.c   | 2 +-
 hw/ppc/sam460ex.c      | 5 ++---
 6 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 9fa1f8e6cf..083961cef5 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -943,8 +943,7 @@ void ppce500_init(MachineState *machine)
          * Secondary CPU starts in halted state for now. Needs to change
          * when implementing non-kernel boot.
          */
-        object_property_set_bool(OBJECT(cs), "start-powered-off", i != 0,
-                                 &error_fatal);
+        qdev_prop_set_bit(DEVICE(cs), "start-powered-off", i != 0);
         qdev_realize_and_unref(DEVICE(cs), NULL, &error_fatal);
 
         if (!firstenv) {
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 4092ebc1ab..67eb9ac139 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -276,10 +276,8 @@ static void ppc405_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", &ppc405->soc,
                             TYPE_PPC405_SOC);
-    object_property_set_link(OBJECT(&ppc405->soc), "dram",
-                             OBJECT(machine->ram), &error_abort);
-    object_property_set_uint(OBJECT(&ppc405->soc), "sys-clk", 33333333,
-                             &error_abort);
+    qdev_prop_set_link(DEVICE(&ppc405->soc), "dram", OBJECT(machine->ram));
+    qdev_prop_set_uint32(DEVICE(&ppc405->soc), "sys-clk", 33333333);
     qdev_realize(DEVICE(&ppc405->soc), NULL, &error_fatal);
 
     /* allocate and load BIOS */
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index c973cfb04e..b7d5cfc548 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1080,7 +1080,7 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
      * We use the 440 DDR SDRAM controller which has more regs and features
      * but it's compatible enough for now
      */
-    object_property_set_int(OBJECT(&s->sdram), "nbanks", 2, &error_abort);
+    qdev_prop_set_uint32(DEVICE(&s->sdram), "nbanks", 2);
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->sdram), &s->cpu, errp)) {
         return;
     }
@@ -1147,8 +1147,8 @@ static void ppc405_soc_realize(DeviceState *dev, Error **errp)
     }
 
     /* MAL */
-    object_property_set_int(OBJECT(&s->mal), "txc-num", 4, &error_abort);
-    object_property_set_int(OBJECT(&s->mal), "rxc-num", 2, &error_abort);
+    qdev_prop_set_uint8(DEVICE(&s->mal), "txc-num", 4);
+    qdev_prop_set_uint8(DEVICE(&s->mal), "rxc-num", 2);
     if (!ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(&s->mal), &s->cpu, errp)) {
         return;
     }
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 81d71adf34..3612471990 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -200,8 +200,7 @@ static void bamboo_init(MachineState *machine)
 
     /* SDRAM controller */
     dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR);
-    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
-                             &error_abort);
+    qdev_prop_set_link(dev, "dram", OBJECT(machine->ram));
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
     /* XXX 440EP's ECC interrupts are on UIC1, but we've only created UIC0. */
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index c1d111465d..1848cf5d3c 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -535,7 +535,7 @@ void ppc4xx_dcr_register(Ppc4xxDcrDeviceState *dev, int dcrn, void *opaque,
 bool ppc4xx_dcr_realize(Ppc4xxDcrDeviceState *dev, PowerPCCPU *cpu,
                         Error **errp)
 {
-    object_property_set_link(OBJECT(dev), "cpu", OBJECT(cpu), &error_abort);
+    qdev_prop_set_link(DEVICE(dev), "cpu", OBJECT(cpu));
     return sysbus_realize(SYS_BUS_DEVICE(dev), errp);
 }
 
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index cf065aae0e..cb828b6d4d 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -345,13 +345,12 @@ static void sam460ex_init(MachineState *machine)
         exit(1);
     }
     dev = qdev_new(TYPE_PPC4xx_SDRAM_DDR2);
-    object_property_set_link(OBJECT(dev), "dram", OBJECT(machine->ram),
-                             &error_abort);
+    qdev_prop_set_link(dev, "dram", OBJECT(machine->ram));
     /*
      * Put all RAM on first bank because board has one slot
      * and firmware only checks that
      */
-    object_property_set_int(OBJECT(dev), "nbanks", 1, &error_abort);
+    qdev_prop_set_uint32(dev, "nbanks", 1);
     ppc4xx_dcr_realize(PPC4xx_DCR_DEVICE(dev), cpu, &error_fatal);
     object_unref(OBJECT(dev));
     /* FIXME: does 460EX have ECC interrupts? */
-- 
2.38.1


