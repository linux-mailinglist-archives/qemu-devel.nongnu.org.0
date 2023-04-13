Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E826E0D68
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 14:25:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmw0E-0006ir-Ma; Thu, 13 Apr 2023 08:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmw06-0006id-HQ
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:24:30 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghao@kylinos.cn>)
 id 1pmvzu-0006Ad-I8
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 08:24:29 -0400
X-UUID: 0b53447a554d478b8c3569d7eed5435a-20230413
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:17be5b9d-2167-467c-b7a9-7761d87e67a3, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-4
X-CID-INFO: VERSION:1.1.22, REQID:17be5b9d-2167-467c-b7a9-7761d87e67a3, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-4
X-CID-META: VersionHash:120426c, CLOUDID:169cf483-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:230413202403Q01IUCVN,BulkQuantity:0,Recheck:0,SF:42|38|24|17|19|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 0b53447a554d478b8c3569d7eed5435a-20230413
X-User: zenghao@kylinos.cn
Received: from zdzh5-qitianm428-a376.. [(116.128.244.169)] by mailgw
 (envelope-from <zenghao@kylinos.cn>) (Generic MTA)
 with ESMTP id 1147400110; Thu, 13 Apr 2023 20:24:00 +0800
From: Hao Zeng <zenghao@kylinos.cn>
To: qemu-devel@nongnu.org, jonathan.cameron@huawei.com, fan.ni@samsung.com,
 philmd@linaro.org
Cc: Hao Zeng <zenghao@kylinos.cn>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5] cxl-cdat:Fix open file not closed in ct3_load_cdat
Date: Thu, 13 Apr 2023 20:23:58 +0800
Message-Id: <20230413122358.3737557-1-zenghao@kylinos.cn>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Add_By_Label_Mail_Nextpart_001"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=124.126.103.232; envelope-from=zenghao@kylinos.cn;
 helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, PP_MIME_FAKE_ASCII_TEXT=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_TVD_MIME_NO_HEADERS=0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Add_By_Label_Mail_Nextpart_001
Content-Type: text/plain;
Content-Transfer-Encoding: 8bit


Open file descriptor not closed in error paths. Fix by replace
open coded handling of read of whole file into a buffer with
g_file_get_contents()

Fixes: aba578bdac ("hw/cxl: CDAT Data Object Exchange implementation")
Signed-off-by: Zeng Hao <zenghao@kylinos.cn>
Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Suggested-by: Jonathan Cameron via <qemu-devel@nongnu.org>

---
ChangeLog:
    v4-v5:
        fixes some style issues and keep the protection after using g_free()
    v3-v4:
        Modify commit information,No code change.
    v2->v3:
        Submission of v3 on the basis of v2, based on Philippe Mathieu-Daudé's suggestion
        "Pointless bzero in g_malloc0, however this code would be
         simplified using g_file_get_contents()."
    v1->v2:
        - Patch 1: No change in patch v1
        - Patch 2: Fix the check on the return value of fread() in ct3_load_cdat
---
 hw/cxl/cxl-cdat.c | 27 ++++++++-------------------
 1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
index 137abd0992..dd69366797 100644
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
@@ -219,6 +208,6 @@ void cxl_doe_cdat_release(CXLComponentState *cxl_cstate)
                               cdat->private);
     }
     if (cdat->buf) {
-        free(cdat->buf);
+        g_free(cdat->buf);
     }
 }
-- 
2.37.2


--Add_By_Label_Mail_Nextpart_001

Content-type: Text/plain

No virus found
		Checked by Hillstone Network AntiVirus

--Add_By_Label_Mail_Nextpart_001--

