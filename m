Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDDB35958F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 08:34:14 +0200 (CEST)
Received: from localhost ([::1]:48092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUkib-0004xz-Pi
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 02:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZQ-0004ho-T7; Fri, 09 Apr 2021 02:24:47 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lUkZN-0001eo-VY; Fri, 09 Apr 2021 02:24:44 -0400
Received: by mail-ej1-x633.google.com with SMTP id u17so6874201ejk.2;
 Thu, 08 Apr 2021 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ge+UwN7N+4mN3C6ng3RtkaVCXw7LRu2ISOzslpilhag=;
 b=sqI6xGXAI0n0K+8BjBLgH9G7oD1OPFoSjYfbLCqgasErypf378fdNteeFfrbYbaryn
 fe6HJhebGQQmAU+PKCfWAIhDwL5DnOpLx0Jglp52aGcNoLE6YxpzcjtuNY03p7LISz6v
 cBI4GmOcXbCywe/Jh77OjuGR/4ilEYSoZgld+e8D8/ZBmU8Cwd4eXiyvjv1Wmh3/Mcw+
 5vzCNTpLC7yZ/ocK2pxYeufZXCjqLzcrRf28eEWspmV9rhHUYXwOop6t4WgdX6yebilW
 Lbt18y9/DhknaRcb3TOobaL0srBo+IzheDZfL1rO5glGqs13PdVWp3Gkm7smuR+MTVSl
 v3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ge+UwN7N+4mN3C6ng3RtkaVCXw7LRu2ISOzslpilhag=;
 b=FAg75yKF1gg5gX+tNDEH1lhBfo+Nd0UHNV2d1MT6Ncppk+01T5zKRtbnTIwYe1BEyY
 +QjWs0RlPTi30uKDl0kD3Vs1ojx7l9N8zLDwC4I8UO4sVJrHVFeYmjD48mgmegAWzTWn
 N7TqmPalXwA9C9bAVui5Ed5ocJDX11mFz9mSuv43s+7jNdrO5X6UPWdNTQSnkJmzHfH1
 5SNYPkEB0FD+aNlr6R5chGIcwQ0yE1Ec1fUxGa48RvvVn5xyM7qUqzQBD1DVxrEjoQH4
 +Mr8wgQlxlfTa5yt+qAFUyByHZwU1oP1qcA6e0fNxbtjkpxybAZbbCitQBTi1nY62Fck
 R3WQ==
X-Gm-Message-State: AOAM533LeNX2jUkNO/kUopcHM+yeeIMtNEmL8smNuw70XQljmFntZBXb
 XxGuStGY/mzAjlRTAQRZvo6hhp9mN0PKqg==
X-Google-Smtp-Source: ABdhPJyDUfeN6H/klQeGg95tmYz3oRaFLhxDxpus26sJoIAX5Ug2xbEEgp9xVqR8PaYzAT4NjQo3Kg==
X-Received: by 2002:a17:907:93a:: with SMTP id
 au26mr14718110ejc.47.1617949480146; 
 Thu, 08 Apr 2021 23:24:40 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g26sm705658ejz.70.2021.04.08.23.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 23:24:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.1 7/9] hw/misc/bcm2835_cprman: Feed 'xosc' from the
 board
Date: Fri,  9 Apr 2021 08:23:59 +0200
Message-Id: <20210409062401.2350436-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210409062401.2350436-1-f4bug@amsat.org>
References: <20210409062401.2350436-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The XOsc signal isn't a part of the CPRMAN, but comes from a
crystal oscillator external to the SoC.

Create the oscillator on the board, and propagate it to the
CPRMAN.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/bcm2835_cprman.h | 1 -
 hw/arm/bcm2835_peripherals.c     | 1 +
 hw/arm/bcm2836.c                 | 1 +
 hw/arm/raspi.c                   | 4 ++++
 hw/misc/bcm2835_cprman.c         | 5 +----
 5 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/hw/misc/bcm2835_cprman.h b/include/hw/misc/bcm2835_cprman.h
