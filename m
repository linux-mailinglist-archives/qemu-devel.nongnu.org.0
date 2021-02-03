Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FC830D445
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:51:23 +0100 (CET)
Received: from localhost ([::1]:47094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Cwc-0003Mh-TV
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7Cpj-00034j-AX
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:15 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1l7CpW-0008J2-Dk
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:44:15 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVtv05FPBzjJgS;
 Wed,  3 Feb 2021 15:42:36 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 15:43:45 +0800
From: Chuan Zheng <zhengchuan@huawei.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>, <berrange@redhat.com>
Subject: [PATCH v4 15/18] migration/rdma: only register the memory for multifd
 channels
Date: Wed, 3 Feb 2021 16:01:48 +0800
Message-ID: <1612339311-114805-16-git-send-email-zhengchuan@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
References: <1612339311-114805-1-git-send-email-zhengchuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=zhengchuan@huawei.com; helo=szxga05-in.huawei.com
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
Cc: yubihong@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, alex.chen@huawei.com, wanghao232@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All data is sent by multifd Channels, so we only register its for
multifd channels and main channel don't register its.

Signed-off-by: Zhimin Feng <fengzhimin1@huawei.com>
Signed-off-by: Chuan Zheng <zhengchuan@huawei.com>
---
 migration/rdma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index c906cc7..f5eb563 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -3939,6 +3939,12 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
 
                 qemu_sem_post(&multifd_send_param->sem_sync);
             }
+
+            /*
+             * Use multifd to migrate, we only register memory for
+             * multifd RDMA channel and main channel don't register it.
+             */
+            goto wait_reg_complete;
         }
 
         /*
@@ -3999,6 +4005,8 @@ static int qemu_rdma_registration_stop(QEMUFile *f, void *opaque,
                     rdma->dest_blocks[i].remote_host_addr;
             local->block[i].remote_rkey = rdma->dest_blocks[i].remote_rkey;
         }
+
+wait_reg_complete:
         /* Wait for all multifd channels to complete registration */
         if (migrate_use_multifd()) {
             int i;
-- 
1.8.3.1


