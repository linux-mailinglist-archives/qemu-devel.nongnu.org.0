Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4517168ABC2
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 18:50:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOMeJ-000315-Vn; Sat, 04 Feb 2023 12:48:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pOMeH-00030A-DG
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:48:25 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pOMeE-0006Su-32
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 12:48:25 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id E6E6860B58;
 Sat,  4 Feb 2023 20:48:15 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b67f::1:2])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 3mds2O0QhiE1-SMT6UaWn; Sat, 04 Feb 2023 20:48:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675532895; bh=lVnskt62WXTjQL8xh1t8y7e2B9BV1/qTkQL+/+8sNQQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=LnTVa/7iGC+ge3EB2MwIA75hEwzgo1TmKgdOgUdrAgJyUTp+6dEZ1JpaDNFLPMAcF
 0tfvCL5TgSV2CQCfvEwxHPpUTxEYqN2r6IKjp9X1JZQzMmWfzSL8L8TKOc7AMaD37O
 OOkUtER46Vfowj2+MlKbiMTKkYFh4nT5FUZvMIZQ=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	marcel.apfelbaum@gmail.com,
	vsementsov@yandex-team.ru
Subject: [PATCH 4/4] pcie: add trace-poing for power indicator transitions
Date: Sat,  4 Feb 2023 20:47:57 +0300
Message-Id: <20230204174758.234951-5-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204174758.234951-1-vsementsov@yandex-team.ru>
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/pcie.c       | 20 ++++++++++++++++++++
 hw/pci/trace-events |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index ccdb2377e1..1a19368994 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -28,6 +28,7 @@
 #include "hw/pci/pcie_regs.h"
 #include "hw/pci/pcie_port.h"
 #include "qemu/range.h"
+#include "trace.h"
 
 //#define DEBUG_PCIE
 #ifdef DEBUG_PCIE
@@ -718,6 +719,20 @@ void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_ctl, uint16_t *slt_sta)
     *slt_sta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
 }
 
+static const char *pcie_sltctl_pic_str(uint16_t sltctl)
+{
+    switch (sltctl & PCI_EXP_SLTCTL_PIC) {
+    case PCI_EXP_SLTCTL_PWR_IND_ON:
+        return "on";
+    case PCI_EXP_SLTCTL_PWR_IND_BLINK:
+        return "blink";
+    case PCI_EXP_SLTCTL_PWR_IND_OFF:
+        return "off";
+    default:
+        return "?";
+    }
+}
+
 void pcie_cap_slot_write_config(PCIDevice *dev,
                                 uint16_t old_slt_ctl, uint16_t old_slt_sta,
                                 uint32_t addr, uint32_t val, int len)
@@ -762,6 +777,11 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                         sltsta);
     }
 
+    if ((val & PCI_EXP_SLTCTL_PIC) != (old_slt_ctl & PCI_EXP_SLTCTL_PIC)) {
+        trace_pcie_power_indicator(pcie_sltctl_pic_str(old_slt_ctl),
+                                   pcie_sltctl_pic_str(val));
+    }
+
     /*
      * If the slot is populated, power indicator is off and power
      * controller is off, it is safe to detach the devices.
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index aaf46bc92d..ec4a5ff43d 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -15,3 +15,6 @@ msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d mask
 sriov_register_vfs(const char *name, int slot, int function, int num_vfs) "%s %02x:%x: creating %d vf devs"
 sriov_unregister_vfs(const char *name, int slot, int function, int num_vfs) "%s %02x:%x: Unregistering %d vf devs"
 sriov_config_write(const char *name, int slot, int fun, uint32_t offset, uint32_t val, uint32_t len) "%s %02x:%x: sriov offset 0x%x val 0x%x len %d"
+
+# pcie.c
+pcie_power_indicator(const char *old, const char *new) "%s -> %s"
-- 
2.34.1


