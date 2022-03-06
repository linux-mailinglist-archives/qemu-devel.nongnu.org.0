Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509344CED32
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 19:24:01 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQvY0-00037G-En
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 13:24:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQvFf-0004ok-TL
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 13:05:03 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nQvFe-00052o-5K
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 13:05:03 -0500
Received: from fraeml715-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KBTws1y4yz67Jb4;
 Mon,  7 Mar 2022 02:03:41 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml715-chm.china.huawei.com (10.206.15.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 19:05:00 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.21; Sun, 6 Mar 2022 18:04:59 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v7 46/46] cxl/cxl-host: Support interleave decoding with one
 level of switches.
Date: Sun, 6 Mar 2022 17:41:37 +0000
Message-ID: <20220306174137.5707-47-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

Extend the walk of the CXL bus during interleave decoding to take
into account one layer of switches.

Whilst theoretically CXL 2.0 allows multiple switch levels, in the
vast majority of usecases only one level is expected and currently
that is all the proposed Linux support provides.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-host.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index a1eafa89bb..ac20d9e2f5 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -130,8 +130,9 @@ static bool cxl_hdm_find_target(uint32_t *cache_mem, hwaddr addr,
 
 static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
 {
-    CXLComponentState *hb_cstate;
+    CXLComponentState *hb_cstate, *usp_cstate;
     PCIHostState *hb;
+    CXLUpstreamPort *usp;
     int rb_index;
     uint32_t *cache_mem;
     uint8_t target;
@@ -166,7 +167,46 @@ static PCIDevice *cxl_cfmws_find_device(CXLFixedWindow *fw, hwaddr addr)
 
     d = pci_bridge_get_sec_bus(PCI_BRIDGE(rp))->devices[0];
 
-    if (!d || !object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3_DEV)) {
+    if (!d) {
+        return NULL;
+    }
+
+    if (object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3_DEV)) {
+        return d;
+    }
+
+    /*
+     * Could also be a switch.  Note only one level of switching currently
+     * supported.
+     */
+    if (!object_dynamic_cast(OBJECT(d), TYPE_CXL_USP)) {
+        return NULL;
+    }
+    usp = CXL_USP(d);
+
+    usp_cstate = cxl_usp_to_cstate(usp);
+    if (!usp_cstate) {
+        return NULL;
+    }
+
+    cache_mem = usp_cstate->crb.cache_mem_registers;
+
+    target_found = cxl_hdm_find_target(cache_mem, addr, &target);
+    if (!target_found) {
+        return NULL;
+    }
+
+    d = pcie_find_port_by_pn(&PCI_BRIDGE(d)->sec_bus, target);
+    if (!d) {
+        return NULL;
+    }
+
+    d = pci_bridge_get_sec_bus(PCI_BRIDGE(d))->devices[0];
+    if (!d) {
+        return NULL;
+    }
+
+    if (!object_dynamic_cast(OBJECT(d), TYPE_CXL_TYPE3_DEV)) {
         return NULL;
     }
 
-- 
2.32.0


