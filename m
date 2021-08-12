Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37613EA259
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:46:45 +0200 (CEST)
Received: from localhost ([::1]:39314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7IS-0007wA-Rn
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76U-0005s0-8W
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:22 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:33720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76Q-00080T-Fc
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l10-20020a05600c4f0a00b002e6be174c29so546892wmq.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rD6Gs6UZYHCYOmO7OPcudD+C6p8+ffTj/hCxqJpj3NU=;
 b=gqaBm9OrUHr0znGAbo/QVByRruWa0JaFkdbyFoAiN8MzH9sBsnLRWlcNe5V9VHdD9i
 xWn3gVQEmVn5TA5ajQ0fgJxKSYnUmfj068xSuOqZtcb+r1g0HJGLJH17QZjDcNhHIXDR
 B8FD/9CQymY8h/YqjZqClrVpgYKa8xcnmFUg9JfVcr+f2CqV9AhsirBtpjlSMBP5mm/Z
 x7cQHdC6Q2f9969Eh2YG3PhdllanveyCyW+DmjIknF3FlFj+6gCwydXF2w22A7EJ8wQ/
 iUAz5EvMfnR/WuYvhehaBtsF3agjm71Op3Qr1bhX9IXBRcWnGs5Mt1E5WSY1rHqleMZS
 eg5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rD6Gs6UZYHCYOmO7OPcudD+C6p8+ffTj/hCxqJpj3NU=;
 b=boKuBlfC9dUhqu0HZEf2s4g5rrOOCFDYnIdY5EJOT7sTPdVPUIcYo2+I/BYysdrY55
 JiCiQYC2eV4Culc54IV4g8CRorAntnRr3Md6zlGvxxiItjdvMbaydrYaq7YTvGJBkv+8
 7T7kMl/07qV1hIu6hNU0QmsOnjBHpySvtdsmMOfeLfTEMcyFj2Lcs8XTPJG0htUPn44Y
 cms7laa42zOJzX3cTmQ0k75Qb7ErBCP9KvnP1OY5UyUNxpoaFytsX20E/F/5U2RwysXj
 4gjc6PYjstFAIMgNmpaxb36TvWW5Q1jz/Pg8sr5BoVeQA0wW+E6x+GOF72wOmJTTbNdT
 Vt7Q==
X-Gm-Message-State: AOAM533IqvkeoZ2uUiDap60KG8VOaCiT4/t0Mu2E9dPYS6n6UEcDuhul
 3aLO2p/qOXyRqt8JiThM8xtz5w==
X-Google-Smtp-Source: ABdhPJyA5JZYE9IAxxPBr7hm7anAB7nu8IdRnmb7Y6xx6ARsFpJ/gXUgJaupu7u7KRUzVmAZCp8fVA==
X-Received: by 2002:a1c:7c19:: with SMTP id x25mr5340208wmc.172.1628760857087; 
 Thu, 12 Aug 2021 02:34:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 19/25] hw/arm/msf2: Use Clock input to MSF2_SOC
 instead of m3clk property
Date: Thu, 12 Aug 2021 10:33:50 +0100
Message-Id: <20210812093356.1946-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of passing the MSF2 SoC an integer property specifying the
CPU clock rate, pass it a Clock instead.  This lets us wire that
clock up to the armv7m object.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/msf2-soc.h |  3 ++-
 hw/arm/msf2-soc.c         | 28 +++++++++++++++++-----------
 hw/arm/msf2-som.c         |  7 ++++++-
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index 38e10ce20aa..01f904cec47 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -30,6 +30,7 @@
 #include "hw/misc/msf2-sysreg.h"
 #include "hw/ssi/mss-spi.h"
 #include "hw/net/msf2-emac.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_MSF2_SOC     "msf2-soc"
