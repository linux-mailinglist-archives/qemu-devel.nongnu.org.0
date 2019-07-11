Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FCB6609E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 22:29:03 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlfga-0007gH-H0
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 16:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33531)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hlfgO-0007I9-Dv
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 16:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hlfgM-0006qp-LB
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 16:28:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hlfgM-0006nN-Ff
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 16:28:46 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A924C308FC4B;
 Thu, 11 Jul 2019 20:28:43 +0000 (UTC)
Received: from redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with SMTP id 342EA600D1;
 Thu, 11 Jul 2019 20:28:41 +0000 (UTC)
Date: Thu, 11 Jul 2019 16:28:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190711202819.3500-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 11 Jul 2019 20:28:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] pcie: consistent names for function args
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function declarations for pci_cap_slot_get and
pci_cap_slot_write_config call the argument "slot_ctl", but the function
definitions and all the call sites drop the 'o' and call it "slt_ctl".
Let's be consistent.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Fix pcie_cap_slot_write_config too.

 include/hw/pci/pcie.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 34f277735c..8cf3361fc4 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -107,9 +107,9 @@ void pcie_cap_lnkctl_reset(PCIDevice *dev);
 
 void pcie_cap_slot_init(PCIDevice *dev, uint16_t slot);
 void pcie_cap_slot_reset(PCIDevice *dev);
-void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slot_ctl, uint16_t *slt_sta);
+void pcie_cap_slot_get(PCIDevice *dev, uint16_t *slt_ctl, uint16_t *slt_sta);
 void pcie_cap_slot_write_config(PCIDevice *dev,
-                                uint16_t old_slot_ctl, uint16_t old_slt_sta,
+                                uint16_t old_slt_ctl, uint16_t old_slt_sta,
                                 uint32_t addr, uint32_t val, int len);
 int pcie_cap_slot_post_load(void *opaque, int version_id);
 void pcie_cap_slot_push_attention_button(PCIDevice *dev);
-- 
MST

