Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E0539932
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 00:00:54 +0200 (CEST)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw9v3-0000mX-LC
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 18:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kQ-0001SG-J4; Tue, 31 May 2022 17:49:54 -0400
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:37627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nw9kO-0003PD-Mn; Tue, 31 May 2022 17:49:54 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so10496512otu.4; 
 Tue, 31 May 2022 14:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8EdwNlLwAv/4LMWXYKNJDQVdPyRBp++9dLk5EU9vCP4=;
 b=XTgzGtAKx3O/WEfyYHiZAVAg/39st7obHyNNOuMhkzSnCfO7aYONmSVTECTXA0hX28
 Anwi24lDfpAcUYpbclZhDclYlQHirc3IQ/DhHrlKkiQb664l45fNAZWT8RWuPOCmqM5v
 S0jBSBjcaccGdct41t4lj4DRFvOYnomBhL7TIzvvp9zJ4PdU8fZJFaoauYvE4TuVL5N7
 s0QIC31GLxdxLMoaO6cRZqUIZB1Ef9lyaGQqlnrMrSTFrT9JbzJaLawj2h8/8qUXXP0w
 Nfhbv4SbCSdMQy68svwviKqswMqduyQQFtZ8beacCgkKpZ2qeb7fkz2pWrvB4vfjf2OV
 RLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EdwNlLwAv/4LMWXYKNJDQVdPyRBp++9dLk5EU9vCP4=;
 b=VP+rdZvqXtsHQzCFF+J1RV2iYJ9QQwEY4ynfmAVmo9aCKveYWK9ZKmNxRiu9hC3hIt
 lA+bh6ze8v9b/lgXgJDkzPFiqPf1vknegy8+giqpc8PBPuvwNmQX725ZFxPVUMU6HFfH
 yAgR/SKD9n9gUS5/IkQLLgTRIUx5P1IDDq6Oi9qEAX4R5F1witUvWiQ9eHDr9KWgywsJ
 ook7fqr4LaW+AuMnbQqXvIpWbuDeeKdtjb8JaohgcAn6CzC+yNC/YtKxjaoN1O1VPeE5
 gwlcLKrgk3DjVXE8vn0aabti895QW2hDAW9R76z1ZHj7w4gePH6WjJXaGIolY6KIvaJT
 z9WA==
X-Gm-Message-State: AOAM531uQnNutPR1O+0SH5bZjInUJlRMbxD2NgfcJT6YzPyeaJvntgls
 qEbrRy/61+WpglYEtpVwzJ4RXPUw9JLhRQ==
X-Google-Smtp-Source: ABdhPJxoZJiH1UK+dR1Wz9MRU7yf69ZpI+VaR1zfTt9xTX84Eb11bXgoUEzl3nbrF06Hs3gDt681+Q==
X-Received: by 2002:a9d:7457:0:b0:60b:18f3:419e with SMTP id
 p23-20020a9d7457000000b0060b18f3419emr16839104otk.183.1654033791009; 
 Tue, 31 May 2022 14:49:51 -0700 (PDT)
Received: from balboa.COMFAST ([152.250.93.219])
 by smtp.gmail.com with ESMTPSA id
 pd19-20020a0568701f1300b000f333ac991fsm3476988oab.27.2022.05.31.14.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 14:49:50 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au, clg@kaod.org,
 mark.cave-ayland@ilande.co.uk, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 11/16] ppc/pnv: add pnv-phb-root-port device
Date: Tue, 31 May 2022 18:49:12 -0300
Message-Id: <20220531214917.31668-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531214917.31668-1-danielhb413@gmail.com>
References: <20220531214917.31668-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

We have two very similar root-port devices, pnv-phb3-root-port and
pnv-phb4-root-port. Both consist of a wrapper around the PCIESlot device
that, until now, has no additional attributes.

The main difference between the PHB3 and PHB4 root ports is that
pnv-phb4-root-port has the pnv_phb4_root_port_reset() callback. All
other differences can be merged in a single device without too much
trouble.

This patch introduces the unified pnv-phb-root-port that, in time, will
be used as the default root port for the pnv-phb device.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb.c | 107 ++++++++++++++++++++++++++++++++++++++----
 hw/pci-host/pnv_phb.h |  17 +++++++
 2 files changed, 116 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index 321c4e768a..5047e90d3a 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -114,15 +114,106 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = true;
 }
 
