Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E00C6ECB3E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 13:23:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pquGv-0000qD-Ck; Mon, 24 Apr 2023 07:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGt-0000pu-UE
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viktor@daynix.com>) id 1pquGj-00056I-0o
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 07:22:15 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4ec94eb6dcaso4574731e87.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682335318; x=1684927318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b49RuNteQiiwmolZv5ATskx2CIb9sDZ4N568I2W2fpQ=;
 b=YpzdVPVe48eSpdd+9QLfbey3ENC1u1S0MTgJDV3Q9Hv7HEWvvgmJ5dajFRpjrik4bP
 ZecT9okJGCYjJpTG5dLynQav4VmG6rzUZTd11TUaSYo9IGXSr/8Ji/iKdnz4eYNMUAbC
 tpvRAwRSQ5UfVj3LJxOJoUinq9CAS3DmCMyo2GqddVqmU+JG9z6InLPs9o0TMlWeW6w3
 VK97m6tSjIIf6H3d4AziktlDxLvTlu2ShXBcc/C97/jT/LQ7sFC+x4/LYGuoWGHvnxY/
 SkACqwI9RgNVo/5Ze9ZoewlLGbWqnAQu1rTtOjsL6t7NIRkD4ehB+tVIxzZVyvKKKSWA
 gT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682335318; x=1684927318;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b49RuNteQiiwmolZv5ATskx2CIb9sDZ4N568I2W2fpQ=;
 b=WTicL0tsj0Z34S0rdwXe+I/l+c/x4xwmVL6XfVOpDIe9qiDt+jUN2B4o/gXeTqpfyM
 /ii0JiaSkVG5F2Ay0zPNKwFflKF94YQUJlHcu+/wXVCjynNjtR4yedj98I6GZJdHJYfN
 2efFi0iC4bx8G+5gBjwIVSrHUWCE1Z3G27C5NKn8tiO8CFUBQiobX21gUaceqi4Qeb8i
 rSIAoPTvv35fILkbu36C4f5W8V1V8qm4bBukuPwe/lTAQp5TGSL0qk1q5mXNPbGFXy+Q
 7+sdN423Q8/JtHqMGZ3IPTbned58dz+6Px4XzqC7ebF8lQvsKCDz0aTzQNjjvDZ0ntsI
 R63A==
X-Gm-Message-State: AAQBX9eazalc9c42kSNJoihsAF2fYMZ1jQxFu5crx7zlNdIGOPvxcpgg
 FNmc4Djt28OaI2h+dFtykLU5eA==
X-Google-Smtp-Source: AKy350bppNDqHbwOEgJ5BIcccop9b4P00el97xvc4x6TCKxnQfVINbvxdtcvSZpkrjfQRrgDZnXg9A==
X-Received: by 2002:a19:ac43:0:b0:4ee:d799:eca with SMTP id
 r3-20020a19ac43000000b004eed7990ecamr2953685lfc.40.1682335317914; 
 Mon, 24 Apr 2023 04:21:57 -0700 (PDT)
Received: from localhost.localdomain ([80.250.80.22])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a19f501000000b004eff0bcb276sm415542lfb.7.2023.04.24.04.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 04:21:57 -0700 (PDT)
From: Viktor Prutyanov <viktor@daynix.com>
To: mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, peterx@redhat.com, david@redhat.com
Cc: philmd@linaro.org, qemu-devel@nongnu.org, yan@daynix.com,
 yuri.benditovich@daynix.com, Viktor Prutyanov <viktor@daynix.com>
Subject: [RFC PATCH 1/4] pci: add handling of Enable bit in ATS Control
 Register
Date: Mon, 24 Apr 2023 14:21:44 +0300
Message-Id: <20230424112147.17083-2-viktor@daynix.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230424112147.17083-1-viktor@daynix.com>
References: <20230424112147.17083-1-viktor@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::131;
 envelope-from=viktor@daynix.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

According to PCIe Address Translation Services specification 5.1.3.,
ATS Control Register has Enable bit to enable/disable ATS.
Add a new field for a trigger function which is called at the Enable
bit change, so that PCIe devices can handle ATS enable/disable.

Signed-off-by: Viktor Prutyanov <viktor@daynix.com>
---
 hw/pci/pci.c                |  1 +
 hw/pci/pcie.c               | 21 +++++++++++++++++++++
 include/hw/pci/pci_device.h |  3 +++
 include/hw/pci/pcie.h       |  4 ++++
 4 files changed, 29 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 208c16f450..79a47d2589 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1550,6 +1550,7 @@ void pci_default_write_config(PCIDevice *d, uint32_t addr, uint32_t val_in, int
     msi_write_config(d, addr, val_in, l);
     msix_write_config(d, addr, val_in, l);
     pcie_sriov_config_write(d, addr, val_in, l);
+    pcie_ats_config_write(d, addr, val_in, l);
 }
 
 /***********************************************************/
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 924fdabd15..e0217161e5 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -1057,6 +1057,27 @@ void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned)
     pci_set_word(dev->wmask + dev->exp.ats_cap + PCI_ATS_CTRL, 0x800f);
 }
 
+void pcie_ats_config_write(PCIDevice *dev, uint32_t address, uint32_t val,
+                           int len)
+{
+    uint32_t off;
+    uint16_t ats_cap = dev->exp.ats_cap;
+
+    if (!ats_cap || address < ats_cap) {
+        return;
+    }
+    off = address - ats_cap;
+    if (off >= PCI_EXT_CAP_ATS_SIZEOF) {
+        return;
+    }
+
+    if (range_covers_byte(off, len, PCI_ATS_CTRL + 1)) {
+        if (dev->ats_ctrl_trigger) {
+            dev->ats_ctrl_trigger(dev, !!(val & PCI_ATS_CTRL_ENABLE));
+        }
+    }
+}
+
 /* ACS (Access Control Services) */
 void pcie_acs_init(PCIDevice *dev, uint16_t offset)
 {
diff --git a/include/hw/pci/pci_device.h b/include/hw/pci/pci_device.h
index d3dd0f64b2..2bb1d68f3b 100644
--- a/include/hw/pci/pci_device.h
+++ b/include/hw/pci/pci_device.h
@@ -160,6 +160,9 @@ struct PCIDevice {
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
     uint32_t acpi_index;
+
+    /* PCI ATS enable/disable trigger */
+    void (*ats_ctrl_trigger)(PCIDevice *dev, bool enable);
 };
 
 static inline int pci_intx(PCIDevice *pci_dev)
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 798a262a0a..5f2dbd87cf 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -154,4 +154,8 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp);
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
+
+void pcie_ats_config_write(PCIDevice *dev, uint32_t address, uint32_t val,
+                           int len);
+
 #endif /* QEMU_PCIE_H */
-- 
2.21.0


