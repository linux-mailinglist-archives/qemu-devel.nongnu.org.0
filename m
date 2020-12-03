Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E872CD65C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 14:07:59 +0100 (CET)
Received: from localhost ([::1]:44058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkoL0-0003EL-0g
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 08:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kko6Q-0004RY-EE
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:52:54 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e]:41081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kko6K-0008LB-Ki
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 07:52:54 -0500
Received: by mail-lj1-x22e.google.com with SMTP id y7so2377417lji.8
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 04:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FTIXK8Mp2m2AMw0jbqYrjv2kNQYnyeKPV4gyIZ7wxG8=;
 b=DHHGScHIEY4eeaYDHRrLaWRaPURzlxOs2Qt3/jxPJ6VJwmbNEg4BXXU0QyM8CcTqwy
 UJpv+4nSRYB/3838yNsBmM2+Smw4c3iQZt7wGNgkcNPDaYAFZV/QMSnmofrgQ1EEw4lK
 /oIPm5GSc0qAFxjydCMzZvqHvEsVtuQZquP5V2+LmxlzBdYDBhUi+3d4lom6WhWA0sjZ
 0e0PBg+VjD97axM4lFdWdvX7qhzzGleU30J0k+KElA8cnB/3QwMORc8WmaTFSK8JQe2p
 jTxrUzTW+HVKKXLl3ALxZUizt+0HUEsGG50JX09tipY40Djp0necYZfByW3MT7kCfv1B
 SXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FTIXK8Mp2m2AMw0jbqYrjv2kNQYnyeKPV4gyIZ7wxG8=;
 b=QTvd5uRgPWbPLTrG7SpzMCyJMCe6LGIfdQgh15hFOlJz2kYcdWCA+tZR2R2NMh5Hkr
 GvwDMSz8/Rnu+BTSAyjdZtiISKEco6mff/9R77xF2Nhp0BJYp0+I8sCp+rhzpiKKeUcj
 CYQGXO0skkWwdycAHCYvgzOikOALEgPUW3NxYiKTAxyT9FloougPcjnmoaRDQ6bNjn77
 48ZZgDy+uK8Ij9FyYbMxJdUCHVwPWF+sqtDwJq6BkcZ+//vdvmZVWCkUQIO05E8tngOG
 i0G6qMt8FdcvdY4CD+GnhDBcV3Qvm0NQqBXiyIk2Qu5uqYKhPaEPTKqOkN5kzcJTefoK
 Cl9w==
X-Gm-Message-State: AOAM531T5HvbI85Ec4pMBRziU+Se2Os7f1EWkunbkwar6qVcEiNIu+WD
 Bv38huzfFzllCDwWuEjTdEhsIQUwIir4hg==
X-Google-Smtp-Source: ABdhPJxn1bvdWXhv3IKmZGiLEM1k3xmR58U7g0UqRt9c+jaSnwAF76IK04kNNB5wYuoxCuQzagpPEA==
X-Received: by 2002:a05:651c:1033:: with SMTP id
 w19mr1201668ljm.55.1606999966900; 
 Thu, 03 Dec 2020 04:52:46 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id b17sm499891lfc.93.2020.12.03.04.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 04:52:46 -0800 (PST)
From: Andrew Melnychenko <andrew@daynix.com>
To: mst@redhat.com
Subject: [PATCH v4 2/2] hw/virtio-pci Added AER capability.
Date: Thu,  3 Dec 2020 15:25:17 +0200
Message-Id: <20201203132517.220811-3-andrew@daynix.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203132517.220811-1-andrew@daynix.com>
References: <20201203132517.220811-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22e;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22e.google.com
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
Cc: intel-wired-lan@lists.osuosl.org, qemu-devel@nongnu.org,
 alexander.duyck@gmail.com
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


