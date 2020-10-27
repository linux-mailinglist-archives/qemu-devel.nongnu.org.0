Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701D29A27C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 03:04:51 +0100 (CET)
Received: from localhost ([::1]:53392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXELy-0005uZ-2G
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 22:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kXEGt-0002Ql-NX
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 21:59:35 -0400
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742]:41029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kXEGq-0000zb-Kq
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 21:59:35 -0400
Received: by mail-qk1-x742.google.com with SMTP id b69so10376692qkg.8
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 18:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=4X/BP8ZUdTbCxIFY7FzIpRhi0kUvXh7zLhkAzEKUY6w=;
 b=KYtq5Kb3gD00njU+dchDyYa3YiSIeSMUFSnoZtSxNMA9mU6vw77gFFhupImfYzlVZ/
 3BbEOhrNhJz0Lb1L/wV1u+0g8yzkIKCoQqNGaaKBJ3MayqL6Nd7jP0hs2ecDEhRnmMVJ
 Ugg/Uu/Z4jsbPjVH7FRD7QIlrQnoaU90CcOcc6sRz+v+zYrhnPtBkxxb9tl2sb0+nQeJ
 Ri+d6jwkNMpejkkHceLg2qqw99bH2nsY4ms82l3k6LtLW8RVLTtdrRqtI5avVwTv8Dz6
 cr08H/f+HTXF4FKhzoPudpGZuaF/uXbq9I2GPqkSA6K6lL/yTGKEqHEIZG9CfI0/TN3H
 cZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=4X/BP8ZUdTbCxIFY7FzIpRhi0kUvXh7zLhkAzEKUY6w=;
 b=EV3116SO7h73i8p0zFoqIROYPakd1/xuWV6FWg1CTPw6eP2IG1UwrfReSiy44K4JK3
 nCse6+3O4BNTDTL2ypjqDZzHJ8C/Ft7ruE7I96bdNKKlPah9tW4xm1KdAppnUQJ5nH/L
 PYr82xIeRuTNqE2QK3V4+02FmQZHS1BFV4UX0Hjh/ikoMGXBJ0Wli3A0dgsyOuxJPPYM
 dwMn66uus5NLdz2ShwJOjtDyowhsYB5i6ehDelLDBAn/+kNhJr5oknPbN2sIW8xea7BV
 EyHa/vNx4I5mkT1nstuWRz0MHRN1yyLyK6aYUg3TUKEzNGMi/IYLiSauUz7kbL2ZMdZ/
 RJcg==
X-Gm-Message-State: AOAM532uviyvSwoklkiPf7quW13w6iEcV1oacHPtUiO2FgusZ9rLZhB+
 340N0+H2klDh6uENxqt17FSSbCcjePek0w==
X-Google-Smtp-Source: ABdhPJzKWKFdTOO28A/MAZVdo4hd4HNUwPDJCIcABuQs6167Oko0ymkTzpurGRj+tV92M7b3+8oxEw==
X-Received: by 2002:a37:b5c4:: with SMTP id e187mr4045368qkf.253.1603763971038; 
 Mon, 26 Oct 2020 18:59:31 -0700 (PDT)
Received: from localhost.localdomain ([142.114.143.244])
 by smtp.googlemail.com with ESMTPSA id 61sm19317qta.19.2020.10.26.18.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 18:59:30 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v8 2/2] hw/arm/sbsa-ref: add SBSA watchdog device
Date: Mon, 26 Oct 2020 21:59:27 -0400
Message-Id: <20201027015927.29495-3-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20201027015927.29495-1-shashi.mallela@linaro.org>
References: <20201027015927.29495-1-shashi.mallela@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::742;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x742.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Included the newly implemented SBSA generic watchdog device model into
SBSA platform

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 01863510d0f5..7d9e180c0db0 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -40,6 +40,7 @@
 #include "hw/qdev-properties.h"
 #include "hw/usb.h"
 #include "hw/char/pl011.h"
+#include "hw/watchdog/sbsa_gwdt.h"
 #include "net/net.h"
 #include "qom/object.h"
 
@@ -64,6 +65,9 @@ enum {
     SBSA_GIC_DIST,
     SBSA_GIC_REDIST,
     SBSA_SECURE_EC,
+    SBSA_GWDT,
+    SBSA_GWDT_REFRESH,
+    SBSA_GWDT_CONTROL,
     SBSA_SMMU,
     SBSA_UART,
     SBSA_RTC,
@@ -104,6 +108,8 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GIC_DIST] =           { 0x40060000, 0x00010000 },
     [SBSA_GIC_REDIST] =         { 0x40080000, 0x04000000 },
     [SBSA_SECURE_EC] =          { 0x50000000, 0x00001000 },
+    [SBSA_GWDT_REFRESH] =       { 0x50010000, 0x00001000 },
+    [SBSA_GWDT_CONTROL] =       { 0x50011000, 0x00001000 },
     [SBSA_UART] =               { 0x60000000, 0x00001000 },
     [SBSA_RTC] =                { 0x60010000, 0x00001000 },
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
@@ -134,6 +140,7 @@ static const int sbsa_ref_irqmap[] = {
     [SBSA_AHCI] = 10,
     [SBSA_EHCI] = 11,
     [SBSA_SMMU] = 12, /* ... to 15 */
+    [SBSA_GWDT] = 16,
 };
 
 static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
@@ -448,6 +455,20 @@ static void create_rtc(const SBSAMachineState *sms)
     sysbus_create_simple("pl031", base, qdev_get_gpio_in(sms->gic, irq));
 }
 
+static void create_wdt(const SBSAMachineState *sms)
+{
+    hwaddr rbase = sbsa_ref_memmap[SBSA_GWDT_REFRESH].base;
+    hwaddr cbase = sbsa_ref_memmap[SBSA_GWDT_CONTROL].base;
+    DeviceState *dev = qdev_new(TYPE_WDT_SBSA);
+    SysBusDevice *s = SYS_BUS_DEVICE(dev);
+    int irq = sbsa_ref_irqmap[SBSA_GWDT];
+
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, rbase);
+    sysbus_mmio_map(s, 1, cbase);
+    sysbus_connect_irq(s, 0, qdev_get_gpio_in(sms->gic, irq));
+}
+
 static DeviceState *gpio_key_dev;
 static void sbsa_ref_powerdown_req(Notifier *n, void *opaque)
 {
@@ -731,6 +752,8 @@ static void sbsa_ref_init(MachineState *machine)
 
     create_rtc(sms);
 
+    create_wdt(sms);
+
     create_gpio(sms);
 
     create_ahci(sms);
-- 
2.18.4


