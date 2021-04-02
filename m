Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA13352985
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 12:07:42 +0200 (CEST)
Received: from localhost ([::1]:45532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSGiL-0001Mj-3W
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 06:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lSGgK-0000Fg-Lh; Fri, 02 Apr 2021 06:05:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:4105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1lSGg8-0004hq-U2; Fri, 02 Apr 2021 06:05:34 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FBbGH3PHZz9vwQ;
 Fri,  2 Apr 2021 18:03:03 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 18:05:03 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/smmuv3: Emulate CFGI_STE_RANGE for an aligned range of
 StreamIDs
Date: Fri, 2 Apr 2021 18:04:49 +0800
Message-ID: <20210402100449.528-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yuzenghui@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In emulation of the CFGI_STE_RANGE command, we now take StreamID as the
start of the invalidation range, regardless of whatever the Range is,
whilst the spec clearly states that

 - "Invalidation is performed for an *aligned* range of 2^(Range+1)
    StreamIDs."

 - "The bottom Range+1 bits of the StreamID parameter are IGNORED,
    aligning the range to its size."

Take CFGI_ALL (where Range == 31) as an example, if there are some random
bits in the StreamID field, we'll fail to perform the full invalidation but
get a strange range (e.g., SMMUSIDRange={.start=1, .end=0}) instead. Rework
the emulation a bit to get rid of the discrepancy with the spec.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 hw/arm/smmuv3.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 3b87324ce2..8705612535 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -980,16 +980,20 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
         }
         case SMMU_CMD_CFGI_STE_RANGE: /* same as SMMU_CMD_CFGI_ALL */
         {
-            uint32_t start = CMD_SID(&cmd);
+            uint32_t sid = CMD_SID(&cmd), mask;
             uint8_t range = CMD_STE_RANGE(&cmd);
-            uint64_t end = start + (1ULL << (range + 1)) - 1;
-            SMMUSIDRange sid_range = {start, end};
+            SMMUSIDRange sid_range;
 
             if (CMD_SSEC(&cmd)) {
                 cmd_error = SMMU_CERROR_ILL;
                 break;
             }
-            trace_smmuv3_cmdq_cfgi_ste_range(start, end);
+
+            mask = (1ULL << (range + 1)) - 1;
+            sid_range.start = sid & ~mask;
+            sid_range.end = sid_range.start + mask;
+
+            trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, sid_range.end);
             g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
                                         &sid_range);
             break;
-- 
2.19.1


