Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64C3C1571
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 16:48:56 +0200 (CEST)
Received: from localhost ([::1]:34188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1VKh-0000Tf-Al
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 10:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m1VJf-0007dj-Rm
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:47:52 -0400
Received: from mail.cn.fujitsu.com ([183.91.158.132]:4264
 helo=heian.cn.fujitsu.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lizhijian@fujitsu.com>) id 1m1VJd-0006d2-H4
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 10:47:51 -0400
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AlyaXVKH37FUFgbwipLqEAMeALOsnbusQ8zAX?=
 =?us-ascii?q?P0AYc3Jom6uj5qSTdZUgpHjJYVkqOE3I9ertBEDiewK4yXcW2/hzAV7KZmCP0w?=
 =?us-ascii?q?HEEGgI1+rfKlPbdBEWjtQtt5uIbZIOc+HYPBxri9rg+gmkH5IFyNmDyqqhguDT?=
 =?us-ascii?q?1B5WPHhXQpAl/wFkERyaD0EzYAFHAKAyHJ2a6tECiCGnfR0sH7yGL0hAT+7evM?=
 =?us-ascii?q?fKiZ6jRRYHAiQs4A6IgSjtyJOSKWn/4isj?=
X-IronPort-AV: E=Sophos;i="5.84,222,1620662400"; d="scan'208";a="110845026"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 08 Jul 2021 22:47:43 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 98AA24D0C4DE;
 Thu,  8 Jul 2021 22:47:40 +0800 (CST)
Received: from G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 8 Jul 2021 22:47:35 +0800
Received: from FNSTPC.g08.fujitsu.local (10.167.226.45) by
 G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.209) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Thu, 8 Jul 2021 22:47:35 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: <quintela@redhat.com>, <dgilbert@redhat.com>
Subject: [PATCH] migration/rdma: prevent from double free the same mr
Date: Thu, 8 Jul 2021 22:45:21 +0800
Message-ID: <20210708144521.1959614-1-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-yoursite-MailScanner-ID: 98AA24D0C4DE.A002A
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

backtrace:
'0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
478             void *addr              = mr->addr;
(gdb) bt
 #0  0x00007ffff5f44ec2 in __ibv_dereg_mr_1_1 (mr=0x7fff1007d390) at /home/lizhijian/rdma-core/libibverbs/verbs.c:478
 #1  0x0000555555891fcc in rdma_delete_block (block=<optimized out>, rdma=0x7fff38176010) at ../migration/rdma.c:691
 #2  qemu_rdma_cleanup (rdma=0x7fff38176010) at ../migration/rdma.c:2365
 #3  0x00005555558925b0 in qio_channel_rdma_close_rcu (rcu=0x555556b8b6c0) at ../migration/rdma.c:3073
 #4  0x0000555555d652a3 in call_rcu_thread (opaque=opaque@entry=0x0) at ../util/rcu.c:281
 #5  0x0000555555d5edf9 in qemu_thread_start (args=0x7fffe88bb4d0) at ../util/qemu-thread-posix.c:541
 #6  0x00007ffff54c73f9 in start_thread () at /lib64/libpthread.so.0
 #7  0x00007ffff53f3b03 in clone () at /lib64/libc.so.6 '

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 migration/rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/migration/rdma.c b/migration/rdma.c
index b6cc4bef4a8..0f22b8227c0 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1143,6 +1143,7 @@ static int qemu_rdma_reg_whole_ram_blocks(RDMAContext *rdma)
 
     for (i--; i >= 0; i--) {
         ibv_dereg_mr(local->block[i].mr);
+        local->block[i].mr = NULL;
         rdma->total_registrations--;
     }
 
-- 
2.30.2




