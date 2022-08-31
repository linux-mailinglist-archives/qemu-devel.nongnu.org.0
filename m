Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4335A819E
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:40:24 +0200 (CEST)
Received: from localhost ([::1]:52322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTPpH-0008EY-5a
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oTPjj-0002Q6-Ri
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 11:34:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oTPji-0000mw-2H
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 11:34:39 -0400
Received: from fraeml738-chm.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MHp6L3nHXz6HJCs;
 Wed, 31 Aug 2022 23:30:50 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml738-chm.china.huawei.com (10.206.15.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 31 Aug 2022 17:34:35 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 31 Aug 2022 16:34:34 +0100
To: <qemu-devel@nongnu.org>, <linux-cxl@vger.kernel.org>
CC: Ben Widawsky <bwidawsk@kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: [RFC PATCH 2/3] hw/cxl: Switch to using an array for
 CXLRegisterLocator base addresses.
Date: Wed, 31 Aug 2022 16:33:35 +0100
Message-ID: <20220831153336.16165-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220831153336.16165-1-Jonathan.Cameron@huawei.com>
References: <20220831153336.16165-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Allows for easier looping over entries when adding CPMU instances.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c             |  8 ++++----
 hw/pci-bridge/cxl_downstream.c |  4 ++--
 hw/pci-bridge/cxl_root_port.c  |  4 ++--
 hw/pci-bridge/cxl_upstream.c   |  4 ++--
 include/hw/cxl/cxl_pci.h       | 10 ++++------
 5 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 68d200144b..5d29d2595c 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -44,10 +44,10 @@ static void build_dvsecs(CXLType3Dev *ct3d)
 
     dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
         .rsvd         = 0,
-        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
-        .reg0_base_hi = 0,
-        .reg1_base_lo = RBI_CXL_DEVICE_REG | CXL_DEVICE_REG_BAR_IDX,
-        .reg1_base_hi = 0,
+        .reg_base[0].lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg_base[0].hi = 0,
+        .reg_base[1].lo = RBI_CXL_DEVICE_REG | CXL_DEVICE_REG_BAR_IDX,
+        .reg_base[1].hi = 0,
     };
     cxl_component_create_dvsec(cxl_cstate, CXL2_TYPE3_DEVICE,
                                REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
diff --git a/hw/pci-bridge/cxl_downstream.c b/hw/pci-bridge/cxl_downstream.c
index a361e519d0..7822ccd5de 100644
--- a/hw/pci-bridge/cxl_downstream.c
+++ b/hw/pci-bridge/cxl_downstream.c
@@ -126,8 +126,8 @@ static void build_dvsecs(CXLComponentState *cxl)
 
     dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
         .rsvd         = 0,
-        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
-        .reg0_base_hi = 0,
+        .reg_base[0].lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg_base[0].hi = 0,
     };
     cxl_component_create_dvsec(cxl, CXL2_DOWNSTREAM_PORT,
                                REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
diff --git a/hw/pci-bridge/cxl_root_port.c b/hw/pci-bridge/cxl_root_port.c
index fb213fa06e..08c2441dab 100644
--- a/hw/pci-bridge/cxl_root_port.c
+++ b/hw/pci-bridge/cxl_root_port.c
@@ -87,8 +87,8 @@ static void build_dvsecs(CXLComponentState *cxl)
 
     dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
         .rsvd         = 0,
-        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
-        .reg0_base_hi = 0,
+        .reg_base[0].lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg_base[0].hi = 0,
     };
     cxl_component_create_dvsec(cxl, CXL2_ROOT_PORT,
                                REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index a83a3e81e4..45ee6ba884 100644
--- a/hw/pci-bridge/cxl_upstream.c
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -111,8 +111,8 @@ static void build_dvsecs(CXLComponentState *cxl)
 
     dvsec = (uint8_t *)&(CXLDVSECRegisterLocator){
         .rsvd         = 0,
-        .reg0_base_lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
-        .reg0_base_hi = 0,
+        .reg_base[0].lo = RBI_COMPONENT_REG | CXL_COMPONENT_REG_BAR_IDX,
+        .reg_base[0].hi = 0,
     };
     cxl_component_create_dvsec(cxl, CXL2_UPSTREAM_PORT,
                                REG_LOC_DVSEC_LENGTH, REG_LOC_DVSEC,
diff --git a/include/hw/cxl/cxl_pci.h b/include/hw/cxl/cxl_pci.h
index 01cf002096..8cbeb61142 100644
--- a/include/hw/cxl/cxl_pci.h
+++ b/include/hw/cxl/cxl_pci.h
@@ -141,12 +141,10 @@ QEMU_BUILD_BUG_ON(sizeof(CXLDVSECPortFlexBus) != 0x14);
 typedef struct CXLDVSECRegisterLocator {
     DVSECHeader hdr;
     uint16_t rsvd;
-    uint32_t reg0_base_lo;
-    uint32_t reg0_base_hi;
-    uint32_t reg1_base_lo;
-    uint32_t reg1_base_hi;
-    uint32_t reg2_base_lo;
-    uint32_t reg2_base_hi;
+    struct {
+            uint32_t lo;
+            uint32_t hi;
+    } reg_base[3];
 } CXLDVSECRegisterLocator;
 QEMU_BUILD_BUG_ON(sizeof(CXLDVSECRegisterLocator) != 0x24);
 
-- 
2.32.0


