Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFCC51FFAE
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 16:32:40 +0200 (CEST)
Received: from localhost ([::1]:37064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no4RD-0005hq-J0
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 10:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4EQ-0002Mp-SZ; Mon, 09 May 2022 10:19:26 -0400
Received: from mga05.intel.com ([192.55.52.43]:24353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1no4EP-0001Ef-4p; Mon, 09 May 2022 10:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652105965; x=1683641965;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T3j6nnZa5/IGQxypAhVXl35cX7LvpTIlvzv6DpCG0+E=;
 b=VIMSV9xkiMKjU6wGiJzIOjxjkYjxogVy8jgaQyNgTLqtbgdrmApo69Jp
 sPIJEoGOpnrGjyBLvyggW+XjekpBNDIiv0uFNs54Vwh7x84IZBdvRmY4Y
 8QAV1zBrzgmXHpZdvj9NQulyCN1Bc3qBYaDywS5nLVwDhldK8iSitHV4b
 JyR7lKABllhIHunvJTiGbrAwWVpPTFJPdHgIfGKhC6PcHA1kN2qCDQBrs
 yAOaVnKIQjEVT2vPDhNouQr8puSA4pnpy5XrD+hLI0J+0DXmj6kAFW6Cz
 C2BdIEImBANF2BRPhnmAIjPWHbOxxPICW+T/uxIwR5vx0xcnapwtPj8Wq Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355490911"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="355490911"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="622987381"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:19:19 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, ani@anisinha.ca, armbru@redhat.com, f4bug@amsat.org,
 fam@euphon.net, hreitz@redhat.com, imammedo@redhat.com, its@irrelevant.dk,
 kbusch@kernel.org, k.jensen@samsung.com, kwolf@redhat.com,
 lukasz.gieryk@linux.intel.com, lukasz.maniak@linux.intel.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, stefanha@redhat.com,
 xypron.glpk@gmx.de
Subject: [PATCH v8 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Date: Mon,  9 May 2022 16:16:20 +0200
Message-Id: <20220509141620.3868733-13-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
References: <20220509141620.3868733-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.43;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>

PCI device capable of SR-IOV support is a new, still-experimental
feature with only a single working example of the Nvme device.

This patch in an attempt to fix a double-free problem when a
SR-IOV-capable Nvme device is hot-unplugged in the following scenario:

Qemu CLI:
---------
-device pcie-root-port,slot=0,id=rp0
-device nvme-subsys,id=subsys0
-device nvme,id=nvme0,bus=rp0,serial=deadbeef,subsys=subsys0,sriov_max_vfs=1,sriov_vq_flexible=2,sriov_vi_flexible=1

Guest OS:
---------
sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 1 -a 1 -n 0
sudo nvme virt-mgmt /dev/nvme0 -c 0 -r 0 -a 1 -n 0
echo 1 > /sys/bus/pci/devices/0000:01:00.0/reset
sleep 1
echo 1 > /sys/bus/pci/devices/0000:01:00.0/sriov_numvfs
nvme virt-mgmt /dev/nvme0 -c 1 -r 1 -a 8 -n 1
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 8 -n 2
nvme virt-mgmt /dev/nvme0 -c 1 -r 0 -a 9 -n 0
sleep 2
echo 01:00.1 > /sys/bus/pci/drivers/nvme/bind

Qemu monitor:
-------------
device_del nvme0

Explanation of the problem and the proposed solution:

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

The proposed fix is to make the PCI ACPI code aware of SR/IOV.

Signed-off-by: Łukasz Gieryk <lukasz.gieryk@linux.intel.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index bf65bbea494..84d75e6b846 100644
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


