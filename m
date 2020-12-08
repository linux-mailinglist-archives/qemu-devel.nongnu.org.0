Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 049542D2DB4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 16:02:00 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmeV5-0001v2-0u
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 10:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmeRx-0000bZ-Or; Tue, 08 Dec 2020 09:58:45 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmeRh-0001Iz-Fb; Tue, 08 Dec 2020 09:58:45 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cr3F714QwzkmjZ;
 Tue,  8 Dec 2020 22:57:31 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Tue, 8 Dec 2020
 22:58:01 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <fam@euphon.net>, <kwolf@redhat.com>, <mreitz@redhat.com>
Subject: [PATCH] block/nvme: Fix possible array index out of bounds in
 nvme_process_completion()
Date: Tue, 8 Dec 2020 14:44:52 +0000
Message-ID: <20201208144452.91172-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The range of 'cid' is [1, NVME_QUEUE_SIZE-1], so when 'cid' is equal to
NVME_QUEUE_SIZE, it should be continued, otherwise it will lead to array
index out of bounds when accessing 'q->reqs[cid-1]'

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nvme.c b/block/nvme.c
index a06a188d53..3a2b3f5486 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -402,7 +402,7 @@ static bool nvme_process_completion(NVMeQueuePair *q)
             q->cq_phase = !q->cq_phase;
         }
         cid = le16_to_cpu(c->cid);
-        if (cid == 0 || cid > NVME_QUEUE_SIZE) {
+        if (cid == 0 || cid >= NVME_QUEUE_SIZE) {
             warn_report("NVMe: Unexpected CID in completion queue: %"PRIu32", "
                         "queue size: %u", cid, NVME_QUEUE_SIZE);
             continue;
-- 
2.19.1


