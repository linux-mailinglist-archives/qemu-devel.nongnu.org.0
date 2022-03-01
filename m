Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F044C985C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 23:28:01 +0100 (CET)
Received: from localhost ([::1]:57580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPAyO-0006Ny-RF
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 17:28:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY9-00027p-JR
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:53 -0500
Received: from [2a00:1450:4864:20::62a] (port=40701
 helo=mail-ej1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nPAY7-0005CN-CO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 17:00:52 -0500
Received: by mail-ej1-x62a.google.com with SMTP id p15so34261776ejc.7
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 14:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s6MRmq/cx0dEgNoBOUQNwTLmtO70h12HaU/bX/Su1iA=;
 b=E802O9IU9LCmGQ/lk59dp5MN5R0g3qfqW055Qrzh7IxWl2JVeRTpiChp6yeBUWCsfe
 jE5CckJVQpuzU7qfvi/2ylJO1pSv17tQt9XdwMi0gYG0mFqjqB9SdkvTZCHSJg/N2ns0
 vryoFudOY7nDMUPx4pP59Lt/rs1PrvgIeZKAr3VZ0E6YWPA0nk2n1ZFkugs3f468KWQm
 ppUdZ5eXlwrQOePW6685qx+LVTEdjyx+SjEIt5+9fPkom6I4wqF29Lk4A9vmnQLEAoax
 X4UJhChnBevUBp1WP34qVwLRoyKSLibNd5Z08y1KKqMOjh3Lacms3Kd957MRonVRTLQT
 H7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s6MRmq/cx0dEgNoBOUQNwTLmtO70h12HaU/bX/Su1iA=;
 b=MZZex330EWuJrGEXILt2/3NKuKOvvA60kLtEtVBJ8X/MCi05HAoYNULjGhtt0/XMQ9
 PYxE+xXmP1H4b0kruTGfliPAMVPM/sYhuqHfOd6gLr4iA6MpfgB7TwWb92OE6LH1ggm4
 vYUrNOCZUlUSfWP4LZY+6NNlyood11tClDAMu+RsOxAdRXuVe3j1JGC/wPs/6UFAHmzT
 nNJwnsmFEcpHjoM/yqm/3AhDr4s/61MoRnkqf4zUeyULUdCAd1bjoTZ5+SeX3LXcFkbc
 e1YUvX78ZhtETs9v8asomyHkMCojv1dfSV2Ax5TkWkdVj8DnbX5XVaWty1HuoIgV8wrr
 o3ig==
X-Gm-Message-State: AOAM530dRFxKxqIKJOU7TWS9/BgDen+bnYPY0wUjfJdOrsh3IapaEx2h
 sls2w2ZEDVbGajHahii5zRpdtFg7EQU=
X-Google-Smtp-Source: ABdhPJxsxWeeNfOSj7aPI0hV0XsKF95FT0HObf3UFxdMbVBOyc7CFHfDqFnqww0T59QLnA231JiFng==
X-Received: by 2002:a17:906:5a6e:b0:6d0:afaa:6ce9 with SMTP id
 my46-20020a1709065a6e00b006d0afaa6ce9mr20729014ejc.72.1646172048608; 
 Tue, 01 Mar 2022 14:00:48 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-055-004-046.78.55.pool.telefonica.de. [78.55.4.46])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b00415b38e920bsm182731edc.95.2022.03.01.14.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 14:00:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/7] hw/input/pckbd: QOM'ify IRQ numbers
Date: Tue,  1 Mar 2022 23:00:33 +0100
Message-Id: <20220301220037.76555-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301220037.76555-1-shentey@gmail.com>
References: <20220301220037.76555-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exposing the IRQ numbers as QOM properties not only allows them to be
configurable but also to be printed by standard QOM mechanisms. This
allows isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/input/pckbd.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index baba62f357..eb77e12f6f 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -26,6 +26,7 @@
 #include "qemu/error-report.h"
 #include "qemu/log.h"
 #include "qemu/timer.h"
+#include "qapi/error.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/aml-build.h"
@@ -671,6 +672,8 @@ struct ISAKBDState {
     KBDState kbd;
     bool kbd_throttle;
     MemoryRegion io[2];
+    uint8_t kbd_irq;
+    uint8_t mouse_irq;
 };
 
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
@@ -734,8 +737,20 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     ISAKBDState *isa_s = I8042(dev);
     KBDState *s = &isa_s->kbd;
 
-    isa_init_irq(isadev, &s->irq_kbd, 1);
-    isa_init_irq(isadev, &s->irq_mouse, 12);
+    if (isa_s->kbd_irq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"kbd-irq\" is: %u",
+                   ISA_NUM_IRQS - 1);
+        return;
+    }
+
+    if (isa_s->mouse_irq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"mouse-irq\" is: %u",
+                   ISA_NUM_IRQS - 1);
+        return;
+    }
+
+    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
+    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
@@ -754,6 +769,7 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
 
 static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 {
+    ISAKBDState *isa_s = I8042(isadev);
     Aml *kbd;
     Aml *mou;
     Aml *crs;
@@ -761,7 +777,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     crs = aml_resource_template();
     aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
     aml_append(crs, aml_io(AML_DECODE16, 0x0064, 0x0064, 0x01, 0x01));
-    aml_append(crs, aml_irq_no_flags(1));
+    aml_append(crs, aml_irq_no_flags(isa_s->kbd_irq));
 
     kbd = aml_device("KBD");
     aml_append(kbd, aml_name_decl("_HID", aml_eisaid("PNP0303")));
@@ -769,7 +785,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(kbd, aml_name_decl("_CRS", crs));
 
     crs = aml_resource_template();
-    aml_append(crs, aml_irq_no_flags(12));
+    aml_append(crs, aml_irq_no_flags(isa_s->mouse_irq));
 
     mou = aml_device("MOU");
     aml_append(mou, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
@@ -783,6 +799,8 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 static Property i8042_properties[] = {
     DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd.extended_state, true),
     DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
+    DEFINE_PROP_UINT8("kbd-irq", ISAKBDState, kbd_irq, 1),
+    DEFINE_PROP_UINT8("mouse-irq", ISAKBDState, mouse_irq, 12),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.1


