Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F6442594A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:21:38 +0200 (CEST)
Received: from localhost ([::1]:46652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX5N-0004le-Dm
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWKv-000721-5P; Thu, 07 Oct 2021 12:33:37 -0400
Received: from mga06.intel.com ([134.134.136.31]:50270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWKs-0002V0-V8; Thu, 07 Oct 2021 12:33:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287184271"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="287184271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:25:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325693"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:25:46 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] pcie: Set default and supported MaxReadReq to 512
Date: Thu,  7 Oct 2021 18:23:52 +0200
Message-Id: <20211007162406.1920374-2-lukasz.maniak@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
References: <20211007162406.1920374-1-lukasz.maniak@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=134.134.136.31;
 envelope-from=lukasz.maniak@linux.intel.com; helo=mga06.intel.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 07 Oct 2021 13:12:41 -0400
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Knut Omang <knut.omang@oracle.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, Knut Omang <knuto@ifi.uio.no>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Knut Omang <knut.omang@oracle.com>

Make the default PCI Express Capability for PCIe devices set
MaxReadReq to 512. Tyipcal modern devices people would want to
emulate or simulate would want this. The previous value would
cause warnings from the root port driver on some kernels.

Signed-off-by: Knut Omang <knuto@ifi.uio.no>
---
 hw/pci/pcie.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 6e95d82903..c1a12f3744 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -62,8 +62,9 @@ pcie_cap_v1_fill(PCIDevice *dev, uint8_t port, uint8_t type, uint8_t version)
      * Functions conforming to the ECN, PCI Express Base
      * Specification, Revision 1.1., or subsequent PCI Express Base
      * Specification revisions.
+     *  + set max payload size to 256, which seems to be a common value
      */
-    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER);
+    pci_set_long(exp_cap + PCI_EXP_DEVCAP, PCI_EXP_DEVCAP_RBER | (0x1 & PCI_EXP_DEVCAP_PAYLOAD));
 
     pci_set_long(exp_cap + PCI_EXP_LNKCAP,
                  (port << PCI_EXP_LNKCAP_PN_SHIFT) |
@@ -179,6 +180,8 @@ int pcie_cap_init(PCIDevice *dev, uint8_t offset,
     pci_set_long(exp_cap + PCI_EXP_DEVCAP2,
                  PCI_EXP_DEVCAP2_EFF | PCI_EXP_DEVCAP2_EETLPP);
 
+    pci_set_word(exp_cap + PCI_EXP_DEVCTL, PCI_EXP_DEVCTL_READRQ_256B);
+
     pci_set_word(dev->wmask + pos + PCI_EXP_DEVCTL2, PCI_EXP_DEVCTL2_EETLPPB);
 
     if (dev->cap_present & QEMU_PCIE_EXTCAP_INIT) {
-- 
2.25.1


