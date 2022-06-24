Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4315595F2
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 11:02:54 +0200 (CEST)
Received: from localhost ([::1]:45324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fDJ-0001Nd-Sn
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 05:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0Z-0002E1-2U; Fri, 24 Jun 2022 04:49:43 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:41812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o4f0X-0000CK-Dv; Fri, 24 Jun 2022 04:49:42 -0400
Received: by mail-oi1-x22f.google.com with SMTP id p8so2758772oip.8;
 Fri, 24 Jun 2022 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWy0lkm9Xc2foRamwae3TbQ9l1w1N3kYaFZTCiYTRwg=;
 b=VjHMf8imqcCoQlx/3C2fk9z8qZ62lrlJVTYJ440oYojg4sbrJAxTdxhuFW7IiCjw0o
 Cn0jdvHQ2zF0MNX/3u8pZoPVuMltEBlbya1sjlGcPVmcWr4oynvnyHwA6oZ0wuOngwho
 Tfo445YwTnMY3FX1Z83f9eiuHq3MovvEL45aLF/fBkhJIXmIqSKn6n/BAymZ68xLqh+s
 rlC+eofNqtZQlvImHbSPLXCb+DxH2g5H4PoR+qrsLoIJ8UaL8HxlN+RbSax4b8bOKqKf
 rxaglUL3WYp97hExrD/83drypOz7H2/N3ADI0jpAY2N/NC77LpfO/D06eERoYY/N7Msg
 ezyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWy0lkm9Xc2foRamwae3TbQ9l1w1N3kYaFZTCiYTRwg=;
 b=3sNKIW6gl+O1grJQKwZWeDVhd0v45JQyK9xoe25HQiYK7cmtRFLf/AJ06+cFsCNav4
 TDsyXbUVmEx3hYQsbSeYZz9TXs114LMNH4JUBFTlhAmiNx/I70ZGXnU2dQ2GUpqALG3x
 3AjwOSeo2W8R4BKvh1JQ9ny+/Ecik7tVRYJNRpVpUlbVrBoeM5lJ1+vd4TyLUmYhM/Y4
 +1hIo50CwkrMjAw2sb3ZuQ5ibckuquWLv1dDq3xbl4LRn/AsknaSP64D+pub/ntvCN1d
 tR0LQ0z8rtod0QVCZ7CK1V9hhhkPriUDSw3xFiixnQ/Znxc+JVIOSEWr8deKgPUwzzJd
 Nw7Q==
X-Gm-Message-State: AJIora+FQSJiOpsQqF0kMeA9jP+fKurEYeNtXhVNHSZB1IZUoEt7aIIl
 UqiehjRRHeGF5McUax3qOEeuQSNFwN0=
X-Google-Smtp-Source: AGRyM1tBGRwNnQG1aAVFNYlGuvkzsLwhE/6v+8E+W3k7TiTmHmEpHV7Vo6oBEf9HlDdZGhO5Zyy+Dw==
X-Received: by 2002:a05:6808:e87:b0:32e:3cfb:fad7 with SMTP id
 k7-20020a0568080e8700b0032e3cfbfad7mr1268466oil.197.1656060579635; 
 Fri, 24 Jun 2022 01:49:39 -0700 (PDT)
Received: from balboa.ibmmodules.com ([191.193.1.105])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a056830230800b0061698ef90e5sm1192768ote.31.2022.06.24.01.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:49:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org, fbarrat@linux.ibm.com,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v3 06/12] ppc/pnv: add pnv-phb-root-port device
Date: Fri, 24 Jun 2022 05:49:15 -0300
Message-Id: <20220624084921.399219-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624084921.399219-1-danielhb413@gmail.com>
References: <20220624084921.399219-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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
 hw/pci-host/pnv_phb.c | 115 +++++++++++++++++++++++++++++++++++++++---
 hw/pci-host/pnv_phb.h |  16 ++++++
 2 files changed, 123 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/pnv_phb.c b/hw/pci-host/pnv_phb.c
index abcbcca445..5e61f85614 100644
--- a/hw/pci-host/pnv_phb.c
+++ b/hw/pci-host/pnv_phb.c
@@ -112,15 +112,114 @@ static void pnv_phb_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
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
+    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
+    PCIDevice *d = PCI_DEVICE(dev);
+    uint8_t *conf = d->config;
 
+    rpc->parent_reset(dev);
+
+    if (phb_rp->version == 3) {
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
+    PnvPHBRootPort *phb_rp = PNV_PHB_ROOT_PORT(dev);
+    PCIDevice *pci = PCI_DEVICE(dev);
+    uint16_t device_id = 0;
+    Error *local_err = NULL;
+
+    rpc->parent_realize(dev, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    switch (phb_rp->version) {
+    case 3:
+        device_id = PNV_PHB3_DEVICE_ID;
+        break;
+    case 4:
+        device_id = PNV_PHB4_DEVICE_ID;
+        break;
+    case 5:
+        device_id = PNV_PHB5_DEVICE_ID;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    pci_config_set_device_id(pci->config, device_id);
+    pci_config_set_interrupt_pin(pci->config, 0);
+}
+
+static Property pnv_phb_root_port_properties[] = {
+    DEFINE_PROP_UINT32("version", PnvPHBRootPort, version, 0),
+
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void pnv_phb_root_port_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+    PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
+
+    dc->desc     = "IBM PHB PCIE Root Port";
+
+    device_class_set_props(dc, pnv_phb_root_port_properties);
+    device_class_set_parent_realize(dc, pnv_phb_root_port_realize,
+                                    &rpc->parent_realize);
+    device_class_set_parent_reset(dc, pnv_phb_root_port_reset,
+                                  &rpc->parent_reset);
+    dc->reset = &pnv_phb_root_port_reset;
+    dc->user_creatable = false;
+
+    k->vendor_id = PCI_VENDOR_ID_IBM;
+    /* device_id will be written during realize() */
+    k->device_id = 0;
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
index a7cc8610e2..58ebd6dd0f 100644
--- a/hw/pci-host/pnv_phb.h
+++ b/hw/pci-host/pnv_phb.h
@@ -36,4 +36,20 @@ struct PnvPHB {
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
+OBJECT_DECLARE_SIMPLE_TYPE(PnvPHBRootPort, PNV_PHB_ROOT_PORT)
+
 #endif /* PCI_HOST_PNV_PHB_H */
-- 
2.36.1


