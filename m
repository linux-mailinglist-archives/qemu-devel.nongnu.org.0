Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 147593CFD35
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:16:20 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5rTn-0003Eq-1Y
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:16:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rOp-0002n9-3q
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m5rOn-0000kh-IM
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626793868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x3+V2LX3auC0B2yZD8dh4IKwwSYSbqtH3YpKXcBoIF8=;
 b=Nc7jX2pFJVqwDZSW5MwMZH65yquIH4dZHn0Xvu58/SnwORPKJfUJdU/YXwMvevybReL6g8
 tQfBq0xt848om6iKdfUFJ1QcrwC3fsroLe8VK2erpekHzihzCa46uCclcCWRBrYBjhfFps
 92HNqLAbXBV+V3viq11XqHP/tlLNfbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-iWEBXvK8N-WZmo-oFccCSQ-1; Tue, 20 Jul 2021 11:11:05 -0400
X-MC-Unique: iWEBXvK8N-WZmo-oFccCSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD1CE80D6B6;
 Tue, 20 Jul 2021 15:11:04 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38B1B83BF9;
 Tue, 20 Jul 2021 15:10:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/11] iotest 151: add test-case that shows active mirror
 dead-lock
Date: Tue, 20 Jul 2021 17:10:44 +0200
Message-Id: <20210720151053.226144-3-kwolf@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.474, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There is a dead-lock in active mirror: when we have parallel
intersecting requests (note that non intersecting requests may be
considered intersecting after aligning to mirror granularity), it may
happen that request A waits request B in mirror_wait_on_conflicts() and
request B waits for A.

Look at the test for details. Test now dead-locks, that's why it's
disabled. Next commit will fix mirror and enable the test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210702211636.228981-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/151     | 62 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/151.out |  4 +--
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 182f6b5321..ab46c5e8ba 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -38,8 +38,9 @@ class TestActiveMirror(iotests.QMPTestCase):
                       'if': 'none',
                       'node-name': 'source-node',
                       'driver': iotests.imgfmt,
-                      'file': {'driver': 'file',
-                               'filename': source_img}}
+                      'file': {'driver': 'blkdebug',
+                               'image': {'driver': 'file',
+                                         'filename': source_img}}}
 
         blk_target = {'node-name': 'target-node',
                       'driver': iotests.imgfmt,
@@ -141,6 +142,63 @@ class TestActiveMirror(iotests.QMPTestCase):
 
         self.potential_writes_in_flight = False
 
+    def testIntersectingActiveIO(self):
+        # FIXME: test-case is dead-locking. To reproduce dead-lock just drop
+        # this return statement
+        return
+
+        # Fill the source image
+        result = self.vm.hmp_qemu_io('source', 'write -P 1 0 2M')
+
+        # Start the block job (very slowly)
+        result = self.vm.qmp('blockdev-mirror',
+                             job_id='mirror',
+                             filter_node_name='mirror-node',
+                             device='source-node',
+                             target='target-node',
+                             sync='full',
+                             copy_mode='write-blocking',
+                             speed=1)
+
+        self.vm.hmp_qemu_io('source', 'break write_aio A')
+        self.vm.hmp_qemu_io('source', 'aio_write 0 1M')  # 1
+        self.vm.hmp_qemu_io('source', 'wait_break A')
+        self.vm.hmp_qemu_io('source', 'aio_write 0 2M')  # 2
+        self.vm.hmp_qemu_io('source', 'aio_write 0 2M')  # 3
+
+        # Now 2 and 3 are in mirror_wait_on_conflicts, waiting for 1
+
+        self.vm.hmp_qemu_io('source', 'break write_aio B')
+        self.vm.hmp_qemu_io('source', 'aio_write 1M 2M')  # 4
+        self.vm.hmp_qemu_io('source', 'wait_break B')
+
+        # 4 doesn't wait for 2 and 3, because they didn't yet set
+        # in_flight_bitmap. So, nothing prevents 4 to go except for our
+        # break-point B.
+
+        self.vm.hmp_qemu_io('source', 'resume A')
+
+        # Now we resumed 1, so 2 and 3 goes to the next iteration of while loop
+        # in mirror_wait_on_conflicts(). They don't exit, as bitmap is dirty
+        # due to request 4. And they start to wait: 2 wait for 3, 3 wait for 2
+        # - DEAD LOCK.
+        # Note that it's important that we add request 4 at last: requests are
+        # appended to the list, so we are sure that 4 is last in the list, so 2
+        # and 3 now waits for each other, not for 4.
+
+        self.vm.hmp_qemu_io('source', 'resume B')
+
+        # Resuming 4 doesn't help, 2 and 3 already dead-locked
+        # To check the dead-lock run:
+        #    gdb -p $(pidof qemu-system-x86_64) -ex 'set $job=(MirrorBlockJob *)jobs.lh_first' -ex 'p *$job->ops_in_flight.tqh_first' -ex 'p *$job->ops_in_flight.tqh_first->next.tqe_next'
+        # You'll see two MirrorOp objects waiting on each other
+
+        result = self.vm.qmp('block-job-set-speed', device='mirror', speed=0)
+        self.assert_qmp(result, 'return', {})
+        self.complete_and_wait(drive='mirror')
+
+        self.potential_writes_in_flight = False
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'raw'],
diff --git a/tests/qemu-iotests/151.out b/tests/qemu-iotests/151.out
index 8d7e996700..89968f35d7 100644
--- a/tests/qemu-iotests/151.out
+++ b/tests/qemu-iotests/151.out
@@ -1,5 +1,5 @@
-...
+....
 ----------------------------------------------------------------------
-Ran 3 tests
+Ran 4 tests
 
 OK
-- 
2.31.1


