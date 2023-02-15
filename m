Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A4C698283
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 18:44:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSLpE-0000en-0T; Wed, 15 Feb 2023 12:44:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLpC-0000eD-9t
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSLpA-0008DY-OX
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 12:44:10 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso2223587wms.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 09:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4xWeqx5C/Xjzaw1eQA4/F7uZTIcR+NwJk/0kJcEYTAY=;
 b=IUZDYPUxoTz64E5CsADb59dPUZIMb31X/tgySvrGmDuEdvmFEsEv6OOqEoawQhASpG
 Y0xqT/osOWB55zfb8IVlEB3g1aB1GWTupU2lQyzgeNtSNKaamuxhw3iYy0SkzEe+R46g
 LprJCLeEklZ/81t+bixRziYVDcy8+TFCsuLS68X/58n36lUeUl4xu/x2G4XKQUl8fqVY
 yNKqf6iZbq4hyHOBsdePvt3k/ANFx5oTSnBcPRL/EC69r53YA1fJkxV7+LKweyPxFsGg
 WeiA/cxycScza3jopc7RZxjZuDuqUm4iRm95y714NBpoKGuOhQM+TjlWakSBXG9WHd9x
 P6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4xWeqx5C/Xjzaw1eQA4/F7uZTIcR+NwJk/0kJcEYTAY=;
 b=CdnMLCWh5EmtHRFeBmN1ENa9NADNcyvvaHOeUTk6Yeq22OpZi595+YgaetbMW0/Gd1
 UMulCmp3ps7YIgR2oKa4ndC9jamfeXp2xLL0pISVIlyUpE0CuShoISrtL5n89vgWA7RI
 PNDkzR1yjF386owBgbHMwx+VeIQPR1gDjYgmpopkpwWMpe27960jYW2jP41D/WvhqGNA
 7Ip+nL/8z/PHY1YrqmNx5WOUdMBKf2Fhz3VyqpGCA0nhr13FbE8ig3fJ/l9JPdSaUTyE
 mqQCUH5izw/4v6qCeVHLngBVsd2lHLolz7/qngHoqBkHIKj/JZ3eIVwoi9QKN+Rg2Jq0
 dNww==
X-Gm-Message-State: AO0yUKUkf0t3d7smhvM1LDY9ZBVMyvplCPawy/rl44dP3ubYRdgrdKSZ
 P4x4g0cY1tzRwII22avKmN06j0jYVPDRaQSh
X-Google-Smtp-Source: AK7set/7lvshecTiyDKvaOH/yA+UWKADLvy67Z5P7A4WG491XE/W3jOetrh7ZzUU8Z/Vc4P2Um29/A==
X-Received: by 2002:a05:600c:46c6:b0:3e0:14a:697a with SMTP id
 q6-20020a05600c46c600b003e0014a697amr2921374wmo.6.1676483046880; 
 Wed, 15 Feb 2023 09:44:06 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c469100b003dd1b00bd9asm3004147wmo.32.2023.02.15.09.44.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 09:44:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] hw/timer/i8254: Factor i8254_pit_create() out and document
Date: Wed, 15 Feb 2023 18:43:50 +0100
Message-Id: <20230215174353.37097-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215174353.37097-1-philmd@linaro.org>
References: <20230215174353.37097-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/i8254.c         | 16 ++++++++++++++++
 include/hw/timer/i8254.h | 24 +++++++++++++-----------
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
index c8388ea432..9b6932ab08 100644
--- a/hw/timer/i8254.c
+++ b/hw/timer/i8254.c
@@ -26,9 +26,11 @@
 #include "hw/irq.h"
 #include "qemu/module.h"
 #include "qemu/timer.h"
+#include "hw/qdev-properties.h"
 #include "hw/timer/i8254.h"
 #include "hw/timer/i8254_internal.h"
 #include "qom/object.h"
+#include "qapi/error.h"
 
 //#define DEBUG_PIT
 
@@ -47,6 +49,20 @@ struct PITClass {
     DeviceRealize parent_realize;
 };
 
+ISADevice *i8254_pit_create(ISABus *bus, int iobase, qemu_irq irq_in)
+{
+    DeviceState *dev;
+    ISADevice *d;
+
+    d = isa_new(TYPE_I8254);
+    dev = DEVICE(d);
+    qdev_prop_set_uint32(dev, "iobase", iobase);
+    isa_realize_and_unref(d, bus, &error_fatal);
+    qdev_connect_gpio_out(dev, 0, irq_in);
+
+    return d;
+}
+
 static void pit_irq_timer_update(PITChannelState *s, int64_t current_time);
 
 static int pit_get_count(PITChannelState *s)
diff --git a/include/hw/timer/i8254.h b/include/hw/timer/i8254.h
index 8402caad30..a0843cae07 100644
--- a/include/hw/timer/i8254.h
+++ b/include/hw/timer/i8254.h
@@ -45,21 +45,23 @@ OBJECT_DECLARE_TYPE(PITCommonState, PITCommonClass, PIT_COMMON)
 #define TYPE_I8254 "isa-pit"
 #define TYPE_KVM_I8254 "kvm-pit"
 
+/**
+ * Create and realize a I8254 PIT device on the heap.
+ * @bus: the #ISABus to put it on.
+ * @iobase: the base I/O port.
+ * @irq_in: qemu_irq to connect the PIT output IRQ to.
+ *
+ * Create the device state structure, initialize it, put it on the
+ * specified ISA @bus, and drop the reference to it (the device is realized).
+ */
+ISADevice *i8254_pit_create(ISABus *bus, int iobase, qemu_irq irq_in);
+
 static inline ISADevice *i8254_pit_init(ISABus *bus, int base, int isa_irq,
                                         qemu_irq alt_irq)
 {
-    DeviceState *dev;
-    ISADevice *d;
-
-    d = isa_new(TYPE_I8254);
-    dev = DEVICE(d);
-    qdev_prop_set_uint32(dev, "iobase", base);
-    isa_realize_and_unref(d, bus, &error_fatal);
-    qdev_connect_gpio_out(dev, 0,
-                          isa_irq >= 0 ? isa_bus_get_irq(bus, isa_irq)
+    return i8254_pit_create(bus, base, isa_irq >= 0
+                                       ? isa_bus_get_irq(bus, isa_irq)
                                        : alt_irq);
-
-    return d;
 }
 
 static inline ISADevice *kvm_pit_init(ISABus *bus, int base)
-- 
2.38.1


