Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0802D4A1F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:30:14 +0100 (CET)
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5AD-0005j8-US
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:30:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3wb-0005PS-Lv
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:12:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3wY-0000q3-Bj
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:12:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ldhJvkXwpC1AJIX4EnOROCgga2KEj6qRDx4npB7g4RI=;
 b=hp6vAAFsSqCayyXbV5B/zlcuB7+cXDDg649SvnUxKarcmdoDGdItRI9kFzl+mMtMJOiFt4
 vcLzVgiLzK63mw/jBqZpgRKj5uNM+Bq01OmgQxBNMCaltbfacmx6FOlQm64kDQtV3uW5bS
 bqRZMdn1x4NebkjufSed/wFm9dLYj1c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-J0ZY2GidNrCsiyTpeeVGlA-1; Wed, 09 Dec 2020 13:11:58 -0500
X-MC-Unique: J0ZY2GidNrCsiyTpeeVGlA-1
Received: by mail-wm1-f69.google.com with SMTP id q17so643446wmc.1
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ldhJvkXwpC1AJIX4EnOROCgga2KEj6qRDx4npB7g4RI=;
 b=JMNjeU+jcEWU4ebawclSOotg22b1o8NQf40R4psJiXJIwXIALjz4DGiwMQTnodRB2C
 VLZ+660tKo52ev60//xpUC+yoiVZVqwWgVm2wMWozo9MQWjXIw0jFzjQTsvJBiri+Axn
 DsmCMFMP78X+eztP2XUK6UcWi7ulfxgpuhUFXWvcVjMtryB4ALfddg+3iHAeYZ+Ib5cP
 /Y0r76qucFFQDaoaQ/TRTzBrWzkHakwCDHBTq6Kn5Y5vcpn9MSy4M7mCfThe2V5Fht1V
 mttkLRuQ2WkNikDEmuIRok1jw1z99dnCHkwPFCCj/N//QZAJGUZatoNZ7zVxkL3XXSZ4
 E5nw==
X-Gm-Message-State: AOAM530E6VAIedVXPClJXE8KZ/42OZR46ugJHr0vVMNRxqHXhpilI/zc
 rDZuLyw1LWgpiYTZ96Qf2DiGLyP5xURSgEMAM6eLQnu12aoyjGW7J72tmd6kmyO8BOCnaOqRACN
 Uani0sKHL/WnIIRxrMvqelFh5Q9PoTuammilllQbqgjr3n0oj6g/04HxNSsQv
X-Received: by 2002:a1c:df0a:: with SMTP id w10mr4146225wmg.114.1607537516736; 
 Wed, 09 Dec 2020 10:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+vPKivbyaEdUQj1bnsLdYd7uHDMl1JNl5V2xwP3NaoWBJN4ZTmuS5EJbdxOiBPTXgI2yi+A==
X-Received: by 2002:a1c:df0a:: with SMTP id w10mr4146196wmg.114.1607537516444; 
 Wed, 09 Dec 2020 10:11:56 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id d16sm5389254wrw.17.2020.12.09.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:55 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:48 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 65/65] hw/virtio-pci Added AER capability.
Message-ID: <20201209180546.721296-66-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Andrew Melnychenko <andrew@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Added AER capability for virtio-pci devices.
Also added property for devices, by default AER is disabled.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Message-Id: <20201203110713.204938-3-andrew@daynix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.h |  4 ++++
 hw/virtio/virtio-pci.c | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 06e2af12de..d7d5d403a9 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -41,6 +41,7 @@ enum {
     VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
     VIRTIO_PCI_FLAG_INIT_PM_BIT,
     VIRTIO_PCI_FLAG_INIT_FLR_BIT,
+    VIRTIO_PCI_FLAG_AER_BIT,
 };
 
 /* Need to activate work-arounds for buggy guests at vmstate load. */
@@ -80,6 +81,9 @@ enum {
 /* Init Function Level Reset capability */
 #define VIRTIO_PCI_FLAG_INIT_FLR (1 << VIRTIO_PCI_FLAG_INIT_FLR_BIT)
 
+/* Advanced Error Reporting capability */
+#define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
+
 typedef struct {
     MSIMessage msg;
     int virq;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ceaa233129..f863f69ede 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1817,6 +1817,12 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
          */
         pci_set_word(pci_dev->config + pos + PCI_PM_PMC, 0x3);
 
+        if (proxy->flags & VIRTIO_PCI_FLAG_AER) {
+            pcie_aer_init(pci_dev, PCI_ERR_VER, last_pcie_cap_offset,
+                          PCI_ERR_SIZEOF, NULL);
+            last_pcie_cap_offset += PCI_ERR_SIZEOF;
+        }
+
         if (proxy->flags & VIRTIO_PCI_FLAG_INIT_DEVERR) {
             /* Init error enabling flags */
             pcie_cap_deverr_init(pci_dev);
@@ -1858,7 +1864,15 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
 static void virtio_pci_exit(PCIDevice *pci_dev)
 {
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(pci_dev);
+    bool pcie_port = pci_bus_is_express(pci_get_bus(pci_dev)) &&
+                     !pci_bus_is_root(pci_get_bus(pci_dev));
+
     msix_uninit_exclusive_bar(pci_dev);
+    if (proxy->flags & VIRTIO_PCI_FLAG_AER && pcie_port &&
+        pci_is_express(pci_dev)) {
+        pcie_aer_exit(pci_dev);
+    }
 }
 
 static void virtio_pci_reset(DeviceState *qdev)
@@ -1911,6 +1925,8 @@ static Property virtio_pci_properties[] = {
                     VIRTIO_PCI_FLAG_INIT_PM_BIT, true),
     DEFINE_PROP_BIT("x-pcie-flr-init", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),
+    DEFINE_PROP_BIT("aer", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_AER_BIT, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


