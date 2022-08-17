Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430215977C2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:21:57 +0200 (CEST)
Received: from localhost ([::1]:45112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPY4-0008JA-EW
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:21:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJG-0003ie-Os
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJF-0000P4-4p
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EeMkAHhf9AoIGqHoeQ4LAkZR3KVWS7ogggvX+tcW7Dw=;
 b=fyzX6dsea7LRjQBQxwyTjOYHSfMxbENwdrlYZLMdgfOciSiqa/LyjbiQPh7q54PyfwUvV6
 cnQmeKjM9KXOuQFe1iTLnDGJ+cLYjEiVMi2kZkdmxcMtjMlAA0ADiple8bgwr382Qoun2D
 69rtQG2rHPtsn+nyJikjtnoloq7dTys=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-sXGJoxADNNyWYCcpXMU9Kg-1; Wed, 17 Aug 2022 16:06:35 -0400
X-MC-Unique: sXGJoxADNNyWYCcpXMU9Kg-1
Received: by mail-wm1-f70.google.com with SMTP id
 v67-20020a1cac46000000b003a615c4893dso1182194wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=EeMkAHhf9AoIGqHoeQ4LAkZR3KVWS7ogggvX+tcW7Dw=;
 b=nXKugYCB3On2uOMr3f2EeK3FkI7E3k4gZ+okeIX/jYfsyAxCKdZLCOdON1Ktp3suOx
 q8zuuny3dwQluBlm515xndVs/ZY8RjWASkbAltcScJZDubzevvfVn7bwH/K7pI7DPd2f
 9/1VrAe1kzCngJBWpQ5E6HTna3KwsGvm00o3XHxai4uZawMo7tZ28VJVA9QTzF+bDCIL
 penK6tLLY3lXyzmnIDZzoEv/jiFp6EVrxVCrLjAX1v0BcR5KUuhJbgePLY0wC58fTGEK
 o0W61OZr5q83svZrNF6CSoTZGFZxEXU++MnYzufGPAKGxT3hfGPzieYJNMTo9zdzu4Ht
 KUsg==
X-Gm-Message-State: ACgBeo3GbEv6hCS9UpqHCbeJuiFDsaeBZqcb6NJB457u9z+xOonRdZz5
 Fw9aorTjiWvW9lza3aO4kNJBCEUit0BGEWkeukJLUfMXmR9hpU9eCuxKE0y9NIwVOuGAzTLZf1D
 mJcRUxxkvxDku6xurbwKwIh1tWRdT29fmOGbaknKkQ0iTtB5ivrbqa6WddTuq
X-Received: by 2002:a05:600c:1c19:b0:3a5:51aa:d041 with SMTP id
 j25-20020a05600c1c1900b003a551aad041mr3087155wms.172.1660766793902; 
 Wed, 17 Aug 2022 13:06:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4NzTdNL3niBApWmTBPJWj/s42MnvhhoGX/r1VdDDY6Tzudh9p2adzJ9Pw3RTNgZbmSJWKirQ==
X-Received: by 2002:a05:600c:1c19:b0:3a5:51aa:d041 with SMTP id
 j25-20020a05600c1c1900b003a551aad041mr3087143wms.172.1660766793621; 
 Wed, 17 Aug 2022 13:06:33 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c219a00b003a5de95b105sm3049855wme.41.2022.08.17.13.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:33 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel@redhat.com>
Subject: [PULL 12/12] virtio-pci: don't touch pci on virtio reset
Message-ID: <20220817200536.350795-13-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
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
index 5ce61f9b45..a50c5a57d7 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1947,7 +1947,6 @@ static void virtio_pci_reset(DeviceState *qdev)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(qdev);
     VirtioBusState *bus = VIRTIO_BUS(&proxy->bus);
-    PCIDevice *dev = PCI_DEVICE(qdev);
     int i;
 
     virtio_bus_reset(bus);
@@ -1960,6 +1959,13 @@ static void virtio_pci_reset(DeviceState *qdev)
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
@@ -2027,7 +2033,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_OTHERS;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
-    dc->reset = virtio_pci_reset;
+    dc->reset = virtio_pci_bus_reset;
 }
 
 static const TypeInfo virtio_pci_info = {
-- 
MST