index 2996ccb4632..52f76489f36 100644
--- a/include/hw/misc/bcm2835_cprman.h
+++ b/include/hw/misc/bcm2835_cprman.h
@@ -201,7 +201,6 @@ struct BCM2835CprmanState {
     CprmanDsi0HsckMuxState dsi0hsck_mux;
 
     uint32_t regs[CPRMAN_NUM_REGS];
-    uint32_t xosc_freq;
 
     Clock *xosc;
 };
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index dcff13433e5..a82f2b42f5a 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -123,6 +123,7 @@ static void bcm2835_peripherals_init(Object *obj)
 
     /* CPRMAN clock manager */
     object_initialize_child(obj, "cprman", &s->cprman, TYPE_BCM2835_CPRMAN);
+    qdev_alias_clock(DEVICE(&s->cprman), "xosc-in", DEVICE(s), "xosc-in");
 
     object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
index de7ade2878e..6c238ecb949 100644
--- a/hw/arm/bcm2836.c
+++ b/hw/arm/bcm2836.c
@@ -63,6 +63,7 @@ static void bcm2836_init(Object *obj)
                               "board-rev");
     object_property_add_alias(obj, "vcram-size", OBJECT(&s->peripherals),
                               "vcram-size");
+    qdev_alias_clock(DEVICE(&s->peripherals), "xosc-in", DEVICE(s), "xosc-in");
 }
 
 static bool bcm283x_common_realize(DeviceState *dev, Error **errp)
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 990509d3852..a89f7e17c3a 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -40,6 +40,7 @@ struct RaspiMachineState {
     /*< private >*/
     MachineState parent_obj;
     /*< public >*/
+    Clock *xosc;
     BCM283XState soc;
     struct arm_boot_info binfo;
 };
@@ -277,12 +278,15 @@ static void raspi_machine_init(MachineState *machine)
     memory_region_add_subregion_overlap(get_system_memory(), 0,
                                         machine->ram, 0);
 
+    s->xosc = machine_create_constant_clock(machine, "xosc", 19200000);
+
     /* Setup the SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc,
                             board_soc_type(board_rev));
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(machine->ram));
     object_property_set_int(OBJECT(&s->soc), "board-rev", board_rev,
                             &error_abort);
+    qdev_connect_clock_in(DEVICE(&s->soc), "xosc-in", s->xosc);
     qdev_realize(DEVICE(&s->soc), NULL, &error_abort);
 
     /* Create and plug in the SD cards */
diff --git a/hw/misc/bcm2835_cprman.c b/hw/misc/bcm2835_cprman.c
index 5039b7632b4..33f15d99f63 100644
--- a/hw/misc/bcm2835_cprman.c
+++ b/hw/misc/bcm2835_cprman.c
@@ -637,8 +637,6 @@ static void cprman_reset(DeviceState *dev)
     for (i = 0; i < CPRMAN_NUM_CLOCK_MUX; i++) {
         device_cold_reset(DEVICE(&s->clock_muxes[i]));
     }
-
-    clock_update_hz(s->xosc, s->xosc_freq);
 }
 
 static void cprman_init(Object *obj)
@@ -677,7 +675,7 @@ static void cprman_init(Object *obj)
         g_free(alias);
     }
 
-    s->xosc = clock_new(obj, "xosc");
+    s->xosc = qdev_init_clock_in(DEVICE(obj), "xosc-in", NULL, s, ClockUpdate);
 
     memory_region_init_io(&s->iomem, obj, &cprman_ops,
                           s, "bcm2835-cprman", 0x2000);
@@ -776,7 +774,6 @@ static const VMStateDescription cprman_vmstate = {
 };
 
 static Property cprman_properties[] = {
-    DEFINE_PROP_UINT32("xosc-freq-hz", BCM2835CprmanState, xosc_freq, 19200000),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
2.26.3