@@ -57,7 +58,7 @@ struct MSF2State {
     uint64_t envm_size;
     uint64_t esram_size;
 
-    uint32_t m3clk;
+    Clock *m3clk;
     uint8_t apb0div;
     uint8_t apb1div;
 
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index f36788054b3..0a1e594aee6 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -29,6 +29,7 @@
 #include "hw/char/serial.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
+#include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
 
 #define MSF2_TIMER_BASE       0x40004000
@@ -73,6 +74,8 @@ static void m2sxxx_soc_initfn(Object *obj)
     }
 
     object_initialize_child(obj, "emac", &s->emac, TYPE_MSS_EMAC);
+
+    s->m3clk = qdev_init_clock_in(DEVICE(obj), "m3clk", NULL, NULL, 0);
 }
 
 static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -84,6 +87,11 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
 
     MemoryRegion *system_memory = get_system_memory();
 
+    if (!clock_has_source(s->m3clk)) {
+        error_setg(errp, "m3clk must be wired up by the board code");
+        return;
+    }
+
     memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
                            &error_fatal);
     /*
@@ -106,19 +114,14 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->m3clk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
         return;
     }
 
-    if (!s->m3clk) {
-        error_setg(errp, "Invalid m3clk value");
-        error_append_hint(errp, "m3clk can not be zero\n");
-        return;
-    }
-
-    system_clock_scale = NANOSECONDS_PER_SECOND / s->m3clk;
+    system_clock_scale = clock_ticks_to_ns(s->m3clk, 1);
 
     for (i = 0; i < MSF2_NUM_UARTS; i++) {
         if (serial_hd(i)) {
@@ -129,8 +132,13 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     }
 
     dev = DEVICE(&s->timer);
-    /* APB0 clock is the timer input clock */
-    qdev_prop_set_uint32(dev, "clock-frequency", s->m3clk / s->apb0div);
+    /*
+     * APB0 clock is the timer input clock.
+     * TODO: ideally the MSF2 timer device should use a Clock rather than a
+     * clock-frequency integer property.
+     */
+    qdev_prop_set_uint32(dev, "clock-frequency",
+                         clock_get_hz(s->m3clk) / s->apb0div);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer), errp)) {
         return;
     }
@@ -207,8 +215,6 @@ static Property m2sxxx_soc_properties[] = {
     DEFINE_PROP_UINT64("eNVM-size", MSF2State, envm_size, MSF2_ENVM_MAX_SIZE),
     DEFINE_PROP_UINT64("eSRAM-size", MSF2State, esram_size,
                         MSF2_ESRAM_MAX_SIZE),
-    /* Libero GUI shows 100Mhz as default for clocks */
-    DEFINE_PROP_UINT32("m3clk", MSF2State, m3clk, 100 * 1000000),
     /* default divisors in Libero GUI */
     DEFINE_PROP_UINT8("apb0div", MSF2State, apb0div, 2),
     DEFINE_PROP_UINT8("apb1div", MSF2State, apb1div, 2),
diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
index 343ec977c07..396e8b99138 100644
--- a/hw/arm/msf2-som.c
+++ b/hw/arm/msf2-som.c
@@ -29,6 +29,7 @@
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/boot.h"
+#include "hw/qdev-clock.h"
 #include "exec/address-spaces.h"
 #include "hw/arm/msf2-soc.h"
 
@@ -49,6 +50,7 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
     BusState *spi_bus;
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *ddr = g_new(MemoryRegion, 1);
+    Clock *m3clk;
 
     if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
         error_report("This board can only be used with CPU %s",
@@ -72,7 +74,10 @@ static void emcraft_sf2_s2s010_init(MachineState *machine)
      * in Libero. CPU clock is divided by APB0 and APB1 divisors for
      * peripherals. Emcraft's SoM kit comes with these settings by default.
      */
-    qdev_prop_set_uint32(dev, "m3clk", 142 * 1000000);
+    /* This clock doesn't need migration because it is fixed-frequency */
+    m3clk = clock_new(OBJECT(machine), "m3clk");
+    clock_set_hz(m3clk, 142 * 1000000);
+    qdev_connect_clock_in(dev, "m3clk", m3clk);
     qdev_prop_set_uint32(dev, "apb0div", 2);
     qdev_prop_set_uint32(dev, "apb1div", 2);
 
-- 
2.20.1


