Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F565B769
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 22:37:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCSTB-0008Fl-4m; Mon, 02 Jan 2023 16:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST8-0008Ey-Gh
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:42 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCST6-00059A-Sz
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 16:35:42 -0500
Received: by mail-ej1-x62b.google.com with SMTP id vm8so62327957ejc.2
 for <qemu-devel@nongnu.org>; Mon, 02 Jan 2023 13:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AhjGz5k2CpbSc4H1yL5PDfOgeHeVz+Sw9cmuSS5IpyA=;
 b=owH/gHSxZpPPK6jvooYZ2wLT9TML1U3LOD629OCrtg+nERm71Dji9K6TNg3MbP6Idc
 qcr126FdTfRUKlWTIXTY+Bgh37w+XP8+KS1ONuTsaMPx8lC9OojQhW7i7hBUNA9igiqi
 0v1xr7C4jQOwjzirYfnBq8TDN97Iw+0ano5/nh5z0xMU5V/R/iqLspeXW77ZBjfooiu3
 r8Xfxx73bxr97JwI5kDKQM/jYhKNXoAT2c00SH5ujp4Jzc+PhtRVm192H5TPW1zIPZvr
 TpLoG9qlpOhMEhPVkIGVXiyGOxzZUa63JMH+ChYMA8W8mWV7O3EAr+PNxZJ1Gd4R6rOu
 pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhjGz5k2CpbSc4H1yL5PDfOgeHeVz+Sw9cmuSS5IpyA=;
 b=xPtjFswaOGuByZcrO7eso2JTRX2vQl831vF0rKkVXWPrPHAHXU3vGuOJ2xYrcY1BlD
 zd23fOTNBN0rdSePBXr6LcixHap71Y7KVMasqgn5IC9xbZiHWrp7BliE6RHiWiAglbAT
 /aQggNmFm6Aiwj/l8GxXYXGq81KYXSXvjNkkT6ex3ezLyW5Pna6KuN7Ge6EWiQ9SFxH9
 viZYYv6IWoFtAlgKJ/UpQf5Wl1EeJVAGrjIZ/cGICX1U+O/0T6yb6kJeg5cZv+sm6u4Q
 kodn/AoUfOYa+wxDY8SWCkZ25EM+mXqFPRbw9pTYfGzuXeRAtqgw0mS3mMfOp9FBLPsv
 Z3dQ==
X-Gm-Message-State: AFqh2kp2Rc5PnaoRHrRfxhA9TEAu5/TKKnt6gd65m+IkRArCHKaFCk6h
 Et11AjL5eXNLv7QVRUter/k7NSe8lLw=
X-Google-Smtp-Source: AMrXdXsKw/KWvzmQ9hqdX4WTRGdsRsoTmLiF1urYt1nYchYGOMtg1bcydRX4/IC9k2BmIdSzSy2jZQ==
X-Received: by 2002:a17:907:9625:b0:7ad:9455:d57d with SMTP id
 gb37-20020a170907962500b007ad9455d57dmr38487663ejc.74.1672695339125; 
 Mon, 02 Jan 2023 13:35:39 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a17090631cb00b0084c465709b7sm10583826ejf.74.2023.01.02.13.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jan 2023 13:35:38 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 1/6] include/hw/xen/xen: Make xen_piix3_set_irq() generic and
 rename it
Date: Mon,  2 Jan 2023 22:34:59 +0100
Message-Id: <20230102213504.14646-2-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102213504.14646-1-shentey@gmail.com>
References: <20230102213504.14646-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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

xen_piix3_set_irq() hardcoded the number of PCI IRQ lines. Get it from
the PCI bus instead.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/xen/xen-hvm.c | 9 ++++++---
 hw/isa/piix.c         | 2 +-
 include/hw/xen/xen.h  | 2 +-
 stubs/xen-hw-stub.c   | 2 +-
 4 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index e4293d6d66..59e8246a48 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -142,10 +142,13 @@ int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num)
     return irq_num + (PCI_SLOT(pci_dev->devfn) << 2);
 }
 
-void xen_piix3_set_irq(void *opaque, int irq_num, int level)
+void xen_intx_set_irq(void *opaque, int irq_num, int level)
 {
-    xen_set_pci_intx_level(xen_domid, 0, 0, irq_num >> 2,
-                           irq_num & 3, level);
+    PCIDevice *pci_dev = opaque;
+    PCIBus *pci_bus = pci_get_bus(pci_dev);
+
+    xen_set_pci_intx_level(xen_domid, 0, 0, irq_num / pci_bus->nirq,
+                           irq_num % pci_bus->nirq, level);
 }
 
 int xen_set_pci_link_route(uint8_t link, uint8_t irq)
diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index ae8a27c53c..dc6014a4e4 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -504,7 +504,7 @@ static void piix3_xen_realize(PCIDevice *dev, Error **errp)
      * connected to the IOAPIC directly.
      * These additional routes can be discovered through ACPI.
      */
-    pci_bus_irqs(pci_bus, xen_piix3_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, xen_intx_set_irq, piix3, XEN_PIIX_NUM_PIRQS);
 }
 
 static void piix3_xen_class_init(ObjectClass *klass, void *data)
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index afdf9c436a..7c83ecf6b9 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -22,7 +22,7 @@ extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
 int xen_set_pci_link_route(uint8_t link, uint8_t irq);
-void xen_piix3_set_irq(void *opaque, int irq_num, int level);
+void xen_intx_set_irq(void *opaque, int irq_num, int level);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
 int xen_is_pirq_msi(uint32_t msi_data);
 
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
2.39.0


