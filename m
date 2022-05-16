Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2485291FC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:54:23 +0200 (CEST)
Received: from localhost ([::1]:60898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhjS-0007MY-TB
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfa-0004B1-Ae
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfV-00067S-9o
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PLHFEalNlKqumlMci78Jl5CbY0h9TorlDb5jQrCnN0s=;
 b=OjZGINeJ8N1HFSvR9vUPu+xl4y1lLoxQ2wq41R+kVz1IeFkYYplbWdCAGeCIt8Je5knfRG
 mLwSGpr2Bvc/ePEllnT5fdkybArJ4Kufwl6XVUZho72zxFbLOU+VGW8s4Ot0Oy20LEhclV
 gFaeJHnZfEQWnwohFJHEaoIhYEac6EU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-KuvKc8kjP-OHsD8jYsrRCA-1; Mon, 16 May 2022 16:50:15 -0400
X-MC-Unique: KuvKc8kjP-OHsD8jYsrRCA-1
Received: by mail-ej1-f71.google.com with SMTP id
 re25-20020a170906d8d900b006f50701fbefso6348826ejb.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PLHFEalNlKqumlMci78Jl5CbY0h9TorlDb5jQrCnN0s=;
 b=QRV9PqCx3gOcybLBjpK0st/RX9o93OqQRzxxW2sIPfO0ZjrREtRGGuEdME0yw5JjWk
 b79riVeUsyEGSuMKdV1tkqbuJjoww2dnE9dtwI5gVpjWFd7Lcuay/CiHed9/6FXAsPh9
 Izs3152B4IgDvocs0o+fxzhU9ecJ3814IbAbJr6euyd0df2CP9ny5RArC+TWSl7fwUqZ
 FWoV+v8hR8gq5/+609lEv9uoD11c3pMp/aiRjMbE5w8A5eB0YlcdSf5A0n3vetTUK8cM
 l5+dy4zucLuvMYrQJDr8Z+ZN+5ZMBU9epJK8ykpeNGU7PGwckzPhT0MWgO+vqltmz46a
 0UYg==
X-Gm-Message-State: AOAM531bPj01s3mB+En7HsKharmxXLw5gerIv6WK9qpK+Tty6W10SX/N
 LI9RPPSIDBSl1XGUde+yTnCH+ZLUVpuf2uVDSQxXKUsdFtzf06bFrbV65JNnKWcprGFgPE3pbNf
 QbfBhZXmJQttY//sGCup3pXAUVWVAJMgYt5JXByNKkDD85EMB7Ffc/hXYtMge
X-Received: by 2002:a17:907:3f8a:b0:6f4:3f00:b1e9 with SMTP id
 hr10-20020a1709073f8a00b006f43f00b1e9mr16996990ejc.59.1652734213822; 
 Mon, 16 May 2022 13:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjepjJFSnb+uJoU7hyspKkFgjkrDd5BJpW0/aGE4hCXZxELokaT2bqLpCd17YTKK9q2VEtZA==
X-Received: by 2002:a17:907:3f8a:b0:6f4:3f00:b1e9 with SMTP id
 hr10-20020a1709073f8a00b006f43f00b1e9mr16996949ejc.59.1652734213267; 
 Mon, 16 May 2022 13:50:13 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 en21-20020a17090728d500b006f3ef214e6csm142638ejc.210.2022.05.16.13.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:12 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Adam Manzanares <a.manzanares@samsung.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL v2 03/86] hw/pci/cxl: Add a CXL component type (interface)
Message-ID: <20220516204913.542894-4-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ben Widawsky <ben.widawsky@intel.com>

A CXL component is a hardware entity that implements CXL component
registers from the CXL 2.0 spec (8.2.3). Currently these represent 3
general types.
1. Host Bridge
2. Ports (root, upstream, downstream)
3. Devices (memory, other)

A CXL component can be conceptually thought of as a PCIe device with
extra functionality when enumerated and enabled. For this reason, CXL
does here, and will continue to add on to existing PCI code paths.

Host bridges will typically need to be handled specially and so they can
implement this newly introduced interface or not. All other components
should implement this interface. Implementing this interface allows the
core PCI code to treat these devices as special where appropriate.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Adam Manzanares <a.manzanares@samsung.com>
Message-Id: <20220429144110.25167-2-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h |  8 ++++++++
 hw/pci/pci.c         | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 3a32b8dd40..98f0d1b844 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -194,6 +194,8 @@ enum {
     QEMU_PCIE_LNKSTA_DLLLA = (1 << QEMU_PCIE_LNKSTA_DLLLA_BITNR),
 #define QEMU_PCIE_EXTCAP_INIT_BITNR 9
     QEMU_PCIE_EXTCAP_INIT = (1 << QEMU_PCIE_EXTCAP_INIT_BITNR),
+#define QEMU_PCIE_CXL_BITNR 10
+    QEMU_PCIE_CAP_CXL = (1 << QEMU_PCIE_CXL_BITNR),
 };
 
 #define TYPE_PCI_DEVICE "pci-device"
@@ -201,6 +203,12 @@ typedef struct PCIDeviceClass PCIDeviceClass;
 DECLARE_OBJ_CHECKERS(PCIDevice, PCIDeviceClass,
                      PCI_DEVICE, TYPE_PCI_DEVICE)
 
+/*
+ * Implemented by devices that can be plugged on CXL buses. In the spec, this is
+ * actually a "CXL Component, but we name it device to match the PCI naming.
+ */
+#define INTERFACE_CXL_DEVICE "cxl-device"
+
 /* Implemented by devices that can be plugged on PCI Express buses */
 #define INTERFACE_PCIE_DEVICE "pci-express-device"
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 9c58f02853..eb884adef9 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -200,6 +200,11 @@ static const TypeInfo pci_bus_info = {
     .class_init = pci_bus_class_init,
 };
 
+static const TypeInfo cxl_interface_info = {
+    .name          = INTERFACE_CXL_DEVICE,
+    .parent        = TYPE_INTERFACE,
+};
+
 static const TypeInfo pcie_interface_info = {
     .name          = INTERFACE_PCIE_DEVICE,
     .parent        = TYPE_INTERFACE,
@@ -2182,6 +2187,10 @@ static void pci_qdev_realize(DeviceState *qdev, Error **errp)
         pci_dev->cap_present |= QEMU_PCI_CAP_EXPRESS;
     }
 
+    if (object_class_dynamic_cast(klass, INTERFACE_CXL_DEVICE)) {
+        pci_dev->cap_present |= QEMU_PCIE_CAP_CXL;
+    }
+
     pci_dev = do_pci_register_device(pci_dev,
                                      object_get_typename(OBJECT(qdev)),
                                      pci_dev->devfn, errp);
@@ -2938,6 +2947,7 @@ static void pci_register_types(void)
     type_register_static(&pci_bus_info);
     type_register_static(&pcie_bus_info);
     type_register_static(&conventional_pci_interface_info);
+    type_register_static(&cxl_interface_info);
     type_register_static(&pcie_interface_info);
     type_register_static(&pci_device_type_info);
 }
-- 
MST


