Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D5388293
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 00:05:44 +0200 (CEST)
Received: from localhost ([::1]:42894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj7qR-0001WP-7h
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 18:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7hb-0007Oe-SK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj7ha-0003Mh-53
 for qemu-devel@nongnu.org; Tue, 18 May 2021 17:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621374993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rr3mNRHifEVHB6ysNxRHbVJ3RkaEoRT+Kli4CYUxdaw=;
 b=IAXepeNF4u2/Ggk10NccD6cMiAfhu1G0TqgqLQjZBSYEH/5dXcpq2RjDin6xB9hqTVbJvY
 1STt+yRJUWcM+TnHPzOBKgPNnD3ccfnzzIm+UlJw0CAiuVz9qMpQi+J5je3W1DXM6RW9D3
 BBiv1TouUOtX13ZPZQ9UZ5UKRJ48z4Q=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120--SXpKDw0Og6tfJ1myXVB-w-1; Tue, 18 May 2021 17:56:32 -0400
X-MC-Unique: -SXpKDw0Og6tfJ1myXVB-w-1
Received: by mail-ed1-f70.google.com with SMTP id
 n6-20020a0564020606b029038cdc241890so6471109edv.20
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 14:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rr3mNRHifEVHB6ysNxRHbVJ3RkaEoRT+Kli4CYUxdaw=;
 b=M2SdetEra8JMgLRzyPlimxe7oCRZOsl+pdZnwc+byfHJAODn8o9eZcpn/P0+hVAs5f
 yCD4SfxqICdrGcG0lfv3av4CYgPcQIN4Rv9NsxdrWnd5pkOaJVBHkoghtOY4BMhxsuJ/
 e9Cw2yiODnzyxe1Yogjw2HWsICzSqWIE6RYVvgBQRe8C0FWL19tJI4QVELbSHPJpTiU4
 Lae1Iy4PIKWD7k5gADB+jnLSXEzKXEis67Iz2eT3W+X6gju0FWsdfoNPFvndVaiLBu3D
 COnH1KP4VAPlMbZSsRqL/1/Xj/7yNQhBZ7fq/mTUNCcHPQTiJVQX9AwuBxWGqTuGbRSv
 S7pA==
X-Gm-Message-State: AOAM530nx7lEEX1yrgKJVyapU6WGkE6HVo3H7MbGd5J31Gnngl1F7sxP
 9W3bk0jAvRv4Y9sc1edo/poP5Mcaa8AcSI5kFFSW806itm6BZeV4fnKs4br9MxyPeNvCveCXv37
 NdoBtFEtMhXlHjMU=
X-Received: by 2002:a17:906:5617:: with SMTP id
 f23mr7893904ejq.298.1621374990963; 
 Tue, 18 May 2021 14:56:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsFcpSCXAucTyHeAi1k0VOvDyNCeNXtdGnJ99bhDASi8/TFB5x3F0I5efwdIWIZr5S4HhNkw==
X-Received: by 2002:a17:906:5617:: with SMTP id
 f23mr7893893ejq.298.1621374990829; 
 Tue, 18 May 2021 14:56:30 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c7sm13670451ede.37.2021.05.18.14.56.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 14:56:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Subject: [RFC PATCH 09/11] hw/ide: Let ide_init_ioport() take an ISA bus
 argument instead of device
Date: Tue, 18 May 2021 23:55:43 +0200
Message-Id: <20210518215545.1793947-10-philmd@redhat.com>
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

Both callers to ide_init_ioport() have access to the ISA bus of the
device, so can pass it directly. This allows ide_init_ioport() to
directly call isa_bus_register_portio_list().

Note, now the callers become the owner of the PortioList.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ide/internal.h |  3 ++-
 hw/ide/ioport.c           | 11 ++++++-----
 hw/ide/isa.c              |  3 ++-
 hw/ide/piix.c             |  4 ++--
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 2d09162eeb7..141f53006a9 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -624,7 +624,8 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
-void ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void ide_init_ioport(IDEBus *bus, ISABus *isabus, Object *owner,
+                     int iobase, int iobase2);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index b613ff3bbaf..be2309459e1 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -50,15 +50,16 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-void ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+void ide_init_ioport(IDEBus *bus, ISABus *isabus, Object *owner,
+                     int iobase, int iobase2)
 {
     /* ??? Assume only ISA and PCI configurations, and that the PCI-ISA
        bridge has been setup properly to always register with ISA.  */
-    isa_register_portio_list(dev, &bus->portio_list,
-                             iobase, ide_portio_list, bus, "ide");
+    isa_bus_register_portio_list(isabus, owner, &bus->portio_list,
+                                iobase, ide_portio_list, bus, "ide");
 
     if (iobase2) {
-        isa_register_portio_list(dev, &bus->portio2_list,
-                                 iobase2, ide_portio2_list, bus, "ide");
+        isa_bus_register_portio_list(isabus, owner, &bus->portio2_list,
+                                     iobase2, ide_portio2_list, bus, "ide");
     }
 }
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 6bc19de2265..e7cf6714c8f 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -74,7 +74,8 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISAIDEState *s = ISA_IDE(dev);
 
     ide_bus_new(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    ide_init_ioport(&s->bus, isa_bus_from_device(isadev), OBJECT(dev),
+                    s->iobase, s->iobase2);
     isa_init_irq(isadev, &s->irq, s->isairq);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index debbc0023dc..0d6966fc7cb 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -137,8 +137,8 @@ static void pci_piix_init_ports(PCIIDEState *d) {
 
     for (i = 0; i < 2; i++) {
         ide_bus_new(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-        ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                        port_info[i].iobase2);
+        ide_init_ioport(&d->bus[i], d->isa_bus, OBJECT(d),
+                        port_info[i].iobase, port_info[i].iobase2);
         ide_init2(&d->bus[i], isa_bus_get_irq(d->isa_bus, port_info[i].isairq));
 
         bmdma_init(&d->bus[i], &d->bmdma[i], d);
-- 
2.26.3


