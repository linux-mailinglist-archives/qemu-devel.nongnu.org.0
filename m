Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCD4DE198
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:07:14 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHwP-0003Rr-C8
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:07:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHm4-0004qS-85; Fri, 18 Mar 2022 14:56:33 -0400
Received: from mga11.intel.com ([192.55.52.93]:7194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVHm2-0006rC-EG; Fri, 18 Mar 2022 14:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647629790; x=1679165790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJf9aQeSpzLJAv0B4lAkgiR82qC/OhEwFxrEoLxXgfU=;
 b=EAOlbNBhN503CVW8XmRfvOkgZoUHkQBn2ymB+gAHoStY/H6aF94GC5VG
 6oqZBdcoyvy077ugwNWq97x4sSkq8ryDnUVLpT4I/sRpasQRdRnN2VtHX
 GmqrcCcYAIWLOCi3cSwPx6JAVFz19Y0cwgd/jDxhYYvonQjXbgYrx/FFh
 JfhTzlFjCuAAnoKg45tim+MPpTL1G50MJ6ybZYiHxIagjhwfBjbQIYS7/
 r0L7NJuQE+pESZh8T7NyB+iDydMakkyW14k3cyjBNZtfjk3E50/+RKhhj
 BKob6od4r4HD0FbgW4dfMGTyJNzoxQGBn35RfxQ3+U9rPe89UcISYZIwq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="254772059"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="254772059"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:56:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="499352705"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 11:56:19 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Date: Fri, 18 Mar 2022 19:53:51 +0100
Message-Id: <20220318185352.1667375-12-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318185352.1667375-1-lukasz.maniak@linux.intel.com>
References: <20220318185352.1667375-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.93;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga11.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

PCI device capable of SR-IOV support is a new, still-experimental
feature with only a single working example of the Nvme device.

This patch in an attempt to fix a double-free problem when a
SR-IOV-capable Nvme device is hot-unplugged. The problem and the
reproduction steps can be found in this thread:

https://patchew.org/QEMU/20220217174504.1051716-1-lukasz.maniak@linux.intel.com/20220217174504.1051716-14-lukasz.maniak@linux.intel.com/

Details of the proposed solution are, for convenience, included below.

1) The current SR-IOV implementation assumes it’s the PhysicalFunction
   that creates and deletes VirtualFunctions.
2) It’s a design decision (the Nvme device at least) for the VFs to be
   of the same class as PF. Effectively, they share the dc->hotpluggable
   value.
3) When a VF is created, it’s added as a child node to PF’s PCI bus
   slot.
4) Monitor/device_del triggers the ACPI mechanism. The implementation is
   not aware of SR/IOV and ejects PF’s PCI slot, directly unrealizing all
   hot-pluggable (!acpi_pcihp_pc_no_hotplug) children nodes.
5) VFs are unrealized directly, and it doesn’t work well with (1).
   SR/IOV structures are not updated, so when it’s PF’s turn to be
   unrealized, it works on stale pointers to already-deleted VFs.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
---
 hw/acpi/pcihp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 6351bd3424d..248839e1110 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -192,8 +192,12 @@ static bool acpi_pcihp_pc_no_hotplug(AcpiPciHpState *s, PCIDevice *dev)
      * ACPI doesn't allow hotplug of bridge devices.  Don't allow
      * hot-unplug of bridge devices unless they were added by hotplug
      * (and so, not described by acpi).
+     *
+     * Don't allow hot-unplug of SR-IOV Virtual Functions, as they
+     * will be removed implicitly, when Physical Function is unplugged.
      */
-    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable;
+    return (pc->is_bridge && !dev->qdev.hotplugged) || !dc->hotpluggable ||
+           pci_is_vf(dev);
 }
 
 static void acpi_pcihp_eject_slot(AcpiPciHpState *s, unsigned bsel, unsigned slots)
-- 
2.25.1


