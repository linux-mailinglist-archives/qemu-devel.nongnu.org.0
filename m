Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406E74509DF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:42:53 +0100 (CET)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf4E-00026G-9L
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:42:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0f-0003ru-Ot
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmf0d-0005JD-Tb
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J7h9UEgXNlCPSuADnaNZX+Ne/rmWtOMtPjje0QVsjLA=;
 b=NuayXI9O/gTdvI7dDzp7+hlSlLP1gQXGzJEovwAbgtZmeQ1zHuXw6GLnQuH1EzgjZeyjiy
 W3AWD3p6wzBEWgK0FpWbpRot5OWhtzNOx6lTV2hkuBZUDQ2CM4vmDAkk9OKZ36UYimc7lt
 2msOnRaGoZ17SEypEWShW7+5IaAArIQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-F-hhEFVeMUerVkftjsFSig-1; Mon, 15 Nov 2021 11:39:05 -0500
X-MC-Unique: F-hhEFVeMUerVkftjsFSig-1
Received: by mail-ed1-f70.google.com with SMTP id
 g3-20020a056402424300b003e2981e1edbso14636324edb.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J7h9UEgXNlCPSuADnaNZX+Ne/rmWtOMtPjje0QVsjLA=;
 b=B32sPuI50G2gY7FCapuzTwr9UfHAsnzqoDpsQUnZ4r8ilw3sm7dvdDJjQSfP3yJIFZ
 PVqXWPwF/lqJ2LvAWBfY9INhP5LiPpj+0FQqURtMMtdQ+Hl/8bSClazZOBR+oCzaSwBf
 MBBg4z56cIatJUT878vCFhZgpi3s3HgX1zl60SXD/Dsk+NFpVlhhVd05Llakt2qhNRh7
 +8/kMlZ0N7IRYQ+VprHyqAYF7Q/+cwBhK5NLABdC66zsinrQip21T12ja1cBdKTroheJ
 IZ5Jpd4jdnHs2lElNGBowupdZtV9/CznSNkqNsS8hzjWzT5nFZAz235rfOdLJK/Xq2wS
 OdKw==
X-Gm-Message-State: AOAM533lmEKGZGt4xctq6au37qSdv3r0pBz4XYcNaeeo2XazFwZHHDxH
 0qDcgJFbz4nmmrr3ay1hzyD9gkyJxxvAai2qtbAEohwlA/edBXyXrTxfNw1Y/QlUUuc+K1ZTBuu
 x3HEq31j/O0TXH5AEFtTCuwFsOIkSKVB7ELTYrWMFdoe3TTxMa9bQzo68vr7x
X-Received: by 2002:a17:906:6547:: with SMTP id
 u7mr402541ejn.544.1636994344277; 
 Mon, 15 Nov 2021 08:39:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwehhJOfen2ZwdC/xvmV2+lEdvCBW16yFX+wNRb4mwmoFuhRQHrVQMRVLMB9nh7tgTyB9gfUQ==
X-Received: by 2002:a17:906:6547:: with SMTP id
 u7mr402498ejn.544.1636994344074; 
 Mon, 15 Nov 2021 08:39:04 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id e4sm7090783ejs.13.2021.11.15.08.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:39:03 -0800 (PST)
Date: Mon, 15 Nov 2021 11:39:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/20] pcie: factor out pcie_cap_slot_unplug()
Message-ID: <20211115163607.177432-19-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20211111130859.1171890-5-kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pcie.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index b92dbff118..959bf074b2 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -497,6 +497,25 @@ static void pcie_unplug_device(PCIBus *bus, PCIDevice *dev, void *opaque)
     object_unparent(OBJECT(dev));
 }
 
+static void pcie_cap_slot_do_unplug(PCIDevice *dev)
+{
+    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
+    uint8_t *exp_cap = dev->config + dev->exp.exp_cap;
+    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
+
+    pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
+
+    pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
+                                 PCI_EXP_SLTSTA_PDS);
+    if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
+        (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
+        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_LNKSTA,
+                                     PCI_EXP_LNKSTA_DLLLA);
+    }
+    pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
+                               PCI_EXP_SLTSTA_PDC);
+}
+
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp)
 {
@@ -676,7 +695,6 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
     uint32_t pos = dev->exp.exp_cap;
     uint8_t *exp_cap = dev->config + pos;
     uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
-    uint32_t lnkcap = pci_get_long(exp_cap + PCI_EXP_LNKCAP);
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
         /*
@@ -726,17 +744,7 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         (val & PCI_EXP_SLTCTL_PIC_OFF) == PCI_EXP_SLTCTL_PIC_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
         (old_slt_ctl & PCI_EXP_SLTCTL_PIC_OFF) != PCI_EXP_SLTCTL_PIC_OFF)) {
-        PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
-        pci_for_each_device_under_bus(sec_bus, pcie_unplug_device, NULL);
-        pci_word_test_and_clear_mask(exp_cap + PCI_EXP_SLTSTA,
-                                     PCI_EXP_SLTSTA_PDS);
-        if (dev->cap_present & QEMU_PCIE_LNKSTA_DLLLA ||
-            (lnkcap & PCI_EXP_LNKCAP_DLLLARC)) {
-            pci_word_test_and_clear_mask(exp_cap + PCI_EXP_LNKSTA,
-                                         PCI_EXP_LNKSTA_DLLLA);
-        }
-        pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTSTA,
-                                       PCI_EXP_SLTSTA_PDC);
+        pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
 
-- 
MST


