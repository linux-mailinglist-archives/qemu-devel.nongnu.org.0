Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2DC6B65C8
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 13:03:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbKPY-0003NL-8D; Sun, 12 Mar 2023 08:02:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPR-0003LO-Hc
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:41 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPP-0000Iw-Lh
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:41 -0400
Received: by mail-ed1-x52f.google.com with SMTP id cn21so7937491edb.0
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678622554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3I5DWtzKsLyM4cyrY32zr2tTmXgNaQXMmqiAK0JjXes=;
 b=eyX7uzfQRseoDcVLf1glqqsf8V35kfMg00j4z1ki81t0uYpETsmGE/JyBsRsTefz6q
 AHUFGhoGUFUTcVaT8mqmjmRCeoj/p/7/pyp3LB/F7DMF/D15vIyAl8oMj/AKN7170XSj
 onOHEkO1hm4jC31ph56IvBpykFg5+f1kQzXT7sHOM1oN29vs0zml/TH7+Lpg+2D7/k2c
 WCwSPMvT9V2op5nuqH4UbWa1SBLV/JuONy5Er5lGyb3xv8UomMqwt0tJMVEkkoRq9kyI
 2gURa5BX3w1J5pQVnMJg64eDTuW2zXxtcAmTvs9O79XLKODNAh9GqFQLb/oEzFHj04yk
 +TTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678622554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3I5DWtzKsLyM4cyrY32zr2tTmXgNaQXMmqiAK0JjXes=;
 b=zRunlJMh/fVL9JI/ItKPOWjnC9fR4vHhCfpbc52Yp/5utoyaNsqMcAn/siLp/F7IXg
 YTm2Xc4tztPW9jCjZBNpmH3je9WnCrf4Futr21yAYM/wJNImZDcp5T+jyYL6VwdBV0qq
 ndw+TpuzbLdblC69lCH+ns4wByFNhBOCS/okbelmEAJEuVzHeombP7TbXzHgaiLrPPPd
 EkkENqsqUNZCf3lzK9w8znoD3iTdg6QhkULwyI2YuRQJ8oFS74HeRuXa2PGEkbVtrLrx
 C27UbGcWGhyoV687MMdlaPV6t1uoF6Gd9IHfMlcwWW1Fl+2waO6MYheCDJhTLuacKjw3
 xKcg==
X-Gm-Message-State: AO0yUKVx5z6YoJUqazUMh9Z/gwfvo5h3AzOoTH15Cl+JF98hz+joiELO
 NsYhBrM8Paof+aUA0kbqBeOnqGuOAl8=
X-Google-Smtp-Source: AK7set9hj4vE3HzWNVGymwkFNRWqJxqDthLXr5YsmajpSOkBnHKY5RdbUl7r8I2QIpYWaP2socctfw==
X-Received: by 2002:aa7:cfcc:0:b0:4fb:da15:5bfd with SMTP id
 r12-20020aa7cfcc000000b004fbda155bfdmr1179361edy.4.1678622554052; 
 Sun, 12 Mar 2023 05:02:34 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 1/6] include/hw/xen/xen: Rename xen_piix3_set_irq() to
 xen_intx_set_irq()
Date: Sun, 12 Mar 2023 13:02:16 +0100
Message-Id: <20230312120221.99183-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312120221.99183-1-shentey@gmail.com>
References: <20230312120221.99183-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
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

xen_piix3_set_irq() isn't PIIX specific: PIIX is a single PCI device
while xen_piix3_set_irq() maps multiple PCI devices to their respective
IRQs, which is board-specific. Rename xen_piix3_set_irq() to communicate
this.

Also rename XEN_PIIX_NUM_PIRQS to XEN_IOAPIC_NUM_PIRQS since the Xen's
IOAPIC rather than PIIX has this many interrupt routes.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/xen/xen.h  | 2 +-
 hw/i386/xen/xen-hvm.c | 2 +-
 hw/isa/piix3.c        | 4 ++--
 stubs/xen-hw-stub.c   | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 2bd8ec742d..37ecc91fc3 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -39,7 +39,7 @@ extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_intx_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 56641a550e..ab8f1b61ee 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -143,7 +143,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
     xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
                            irq_num & 3, level);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a9cb39bf21..1b3e23f0d7 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -34,7 +34,7 @@
 #include "migration/vmstate.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
-#define XEN_PIIX_NUM_PIRQS      128ULL
+#define XEN_IOAPIC_NUM_PIRQS    128ULL
 
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
@@ -405,7 +405,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_IOAPIC_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 34a22f2ad7..7d7ffe83a9 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -15,7 +15,7 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return -1;
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
 }
 
-- 
2.39.2


