Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F324C0222
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 20:42:13 +0100 (CET)
Received: from localhost ([::1]:59672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMb36-0000Nd-Jp
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 14:42:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw6-0003JG-RE
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:34:59 -0500
Received: from [2a00:1450:4864:20::536] (port=39445
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMaw4-0006pq-NK
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 14:34:58 -0500
Received: by mail-ed1-x536.google.com with SMTP id u18so39468741edt.6
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 11:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E5v9sJdRuSNl5R0k0qPpSkgaDz6Zboi7ncKx9yCtn1w=;
 b=RWsEdDLtI1krnjdDLB3+U0/cF/iy2v4Ol7f9zRCHOlTB4JXzZBbBBsQQWLag8nZsi0
 RmE/zVbupfQNL6hWe7mEQPkcp8S/V1N37DcS3RwjXVHYvCrvsgA75qXcqatYbao53hyZ
 XHyIo54v6bMQTTFd2jNgVsBKTkScGsDaDLOkuIVhhKHH1Rkr4ivljaCcoL+0o16yzu7G
 KsX+YPMnpI4t8UfqmLy2obDteUKD5yJOzB/EtMphVSQi0+TSbL3Xj2mLutoaSPsAKqit
 lyIu1G/3/LBtS+8lNHhqiZ7g8t42lOoSxHNdT1rPTLzSJdCj/AkGgYe+fodH4MtljGTj
 Ji9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E5v9sJdRuSNl5R0k0qPpSkgaDz6Zboi7ncKx9yCtn1w=;
 b=EXQ+A6bGFUB6nYeJYmqn1rZIGQu7x9L/6ZHBDBDIOFiGIds9gTzlzEqzZekBgkXuM3
 DG6SrmuthlCdJAZl7AtsBgA9S+zBFx6S41wzgpLE8WJA93Rz+RrLUMJFOh2+R/eDZaXz
 z9BFXHuIUzWeRMNLSSGbL8tt6evwINMa7fuG0MitU2TEhs9SCN4YGWeevlAZ0UoAcpNt
 RGBgxouPBQ4nSVNZtnbyyf9oYCf6B/rxnNo5p137/l3JupDnzwQlAlbb2I9WvhG8zBnR
 e8D1WYpTNhnwWrBCwYowrDQeESrIslZaWzkEyZ6Qcio0n7N4SjTLWemUEgoqGn5Cdxvt
 Og0A==
X-Gm-Message-State: AOAM531l0wSIalMmPCBxdPBXfX5EeVqoGRXiscP/GulFE8pCvceeV0jY
 btvyFlAcaId9sEqPKwqGgbC6T1IFERA=
X-Google-Smtp-Source: ABdhPJzCEsulX7hDfP+0i6PBA5KIECYo9Euz4ypV1yNX2UhujsZZCf2MIcXq7BGSzrmaBiq3PB78Wg==
X-Received: by 2002:a05:6402:5248:b0:410:a105:49 with SMTP id
 t8-20020a056402524800b00410a1050049mr28124323edd.214.1645558495328; 
 Tue, 22 Feb 2022 11:34:55 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id i1sm766532edj.84.2022.02.22.11.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 11:34:54 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/22] hw/input/pckbd: QOM'ify IRQ numbers
Date: Tue, 22 Feb 2022 20:34:27 +0100
Message-Id: <20220222193446.156717-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222193446.156717-1-shentey@gmail.com>
References: <20220222193446.156717-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Exposing the IRQ numbers as a QOM properties not only allows them to be
configurable but also to be printed by standard QOM mechanisms. This allows
isabus_dev_print() to be retired eventually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/input/pckbd.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index baba62f357..56c55c5768 100644
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
+    uint32_t kbd_irq;
+    uint32_t mouse_irq;
 };
 
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
@@ -734,8 +737,20 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     ISAKBDState *isa_s = I8042(dev);
     KBDState *s = &isa_s->kbd;
 
-    isa_init_irq(isadev, &s->irq_kbd, 1);
-    isa_init_irq(isadev, &s->irq_mouse, 12);
+    if (isa_s->kbd_irq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"kbd-irq\" is: %d",
+                   ISA_NUM_IRQS - 1);
+        return;
+    }
+
+    if (isa_s->mouse_irq >= ISA_NUM_IRQS) {
+        error_setg(errp, "Maximum value for \"mouse-irq\" is: %d",
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
+    DEFINE_PROP_UINT32("kbd-irq", ISAKBDState, kbd_irq, 1),
+    DEFINE_PROP_UINT32("mouse-irq", ISAKBDState, mouse_irq, 12),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.1


