Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A485268EF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:03:40 +0200 (CEST)
Received: from localhost ([::1]:53248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZdb-0003a6-Rz
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:03:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVM-0008KH-8L; Fri, 13 May 2022 13:55:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:33477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZVI-0004oT-Nw; Fri, 13 May 2022 13:55:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id p4so10903520edx.0;
 Fri, 13 May 2022 10:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcIDJXynX3IR6w1i2YupCFQ6HPzcRShSiUEd2NzUSik=;
 b=BNoMEieVyrC0Dt43qUYh8uujpgaaiDda8zRn7GrXGMRDSrHoo84IjsnuRZCqnJqGw5
 nWMuH/uV32g3zA9QibQoSXL2aar3k53xI1GtAgcIU1H6DDlxGKa5ahBtUj9tjiYqkLb2
 xPUdoWDecSre/RHGMMa84NH1xQ/0a/hTYJfEvoC0SP5fii6qfGw2k/7mKK25+I0DLCng
 rIPIkQXKe+5BOb0/ZTF2I3+miWC/EnYTxO5y4KMlgk+l0ZiHDjKIa2m46yKgMelbmOXF
 N9WGiaxhxj5kBScWttTGpLWsQ2I7TtArEgWCt+LTnohn25DGmSu02pbC3/CzPofvzO1f
 U7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcIDJXynX3IR6w1i2YupCFQ6HPzcRShSiUEd2NzUSik=;
 b=suW+alRgLiiqVIN2FHxnSAPyIoXgYp8Jd96I0tex3lSerLTgPcFOsCb/AIWD0sUFWD
 kkrozXOcneeOISkNr2uYh+fa4Kr36gXgyrHS294Y6JcSKtoyXwBGhzE2+HE1tbyJk2hc
 NKISKzDD08B8ABNE9QdpidGJIckTiCwFzq3nQkmJMzNLJGXZM7uHuACvyzBi77T5g4Y3
 BHNVaHBkOevKFV43k+ujappRRa9al5Gs4XMaWMOraS3v0vg6Ukl4KiS++j2qFHABw1FN
 baPgnX1denSA1wGwiKwkS+EF0gpB+BJ0BqCnsD0idZI2aF2NuG2VNwKeClMs3rhgwzPW
 a4BA==
X-Gm-Message-State: AOAM531Vwqr/KMoS7ZMRHV6hyV10E8Pb45klJDbYkzNMUGvVJ1FetALn
 pK1ZO6TToq+a3MjRKU1bfg/1MwNFeLw=
X-Google-Smtp-Source: ABdhPJyYLsmngofkx5O4qINsGMSP3dmKeCvc097WAwSzWHjld5VHhFF1bRlQSBW01o23St41lrrfIQ==
X-Received: by 2002:a05:6402:1c06:b0:428:727d:e38 with SMTP id
 ck6-20020a0564021c0600b00428727d0e38mr37863090edb.19.1652464502469; 
 Fri, 13 May 2022 10:55:02 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 ci18-20020a170907267200b006f3ef214e3esm953874ejc.164.2022.05.13.10.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 10:55:02 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH 6/6] hw/isa/piix{3,4}: Inline and remove create() functions
Date: Fri, 13 May 2022 19:54:45 +0200
Message-Id: <20220513175445.89616-7-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513175445.89616-1-shentey@gmail.com>
References: <20220513175445.89616-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x535.google.com
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

During the previous changesets the create() functions became trivial
wrappers around more generic functions. Modernize the code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c             |  6 +++++-
 hw/isa/piix3.c                | 16 ----------------
 hw/isa/piix4.c                | 10 ----------
 hw/mips/malta.c               |  3 ++-
 include/hw/southbridge/piix.h |  6 ++----
 5 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 47932448fd..82c7941958 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -196,6 +196,9 @@ static void pc_init1(MachineState *machine,
 
     if (pcmc->pci_enabled) {
         PIIX3State *piix3;
+        PCIDevice *pci_dev;
+        const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
+                                         : TYPE_PIIX3_DEVICE;
 
         pci_bus = i440fx_init(host_type,
                               pci_type,
@@ -206,7 +209,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        piix3 = piix3_create(pci_bus);
+        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 6eacb22dd0..01c376b39a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -36,9 +36,6 @@
 
 #define XEN_PIIX_NUM_PIRQS      128ULL
 
-#define TYPE_PIIX3_DEVICE "PIIX3"
-#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
-
 static void piix3_set_irq_pic(PIIX3State *piix3, int pic_irq)
 {
     qemu_set_irq(piix3->pic[pic_irq],
@@ -402,16 +399,3 @@ static void piix3_register_types(void)
 }
 
 type_init(piix3_register_types)
-
-PIIX3State *piix3_create(PCIBus *pci_bus)
-{
-    PIIX3State *piix3;
-    PCIDevice *pci_dev;
-    const char *type = xen_enabled() ? TYPE_PIIX3_XEN_DEVICE
-                                     : TYPE_PIIX3_DEVICE;
-
-    pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
-    piix3 = PIIX3_PCI_DEVICE(pci_dev);
-
-    return piix3;
-}
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 852e5c4db1..a70063bc77 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -300,13 +300,3 @@ static void piix4_register_types(void)
 }
 
 type_init(piix4_register_types)
-
-PCIDevice *piix4_create(PCIBus *pci_bus)
-{
-    PCIDevice *pci;
-
-    pci = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
-                                          TYPE_PIIX4_PCI_DEVICE);
-
-    return pci;
-}
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index d4bd3549d0..57b5eddc74 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1400,7 +1400,8 @@ void mips_malta_init(MachineState *machine)
     empty_slot_init("GT64120", 0, 0x20000000);
 
     /* Southbridge */
-    piix4 = piix4_create(pci_bus);
+    piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
+                                            TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     smbus = piix4_pm_init(pci_bus, piix4->devfn + 3, 0x1100,
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index bea3b44551..2d55dbdef7 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,10 +70,8 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
+#define TYPE_PIIX3_DEVICE "PIIX3"
+#define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
 #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
 
-PIIX3State *piix3_create(PCIBus *pci_bus);
-
-PCIDevice *piix4_create(PCIBus *pci_bus);
-
 #endif
-- 
2.36.1


