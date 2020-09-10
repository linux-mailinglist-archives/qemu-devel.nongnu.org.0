Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F288C26517F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 22:56:23 +0200 (CEST)
Received: from localhost ([::1]:41512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGTcE-0006vj-00
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 16:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGTad-0004K6-8t; Thu, 10 Sep 2020 16:54:43 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGTab-0000Hu-GZ; Thu, 10 Sep 2020 16:54:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id j2so8648802wrx.7;
 Thu, 10 Sep 2020 13:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jBgL1iKIvz4jH+dRa8U6fT1B6oJw6/SF3dkJ8j+0tYI=;
 b=svLfx+sk71ilf1v7mWwgPQgvz9Qd0vt5/dpJ0UrIuGsT7baiAv6AaII2q9v/Bc2ziN
 ra9Rv1ExUCMKzbvSHQMisdWXjYNITHFwZ4meCebEaOiJwlwBtiGz06jhiCeVSPxzgLut
 LRKcwSuUbWkl0M1ETT+5a+pFx1HojMoVC7CbJV6zQt/4Wmbb78TlfvZ/cB9tZEeh6EWH
 M8CXjS2qoeIZ6hX1RMyz2eFWNpGe7yIG4jdH/R3+4we0+OlQCveaA1SxZdAcY527artu
 JK4wcVb71UXyAslT946KDkUGKDxiDMa/3ubCiXkPB3THJ6znEgJQpj6cBQsBr4djMiNw
 qt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jBgL1iKIvz4jH+dRa8U6fT1B6oJw6/SF3dkJ8j+0tYI=;
 b=T0AFyfwJf2cmyd+MJZclugiHDhhc+TEb97srrpdxigtgZIZ3biIjI6I7LmnNT8lQDg
 XBGBiqTwEG4W808pOyO1seHGe3RjFxsxV+DnkTHRH9UW416fyey8VBj2LOTZhwmE5Q4h
 wqmivY3j2pg62Qo4NOaEXUBmqhsRgmrA2qgz6CNI0g2V/MP1DsqAtbl8SYSX2ta3CLUw
 X34r3ShiVQ4aMddKVfLVjUIaSHG0G04cr33tCBsy7zjK6T0hMcxInEAxdI9OzeK+wIpJ
 B1maUtFnES420dEjuUHqbcobJzgbHPYDMFDBsXDhl+ObY+JPWAYM8H5FGJPzPzpGVmCe
 KhmQ==
X-Gm-Message-State: AOAM530QoHFVaxUSnb+RI3d/vh0P1vZwJpnqioAS8w/UzRjpo7XhF2F0
 NXBG/Z+pQRhzYn4g1iyC4X/eGExx2B4=
X-Google-Smtp-Source: ABdhPJwv4fKzCEYQmsDnkP5x2gyr6A31QscgE8a8Jy+2REJYvQuVfT6rfomLk2OBmZECRyJgl/YIUQ==
X-Received: by 2002:a5d:5042:: with SMTP id h2mr10980380wrt.409.1599771279223; 
 Thu, 10 Sep 2020 13:54:39 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id t1sm5089317wmi.16.2020.09.10.13.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 13:54:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/7] hw/misc/mps2-scc: Use the LED device
Date: Thu, 10 Sep 2020 22:54:28 +0200
Message-Id: <20200910205429.727766-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910205429.727766-1-f4bug@amsat.org>
References: <20200910205429.727766-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the 'ARM MPS2 and MPS2+ FPGA Prototyping Boards Technical
Reference Manual' (100112_0200_07_en):

  2.1  Overview of the MPS2 and MPS2+ hardware

       The MPS2 and MPS2+ FPGA Prototyping Boards contain the
       following components and interfaces:

       * User switches and user LEDs:

         - Two green LEDs and two push buttons that connect to
           the FPGA.
         - Eight green LEDs and one 8-way dip switch that connect
           to the MCC.

Add the 8 LEDs connected to the MCC.

