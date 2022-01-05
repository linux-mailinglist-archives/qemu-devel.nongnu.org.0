Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5413D485A9E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 22:31:02 +0100 (CET)
Received: from localhost ([::1]:38190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Ds5-000487-E5
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 16:31:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlL-0001KY-HM; Wed, 05 Jan 2022 16:24:03 -0500
Received: from [2607:f8b0:4864:20::92c] (port=37808
 helo=mail-ua1-x92c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n5DlJ-0007rk-W8; Wed, 05 Jan 2022 16:24:03 -0500
Received: by mail-ua1-x92c.google.com with SMTP id o1so850770uap.4;
 Wed, 05 Jan 2022 13:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bec0Qs31pJHsOVrqHvP9qykT0AFW8y/bcWPkqZ4TOp0=;
 b=Ohj5b7iPxvo5Akz+8H1F+dm94UBn3OxiEQmMfaaD5mFVKR2eJOidabZUdybyH0IMt6
 z6jxt0DQ54n0OMDTxpKvTui5R4/Xb9//NJuqn90VT+tDDbVCHjXbPjO7YWfvhowvFWMT
 DXYFZUbW7WMI3VvGC+mtxQQ8BRpwTdl/qyHO3v2W5LFx3dSEwg9dau9yayj41dK5dJLv
 cXH4QNDGsawG5jrEOSoj8BJ5armmG2MZ46QbjTGaN1t32KJDuod288kbJTZHaglJP38b
 NZSdLFvWpo4rgdSlAhEKvugrcimcr8CeCIrOo1NWwUy0SbdrxSxjVGjYrMKQo+Zp69MN
 Q8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bec0Qs31pJHsOVrqHvP9qykT0AFW8y/bcWPkqZ4TOp0=;
 b=PSQ1pEFcSQzH/+dWSW4d+2t1KbXoFZlcSZ1nYl9Rz771SGo6i9yb0frA32yhK8Qimq
 RtRg4VeZ5xeTGzjwP1wf7AFakoRKP7rfAMdDTt9b3STfnkg4eFM+gRmCwazdj2FO8CG9
 OYUrbGON0jv6C6KR975rIlJV2W3cl/PL9mSKFujlpUXeNQz+Fg7CS2LTopcjKkYsn/FZ
 WKOcHYQYPrGwOfB8ubW2+el1as2MokMJOPUcajkSVH/ooFvPycXpr5ettbZMIJIZ6lNm
 GjhdUs+ZE8GyQjuY25k3TTVpHlMkjnKB1GVHxO+iUmsv9NS1XSV/wRPIZwilWkECjvem
 K68A==
X-Gm-Message-State: AOAM532Dttod77tKbdbxKaF1Q21f5uHRgdcO3kprxdONkxTR/PJeTNSB
 4GsbvrUYWf/GsQjhtd5KjCW86eCXaTI=
X-Google-Smtp-Source: ABdhPJzZCchv+6P8sgURdqccLA7HtRW9wmt+l07HspILrP/R6zDLTiCM2RYeCIhBBSFf3Dh/hTzDSg==
X-Received: by 2002:a05:6102:38ce:: with SMTP id
 k14mr17439488vst.70.1641417840832; 
 Wed, 05 Jan 2022 13:24:00 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m5sm65922vke.43.2022.01.05.13.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:24:00 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/18] pnv_phb4.c: make pnv-phb4-root-port user creatable
Date: Wed,  5 Jan 2022 18:23:24 -0300
Message-Id: <20220105212338.49899-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105212338.49899-1-danielhb413@gmail.com>
References: <20220105212338.49899-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We want to create only the absolutely minimal amount of devices when
running with -nodefaults. The root port is something that the machine
can boot up without. But, to do that, we need to provide a way for the
user to add them by hand.

This patch makes pnv-phb4-root-port user creatable and then uses the
pnv_phb_attach_root_port() helper to add a pnv_phb4_root_port only when
running with default settings.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4.c         | 18 +++++++-----------
 include/hw/pci-host/pnv_phb4.h |  2 --
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 836b0c156c..14827f8464 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -22,6 +22,7 @@
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "qom/object.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 
 #define phb_error(phb, fmt, ...)                                        \
@@ -1159,12 +1160,6 @@ static void pnv_phb4_instance_init(Object *obj)
 
     /* XIVE interrupt source object */
     object_initialize_child(obj, "source", &phb->xsrc, TYPE_XIVE_SOURCE);
-
-    /* Root Port */
-    object_initialize_child(obj, "root", &phb->root, TYPE_PNV_PHB4_ROOT_PORT);
-
-    qdev_prop_set_int32(DEVICE(&phb->root), "addr", PCI_DEVFN(0, 0));
-    qdev_prop_set_bit(DEVICE(&phb->root), "multifunction", false);
 }
 
 static void pnv_phb4_realize(DeviceState *dev, Error **errp)
@@ -1208,10 +1203,11 @@ static void pnv_phb4_realize(DeviceState *dev, Error **errp)
     pci_setup_iommu(pci->bus, pnv_phb4_dma_iommu, phb);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
-    /* Add a single Root port */
-    qdev_prop_set_uint8(DEVICE(&phb->root), "chassis", phb->chip_id);
-    qdev_prop_set_uint16(DEVICE(&phb->root), "slot", phb->phb_id);
-    qdev_realize(DEVICE(&phb->root), BUS(pci->bus), &error_fatal);
+    /* Add a single Root port if running with defaults */
+    if (defaults_enabled()) {
+        pnv_phb_attach_root_port(PCI_HOST_BRIDGE(phb),
+                                 TYPE_PNV_PHB4_ROOT_PORT);
+    }
 
     /* Setup XIVE Source */
     if (phb->big_phb) {
@@ -1369,7 +1365,7 @@ static void pnv_phb4_root_port_class_init(ObjectClass *klass, void *data)
     PCIERootPortClass *rpc = PCIE_ROOT_PORT_CLASS(klass);
 
     dc->desc     = "IBM PHB4 PCIE Root Port";
-    dc->user_creatable = false;
+    dc->user_creatable = true;
 
     device_class_set_parent_realize(dc, pnv_phb4_root_port_realize,
                                     &rpc->parent_realize);
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index 4a19338db3..ea63df9676 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -78,8 +78,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPHB4, PNV_PHB4)
 struct PnvPHB4 {
     PCIExpressHost parent_obj;
 
-    PnvPHB4RootPort root;
-
     uint32_t chip_id;
     uint32_t phb_id;
 
-- 
2.33.1


