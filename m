Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C4388295
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:05:53 +0200 (CEST)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7qa-0001u5-Tl
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hG-0007Ch-6W
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hB-0003CT-Vw
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4mj2gfnZfCBRpQogSZRkYuV2axSsjwCefiXC31wD6Zo=;
 b=KYzI7VdARF2sUuVx49WghkS1QeV2nPDyjOG8GSSZKcqwq8rEDJn7QF7Y6ovG4y7p8+LHt/
 DweeNXbu1rXRPfRdbL/eJJmND32KAbD4LKdQb3vy1NgCSEJt+pcALWVoMS7ZxCo6g9kFeW
 aBWIh0AnH/9y7N6972Yvv1njuwfmCYI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-4rpXyKgcMimexWZpe-wmiw-1; Tue, 18 May 2021 17:56:07 -0400
X-MC-Unique: 4rpXyKgcMimexWZpe-wmiw-1
Received: by mail-ej1-f70.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so1066201ejc.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4mj2gfnZfCBRpQogSZRkYuV2axSsjwCefiXC31wD6Zo=;
 b=o9u+syWImN+vRN52vdJRZrTrLPC6zuk674MhH9S4JujKnUjn9f1t6LZAJzPIfFRQPr
 J1yS26w2RQpimWaYh50Wx+dAllJk4EEnZ1i3zUDfXVaw7ItYBYPJX5B/6iU45H4zTdCg
 JpmI0MnbCRG4vi39AD0lO/tRHNj8REUOtoVTNhaElOxFRckAUkM4XdrhZU3PwRjGnQTR
 2YVEvK6QPciESYPm3uzyovgBEyhJby+A4l/Zz8NSH/LknTmf6JkQ8xPBXIwQIGJwxuJU
 hSlaNZRshlzNE9rUuNYm0ukU2ktvTKtCnrj0H+WWF8iJmZlBVmmzUZyUg/zDLNPzp8Jq
 ywwA==
X-Gm-Message-State: AOAM530+pBH48VrmUh+vsc6iiCug7k20cZRWJDf8ZNbv/DSxySCrrxC2
 nxUYLoLzXdY4M7M9Irazheg4UcSQF8hNSBLWT4G19H1VTtbTl7mdss2EJ3oCWAyJXZlc/YX0TO4
 NTdNgq3LKnw1s1C0=
X-Received: by 2002:aa7:d718:: with SMTP id t24mr9681600edq.259.1621374966605; 
 Tue, 18 May 2021 14:56:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLcxhisD70Y685w1e2tU1HSum86pDVs1XDF6xvVyRDYtUtt/up1h9E2iAQytr0lkSJCD6BrQ==
X-Received: by 2002:aa7:d718:: with SMTP id t24mr9681585edq.259.1621374966434; 
 Tue, 18 May 2021 14:56:06 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k22sm1728326ejz.108.2021.05.18.14.56.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 04/11] hw/ide/via: Set the ISA-bus QOM link
Date: Tue, 18 May 2021 23:55:38 +0200
Message-Id: <20210518215545.1793947-5-philmd@redhat.com>
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

Set the ISA Bus link property on the VIA IDE object from the
two unique users, the Fuloong and Pegasos machines.

Add a check in via_ide_realize() to be sure this property is set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ide/via.c        | 5 +++++
 hw/mips/fuloong2e.c | 4 ++++
 hw/ppc/pegasos2.c   | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 65fdca6dcf4..654e15edfed 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -165,6 +165,11 @@ static void via_ide_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf = dev->config;
     int i;
 
+    if (!d->isa_bus) {
+        error_setg(errp, "via-ide: 'isa-bus' link not set");
+        return;
+    }
+
     pci_config_set_prog_interface(pci_conf, 0x8a); /* legacy mode */
     pci_set_long(pci_conf + PCI_CAPABILITY_LIST, 0x000000c0);
     dev->wmask[PCI_INTERRUPT_LINE] = 0;
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 40e9a645e1b..7e644a701bc 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -201,12 +201,16 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                        I2CBus **i2c_bus)
 {
     PCIDevice *dev;
+    BusState *isa_bus;
 
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
                                           TYPE_VT82C686B_ISA);
+    isa_bus = qdev_get_child_bus(DEVICE(dev), "isa.0");
     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
     dev = pci_new(PCI_DEVFN(slot, 1), "via-ide");
+    object_property_set_link(OBJECT(dev), "isa-bus",
+                             OBJECT(isa_bus), &error_abort);
     pci_realize_and_unref(dev, pci_bus, &error_abort);
     pci_ide_create_devs(dev);
 
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 8486a2eb8c6..ed6ddc3569b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -57,6 +57,7 @@ static void pegasos2_init(MachineState *machine)
     PCIBus *pci_bus;
     PCIDevice *dev;
     I2CBus *i2c_bus;
+    BusState *isa_bus;
     const char *fwname = machine->firmware ?: PROM_FILENAME;
     char *filename;
     int sz;
@@ -104,11 +105,14 @@ static void pegasos2_init(MachineState *machine)
     /* VT8231 function 0: PCI-to-ISA Bridge */
     dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(12, 0), true,
                                           TYPE_VT8231_ISA);
+    isa_bus = qdev_get_child_bus(DEVICE(dev), "isa.0");
     qdev_connect_gpio_out(DEVICE(dev), 0,
                           qdev_get_gpio_in_named(mv, "gpp", 31));
 
     /* VT8231 function 1: IDE Controller */
     dev = pci_new(PCI_DEVFN(12, 1), "via-ide");
+    object_property_set_link(OBJECT(dev), "isa-bus",
+                             OBJECT(isa_bus), &error_abort);
     pci_realize_and_unref(dev, pci_bus, &error_abort);
     pci_ide_create_devs(dev);
 
-- 
2.26.3


