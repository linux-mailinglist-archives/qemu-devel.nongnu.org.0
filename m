Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03868D637
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 13:11:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPMoy-0001pz-BJ; Tue, 07 Feb 2023 07:11:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMou-0001Xu-3J
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:32 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pPMoq-0004a6-V5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 07:11:31 -0500
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 51232600DA;
 Tue,  7 Feb 2023 15:11:23 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown [2a02:6b8:b081:218::1:e])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 HBbDgg1QJGk1-0zD9863S; Tue, 07 Feb 2023 15:11:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675771882; bh=ILI8wH9hIiUXO+Dnts0zYZzk4CTd1H6GYtA2wQgWkS4=;
 h=Cc:Message-Id:References:Date:In-Reply-To:Subject:To:From;
 b=PsaMLsVtmip8PLNLp2JCGVAcHDUOJ/IIE/T8DFy1xc5mwCLoT7Q3BC9j/INdjKo2h
 57IRliod+nnhMZ1+aV5UfNLaEdey/TBzApYI6MaRmd3aqNKcISq22LSAcH8qkP3Bxl
 vw/OjszpePowCfvOhPJatTOx40rxTpeMMWS6G9Nc=
Authentication-Results: vla1-81430ab5870b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com, vsementsov@yandex-team.ru,
 philmd@linaro.org
Subject: [PATCH v2 2/3] pcie_regs: drop duplicated indicator value macros
Date: Tue,  7 Feb 2023 15:11:15 +0300
Message-Id: <20230207121116.325456-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207121116.325456-1-vsementsov@yandex-team.ru>
References: <20230207121116.325456-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

We already have indicator values in
include/standard-headers/linux/pci_regs.h , no reason to reinvent them
in include/hw/pci/pcie_regs.h. (and we already have usage of
PCI_EXP_SLTCTL_PWR_IND_BLINK and PCI_EXP_SLTCTL_PWR_IND_OFF in
hw/pci/pcie.c, so let's be consistent)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pcie_regs.h |  9 ---------
 hw/pci/pcie.c              | 13 +++++++------
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
index 963dc2e170..00b595a82e 100644
--- a/include/hw/pci/pcie_regs.h
+++ b/include/hw/pci/pcie_regs.h
@@ -70,15 +70,6 @@ typedef enum PCIExpLinkWidth {
 #define PCI_EXP_SLTCTL_IND_ON           0x1
 #define PCI_EXP_SLTCTL_IND_BLINK        0x2
 #define PCI_EXP_SLTCTL_IND_OFF          0x3
-#define PCI_EXP_SLTCTL_AIC_SHIFT        ctz32(PCI_EXP_SLTCTL_AIC)
-#define PCI_EXP_SLTCTL_AIC_OFF                          \
-    (PCI_EXP_SLTCTL_IND_OFF << PCI_EXP_SLTCTL_AIC_SHIFT)
-
-#define PCI_EXP_SLTCTL_PIC_SHIFT        ctz32(PCI_EXP_SLTCTL_PIC)
-#define PCI_EXP_SLTCTL_PIC_OFF                          \
-    (PCI_EXP_SLTCTL_IND_OFF << PCI_EXP_SLTCTL_PIC_SHIFT)
-#define PCI_EXP_SLTCTL_PIC_ON                          \
-    (PCI_EXP_SLTCTL_IND_ON << PCI_EXP_SLTCTL_PIC_SHIFT)
 
 #define PCI_EXP_SLTCTL_SUPPORTED        \
             (PCI_EXP_SLTCTL_ABPE |      \
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 82ef723983..ccdb2377e1 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -634,8 +634,8 @@ void pcie_cap_slot_init(PCIDevice *dev, PCIESlot *s)
                                  PCI_EXP_SLTCTL_PIC |
                                  PCI_EXP_SLTCTL_AIC);
     pci_word_test_and_set_mask(dev->config + pos + PCI_EXP_SLTCTL,
-                               PCI_EXP_SLTCTL_PIC_OFF |
-                               PCI_EXP_SLTCTL_AIC_OFF);
+                               PCI_EXP_SLTCTL_PWR_IND_OFF |
+                               PCI_EXP_SLTCTL_ATTN_IND_OFF);
     pci_word_test_and_set_mask(dev->wmask + pos + PCI_EXP_SLTCTL,
                                PCI_EXP_SLTCTL_PIC |
                                PCI_EXP_SLTCTL_AIC |
@@ -679,7 +679,7 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                  PCI_EXP_SLTCTL_PDCE |
                                  PCI_EXP_SLTCTL_ABPE);
     pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL,
-                               PCI_EXP_SLTCTL_AIC_OFF);
+                               PCI_EXP_SLTCTL_ATTN_IND_OFF);
 
     if (dev->cap_present & QEMU_PCIE_SLTCAP_PCP) {
         /* Downstream ports enforce device number 0. */
@@ -694,7 +694,8 @@ void pcie_cap_slot_reset(PCIDevice *dev)
                                        PCI_EXP_SLTCTL_PCC);
         }
 
-        pic = populated ? PCI_EXP_SLTCTL_PIC_ON : PCI_EXP_SLTCTL_PIC_OFF;
+        pic = populated ?
+                PCI_EXP_SLTCTL_PWR_IND_ON : PCI_EXP_SLTCTL_PWR_IND_OFF;
         pci_word_test_and_set_mask(exp_cap + PCI_EXP_SLTCTL, pic);
     }
 
@@ -770,9 +771,9 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
      * control of powered off slots before powering them on.
      */
     if ((sltsta & PCI_EXP_SLTSTA_PDS) && (val & PCI_EXP_SLTCTL_PCC) &&
-        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PIC_OFF &&
+        (val & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF &&
         (!(old_slt_ctl & PCI_EXP_SLTCTL_PCC) ||
-        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PIC_OFF)) {
+        (old_slt_ctl & PCI_EXP_SLTCTL_PIC) != PCI_EXP_SLTCTL_PWR_IND_OFF)) {
         pcie_cap_slot_do_unplug(dev);
     }
     pcie_cap_update_power(dev);
-- 
2.34.1


