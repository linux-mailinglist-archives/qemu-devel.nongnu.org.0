Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 344604987D3
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 19:07:31 +0100 (CET)
Received: from localhost ([::1]:36642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3kY-0000bw-9w
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 13:07:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3Ee-0003zi-Gp
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:34:32 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56]:2202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nC3Ec-0001ud-GF
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:34:32 -0500
Received: from fraeml745-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4JjH894zpbz6GD7r;
 Tue, 25 Jan 2022 01:31:05 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml745-chm.china.huawei.com (10.206.15.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 18:34:28 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 24 Jan 2022 17:34:27 +0000
To: <qemu-devel@nongnu.org>, Marcel Apfelbaum <marcel@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, <linuxarm@huawei.com>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Saransh Gupta1
 <saransh@ibm.com>, Shreyas Shah <shreyas.shah@elastics.cloud>, Chris Browy
 <cbrowy@avery-design.com>, Samarth Saxena <samarths@cadence.com>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: [PATCH v4 34/42] mem/cxl_type3: Add read and write functions for
 associated hostmem.
Date: Mon, 24 Jan 2022 17:16:57 +0000
Message-ID: <20220124171705.10432-35-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml740-chm.china.huawei.com (10.201.108.190) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Once a read or write reaches a CXL type 3 device, the HDM decoders
on the device are used to establish the Device Physical Address
which should be accessed.  These functions peform the required maths
and then directly access the hostmem->mr to fullfil the actual
operation.  Note that failed writes are silent, but failed reads
return poison.  Note this is based loosely on:

https://lore.kernel.org/qemu-devel/20200817161853.593247-6-f4bug@amsat.org/
[RFC PATCH 0/9] hw/misc: Add support for interleaved memory accesses

Only lightly tested so far.  More complex test cases yet to be written.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/mem/cxl_type3.c          | 81 +++++++++++++++++++++++++++++++++++++
 include/hw/cxl/cxl_device.h |  5 +++
 2 files changed, 86 insertions(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index e99d84c92d..eb0203dcbc 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -161,6 +161,87 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
                      &ct3d->cxl_dstate.device_registers);
 }
 
+/* TODO: Support multiple HDM decoders and DPA skip */
+static bool cxl_type3_dpa(CXLType3Dev *ct3d, hwaddr host_addr, uint64_t *dpa)
+{
+    uint32_t *cache_mem = ct3d->cxl_cstate.crb.cache_mem_registers;
+    uint64_t decoder_base, decoder_size, hpa_offset;
+    uint32_t hdm0_ctrl;
+    int ig, iw;
+
+    decoder_base = (((uint64_t)cache_mem[R_CXL_HDM_DECODER0_BASE_HI] << 32) |
+                    cache_mem[R_CXL_HDM_DECODER0_BASE_LO]);
+    if ((uint64_t)host_addr < decoder_base) {
+        return false;
+    }
+
+    hpa_offset = (uint64_t)host_addr - decoder_base;
+
+    decoder_size = ((uint64_t)cache_mem[R_CXL_HDM_DECODER0_SIZE_HI] << 32) |
+        cache_mem[R_CXL_HDM_DECODER0_SIZE_LO];
+    if (hpa_offset >= decoder_size) {
+        return false;
+    }
+
+    hdm0_ctrl = cache_mem[R_CXL_HDM_DECODER0_CTRL];
+    iw = FIELD_EX32(hdm0_ctrl, CXL_HDM_DECODER0_CTRL, IW);
+    ig = FIELD_EX32(hdm0_ctrl, CXL_HDM_DECODER0_CTRL, IG);
+
+    *dpa = (MAKE_64BIT_MASK(0, 8 + ig) & hpa_offset) |
+        ((MAKE_64BIT_MASK(8 + ig + iw, 64 - 8 - ig - iw) & hpa_offset) >> iw);
+
+    return true;
+}
+
+MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
+                           unsigned size, MemTxAttrs attrs)
+{
+    CXLType3Dev *ct3d = CT3(d);
+    uint64_t dpa_offset;
+    MemoryRegion *mr;
+
+    /* TODO support volatile region */
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        return MEMTX_ERROR;
+    }
+
+    if (!cxl_type3_dpa(ct3d, host_addr, &dpa_offset)) {
+        return MEMTX_ERROR;
+    }
+
+    if (dpa_offset > mr->size) {
+        return MEMTX_ERROR;
+    }
+
+    return memory_region_dispatch_read(mr, dpa_offset, data,
+                                       size_memop(size), attrs);
+}
+
+MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
+                            unsigned size, MemTxAttrs attrs)
+{
+    CXLType3Dev *ct3d = CT3(d);
+    uint64_t dpa_offset;
+    MemoryRegion *mr;
+
+    mr = host_memory_backend_get_memory(ct3d->hostmem);
+    if (!mr) {
+        return MEMTX_OK;
+    }
+
+    if (!cxl_type3_dpa(ct3d, host_addr, &dpa_offset)) {
+        return MEMTX_OK;
+    }
+
+    if (dpa_offset > mr->size) {
+        return MEMTX_OK;
+    }
+
+    return memory_region_dispatch_write(mr, dpa_offset, data,
+                                        size_memop(size), attrs);
+}
+
 static void ct3d_reset(DeviceState *dev)
 {
     CXLType3Dev *ct3d = CT3(dev);
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index 0426714e9b..0f6adbae32 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -258,4 +258,9 @@ struct CXLType3Class {
                     uint64_t offset);
 };
 
+MemTxResult cxl_type3_read(PCIDevice *d, hwaddr host_addr, uint64_t *data,
+                           unsigned size, MemTxAttrs attrs);
+MemTxResult cxl_type3_write(PCIDevice *d, hwaddr host_addr, uint64_t data,
+                            unsigned size, MemTxAttrs attrs);
+
 #endif
-- 
2.32.0


