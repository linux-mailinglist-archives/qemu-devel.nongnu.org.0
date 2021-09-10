Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF4406C81
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:52:29 +0200 (CEST)
Received: from localhost ([::1]:52878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOg16-0003CA-Pl
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mOfud-0005ZE-I4
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:45:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mOfuV-0005uo-1q
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 08:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631277938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q0t4y1kjGvTzUJk83OAGHrbqrh4KcuCDe1EnxxomxPk=;
 b=G4AuzBneHLFeD00cJZjOmZ9iX+7BmjCLJihUpuGcPN4XZE/W2UN1PzuGMDDGcKpzBLQSNA
 YoR9qG9Yl+5jS4yhzR4oeg8GRuqeU7hInx1T4F7s5PugouXgSXwAB9PRAbw901+Teka3G4
 oY0r+FU/tGhXpL9hfUHzied3mQ6XuFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-P17O3UXoOu-iRtaFt1s7Wg-1; Fri, 10 Sep 2021 08:45:37 -0400
X-MC-Unique: P17O3UXoOu-iRtaFt1s7Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E00A9126B;
 Fri, 10 Sep 2021 12:45:36 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.193.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EC3E60C82;
 Fri, 10 Sep 2021 12:45:34 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] block/mirror: fix NULL pointer dereference in
 mirror_wait_on_conflicts()
Date: Fri, 10 Sep 2021 14:45:33 +0200
Message-Id: <20210910124533.288318-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In mirror_iteration() we call mirror_wait_on_conflicts() with
`self` parameter set to NULL.

Starting from commit d44dae1a7c we dereference `self` pointer in
mirror_wait_on_conflicts() without checks if it is not NULL.

Backtrace:
  Program terminated with signal SIGSEGV, Segmentation fault.
  #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
      at ../block/mirror.c:172
  172	                self->waiting_for_op = op;
  [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
  (gdb) bt
  #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
      at ../block/mirror.c:172
  #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
  #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
  #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
      at ../util/coroutine-ucontext.c:173
  #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
      from /usr/lib64/libc.so.6

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- moved "if (op->waiting_for_op) {continue;}" code into "if (self)" too.
  [Vladimir]
---
 block/mirror.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index 98fc66eabf..85b781bc21 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -160,18 +160,25 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
             if (ranges_overlap(self_start_chunk, self_nb_chunks,
                                op_start_chunk, op_nb_chunks))
             {
-                /*
-                 * If the operation is already (indirectly) waiting for us, or
-                 * will wait for us as soon as it wakes up, then just go on
-                 * (instead of producing a deadlock in the former case).
-                 */
-                if (op->waiting_for_op) {
-                    continue;
+                if (self) {
+                    /*
+                     * If the operation is already (indirectly) waiting for us,
+                     * or will wait for us as soon as it wakes up, then just go
+                     * on (instead of producing a deadlock in the former case).
+                     */
+                    if (op->waiting_for_op) {
+                        continue;
+                    }
+
+                    self->waiting_for_op = op;
                 }
 
-                self->waiting_for_op = op;
                 qemu_co_queue_wait(&op->waiting_requests, NULL);
-                self->waiting_for_op = NULL;
+
+                if (self) {
+                    self->waiting_for_op = NULL;
+                }
+
                 break;
             }
         }
-- 
2.31.1


