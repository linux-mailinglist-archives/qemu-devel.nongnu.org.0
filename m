Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F6E29AC80
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 13:52:05 +0100 (CET)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXOSK-0007pd-8l
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 08:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNQB-0002Bd-4F
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:47 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kXNQ6-0004tJ-1g
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 07:45:46 -0400
Received: by mail-wr1-x441.google.com with SMTP id n6so1492145wrm.13
 for <qemu-devel@nongnu.org>; Tue, 27 Oct 2020 04:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IrtwOjo+ScAN7/jBp9YH0zIsF12qxcBPswSHTU5/93I=;
 b=vzsYi6dQHLvXx4JtS/8sM76ytz5hRu9d7x6Jc1W87VpguSqZJmOIc54/grybbrdzLC
 h1fdD9yY2WQ+uhC1BwZSLiTX/uw/cxp+tFRzoOrfDi518u7zmq01zq4paklu6mXDQdzy
 q9o9qmHTVBx4QuMecCEk2Xrywe981ACOez76PF57mbyfZG3RfLE2evU2Xx+2plO+6U9J
 aBsUVAqdeEyLjsGoMo5axjRJwmuuV7QStacWypNs8SgVoB98V9BNeQu6zysvZVFAGbbp
 +lpPiDx7jMdjiA61CCzM5B2RjDYj+bjMWGDSSU78sTI7phOtZzi5stKGZh27ZZsZ9eed
 t4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IrtwOjo+ScAN7/jBp9YH0zIsF12qxcBPswSHTU5/93I=;
 b=I6reKuwwMjcUOJLIO7cgsi735IfNwZI3WFLt4JD/J5hWYyzVDbTCKOeYieH6VkbX7/
 Gc46CpBjsaBm7UK5hULMAZwVseBhRizoneZP+ElGCyilRKfIus5njiF0bfBlgGh9xDww
 QMtMrOV+MA987AUIvy4lURicpN5cJ8CZq0WHgqe8FrOLlq4lbKnEOn3ObuGZwCw8q8cL
 4KiuCwmI3F+6qdciP0NRBQ+FvVYWB2s01q5s3f9nqWuPv4LTHDt0LXd6ApJ7ySYFRNCf
 lG7bqtgEyfnvqjmiJdUf12nxBBwYi+ow8Ok1d8TJFrsJ7SjSL1EOlOaxs69/kqgainuP
 49Qg==
X-Gm-Message-State: AOAM530jPqxJP1dBgBstj8SsYooz0hkIq3SNQEGjy5yDMY3kp6yn1Z+h
 MHL1vhVt1T1zVrI8OfTUNhY41raWiyMegA==
X-Google-Smtp-Source: ABdhPJzfeph0G7XqKpWzsg6Zyqx/Nz4Ivjz7I6aV5aSxEcfw+1xmNeN8l8DM2AZaFlH7jh/BjTbA3Q==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr2361611wrt.221.1603799139171; 
 Tue, 27 Oct 2020 04:45:39 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 32sm1712203wro.31.2020.10.27.04.45.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 04:45:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/48] hw/arm/sbsa-ref: add SBSA watchdog device
Date: Tue, 27 Oct 2020 11:44:36 +0000
Message-Id: <20201027114438.17662-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201027114438.17662-1-peter.maydell@linaro.org>
References: <20201027114438.17662-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Shashi Mallela <shashi.mallela@linaro.org>

Included the newly implemented SBSA generic watchdog device model into
SBSA platform

Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20201027015927.29495-3-shashi.mallela@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/sbsa-ref.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 01863510d0f..7d9e180c0db 100644
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
2.20.1


