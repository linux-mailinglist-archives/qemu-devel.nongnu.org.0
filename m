Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DE74C0042
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:41:17 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZA4-0006CO-Db
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:41:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7S-0003N0-2n
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:34 -0500
Received: from [2a00:1450:4864:20::536] (port=37882
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7Q-0002l1-Hz
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:33 -0500
Received: by mail-ed1-x536.google.com with SMTP id q17so38939772edd.4
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLKgVUqBRhF999JiE5cE0vH6qtNFqrzfmojjNGgYENI=;
 b=PZhLB7jARlosefo7OAuJOyiSmVFEeji6bSMrvdFttg4nr6DUWiiu5m6KSE6cK6KTBq
 ooN5bmndNWITEYHLUqtDRPGIWnaBo55h8Q2Yj0VJLt5htfHNuHTCIZaJa+1yCjHGb+MW
 ArRLSD/LY6lZ3bvLHQk7F1NDgP1p7b1WKv5QQT+IDqx2juJzJ0Y6WZmLGJiy+iDpcD5v
 FNAP/aBbeBGzSi/jOd8I+eJ471asXqLKAodlF9t9Vd+YKjxnT8Hiwljm9G/TBJUMXkbx
 GH8IJn7tyXz0eDt3GHp5i37XSbKFgdbkPVCO2wI5feTpEOH1XNG3NEHgkIq9MmB4vTBV
 FNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLKgVUqBRhF999JiE5cE0vH6qtNFqrzfmojjNGgYENI=;
 b=Ixrl+5E7z0RpDr1Vfu0CU7FpfklNI5m7/Tt7UXWf1W0OPTJtFB6aUDJZ1T5Y/dtvAL
 sifo0tXIeSJ0rXZPVL7Kjq39OtNLQJDdPaB8EtmqwSMUmNBUcpaB/AqcpX7DMsZheumu
 2PNhZAiD6IyKCxsmb3EthgbmnpdN+udpn7HlMNiDs+KHc1DITXKzn+fW1qa8X/6A13MD
 BAQ3CQa0aq6KkNoPvoeKeSD5/Mf+TYpCHQDzsLW4mjDKRnb6uLJg2EYO/amZ9hTdOUsx
 Lv8nLfNvGTlnuc3txumutFo1Fmipk4G+zoNOgBVsVC43ZLH54te20XGKzoVWco3OqQI7
 RjRw==
X-Gm-Message-State: AOAM530xuNnN+MFfL3oivActSmzyGKS/S5dsR2DIkmx0LDG6Bj8D0MAW
 pyhSTrHf2ZWJYNAU/V9abmaxlJTf4vg=
X-Google-Smtp-Source: ABdhPJxAKePnhi+61YVCmIuTnPu0uu0UXCoQaXRqNXdG4OmuK+SOQC4w4bYodG2KJCGdocs7j92+Aw==
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id
 z21-20020aa7d415000000b00410a0fadc40mr27439740edq.46.1645551511072; 
 Tue, 22 Feb 2022 09:38:31 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:30 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/22] hw/input/pckbd: QOM'ify IRQ numbers
Date: Tue, 22 Feb 2022 18:38:00 +0100
Message-Id: <20220222173819.76568-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
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
 hw/input/pckbd.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index baba62f357..e56bee87d2 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -671,6 +671,8 @@ struct ISAKBDState {
     KBDState kbd;
     bool kbd_throttle;
     MemoryRegion io[2];
+    uint32_t kbd_irq;
+    uint32_t mouse_irq;
 };
 
 void i8042_isa_mouse_fake_event(ISAKBDState *isa)
@@ -734,8 +736,8 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
     ISAKBDState *isa_s = I8042(dev);
     KBDState *s = &isa_s->kbd;
 
-    isa_init_irq(isadev, &s->irq_kbd, 1);
-    isa_init_irq(isadev, &s->irq_mouse, 12);
+    isa_init_irq(isadev, &s->irq_kbd, isa_s->kbd_irq);
+    isa_init_irq(isadev, &s->irq_mouse, isa_s->mouse_irq);
 
     isa_register_ioport(isadev, isa_s->io + 0, 0x60);
     isa_register_ioport(isadev, isa_s->io + 1, 0x64);
@@ -754,6 +756,7 @@ static void i8042_realizefn(DeviceState *dev, Error **errp)
 
 static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 {
+    ISAKBDState *isa_s = I8042(isadev);
     Aml *kbd;
     Aml *mou;
     Aml *crs;
@@ -761,7 +764,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     crs = aml_resource_template();
     aml_append(crs, aml_io(AML_DECODE16, 0x0060, 0x0060, 0x01, 0x01));
     aml_append(crs, aml_io(AML_DECODE16, 0x0064, 0x0064, 0x01, 0x01));
-    aml_append(crs, aml_irq_no_flags(1));
+    aml_append(crs, aml_irq_no_flags(isa_s->kbd_irq));
 
     kbd = aml_device("KBD");
     aml_append(kbd, aml_name_decl("_HID", aml_eisaid("PNP0303")));
@@ -769,7 +772,7 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
     aml_append(kbd, aml_name_decl("_CRS", crs));
 
     crs = aml_resource_template();
-    aml_append(crs, aml_irq_no_flags(12));
+    aml_append(crs, aml_irq_no_flags(isa_s->mouse_irq));
 
     mou = aml_device("MOU");
     aml_append(mou, aml_name_decl("_HID", aml_eisaid("PNP0F13")));
@@ -783,6 +786,8 @@ static void i8042_build_aml(ISADevice *isadev, Aml *scope)
 static Property i8042_properties[] = {
     DEFINE_PROP_BOOL("extended-state", ISAKBDState, kbd.extended_state, true),
     DEFINE_PROP_BOOL("kbd-throttle", ISAKBDState, kbd_throttle, false),
+    DEFINE_PROP_UINT32("kbd-irq", ISAKBDState, kbd_irq, 1),
+    DEFINE_PROP_UINT32("mouse-irq", ISAKBDState, mouse_irq, 12),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.35.1


