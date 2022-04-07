Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52E4F7916
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 10:07:53 +0200 (CEST)
Received: from localhost ([::1]:38116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncNBH-0007ev-Qk
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 04:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1ncN6k-0006nr-Hl
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:03:12 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:5142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1ncN6h-00072G-Oa
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 04:03:10 -0400
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KYv2H4lhhzFpXl;
 Thu,  7 Apr 2022 16:00:39 +0800 (CST)
Received: from localhost.localdomain (10.69.192.58) by
 kwepemi500016.china.huawei.com (7.221.188.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 7 Apr 2022 16:02:59 +0800
To: <eric.auger@redhat.com>
CC: <qemu-devel@nongnu.org>, <linuxarm@huawei.com>, Xiang Chen
 <chenxiang66@hisilicon.com>
Subject: [PATCH] hw/arm/smmuv3: Pass the real perm to returned IOMMUTLBEntry
 in smmuv3_translate()
Date: Thu, 7 Apr 2022 15:57:25 +0800
Message-ID: <1649318245-77817-1-git-send-email-chenxiang66@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga02-in.huawei.com
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
Reply-to:  chenxiang <chenxiang66@hisilicon.com>
From:  chenxiang via <qemu-devel@nongnu.org>

From: Xiang Chen <chenxiang66@hisilicon.com>

In function memory_region_iommu_replay(), it decides to notify() or not
according to the perm of returned IOMMUTLBEntry. But for smmuv3, the
returned perm is always IOMMU_NONE even if the translation success.
Pass the real perm to returned IOMMUTLBEntry to avoid the issue.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 674623aabe..707eb430c2 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -760,7 +760,7 @@ epilogue:
     qemu_mutex_unlock(&s->mutex);
     switch (status) {
     case SMMU_TRANS_SUCCESS:
-        entry.perm = flag;
+        entry.perm = cached_entry->entry.perm;
         entry.translated_addr = cached_entry->entry.translated_addr +
                                     (addr & cached_entry->entry.addr_mask);
         entry.addr_mask = cached_entry->entry.addr_mask;
-- 
2.33.0


