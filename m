Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280724D00B4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 15:06:54 +0100 (CET)
Received: from localhost ([::1]:52384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRE0j-0006Vg-7y
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 09:06:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDg1-0005xz-TY
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:30 -0500
Received: from [2607:f8b0:4864:20::430] (port=41938
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDfx-0007E1-Qn
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:45:27 -0500
Received: by mail-pf1-x430.google.com with SMTP id p8so13806772pfh.8
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iq/phndxmXP1fEuqNLg+aeoAruQ+H73qFUXnPncUnqs=;
 b=SiXh9U2H27ehE4Dvu3zsK7bwbOIAwj+f2EUtwRk94l62s+drIqtrAqaeIZQccDO1T0
 VL8Uy2OmlZhOxg7aMxSNP9avGnvC8Wmyq5ZRoJcDo6yPjkWL3l8zUXhwf3mG2nVt1Vtr
 JgxSSQLnsM2s++QntG605Yj5BOPutfuVHWIuFQQhSmtJADYWvTzLmPS11DRNyRr4Gb07
 K9y7lpb5DbV4KIjxKUe70PYnf5O9K5yfwCeidYrapkBrriYleeCQIKtJRFPpOcRZP3pi
 OtXlxvs4lMGoaS4Sd8pLyZwZEVwaZUxiGUZUBjXT3OmGnsg4+HI4Pq0MPVPVayd+XEy/
 8cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iq/phndxmXP1fEuqNLg+aeoAruQ+H73qFUXnPncUnqs=;
 b=BjfjzYHdQzAnRMumiuaMt14lGu6PmThzVh3UcRUZsCvmQM7kIBOu6DrZQ1VfEoQ3+m
 nkthOO201jS38oa7EkfR04rTKHaX/9w9F43+EyIquf+6HG0P0sMNLt9QqQP49kbsTrIw
 d8um5etVo9DO6r/UTRYTWLX7TleK+ASyix+c9/d1n7PSjseoiSjXW2DYLKrXsVhA7U5H
 F6hx0fFn4nJJjKqlVNUsnj3dasupN86HTFlFpUykID2P40YyVOttaq0IgdgTEHy5s1rs
 Gl3aFoH/oavW2vJzSS2ZoMTMjBiEa3+Db3P5BNEz7fqmppipkyjQ4ZiZRwt3KsmJ36re
 p89A==
X-Gm-Message-State: AOAM531vUHBjq853ssDlzbyFlobV60BlGpkxrm4uO/k/LieJ19BzLGZr
 9gXbvgQ7P0LVwKxIVqvvYbg=
X-Google-Smtp-Source: ABdhPJx5KGF7t0432TRfHGluTnbHsimr8gCtUjATjIh4cXCwdmRcgUkv18FB4va7dlX0o5wwVGut8w==
X-Received: by 2002:a05:6a00:a8f:b0:4e1:2619:11a2 with SMTP id
 b15-20020a056a000a8f00b004e1261911a2mr12817164pfl.53.1646660723979; 
 Mon, 07 Mar 2022 05:45:23 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u37-20020a056a0009a500b004e1414d69besm16489254pfg.151.2022.03.07.05.45.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:45:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 10/13] hw/input/pckbd: QOM'ify IRQ numbers
Date: Mon,  7 Mar 2022 14:43:50 +0100
Message-Id: <20220307134353.1950-11-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Exposing the IRQ numbers as QOM properties not only allows them to be
configurable but also to be printed by standard QOM mechanisms. This
allows isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220301220037.76555-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
2.34.1


