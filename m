Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39493D8BF1
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 12:36:26 +0200 (CEST)
Received: from localhost ([::1]:35890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8gvJ-0003jK-Bn
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 06:36:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1m8gua-00033V-DB
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 06:35:40 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:14866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1m8guW-0004Kk-Mv
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 06:35:40 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id C298442B26
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 12:35:23 +0200 (CEST)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/io_uring: resubmit when result is -EAGAIN
Date: Wed, 28 Jul 2021 12:35:18 +0200
Message-Id: <20210728103518.1221195-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quoting from [0]:

 Some setups, like SCSI, can throw spurious -EAGAIN off the softirq
 completion path. Normally we expect this to happen inline as part
 of submission, but apparently SCSI has a weird corner case where it
 can happen as part of normal completions.

Host kernels without patch [0] can panic when this happens [1], and
resubmitting makes the panic more likely. On the other hand, for
kernels with patch [0], resubmitting ensures that a block job is not
aborted just because of such spurious errors.

[0]: https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u

[1]:
  #9 [ffffb732000c8b70] asm_exc_page_fault at ffffffffa4800ade
 #10 [ffffb732000c8bf8] io_prep_async_work at ffffffffa3d89c16
 #11 [ffffb732000c8c50] io_rw_reissue at ffffffffa3d8b2e1
 #12 [ffffb732000c8c78] io_complete_rw at ffffffffa3d8baa8
 #13 [ffffb732000c8c98] blkdev_bio_end_io at ffffffffa3d62a80
 #14 [ffffb732000c8cc8] bio_endio at ffffffffa3f4e800
 #15 [ffffb732000c8ce8] dec_pending at ffffffffa432f854
 #16 [ffffb732000c8d30] clone_endio at ffffffffa433170c
 #17 [ffffb732000c8d70] bio_endio at ffffffffa3f4e800
 #18 [ffffb732000c8d90] blk_update_request at ffffffffa3f53a37
 #19 [ffffb732000c8dd0] scsi_end_request at ffffffffa4233a5c
 #20 [ffffb732000c8e08] scsi_io_completion at ffffffffa423432c
 #21 [ffffb732000c8e58] scsi_finish_command at ffffffffa422c527
 #22 [ffffb732000c8e88] scsi_softirq_done at ffffffffa42341e4

Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---

I'm new to this code and io_uring, so I don't know what all the
implications are, but retrying upon EAGAIN does not sound like
a bad thing to my inexperienced ears.

Some more context, leading up to this patch:

We had some users reporting issues after we switched to using io_uring
by default. Namely, kernel panics [2] for some, and failing block jobs
[3] (with a custom backup mechanism we implemented on top of QEMU's
block layer) for others.

I had luck and managed to reprouce the issue, and it was a failed
block job about half of the time and a kernel panic the other half.
When using a host kernel with [0], it's a failed block job all the
time, and this patch attempts to fix that, by resubmitting instead
of bubbling up the error.

[2]: https://forum.proxmox.com/threads/kernel-panic-whole-server-crashes-about-every-day.91803/post-404382
[3]: https://forum.proxmox.com/threads/backup-job-failed-with-err-11-on-2-of-6-vms.92568/

 block/io_uring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 00a3ee9fb8..77d162cb24 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -165,7 +165,7 @@ static void luring_process_completions(LuringState *s)
         total_bytes = ret + luringcb->total_read;
 
         if (ret < 0) {
-            if (ret == -EINTR) {
+            if (ret == -EINTR || ret == -EAGAIN) {
                 luring_resubmit(s, luringcb);
                 continue;
             }
-- 
2.30.2



