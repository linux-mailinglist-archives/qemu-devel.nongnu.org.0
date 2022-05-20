Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B352F1E4
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 19:50:47 +0200 (CEST)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6ly-0005Q8-Ot
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 13:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6hV-0002cn-2z; Fri, 20 May 2022 13:46:09 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6hT-0002Dk-Cg; Fri, 20 May 2022 13:46:08 -0400
Received: by mail-ej1-x633.google.com with SMTP id gi33so8448618ejc.3;
 Fri, 20 May 2022 10:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C41Pk0vCO8V+AJMtMv+Bt9tIl1e7vmq6beORcxBkGfQ=;
 b=qlC2t8JX1/MfO36JQyiZe+2cYLC1ZQYAoRXcob0NOcleZY4zRE/ACLmzpT+oUaSH+p
 kMWoUiBeIKlM64EZRi7TZkerV1pS5KMAn45PXSGyVbDsH5VeUng7JEsy55Z1poZPGOnV
 tQI2tt+foxBGtlwmXB+y7G66iNDtvLQiWA/3XAniq9lBUyittvuWH/lw73Qtr9iS9Jjd
 EXwZSRM8RAy3Lkns7qplOHPSY9lJCOWU/5WBQdpc85/rPnMEYuVk9d/uufGxInL1a/T1
 2ptgR7w+ekboOe9r2l2bd5iq9ZVmmsWMBeahEpdat4pHAEur+9TORoCKjlYKtCIzgdPq
 XaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C41Pk0vCO8V+AJMtMv+Bt9tIl1e7vmq6beORcxBkGfQ=;
 b=6womMqKOATmE8hHoLoudTr5FY4xW8nLaTqPDQ5CwIw0ayGDDjV87xG/I6foZXfubYq
 1wrubKn8ngYecP8y4RNtxueYaR21t73UjfpknjZzMCOCjjFiqLWx7YDm0sQtBsWE/SKe
 ur1JnTTNFUC/Gvr9xbsGDgZhj8Y48WPEzbaUahmyfGT9HAvhV54/MiVr+Wapr2N41nx0
 N4UX4kXLV6xY83kSTv6JbwTEZ0bUzjb5HZTKDfjMK7OSDZY6iHzCTL7dEYOzqbOj7vI0
 lWz4DCtbOruUobHoUALaMq9IFX0PUF4KsYo6WNbDfHlg4TshsjpJ7FBH+qly9XPdqdLr
 Y6lA==
X-Gm-Message-State: AOAM530SuFsQvSNyDBcFTRvmKe3kp5HAcL8wTmUwiYOBTBH207Eer9V+
 gli7H6e/49Eqf5FU4UZZoETJ0eT5VWA=
X-Google-Smtp-Source: ABdhPJzGZ1GQlw6tDuKSsth+/K1pRabgo8mIVktr8kP18YZaoNqSHLiMWr+zb3CZ6B2GcRqpWM4V3g==
X-Received: by 2002:a17:906:4786:b0:6fe:a20a:fcd1 with SMTP id
 cw6-20020a170906478600b006fea20afcd1mr5699315ejc.442.1653068765429; 
 Fri, 20 May 2022 10:46:05 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 h22-20020aa7cdd6000000b0042abb914d6asm4410209edw.69.2022.05.20.10.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 10:46:04 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 2/2] rtc/mc146818rtc: QOM'ify io_base offset
Date: Fri, 20 May 2022 19:45:37 +0200
Message-Id: <20220520174537.5827-3-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520174537.5827-1-shentey@gmail.com>
References: <20220520174537.5827-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exposing the io_base offset as a QOM property not only allows it to be
configurable but also to be displayed in HMP:

Before:

(qemu) info qtree
       ...
          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            irq = 8 (0x8)
            lost_tick_policy = "discard"

After:

          dev: mc146818rtc, id ""
            gpio-out "" 1
            base_year = 0 (0x0)
            iobase = 112 (0x70)
            irq = 8 (0x8)
            lost_tick_policy = "discard"

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/microvm-dt.c         | 2 +-
 hw/rtc/mc146818rtc.c         | 7 ++++---
 include/hw/rtc/mc146818rtc.h | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index a5db9e4e5a..39fe425b26 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -209,7 +209,7 @@ static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "motorola,mc146818";
     uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", NULL);
-    hwaddr base = RTC_ISA_BASE;
+    hwaddr base = object_property_get_int(OBJECT(dev), "iobase", NULL);
     hwaddr size = 8;
     char *nodename;
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index f235c2ddbe..484f91b6f8 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -941,7 +941,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     qemu_register_suspend_notifier(&s->suspend_notifier);
 
     memory_region_init_io(&s->io, OBJECT(s), &cmos_ops, s, "rtc", 2);
-    isa_register_ioport(isadev, &s->io, RTC_ISA_BASE);
+    isa_register_ioport(isadev, &s->io, s->io_base);
 
     /* register rtc 0x70 port for coalesced_pio */
     memory_region_set_flush_coalesced(&s->io);
@@ -950,7 +950,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->io, 0, &s->coalesced_io);
     memory_region_add_coalescing(&s->coalesced_io, 0, 1);
 
-    qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
+    qdev_set_legacy_instance_id(dev, s->io_base, 3);
 
     object_property_add_tm(OBJECT(s), "date", rtc_get_date);
 
@@ -983,6 +983,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT32("iobase", RTCState, io_base, 0x70),
     DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
@@ -1028,7 +1029,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
      * does, even though qemu only responds to the first two ports.
      */
     crs = aml_resource_template();
-    aml_append(crs, aml_io(AML_DECODE16, RTC_ISA_BASE, RTC_ISA_BASE,
+    aml_append(crs, aml_io(AML_DECODE16, s->io_base, s->io_base,
                            0x01, 0x08));
     aml_append(crs, aml_irq_no_flags(s->isairq));
 
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
index 33d85753c0..1f7942a9f8 100644
--- a/include/hw/rtc/mc146818rtc.h
+++ b/include/hw/rtc/mc146818rtc.h
@@ -26,6 +26,7 @@ struct RTCState {
     uint8_t cmos_data[128];
     uint8_t cmos_index;
     uint8_t isairq;
+    uint32_t io_base;
     int32_t base_year;
     uint64_t base_rtc;
     uint64_t last_update;
@@ -49,7 +50,6 @@ struct RTCState {
 };
 
 #define RTC_ISA_IRQ 8
-#define RTC_ISA_BASE 0x70
 
 ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
                              qemu_irq intercept_irq);
-- 
2.36.1


