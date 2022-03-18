Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A04DDD0D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 16:34:51 +0100 (CET)
Received: from localhost ([::1]:53880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVEcs-0004fj-6c
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 11:34:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nVESq-0004Ah-4y
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:24:28 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nVESo-0005sr-FV
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 11:24:27 -0400
Received: from fraeml704-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KKnnF6kXhz6H6sr;
 Fri, 18 Mar 2022 23:22:25 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml704-chm.china.huawei.com (10.206.15.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 18 Mar 2022 16:24:24 +0100
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 18 Mar 2022 15:24:23 +0000
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, "Mark Cave-Ayland"
 <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v8 35/46] i386/pc: Enable CXL fixed memory windows
Date: Fri, 18 Mar 2022 15:06:24 +0000
Message-ID: <20220318150635.24600-36-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
References: <20220318150635.24600-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

From: Jonathan Cameron <jonathan.cameron@huawei.com>

Add the CFMWs memory regions to the memorymap and adjust the
PCI window to avoid hitting the same memory.

Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 hw/i386/pc.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index da74f08f9e..48a86ac8a4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -814,7 +814,7 @@ void pc_memory_init(PCMachineState *pcms,
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(pcms);
-    hwaddr cxl_base;
+    hwaddr cxl_base, cxl_resv_end = 0;
 
     assert(machine->ram_size == x86ms->below_4g_mem_size +
                                 x86ms->above_4g_mem_size);
@@ -922,6 +922,24 @@ void pc_memory_init(PCMachineState *pcms,
         e820_add_entry(cxl_base, cxl_size, E820_RESERVED);
         memory_region_init(mr, OBJECT(machine), "cxl_host_reg", cxl_size);
         memory_region_add_subregion(system_memory, cxl_base, mr);
+        cxl_resv_end = cxl_base + cxl_size;
+        if (machine->cxl_devices_state->fixed_windows) {
+            hwaddr cxl_fmw_base;
+            GList *it;
+
+            cxl_fmw_base = ROUND_UP(cxl_base + cxl_size, 256 * MiB);
+            for (it = machine->cxl_devices_state->fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+
+                fw->base = cxl_fmw_base;
+                memory_region_init_io(&fw->mr, OBJECT(machine), &cfmws_ops, fw,
+                                      "cxl-fixed-memory-region", fw->size);
+                memory_region_add_subregion(system_memory, fw->base, &fw->mr);
+                e820_add_entry(fw->base, fw->size, E820_RESERVED);
+                cxl_fmw_base += fw->size;
+                cxl_resv_end = cxl_fmw_base;
+            }
+        }
     }
 
     /* Initialize PC system firmware */
@@ -951,6 +969,10 @@ void pc_memory_init(PCMachineState *pcms,
         if (!pcmc->broken_reserved_end) {
             res_mem_end += memory_region_size(&machine->device_memory->mr);
         }
+
+        if (machine->cxl_devices_state->is_enabled) {
+            res_mem_end = cxl_resv_end;
+        }
         *val = cpu_to_le64(ROUND_UP(res_mem_end, 1 * GiB));
         fw_cfg_add_file(fw_cfg, "etc/reserved-memory-end", val, sizeof(*val));
     }
@@ -987,6 +1009,13 @@ uint64_t pc_pci_hole64_start(void)
     if (ms->cxl_devices_state->host_mr.addr) {
         hole64_start = ms->cxl_devices_state->host_mr.addr +
             memory_region_size(&ms->cxl_devices_state->host_mr);
+        if (ms->cxl_devices_state->fixed_windows) {
+            GList *it;
+            for (it = ms->cxl_devices_state->fixed_windows; it; it = it->next) {
+                CXLFixedWindow *fw = it->data;
+                hole64_start = fw->mr.addr + memory_region_size(&fw->mr);
+            }
+        }
     } else if (pcmc->has_reserved_memory && ms->device_memory->base) {
         hole64_start = ms->device_memory->base;
         if (!pcmc->broken_reserved_end) {
-- 
2.32.0


