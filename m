Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874856F4E24
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 02:29:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu0Lo-0006cH-BR; Tue, 02 May 2023 20:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pu0Lk-0006c0-KM
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pu0Li-0005As-R4
 for qemu-devel@nongnu.org; Tue, 02 May 2023 20:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683073679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZK2bo3/a+2Qalv77ZLbddzKFbAME13YjAwyPO125H7Q=;
 b=WVKcbgbOVV9YfG2cKxyMgXymV/Ja/smbt6B9Okf3egWpnkOrxQv2LKvAu0wPAB9Hw7Ri6w
 KQYktDA1AqgUhh/FP3RLf9/uEGiM5NsyWJGRrLQyflBtJrZvlDX+V+mhgZqsN5G+u77kIU
 C/ySlD1sJ9hcUHJATzE6gFqC8IqXrSY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-W9y--C8tM_KxWvW_tIYrhg-1; Tue, 02 May 2023 20:27:57 -0400
X-MC-Unique: W9y--C8tM_KxWvW_tIYrhg-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-61b59e13fbeso34328206d6.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 17:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683073677; x=1685665677;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZK2bo3/a+2Qalv77ZLbddzKFbAME13YjAwyPO125H7Q=;
 b=hV9zGu/zUKa70YKELjgfW0FxAoL30MU/Bdoj7sokrTp1jzSeTQFUJ1hkHvG80XPgSX
 iZLs3F/RSwNKeee9Z6ub6H55cT5sZhxy4BMbn6KgEUbETo9ZlVtGWZixlzNZ0l+0IYOA
 V36ptDHwTI9LZIexW/SLOEViMklJkxv/aF0fEwqSWz4dxKdgiyBz6Ph/iQUtUQcHK3wW
 W73dWqgOHAFWT5z4qQmZD/Ws3vd8BM+XLBu+3j9cVZ0Tq0Td+Vrpohd3TEk5RRDuJi9e
 oJAvU5zThfErKIHzCiEaJuBucVyqU+K6vNIsx9pRoxmJXloexClMW22yvzF0UK9Xhq2Z
 lQXw==
X-Gm-Message-State: AC+VfDw9Yxq62XFya0nH7dzjM6Signs9/NJnYpePFv8K0jJsDKhFUE/o
 w84BqlKsOXyZ2lDbUc3DcDw0p3g29jlWy/RN5RV2JO66bC5K+WyplqKPInaP2MVJoh4Rh6UHWz7
 MYcFeIxvESMFscSU=
X-Received: by 2002:ad4:5ec6:0:b0:5ef:486a:505e with SMTP id
 jm6-20020ad45ec6000000b005ef486a505emr8791538qvb.41.1683073676885; 
 Tue, 02 May 2023 17:27:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5NWK/BOREG4uv07ERdY3yiD2zlQwTDC4aA2+x2ILcrE6IteIT/CJxatD962xwdEsu7ZXmAnA==
X-Received: by 2002:ad4:5ec6:0:b0:5ef:486a:505e with SMTP id
 jm6-20020ad45ec6000000b005ef486a505emr8791512qvb.41.1683073676515; 
 Tue, 02 May 2023 17:27:56 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:1b3:a802:fb9f:720f:65e5:7914:9a9b])
 by smtp.gmail.com with ESMTPSA id
 i29-20020a0cab5d000000b005f5a05448d8sm437236qvb.100.2023.05.02.17.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 17:27:55 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hw/pci: Disable PCI_ERR_UNCOR_MASK register for
 machine type < 8.0
Date: Tue,  2 May 2023 21:27:02 -0300
Message-Id: <20230503002701.854329-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since it's implementation on v8.0.0-rc0, having the PCI_ERR_UNCOR_MASK
set for machine types < 8.0 will cause migration to fail if the target
QEMU version is < 8.0.0 :

