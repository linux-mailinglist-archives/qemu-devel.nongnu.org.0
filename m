Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CC62CD3D8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:38:52 +0100 (CET)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkm0g-0002rm-P1
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kklwp-0007GL-Tp
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:34:51 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:33836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kklwn-0003By-5h
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 05:34:51 -0500
Received: by mail-lj1-x242.google.com with SMTP id y16so2005379ljk.1
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 02:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTIXK8Mp2m2AMw0jbqYrjv2kNQYnyeKPV4gyIZ7wxG8=;
 b=vU3GuyH/tfxOSSZULHRmFzZF81jyNUyeFUE2hC0exfWnUw0aLqjnoR6cJpHME8uwxp
 RGz4viDeqi+YAiN4mp65Pe1vsxCCZf79HElFAwmUSN8X7tGOm8VRyMte3F7/jS96yFNG
 6qe3f2CZuGzyoHd1AD+r3YUQVI5lZeAxH7d65HCr8lq6DrIwb7hMdl893bZooaeufwPv
 c2BPDnjoLp94//fBOmvTAqnEqB9bUH12CDbQ/rqn/cNR83f5W0JHT5W1PDjueFZQBmOP
 JKpLJRTL8sE6teCC8BIUC5D45O3x5lChzNJiPrNJzkCGxQwaxV1aIQPmeDKVjcdthAcW
 /FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTIXK8Mp2m2AMw0jbqYrjv2kNQYnyeKPV4gyIZ7wxG8=;
 b=sJ1z5In7f0sexJS+4GSJEz1oxYAb9o1lKyShawdMO4tzd0zh3TrNka3GRqPzwWOnG0
 41iAag74Y8VjV1GufTIUAKRm68OGIm9aVNLkXJGcJKwR621c1AXFkCQdHjO90fZR3QE/
 FKDEEqhg91OblEaZzvCqn7f1T/UFDJBZTW2In0d9+4Da+IsOt3/nb00nzfHg5wuJ4KuF
 BXxh5yypizCiCZl2poET+FpPw1GBnHKU2ldE/IL/u7ZpW+XA3quw/EODu/y6Uz6Ti9SW
 0dGmzU6cNrwoLZAqrpHZkfOfYk5A4y5FTOyvtGE9w/v+IZ3/FiBZDOg8Z1tSigkFo/4D
 iOiw==
X-Gm-Message-State: AOAM532RoGHuECXpPi9ITy/C5sN89ayFPOW6W/+PiNAGUBOw9Y3vxvOa
 2DUgzAjWOs9KPIw7i8MuDyRHeVbJSyiv+g==
X-Google-Smtp-Source: ABdhPJz794nwu0Kiw4AFEa0L71KBvDdyOoDwvy80rui1I6hp3/qOJT4ViZarri9+mUPyO6IhqPGYZA==
X-Received: by 2002:a2e:580d:: with SMTP id m13mr1009453ljb.141.1606991687192; 
 Thu, 03 Dec 2020 02:34:47 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id q129sm281361ljb.81.2020.12.03.02.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 02:34:46 -0800 (PST)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] hw/virtio-pci Added AER capability.
Date: Thu,  3 Dec 2020 13:07:13 +0200
Message-Id: <20201203110713.204938-3-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203110713.204938-1-andrew@daynix.com>
References: <20201203110713.204938-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::242;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x242.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Added AER capability for virtio-pci devices.
Also added property for devices, by default AER is disabled.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/virtio/virtio-pci.c | 16 ++++++++++++++++
 hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 20 insertions(+)

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
-- 
2.29.2


