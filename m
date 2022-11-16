Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB6A62C887
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 19:57:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovNZr-0002BO-0z; Wed, 16 Nov 2022 13:56:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZa-000289-Rr
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:49 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ovNZX-0002nu-NW
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 13:55:45 -0500
Received: by mail-ed1-x536.google.com with SMTP id x2so28010999edd.2
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 10:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EKNazlDq9nIDadZbva3J08DFDrHk0q5LukLVArHPMcI=;
 b=BROvhtuhuX4EJLOpb8dQVab7whOuSi9UATRAP6mFjeUUAyoOH7bIZ/Nabi7dog3ER6
 kCmMO4OCbp0niwu78++kbSngDTQjZltqEOAYUj5/eekFmEikHpTtZxndcJQOt1GccTzT
 m8c7rIgu+LYoO/L5jAaNo49masMXpRLWGy4mx/2fLHkQd1sVWdHKhB2emAb3iC6gMsSA
 RB+8oa5iBN/klx9GExwXSCd/6hN4cwXnSaS+bjHH3TapVnvTM4vN7++gNkrYQm25sJ18
 6IuWLnzzPwB4j83r9RJyz+mgta/Bvnu8/bmnz08oIpggO5T4J5ahcjeiuTF4tTkPaF3e
 ow1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EKNazlDq9nIDadZbva3J08DFDrHk0q5LukLVArHPMcI=;
 b=lDcd4zx9sZ4AouUSLuOV+iV+3Cpj/OHeUwn70HT58nk/sk18yBC4VjCftgJOOrq2ig
 MledMhiuhpSC6JSn+1QGeYL+IpZwwOI3OmxDqvbX6PpTvzyey1ih2exrlCkuHHOrhnmr
 XuR5w3iLj1wk+kmB6B+vMkkmdziB3Pd3aZVPfr2x3P4NKOWuk2Ka8fEbIVisDIJfjhkY
 NkYGrACh+f16XjrGGl/UWmaUEovGAF3IVrJLv27x5bYrYlmoxA3kbxyinffloKFL036G
 7sEr7Bx8oC3dBlsIm04xxQiN2XAIfrUZ8UsHR2+9vvAhYQBdLbKJpojqUiCL/2uFshll
 8PsA==
X-Gm-Message-State: ANoB5pnkrLlN1Y4xDxS9QxNEkqHGgL5kuIQOuIb3TWrfXuaEVWTHHWL5
 PKslbg9i2RRAbYR6guCCJn5q5tisLjg=
X-Google-Smtp-Source: AA0mqf7UJMnwiCYMh6oADKniXXsQbGXI+EShOFgnQUvUu1VqyoTaLmqbuQVJeucizZndB0xjW04YFQ==
X-Received: by 2002:a50:fb03:0:b0:467:621f:879e with SMTP id
 d3-20020a50fb03000000b00467621f879emr20252382edq.380.1668624942073; 
 Wed, 16 Nov 2022 10:55:42 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-007-153.77.13.pool.telefonica.de. [77.13.7.153])
 by smtp.gmail.com with ESMTPSA id
 de30-20020a1709069bde00b0073d796a1043sm7135444ejc.123.2022.11.16.10.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 10:55:41 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Bernhard Beschow <shentey@gmail.com>
Subject: [RFC PATCH 3/3] hw/isa/vt82c686: Implement PIRQ routing
Date: Wed, 16 Nov 2022 19:55:00 +0100
Message-Id: <20221116185500.84019-4-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221116185500.84019-1-shentey@gmail.com>
References: <20221116185500.84019-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
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

Both VIA south bridges allow system software to configure the routing of
PCI interrupts to ISA interrupts. Implement this to model the real
hardware more closely.

The implementation is based on hw/isa/piix4.c.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 3f9bd0c04d..21157c669b 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -16,6 +16,7 @@
 #include "qemu/osdep.h"
 #include "hw/isa/vt82c686.h"
 #include "hw/pci/pci.h"
+#include "hw/pci/pci_bus.h"
 #include "hw/qdev-properties.h"
 #include "hw/ide/pci.h"
 #include "hw/isa/isa.h"
@@ -604,6 +605,48 @@ static void via_isa_request_i8259_irq(void *opaque, int irq, int level)
     qemu_set_irq(s->cpu_intr, level);
 }
 
+static int via_isa_get_pic_irq(const ViaISAState *s, int irq_num)
+{
+    switch (irq_num) {
+    case 0:
+        return s->dev.config[0x55] >> 4;
+
+    case 1:
+        return s->dev.config[0x56] & 0xf;
+
+    case 2:
+        return s->dev.config[0x56] >> 4;
+
+    case 3:
+        return s->dev.config[0x57] >> 4;
+    }
+
+    return 0;
+}
+
+static void via_isa_set_pic_irq(void *opaque, int irq_num, int level)
+{
+    ViaISAState *s = opaque;
+    PCIBus *bus = pci_get_bus(&s->dev);
+    int pic_irq;
+
+    /* now we change the pic irq level according to the via irq mappings */
+    /* XXX: optimize */
+    pic_irq = via_isa_get_pic_irq(s, irq_num);
+    if (pic_irq < ISA_NUM_IRQS) {
+        int i, pic_level;
+
+        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
+        pic_level = 0;
+        for (i = 0; i < PCI_NUM_PINS; i++) {
+            if (pic_irq == via_isa_get_pic_irq(s, i)) {
+                pic_level |= pci_bus_get_irq_level(bus, i);
+            }
+        }
+        qemu_set_irq(s->isa_irqs[pic_irq], pic_level);
+    }
+}
+
 static void via_isa_realize(PCIDevice *d, Error **errp)
 {
     ViaISAState *s = VIA_ISA(d);
@@ -676,6 +719,9 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
         return;
     }
+
+    pci_bus_irqs(pci_bus, via_isa_set_pic_irq, pci_bus->map_irq,
+                 s, ISA_NUM_IRQS);
 }
 
 /* TYPE_VT82C686B_ISA */
-- 
2.38.1


