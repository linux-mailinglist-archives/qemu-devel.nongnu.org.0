Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5150C68E93F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 08:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPf9A-0005rR-4H; Wed, 08 Feb 2023 02:45:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1pPf93-0005r6-Ad
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:45:33 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1pPf90-0000zv-SZ
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 02:45:33 -0500
Received: from kwepemm600007.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PBX6H5j99zmWqs;
 Wed,  8 Feb 2023 15:43:03 +0800 (CST)
Received: from DESKTOP-6NKE0BC.china.huawei.com (10.174.185.210) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 8 Feb 2023 15:45:15 +0800
To: Markus Armbruster <armbru@redhat.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <wanghaibin.wang@huawei.com>, <yuzenghui@huawei.com>,
 <zhukeqian1@huawei.com>, Kunkun Jiang <jiangkunkun@huawei.com>
Subject: [PATCH] qmp: Add error proofing for query-acpi-ospm-status
Date: Wed, 8 Feb 2023 15:45:01 +0800
Message-ID: <20230208074501.1225-1-jiangkunkun@huawei.com>
X-Mailer: git-send-email 2.26.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=jiangkunkun@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Kunkun Jiang <jiangkunkun@huawei.com>
From:  Kunkun Jiang via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The ACPI device may not implement the ospm_status callback. Executing
qmp "query-acpi-ospm-status" will cause segmentation fault. Add error
proofing add log to avoid such serious consequences.

Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
---
 monitor/qmp-cmds.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index bf22a8c5a6..7652613635 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -229,7 +229,12 @@ ACPIOSTInfoList *qmp_query_acpi_ospm_status(Error **errp)
         AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(obj);
         AcpiDeviceIf *adev = ACPI_DEVICE_IF(obj);
 
-        adevc->ospm_status(adev, &prev);
+        if (adevc->ospm_status) {
+            adevc->ospm_status(adev, &prev);
+        } else {
+            error_setg(errp, "command is not supported, "
+                             "ACPI device missing ospm_status callback");
+        }
     } else {
         error_setg(errp, "command is not supported, missing ACPI device");
     }
-- 
2.33.0


