Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A34DE1D7
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:36:58 +0100 (CET)
Received: from localhost ([::1]:50642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVIPB-0006J7-2D
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:36:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9v-0006ub-PZ; Fri, 18 Mar 2022 15:21:11 -0400
Received: from mga17.intel.com ([192.55.52.151]:1694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1nVI9t-0002He-Ss; Fri, 18 Mar 2022 15:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647631269; x=1679167269;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oJf9aQeSpzLJAv0B4lAkgiR82qC/OhEwFxrEoLxXgfU=;
 b=WD/cuklRhTqEtJiK5dW7zVLTEIBI0ps3MywTWiZkSvEQoQNEO/E7AUMH
 H0qiPtXBjrjfmfPoqIehzJd75jpEQynXFCrM1CpAQb+E7OAxr2asb3CoA
 BoWbnmxkMfjgu4erL1QKctJFg3jfKYHjTcC/R8HhJaqfFuiJgCrmUdPI8
 m6Wt6KETlK/GdmrLTR/ctb/yXaz2BB6Mewn7LwKUtZUIwbccm6X/H4c75
 Yhe8U/JbULpOoAVb76wEWJXtdOknkbpDDLflRG1PcLlWh4ds3kYAscJnw
 HDUFICsbZAyFonLKwAuP7R4AhM68IHyKKQOQWsAGIs6D0J030+OcGt1i8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237817026"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="237817026"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:21:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; d="scan'208";a="541994419"
Received: from lmaniak-dev.elements.local ([10.55.249.72])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2022 12:21:04 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/12] hw/acpi: Make the PCI hot-plug aware of SR-IOV
Date: Fri, 18 Mar 2022 20:18:19 +0100
Message-Id: <20220318191819.1711831-13-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
References: <20220318191819.1711831-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.55.52.151;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga17.intel.com
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
Cc: fam@euphon.net, kwolf@redhat.com, lukasz.maniak@linux.intel.com,
 stefanha@redhat.com, qemu-block@nongnu.org, mst@redhat.com,
 k.jensen@samsung.com, armbru@redhat.com, f4bug@amsat.org, kbusch@kernel.org,
 its@irrelevant.dk, hreitz@redhat.com, xypron.glpk@gmx.de,
 lukasz.gieryk@linux.intel.com, ani@anisinha.ca, imammedo@redhat.com
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


