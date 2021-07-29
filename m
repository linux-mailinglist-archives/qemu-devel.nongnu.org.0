Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FC3DA01A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:13:36 +0200 (CEST)
Received: from localhost ([::1]:37792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m926g-0008Ku-Hc
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1m925I-0007K1-Tg; Thu, 29 Jul 2021 05:12:08 -0400
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:46290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1m925G-0006yT-N5; Thu, 29 Jul 2021 05:12:08 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id E24EF42C48;
 Thu, 29 Jul 2021 11:12:01 +0200 (CEST)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block/io_uring: resubmit when result is -EAGAIN
Date: Thu, 29 Jul 2021 11:10:29 +0200
Message-Id: <20210729091029.65369-1-f.ebner@proxmox.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Linux io_uring" <qemu-block@nongnu.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fabian Ebner <f.ebner@proxmox.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Linux SCSI can throw spurious -EAGAIN in some corner cases in its
completion path, which will end up being the result in the completed
io_uring request.

Resubmitting such requests should allow block jobs to complete, even
if such spurious errors are encountered.

Co-authored-by: Stefan Hajnoczi <stefanha@gmail.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
---

Changes from v1:
    * Focus on what's relevant for the patch itself in the commit
      message.
    * Add Stefan's comment.
    * Add Stefano's R-b tag (I hope that's fine, since there was no
      change code-wise).

 block/io_uring.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index 00a3ee9fb8..dfa475cc87 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -165,7 +165,21 @@ static void luring_process_completions(LuringState *s)
         total_bytes = ret + luringcb->total_read;
 
         if (ret < 0) {
-            if (ret == -EINTR) {
+            /*
+             * Only writev/readv/fsync requests on regular files or host block
+             * devices are submitted. Therefore -EAGAIN is not expected but it's
+             * known to happen sometimes with Linux SCSI. Submit again and hope
+             * the request completes successfully.
+             *
+             * For more information, see:
+             * https://lore.kernel.org/io-uring/20210727165811.284510-3-axboe@kernel.dk/T/#u
+             *
+             * If the code is changed to submit other types of requests in the
+             * future, then this workaround may need to be extended to deal with
+             * genuine -EAGAIN results that should not be resubmitted
+             * immediately.
+             */
+            if (ret == -EINTR || ret == -EAGAIN) {
                 luring_resubmit(s, luringcb);
                 continue;
             }
-- 
2.30.2



