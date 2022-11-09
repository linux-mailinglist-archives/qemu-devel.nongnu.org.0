Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7A6230CB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 17:56:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osoMI-0005rU-JU; Wed, 09 Nov 2022 11:55:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoMA-0005o7-KP
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1osoM8-0007Dd-Qf
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 11:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668012916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VPRM/Gm2AeRZAzAyn9NJklCrfWnXpb8KMjpS5jJN8P0=;
 b=duwh3hij54cD92oZxYSXboR8acM/rBO6EFKWm2cQTrNwumHOMBOQJyZObOrl9XwuuqSQ9t
 fqli3GPXy6r21YmZiV6Y6vRZZUfnmvtErH1p2e9hKG/nwPjLgskp29M1bDeJgaWZI3y/ol
 Rlf712zYcXfWBzOL/yakLEtJB6LueEY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-GkzAZV7SMRyh133run84EA-1; Wed, 09 Nov 2022 11:55:14 -0500
X-MC-Unique: GkzAZV7SMRyh133run84EA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 935D51C0050A;
 Wed,  9 Nov 2022 16:55:02 +0000 (UTC)
Received: from localhost (unknown [10.39.195.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F35F7AE5;
 Wed,  9 Nov 2022 16:55:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH for-7.2 5/5] iotests/151: Test active requests on mirror start
Date: Wed,  9 Nov 2022 17:54:52 +0100
Message-Id: <20221109165452.67927-6-hreitz@redhat.com>
In-Reply-To: <20221109165452.67927-1-hreitz@redhat.com>
References: <20221109165452.67927-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Have write requests happen to the source node right when we start a
mirror job.  The mirror filter node may encounter MirrorBDSOpaque.job
being NULL, but this should not cause a segfault.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.36.1


