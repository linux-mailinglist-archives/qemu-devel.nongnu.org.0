Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC253CB9A1
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:21:39 +0200 (CEST)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pek-000356-RA
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYs-00015h-7k
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYq-0004D7-Pd
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZFXStzDbpHZ3x7owVBtjJeqaH/pfDgxn4UIZ7oQ1Es0=;
 b=E93cBCTihyuhuwlsuTlRdOaezc/Bx3kBDXlg+hSrUyXgZ6Z0xEfQ2aE0BoZzy0+mWNhAOA
 xY3pWxyNmNjBHOX6llFU2/n/mcdpvdqMJjESta4PMB/NdyheoVLEsqY8yIalfpX6r9QK8P
 XvN+F9e0PtNP9fqFPLJB01iTkwClB5E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-9Zd5n1K_M1GnhEW5-w7yzw-1; Fri, 16 Jul 2021 11:15:31 -0400
X-MC-Unique: 9Zd5n1K_M1GnhEW5-w7yzw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p4-20020a5d63840000b0290126f2836a61so4986393wru.6
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZFXStzDbpHZ3x7owVBtjJeqaH/pfDgxn4UIZ7oQ1Es0=;
 b=uI1JyXp7fxN6mmdfxOmt3I7ZYkzYY0fcl3b6s/IjFbLG08qGzcwqzs+ogUzz1L1YbK
 +Ll3+NHpsbW0iyM9wvnCNmQBwnQL3myipAF09/5KNB/MMwU9A1PQPb1OllmhHESGbBLy
 voUsomI3Nyfi6FcQ4fv3BsQWun7aLAwkjXgfnc/PFnlVBwpZx4b5/lEn3xFb2hxtv8ad
 C8Z0g4ObuVPNYd4cKHVyctDFeReLNpCbZ0QZ5uFZiekaImTV6SF5NYmbnQTikpr2aPxw
 cl3f6XyA+n/nEC5lA9LAN4tZbVtZyZiPuZG4ep8zLlIjEyrS+9svAHY7lsKjJ3ctxm7q
 SBSg==
X-Gm-Message-State: AOAM531OaDR9E6dgHb7Q4XhbMFIfEIpn9arMPFvaFBucDS90TTy2f4Jt
 9Jw6I4AgdMa+eXIGokuZ7jDzayhqXjbvyfKz3aSlciv08rA/5cjfhHpP2+gs/BuCdlEHDDZWRnw
 Nq5v1l488dQIb7TjR7z0CvqDWZZft9ZWkEsE2SrTRnXXMD1QcCg2ZYGSEQc2u
X-Received: by 2002:a7b:c111:: with SMTP id w17mr17120540wmi.163.1626448529607; 
 Fri, 16 Jul 2021 08:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtVBp2xhJAB1jI1FEIXmlOgGEiEtXx5XWgC+xJC48nI0UiFMYhsICPOjcv0otLfd1dkYoK1w==
X-Received: by 2002:a7b:c111:: with SMTP id w17mr17120519wmi.163.1626448529414; 
 Fri, 16 Jul 2021 08:15:29 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id r18sm10570005wrt.96.2021.07.16.08.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:28 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 11/19] hw/pxb: Add a bypass iommu property
Message-ID: <20210716151416.155127-12-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xingang Wang <wangxingang5@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a bypass_iommu property for pci_expander_bridge, the property
is used to indicate whether pxb root bus will bypass iommu. By
default the bypass_iommu is disabled, and it can be enabled with:
qemu -device pxb-pcie,bus_nr=0x10,addr=0x1,bypass_iommu=true

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <1625748919-52456-3-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/pci_expander_bridge.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index aedded1064..7112dc3062 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -57,6 +57,7 @@ struct PXBDev {
 
     uint8_t bus_nr;
     uint16_t numa_node;
+    bool bypass_iommu;
 };
 
 static PXBDev *convert_to_pxb(PCIDevice *dev)
@@ -255,6 +256,7 @@ static void pxb_dev_realize_common(PCIDevice *dev, bool pcie, Error **errp)
     bus->map_irq = pxb_map_irq_fn;
 
     PCI_HOST_BRIDGE(ds)->bus = bus;
+    PCI_HOST_BRIDGE(ds)->bypass_iommu = pxb->bypass_iommu;
 
     pxb_register_bus(dev, bus, &local_err);
     if (local_err) {
@@ -301,6 +303,7 @@ static Property pxb_dev_properties[] = {
     /* Note: 0 is not a legal PXB bus number. */
     DEFINE_PROP_UINT8("bus_nr", PXBDev, bus_nr, 0),
     DEFINE_PROP_UINT16("numa_node", PXBDev, numa_node, NUMA_NODE_UNASSIGNED),
+    DEFINE_PROP_BOOL("bypass_iommu", PXBDev, bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


