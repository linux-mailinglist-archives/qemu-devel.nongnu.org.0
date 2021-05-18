Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A838828D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:02:44 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7nX-0006YW-Ls
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hE-0007BN-9B
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hB-0003Bj-82
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PE3iwyGyEcoAMEB/9uNGPwKDaH1AcQ1ElGBifGVOY78=;
 b=fQIhbs/IhZRyVzgOiHiMY5Oz6gp++Q8Rc6J8pDnY6kERyQq07iOZFFq1qP8DxqgZ9Ika7f
 bLCfshywlZ066n/8Rot7uKQV/3yEpW6/kPo6h/Ze5shYkVDhTx0k9A1O9GuqOfQ+lpKvC8
 Xs7M4KgzkBFhksrCahXQ/8QA79F5Az0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-a8JHw04xMq-M7-xsFtzs0A-1; Tue, 18 May 2021 17:55:53 -0400
X-MC-Unique: a8JHw04xMq-M7-xsFtzs0A-1
Received: by mail-ed1-f69.google.com with SMTP id
 d4-20020aa7ce040000b029038d1d0524d0so5737384edv.3
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PE3iwyGyEcoAMEB/9uNGPwKDaH1AcQ1ElGBifGVOY78=;
 b=ifQiFEUFN683v8HjMcyONXqUvHCr7KKQj/kG4ducLkrMWvbQpglARiZcHe+IPz78Ez
 qvGNymSKYoX23drJYuvgdU9Qg16P61eyGcXoAZptX+XoIy6AXBY6f1zsPVXXclJgIu7/
 7A3Idqq2EPuQmeZDrMKkbZxb20CVAdFcckmwnqjhn4mPV7OsTMAOCe4lcXwsWp48loVH
 ycPxQuOQ9TmyOUDBfP4zqzxULR+hFmDQFDo79ACE4UmvoQORzAxa7qPr7ixloQg/yFYB
 MdvGeYMJ2f3uTyiyReRgTnB4vriHhvf3GPWaHuuhGoCRcKjNhb71k2E4T8A00pYUyCly
 UJKg==
X-Gm-Message-State: AOAM53316ZsXv8FcyKTiJfQyG50aNYmRmkSCNjzp/0iva69uKbC4vYl/
 U5TfnO/sLG44Osyx8A0MU710f8KC3gg4d0LgsZo2WyKNDg4rZ4hrzWqA0r4dsPr3s+c8T8VANXc
 KNKx29AvsQhBmjcw=
X-Received: by 2002:a17:906:c299:: with SMTP id
 r25mr4888934ejz.501.1621374951816; 
 Tue, 18 May 2021 14:55:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWVOhAotvN7IhI9s6XiwQJDj2ZhJMuuGYh31gStlR4AYAsrVT/q0c66jCgFe2KKO+Jsz3Idw==
X-Received: by 2002:a17:906:c299:: with SMTP id
 r25mr4888923ejz.501.1621374951674; 
 Tue, 18 May 2021 14:55:51 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id u14sm3394603edy.47.2021.05.18.14.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:55:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 01/11] hw/isa: Explode pci_create_simple() calls
Date: Tue, 18 May 2021 23:55:35 +0200
Message-Id: <20210518215545.1793947-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518215545.1793947-1-philmd@redhat.com>
References: <20210518215545.1793947-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to set a property on the ISA-IDE bridges objects
before they are realized, explode the pci_create_simple()
calls as pci_new() + pci_realize_and_unref().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/i386/pc_piix.c   | 5 +++--
 hw/isa/piix4.c      | 3 ++-
 hw/mips/fuloong2e.c | 3 ++-
 hw/ppc/pegasos2.c   | 3 ++-
 4 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 30b8bd6ea92..fb606c14768 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -244,8 +244,9 @@ static void pc_init1(MachineState *machine,
     if (pcmc->pci_enabled) {
         PCIDevice *dev;
 
-        dev = pci_create_simple(pci_bus, piix3_devfn + 1,
-                                xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
+        dev = pci_new(piix3_devfn + 1,
+                      xen_enabled() ? "piix3-ide-xen" : "piix3-ide");
+        pci_realize_and_unref(dev, pci_bus, &error_abort);
         pci_ide_create_devs(dev);
         idebus[0] = qdev_get_child_bus(&dev->qdev, "ide.0");
         idebus[1] = qdev_get_child_bus(&dev->qdev, "ide.1");
diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 0fe7b69bc4c..d60f161ecf4 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -261,7 +261,8 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
         *isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
     }
 
-    pci = pci_create_simple(pci_bus, devfn + 1, "piix4-ide");
+    pci = pci_new(devfn + 1, "piix4-ide");
+    pci_realize_and_unref(pci, pci_bus, &error_abort);
     pci_ide_create_devs(pci);
 
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index c1b8066a13b..40e9a645e1b 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -206,7 +206,8 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                           TYPE_VT82C686B_ISA);
     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
+    pci_realize_and_unref(dev, pci_bus, &error_abort);
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 0bfd0928aa5..8486a2eb8c6 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -108,7 +108,8 @@ static void pegasos2_init(MachineState *machine)
                           qdev_get_gpio_in_named(mv, "gpp", 31));
 
     /* VT8231 function 1: IDE Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
+    dev = pci_new(PCI_DEVFN(12, 1), "via-ide");
+    pci_realize_and_unref(dev, pci_bus, &error_abort);
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
-- 
2.26.3