-static void pnv_phb_register_type(void)
+static void pnv_phb_root_port_reset(DeviceState *dev)
 {
-    static const TypeInfo pnv_phb_type_info = {
-        .name          = TYPE_PNV_PHB,
-        .parent        = TYPE_PCIE_HOST_BRIDGE,
-        .instance_size = sizeof(PnvPHB),
-        .class_init    = pnv_phb_class_init,
-    };
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    PnvPHBRootPort *rootport = PNV_PHB_ROOT_PORT(dev);
+    PCIDevice *d = PCI_DEVICE(dev);
+    uint8_t *conf = d->config;
 
+    rpc->parent_reset(dev);
+
+    if (rootport->version == 3) {
+        return;
+    }
+
+    /* PHB4 and later requires these extra reset steps */
+    pci_byte_test_and_set_mask(conf + PCI_IO_BASE,
+                               PCI_IO_RANGE_MASK & 0xff);
+    pci_byte_test_and_clear_mask(conf + PCI_IO_LIMIT,
+                                 PCI_IO_RANGE_MASK & 0xff);
+    pci_set_word(conf + PCI_MEMORY_BASE, 0);
+    pci_set_word(conf + PCI_MEMORY_LIMIT, 0xfff0);
+    pci_set_word(conf + PCI_PREF_MEMORY_BASE, 0x1);
+    pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
+    pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
+    pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
+    pci_config_set_interrupt_pin(conf, 0);
+}
+
+static void pnv_phb_root_port_realize(DeviceState *dev, Error **errp)
+{
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_GET_CLASS(dev);
+    PCIDevice *pci = PCI_DEVICE(dev);
+    PCIBus *bus = pci_get_bus(pci);
+    PnvPHB *phb = NULL;
+    Error *local_err = NULL;
+
+    phb = (PnvPHB *) object_dynamic_cast(OBJECT(bus->qbus.parent),
+                                          TYPE_PNV_PHB);
+
+    if (!phb) {
+        error_setg(errp,
+"pnv_phb_root_port devices must be connected to pnv-phb buses");
+        return;
+    }
+
+    /* Set unique chassis/slot values for the root port */
+    qdev_prop_set_uint8(&pci->qdev, "chassis", phb->chip_id);
+    qdev_prop_set_uint16(&pci->qdev, "slot", phb->phb_id);
+
+    rpc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    pci_config_set_interrupt_pin(pci->config, 0);
+}
+
+static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
+
+    dc->desc     = "IBM PHB PCIE Root Port";
+
+    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
+                                    &rpc->parent_realize);
+
+    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
+                                  &rpc->parent_reset);
+    dc->reset = &pnv_phb_root_port_reset;
+
+    dc->user_creatable = true;
+
+    k->vendor_id = PCI_VENDOR_ID_IBM;
+    /* device_id represents the latest PHB root port version supported */
+    k->device_id = PNV_PHB5_DEVICE_ID;
+    k->revision  = 0;
+
+    rpc->exp_offset = 0x48;
+    rpc->aer_offset = 0x100;
+}
+
+static const TypeInfo pnv_phb_type_info = {
+    .name          = TYPE_PNV_PHB,
+    .parent        = TYPE_PCIE_HOST_BRIDGE,
+    .instance_size = sizeof(PnvPHB),
+    .class_init    = pnv_phb_class_init,
+};
+
+static const TypeInfo pnv_phb_root_port_info = {
+    .name          = TYPE_PNV_PHB_ROOT_PORT,
+    .parent        = TYPE_PCIE_ROOT_PORT,
+    .instance_size = sizeof(PnvPHBRootPort),
+    .class_init    = pnv_phb_root_port_class_init,
+};
+
+static void pnv_phb_register_types(void)
+{
     type_register_static(&pnv_phb_type_info);
+    type_register_static(&pnv_phb_root_port_info);
 }
-type_init(pnv_phb_register_type)
+
+type_init(pnv_phb_register_types)
diff --git a/hw/pci-host/pnv_phb.h b/hw/pci-host/pnv_phb.h
index a7cc8610e2..c8eab4b767 100644
--- a/hw/pci-host/pnv_phb.h
+++ b/hw/pci-host/pnv_phb.h
@@ -36,4 +36,21 @@ struct PnvPHB {
 #define TYPE_PNV_PHB "pnv-phb"
 OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB, PNV_PHB)
 
+/*
+ * PHB PCIe Root port
+ */
+#define PNV_PHB3_DEVICE_ID         0x03dc
+#define PNV_PHB4_DEVICE_ID         0x04c1
+#define PNV_PHB5_DEVICE_ID         0x0652
+
+typedef struct PnvPHBRootPort {
+    PCIESlot parent_obj;
+
+    uint32_t version;
+} PnvPHBRootPort;
+
+#define TYPE_PNV_PHB_ROOT_PORT "pnv-phb-root-port"
+#define PNV_PHB_ROOT_PORT(obj) \
+    OBJECT_CHECK(PnvPHBRootPort, obj, TYPE_PNV_PHB_ROOT_PORT)
+
 #endif /* PCI_HOST_PNV_PHB_H */
-- 
2.36.1


