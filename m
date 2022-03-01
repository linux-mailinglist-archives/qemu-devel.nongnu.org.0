Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE4B4C9863
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:32:30 +0100 (CET)
Received: from localhost ([::1]:38870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPB2j-0004Lr-Bk
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:32:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY7-00026w-N3
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:53 -0500
Received: from [2a00:1450:4864:20::62c] (port=35639
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY4-0005C5-QO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:50 -0500
Received: by mail-ej1-x62c.google.com with SMTP id qk11so34327614ejb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Suz0JdS7tU1ARyZcqsJLrz4VA7zoawrIgt5R/6ni4cc=;
 b=VyhubykBptkuyk4X/LcR7RL45fDUj+P2mPp5xUz+nowAwmJg9dt3EVhbwDpmmKKt3T
 0XJlGug4FRgXlXDn6kkb4+uARKPPX41gYGN5McB8XTg1u/hIFRC3AhiJP4o5gF+u5eUy
 A7V0YJtAmwwoG6podg1njc+EAO2qqRtmeGG/10SVbo5LD4C6hm5uppuEXtzh3Mi+vPaS
 h9NvZG099qiOzgvY1KeMvOiUCOUf99j4shNQtp++wuBJ6DdorKolXaPgdvxOVAqHltSt
 Ha4DxDYC8AlQQfAix5Vgg9gzS903w0yGTwPV+LmY4R5VRrlSitV6niM0eL5QXSMeqrmd
 ahAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Suz0JdS7tU1ARyZcqsJLrz4VA7zoawrIgt5R/6ni4cc=;
 b=CBdUH9gaNM8CbQlxt9Zx0yBzlrxFtGEZaghh9LEzEGL0SSt3YIl2VMgQERMnOSBw5L
 9WV3pnd3Jnx4nCexfJ70QxZ+M9TTtEY71hQOpwaJ4F8Xr/WcYRkmQ9DpQs1CR5zzCQi1
 RVBXIFHQAzJHW2slZyIO2jWpLmyP3v/aF3LQju5Stav72NpPa5OCu5RjWD08yPy1vsd/
 rwoQYMFmu6hQurnjFuGVojrup3Xt+/efar4Ny0PcuXvXiBZp8ztiwy/lvBESmWOVuT2p
 GEshIgeCRb9E0qcT6ekyhN1S4QfcgzGuMwnuy50uHMilNsph4a9Rk6G+gkq8MN+XHB4Y
 kRjQ==
X-Gm-Message-State: AOAM530OSKhdmNYCSgV82mte0q7Y+yCwQJMkBvSlqDbB2je1nLeeJChf
 su8h33NLCEfA+8SYLn91eD6yZnBv5Rs=
X-Google-Smtp-Source: ABdhPJyaP2v1dAVCdI0lk6PdglQS4o4NDHu7ztxtCGZd8Hlb5aanVHZhe6BL6Z7XZYtNY2eCFcJsEA==
X-Received: by 2002:a17:907:7704:b0:6cf:48ac:b4a8 with SMTP id
 kw4-20020a170907770400b006cf48acb4a8mr20017743ejc.305.1646172046632; 
 Tue, 01 Mar 2022 14:00:46 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] hw/rtc/mc146818rtc: QOM'ify IRQ number
Date: Tue,  1 Mar 2022 23:00:31 +0100
Message-Id: <20220301220037.76555-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exposing the IRQ number as a QOM property not only allows it to be
configurable but also to be displayed in HMP:

Before:

(qemu) info qtree
       ...
          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            lost_tick_policy = "discard"

After:

          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            irq = 8 (0x8)
            lost_tick_policy = "discard"

The reason the IRQ number didn's show up before is that this device does not
call isa_init_irq().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c               |  2 +-
 hw/rtc/mc146818rtc.c         | 13 +++++++++++--
 include/hw/rtc/mc146818rtc.h |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0fe7b69bc4..cb291d121c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -197,7 +197,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->rtc), BUS(isa_bus), errp)) {
         return;
     }
-    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
+    isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, s->rtc.isairq);
 
     piix4_dev = dev;
 }
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index ac9a60c90e..f235c2ddbe 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -912,6 +912,11 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
         s->base_year = 0;
     }
 
+    if (s->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %u", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     rtc_set_date_from_host(isadev);
 
     switch (s->lost_tick_policy) {
@@ -957,15 +962,17 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 {
     DeviceState *dev;
     ISADevice *isadev;
+    RTCState *s;
 
     isadev = isa_new(TYPE_MC146818_RTC);
     dev = DEVICE(isadev);
+    s = MC146818_RTC(isadev);
     qdev_prop_set_int32(dev, "base_year", base_year);
     isa_realize_and_unref(isadev, bus, &error_fatal);
     if (intercept_irq) {
         qdev_connect_gpio_out(dev, 0, intercept_irq);
     } else {
-        isa_connect_gpio_out(isadev, 0, RTC_ISA_IRQ);
+        isa_connect_gpio_out(isadev, 0, s->isairq);
     }
 
     object_property_add_alias(qdev_get_machine(), "rtc-time", OBJECT(isadev),
@@ -976,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
     DEFINE_PROP_END_OF_LIST(),
@@ -1011,6 +1019,7 @@ static void rtc_reset_hold(Object *obj)
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 {
+    RTCState *s = MC146818_RTC(isadev);
     Aml *dev;
     Aml *crs;
 
@@ -1021,7 +1030,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
     crs = aml_resource_template();
     aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
                            0x01, 0x08));
-    aml_append(crs, aml_irq_no_flags(RTC_ISA_IRQ));
+    aml_append(crs, aml_irq_no_flags(s->isairq));
 
     dev = aml_device("RTC");
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0B00")));
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 5b45b22924..deef93f89a 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -25,6 +25,7 @@ struct RTCState {
     MemoryRegion coalesced_io;
     uint8_t cmos_data[128];
     uint8_t cmos_index;
+    uint8_t isairq;
     int32_t base_year;
     uint64_t base_rtc;
     uint64_t last_update;
-- 
2.35.1


