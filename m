Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA3F4F1881
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:34:11 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbOiY-0002RF-7I
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:34:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nbOda-0000tD-GT
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:29:02 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1nbOdY-00065I-NJ
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:29:02 -0400
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4KXF4f4gd7z67Xcd;
 Mon,  4 Apr 2022 23:26:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 17:28:58 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 4 Apr 2022 16:28:57 +0100
To: <linuxarm@huawei.com>, <qemu-devel@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, Marcel Apfelbaum
 <marcel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>
CC: <linux-cxl@vger.kernel.org>, Ben Widawsky <ben.widawsky@intel.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Shameerali Kolothum Thodi
 <shameerali.kolothum.thodi@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Peter Xu
 <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Saransh Gupta1 <saransh@ibm.com>, Shreyas Shah
 <shreyas.shah@elastics.cloud>, Chris Browy <cbrowy@avery-design.com>,
 "Samarth Saxena" <samarths@cadence.com>, Dan Williams
 <dan.j.williams@intel.com>, "k . jensen @ samsung . com"
 <k.jensen@samsung.com>, Tong Zhang <t.zhang2@samsung.com>,
 <dave@stgolabs.net>, Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH v9 28/45] acpi/cxl: Introduce CFMWS structures in CEDT
Date: Mon, 4 Apr 2022 16:14:28 +0100
Message-ID: <20220404151445.10955-29-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
References: <20220404151445.10955-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml717-chm.china.huawei.com (10.201.108.68) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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

From: Ben Widawsky <ben.widawsky@intel.com>

The CEDT CXL Fixed Window Memory Window Structures (CFMWs)
define regions of the host phyiscal address map which
(via an impdef means) are configured such that they have
a particular interleave setup across one or more CXL Host Bridges.

Reported-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/acpi/cxl.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
index aa4af86a4c..31d5235136 100644
--- a/hw/acpi/cxl.c
+++ b/hw/acpi/cxl.c
@@ -60,6 +60,64 @@ static void cedt_build_chbs(GArray *table_data, PXBDev *cxl)
     build_append_int_noprefix(table_data, memory_region_size(mr), 8);
 }
 
+/*
+ * CFMWS entries in CXL 2.0 ECN: CEDT CFMWS & QTG _DSM.
+ * Interleave ways encoding in CXL 2.0 ECN: 3, 6, 12 and 16-way memory
+ * interleaving.
+ */
+static void cedt_build_cfmws(GArray *table_data, MachineState *ms)
+{
+    CXLState *cxls = ms->cxl_devices_state;
+    GList *it;
+
+    for (it = cxls->fixed_windows; it; it = it->next) {
+        CXLFixedWindow *fw = it->data;
+        int i;
+
+        /* Type */
+        build_append_int_noprefix(table_data, 1, 1);
+
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 1);
+
+        /* Record Length */
+        build_append_int_noprefix(table_data, 36 + 4 * fw->num_targets, 2);
+
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 4);
+
+        /* Base HPA */
+        build_append_int_noprefix(table_data, fw->mr.addr, 8);
+
+        /* Window Size */
+        build_append_int_noprefix(table_data, fw->size, 8);
+
+        /* Host Bridge Interleave Ways */
+        build_append_int_noprefix(table_data, fw->enc_int_ways, 1);
+
+        /* Host Bridge Interleave Arithmetic */
+        build_append_int_noprefix(table_data, 0, 1);
+
+        /* Reserved */
+        build_append_int_noprefix(table_data, 0, 2);
+
+        /* Host Bridge Interleave Granularity */
+        build_append_int_noprefix(table_data, fw->enc_int_gran, 4);
+
+        /* Window Restrictions */
+        build_append_int_noprefix(table_data, 0x0f, 2); /* No restrictions */
+
+        /* QTG ID */
+        build_append_int_noprefix(table_data, 0, 2);
+
+        /* Host Bridge List (list of UIDs - currently bus_nr) */
+        for (i = 0; i < fw->num_targets; i++) {
+            g_assert(fw->target_hbs[i]);
+            build_append_int_noprefix(table_data, fw->target_hbs[i]->bus_nr, 4);
+        }
+    }
+}
+
 static int cxl_foreach_pxb_hb(Object *obj, void *opaque)
 {
     Aml *cedt = opaque;
@@ -86,6 +144,7 @@ void cxl_build_cedt(MachineState *ms, GArray *table_offsets, GArray *table_data,
     /* reserve space for CEDT header */
 
     object_child_foreach_recursive(object_get_root(), cxl_foreach_pxb_hb, cedt);
+    cedt_build_cfmws(cedt->buf, ms);
 
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, cedt->buf->data, cedt->buf->len);
-- 
2.32.0


