Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544A46B9C4
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 12:05:47 +0100 (CET)
Received: from localhost ([::1]:59676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muYI6-000444-A1
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 06:05:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1muYGf-0003L6-R4
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:04:17 -0500
Received: from mxhk.zte.com.cn ([63.216.63.35]:51548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1muYGd-0005Jt-FJ
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 06:04:17 -0500
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4J7cmW2PxZz4yjYb
 for <qemu-devel@nongnu.org>; Tue,  7 Dec 2021 19:01:15 +0800 (CST)
Received: from kjyxapp04.zte.com.cn ([10.30.12.203])
 by mse-fl1.zte.com.cn with SMTP id 1B7B3xLi007639
 for <qemu-devel@nongnu.org>; Tue, 7 Dec 2021 19:03:59 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-cloudhost8.localdomain (unknown [10.234.72.110])
 by smtp (Zmail) with SMTP; Tue, 7 Dec 2021 19:03:59 +0800
X-Zmail-TransId: 3e8861af3f9e010-001d8
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] mirror: Avoid assertion failed in mirror_run
Date: Tue,  7 Dec 2021 18:56:19 +0800
Message-Id: <20211207105619.3205-1-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 2.33.0.rc0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 1B7B3xLi007639
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 61AF3EFB.000 by FangMail milter!
X-FangMail-Envelope: 1638874875/4J7cmW2PxZz4yjYb/61AF3EFB.000/10.30.14.238/[10.30.14.238]/mse-fl1.zte.com.cn/<wang.yi59@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 61AF3EFB.000/4J7cmW2PxZz4yjYb
Received-SPF: pass client-ip=63.216.63.35; envelope-from=wang.yi59@zte.com.cn;
 helo=mxhk.zte.com.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wang.yi59@zte.com.cn, Long YunJian <long.yunjian@zte.com.cn>,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Long YunJian <long.yunjian@zte.com.cn>

when blockcommit from active leaf node, sometimes, we get assertion failed with
"mirror_run: Assertion `QLIST_EMPTY(&bs->tracked_requests)' failed" messages.
According to the core file, we find bs->tracked_requests has IO request,
so assertion failed.
(gdb) bt
#0  0x00007f410df707cf in raise () from /lib64/libc.so.6
#1  0x00007f410df5ac05 in abort () from /lib64/libc.so.6
#2  0x00007f410df5aad9 in __assert_fail_base.cold.0 () from /lib64/libc.so.6
#3  0x00007f410df68db6 in __assert_fail () from /lib64/libc.so.6
#4  0x0000556915635371 in mirror_run (job=0x556916ff8600, errp=<optimized out>) at block/mirror.c:1092
#5  0x00005569155e6c53 in job_co_entry (opaque=0x556916ff8600) at job.c:904
#6  0x00005569156d9483 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at util/coroutine-ucontext.c:115
(gdb) p s->mirror_top_bs->backing->bs->tracked_requests
$12 = {lh_first = 0x7f3f07bfb8b0}
(gdb) p s->mirror_top_bs->backing->bs->tracked_requests->lh_first
$13 = (struct BdrvTrackedRequest *) 0x7f3f07bfb8b0

Actually, before excuting assert(QLIST_EMPTY(&bs->tracked_requests)),
it will excute mirror_flush(s). It may handle new I/O request and maybe
pending I/O during this flush. Just likes in bdrv_close fuction,
bdrv_drain(bs) followed by bdrv_flush(bs), we should add bdrv_drain fuction
to handle pending I/O after mirror_flush.

Signed-off-by: Long YunJian <long.yunjian@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
---
 block/mirror.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/mirror.c b/block/mirror.c
index efec2c7674..1eec356310 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1079,6 +1079,8 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
                 s->in_drain = false;
                 continue;
             }
+            /* in case flush left pending I/O */
+            bdrv_drain(bs);
 
             /* The two disks are in sync.  Exit and report successful
              * completion.
-- 
2.18.1

