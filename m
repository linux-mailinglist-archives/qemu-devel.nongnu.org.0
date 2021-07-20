Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F833CFD36
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:16:20 +0200 (CEST)
Received: from localhost ([::1]:58046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rTn-0003Fm-5l
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rP9-0003cW-Ka
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rP6-00012E-6W
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+1Ir+YUOHw9lQUgG8ZpJKVYDmA8YPCHqTxPiKVBGG0=;
 b=V1V6ep/0cKEL5UqPhGiqskPTNJQbIJXfh4RSgAgpnGPYd49B441hyV0C/YSTuC1J25U7yv
 8AF8rHKBxnAcWwWnU4THDEfGf7iwMQgzNzDAMKlwi3zc2M+ocEUdE8ayyMIlUmDdZ0yCSw
 bZCCdL/mCm9rSoc8T+iItRcXft3HfHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-NboZqdpmPOqIbU6qGlPvfQ-1; Tue, 20 Jul 2021 11:11:25 -0400
X-MC-Unique: NboZqdpmPOqIbU6qGlPvfQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3EF710511B9;
 Tue, 20 Jul 2021 15:11:05 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3A084D24;
 Tue, 20 Jul 2021 15:11:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/11] block/mirror: fix active mirror dead-lock in
 mirror_wait_on_conflicts
Date: Tue, 20 Jul 2021 17:10:45 +0200
Message-Id: <20210720151053.226144-4-kwolf@redhat.com>
In-Reply-To: <20210720151053.226144-1-kwolf@redhat.com>
References: <20210720151053.226144-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

It's possible that requests start to wait each other in
mirror_wait_on_conflicts(). To avoid it let's use same technique as in
block/io.c in bdrv_wait_serialising_requests_locked() /
bdrv_find_conflicting_request(): don't wait on intersecting request if
it is already waiting for some other request.

For details of the dead-lock look at testIntersectingActiveIO()
test-case which we actually fixing now.

Fixes: d06107ade0ce74dc39739bac80de84b51ec18546
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210702211636.228981-4-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/mirror.c         | 12 ++++++++++++
 tests/qemu-iotests/151 | 18 +++++-------------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index ad6aac2f95..98fc66eabf 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -107,6 +107,7 @@ struct MirrorOp {
     bool is_in_flight;
     CoQueue waiting_requests;
     Coroutine *co;
+    MirrorOp *waiting_for_op;
 
     QTAILQ_ENTRY(MirrorOp) next;
 };
@@ -159,7 +160,18 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
             if (ranges_overlap(self_start_chunk, self_nb_chunks,
                                op_start_chunk, op_nb_chunks))
             {
+                /*
+                 * If the operation is already (indirectly) waiting for us, or
+                 * will wait for us as soon as it wakes up, then just go on
+                 * (instead of producing a deadlock in the former case).
+                 */
+                if (op->waiting_for_op) {
+                    continue;
+                }
+
+                self->waiting_for_op = op;
                 qemu_co_queue_wait(&op->waiting_requests, NULL);
+                self->waiting_for_op = NULL;
                 break;
             }
         }
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index ab46c5e8ba..93d14193d0 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -143,10 +143,6 @@ class TestActiveMirror(iotests.QMPTestCase):
         self.potential_writes_in_flight = False
 
     def testIntersectingActiveIO(self):
-        # FIXME: test-case is dead-locking. To reproduce dead-lock just drop
-        # this return statement
-        return
-
         # Fill the source image
         result = self.vm.hmp_qemu_io('source', 'write -P 1 0 2M')
 
@@ -180,18 +176,14 @@ class TestActiveMirror(iotests.QMPTestCase):
 
         # Now we resumed 1, so 2 and 3 goes to the next iteration of while loop
         # in mirror_wait_on_conflicts(). They don't exit, as bitmap is dirty
-        # due to request 4. And they start to wait: 2 wait for 3, 3 wait for 2
-        # - DEAD LOCK.
-        # Note that it's important that we add request 4 at last: requests are
-        # appended to the list, so we are sure that 4 is last in the list, so 2
-        # and 3 now waits for each other, not for 4.
+        # due to request 4.
+        # In the past at that point 2 and 3 would wait for each other producing
+        # a dead-lock. Now this is fixed and they will wait for request 4.
 
         self.vm.hmp_qemu_io('source', 'resume B')
 
-        # Resuming 4 doesn't help, 2 and 3 already dead-locked
-        # To check the dead-lock run:
-        #    gdb -p $(pidof qemu-system-x86_64) -ex 'set $job=(MirrorBlockJob *)jobs.lh_first' -ex 'p *$job->ops_in_flight.tqh_first' -ex 'p *$job->ops_in_flight.tqh_first->next.tqe_next'
-        # You'll see two MirrorOp objects waiting on each other
+        # After resuming 4, one of 2 and 3 goes first and set in_flight_bitmap,
+        # so the other will wait for it.
 
         result = self.vm.qmp('block-job-set-speed', device='mirror', speed=0)
         self.assert_qmp(result, 'return', {})
-- 
2.31.1


