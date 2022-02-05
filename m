Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F644AAAC8
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 19:05:17 +0100 (CET)
Received: from localhost ([::1]:36082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGPQs-0000rY-Ak
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 13:05:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nGPLr-00071z-Ef
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 12:59:59 -0500
Received: from [2a00:1450:4864:20::530] (port=42841
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nGPLp-0000yd-DB
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 12:59:58 -0500
Received: by mail-ed1-x530.google.com with SMTP id cf2so4458487edb.9
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 09:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3MrjCZrAbDfZ1Y9hI3wwet8JsGPnh1sGD0GDaFDA+s=;
 b=qC3OprRv9HzJ1HakaiwMPzjqPLzKVude3EFTKhSf0Y4v/W89pjiaR1h8rXJGTEudKW
 OoKGj2uUUPg/HA5e+izozuv/diyAFB6TS4Id6+zifyBAgZXEHSL/RjH1xfsIDNH5efc/
 eTRs0kCbrxLTRpHNELdciRkj4JXA4vHSvBjXJyHXveWvuOspkO+7ixHty5caVhPvzj0u
 r2pClvAAKt5IGKk41M/rE5HyMqhvwAgs1D+9nN+JYPK0mCc1NErDCDyBK0MpsIxLlVHs
 DZOPzhWHlvC+GkjCCgg9GHKPujcZWm1SUOqd0v3YQcByyv3v4YpyfJA0kqw4J8/fxpcp
 I17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3MrjCZrAbDfZ1Y9hI3wwet8JsGPnh1sGD0GDaFDA+s=;
 b=1JVT0EKIoJBzHvqDzJrRiN5SO8TsYY2jn6nkHazI4VpXjdY6rAr0UB3PcW6xBQzyUh
 qppQPv2BUGLgjG/uo3d3H0pJcmdFLK09G0rngfz01witXEfXrRTSiP0GJiXYNQb9Y6sF
 m4O/8ijUKWxbcvnik4Prm8WWYClop675aX26d5Pz2lkqShybCb+vhrVEDSR9sMi3Q4hc
 fqchqUqdKaHpo48+GCnhxFoZ0c/rnH2X602/Tfcg6mOcP/DMq48WHKo/CMozgOE0hEWm
 972oxeMt6TmufaYTQ72qUGP9GKmrhE1OV4ZmHnHFbcdb8nzJ/Ocnmnk6bVMlvF9nBxDL
 DI9w==
X-Gm-Message-State: AOAM531xK8Os9YRrSoP5nND765lwSb7daq/H+QefgbRPYLLfrR3RfXot
 1FRjmOoaMDfNoF71y/+RLkwbFYOhHg/usw==
X-Google-Smtp-Source: ABdhPJzkAVX7ie8So//ttwlUACxak0+jiHsf5i17BED0p9lfK1GVcH+okvYTKuY7U0pQmCX7IUYWTA==
X-Received: by 2002:aa7:d993:: with SMTP id u19mr519657eds.293.1644083996018; 
 Sat, 05 Feb 2022 09:59:56 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-230-134.89.12.pool.telefonica.de. [89.12.230.134])
 by smtp.gmail.com with ESMTPSA id e2sm1820660ejr.210.2022.02.05.09.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 09:59:55 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] isa/piix4: Resolve RTCState attribute
Date: Sat,  5 Feb 2022 18:59:12 +0100
Message-Id: <20220205175913.31738-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220205175913.31738-1-shentey@gmail.com>
References: <20220205175913.31738-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assuming that mc146818_rtc_init() is "syntactic sugar" for code that could
be converted into configuration in the future, this patch is a step towards
this future by freeing piix4 to care about the inner details of mc146818.

Furthermore, by reusing mc146818_rtc_init(), piix4's code becomes more
homogenious to other code using the mc146818. So piix4 can be refactored in
the same way as code already using mc146818_rtc_init().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0fe7b69bc4..08b4262467 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -46,7 +46,6 @@ struct PIIX4State {
     qemu_irq cpu_intr;
     qemu_irq *isa;
 
-    RTCState rtc;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
     uint8_t rcr;
@@ -193,22 +192,11 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     i8257_dma_init(isa_bus, 0);
 
     /* RTC */
-    qdev_prop_set_int32(DEVICE(&s->rtc), "base_year", 2000);
-    if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
-        return;
-    }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
+    mc146818_rtc_init(isa_bus, 2000, NULL);
 
     piix4_dev = dev;
 }
 
-static void piix4_init(Object *obj)
-{
-    PIIX4State *s = PIIX4_PCI_DEVICE(obj);
-
-    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
-}
-
 static void piix4_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -233,7 +221,6 @@ static const TypeInfo piix4_info = {
     .name          = TYPE_PIIX4_PCI_DEVICE,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PIIX4State),
-    .instance_init = piix4_init,
     .class_init    = piix4_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.35.1


