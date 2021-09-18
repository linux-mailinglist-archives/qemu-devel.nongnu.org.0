Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC434104CB
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 09:34:50 +0200 (CEST)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRUs4-0003cJ-JT
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 03:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lishan24@huawei.com>)
 id 1mRUqY-00026A-Ac; Sat, 18 Sep 2021 03:33:14 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lishan24@huawei.com>)
 id 1mRUqT-0004W9-Fp; Sat, 18 Sep 2021 03:33:14 -0400
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HBMwP1vBPz8tGN;
 Sat, 18 Sep 2021 15:32:21 +0800 (CST)
Received: from huawei.com (10.174.186.67) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.8; Sat, 18
 Sep 2021 15:33:01 +0800
From: lishan <lishan24@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] block/file-posix: Limit max_iov to IOV_MAX
Date: Sat, 18 Sep 2021 15:33:00 +0800
Message-ID: <20210918073300.30224-1-lishan24@huawei.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.186.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189; envelope-from=lishan24@huawei.com;
 helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, lishan24@huawei.com,
 qemu-block@nongnu.org, eric.fangyi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AIO read/write. The size of iocb->aio_nbytes in the kernel cannot exceed UIO_MAXIOV = 1024.
max_segments read from the block device layer may be greater than UIO_MAXIOV,
this causes the ioq_submit interface to return a -22(-EINVAL) error result.
---
 block/file-posix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index d81e15efa4..27ab8d8784 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1273,7 +1273,8 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
 
         ret = hdev_get_max_segments(s->fd, &st);
         if (ret > 0) {
-            bs->bl.max_iov = ret;
+            /* The maximum segment size allowed by the kernel is UIO_MAXIOV = 1024. */
+            bs->bl.max_iov = MIN(ret, bs->bl.max_iov);
         }
     }
 }
-- 
2.19.1.windows.1