This remplaces the 'mps2_scc_leds' trace events by the generic
'led_set_intensity' event.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
https://youtu.be/l9kD70uPchk?t=288
---
 include/hw/misc/mps2-scc.h |  2 ++
 hw/misc/mps2-scc.c         | 25 ++++++++++++++-----------
 hw/misc/Kconfig            |  1 +
 hw/misc/trace-events       |  1 -
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/include/hw/misc/mps2-scc.h b/include/hw/misc/mps2-scc.h
index 7045473788b..8542f384227 100644
--- a/include/hw/misc/mps2-scc.h
+++ b/include/hw/misc/mps2-scc.h
@@ -13,6 +13,7 @@
 #define MPS2_SCC_H
 
 #include "hw/sysbus.h"
+#include "hw/misc/led.h"
 
 #define TYPE_MPS2_SCC "mps2-scc"
 #define MPS2_SCC(obj) OBJECT_CHECK(MPS2SCC, (obj), TYPE_MPS2_SCC)
@@ -25,6 +26,7 @@ typedef struct {
 
     /*< public >*/
     MemoryRegion iomem;
+    LEDState *led[8];
 
     uint32_t cfg0;
     uint32_t cfg1;
diff --git a/hw/misc/mps2-scc.c b/hw/misc/mps2-scc.c
index 9d0909e7b35..745505b849d 100644
--- a/hw/misc/mps2-scc.c
+++ b/hw/misc/mps2-scc.c
@@ -20,11 +20,13 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "qemu/bitops.h"
 #include "trace.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 #include "hw/registerfields.h"
 #include "hw/misc/mps2-scc.h"
+#include "hw/misc/led.h"
 #include "hw/qdev-properties.h"
 
 REG32(CFG0, 0)
@@ -152,18 +154,10 @@ static void mps2_scc_write(void *opaque, hwaddr offset, uint64_t value,
         s->cfg0 = value;
         break;
     case A_CFG1:
-        /* CFG1 bits [7:0] control the board LEDs. We don't currently have
-         * a mechanism for displaying this graphically, so use a trace event.
-         */
-        trace_mps2_scc_leds(value & 0x80 ? '*' : '.',
-                            value & 0x40 ? '*' : '.',
-                            value & 0x20 ? '*' : '.',
-                            value & 0x10 ? '*' : '.',
-                            value & 0x08 ? '*' : '.',
-                            value & 0x04 ? '*' : '.',
-                            value & 0x02 ? '*' : '.',
-                            value & 0x01 ? '*' : '.');
         s->cfg1 = value;
+        for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
+            led_set_state(s->led[i], extract32(value, i, 1));
+        }
         break;
     case A_CFGDATA_OUT:
         s->cfgdata_out = value;
@@ -245,10 +239,19 @@ static void mps2_scc_init(Object *obj)
 
     memory_region_init_io(&s->iomem, obj, &mps2_scc_ops, s, "mps2-scc", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
+
 }
 
 static void mps2_scc_realize(DeviceState *dev, Error **errp)
 {
+    MPS2SCC *s = MPS2_SCC(dev);
+
+    for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
+        char *name = g_strdup_printf("SCC LED%zu", i);
+        s->led[i] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
+                                      LED_COLOR_GREEN, name);
+        g_free(name);
+    }
 }
 
 static const VMStateDescription mps2_scc_vmstate = {
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 0cecad45aad..7557a3e7b46 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -97,6 +97,7 @@ config MPS2_FPGAIO
 
 config MPS2_SCC
     bool
+    select LED
 
 config TZ_MPC
     bool
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 43b9e0cf250..a620a358feb 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -85,7 +85,6 @@ aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64
 mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_scc_write(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC write: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
 mps2_scc_reset(void) "MPS2 SCC: reset"
-mps2_scc_leds(char led7, char led6, char led5, char led4, char led3, char led2, char led1, char led0) "MPS2 SCC LEDs: %c%c%c%c%c%c%c%c"
 mps2_scc_cfg_write(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config write: function %d device %d data 0x%" PRIx32
 mps2_scc_cfg_read(unsigned function, unsigned device, uint32_t value) "MPS2 SCC config read: function %d device %d data 0x%" PRIx32
 
-- 
2.26.2


