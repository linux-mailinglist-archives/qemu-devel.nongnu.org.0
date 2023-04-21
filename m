Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB76EAB6A
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:21:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqhC-0005Xa-T0; Fri, 21 Apr 2023 09:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppqh4-0005R8-US
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:20:54 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1ppqh0-0002LR-Cz
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:20:53 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Q2w5C61HWz67FSP;
 Fri, 21 Apr 2023 21:15:59 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 21 Apr 2023 14:20:47 +0100
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "Michael S . Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 <linuxarm@huawei.com>, Zeng Hao <zenghao@kylinos.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] hw/cxl: cdat: Fix open file not closed in ct3_load_cdat()
Date: Fri, 21 Apr 2023 14:20:19 +0100
Message-ID: <20230421132020.7408-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230421132020.7408-1-Jonathan.Cameron@huawei.com>
References: <20230421132020.7408-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

From: Hao Zeng <zenghao@kylinos.cn>

Open file descriptor not closed in error paths. Fix by replace
open coded handling of read of whole file into a buffer with
g_file_get_contents()

Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange implementation")
Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Jonathan Cameron via <qemu-devel@nongnu.org>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

--
Changes since v5:
- Drop if guard on g_free() as per checkpatch warning.
---
 hw/cxl/cxl-cdat.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 137abd0992..056711d63d 100644
--- a/hw/cxl/cxl-cdat.c
+++ b/hw/cxl/cxl-cdat.c
@@ -110,29 +110,18 @@ static void ct3_load_cdat(CDATObject *cdat, Error **errp)
     g_autofree CDATEntry *cdat_st = NULL;
     uint8_t sum = 0;
     int num_ent;
-    int i = 0, ent = 1, file_size = 0;
+    int i = 0, ent = 1;
+    gsize file_size = 0;
     CDATSubHeader *hdr;
-    FILE *fp = NULL;
+    GError *error = NULL;
 
     /* Read CDAT file and create its cache */
-    fp = fopen(cdat->filename, "r");
-    if (!fp) {
-        error_setg(errp, "CDAT: Unable to open file");
+    if (!g_file_get_contents(cdat->filename, (gchar **)&cdat->buf,
+                             &file_size, &error)) {
+        error_setg(errp, "CDAT: File read failed: %s", error->message);
+        g_error_free(error);
         return;
     }
-
-    fseek(fp, 0, SEEK_END);
-    file_size = ftell(fp);
-    fseek(fp, 0, SEEK_SET);
-    cdat->buf = g_malloc0(file_size);
-
-    if (fread(cdat->buf, file_size, 1, fp) == 0) {
-        error_setg(errp, "CDAT: File read failed");
-        return;
-    }
-
-    fclose(fp);
-
     if (file_size < sizeof(CDATTableHeader)) {
         error_setg(errp, "CDAT: File too short");
         return;
@@ -218,7 +207,5 @@ void cxl_doe_cdat_release(CXLComponentState *cxl_cstate)
         cdat->free_cdat_table(cdat->built_buf, cdat->built_buf_len,
                               cdat->private);
     }
-    if (cdat->buf) {
-        free(cdat->buf);
-    }
+    g_free(cdat->buf);
 }
-- 
2.37.2


