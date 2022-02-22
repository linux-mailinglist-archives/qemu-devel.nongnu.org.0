Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B44C021F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:40:47 +0100 (CET)
Received: from localhost ([::1]:56196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb1h-0006NZ-DD
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:40:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw5-0003JE-9i
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:34:59 -0500
Received: from [2a00:1450:4864:20::52e] (port=35520
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw3-0006pb-69
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:34:56 -0500
Received: by mail-ed1-x52e.google.com with SMTP id bq11so18137335edb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j83vZx9j76L8zhdtWP/y92HPoOpjGy8BlkZclh4n+Cc=;
 b=coCAh/e3x0xamJYI3tAfmUnQcj8zuqxqT6QTJBB1H8NuDCbKD6jFqooIoEG22ssRtn
 uQNcVB3sNBGf6tKXevAsnWgi8RTdWzU1ERclA7RhvL+q6elX+HZtZf/FZk2DLVGkcCZF
 d7pkbTaa+dVNpxvmR4rVCqIKARyyZOlO7QH66UvHvCAgUbm5l+aFqI/0N8tZ7zEPesO5
 VCSN7/y4YBGbCKs24kdyqstWXlcyvlspGFq4oIR5eZxgJAfqHmP1eiQf2dHW+C+zkE5p
 W/1zBHzMiA03JAff0bURs+WFGUy70ax6+NV+fQcr3qnY4AvWmQuWmetYSDuSQ3HTGw23
 y2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j83vZx9j76L8zhdtWP/y92HPoOpjGy8BlkZclh4n+Cc=;
 b=ZUz5EU0luRtzMfSlScnRV9+ezhKuGbySo4br8OHmBC91chOlMT2taNLTyEe0XaJDH5
 FOLlkv86EcwtZ1ztbG2NiE9R2ybUJDPKeYXqu67OAGuyHOF4d0uTug8/Rl/lP9UWWChl
 /Cn8OgApTrgTLHeWsJmhI2Be+UErcbfnDIgyn0dS2GdsZFn1xhA12TeS3diDB3EBJtvj
 9lOawsDHXvNqpRNr2jcET7pPKvm9QiwcNSRi8wuUpukkqEAGfZjId2Epr+IMLPm77Bqw
 a6AJchBW8mYB33Zi4AnxPAJt5aPDfiEgPo4udENySqyrycQ6ghNTpNMv4RO0ROvgSOaW
 R13g==
X-Gm-Message-State: AOAM530mSFrsqJ8VuAwJEw+oDjgaDsuV4Whom1mLv/bUWAXDuGoSpM4C
 7t1sZud+q9USOkAssmgelc0qeltKlqY=
X-Google-Smtp-Source: ABdhPJz0r7NIVJ8foX/tIm2sBZ9Wu+Oxs1ZOgTj8uVa8rxbvQcw19Brw/2QyLLIj81MpPN8I7m896Q==
X-Received: by 2002:a05:6402:1e8b:b0:410:6085:4a4a with SMTP id
 f11-20020a0564021e8b00b0041060854a4amr28770655edf.452.1645558493515; 
 Tue, 22 Feb 2022 11:34:53 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:53 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/22] hw/rtc/mc146818rtc: QOM'ify IRQ number
Date: Tue, 22 Feb 2022 20:34:25 +0100
Message-Id: <20220222193446.156717-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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
configurable but also to be printed by standard QOM mechanisms. This allows
isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
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
index e61a0cced4..eda9af65c4 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -911,6 +911,11 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
         s->base_year = 0;
     }
 
+    if (s->isairq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"irq\" is: %d", ISA_NUM_IRQS - 1);
+        return;
+    }
+
     rtc_set_date_from_host(isadev);
 
     switch (s->lost_tick_policy) {
@@ -956,15 +961,17 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
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
@@ -975,6 +982,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT32("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
     DEFINE_PROP_END_OF_LIST(),
@@ -1010,6 +1018,7 @@ static void rtc_reset_hold(Object *obj)
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 {
+    RTCState *s = MC146818_RTC(isadev);
     Aml *dev;
     Aml *crs;
 
@@ -1020,7 +1029,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
     crs = aml_resource_template();
     aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
                            0x01, 0x08));
-    aml_append(crs, aml_irq_no_flags(RTC_ISA_IRQ));
+    aml_append(crs, aml_irq_no_flags(s->isairq));
 
     dev = aml_device("RTC");
     aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0B00")));
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 5b45b22924..c7586589ad 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -26,6 +26,7 @@ struct RTCState {
     uint8_t cmos_data[128];
     uint8_t cmos_index;
     int32_t base_year;
+    uint32_t isairq;
     uint64_t base_rtc;
     uint64_t last_update;
     int64_t offset;
-- 
2.35.1


