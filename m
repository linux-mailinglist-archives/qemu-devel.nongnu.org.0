Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB4283297
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 10:54:27 +0200 (CEST)
Received: from localhost ([::1]:44254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPMGI-0006bn-GW
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 04:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kPLtS-0007r6-HH
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 04:30:50 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:33292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kPLtO-0008Of-IQ
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 04:30:50 -0400
Received: by mail-lf1-x141.google.com with SMTP id 77so9844990lfj.0
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bGpHgmFALb5nN7cwzPzCKDIbrvSvN3WF59KON2eM8BU=;
 b=m5ZapRUEGC9lr9pL6OTuH1DAZnc9qZSrcixSiDUAEMBFA2zcriFUbBfUAMbe7l3oQZ
 HQGT20le7AwB/8MCFM0+qbLbCETBkiH0DVR2DRPgE5U/aYZvn1C06AU735tnFYjaSR3U
 WQNagGxdFX7GUoUjROaIW6uZPQdnYqplHwT+bhjS4eG26qN/OKTHl+06jOrAppFs9KuQ
 CMlAtBBB2ZKptJxxqvELcMJohmvOhVgomcA4JPWnkA0CKlucJKJI75mtzAZTOcI5W+xW
 re7jY9jJ3sS8/TE5rhtiq3uJyi9jQhPfJm0zZcOOOG00DIBqxNVDDEjpduAJPYFYwy5I
 vdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bGpHgmFALb5nN7cwzPzCKDIbrvSvN3WF59KON2eM8BU=;
 b=j+GhMI9awVGLx914Hca2tnSbhtOXrXfDIWM/H8WLCBkRtm2PTCwD0UXGP6waX7vY3n
 K4nbagd8ZoJx+C8pynRTFi8CMmu+lVyOqM7u/YRbeqhUuoJcggfm67oFemlBf1RdksMX
 Dbm+5FylidY8I83pdYs0C3gL5R0o3BYXJEo32XrhmrhaAKU3NZty8zoX0pOeHUkPUKSd
 WuzOzPp5vOJhqXnw5/GE6kjMOizVIeb7Fydpvqn97al3zqNAFwxNy85wXdjHaYlD0BT3
 0SbQfuRqOWN0b/Bj6H3KAJupRbPr8ki21s5kprOQBzCDdzjY0wgki7mlR1XokrntCpTw
 rTfg==
X-Gm-Message-State: AOAM530enEmUb9qzoX0sI4dV8er468PLteOLU1Am+BchYC7mGnl1bznc
 kWO9lYzUixX1y+FzqbRFLQeyMzv3+uNLDg==
X-Google-Smtp-Source: ABdhPJy4TerNR8Brc/L67h4p37/AM1OerC0p9GwGISmphizgcdhnpqPUVVlALA2g1tryD2K6hvgHoA==
X-Received: by 2002:ac2:4c19:: with SMTP id t25mr4928931lfq.375.1601886642423; 
 Mon, 05 Oct 2020 01:30:42 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id o27sm2585693lfb.306.2020.10.05.01.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 01:30:41 -0700 (PDT)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] hw/virtio-pci Added AER capability.
Date: Mon,  5 Oct 2020 12:01:40 +0300
Message-Id: <20201005090140.90461-3-andrew@daynix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005090140.90461-1-andrew@daynix.com>
References: <20201005090140.90461-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::141;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew <andrew@daynix.com>

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1857668
Added AER capability for virtio-pci devices.
Also added property for devices, by default AER is enabled.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/virtio/virtio-pci.c | 16 ++++++++++++++++
 hw/virtio/virtio-pci.h |  4 ++++
 2 files changed, 20 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index ae60c1e249..e0a7936f9c 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1807,6 +1807,12 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
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
@@ -1848,7 +1854,15 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
 
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
@@ -1901,6 +1915,8 @@ static Property virtio_pci_properties[] = {
                     VIRTIO_PCI_FLAG_INIT_PM_BIT, true),
     DEFINE_PROP_BIT("x-pcie-flr-init", VirtIOPCIProxy, flags,
                     VIRTIO_PCI_FLAG_INIT_FLR_BIT, true),
+    DEFINE_PROP_BIT("aer", VirtIOPCIProxy, flags,
+                    VIRTIO_PCI_FLAG_AER_BIT, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index 91096f0291..3986b4f0e3 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -45,6 +45,7 @@ enum {
     VIRTIO_PCI_FLAG_INIT_LNKCTL_BIT,
     VIRTIO_PCI_FLAG_INIT_PM_BIT,
     VIRTIO_PCI_FLAG_INIT_FLR_BIT,
+    VIRTIO_PCI_FLAG_AER_BIT,
 };
 
 /* Need to activate work-arounds for buggy guests at vmstate load. */
@@ -84,6 +85,9 @@ enum {
 /* Init Function Level Reset capability */
 #define VIRTIO_PCI_FLAG_INIT_FLR (1 << VIRTIO_PCI_FLAG_INIT_FLR_BIT)
 
+/* Advanced Error Reporting capability */
+#define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
+
 typedef struct {
     MSIMessage msg;
     int virq;
-- 
2.28.0


