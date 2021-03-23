Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D63467CF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:36:02 +0100 (CET)
Received: from localhost ([::1]:39462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlsn-0003eg-Ni
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOknn-0003zd-4t
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:26:47 -0400
Received: from mga18.intel.com ([134.134.136.126]:35204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOknj-0003iU-5s
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 13:26:46 -0400
IronPort-SDR: fnbVuUPnNVF/GwZN+crrh/03EC/bfP/68lAxH0QtX2ceXBlQluCMFV2vGhihOGkjMNdHhi04uU
 HvBBEm+JL/cw==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="178093239"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="178093239"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:26:37 -0700
IronPort-SDR: cVigCD4kPpFTawqv0u25jxC0q38KtY6+lh/2aFf3oB8Q06hdfTPJx96E8niVZafbR4MtZbwB+h
 sxKQ9k3Hx+Xg==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607801300"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 10:26:36 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v2 2/3] pci: sprinkle assert in PCI pin number
Date: Tue, 23 Mar 2021 10:24:30 -0700
Message-Id: <dc9c8d2aa7bfcd82ba812f1ff5630a4cc0ffbbe7.1616519655.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616519655.git.isaku.yamahata@intel.com>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=isaku.yamahata@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: isaku.yamahata@intel.com, Peter Maydell <Peter.maydel@linaro.org>,
 isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a device model
(a) doesn't set the value to a correct interrupt number and then
(b) triggers an interrupt for itself,
it's device model bug. Add assert on interrupt pin number to catch
this kind of bug more obviously.

Suggested-by: Peter Maydell <Peter.maydel@linaro.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/pci/pci.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index ac9a24889c..cb6bab999b 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1450,6 +1450,8 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
     PCIDevice *pci_dev = opaque;
     int change;
 
+    assert(0 <= irq_num && irq_num < PCI_NUM_PINS);
+    assert(level == 0 || level == 1);
     change = level - pci_irq_state(pci_dev, irq_num);
     if (!change)
         return;
@@ -1463,7 +1465,13 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
 
 static inline int pci_intx(PCIDevice *pci_dev)
 {
-    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+    int intx = pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+    /*
+     * This function is used to setup/trigger irq.
+     * So PIN = 0 (interrupt isn't used) doesn't make sense.
+     */
+    assert(0 <= intx && intx < PCI_NUM_PINS);
+    return intx;
 }
 
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
-- 
2.25.1


