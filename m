Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B9E4C1031
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:20:36 +0100 (CET)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMol8-0003KR-8N
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:20:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nMoH8-0001O0-93
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:49:34 -0500
Received: from mga02.intel.com ([134.134.136.20]:18654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1nMoH2-00009b-JB
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 04:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645609768; x=1677145768;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MosHCLQkztoi+/gQMY276jfWG0DSP80nXPrW+RpjOOE=;
 b=V1K/FiZSumHTKPnvHO9/aymx5IuddM3YQaeDdG/92YQHb+XFhJJvs4J5
 weTRunIAi7J9aNnKJ4qRiLn7DBCoLOHik1ElLZQxEkl+ASWserYNb4xSA
 GIt0vk2ke73Uwyl9KDi2KjceYSR9AHd79KrWdpzqtzZb5JYVO5zS8N83p
 R2xSTpbUdZqziJgDcIkj74SWX5wtFC0DgPMmzWs6Vol2KYN3hR5gn8F5y
 4UIP2dxtCM3jrOKtIqHa4+zC4NhS9JOkzLmz7jEc2TObkBZFJYUmmRg+o
 uLPP36wNCMlXla3FxV8O1MxR/zQEp8KyUUIPPFYK0YewbFZQIJ/1FRXCq A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239315848"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="239315848"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:49:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; d="scan'208";a="532610264"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.123])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 01:49:21 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] pci: show id info when pci BDF conflict
Date: Wed, 23 Feb 2022 17:44:35 +0800
Message-Id: <20220223094435.64495-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=zhenzhong.duan@intel.com; helo=mga02.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During qemu init stage, when there is pci BDF conflicts, qemu print
a warning but not showing which device the BDF is occupied by. E.x:

"PCI: slot 2 function 0 not available for virtio-scsi-pci, in use by virtio-scsi-pci"

To facilitate user knowing the offending device and fixing it, showing
the id info in the warning.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/pci/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 5d30f9ca60e5..0103a2c36ca2 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1078,9 +1078,9 @@ static PCIDevice *do_pci_register_device(PCIDevice *pci_dev,
         return NULL;
     } else if (!pci_bus_devfn_available(bus, devfn)) {
         error_setg(errp, "PCI: slot %d function %d not available for %s,"
-                   " in use by %s",
+                   " in use by %s,id=%s",
                    PCI_SLOT(devfn), PCI_FUNC(devfn), name,
-                   bus->devices[devfn]->name);
+                   bus->devices[devfn]->name, bus->devices[devfn]->qdev.id);
         return NULL;
     } else if (dev->hotplugged &&
                pci_get_function_0(pci_dev)) {
-- 
2.25.1