qemu-system-x86_64: get_pci_config_device: Bad config data: i=0x10a read: 40 device: 0 cmask: ff wmask: 0 w1cmask:0
qemu-system-x86_64: Failed to load PCIDevice:config
qemu-system-x86_64: Failed to load e1000e:parent_obj
qemu-system-x86_64: error while loading state for instance 0x0 of device '0000:00:02.0/e1000e'
qemu-system-x86_64: load of migration failed: Invalid argument

The above test migrated a 7.2 machine type from QEMU master to QEMU 7.2.0,
with this cmdline:

./qemu-system-x86_64 -M pc-q35-7.2 [-incoming XXX]

In order to fix this, property x-pcie-err-unc-mask was introduced to
control when PCI_ERR_UNCOR_MASK is enabled. This property is enabled by
default, but is disabled if machine type <= 7.2.

Fixes: 010746ae1d ("hw/pci/aer: Implement PCI_ERR_UNCOR_MASK register")
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 include/hw/pci/pci.h |  2 ++
 hw/core/machine.c    |  1 +
 hw/pci/pci.c         |  2 ++
 hw/pci/pcie_aer.c    | 11 +++++++----
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 935b4b91b4..e6d0574a29 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -207,6 +207,8 @@ enum {
     QEMU_PCIE_EXTCAP_INIT = (1 << QEMU_PCIE_EXTCAP_INIT_BITNR),
 #define QEMU_PCIE_CXL_BITNR 10
     QEMU_PCIE_CAP_CXL = (1 << QEMU_PCIE_CXL_BITNR),
+#define QEMU_PCIE_ERR_UNC_MASK_BITNR 11
+    QEMU_PCIE_ERR_UNC_MASK = (1 << QEMU_PCIE_ERR_UNC_MASK_BITNR),
 };
 
 typedef struct PCIINTxRoute {
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 47a34841a5..07f763eb2e 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -48,6 +48,7 @@ GlobalProperty hw_compat_7_2[] = {
     { "e1000e", "migrate-timadj", "off" },
     { "virtio-mem", "x-early-migration", "false" },
     { "migration", "x-preempt-pre-7-2", "true" },
+    { TYPE_PCI_DEVICE, "x-pcie-err-unc-mask", "off" },
 };
 const size_t hw_compat_7_2_len = G_N_ELEMENTS(hw_compat_7_2);
 
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8a87ccc8b0..5153ad63d6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -79,6 +79,8 @@ static Property pci_props[] = {
     DEFINE_PROP_STRING("failover_pair_id", PCIDevice,
                        failover_pair_id),
     DEFINE_PROP_UINT32("acpi-index",  PCIDevice, acpi_index, 0),
+    DEFINE_PROP_BIT("x-pcie-err-unc-mask", PCIDevice, cap_present,
+                    QEMU_PCIE_ERR_UNC_MASK_BITNR, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 103667c368..374d593ead 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -112,10 +112,13 @@ int pcie_aer_init(PCIDevice *dev, uint8_t cap_ver, uint16_t offset,
 
     pci_set_long(dev->w1cmask + offset + PCI_ERR_UNCOR_STATUS,
                  PCI_ERR_UNC_SUPPORTED);
-    pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
-                 PCI_ERR_UNC_MASK_DEFAULT);
-    pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
-                 PCI_ERR_UNC_SUPPORTED);
+
+    if (dev->cap_present & QEMU_PCIE_ERR_UNC_MASK) {
+        pci_set_long(dev->config + offset + PCI_ERR_UNCOR_MASK,
+                     PCI_ERR_UNC_MASK_DEFAULT);
+        pci_set_long(dev->wmask + offset + PCI_ERR_UNCOR_MASK,
+                     PCI_ERR_UNC_SUPPORTED);
+    }
 
     pci_set_long(dev->config + offset + PCI_ERR_UNCOR_SEVER,
                  PCI_ERR_UNC_SEVERITY_DEFAULT);
-- 
2.40.0


