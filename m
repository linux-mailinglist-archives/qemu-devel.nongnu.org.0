Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD86EAB6C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:21:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqhY-0006hB-41; Fri, 21 Apr 2023 09:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppqhW-0006gf-FZ
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:21:22 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppqhU-0002Qq-JB
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:21:22 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2w5p48zxz67lVP;
 Fri, 21 Apr 2023 21:16:30 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 14:21:17 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 <linuxarm@huawei.com>, Zeng Hao <zenghao@kylinos.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/cxl: cdat: Fix failure to free buffer in erorr paths
Date: Fri, 21 Apr 2023 14:20:20 +0100
Message-ID: <20230421132020.7408-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421132020.7408-1-Jonathan.Cameron@huawei.com>
References: <20230421132020.7408-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The failure paths in CDAT file loading did not clear up properly.
Change to using g_auto_free and a local pointer for the buffer to
ensure this function has no side effects on error.
Also drop some unnecessary checks that can not fail.

Cleanup properly after a failure to load a CDAT file.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 hw/cxl/cxl-cdat.c            | 33 ++++++++++++++++++---------------
 hw/mem/cxl_type3.c           |  4 ++++
 hw/pci-bridge/cxl_upstream.c |  3 +++
 3 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 056711d63d..d246d6885b 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -108,6 +108,7 @@ static void ct3_build_cdat(CDATObject *cdat, Error **errp)
 static void ct3_load_cdat(CDATObject *cdat, Error **errp)
 {
     g_autofree CDATEntry *cdat_st = NULL;
+    g_autofree char *buf = NULL;
     uint8_t sum = 0;
     int num_ent;
     int i = 0, ent = 1;
@@ -116,7 +117,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
     GError *error = NULL;
 
     /* Read CDAT file and create its cache */
-    if (!g_file_get_contents(cdat->filename, (gchar **)&cdat->buf,
+    if (!g_file_get_contents(cdat->filename, (gchar **)&buf,
                              &file_size, &error)) {
         error_setg(errp, "CDAT: File read failed: %s", error->message);
         g_error_free(error);
@@ -129,9 +130,17 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
     i = sizeof(CDATTableHeader);
     num_ent = 1;
     while (i < file_size) {
-        hdr = (CDATSubHeader *)(cdat->buf + i);
+        hdr = (CDATSubHeader *)(buf + i);
+        if (i + sizeof(CDATSubHeader) > file_size) {
+            error_setg(errp, "CDAT: Truncated table");
+            return;
+        }
         cdat_len_check(hdr, errp);
         i += hdr->length;
+        if (i > file_size) {
+            error_setg(errp, "CDAT: Truncated table");
+            return;
+        }
         num_ent++;
     }
     if (i != file_size) {
@@ -139,33 +148,26 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
         return;
     }
 
-    cdat_st = g_malloc0(sizeof(*cdat_st) * num_ent);
-    if (!cdat_st) {
-        error_setg(errp, "CDAT: Failed to allocate entry array");
-        return;
-    }
+    cdat_st = g_new0(CDATEntry, num_ent);
 
     /* Set CDAT header, Entry = 0 */
-    cdat_st[0].base = cdat->buf;
+    cdat_st[0].base = buf;
     cdat_st[0].length = sizeof(CDATTableHeader);
     i = 0;
 
     while (i < cdat_st[0].length) {
-        sum += cdat->buf[i++];
+        sum += buf[i++];
     }
 
     /* Read CDAT structures */
     while (i < file_size) {
-        hdr = (CDATSubHeader *)(cdat->buf + i);
-        cdat_len_check(hdr, errp);
-
+        hdr = (CDATSubHeader *)(buf + i);
         cdat_st[ent].base = hdr;
         cdat_st[ent].length = hdr->length;
 
-        while (cdat->buf + i <
-               (uint8_t *)cdat_st[ent].base + cdat_st[ent].length) {
+        while (buf + i < (char *)cdat_st[ent].base + cdat_st[ent].length) {
             assert(i < file_size);
-            sum += cdat->buf[i++];
+            sum += buf[i++];
         }
 
         ent++;
@@ -176,6 +178,7 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
     }
     cdat->entry_len = num_ent;
     cdat->entry = g_steal_pointer(&cdat_st);
+    cdat->buf = g_steal_pointer(&buf);
 }
 
 void cxl_doe_cdat_init(CXLComponentState *cxl_cstate, Error **errp)
diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index abe60b362c..7647122cc6 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -593,6 +593,9 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     cxl_cstate->cdat.free_cdat_table = ct3_free_cdat_table;
     cxl_cstate->cdat.private = ct3d;
     cxl_doe_cdat_init(cxl_cstate, errp);
+    if (*errp) {
+        goto err_free_special_ops;
+    }
 
     pcie_cap_deverr_init(pci_dev);
     /* Leave a bit of room for expansion */
@@ -605,6 +608,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 
 err_release_cdat:
     cxl_doe_cdat_release(cxl_cstate);
+err_free_special_ops:
     g_free(regs->special_ops);
 err_address_space_free:
     address_space_destroy(&ct3d->hostmem_as);
diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index 9df436cb73..ef47e5d625 100644
--- a/hw/pci-bridge/cxl_upstream.c
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -346,6 +346,9 @@ static void cxl_usp_realize(PCIDevice *d, Error **errp)
     cxl_cstate->cdat.free_cdat_table = free_default_cdat_table;
     cxl_cstate->cdat.private = d;
     cxl_doe_cdat_init(cxl_cstate, errp);
+    if (*errp) {
+        goto err_cap;
+    }
 
     return;
 
-- 
2.37.2


