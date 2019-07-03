Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557935D347
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:45:26 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiKyD-00005m-HQ
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58360)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKN0-0006E5-FT
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKMv-0008Js-Gu
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:06:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37968)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKMv-0008JK-AJ
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:06:53 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 94F7430842CE;
 Tue,  2 Jul 2019 15:06:47 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 38EDA60C44;
 Tue,  2 Jul 2019 15:06:45 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:06:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190702150606.24851-4-mst@redhat.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 15:06:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 03/22] pcie: work around for racy guest init
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During boot, linux guests tend to clear all bits in pcie slot status
register which is used for hotplug.
If they clear bits that weren't set this is racy and will lose events:
not a big problem for manual hotplug on bare-metal, but a problem for us.

For example, the following is broken ATM:

/x86_64-softmmu/qemu-system-x86_64 -enable-kvm -S -machine q35  \
    -device pcie-root-port,id=pcie_root_port_0,slot=2,chassis=2,addr=0x2,bus=pcie.0 \
    -device virtio-balloon-pci,id=balloon,bus=pcie_root_port_0 \
    -monitor stdio disk.qcow2
(qemu)device_del balloon
(qemu)cont

Balloon isn't deleted as it should.

As a work-around, detect this attempt to clear slot status and revert
status to what it was before the write.

Note: in theory this can be detected as a duplicate button press
which cancels the previous press. Does not seem to happen in
practice as guests seem to only have this bug during init.

Note2: the right thing to do is probably to fix Linux to
read status before clearing it, and act on the bits that are set.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Tested-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/pci/pcie.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index f8490a00de..c605d32dd4 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -610,6 +610,25 @@ void pcie_cap_slot_write_config(PCIDevice *dev, uint16_t slt_ctl, uint16_t slt_s
     uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
+        /*
+         * Guests tend to clears all bits during init.
+         * If they clear bits that weren't set this is racy and will lose events:
+         * not a big problem for manual button presses, but a problem for us.
+         * As a work-around, detect this and revert status to what it was
+         * before the write.
+         *
+         * Note: in theory this can be detected as a duplicate button press
+         * which cancels the previous press. Does not seem to happen in
+         * practice as guests seem to only have this bug during init.
+         */
+#define PCIE_SLOT_EVENTS (PCI_EXP_SLTSTA_ABP | PCI_EXP_SLTSTA_PFD | \
+                          PCI_EXP_SLTSTA_MRLSC | PCI_EXP_SLTSTA_PDC | \
+                          PCI_EXP_SLTSTA_CC)
+
+        if (val & ~slt_sta & PCIE_SLOT_EVENTS) {
+            sltsta = (sltsta & ~PCIE_SLOT_EVENTS) | (slt_sta & PCIE_SLOT_EVENTS);
+            pci_set_word(exp_cap + PCI_EXP_SLTSTA, sltsta);
+        }
         hotplug_event_clear(dev);
     }
 
-- 
MST


