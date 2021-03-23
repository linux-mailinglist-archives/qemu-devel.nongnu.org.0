Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C21346A81
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:57:13 +0100 (CET)
Received: from localhost ([::1]:35108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo5Q-0003rk-R0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2u-0001r5-4X
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:36 -0400
Received: from mga11.intel.com ([192.55.52.93]:35899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@intel.com>)
 id 1lOo2r-00008L-4g
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:54:35 -0400
IronPort-SDR: 6FSYfM6oUMyIlW28JrBKot7kkHZL1jymMLyhB60fZ9TVA2GS3CxqawsseRHSy/cLnXgHHbC/+5
 LLI435H4kERA==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="187248558"
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="187248558"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:28 -0700
IronPort-SDR: 7vwSwlhAhBl3Yim/7PoyJQ7JA2wfIZtmIQUJgifzBjNdSzQNuU9Tzn0cAQN47XRondGXGus9iM
 lT1uiI7HNO5g==
X-IronPort-AV: E=Sophos;i="5.81,272,1610438400"; d="scan'208";a="607869579"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2021 13:54:26 -0700
From: Isaku Yamahata <isaku.yamahata@intel.com>
To: qemu-devel@nongnu.org, mst@redhat.com, peter.maydell@linaro.org,
 imammedo@redhat.com, f4bug@amsat.org
Subject: [PATCH v3 4/4] pci: sprinkle assert in PCI pin number
Date: Tue, 23 Mar 2021 13:52:27 -0700
Message-Id: <9cf8ac3b17e162daac0971d7be32deb6a33ae6ec.1616532563.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616532563.git.isaku.yamahata@intel.com>
References: <cover.1616532563.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93;
 envelope-from=isaku.yamahata@intel.com; helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Cc: isaku.yamahata@intel.com, isaku.yamahata@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a device model
(a) doesn't set the value to a correct interrupt number and then
(b) triggers an interrupt for itself,
it's device model bug. Add assert on interrupt pin number to catch
this kind of bug more obviously.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 hw/pci/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index ac9a24889c..8f35e13a0c 100644
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
@@ -1469,6 +1471,7 @@ static inline int pci_intx(PCIDevice *pci_dev)
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
 {
     int intx = pci_intx(pci_dev);
+    assert(0 <= intx && intx < PCI_NUM_PINS);
 
     return qemu_allocate_irq(pci_irq_handler, pci_dev, intx);
 }
-- 
2.25.1


