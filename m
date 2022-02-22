Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B24C004D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:44:21 +0100 (CET)
Received: from localhost ([::1]:59092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZD3-0003dL-06
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:44:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7S-0003PE-SK
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:34 -0500
Received: from [2a00:1450:4864:20::532] (port=36581
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7P-0002kl-0t
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:34 -0500
Received: by mail-ed1-x532.google.com with SMTP id cm8so29133075edb.3
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjU7t4xEBQGWyx6EMFWnMD35gczVylJjm0oYPCK2X/g=;
 b=FFhvUXT2KfPMwciuDPaKYkeMANhqhAzF4LnYk5NCC7H9i8koIJrgmT1A6H4mbocP2u
 UmrUoYMuV9P4R3BJKtytjy8qV3IBwhSFboRmkcvXJXlp81nzJJY/pQo3hGKBqNH3Cocp
 oOGIpNEmrorc1kzB5GKlwLyyuNV7/cdiZXomaVqA9ZLO4twPiuw+My9Omf5t/kWBCGPy
 1O6Flu9JsR2fG8SYSMNKD8T6h4imRav0KgL3iJ8upOpmv9ODJx98GxzRHTqu5qO2ZwAN
 8Glp+e1wb34Bqc2B4QkjlOAesvHjDeWxBu0koPPGCjbJ2oTEs09YsAad53/yqv5qUfmY
 lQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IjU7t4xEBQGWyx6EMFWnMD35gczVylJjm0oYPCK2X/g=;
 b=Zs34YraM7MaLO+kByjosENW8K1rsbd39TIxPP8mVid3aODpAxsUek1n8CzGceIfGS/
 dSfbigUWxmLGxQOm/YVeJoMtdnHZzVr6oSVD4vmBltX33HK9xuTjXzmMe1A/3DmVpsr/
 2kJMA91aa7OKs2lgTVUUCcQIMIfiv3e2vMyIVKYCnS33ZuORZJ5DtvP2KZFae/ITdCmH
 rOkGfln04GPlKS9IKWhO1SzYYXvirsfOGiHP8/bA3v7LpRcGZ2daziZw/KNzs1BMN9qu
 Lr500mqQq9t+WGszso/GWStIQPmOeOgbZXqnEyiwLkP7eO4gOYyiaMBpuHOL2b+t8R/W
 JedA==
X-Gm-Message-State: AOAM533adhRLkYOzOfTr/mo9QkKwhNMSBhKlmhdvaXovDmNXLH79R7jr
 n2BYQLDiscvqoIQPUmdyWytgjASSyzY=
X-Google-Smtp-Source: ABdhPJwaXIqK/0li13JVSVwwFcLzyqi6xebd5BwvbaN00l5zZoTEzXmnxTvC09d/R5w1qvaI1Fk11A==
X-Received: by 2002:a05:6402:2546:b0:412:d0eb:2a4a with SMTP id
 l6-20020a056402254600b00412d0eb2a4amr21100290edb.306.1645551509416; 
 Tue, 22 Feb 2022 09:38:29 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/22] hw/rtc/mc146818rtc: QOM'ify IRQ number
Date: Tue, 22 Feb 2022 18:37:58 +0100
Message-Id: <20220222173819.76568-2-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
 hw/isa/piix4.c               | 2 +-
 hw/rtc/mc146818rtc.c         | 8 ++++++--
 include/hw/rtc/mc146818rtc.h | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

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
index e61a0cced4..f300f40257 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -956,15 +956,17 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
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
@@ -975,6 +977,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT32("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
     DEFINE_PROP_END_OF_LIST(),
@@ -1010,6 +1013,7 @@ static void rtc_reset_hold(Object *obj)
 
 static void rtc_build_aml(ISADevice *isadev, Aml *scope)
 {
+    RTCState *s = MC146818_RTC(isadev);
     Aml *dev;
     Aml *crs;
 
@@ -1020,7 +1024,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
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


