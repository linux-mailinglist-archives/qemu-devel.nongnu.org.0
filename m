Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F642594F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:23:01 +0200 (CEST)
Received: from localhost ([::1]:52108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX6i-0008LJ-3m
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWL7-0007LX-96; Thu, 07 Oct 2021 12:33:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:50288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasz.maniak@linux.intel.com>)
 id 1mYWL4-0002eE-S6; Thu, 07 Oct 2021 12:33:49 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287184368"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="287184368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:25:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="624325771"
Received: from lmaniak-dev.igk.intel.com ([10.55.248.48])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:25:53 -0700
From: Lukasz Maniak <lukasz.maniak@linux.intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/15] pcie: Add callback preceding SR-IOV VFs update
Date: Thu,  7 Oct 2021 18:23:55 +0200
Message-Id: <20211007162406.1920374-5-lukasz.maniak@linux.intel.com>
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
Cc: =?UTF-8?q?=C5=81ukasz=20Gieryk?= <lukasz.gieryk@linux.intel.com>,
 Lukasz Maniak <lukasz.maniak@linux.intel.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PCIe devices implementing SR-IOV may need to perform certain actions
before the VFs are unrealized or vice versa.

Signed-off-by: Lukasz Maniak <lukasz.maniak@linux.intel.com>
---
 docs/pcie_sriov.txt         |  2 +-
 hw/pci/pcie_sriov.c         | 14 +++++++++++++-
 include/hw/pci/pcie_sriov.h |  8 +++++++-
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/docs/pcie_sriov.txt b/docs/pcie_sriov.txt
index f5e891e1d4..63ca1a7b8e 100644
--- a/docs/pcie_sriov.txt
+++ b/docs/pcie_sriov.txt
@@ -57,7 +57,7 @@ setting up a BAR for a VF.
       /* Add and initialize the SR/IOV capability */
       pcie_sriov_pf_init(d, 0x200, "your_virtual_dev",
                        vf_devid, initial_vfs, total_vfs,
-                       fun_offset, stride);
+                       fun_offset, stride, pre_vfs_update_cb);
 
       /* Set up individual VF BARs (parameters as for normal BARs) */
       pcie_sriov_pf_init_vf_bar( ... )
diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 501a1ff433..cac2aee061 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -30,7 +30,8 @@ static void unregister_vfs(PCIDevice *dev);
 void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
                         const char *vfname, uint16_t vf_dev_id,
                         uint16_t init_vfs, uint16_t total_vfs,
-                        uint16_t vf_offset, uint16_t vf_stride)
+                        uint16_t vf_offset, uint16_t vf_stride,
+                        SriovVfsUpdate pre_vfs_update)
 {
     uint8_t *cfg = dev->config + offset;
     uint8_t *wmask;
@@ -41,6 +42,7 @@ void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
     dev->exp.sriov_pf.num_vfs = 0;
     dev->exp.sriov_pf.vfname = g_strdup(vfname);
     dev->exp.sriov_pf.vf = NULL;
+    dev->exp.sriov_pf.pre_vfs_update = pre_vfs_update;
 
     pci_set_word(cfg + PCI_SRIOV_VF_OFFSET, vf_offset);
     pci_set_word(cfg + PCI_SRIOV_VF_STRIDE, vf_stride);
@@ -180,6 +182,11 @@ static void register_vfs(PCIDevice *dev)
     assert(dev->exp.sriov_pf.vf);
 
     trace_sriov_register_vfs(SRIOV_ID(dev), num_vfs);
+
+    if (dev->exp.sriov_pf.pre_vfs_update) {
+        dev->exp.sriov_pf.pre_vfs_update(dev, dev->exp.sriov_pf.num_vfs, num_vfs);
+    }
+
     for (i = 0; i < num_vfs; i++) {
         dev->exp.sriov_pf.vf[i] = register_vf(dev, devfn, dev->exp.sriov_pf.vfname, i);
         if (!dev->exp.sriov_pf.vf[i]) {
@@ -198,6 +205,11 @@ static void unregister_vfs(PCIDevice *dev)
     uint16_t i;
 
     trace_sriov_unregister_vfs(SRIOV_ID(dev), num_vfs);
+
+    if (dev->exp.sriov_pf.pre_vfs_update) {
+        dev->exp.sriov_pf.pre_vfs_update(dev, dev->exp.sriov_pf.num_vfs, 0);
+    }
+
     for (i = 0; i < num_vfs; i++) {
         PCIDevice *vf = dev->exp.sriov_pf.vf[i];
         object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 0974f00054..9ab48b79c0 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -13,11 +13,16 @@
 #ifndef QEMU_PCIE_SRIOV_H
 #define QEMU_PCIE_SRIOV_H
 
+typedef void (*SriovVfsUpdate)(PCIDevice *dev, uint16_t prev_num_vfs,
+                               uint16_t num_vfs);
+
 struct PCIESriovPF {
     uint16_t num_vfs;           /* Number of virtual functions created */
     uint8_t vf_bar_type[PCI_NUM_REGIONS];  /* Store type for each VF bar */
     const char *vfname;         /* Reference to the device type used for the VFs */
     PCIDevice **vf;             /* Pointer to an array of num_vfs VF devices */
+
+    SriovVfsUpdate pre_vfs_update;  /* Callback preceding VFs count change */
 };
 
 struct PCIESriovVF {
@@ -28,7 +33,8 @@ struct PCIESriovVF {
 void pcie_sriov_pf_init(PCIDevice *dev, uint16_t offset,
                         const char *vfname, uint16_t vf_dev_id,
                         uint16_t init_vfs, uint16_t total_vfs,
-                        uint16_t vf_offset, uint16_t vf_stride);
+                        uint16_t vf_offset, uint16_t vf_stride,
+                        SriovVfsUpdate pre_vfs_update);
 void pcie_sriov_pf_exit(PCIDevice *dev);
 
 /* Set up a VF bar in the SR/IOV bar area */
-- 
2.25.1


