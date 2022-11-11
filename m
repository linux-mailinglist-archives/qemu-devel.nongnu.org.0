Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 569FE625E55
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 16:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otVwn-00085M-GB; Fri, 11 Nov 2022 10:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwl-00083f-JZ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:27:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otVwj-0000xZ-OC
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 10:27:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668180477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KUZY7kxJfm0fPu1AX6fPBsSEP1XKTHcjM7J628oygpY=;
 b=XxBHT8LRWn538jcHDMudGG5r7JpcqbHog/WeeN3jCxv5mRUqIRxHidShgSY935c6E99NMd
 SAFV3xasd/04PwetLVN9fUMtjIOSaf8VQHVquoLOpi0KZL4efnM5WyG+INVhiIKZwYt2I2
 RESYscE4iiaYHYHWdGdJpUS4Fhri8BM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-3ypbLhsYPSS8_GtjcQiiQA-1; Fri, 11 Nov 2022 10:27:55 -0500
X-MC-Unique: 3ypbLhsYPSS8_GtjcQiiQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FD891C07566;
 Fri, 11 Nov 2022 15:27:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98477C15BB2;
 Fri, 11 Nov 2022 15:27:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/11] iotests/151: Test active requests on mirror start
Date: Fri, 11 Nov 2022 16:27:38 +0100
Message-Id: <20221111152744.261358-6-kwolf@redhat.com>
In-Reply-To: <20221111152744.261358-1-kwolf@redhat.com>
References: <20221111152744.261358-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

Have write requests happen to the source node right when we start a
mirror job.  The mirror filter node may encounter MirrorBDSOpaque.job
being NULL, but this should not cause a segfault.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20221109165452.67927-6-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/151     | 53 +++++++++++++++++++++++++++++++++++---
 tests/qemu-iotests/151.out |  4 +--
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 0a052e5050..b4d1bc2553 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -22,7 +22,8 @@
 import math
 import os
 import subprocess
-from typing import List
+import time
+from typing import List, Optional
 import iotests
 from iotests import qemu_img
 
@@ -195,12 +196,15 @@ class TestActiveMirror(iotests.QMPTestCase):
         self.potential_writes_in_flight = False
 
 
-class TestThrottledWithNbdExport(iotests.QMPTestCase):
+class TestThrottledWithNbdExportBase(iotests.QMPTestCase):
     image_len = 128 * 1024 * 1024  # MB
-    iops = 16
+    iops: Optional[int] = None
     background_processes: List['subprocess.Popen[str]'] = []
 
     def setUp(self):
+        # Must be set by subclasses
+        self.assertIsNotNone(self.iops)
+
         qemu_img('create', '-f', iotests.imgfmt, source_img, '128M')
         qemu_img('create', '-f', iotests.imgfmt, target_img, '128M')
 
@@ -284,6 +288,10 @@ class TestThrottledWithNbdExport(iotests.QMPTestCase):
         os.remove(source_img)
         os.remove(target_img)
 
+
+class TestLowThrottledWithNbdExport(TestThrottledWithNbdExportBase):
+    iops = 16
+
     def testUnderLoad(self):
         '''
         Throttle the source node, then issue a whole bunch of external requests
@@ -370,6 +378,45 @@ class TestThrottledWithNbdExport(iotests.QMPTestCase):
         self.assertGreater(start_remaining - end_remaining, 0)
 
 
+class TestHighThrottledWithNbdExport(TestThrottledWithNbdExportBase):
+    iops = 1024
+
+    def testActiveOnCreation(self):
+        '''
+        Issue requests on the mirror source node right as the mirror is
+        instated.  It's possible that requests occur before the actual job is
+        created, but after the node has been put into the graph.  Write
+        requests across the node must in that case be forwarded to the source
+        node without attempting to mirror them (there is no job object yet, so
+        attempting to access it would cause a segfault).
+        We do this with a lightly throttled node (i.e. quite high IOPS limit).
+        Using throttling seems to increase reproductivity, but if the limit is
+        too low, all requests allowed per second will be submitted before
+        mirror_start_job() gets to the problematic point.
+        '''
+
+        # Let qemu-img bench create write requests (enough for two seconds on
+        # the virtual clock)
+        bench_args = ['bench', '-w', '-d', '1024', '-f', 'nbd',
+                      '-c', str(self.iops * 2), self.nbd_url]
+        p = iotests.qemu_tool_popen(iotests.qemu_img_args + bench_args)
+        self.background_processes += [p]
+
+        # Give qemu-img bench time to start up and issue requests
+        time.sleep(1.0)
+        # Flush the request queue, so new requests can come in right as we
+        # start blockdev-mirror
+        self.vm.qtest(f'clock_step {1 * 1000 * 1000 * 1000}')
+
+        result = self.vm.qmp('blockdev-mirror',
+                             job_id='mirror',
+                             device='source-node',
+                             target='target-node',
+                             sync='full',
+                             copy_mode='write-blocking')
+        self.assert_qmp(result, 'return', {})
+
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'raw'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/151.out b/tests/qemu-iotests/151.out
index 914e3737bd..3f8a935a08 100644
--- a/tests/qemu-iotests/151.out
+++ b/tests/qemu-iotests/151.out
@@ -1,5 +1,5 @@
-.....
+......
 ----------------------------------------------------------------------
-Ran 5 tests
+Ran 6 tests
 
 OK
-- 
2.38.1


