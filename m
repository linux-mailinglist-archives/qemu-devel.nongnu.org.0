Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B646B6F8CC5
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 01:24:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pv4lr-000889-1M; Fri, 05 May 2023 19:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pv4lp-00087q-0S
 for qemu-devel@nongnu.org; Fri, 05 May 2023 19:23:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pv4ln-0004EB-1K
 for qemu-devel@nongnu.org; Fri, 05 May 2023 19:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683329001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rl5HcSkZDieagd3mT3skzzxr+NNN5cBOeWYGffPcTjk=;
 b=aGmY+QyzhzE72OEZj/+ozrj9XC8hcuZNUKKjppFuvBN4ydd2KGZgh3qLT5pWRJLCA/o5m8
 RpD+7lLwCZateKDj6767SJyQ3rdOPWXIWiL2TUWQPW2akeThhkPCXVrQn596LZTDIvwJiU
 aQYsbu3oCldqvfSuNsYgJeG3IpaNz3w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-qko1RICYOjy1Ih4nTcPt8A-1; Fri, 05 May 2023 19:23:19 -0400
X-MC-Unique: qko1RICYOjy1Ih4nTcPt8A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F1DC80080E
 for <qemu-devel@nongnu.org>; Fri,  5 May 2023 23:23:19 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.18.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37BFCC15BA0;
 Fri,  5 May 2023 23:23:19 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Cc: clg@redhat.com,
	Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v2] vfio/pci: Static Resizable BAR capability
Date: Fri,  5 May 2023 17:23:08 -0600
Message-Id: <20230505232308.2869912-1-alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

The PCI Resizable BAR (ReBAR) capability is currently hidden from the
VM because the protocol for interacting with the capability does not
support a mechanism for the device to reject an advertised supported
BAR size.  However, when assigned to a VM, the act of resizing the
BAR requires adjustment of host resources for the device, which
absolutely can fail.  Linux does not currently allow us to reserve
resources for the device independent of the current usage.

The only writable field within the ReBAR capability is the BAR Size
register.  The PCIe spec indicates that when written, the device
should immediately begin to operate with the provided BAR size.  The
spec however also notes that software must only write values
corresponding to supported sizes as indicated in the capability and
control registers.  Writing unsupported sizes produces undefined
results.  Therefore, if the hypervisor were to virtualize the
capability and control registers such that the current size is the
only indicated available size, then a write of anything other than
the current size falls into the category of undefined behavior,
where we can essentially expose the modified ReBAR capability as
read-only.

This may seem pointless, but users have reported that virtualizing
the capability in this way not only allows guest software to expose
related features as available (even if only cosmetic), but in some
scenarios can resolve guest driver issues.  Additionally, no
regressions in behavior have been reported for this change.

A caveat here is that the PCIe spec requires for compatibility that
devices report support for a size in the range of 1MB to 512GB,
therefore if the current BAR size falls outside that range we revert
to hiding the capability.

Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
v2:
 - Add spec reference
 - Use PCI_REBAR_CAP_SIZES to check sizes in range
 - Try to clarify capability bit generation
 - Rename s/bars/nbar/ to match #defines
 - More complete masking of NBAR value

 hw/vfio/pci.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index cf27f28936cb..3ab849767a92 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2066,6 +2066,54 @@ static int vfio_add_std_cap(VFIOPCIDevice *vdev, uint8_t pos, Error **errp)
     return 0;
 }
 
+static int vfio_setup_rebar_ecap(VFIOPCIDevice *vdev, uint16_t pos)
+{
+    uint32_t ctrl;
+    int i, nbar;
+
+    ctrl = pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL);
+    nbar = (ctrl & PCI_REBAR_CTRL_NBAR_MASK) >> PCI_REBAR_CTRL_NBAR_SHIFT;
+
+    for (i = 0; i < nbar; i++) {
+        uint32_t cap;
+        int size;
+
+        ctrl = pci_get_long(vdev->pdev.config + pos + PCI_REBAR_CTRL + (i * 8));
+        size = (ctrl & PCI_REBAR_CTRL_BAR_SIZE) >> PCI_REBAR_CTRL_BAR_SHIFT;
+
+        /* The cap register reports sizes 1MB to 127TB, with 4 reserved bits */
+        cap = size <= 27 ? 1U << (size + 4) : 0;
+
+        /*
+         * The PCIe spec (v6.0.1, 7.8.6) requires HW to support at least one
+         * size in the range 1MB to 512GB.  We intend to mask all sizes except
+         * the one currently enabled in the size field, therefore if it's
+         * outside the range, hide the whole capability as this virtualization
+         * trick won't work.  If >512GB resizable BARs start to appear, we
+         * might need an opt-in or reservation scheme in the kernel.
+         */
+        if (!(cap & PCI_REBAR_CAP_SIZES)) {
+            return -EINVAL;
+        }
+
+        /* Hide all sizes reported in the ctrl reg per above requirement. */
+        ctrl &= (PCI_REBAR_CTRL_BAR_SIZE |
+                 PCI_REBAR_CTRL_NBAR_MASK |
+                 PCI_REBAR_CTRL_BAR_IDX);
+
+        /*
+         * The BAR size field is RW, however we've mangled the capability
+         * register such that we only report a single size, ie. the current
+         * BAR size.  A write of an unsupported value is undefined, therefore
+         * the register field is essentially RO.
+         */
+        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CAP + (i * 8), cap, ~0);
+        vfio_add_emulated_long(vdev, pos + PCI_REBAR_CTRL + (i * 8), ctrl, ~0);
+    }
+
+    return 0;
+}
+
 static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
 {
     PCIDevice *pdev = &vdev->pdev;
@@ -2139,9 +2187,13 @@ static void vfio_add_ext_cap(VFIOPCIDevice *vdev)
         case 0: /* kernel masked capability */
         case PCI_EXT_CAP_ID_SRIOV: /* Read-only VF BARs confuse OVMF */
         case PCI_EXT_CAP_ID_ARI: /* XXX Needs next function virtualization */
-        case PCI_EXT_CAP_ID_REBAR: /* Can't expose read-only */
             trace_vfio_add_ext_cap_dropped(vdev->vbasedev.name, cap_id, next);
             break;
+        case PCI_EXT_CAP_ID_REBAR:
+            if (!vfio_setup_rebar_ecap(vdev, next)) {
+                pcie_add_capability(pdev, cap_id, cap_ver, next, size);
+            }
+            break;
         default:
             pcie_add_capability(pdev, cap_id, cap_ver, next, size);
         }
-- 
2.39.2


