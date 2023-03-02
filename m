Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3A16A8B22
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNo-0000rr-C9; Thu, 02 Mar 2023 16:22:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNm-0000rC-Hl
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:34 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNl-0002Ri-02
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:34 -0500
Received: by mail-ed1-x535.google.com with SMTP id g3so2584639eda.1
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8Nyy3BC37kImjkVwZxg+wfPmOnmEQ2wZSPRsrjcxuus=;
 b=odZtaPsFzuFEisp7Fo/q3CzRzKDrTzb1shXlmGZ2ybk3jeCD/SAdZ0E8fVMqZ5W5K/
 b9tBxWgmEEWpEJEyXLGpHsTpAzi8yBiC6UkmJD6OnFx8/LYMtMY/aWnRO7OX8+HGkUT8
 Tcw+8k8BU6V2qs8VaJ7MoNweHy61jxv/20fGA2iXVz3E3iT81+7j5NC28iV7S5ovldi3
 kx27M0q9sTPb1eWx8K671uif/jeF0GvGMJUJZU2UoXkrprnnKJwTbbvI22hsrj+7EpyB
 DbIA46PliRGK00JiBpEXuKC8+zi6x7VmkU+kEQUr135jBUrU7EKG3R/5Uf0VhnwPYpnw
 pAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8Nyy3BC37kImjkVwZxg+wfPmOnmEQ2wZSPRsrjcxuus=;
 b=jZKie7fvQ2ECupB336rCcF5JmXf3mwnVUOsXCAlkuCjrsfa5Bni9KOqJVWYDQWjM35
 auhwNUXKYYZwxeNqmccNst/V3arzymte8UmlTMzu3ucDYtZFmKo9MIRXr3S46Zankbam
 Cbp5z4K7zyG/r1xEV85b5YZpqYl5WG4aCjKPkYuqgzFpSBXwYlX53zkyGeFGuv0TxYB2
 YdTEhWSJQUZzmQb7zRFaHw4AjgqkM5PulP2v6aQfAfYQfm+tib6Y+e0rhir6yxl5iVaU
 m6Ut3P1DF/j4g4f/FcL3ZPOVnQrB0ieLZDF1Udp0NvFzQW+pB8NXpYWlehB1+HtC9ntS
 6zyQ==
X-Gm-Message-State: AO0yUKWAT5e2yAf7Sh2gY5MJ27vrOGOT9C2w84dr9pdsYb54Ly+v+QLB
 00V18Rd5lzF6TeFYxzMNkspFEcHYbg0=
X-Google-Smtp-Source: AK7set9/eoCcgwBu0GLS9vo2R5Vgfz900B1xsb0U6/xR5Kg2oZJU7zRzhavtR6VgC750ENbep/c7Ag==
X-Received: by 2002:a17:906:36c6:b0:895:ef96:9d9b with SMTP id
 b6-20020a17090636c600b00895ef969d9bmr11736225ejc.30.1677792151971; 
 Thu, 02 Mar 2023 13:22:31 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:31 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 21/23] hw/isa/piix: Consolidate IRQ triggering
Date: Thu,  2 Mar 2023 22:21:59 +0100
Message-Id: <20230302212201.224360-22-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Speeds up PIIX4 which resolves an old TODO.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-41-shentey@gmail.com>
---
 hw/isa/piix.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index d6c39d6f37..30873b0764 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -84,27 +84,6 @@ static void piix_set_irq(void *opaque, int pirq, int level)
     piix_set_irq_level(piix, pirq, level);
 }
 
-static void piix4_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    PIIXState *s = opaque;
-    PCIBus *bus = pci_get_bus(&s->dev);
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < ISA_NUM_IRQS) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_bus_get_irq_level(bus, i);
-            }
-        }
-        qemu_set_irq(s->pic[pic_irq], pic_level);
-    }
-}
-
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIXState *piix3 = opaque;
@@ -240,7 +219,7 @@ static int piix4_post_load(void *opaque, int version_id)
         s->rcr = 0;
     }
 
-    return 0;
+    return piix3_post_load(opaque, version_id);
 }
 
 static int piix3_pre_save(void *opaque)
@@ -597,7 +576,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         qdev_connect_gpio_out(DEVICE(&s->pm), 0, s->pic[9]);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix_set_irq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -615,6 +594,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-- 
2.39.2


