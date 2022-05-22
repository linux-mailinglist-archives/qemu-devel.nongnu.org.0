Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0091A5305EA
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 22:46:22 +0200 (CEST)
Received: from localhost ([::1]:49890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nssSy-0007Sm-TH
	for lists+qemu-devel@lfdr.de; Sun, 22 May 2022 16:46:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssR3-0004lX-0V; Sun, 22 May 2022 16:44:21 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nssR1-0008QS-C2; Sun, 22 May 2022 16:44:20 -0400
Received: by mail-ej1-x630.google.com with SMTP id gh17so11881525ejc.6;
 Sun, 22 May 2022 13:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLmyp2v6u2KnfE60H0vn5WW8/V+q8TYyhHAblXSEP7o=;
 b=N7hRgUaCgoi6bpss3zaeIwlWMdAbSfeKEzM16DAAOq/idUOgntWDrIsgCAVNZt3FKZ
 onaKPTwF/OHzCM1lBSk1mMDfHg4852UXZU9g/t48JlzqD4s3zV3wKYSwJw2jlG7R6oSE
 lVHRBbEnsyWT9I46OD9jquWrhEdwhyMtBteSdy7MrZZfLXcpNqlBvBdVuDXpm/0QnuQ2
 u3aREr18KlJTapMrx11vAuhk1+s36wXphw5ugXmpM4JIF9Ed/1Pw6d7Eztd74uPwJr4u
 LyWfYNR3wYJhEw7HjNfhEnY5KDNmU0/v8fNJiZTix10aC6QPQh49up2GBW/kVYYUgGDR
 4nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLmyp2v6u2KnfE60H0vn5WW8/V+q8TYyhHAblXSEP7o=;
 b=x3dWWImcKw8M7g+xf+/dqp1pIQCA3/hU0gz4c/dEPduLkGDHDJHP6OliOc7PykSgfB
 4vaUUSVwT11W8a07jmaZ2+XewUugD0u8eSQ+kuSGclqGDT4tZQhBT7O0GEeyQNUKUVB1
 cAnS13hgWhZdZM30SrSq3EwE5+9OosHxuFJvbWpBz1G6WIuiBG16U5lKVx7G/HEYZ2eq
 i1/8OzeKbrO8oZNWhqrpSaXwSuhVhh8wql1J418sTqkoB9iX/CoWhCGIZGQ3yiAQCnUG
 RivOy+H7s5dy+Bbv9rh+NHS0/jgEtc72T6oVDp8FYT4q2Xuhzyupsqbp4SrgqFf0yWZU
 pQ8w==
X-Gm-Message-State: AOAM533rTbv2FnH/YPahSrrT4mqJOFhQyAIc5iU4U0f5U6RoVShcLCkJ
 D6bgCcvHgME3ychOmB7WniScxxjq8yA=
X-Google-Smtp-Source: ABdhPJyZ+h2Ed9VfeM3UpbsGGrW5uKV4WYvSk4BOR/lGRvr1RD7K3p5/88aiPlGWKzFTcy75zaXA8Q==
X-Received: by 2002:a17:907:6d15:b0:6fd:d985:889b with SMTP id
 sa21-20020a1709076d1500b006fdd985889bmr17386832ejc.753.1653252257075; 
 Sun, 22 May 2022 13:44:17 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-078-054-075-232.78.54.pool.telefonica.de. [78.54.75.232])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a1709063f4800b006f4c82c2b12sm5533968ejj.19.2022.05.22.13.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 13:44:16 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH v2 3/3] rtc/mc146818rtc: QOM'ify io_base offset
Date: Sun, 22 May 2022 22:43:47 +0200
Message-Id: <20220522204347.10438-4-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220522204347.10438-1-shentey@gmail.com>
References: <20220522204347.10438-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/i386/microvm-dt.c         | 2 +-
 hw/rtc/mc146818rtc.c         | 9 ++++++---
 include/hw/rtc/mc146818rtc.h | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/i386/microvm-dt.c b/hw/i386/microvm-dt.c
index 287818c641..b3049e4f9f 100644
--- a/hw/i386/microvm-dt.c
+++ b/hw/i386/microvm-dt.c
@@ -210,7 +210,7 @@ static void dt_add_isa_rtc(MicrovmMachineState *mms, ISADevice *dev)
 {
     const char compat[] = "motorola,mc146818";
     uint32_t irq = object_property_get_uint(OBJECT(dev), "irq", &error_fatal);
-    hwaddr base = RTC_ISA_BASE;
+    hwaddr base = object_property_get_uint(OBJECT(dev), "iobase", &error_fatal);
     hwaddr size = 8;
     char *nodename;
 
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index f235c2ddbe..5a5dd21a3c 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -74,6 +74,8 @@
 #define RTC_CLOCK_RATE            32768
 #define UIP_HOLD_LENGTH           (8 * NANOSECONDS_PER_SECOND / 32768)
 
+#define RTC_ISA_BASE 0x70
+
 static void rtc_set_time(RTCState *s);
 static void rtc_update_time(RTCState *s);
 static void rtc_set_cmos(RTCState *s, const struct tm *tm);
@@ -941,7 +943,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     qemu_register_suspend_notifier(&s->suspend_notifier);
 
     memory_region_init_io(&s->io, OBJECT(s), &cmos_ops, s, "rtc", 2);
-    isa_register_ioport(isadev, &s->io, RTC_ISA_BASE);
+    isa_register_ioport(isadev, &s->io, s->io_base);
 
     /* register rtc 0x70 port for coalesced_pio */
     memory_region_set_flush_coalesced(&s->io);
@@ -950,7 +952,7 @@ static void rtc_realizefn(DeviceState *dev, Error **errp)
     memory_region_add_subregion(&s->io, 0, &s->coalesced_io);
     memory_region_add_coalescing(&s->coalesced_io, 0, 1);
 
-    qdev_set_legacy_instance_id(dev, RTC_ISA_BASE, 3);
+    qdev_set_legacy_instance_id(dev, s->io_base, 3);
 
     object_property_add_tm(OBJECT(s), "date", rtc_get_date);
 
@@ -983,6 +985,7 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year, qemu_irq intercept_irq)
 
 static Property mc146818rtc_properties[] = {
     DEFINE_PROP_INT32("base_year", RTCState, base_year, 1980),
+    DEFINE_PROP_UINT32("iobase", RTCState, io_base, RTC_ISA_BASE),
     DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
     DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
                                lost_tick_policy, LOST_TICK_POLICY_DISCARD),
@@ -1028,7 +1031,7 @@ static void rtc_build_aml(ISADevice *isadev, Aml *scope)
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


