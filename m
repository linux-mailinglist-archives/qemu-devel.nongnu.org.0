Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380524EAFC3
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 17:02:43 +0200 (CEST)
Received: from localhost ([::1]:45016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZDMo-0008Fu-9J
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 11:02:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJI-0005Kn-H0
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nZDJG-0003A8-7Z
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 10:59:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648565941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WgULD6CUf3kq7kPKHRhShmrY8+uZhRGJM9H7iexiocg=;
 b=QDz4osXogQibGq7gQUJsxMwde1j0f+l8Gk2BUN5lZbV5OxwVqCfFB6lNSUL4p1woD4nOk+
 2o8D/J8vVQYeqvKXL4DckcR96z5sYNBEDgFS1A/NMVMCcyxcZ6SokxA8sKeVYbMh5McAmY
 mstmzV3x7nzPEDaH4U0qLVlKBu5oCZ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-7J5bKbDvPcylm9v-OEKIGQ-1; Tue, 29 Mar 2022 10:58:58 -0400
X-MC-Unique: 7J5bKbDvPcylm9v-OEKIGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11DBA1802A1F;
 Tue, 29 Mar 2022 14:58:58 +0000 (UTC)
Received: from localhost (unknown [10.39.194.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3D1040CF8ED;
 Tue, 29 Mar 2022 14:58:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 4/4] iotests: Fix status checks
Date: Tue, 29 Mar 2022 16:58:49 +0200
Message-Id: <20220329145849.121051-5-hreitz@redhat.com>
In-Reply-To: <20220329145849.121051-1-hreitz@redhat.com>
References: <20220329145849.121051-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An iotest's 'paused' condition is fickle; it will be reported as true
whenever the job is drained, for example, or when it is in the process
of completing.

030 and 041 contain such checks, we should replace them by checking the
job status instead.  (As was done for 129 in commit f9a6256b48f29c2816
for the 'busy' condition.)

Additionally, when we want to test that a job is paused on error, we
might want to give it some time to actually switch to the paused state.
Do that by waiting on the corresponding JOB_STATUS_CHANGE event.  (But
only if they are not already paused; the loops these places are in fetch
all VM events, so they may have already fetched that event from the
queue.)

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220324180221.24508-1-hreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/030 | 25 ++++++++++++++++++++-----
 tests/qemu-iotests/041 | 26 +++++++++++++++++++-------
 2 files changed, 39 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 14112835ed..18eddcc734 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -724,7 +724,8 @@ class TestEIO(TestErrors):
                     if result == {'return': []}:
                         # Job finished too quickly
                         continue
-                    self.assert_qmp(result, 'return[0]/paused', False)
+                    self.assertIn(result['return'][0]['status'],
+                                  ['running', 'pending', 'aborting', 'concluded'])
                 elif event['event'] == 'BLOCK_JOB_COMPLETED':
                     self.assertTrue(error, 'job completed unexpectedly')
                     self.assert_qmp(event, 'data/type', 'stream')
@@ -754,8 +755,14 @@ class TestEIO(TestErrors):
                     self.assert_qmp(event, 'data/device', 'drive0')
                     self.assert_qmp(event, 'data/operation', 'read')
 
+                    if self.vm.qmp('query-block-jobs')['return'][0]['status'] != 'paused':
+                        self.vm.events_wait([(
+                            'JOB_STATUS_CHANGE',
+                            {'data': {'id': 'drive0', 'status': 'paused'}}
+                        )])
+
                     result = self.vm.qmp('query-block-jobs')
-                    self.assert_qmp(result, 'return[0]/paused', True)
+                    self.assert_qmp(result, 'return[0]/status', 'paused')
                     self.assert_qmp(result, 'return[0]/offset', self.STREAM_BUFFER_SIZE)
                     self.assert_qmp(result, 'return[0]/io-status', 'failed')
 
@@ -766,7 +773,8 @@ class TestEIO(TestErrors):
                     if result == {'return': []}:
                         # Race; likely already finished. Check.
                         continue
-                    self.assert_qmp(result, 'return[0]/paused', False)
+                    self.assertIn(result['return'][0]['status'],
+                                  ['running', 'pending', 'aborting', 'concluded'])
                     self.assert_qmp(result, 'return[0]/io-status', 'ok')
                 elif event['event'] == 'BLOCK_JOB_COMPLETED':
                     self.assertTrue(error, 'job completed unexpectedly')
@@ -843,8 +851,14 @@ class TestENOSPC(TestErrors):
                     self.assert_qmp(event, 'data/operation', 'read')
                     error = True
 
+                    if self.vm.qmp('query-block-jobs')['return'][0]['status'] != 'paused':
+                        self.vm.events_wait([(
+                            'JOB_STATUS_CHANGE',
+                            {'data': {'id': 'drive0', 'status': 'paused'}}
+                        )])
+
                     result = self.vm.qmp('query-block-jobs')
-                    self.assert_qmp(result, 'return[0]/paused', True)
+                    self.assert_qmp(result, 'return[0]/status', 'paused')
                     self.assert_qmp(result, 'return[0]/offset', self.STREAM_BUFFER_SIZE)
                     self.assert_qmp(result, 'return[0]/io-status', 'nospace')
 
@@ -855,7 +869,8 @@ class TestENOSPC(TestErrors):
                     if result == {'return': []}:
                         # Race; likely already finished. Check.
                         continue
-                    self.assert_qmp(result, 'return[0]/paused', False)
+                    self.assertIn(result['return'][0]['status'],
+                                  ['running', 'pending', 'aborting', 'concluded'])
                     self.assert_qmp(result, 'return[0]/io-status', 'ok')
                 elif event['event'] == 'BLOCK_JOB_COMPLETED':
                     self.assertTrue(error, 'job completed unexpectedly')
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 3e16acee56..8429958bf0 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -529,7 +529,7 @@ new_state = "1"
         self.assert_qmp(event, 'data/device', 'drive0')
         self.assert_qmp(event, 'data/operation', 'read')
         result = self.vm.qmp('query-block-jobs')
-        self.assert_qmp(result, 'return[0]/paused', False)
+        self.assertIn(result['return'][0]['status'], ['running', 'ready'])
         self.complete_and_wait()
 
     def test_large_cluster(self):
@@ -555,7 +555,7 @@ new_state = "1"
         self.assert_qmp(event, 'data/device', 'drive0')
         self.assert_qmp(event, 'data/operation', 'read')
         result = self.vm.qmp('query-block-jobs')
-        self.assert_qmp(result, 'return[0]/paused', False)
+        self.assertIn(result['return'][0]['status'], ['running', 'ready'])
         self.complete_and_wait()
         self.vm.shutdown()
 
@@ -580,8 +580,14 @@ new_state = "1"
                     self.assert_qmp(event, 'data/device', 'drive0')
                     self.assert_qmp(event, 'data/operation', 'read')
 
+                    if self.vm.qmp('query-block-jobs')['return'][0]['status'] != 'paused':
+                        self.vm.events_wait([(
+                            'JOB_STATUS_CHANGE',
+                            {'data': {'id': 'drive0', 'status': 'paused'}}
+                        )])
+
                     result = self.vm.qmp('query-block-jobs')
-                    self.assert_qmp(result, 'return[0]/paused', True)
+                    self.assert_qmp(result, 'return[0]/status', 'paused')
                     self.assert_qmp(result, 'return[0]/io-status', 'failed')
 
                     result = self.vm.qmp('block-job-resume', device='drive0')
@@ -593,7 +599,7 @@ new_state = "1"
                     ready = True
 
         result = self.vm.qmp('query-block-jobs')
-        self.assert_qmp(result, 'return[0]/paused', False)
+        self.assert_qmp(result, 'return[0]/status', 'ready')
         self.assert_qmp(result, 'return[0]/io-status', 'ok')
 
         self.complete_and_wait(wait_ready=False)
@@ -686,7 +692,7 @@ new_state = "1"
         self.assert_qmp(event, 'data/device', 'drive0')
         self.assert_qmp(event, 'data/operation', 'write')
         result = self.vm.qmp('query-block-jobs')
-        self.assert_qmp(result, 'return[0]/paused', False)
+        self.assertIn(result['return'][0]['status'], ['running', 'ready'])
         self.complete_and_wait()
 
     def test_stop_write(self):
@@ -705,15 +711,21 @@ new_state = "1"
                     self.assert_qmp(event, 'data/device', 'drive0')
                     self.assert_qmp(event, 'data/operation', 'write')
 
+                    if self.vm.qmp('query-block-jobs')['return'][0]['status'] != 'paused':
+                        self.vm.events_wait([(
+                            'JOB_STATUS_CHANGE',
+                            {'data': {'id': 'drive0', 'status': 'paused'}}
+                        )])
+
                     result = self.vm.qmp('query-block-jobs')
-                    self.assert_qmp(result, 'return[0]/paused', True)
+                    self.assert_qmp(result, 'return[0]/status', 'paused')
                     self.assert_qmp(result, 'return[0]/io-status', 'failed')
 
                     result = self.vm.qmp('block-job-resume', device='drive0')
                     self.assert_qmp(result, 'return', {})
 
                     result = self.vm.qmp('query-block-jobs')
-                    self.assert_qmp(result, 'return[0]/paused', False)
+                    self.assertIn(result['return'][0]['status'], ['running', 'ready'])
                     self.assert_qmp(result, 'return[0]/io-status', 'ok')
                     error = True
                 elif event['event'] == 'BLOCK_JOB_READY':
-- 
2.35.1


