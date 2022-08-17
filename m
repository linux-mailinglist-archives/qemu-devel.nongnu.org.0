Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7907596D65
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 13:16:52 +0200 (CEST)
Received: from localhost ([::1]:57078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOH2Z-0004cy-BE
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 07:16:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGto-0007S6-EH
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOGtU-0006EN-SO
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 07:07:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660734448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4yIMgEJspMqB2kCrfutGdW1vD3HPqbuHfMGH4ebeFj8=;
 b=DVFBNhAAIlBNmbKJUV0k0EIPGYec42tdPj9gWeYM1623T/Ny7JGQbO4UHrpNz/oNaj9+Ou
 sSzkX1a8XVxNISz2uA0sIrFVA9QQSY1WBIxWK8UCc8egcWYpmb/Ct0ovvBz3Sw8Og/GaKy
 NrucJDm20pj767C8XGETNZ/S5SYOJe4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-614-tttnzFYhNtusDxjWeJklUQ-1; Wed, 17 Aug 2022 07:07:26 -0400
X-MC-Unique: tttnzFYhNtusDxjWeJklUQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h62-20020a1c2141000000b003a4f57eaeaaso6182340wmh.8
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 04:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=4yIMgEJspMqB2kCrfutGdW1vD3HPqbuHfMGH4ebeFj8=;
 b=scgc/A2w/JzDaCcwsKapJKD6RCoCUp/0ja7DtqsJc1vulWF5WDPveqio9rUiqQyL9y
 1zwXtk5xUS6O50X4ztLR7yySIi3aZDoTVjzHJiN4jrk1J7sM88ZZuInWsJE7xxlu3EM1
 5smGmwXNR2SLH769rsACRGlHFRztgyiIjwHtYeyO6ELRBRFokfjIJYaq3QMoOETNsI1h
 NhuX0biVBUh5A7rqbh2ttegRzoH4Ctx/dsds3+uFOyI2E+07KZ6mCX+CPObwNYK4OUzA
 pHpyRM3EFoDe/UpdoctX4pNRDZbiQW27UbuAzm/fnLnExDpuAZImin72wqnEO6E7nLHC
 K1cQ==
X-Gm-Message-State: ACgBeo2WmPQw0nXBmPMhd4sgZEMX5MKz7E/hvemOrmLW6ELUEH2gN/nV
 RgXy5VWAhPT+AmZHD4jR5FhUOTBkeTViF6FQEFc875fryemzhixCURyRi6cjzrxSXaCa/oyUJme
 N2CVzOOwZbREkpQPbOEszy66DwrdiyFDq4ZHxi9eJMjiRho7rFcoC5gFLjwl+
X-Received: by 2002:a5d:6f18:0:b0:225:2032:fca with SMTP id
 ay24-20020a5d6f18000000b0022520320fcamr2598096wrb.182.1660734445308; 
 Wed, 17 Aug 2022 04:07:25 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4rchyusUVFH3rSPNX39y2hGP+z/BcVotI9AFr/d8bMAkDQ+ojHoLMcBesoolb0Hz3DKQBzQA==
X-Received: by 2002:a5d:6f18:0:b0:225:2032:fca with SMTP id
 ay24-20020a5d6f18000000b0022520320fcamr2598083wrb.182.1660734445035; 
 Wed, 17 Aug 2022 04:07:25 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 j4-20020a05600c42c400b003a5c064717csm1678947wme.22.2022.08.17.04.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 04:07:24 -0700 (PDT)
Date: Wed, 17 Aug 2022 07:07:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel@redhat.com>
Subject: [PATCH v2] virtio-pci: don't touch pci on virtio reset
Message-ID: <20220817110658.66774-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

virtio level reset should not affect pci express
registers such as PM, error or link.

Fixes: 27ce0f3afc ("hw/virtio: fix Power Management Control Register for PCI Express virtio devices")
Fixes: d584f1b9ca ("hw/virtio: fix Link Control Register for PCI Express virtio devices")
Fixes: c2cabb3422 ("hw/virtio: fix error enabling flags in Device Control register")
Cc: "Marcel Apfelbaum" <marcel@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 45327f0b31..e48ee7f2a5 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1942,7 +1942,6 @@ static void virtio_pci_reset(DeviceState *qdev)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
-    PCIDevice *dev = PCI_DEVICE(qdev);
     int i;
 
     virtio_bus_reset(bus);
@@ -1955,6 +1954,13 @@ static void virtio_pci_reset(DeviceState *qdev)
         proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
         proxy->vqs[i].used[0] = proxy->vqs[i].used[1] = 0;
     }
+}
+
+static void virtio_pci_bus_reset(DeviceState *qdev)
+{
+    PCIDevice *dev = PCI_DEVICE(qdev);
+
+    virtio_pci_reset(qdev);
 
     if (pci_is_express(dev)) {
         pcie_cap_deverr_reset(dev);
@@ -2022,7 +2028,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
-    dc->reset = virtio_pci_reset;
+    dc->reset = virtio_pci_bus_reset;
 }
 
 static const TypeInfo virtio_pci_info = {
-- 
MST


