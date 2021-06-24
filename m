Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B493B2DA6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:19:09 +0200 (CEST)
Received: from localhost ([::1]:34678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNO0-0002WR-Gx
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1lwN5y-0000Bb-OV
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:00:32 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:13775
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1lwN5u-0006tM-F9
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 07:00:30 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A5NdkFKyAdyE84fEDDQEDKrPwSb1zdoMgy1kn?=
 =?us-ascii?q?xilNoH1uEvBw+PrCoB1273XJYVUqOU3I++ruBEDoexq1nqKdibNhXotKNzOLhI?=
 =?us-ascii?q?LHFu9f0bc=3D?=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="110119395"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 24 Jun 2021 19:00:20 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id BB7194C36A1E;
 Thu, 24 Jun 2021 19:00:14 +0800 (CST)
Received: from G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 24 Jun 2021 19:00:04 +0800
Received: from localhost.localdomain (10.167.225.141) by
 G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 24 Jun 2021 19:00:04 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <xiaoguangrong.eric@gmail.com>, <mst@redhat.com>, <imammedo@redhat.com>
Subject: [PATCH] nvdimm: release the correct device list
Date: Thu, 24 Jun 2021 19:04:15 +0800
Message-ID: <20210624110415.187164-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: BB7194C36A1E.ABB51
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lizhijian@fujitsu.com
Received-SPF: neutral client-ip=183.91.158.132;
 envelope-from=lizhijian@fujitsu.com; helo=heian.cn.fujitsu.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 hw/acpi/nvdimm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index e3d5fe19392..ff317263e85 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -355,10 +355,10 @@ nvdimm_build_structure_caps(GArray *structures, uint32_t capabilities)
 
 static GArray *nvdimm_build_device_structure(NVDIMMState *state)
 {
-    GSList *device_list = nvdimm_get_device_list();
+    GSList *device_list, *list = nvdimm_get_device_list();
     GArray *structures = g_array_new(false, true /* clear */, 1);
 
-    for (; device_list; device_list = device_list->next) {
+    for (device_list = list; device_list; device_list = device_list->next) {
         DeviceState *dev = device_list->data;
 
         /* build System Physical Address Range Structure. */
@@ -373,7 +373,7 @@ static GArray *nvdimm_build_device_structure(NVDIMMState *state)
         /* build NVDIMM Control Region Structure. */
         nvdimm_build_structure_dcr(structures, dev);
     }
-    g_slist_free(device_list);
+    g_slist_free(list);
 
     if (state->persistence) {
         nvdimm_build_structure_caps(structures, state->persistence);
@@ -1339,9 +1339,9 @@ static void nvdimm_build_ssdt(GArray *table_offsets, GArray *table_data,
 
 void nvdimm_build_srat(GArray *table_data)
 {
-    GSList *device_list = nvdimm_get_device_list();
+    GSList *device_list, *list = nvdimm_get_device_list();
 
-    for (; device_list; device_list = device_list->next) {
+    for (device_list = list; device_list; device_list = device_list->next) {
         AcpiSratMemoryAffinity *numamem = NULL;
         DeviceState *dev = device_list->data;
         Object *obj = OBJECT(dev);
@@ -1356,7 +1356,7 @@ void nvdimm_build_srat(GArray *table_data)
         build_srat_memory(numamem, addr, size, node,
                           MEM_AFFINITY_ENABLED | MEM_AFFINITY_NON_VOLATILE);
     }
-    g_slist_free(device_list);
+    g_slist_free(list);
 }
 
 void nvdimm_build_acpi(GArray *table_offsets, GArray *table_data,
-- 
2.31.1




