Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CEE4F9B52
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:06:12 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncs3n-0004Hq-Kg
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncs0H-0001R1-Up
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:02:33 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135]:38500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncs0D-0005Ck-CT
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:02:33 -0400
Received: by mail-lf1-x135.google.com with SMTP id b21so16128675lfb.5
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mmvDOHk3JJVJDN3eq+omTJ471I+S1iqtvxcVwubF8SI=;
 b=k9LDncvat1/uZnBsEJuMOryDZKTPCgPxX7zqENQfeHrpx7wQDS7iWBhBRSnBNbbe38
 Ah3Yj6diacNehkCKbtnC1ozIcnEItCENdujAifBgTIXhBTGyV0oWwWnTLUWhDiFwneaU
 wvE+dh9BLs8iRbwqf42GkgK0jVaFjHSCq4TUUYIDKNjsQ3Qabm3v6R8BBiYObgERSRO5
 x8Mqjydrr0aNzJndDT303nCiPkqG2j7fX2V04tvjP18p1Qf6Y26aviW5yFHbvzLQK/Gn
 Kx1WiHKStcVGSigsYgIbm60eP2GkMPbyb+5CXhAJdH7Sz7h8jxGi52OonkWfTb3qj5Gq
 rcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mmvDOHk3JJVJDN3eq+omTJ471I+S1iqtvxcVwubF8SI=;
 b=DEO7hvT0bt+ubQoqP6j+lPFwhgfrBDVugl1nP4f2I0PgzDmX7d4q7963JsCx5frxbW
 vISXQ3BqY2B2OwXe14a2k8t8/U6wXMH427rUr27p1SdzHnRTh90GQShMhXzJXHmvy8jE
 navANiGs6jtHtyYjFf1InVQQ/VLpbFQOS/8lpGTFymd6kFGEQVTjpTADaC++k/vxLjjV
 aSogu67ijNZn1tzyHf5la/fQxpsCtX6m0tRQerLyQ+HuN7yD5QYfNVfXQuUP/IMJcRjO
 NZtbqKx+kjXOjFGzeLkD0GCd1bafhJ7vPkFJL9DBqv8bJZAm5tIZIbLl9xqrEnwgdvCO
 QVXQ==
X-Gm-Message-State: AOAM533yfm9uRjx7PggnmWyhH+/Xipm7ZZGZCbssNXwDmzUnCBZXGthB
 AX2lYQe5OKK11YY8FErew+JS9Q==
X-Google-Smtp-Source: ABdhPJwnKLTTYB+dO3z4MzivzYCp/pCFYiPIC5Sl+MniGPMLAzygImh/zpEyHpgxMiOa5xmxzPUcmw==
X-Received: by 2002:a05:6512:ace:b0:44a:d351:5268 with SMTP id
 n14-20020a0565120ace00b0044ad3515268mr12959536lfu.572.1649437346579; 
 Fri, 08 Apr 2022 10:02:26 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 g36-20020a0565123ba400b0044a2a1ccd99sm2505687lfv.20.2022.04.08.10.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 10:02:26 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests: use vm.cmd() instead of vm.qmp() where
 appropriate
Date: Fri,  8 Apr 2022 20:02:14 +0300
Message-Id: <20220408170214.45585-3-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408170214.45585-1-vsementsov@openvz.org>
References: <20220408170214.45585-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, bleal@redhat.com, qemu-devel@nongnu.org,
 hreitz@redhat.com, vsementsov@openvz.org, crosa@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Checking success by hand every time is tedious. Let's use cmd() method
instead which does this check for us.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/030                        | 168 +++----
 tests/qemu-iotests/040                        | 167 +++---
 tests/qemu-iotests/041                        | 474 ++++++++----------
 tests/qemu-iotests/045                        |  15 +-
 tests/qemu-iotests/055                        |  61 +--
 tests/qemu-iotests/056                        |  23 +-
 tests/qemu-iotests/093                        |  41 +-
 tests/qemu-iotests/118                        | 221 ++++----
 tests/qemu-iotests/124                        |  69 ++-
 tests/qemu-iotests/129                        |  13 +-
 tests/qemu-iotests/132                        |   5 +-
 tests/qemu-iotests/139                        |  43 +-
 tests/qemu-iotests/147                        |  30 +-
 tests/qemu-iotests/151                        |  40 +-
 tests/qemu-iotests/155                        |  53 +-
 tests/qemu-iotests/165                        |   7 +-
 tests/qemu-iotests/196                        |   3 +-
 tests/qemu-iotests/205                        |   6 +-
 tests/qemu-iotests/245                        | 245 ++++-----
 tests/qemu-iotests/264                        |  31 +-
 tests/qemu-iotests/281                        |  21 +-
 tests/qemu-iotests/295                        |  27 +-
 tests/qemu-iotests/296                        |  14 +-
 tests/qemu-iotests/298                        |  13 +-
 tests/qemu-iotests/300                        |  50 +-
 tests/qemu-iotests/iotests.py                 |   6 +-
 .../tests/migrate-bitmaps-postcopy-test       |  31 +-
 tests/qemu-iotests/tests/migrate-bitmaps-test |  37 +-
 .../qemu-iotests/tests/migrate-during-backup  |  40 +-
 .../qemu-iotests/tests/migration-permissions  |   9 +-
 tests/qemu-iotests/tests/mirror-top-perms     |  15 +-
 31 files changed, 773 insertions(+), 1205 deletions(-)

diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
index 18eddcc734..7c79fe041d 100755
--- a/tests/qemu-iotests/030
+++ b/tests/qemu-iotests/030
@@ -56,8 +56,7 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_stream(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         self.wait_until_completed()
 
@@ -75,8 +74,7 @@ class TestSingleDrive(iotests.QMPTestCase):
                             qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', mid_img),
                             'image file map matches backing file before streaming')
 
-        result = self.vm.qmp('block-stream', device='mid', job_id='stream-mid')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='mid', job_id='stream-mid')
 
         self.wait_until_completed(drive='stream-mid')
 
@@ -91,8 +89,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         self.pause_job('drive0', wait=False)
         self.vm.resume_drive('drive0')
@@ -105,8 +102,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/offset', offset)
 
-        result = self.vm.qmp('block-job-resume', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device='drive0')
 
         self.wait_until_completed()
 
@@ -124,8 +120,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         empty_map = qemu_io('-f', iotests.imgfmt, '-rU', '-c', 'map', test_img)
 
         # This is a no-op: no data should ever be copied from the base image
-        result = self.vm.qmp('block-stream', device='drive0', base=mid_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', base=mid_img)
 
         self.wait_until_completed()
 
@@ -138,8 +133,7 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_stream_partial(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0', base=backing_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', base=backing_img)
 
         self.wait_until_completed()
 
@@ -165,24 +159,22 @@ class TestSingleDrive(iotests.QMPTestCase):
             qemu_img('create', '-f', iotests.imgfmt, ro_top_path,
                      str(self.image_len))
 
-            result = self.vm.qmp('blockdev-add',
-                                 node_name='ro-top',
-                                 driver=iotests.imgfmt,
-                                 read_only=True,
-                                 file={
-                                     'driver': 'file',
-                                     'filename': ro_top_path,
-                                     'read-only': True
-                                 },
-                                 backing='mid')
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add',
+                        node_name='ro-top',
+                        driver=iotests.imgfmt,
+                        read_only=True,
+                        file={
+                            'driver': 'file',
+                            'filename': ro_top_path,
+                            'read-only': True
+                        },
+                        backing='mid')
 
             result = self.vm.qmp('block-stream', job_id='stream',
                                  device='ro-top', base_node='base')
             self.assert_qmp(result, 'error/desc', 'Block node is read-only')
 
-            result = self.vm.qmp('blockdev-del', node_name='ro-top')
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-del', node_name='ro-top')
 
 
 class TestParallelOps(iotests.QMPTestCase):
@@ -246,10 +238,9 @@ class TestParallelOps(iotests.QMPTestCase):
             node_name = 'node%d' % i
             job_id = 'stream-%s' % node_name
             pending_jobs.append(job_id)
-            result = self.vm.qmp('block-stream', device=node_name,
-                                 job_id=job_id, bottom=f'node{i-1}',
-                                 speed=1024)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('block-stream', device=node_name,
+                        job_id=job_id, bottom=f'node{i-1}',
+                        speed=1024)
 
         # Do this in reverse: After unthrottling them, some jobs may finish
         # before we have unthrottled all of them.  This will drain their
@@ -261,8 +252,7 @@ class TestParallelOps(iotests.QMPTestCase):
         # Starting from the top (i.e. in reverse) does not have this problem:
         # When a job finishes, the ones below it are not advanced.
         for job in reversed(pending_jobs):
-            result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('block-job-set-speed', device=job, speed=0)
 
         # Wait for all jobs to be finished.
         while len(pending_jobs) > 0:
@@ -288,10 +278,9 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
-        result = self.vm.qmp('block-stream', device='node4',
-                             job_id='stream-node4', base=self.imgs[1],
-                             filter_node_name='stream-filter', speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='node4',
+                    job_id='stream-node4', base=self.imgs[1],
+                    filter_node_name='stream-filter', speed=1024*1024)
 
         result = self.vm.qmp('block-stream', device='node5', job_id='stream-node5', base=self.imgs[2])
         self.assert_qmp(result, 'error/desc',
@@ -319,8 +308,7 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_qmp(result, 'error/desc',
             "Node 'node2' is busy: block device is in use by block job: stream")
 
-        result = self.vm.qmp('block-job-set-speed', device='stream-node4', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='stream-node4', speed=0)
 
         self.wait_until_completed(drive='stream-node4')
         self.assert_no_active_block_jobs()
@@ -332,8 +320,7 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
-        result = self.vm.qmp('block-commit', device='drive0', top=self.imgs[5], base=self.imgs[3], job_id='commit-node3', speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', top=self.imgs[5], base=self.imgs[3], job_id='commit-node3', speed=1024*1024)
 
         result = self.vm.qmp('block-stream', device='node3', job_id='stream-node3')
         self.assert_qmp(result, 'error/desc',
@@ -356,8 +343,7 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_qmp(result, 'error/desc',
             "Node 'drive0' is busy: block device is in use by block job: commit")
 
-        result = self.vm.qmp('block-job-set-speed', device='commit-node3', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='commit-node3', speed=0)
 
         self.wait_until_completed(drive='commit-node3')
 
@@ -368,23 +354,20 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Set a speed limit to make sure that this job blocks the rest
-        result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[3], job_id='commit-drive0', speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', base=self.imgs[3], job_id='commit-drive0', speed=1024*1024)
 
         result = self.vm.qmp('block-stream', device='node5', base=self.imgs[3], job_id='stream-node6')
         self.assert_qmp(result, 'error/desc',
             "Node 'node5' is busy: block device is in use by block job: commit")
 
-        result = self.vm.qmp('block-job-set-speed', device='commit-drive0', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='commit-drive0', speed=0)
 
         event = self.vm.event_wait(name='BLOCK_JOB_READY')
         self.assert_qmp(event, 'data/device', 'commit-drive0')
         self.assert_qmp(event, 'data/type', 'commit')
         self.assert_qmp_absent(event, 'data/error')
 
-        result = self.vm.qmp('block-job-complete', device='commit-drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-complete', device='commit-drive0')
 
         self.wait_until_completed(drive='commit-drive0')
 
@@ -395,18 +378,16 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Commit from node2 into node0
-        result = self.vm.qmp('block-commit', device='drive0',
-                             top=self.imgs[2], base=self.imgs[0],
-                             filter_node_name='commit-filter', speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0',
+                    top=self.imgs[2], base=self.imgs[0],
+                    filter_node_name='commit-filter', speed=1024*1024)
 
         # Stream from node2 into node4
         result = self.vm.qmp('block-stream', device='node4', base_node='node2', job_id='node4')
         self.assert_qmp(result, 'error/desc',
             "Cannot freeze 'backing' link to 'commit-filter'")
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=0)
 
         self.wait_until_completed()
         self.assert_no_active_block_jobs()
@@ -419,18 +400,15 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Commit from node2 into node0
-        result = self.vm.qmp('block-commit', device='drive0',
-                             top_node='node2', base_node='node0',
-                             filter_node_name='commit-filter', speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0',
+                    top_node='node2', base_node='node0',
+                    filter_node_name='commit-filter', speed=1024*1024)
 
         # Stream from node2 into node4
-        result = self.vm.qmp('block-stream', device='node4',
-                             base_node='commit-filter', job_id='node4')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='node4',
+                    base_node='commit-filter', job_id='node4')
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=0)
 
         self.vm.run_job(job='drive0', auto_dismiss=True)
         self.vm.run_job(job='node4', auto_dismiss=True)
@@ -449,12 +427,10 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Stream from node0 into node2
-        result = self.vm.qmp('block-stream', device='node2', base_node='node0', job_id='node2')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='node2', base_node='node0', job_id='node2')
 
         # Commit from the active layer into node3
-        result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[3])
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', base=self.imgs[3])
 
         # Wait for all jobs to be finished.
         pending_jobs = ['node2', 'drive0']
@@ -481,16 +457,13 @@ class TestParallelOps(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # Stream from node0 into node4
-        result = self.vm.qmp('block-stream', device='node4', base_node='node0', job_id='node4', speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='node4', base_node='node0', job_id='node4', speed=1024*1024)
 
         # Commit from the active layer into node5
-        result = self.vm.qmp('block-commit', device='drive0', base=self.imgs[5], speed=1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', base=self.imgs[5], speed=1024*1024)
 
         for job in ['drive0', 'node4']:
-            result = self.vm.qmp('block-job-set-speed', device=job, speed=0)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('block-job-set-speed', device=job, speed=0)
 
         # Wait for all jobs to be finished.
         pending_jobs = ['node4', 'drive0']
@@ -539,8 +512,7 @@ class TestParallelOps(iotests.QMPTestCase):
             "'base' and 'base-node' cannot be specified at the same time")
 
         # Success: the base node is a backing file of the top node
-        result = self.vm.qmp('block-stream', device='node4', base_node='node2', job_id='stream')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='node4', base_node='node2', job_id='stream')
 
         self.wait_until_completed(drive='stream')
 
@@ -594,8 +566,7 @@ class TestQuorum(iotests.QMPTestCase):
 
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='node0', job_id='stream-node0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='node0', job_id='stream-node0')
 
         self.wait_until_completed(drive='stream-node0')
 
@@ -623,8 +594,7 @@ class TestSmallerBackingFile(iotests.QMPTestCase):
     def test_stream(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         self.wait_until_completed()
 
@@ -681,8 +651,7 @@ class TestEIO(TestErrors):
     def test_report(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         completed = False
         error = False
@@ -709,8 +678,7 @@ class TestEIO(TestErrors):
     def test_ignore(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0', on_error='ignore')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', on_error='ignore')
 
         error = False
         completed = False
@@ -743,8 +711,7 @@ class TestEIO(TestErrors):
     def test_stop(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0', on_error='stop')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', on_error='stop')
 
         error = False
         completed = False
@@ -766,8 +733,7 @@ class TestEIO(TestErrors):
                     self.assert_qmp(result, 'return[0]/offset', self.STREAM_BUFFER_SIZE)
                     self.assert_qmp(result, 'return[0]/io-status', 'failed')
 
-                    result = self.vm.qmp('block-job-resume', device='drive0')
-                    self.assert_qmp(result, 'return', {})
+                    self.vm.cmd('block-job-resume', device='drive0')
 
                     result = self.vm.qmp('query-block-jobs')
                     if result == {'return': []}:
@@ -793,8 +759,7 @@ class TestEIO(TestErrors):
     def test_enospc(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0', on_error='enospc')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', on_error='enospc')
 
         completed = False
         error = False
@@ -839,8 +804,7 @@ class TestENOSPC(TestErrors):
     def test_enospc(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0', on_error='enospc')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', on_error='enospc')
 
         error = False
         completed = False
@@ -862,8 +826,7 @@ class TestENOSPC(TestErrors):
                     self.assert_qmp(result, 'return[0]/offset', self.STREAM_BUFFER_SIZE)
                     self.assert_qmp(result, 'return[0]/io-status', 'nospace')
 
-                    result = self.vm.qmp('block-job-resume', device='drive0')
-                    self.assert_qmp(result, 'return', {})
+                    self.vm.cmd('block-job-resume', device='drive0')
 
                     result = self.vm.qmp('query-block-jobs')
                     if result == {'return': []}:
@@ -908,8 +871,7 @@ class TestStreamStop(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         time.sleep(0.1)
         events = self.vm.get_qmp_events(wait=False)
@@ -942,11 +904,9 @@ class TestSetSpeed(iotests.QMPTestCase):
     def perf_test_throughput(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
 
         self.wait_until_completed()
 
@@ -956,16 +916,14 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         # Default speed is 0
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
         self.assert_qmp(result, 'return[0]/speed', 0)
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
 
         # Ensure the speed we set was accepted
         result = self.vm.qmp('query-block-jobs')
@@ -976,8 +934,7 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.vm.pause_drive('drive0')
 
         # Check setting speed in block-stream works
-        result = self.vm.qmp('block-stream', device='drive0', speed=4 * 1024 * 1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0', speed=4 * 1024 * 1024)
 
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
@@ -994,8 +951,7 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp('block-stream', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', device='drive0')
 
         result = self.vm.qmp('block-job-set-speed', device='drive0', speed=-1)
         self.assert_qmp(result, 'error/desc', "Parameter 'speed' expects a non-negative value")
diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 0e1cfd7e49..d43f3c3130 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -61,16 +61,14 @@ class ImageCommitTestCase(iotests.QMPTestCase):
     def run_commit_test(self, top, base, need_ready=False, node_names=False):
         self.assert_no_active_block_jobs()
         if node_names:
-            result = self.vm.qmp('block-commit', device='drive0', top_node=top, base_node=base)
+            self.vm.cmd('block-commit', device='drive0', top_node=top, base_node=base)
         else:
-            result = self.vm.qmp('block-commit', device='drive0', top=top, base=base)
-        self.assert_qmp(result, 'return', {})
+            self.vm.cmd('block-commit', device='drive0', top=top, base=base)
         self.wait_for_complete(need_ready)
 
     def run_default_commit_test(self):
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('block-commit', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0')
         self.wait_for_complete()
 
 class TestSingleDrive(ImageCommitTestCase):
@@ -111,38 +109,30 @@ class TestSingleDrive(ImageCommitTestCase):
 
     @iotests.skip_if_unsupported(['throttle'])
     def test_commit_with_filter_and_quit(self):
-        result = self.vm.qmp('object-add', qom_type='throttle-group', id='tg')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', qom_type='throttle-group', id='tg')
 
         # Add a filter outside of the backing chain
-        result = self.vm.qmp('blockdev-add', driver='throttle', node_name='filter', throttle_group='tg', file='mid')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', driver='throttle', node_name='filter', throttle_group='tg', file='mid')
 
-        result = self.vm.qmp('block-commit', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0')
 
         # Quit immediately, thus forcing a simultaneous cancel of the
         # block job and a bdrv_drain_all()
-        result = self.vm.qmp('quit')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('quit')
 
     # Same as above, but this time we add the filter after starting the job
     @iotests.skip_if_unsupported(['throttle'])
     def test_commit_plus_filter_and_quit(self):
-        result = self.vm.qmp('object-add', qom_type='throttle-group', id='tg')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', qom_type='throttle-group', id='tg')
 
-        result = self.vm.qmp('block-commit', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0')
 
         # Add a filter outside of the backing chain
-        result = self.vm.qmp('blockdev-add', driver='throttle', node_name='filter', throttle_group='tg', file='mid')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', driver='throttle', node_name='filter', throttle_group='tg', file='mid')
 
         # Quit immediately, thus forcing a simultaneous cancel of the
         # block job and a bdrv_drain_all()
-        result = self.vm.qmp('quit')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('quit')
 
     def test_device_not_found(self):
         result = self.vm.qmp('block-commit', device='nonexistent', top='%s' % mid_img)
@@ -215,8 +205,7 @@ class TestSingleDrive(ImageCommitTestCase):
     def test_top_node_in_wrong_chain(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('blockdev-add', driver='null-co', node_name='null')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', driver='null-co', node_name='null')
 
         result = self.vm.qmp('block-commit', device='drive0', top_node='null', base_node='base')
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -229,11 +218,9 @@ class TestSingleDrive(ImageCommitTestCase):
             return
 
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('block-commit', device='drive0', top=mid_img,
-                             base=backing_img, speed=(self.image_len // 4))
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('device_del', id='scsi0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', top=mid_img,
+                    base=backing_img, speed=(self.image_len // 4))
+        self.vm.cmd('device_del', id='scsi0')
 
         cancelled = False
         deleted = False
@@ -259,9 +246,8 @@ class TestSingleDrive(ImageCommitTestCase):
             return
 
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('block-commit', device='drive0', top=mid_img,
-                             base=backing_img, speed=(self.image_len // 4))
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', top=mid_img,
+                    base=backing_img, speed=(self.image_len // 4))
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/file', test_img)
@@ -396,8 +382,7 @@ class TestSetSpeed(ImageCommitTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp('block-commit', device='drive0', top=mid_img, speed=1024 * 1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0', top=mid_img, speed=1024 * 1024)
 
         # Ensure the speed we set was accepted
         result = self.vm.qmp('query-block-jobs')
@@ -470,8 +455,7 @@ class TestErrorHandling(iotests.QMPTestCase):
         os.remove(backing_img)
 
     def blockdev_add(self, **kwargs):
-        result = self.vm.qmp('blockdev-add', **kwargs)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', **kwargs)
 
     def add_block_nodes(self, base_debug=None, mid_debug=None, top_debug=None):
         self.blockdev_add(node_name='base-file', driver='file',
@@ -517,11 +501,9 @@ class TestErrorHandling(iotests.QMPTestCase):
                 completed = True
             elif ev['event'] == 'BLOCK_JOB_ERROR':
                 if error_pauses_job:
-                    result = self.vm.qmp('block-job-resume', device='job0')
-                    self.assert_qmp(result, 'return', {})
+                    self.vm.cmd('block-job-resume', device='job0')
             elif ev['event'] == 'BLOCK_JOB_READY':
-                result = self.vm.qmp('block-job-complete', device='job0')
-                self.assert_qmp(result, 'return', {})
+                self.vm.cmd('block-job-complete', device='job0')
             else:
                 self.fail("Unexpected event: %s" % ev)
             log.append(iotests.filter_qmp_event(ev))
@@ -584,11 +566,10 @@ class TestErrorHandling(iotests.QMPTestCase):
         self.add_block_nodes(top_debug=top_debug, mid_debug=mid_debug,
                              base_debug=base_debug)
 
-        result = self.vm.qmp('block-commit', job_id='job0', device='top-fmt',
-                             top_node='top-fmt' if active else 'mid-fmt',
-                             base_node='mid-fmt' if active else 'base-fmt',
-                             on_error=on_error)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', job_id='job0', device='top-fmt',
+                    top_node='top-fmt' if active else 'mid-fmt',
+                    base_node='mid-fmt' if active else 'base-fmt',
+                    on_error=on_error)
 
     def testActiveReadErrorReport(self):
         self.prepare_and_start_job('report', top_event='read_aio')
@@ -761,10 +742,9 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         self.vm = iotests.VM().add_device('virtio-scsi,id=vio-scsi')
         self.vm.launch()
 
-        result = self.vm.qmp('object-add', qom_type='throttle-group', id='tg')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', qom_type='throttle-group', id='tg')
 
-        result = self.vm.qmp('blockdev-add', **{
+        self.vm.cmd('blockdev-add', {
                 'node-name': 'top-filter',
                 'driver': 'throttle',
                 'throttle-group': 'tg',
@@ -806,7 +786,6 @@ class TestCommitWithFilters(iotests.QMPTestCase):
                     }
                 }
             })
-        self.assert_qmp(result, 'return', {})
 
     def tearDown(self):
         self.vm.shutdown()
@@ -823,12 +802,11 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         return self.vm.node_info(node)['image']['filename']
 
     def test_filterless_commit(self):
-        result = self.vm.qmp('block-commit',
-                             job_id='commit',
-                             device='top-filter',
-                             top_node='cow-2',
-                             base_node='cow-1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit',
+                    job_id='commit',
+                    device='top-filter',
+                    top_node='cow-2',
+                    base_node='cow-1')
         self.wait_until_completed(drive='commit')
 
         self.assertIsNotNone(self.vm.node_info('cow-3'))
@@ -839,12 +817,11 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         self.pattern_files[2] = self.img1
 
     def test_commit_through_filter(self):
-        result = self.vm.qmp('block-commit',
-                             job_id='commit',
-                             device='top-filter',
-                             top_node='cow-1',
-                             base_node='cow-0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit',
+                    job_id='commit',
+                    device='top-filter',
+                    top_node='cow-1',
+                    base_node='cow-0')
         self.wait_until_completed(drive='commit')
 
         self.assertIsNotNone(self.vm.node_info('cow-2'))
@@ -859,9 +836,8 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         # Add a device, so the commit job finds a parent it can change
         # to point to the base node (so we can test that top-filter is
         # dropped from the graph)
-        result = self.vm.qmp('device_add', id='drv0', driver='scsi-hd',
-                             bus='vio-scsi.0', drive='top-filter')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_add', id='drv0', driver='scsi-hd',
+                    bus='vio-scsi.0', drive='top-filter')
 
         # Try to release our reference to top-filter; that should not
         # work because drv0 uses it
@@ -869,16 +845,14 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         self.assert_qmp(result, 'error/class', 'GenericError')
         self.assert_qmp(result, 'error/desc', 'Node top-filter is in use')
 
-        result = self.vm.qmp('block-commit',
-                             job_id='commit',
-                             device='top-filter',
-                             base_node='cow-2')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit',
+                    job_id='commit',
+                    device='top-filter',
+                    base_node='cow-2')
         self.complete_and_wait(drive='commit')
 
         # Try to release our reference to top-filter again
-        result = self.vm.qmp('blockdev-del', node_name='top-filter')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', node_name='top-filter')
 
         self.assertIsNone(self.vm.node_info('top-filter'))
         self.assertIsNone(self.vm.node_info('cow-3'))
@@ -893,12 +867,11 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         self.pattern_files[3] = self.img2
 
     def test_filtered_active_commit_without_filter(self):
-        result = self.vm.qmp('block-commit',
-                             job_id='commit',
-                             device='top-filter',
-                             top_node='cow-3',
-                             base_node='cow-2')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit',
+                    job_id='commit',
+                    device='top-filter',
+                    top_node='cow-3',
+                    base_node='cow-2')
         self.complete_and_wait(drive='commit')
 
         self.assertIsNotNone(self.vm.node_info('top-filter'))
@@ -923,23 +896,22 @@ class TestCommitWithOverriddenBacking(iotests.QMPTestCase):
         self.vm.launch()
 
         # Use base_b instead of base_a as the backing of top
-        result = self.vm.qmp('blockdev-add', **{
-                                'node-name': 'top',
-                                'driver': iotests.imgfmt,
-                                'file': {
-                                    'driver': 'file',
-                                    'filename': self.img_top
-                                },
-                                'backing': {
-                                    'node-name': 'base',
-                                    'driver': iotests.imgfmt,
-                                    'file': {
-                                        'driver': 'file',
-                                        'filename': self.img_base_b
-                                    }
-                                }
-                            })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', {
+            'node-name': 'top',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': self.img_top
+            },
+            'backing': {
+                'node-name': 'base',
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': self.img_base_b
+                }
+            }
+        })
 
     def tearDown(self):
         self.vm.shutdown()
@@ -959,11 +931,10 @@ class TestCommitWithOverriddenBacking(iotests.QMPTestCase):
     def test_commit_to_b(self):
         # Try committing to base_b (which should work, since that is
         # actually top's backing image)
-        result = self.vm.qmp('block-commit',
-                             job_id='commit',
-                             device='top',
-                             base=self.img_base_b)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit',
+                    job_id='commit',
+                    device='top',
+                    base=self.img_base_b)
 
         self.vm.event_wait('BLOCK_JOB_READY')
         self.vm.qmp('block-job-complete', device='commit')
diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8429958bf0..4d2a699613 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -65,9 +65,8 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_complete(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    target=self.qmp_target)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -79,9 +78,8 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_cancel(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    target=self.qmp_target)
 
         self.cancel_and_wait(force=True)
         result = self.vm.qmp('query-block')
@@ -90,9 +88,8 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_cancel_after_ready(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    target=self.qmp_target)
 
         self.wait_ready_and_cancel()
         result = self.vm.qmp('query-block')
@@ -104,9 +101,8 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_pause(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    target=self.qmp_target)
 
         self.pause_job('drive0')
 
@@ -117,8 +113,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/offset', offset)
 
-        result = self.vm.qmp('block-job-resume', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device='drive0')
 
         self.complete_and_wait()
         self.vm.shutdown()
@@ -129,9 +124,8 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         # A small buffer is rounded up automatically
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             buf_size=4096, target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    buf_size=4096, target=self.qmp_target)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -145,9 +139,8 @@ class TestSingleDrive(iotests.QMPTestCase):
 
         qemu_img('create', '-f', iotests.imgfmt, '-o', 'cluster_size=%d,size=%d'
                         % (self.image_len, self.image_len), target_img)
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             buf_size=65536, mode='existing', target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    buf_size=65536, mode='existing', target=self.qmp_target)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -162,9 +155,8 @@ class TestSingleDrive(iotests.QMPTestCase):
         qemu_img('create', '-f', iotests.imgfmt, '-o', 'cluster_size=%d,backing_file=%s'
                         % (self.image_len, backing_img),
                  '-F', 'raw', target_img)
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             mode='existing', target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    mode='existing', target=self.qmp_target)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -178,9 +170,8 @@ class TestSingleDrive(iotests.QMPTestCase):
     def test_implicit_node(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp(self.qmp_cmd, device='drive0', sync='full',
-                             target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, device='drive0', sync='full',
+                    target=self.qmp_target)
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/file', test_img)
@@ -236,8 +227,7 @@ class TestSingleBlockdev(TestSingleDrive):
         args = {'driver': iotests.imgfmt,
                 'node-name': self.qmp_target,
                 'file': { 'filename': target_img, 'driver': 'file' } }
-        result = self.vm.qmp("blockdev-add", **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("blockdev-add", **args)
 
     def test_mirror_to_self(self):
         result = self.vm.qmp(self.qmp_cmd, job_id='job0',
@@ -254,10 +244,9 @@ class TestSingleBlockdev(TestSingleDrive):
             result = self.vm.qmp('block_resize', node_name=node, size=65536)
             self.assert_qmp(result, 'error/class', 'GenericError')
 
-        result = self.vm.qmp(self.qmp_cmd, job_id='job0', device='drive0',
-                             sync='full', target=self.qmp_target,
-                             auto_finalize=False, auto_dismiss=False)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, job_id='job0', device='drive0',
+                    sync='full', target=self.qmp_target,
+                    auto_finalize=False, auto_dismiss=False)
 
         result = self.vm.run_job('job0', auto_finalize=False,
                                  pre_finalize=pre_finalize)
@@ -270,14 +259,11 @@ class TestSingleBlockdev(TestSingleDrive):
         self.do_test_resize(None, self.qmp_target)
 
     def do_test_target_size(self, size):
-        result = self.vm.qmp('block_resize', node_name=self.qmp_target,
-                             size=size)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block_resize', node_name=self.qmp_target, size=size)
 
-        result = self.vm.qmp(self.qmp_cmd, job_id='job0',
-                             device='drive0', sync='full', auto_dismiss=False,
-                             target=self.qmp_target)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(self.qmp_cmd, job_id='job0',
+                    device='drive0', sync='full', auto_dismiss=False,
+                    target=self.qmp_target)
 
         result = self.vm.run_job('job0')
         self.assertEqual(result, 'Source and target image have different sizes')
@@ -337,9 +323,8 @@ class TestMirrorNoBacking(iotests.QMPTestCase):
 
         qemu_img('create', '-f', iotests.imgfmt,
                  '-o', 'backing_file=%s' % backing_img, '-F', 'raw', target_img)
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             mode='existing', target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    mode='existing', target=target_img)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -353,9 +338,8 @@ class TestMirrorNoBacking(iotests.QMPTestCase):
 
         qemu_img('create', '-f', iotests.imgfmt,
                  '-o', 'backing_file=%s' % backing_img, '-F', 'raw', target_img)
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             mode='existing', target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    mode='existing', target=target_img)
 
         self.wait_ready_and_cancel()
         result = self.vm.qmp('query-block')
@@ -374,9 +358,8 @@ class TestMirrorNoBacking(iotests.QMPTestCase):
                         % (TestMirrorNoBacking.image_len, target_backing_img),
                  '-F', iotests.imgfmt, target_img)
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             mode='existing', target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    mode='existing', target=target_img)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -409,9 +392,8 @@ class TestMirrorResized(iotests.QMPTestCase):
     def test_complete_top(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='top',
-                             target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='top',
+                    target=target_img)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -423,9 +405,8 @@ class TestMirrorResized(iotests.QMPTestCase):
     def test_complete_full(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img)
 
         self.complete_and_wait()
         result = self.vm.qmp('query-block')
@@ -488,9 +469,8 @@ new_state = "1"
     def test_report_read(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img)
 
         completed = False
         error = False
@@ -516,9 +496,8 @@ new_state = "1"
     def test_ignore_read(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img, on_source_error='ignore')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img, on_source_error='ignore')
 
         event = self.vm.get_qmp_event(wait=True)
         while event['event'] == 'JOB_STATUS_CHANGE':
@@ -541,10 +520,9 @@ new_state = "1"
         qemu_img('create', '-f', iotests.imgfmt,
                  '-ocluster_size=131072,backing_file=%s' %(backing_img),
                  '-F', 'raw', target_img)
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='top',
-                             on_source_error='ignore',
-                             mode='existing', target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='top',
+                    on_source_error='ignore',
+                    mode='existing', target=target_img)
 
         event = self.vm.get_qmp_event(wait=True)
         while event['event'] == 'JOB_STATUS_CHANGE':
@@ -568,9 +546,8 @@ new_state = "1"
     def test_stop_read(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img, on_source_error='stop')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img, on_source_error='stop')
 
         error = False
         ready = False
@@ -590,8 +567,7 @@ new_state = "1"
                     self.assert_qmp(result, 'return[0]/status', 'paused')
                     self.assert_qmp(result, 'return[0]/io-status', 'failed')
 
-                    result = self.vm.qmp('block-job-resume', device='drive0')
-                    self.assert_qmp(result, 'return', {})
+                    self.vm.cmd('block-job-resume', device='drive0')
                     error = True
                 elif event['event'] == 'BLOCK_JOB_READY':
                     self.assertTrue(error, 'job completed unexpectedly')
@@ -656,9 +632,8 @@ new_state = "1"
     def test_report_write(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             mode='existing', target=self.target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    mode='existing', target=self.target_img)
 
         completed = False
         error = False
@@ -682,10 +657,9 @@ new_state = "1"
     def test_ignore_write(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             mode='existing', target=self.target_img,
-                             on_target_error='ignore')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    mode='existing', target=self.target_img,
+                    on_target_error='ignore')
 
         event = self.vm.event_wait(name='BLOCK_JOB_ERROR')
         self.assertEqual(event['event'], 'BLOCK_JOB_ERROR')
@@ -698,10 +672,9 @@ new_state = "1"
     def test_stop_write(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             mode='existing', target=self.target_img,
-                             on_target_error='stop')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    mode='existing', target=self.target_img,
+                    on_target_error='stop')
 
         error = False
         ready = False
@@ -721,8 +694,7 @@ new_state = "1"
                     self.assert_qmp(result, 'return[0]/status', 'paused')
                     self.assert_qmp(result, 'return[0]/io-status', 'failed')
 
-                    result = self.vm.qmp('block-job-resume', device='drive0')
-                    self.assert_qmp(result, 'return', {})
+                    self.vm.cmd('block-job-resume', device='drive0')
 
                     result = self.vm.qmp('query-block-jobs')
                     self.assertIn(result['return'][0]['status'], ['running', 'ready'])
@@ -755,17 +727,15 @@ class TestSetSpeed(iotests.QMPTestCase):
     def test_set_speed(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img)
 
         # Default speed is 0
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
         self.assert_qmp(result, 'return[0]/speed', 0)
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
 
         # Ensure the speed we set was accepted
         result = self.vm.qmp('query-block-jobs')
@@ -775,9 +745,8 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.wait_ready_and_cancel()
 
         # Check setting speed in drive-mirror works
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img, speed=4*1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img, speed=4*1024*1024)
 
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
@@ -794,9 +763,8 @@ class TestSetSpeed(iotests.QMPTestCase):
 
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img)
 
         result = self.vm.qmp('block-job-set-speed', device='drive0', speed=-1)
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -811,13 +779,12 @@ class TestUnbackedSource(iotests.QMPTestCase):
                  str(TestUnbackedSource.image_len))
         self.vm = iotests.VM()
         self.vm.launch()
-        result = self.vm.qmp('blockdev-add', node_name='drive0',
-                             driver=iotests.imgfmt,
-                             file={
-                                 'driver': 'file',
-                                 'filename': test_img,
-                             })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', node_name='drive0',
+                    driver=iotests.imgfmt,
+                    file={
+                        'driver': 'file',
+                        'filename': test_img,
+                    })
 
     def tearDown(self):
         self.vm.shutdown()
@@ -826,28 +793,25 @@ class TestUnbackedSource(iotests.QMPTestCase):
 
     def test_absolute_paths_full(self):
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('drive-mirror', job_id='drive0', device='drive0',
-                             sync='full', target=target_img,
-                             mode='absolute-paths')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='drive0', device='drive0',
+                    sync='full', target=target_img,
+                    mode='absolute-paths')
         self.complete_and_wait()
         self.assert_no_active_block_jobs()
 
     def test_absolute_paths_top(self):
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('drive-mirror', job_id='drive0', device='drive0',
-                             sync='top', target=target_img,
-                             mode='absolute-paths')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='drive0', device='drive0',
+                    sync='top', target=target_img,
+                    mode='absolute-paths')
         self.complete_and_wait()
         self.assert_no_active_block_jobs()
 
     def test_absolute_paths_none(self):
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('drive-mirror', job_id='drive0', device='drive0',
-                             sync='none', target=target_img,
-                             mode='absolute-paths')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='drive0', device='drive0',
+                    sync='none', target=target_img,
+                    mode='absolute-paths')
         self.complete_and_wait()
         self.assert_no_active_block_jobs()
 
@@ -857,14 +821,12 @@ class TestUnbackedSource(iotests.QMPTestCase):
         qemu_io('-c', 'write -P 42 0 64k', target_img)
 
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('drive-mirror', job_id='drive0', device='drive0',
-                             sync='full', target=target_img, mode='existing')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='drive0', device='drive0',
+                    sync='full', target=target_img, mode='existing')
         self.complete_and_wait()
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('blockdev-del', node_name='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', node_name='drive0')
 
         self.assertTrue(iotests.compare_images(test_img, target_img),
                         'target image does not match source after mirroring')
@@ -874,26 +836,22 @@ class TestUnbackedSource(iotests.QMPTestCase):
                  str(self.image_len))
         qemu_io('-c', 'write -P 42 0 64k', target_img)
 
-        result = self.vm.qmp('blockdev-add', node_name='target',
-                             driver=iotests.imgfmt,
-                             file={
-                                 'driver': 'file',
-                                 'filename': target_img,
-                             })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', node_name='target',
+                    driver=iotests.imgfmt,
+                    file={
+                        'driver': 'file',
+                        'filename': target_img,
+                    })
 
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('blockdev-mirror', job_id='drive0', device='drive0',
-                             sync='full', target='target')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-mirror', job_id='drive0', device='drive0',
+                    sync='full', target='target')
         self.complete_and_wait()
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('blockdev-del', node_name='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', node_name='drive0')
 
-        result = self.vm.qmp('blockdev-del', node_name='target')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', node_name='target')
 
         self.assertTrue(iotests.compare_images(test_img, target_img),
                         'target image does not match source after mirroring')
@@ -918,10 +876,9 @@ class TestGranularity(iotests.QMPTestCase):
 
     def test_granularity(self):
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('drive-mirror', device='drive0',
-                             sync='full', target=target_img,
-                             mode='absolute-paths', granularity=8192)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0',
+                    sync='full', target=target_img,
+                    mode='absolute-paths', granularity=8192)
 
         event = self.vm.get_qmp_event(wait=60.0)
         while event['event'] == 'JOB_STATUS_CHANGE':
@@ -963,8 +920,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
         #assemble the quorum block device from the individual files
         args = { "driver": "quorum", "node-name": "quorum0",
                  "vote-threshold": 2, "children": [ "img0", "img1", "img2" ] }
-        result = self.vm.qmp("blockdev-add", **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("blockdev-add", **args)
 
 
     def tearDown(self):
@@ -978,10 +934,9 @@ class TestRepairQuorum(iotests.QMPTestCase):
                 pass
 
     def test_complete(self):
-        result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
-                             sync='full', node_name="repair0", replaces="img1",
-                             target=quorum_repair_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='job0', device='quorum0',
+                    sync='full', node_name="repair0", replaces="img1",
+                    target=quorum_repair_img, format=iotests.imgfmt)
 
         self.complete_and_wait(drive="job0")
         self.assert_has_block_node("repair0", quorum_repair_img)
@@ -991,10 +946,9 @@ class TestRepairQuorum(iotests.QMPTestCase):
                         'target image does not match source after mirroring')
 
     def test_cancel(self):
-        result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
-                             sync='full', node_name="repair0", replaces="img1",
-                             target=quorum_repair_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='job0', device='quorum0',
+                    sync='full', node_name="repair0", replaces="img1",
+                    target=quorum_repair_img, format=iotests.imgfmt)
 
         self.cancel_and_wait(drive="job0", force=True)
         # here we check that the last registered quorum file has not been
@@ -1002,10 +956,9 @@ class TestRepairQuorum(iotests.QMPTestCase):
         self.assert_has_block_node(None, quorum_img3)
 
     def test_cancel_after_ready(self):
-        result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
-                             sync='full', node_name="repair0", replaces="img1",
-                             target=quorum_repair_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='job0', device='quorum0',
+                    sync='full', node_name="repair0", replaces="img1",
+                    target=quorum_repair_img, format=iotests.imgfmt)
 
         self.wait_ready_and_cancel(drive="job0")
         # here we check that the last registered quorum file has not been
@@ -1016,10 +969,9 @@ class TestRepairQuorum(iotests.QMPTestCase):
                         'target image does not match source after mirroring')
 
     def test_pause(self):
-        result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
-                             sync='full', node_name="repair0", replaces="img1",
-                             target=quorum_repair_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='job0', device='quorum0',
+                    sync='full', node_name="repair0", replaces="img1",
+                    target=quorum_repair_img, format=iotests.imgfmt)
 
         self.pause_job('job0')
 
@@ -1030,8 +982,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/offset', offset)
 
-        result = self.vm.qmp('block-job-resume', device='job0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device='job0')
 
         self.complete_and_wait(drive="job0")
         self.vm.shutdown()
@@ -1093,10 +1044,9 @@ class TestRepairQuorum(iotests.QMPTestCase):
                              target=quorum_repair_img, format=iotests.imgfmt)
         self.assert_qmp(result, 'error/class', 'GenericError')
 
-        result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
-                             sync='full', node_name='repair0', replaces="snap1",
-                             target=quorum_repair_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='job0', device='quorum0',
+                    sync='full', node_name='repair0', replaces="snap1",
+                    target=quorum_repair_img, format=iotests.imgfmt)
 
         self.complete_and_wait('job0')
         self.assert_has_block_node("repair0", quorum_repair_img)
@@ -1107,15 +1057,13 @@ class TestRepairQuorum(iotests.QMPTestCase):
         Check that we cannot replace a Quorum child when it has other
         parents.
         """
-        result = self.vm.qmp('nbd-server-start',
-                             addr={
-                                 'type': 'unix',
-                                 'data': {'path': nbd_sock_path}
-                             })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('nbd-server-start',
+                    addr={
+                        'type': 'unix',
+                        'data': {'path': nbd_sock_path}
+                    })
 
-        result = self.vm.qmp('nbd-server-add', device='img1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('nbd-server-add', device='img1')
 
         result = self.vm.qmp('drive-mirror', job_id='mirror', device='quorum0',
                              sync='full', node_name='repair0', replaces='img1',
@@ -1130,20 +1078,17 @@ class TestRepairQuorum(iotests.QMPTestCase):
         The same as test_with_other_parent(), but add the NBD server
         only when the mirror job is already running.
         """
-        result = self.vm.qmp('nbd-server-start',
-                             addr={
-                                 'type': 'unix',
-                                 'data': {'path': nbd_sock_path}
-                             })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('nbd-server-start',
+                    addr={
+                        'type': 'unix',
+                        'data': {'path': nbd_sock_path}
+                    })
 
-        result = self.vm.qmp('drive-mirror', job_id='mirror', device='quorum0',
-                             sync='full', node_name='repair0', replaces='img1',
-                             target=quorum_repair_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', job_id='mirror', device='quorum0',
+                    sync='full', node_name='repair0', replaces='img1',
+                    target=quorum_repair_img, format=iotests.imgfmt)
 
-        result = self.vm.qmp('nbd-server-add', device='img1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('nbd-server-add', device='img1')
 
         # The full error message goes to stderr, we will check it later
         self.complete_and_wait('mirror',
@@ -1199,9 +1144,8 @@ class TestOrphanedSource(iotests.QMPTestCase):
     def test_success(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('blockdev-mirror', job_id='job', device='src',
-                             sync='full', target='dest')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-mirror', job_id='job', device='src',
+                    sync='full', target='dest')
 
         self.complete_and_wait('job')
 
@@ -1217,27 +1161,24 @@ class TestOrphanedSource(iotests.QMPTestCase):
 
         # Unshare consistent-read on the target
         # (The mirror job does not care)
-        result = self.vm.qmp('blockdev-add',
-                             driver='blkdebug',
-                             node_name='dest-perm',
-                             image='dest',
-                             unshare_child_perms=['consistent-read'])
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-mirror', job_id='job', device='src',
-                             sync='full', target='dest',
-                             filter_node_name='mirror-filter')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    driver='blkdebug',
+                    node_name='dest-perm',
+                    image='dest',
+                    unshare_child_perms=['consistent-read'])
+
+        self.vm.cmd('blockdev-mirror', job_id='job', device='src',
+                    sync='full', target='dest',
+                    filter_node_name='mirror-filter')
 
         # Require consistent-read on the source
         # (We can only add this node once the job has started, or it
         # will complain that it does not want to run on non-root nodes)
-        result = self.vm.qmp('blockdev-add',
-                             driver='blkdebug',
-                             node_name='src-perm',
-                             image='src',
-                             take_child_perms=['consistent-read'])
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    driver='blkdebug',
+                    node_name='src-perm',
+                    image='src',
+                    take_child_perms=['consistent-read'])
 
         # While completing, mirror will attempt to replace src by
         # dest, which must fail because src-perm requires
@@ -1277,26 +1218,22 @@ class TestReplaces(iotests.QMPTestCase):
         """
         Check that we can replace filter nodes.
         """
-        result = self.vm.qmp('blockdev-add', **{
-                                 'driver': 'copy-on-read',
-                                 'node-name': 'filter0',
-                                 'file': {
-                                     'driver': 'copy-on-read',
-                                     'node-name': 'filter1',
-                                     'file': {
-                                         'driver': 'null-co'
-                                     }
-                                 }
-                             })
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-add',
-                             node_name='target', driver='null-co')
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-mirror', job_id='mirror', device='filter0',
-                             target='target', sync='full', replaces='filter1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', {
+            'driver': 'copy-on-read',
+            'node-name': 'filter0',
+            'file': {
+                'driver': 'copy-on-read',
+                'node-name': 'filter1',
+                'file': {
+                    'driver': 'null-co'
+                }
+            }
+        })
+
+        self.vm.cmd('blockdev-add', node_name='target', driver='null-co')
+
+        self.vm.cmd('blockdev-mirror', job_id='mirror', device='filter0',
+                    target='target', sync='full', replaces='filter1')
 
         self.complete_and_wait('mirror')
 
@@ -1318,16 +1255,15 @@ class TestFilters(iotests.QMPTestCase):
         self.vm = iotests.VM().add_device('virtio-scsi,id=vio-scsi')
         self.vm.launch()
 
-        result = self.vm.qmp('blockdev-add', **{
-                                'node-name': 'target',
-                                'driver': iotests.imgfmt,
-                                'file': {
-                                    'driver': 'file',
-                                    'filename': target_img
-                                },
-                                'backing': None
-                            })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', {
+            'node-name': 'target',
+            'driver': iotests.imgfmt,
+            'file': {
+                'driver': 'file',
+                'filename': target_img
+            },
+            'backing': None
+        })
 
         self.filterless_chain = {
                 'node-name': 'source',
@@ -1354,19 +1290,17 @@ class TestFilters(iotests.QMPTestCase):
         os.remove(backing_img)
 
     def test_cor(self):
-        result = self.vm.qmp('blockdev-add', **{
-                                'node-name': 'filter',
-                                'driver': 'copy-on-read',
-                                'file': self.filterless_chain
-                            })
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-mirror',
-                             job_id='mirror',
-                             device='filter',
-                             target='target',
-                             sync='top')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', {
+            'node-name': 'filter',
+            'driver': 'copy-on-read',
+            'file': self.filterless_chain
+        })
+
+        self.vm.cmd('blockdev-mirror',
+                    job_id='mirror',
+                    device='filter',
+                    target='target',
+                    sync='top')
 
         self.complete_and_wait('mirror')
 
@@ -1383,23 +1317,20 @@ class TestFilters(iotests.QMPTestCase):
         assert target_map[1]['depth'] == 0
 
     def test_implicit_mirror_filter(self):
-        result = self.vm.qmp('blockdev-add', **self.filterless_chain)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', **self.filterless_chain)
 
         # We need this so we can query from above the mirror node
-        result = self.vm.qmp('device_add',
-                             driver='scsi-hd',
-                             id='virtio',
-                             bus='vio-scsi.0',
-                             drive='source')
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-mirror',
-                             job_id='mirror',
-                             device='source',
-                             target='target',
-                             sync='top')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_add',
+                    driver='scsi-hd',
+                    id='virtio',
+                    bus='vio-scsi.0',
+                    drive='source')
+
+        self.vm.cmd('blockdev-mirror',
+                    job_id='mirror',
+                    device='source',
+                    target='target',
+                    sync='top')
 
         # The mirror filter is now an implicit node, so it should be
         # invisible when querying the backing chain
@@ -1417,24 +1348,21 @@ class TestFilters(iotests.QMPTestCase):
     def test_explicit_mirror_filter(self):
         # Same test as above, but this time we give the mirror filter
         # a node-name so it will not be invisible
-        result = self.vm.qmp('blockdev-add', **self.filterless_chain)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', **self.filterless_chain)
 
         # We need this so we can query from above the mirror node
-        result = self.vm.qmp('device_add',
-                             driver='scsi-hd',
-                             id='virtio',
-                             bus='vio-scsi.0',
-                             drive='source')
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-mirror',
-                             job_id='mirror',
-                             device='source',
-                             target='target',
-                             sync='top',
-                             filter_node_name='mirror-filter')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_add',
+                    driver='scsi-hd',
+                    id='virtio',
+                    bus='vio-scsi.0',
+                    drive='source')
+
+        self.vm.cmd('blockdev-mirror',
+                    job_id='mirror',
+                    device='source',
+                    target='target',
+                    sync='top',
+                    filter_node_name='mirror-filter')
 
         # With a node-name given to it, the mirror filter should now
         # be visible
diff --git a/tests/qemu-iotests/045 b/tests/qemu-iotests/045
index 45eb239baa..a341f21cd7 100755
--- a/tests/qemu-iotests/045
+++ b/tests/qemu-iotests/045
@@ -77,8 +77,7 @@ class TestFdSets(iotests.QMPTestCase):
         self.vm.shutdown()
 
     def test_remove_fdset(self):
-        result = self.vm.qmp('remove-fd', fdset_id=2)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('remove-fd', fdset_id=2)
         result = self.vm.qmp('query-fdsets')
         self.assert_qmp(result, 'return[0]/fdset-id', 1)
         self.assert_qmp(result, 'return[1]/fdset-id', 0)
@@ -90,8 +89,7 @@ class TestFdSets(iotests.QMPTestCase):
     def test_remove_fd(self):
         result = self.vm.qmp('query-fdsets')
         fd_image3 = result['return'][0]['fds'][0]['fd']
-        result = self.vm.qmp('remove-fd', fdset_id=2, fd=fd_image3)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('remove-fd', fdset_id=2, fd=fd_image3)
         result = self.vm.qmp('query-fdsets')
         self.assert_qmp(result, 'return[0]/fdset-id', 2)
         self.assert_qmp(result, 'return[1]/fdset-id', 1)
@@ -151,8 +149,7 @@ class TestSCMFd(iotests.QMPTestCase):
 
     def test_getfd(self):
         self._send_fd_by_SCM()
-        result = self.vm.qmp('getfd', fdname='image0:r')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('getfd', fdname='image0:r')
 
     def test_getfd_invalid_fdname(self):
         self._send_fd_by_SCM()
@@ -163,10 +160,8 @@ class TestSCMFd(iotests.QMPTestCase):
 
     def test_closefd(self):
         self._send_fd_by_SCM()
-        result = self.vm.qmp('getfd', fdname='image0:r')
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('closefd', fdname='image0:r')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('getfd', fdname='image0:r')
+        self.vm.cmd('closefd', fdname='image0:r')
 
     def test_closefd_fd_not_found(self):
         fdname = 'image0:r'
diff --git a/tests/qemu-iotests/055 b/tests/qemu-iotests/055
index 5d6b607051..378f2737fd 100755
--- a/tests/qemu-iotests/055
+++ b/tests/qemu-iotests/055
@@ -69,8 +69,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0', target=target, sync='full')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0', target=target, sync='full')
 
         event = self.cancel_and_wait(resume=True)
         self.assert_qmp(event, 'data/type', 'backup')
@@ -85,9 +84,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0',
-                             target=target, sync='full')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0', target=target, sync='full')
 
         self.pause_job('drive0', wait=False)
         self.vm.resume_drive('drive0')
@@ -100,8 +97,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/offset', offset)
 
-        result = self.vm.qmp('block-job-resume', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device='drive0')
 
         self.wait_until_completed()
 
@@ -123,10 +119,9 @@ class TestSingleDrive(iotests.QMPTestCase):
             result = self.vm.qmp('block_resize', node_name=node, size=65536)
             self.assert_qmp(result, 'error/class', 'GenericError')
 
-        result = self.vm.qmp('blockdev-backup', job_id='job0', device='drive0',
-                             target='drive1', sync='full', auto_finalize=False,
-                             auto_dismiss=False)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-backup', job_id='job0', device='drive0',
+                    target='drive1', sync='full', auto_finalize=False,
+                    auto_dismiss=False)
 
         self.vm.run_job('job0', auto_finalize=False, pre_finalize=pre_finalize)
 
@@ -137,8 +132,7 @@ class TestSingleDrive(iotests.QMPTestCase):
         self.do_test_resize_blockdev_backup('drive1', 'target')
 
     def do_test_target_size(self, size):
-        result = self.vm.qmp('block_resize', device='drive1', size=size)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block_resize', device='drive1', size=size)
 
         result = self.vm.qmp('blockdev-backup', job_id='job0', device='drive0',
                              target='drive1', sync='full')
@@ -219,16 +213,14 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0', target=target, sync='full')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0', target=target, sync='full')
 
         # Default speed is 0
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
         self.assert_qmp(result, 'return[0]/speed', 0)
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=8 * 1024 * 1024)
 
         # Ensure the speed we set was accepted
         result = self.vm.qmp('query-block-jobs')
@@ -240,9 +232,8 @@ class TestSetSpeed(iotests.QMPTestCase):
 
         # Check setting speed option works
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0',
-                             target=target, sync='full', speed=4*1024*1024)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0',
+                    target=target, sync='full', speed=4*1024*1024)
 
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
@@ -267,9 +258,8 @@ class TestSetSpeed(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0',
-                             target=target, sync='full')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0',
+                    target=target, sync='full')
 
         result = self.vm.qmp('block-job-set-speed', device='drive0', speed=-1)
         self.assert_qmp(result, 'error/class', 'GenericError')
@@ -306,7 +296,7 @@ class TestSingleTransaction(iotests.QMPTestCase):
     def do_test_cancel(self, cmd, target):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('transaction', actions=[{
+        self.vm.cmd('transaction', actions=[{
                 'type': cmd,
                 'data': { 'device': 'drive0',
                           'target': target,
@@ -315,8 +305,6 @@ class TestSingleTransaction(iotests.QMPTestCase):
             }
         ])
 
-        self.assert_qmp(result, 'return', {})
-
         event = self.cancel_and_wait()
         self.assert_qmp(event, 'data/type', 'backup')
 
@@ -329,7 +317,7 @@ class TestSingleTransaction(iotests.QMPTestCase):
     def do_test_pause(self, cmd, target, image):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('transaction', actions=[{
+        self.vm.cmd('transaction', actions=[{
                 'type': cmd,
                 'data': { 'device': 'drive0',
                           'target': target,
@@ -337,12 +325,10 @@ class TestSingleTransaction(iotests.QMPTestCase):
                           'speed': 64 * 1024 },
             }
         ])
-        self.assert_qmp(result, 'return', {})
 
         self.pause_job('drive0', wait=False)
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=0)
 
         self.pause_wait('drive0')
 
@@ -353,8 +339,7 @@ class TestSingleTransaction(iotests.QMPTestCase):
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/offset', offset)
 
-        result = self.vm.qmp('block-job-resume', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device='drive0')
 
         self.wait_until_completed()
 
@@ -519,8 +504,7 @@ class TestCompressedToQcow2(iotests.QMPTestCase):
 
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp(cmd, device='drive0', sync='full', compress=True, **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0', sync='full', compress=True, **args)
 
         self.wait_until_completed()
 
@@ -545,8 +529,7 @@ class TestCompressedToQcow2(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0', sync='full', compress=True, **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0', sync='full', compress=True, **args)
 
         event = self.cancel_and_wait(resume=True)
         self.assert_qmp(event, 'data/type', 'backup')
@@ -568,8 +551,7 @@ class TestCompressedToQcow2(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
 
         self.vm.pause_drive('drive0')
-        result = self.vm.qmp(cmd, device='drive0', sync='full', compress=True, **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, device='drive0', sync='full', compress=True, **args)
 
         self.pause_job('drive0', wait=False)
         self.vm.resume_drive('drive0')
@@ -582,8 +564,7 @@ class TestCompressedToQcow2(iotests.QMPTestCase):
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/offset', offset)
 
-        result = self.vm.qmp('block-job-resume', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device='drive0')
 
         self.wait_until_completed()
 
diff --git a/tests/qemu-iotests/056 b/tests/qemu-iotests/056
index b459a3f1e8..34f08b872d 100755
--- a/tests/qemu-iotests/056
+++ b/tests/qemu-iotests/056
@@ -75,9 +75,8 @@ class TestSyncModesNoneAndTop(iotests.QMPTestCase):
 
     def test_complete_top(self):
         self.assert_no_active_block_jobs()
-        result = self.vm.qmp('drive-backup', device='drive0', sync='top',
-                             format=iotests.imgfmt, target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-backup', device='drive0', sync='top',
+                    format=iotests.imgfmt, target=target_img)
 
         self.wait_until_completed(check_offset=False)
 
@@ -89,9 +88,8 @@ class TestSyncModesNoneAndTop(iotests.QMPTestCase):
     def test_cancel_sync_none(self):
         self.assert_no_active_block_jobs()
 
-        result = self.vm.qmp('drive-backup', device='drive0',
-                             sync='none', target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-backup', device='drive0',
+                    sync='none', target=target_img)
         time.sleep(1)
         self.vm.hmp_qemu_io('drive0', 'write -P0x5e 0 512')
         self.vm.hmp_qemu_io('drive0', 'aio_flush')
@@ -115,18 +113,15 @@ class TestBeforeWriteNotifier(iotests.QMPTestCase):
 
     def test_before_write_notifier(self):
         self.vm.pause_drive("drive0")
-        result = self.vm.qmp('drive-backup', device='drive0',
-                             sync='full', target=target_img,
-                             format="file", speed=1)
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('block-job-pause', device="drive0")
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-backup', device='drive0',
+                    sync='full', target=target_img,
+                    format="file", speed=1)
+        self.vm.cmd('block-job-pause', device="drive0")
         # Speed is low enough that this must be an uncopied range, which will
         # trigger the before write notifier
         self.vm.hmp_qemu_io('drive0', 'aio_write -P 1 512512 512')
         self.vm.resume_drive("drive0")
-        result = self.vm.qmp('block-job-resume', device="drive0")
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-resume', device="drive0")
         event = self.cancel_and_wait()
         self.assert_qmp(event, 'data/type', 'backup')
 
diff --git a/tests/qemu-iotests/093 b/tests/qemu-iotests/093
index 93274dc8cb..bf7763c8f6 100755
--- a/tests/qemu-iotests/093
+++ b/tests/qemu-iotests/093
@@ -55,8 +55,7 @@ class ThrottleTestCase(iotests.QMPTestCase):
         # Set the I/O throttling parameters to all drives
         for i in range(0, ndrives):
             params['device'] = 'drive%d' % i
-            result = self.vm.qmp("block_set_io_throttle", conv_keys=False, **params)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd("block_set_io_throttle", conv_keys=False, **params)
 
     def do_test_throttle(self, ndrives, seconds, params, first_drive = 0):
         def check_limit(limit, num):
@@ -253,8 +252,7 @@ class ThrottleTestCase(iotests.QMPTestCase):
         # drive1 remains in the group with a throttled request.
         params['bps_rd'] = 0
         params['device'] = 'drive0'
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False, **params)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("block_set_io_throttle", conv_keys=False, **params)
 
         # Removing the I/O limits from drive0 drains its two pending requests.
         # The read request in drive1 is still throttled.
@@ -286,8 +284,7 @@ class ThrottleTestGroupNames(iotests.QMPTestCase):
 
     def set_io_throttle(self, device, params):
         params["device"] = device
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False, **params)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("block_set_io_throttle", conv_keys=False, **params)
 
     def verify_name(self, device, name):
         result = self.vm.qmp("query-block")
@@ -379,23 +376,18 @@ class ThrottleTestRemovableMedia(iotests.QMPTestCase):
 
     def test_removable_media(self):
         # Add a couple of dummy nodes named cd0 and cd1
-        result = self.vm.qmp("blockdev-add", driver="null-co",
-                             read_zeroes=True, node_name="cd0")
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp("blockdev-add", driver="null-co",
-                             read_zeroes=True, node_name="cd1")
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("blockdev-add", driver="null-co",
+                    read_zeroes=True, node_name="cd0")
+        self.vm.cmd("blockdev-add", driver="null-co",
+                    read_zeroes=True, node_name="cd1")
 
         # Attach a CD drive with cd0 inserted
-        result = self.vm.qmp("device_add", driver="scsi-cd",
-                             id="dev0", drive="cd0")
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("device_add", driver="scsi-cd", id="dev0", drive="cd0")
 
         # Set I/O limits
         args = { "id": "dev0", "iops": 100, "iops_rd": 0, "iops_wr": 0,
                                 "bps":  50,  "bps_rd": 0,  "bps_wr": 0 }
-        result = self.vm.qmp("block_set_io_throttle", conv_keys=False, **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("block_set_io_throttle", conv_keys=False, **args)
 
         # Check that the I/O limits have been set
         result = self.vm.qmp("query-block")
@@ -403,12 +395,9 @@ class ThrottleTestRemovableMedia(iotests.QMPTestCase):
         self.assert_qmp(result, 'return[0]/inserted/bps',   50)
 
         # Now eject cd0 and insert cd1
-        result = self.vm.qmp("blockdev-open-tray", id='dev0')
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp("blockdev-remove-medium", id='dev0')
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp("blockdev-insert-medium", id='dev0', node_name='cd1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("blockdev-open-tray", id='dev0')
+        self.vm.cmd("blockdev-remove-medium", id='dev0')
+        self.vm.cmd("blockdev-insert-medium", id='dev0', node_name='cd1')
 
         # Check that the I/O limits are still the same
         result = self.vm.qmp("query-block")
@@ -416,16 +405,14 @@ class ThrottleTestRemovableMedia(iotests.QMPTestCase):
         self.assert_qmp(result, 'return[0]/inserted/bps',   50)
 
         # Eject cd1
-        result = self.vm.qmp("blockdev-remove-medium", id='dev0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("blockdev-remove-medium", id='dev0')
 
         # Check that we can't set limits if the device has no medium
         result = self.vm.qmp("block_set_io_throttle", conv_keys=False, **args)
         self.assert_qmp(result, 'error/class', 'GenericError')
 
         # Remove the CD drive
-        result = self.vm.qmp("device_del", id='dev0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("device_del", id='dev0')
 
 
 if __name__ == '__main__':
diff --git a/tests/qemu-iotests/118 b/tests/qemu-iotests/118
index cae52ffa5e..3a232fcb27 100755
--- a/tests/qemu-iotests/118
+++ b/tests/qemu-iotests/118
@@ -74,11 +74,9 @@ class ChangeBaseClass(iotests.QMPTestCase):
 class GeneralChangeTestsBaseClass(ChangeBaseClass):
 
     def test_blockdev_change_medium(self):
-        result = self.vm.qmp('blockdev-change-medium',
-                             id=self.device_name, filename=new_img,
-                             format=iotests.imgfmt)
-
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium',
+                    id=self.device_name, filename=new_img,
+                    format=iotests.imgfmt)
 
         self.wait_for_open()
         self.wait_for_close()
@@ -89,8 +87,7 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
 
     def test_eject(self):
-        result = self.vm.qmp('eject', id=self.device_name, force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('eject', id=self.device_name, force=True)
 
         self.wait_for_open()
 
@@ -100,8 +97,7 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
     def test_tray_eject_change(self):
-        result = self.vm.qmp('eject', id=self.device_name, force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('eject', id=self.device_name, force=True)
 
         self.wait_for_open()
 
@@ -110,9 +106,8 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
             self.assert_qmp(result, 'return[0]/tray_open', True)
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
-        result = self.vm.qmp('blockdev-change-medium', id=self.device_name,
-                             filename=new_img, format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium', id=self.device_name,
+                    filename=new_img, format=iotests.imgfmt)
 
         self.wait_for_close()
 
@@ -122,9 +117,8 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
 
     def test_tray_open_close(self):
-        result = self.vm.qmp('blockdev-open-tray',
-                             id=self.device_name, force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-open-tray',
+                    id=self.device_name, force=True)
 
         self.wait_for_open()
 
@@ -136,8 +130,7 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         else:
             self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-close-tray', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-close-tray', id=self.device_name)
 
         if self.has_real_tray or not self.was_empty:
             self.wait_for_close()
@@ -151,8 +144,7 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
             self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
     def test_tray_eject_close(self):
-        result = self.vm.qmp('eject', id=self.device_name, force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('eject', id=self.device_name, force=True)
 
         self.wait_for_open()
 
@@ -161,8 +153,7 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
             self.assert_qmp(result, 'return[0]/tray_open', True)
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
-        result = self.vm.qmp('blockdev-close-tray', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-close-tray', id=self.device_name)
 
         self.wait_for_close()
 
@@ -172,9 +163,7 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
     def test_tray_open_change(self):
-        result = self.vm.qmp('blockdev-open-tray', id=self.device_name,
-                                                   force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-open-tray', id=self.device_name, force=True)
 
         self.wait_for_open()
 
@@ -186,10 +175,8 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         else:
             self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium', id=self.device_name,
-                                                       filename=new_img,
-                                                       format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium', id=self.device_name,
+                    filename=new_img, format=iotests.imgfmt)
 
         self.wait_for_close()
 
@@ -199,17 +186,14 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
 
     def test_cycle(self, read_only_node=False):
-        result = self.vm.qmp('blockdev-add',
-                             node_name='new',
-                             driver=iotests.imgfmt,
-                             read_only=read_only_node,
-                             file={'filename': new_img,
-                                    'driver': 'file'})
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('blockdev-open-tray',
-                             id=self.device_name, force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    node_name='new',
+                    driver=iotests.imgfmt,
+                    read_only=read_only_node,
+                    file={'filename': new_img,
+                          'driver': 'file'})
+
+        self.vm.cmd('blockdev-open-tray', id=self.device_name, force=True)
 
         self.wait_for_open()
 
@@ -221,26 +205,22 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         else:
             self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-remove-medium',
-                             id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-remove-medium', id=self.device_name)
 
         result = self.vm.qmp('query-block')
         if self.has_real_tray:
             self.assert_qmp(result, 'return[0]/tray_open', True)
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
-        result = self.vm.qmp('blockdev-insert-medium',
-                             id=self.device_name, node_name='new')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-insert-medium',
+                    id=self.device_name, node_name='new')
 
         result = self.vm.qmp('query-block')
         if self.has_real_tray:
             self.assert_qmp(result, 'return[0]/tray_open', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
 
-        result = self.vm.qmp('blockdev-close-tray', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-close-tray', id=self.device_name)
 
         self.wait_for_close()
 
@@ -253,9 +233,8 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         self.test_cycle(True)
 
     def test_close_on_closed(self):
-        result = self.vm.qmp('blockdev-close-tray', id=self.device_name)
         # Should be a no-op
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-close-tray', id=self.device_name)
         self.assertEqual(self.vm.get_qmp_events(wait=False), [])
 
     def test_remove_on_closed(self):
@@ -269,12 +248,11 @@ class GeneralChangeTestsBaseClass(ChangeBaseClass):
         if not self.has_real_tray:
             return
 
-        result = self.vm.qmp('blockdev-add',
-                             node_name='new',
-                             driver=iotests.imgfmt,
-                             file={'filename': new_img,
-                                   'driver': 'file'})
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    node_name='new',
+                    driver=iotests.imgfmt,
+                    file={'filename': new_img,
+                          'driver': 'file'})
 
         result = self.vm.qmp('blockdev-insert-medium', id=self.device_name,
                                                        node_name='new')
@@ -307,15 +285,13 @@ class TestInitiallyFilled(GeneralChangeTestsBaseClass):
         os.remove(new_img)
 
     def test_insert_on_filled(self):
-        result = self.vm.qmp('blockdev-add',
-                             node_name='new',
-                             driver=iotests.imgfmt,
-                             file={'filename': new_img,
-                                   'driver': 'file'})
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    node_name='new',
+                    driver=iotests.imgfmt,
+                    file={'filename': new_img,
+                          'driver': 'file'})
 
-        result = self.vm.qmp('blockdev-open-tray', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-open-tray', id=self.device_name)
 
         self.wait_for_open()
 
@@ -344,14 +320,12 @@ class TestInitiallyEmpty(GeneralChangeTestsBaseClass):
         os.remove(new_img)
 
     def test_remove_on_empty(self):
-        result = self.vm.qmp('blockdev-open-tray', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-open-tray', id=self.device_name)
 
         self.wait_for_open()
 
-        result = self.vm.qmp('blockdev-remove-medium', id=self.device_name)
         # Should be a no-op
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-remove-medium', id=self.device_name)
 
 # Do this in a function to avoid leaking variables like case into the global
 # name space (otherwise tests would be run for the abstract base classes)
@@ -399,11 +373,10 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium', id=self.device_name,
-                                                       filename=new_img,
-                                                       format=iotests.imgfmt,
-                                                       read_only_mode='retain')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium', id=self.device_name,
+                    filename=new_img,
+                    format=iotests.imgfmt,
+                    read_only_mode='retain')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
@@ -419,11 +392,10 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium', id=self.device_name,
-                                                       filename=new_img,
-                                                       format=iotests.imgfmt,
-                                                       read_only_mode='retain')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium', id=self.device_name,
+                    filename=new_img,
+                    format=iotests.imgfmt,
+                    read_only_mode='retain')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
@@ -462,12 +434,11 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium',
-                             id=self.device_name,
-                             filename=new_img,
-                             format=iotests.imgfmt,
-                             read_only_mode='read-write')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium',
+                    id=self.device_name,
+                    filename=new_img,
+                    format=iotests.imgfmt,
+                    read_only_mode='read-write')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', False)
@@ -483,12 +454,11 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', False)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium',
-                             id=self.device_name,
-                             filename=new_img,
-                             format=iotests.imgfmt,
-                             read_only_mode='read-only')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium',
+                    id=self.device_name,
+                    filename=new_img,
+                    format=iotests.imgfmt,
+                    read_only_mode='read-only')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
@@ -503,12 +473,11 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', False)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium',
-                             id=self.device_name,
-                             filename=new_img,
-                             format=iotests.imgfmt,
-                             read_only_mode='read-only')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium',
+                    id=self.device_name,
+                    filename=new_img,
+                    format=iotests.imgfmt,
+                    read_only_mode='read-only')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
@@ -546,11 +515,10 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-change-medium', id=self.device_name,
-                                                       filename=new_img,
-                                                       format=iotests.imgfmt,
-                                                       read_only_mode='retain')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-change-medium', id=self.device_name,
+                    filename=new_img,
+                    format=iotests.imgfmt,
+                    read_only_mode='retain')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
@@ -587,27 +555,24 @@ class TestChangeReadOnly(ChangeBaseClass):
         self.assert_qmp(result, 'return[0]/inserted/ro', False)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-add',
-                             node_name='new',
-                             driver=iotests.imgfmt,
-                             read_only=True,
-                             file={'filename': new_img,
-                                    'driver': 'file'})
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    node_name='new',
+                    driver=iotests.imgfmt,
+                    read_only=True,
+                    file={'filename': new_img,
+                          'driver': 'file'})
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', False)
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
 
-        result = self.vm.qmp('blockdev-remove-medium', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-remove-medium', id=self.device_name)
 
         result = self.vm.qmp('query-block')
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
-        result = self.vm.qmp('blockdev-insert-medium', id=self.device_name,
-                                                       node_name='new')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-insert-medium', id=self.device_name,
+                    node_name='new')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/ro', True)
@@ -638,22 +603,19 @@ class TestBlockJobsAfterCycle(ChangeBaseClass):
 
         # For device-less BBs, calling blockdev-open-tray or blockdev-close-tray
         # is not necessary
-        result = self.vm.qmp('blockdev-remove-medium', id=self.device_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-remove-medium', id=self.device_name)
 
         result = self.vm.qmp('query-block')
         self.assert_qmp_absent(result, 'return[0]/inserted')
 
-        result = self.vm.qmp('blockdev-add',
-                             node_name='node0',
-                             driver=iotests.imgfmt,
-                             file={'filename': old_img,
-                                   'driver': 'file'})
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    node_name='node0',
+                    driver=iotests.imgfmt,
+                    file={'filename': old_img,
+                          'driver': 'file'})
 
-        result = self.vm.qmp('blockdev-insert-medium', id=self.device_name,
-                                                       node_name='node0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-insert-medium', id=self.device_name,
+                    node_name='node0')
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/image/filename', old_img)
@@ -670,10 +632,9 @@ class TestBlockJobsAfterCycle(ChangeBaseClass):
     @iotests.skip_for_formats(('vpc', 'parallels', 'qcow', 'vdi', 'vmdk', 'raw',
                                'vhdx'))
     def test_snapshot_and_commit(self):
-        result = self.vm.qmp('blockdev-snapshot-sync', device='drive0',
-                                                       snapshot_file=new_img,
-                                                       format=iotests.imgfmt)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-snapshot-sync', device='drive0',
+                    snapshot_file=new_img,
+                    format=iotests.imgfmt)
 
         result = self.vm.qmp('query-block')
         self.assert_qmp(result, 'return[0]/inserted/image/filename', new_img)
@@ -681,16 +642,14 @@ class TestBlockJobsAfterCycle(ChangeBaseClass):
                         'return[0]/inserted/image/backing-image/filename',
                         old_img)
 
-        result = self.vm.qmp('block-commit', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='drive0')
 
         self.vm.event_wait(name='BLOCK_JOB_READY')
 
         result = self.vm.qmp('query-block-jobs')
         self.assert_qmp(result, 'return[0]/device', 'drive0')
 
-        result = self.vm.qmp('block-job-complete', device='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-complete', device='drive0')
 
         self.vm.event_wait(name='BLOCK_JOB_COMPLETED')
 
diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 845ab5303c..3f3febd1fc 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -201,9 +201,8 @@ class TestIncrementalBackupBase(iotests.QMPTestCase):
     def add_bitmap(self, name, drive, **kwargs):
         bitmap = Bitmap(name, drive)
         self.bitmaps.append(bitmap)
-        result = self.vm.qmp('block-dirty-bitmap-add', node=drive['id'],
-                             name=bitmap.name, **kwargs)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-dirty-bitmap-add', node=drive['id'],
+                    name=bitmap.name, **kwargs)
         return bitmap
 
 
@@ -388,13 +387,12 @@ class TestIncrementalBackup(TestIncrementalBackupBase):
                                           ('0x64', '32736k', '64k')))
         bitmap1 = self.add_bitmap('bitmap1', drive0)
 
-        result = self.vm.qmp('transaction', actions=[
+        self.vm.cmd('transaction', actions=[
             transaction_bitmap_clear(bitmap0.drive['id'], bitmap0.name),
             transaction_bitmap_clear(bitmap1.drive['id'], bitmap1.name),
             transaction_drive_backup(drive0['id'], drive0['backup'],
                                      sync='full', format=drive0['fmt'])
         ])
-        self.assert_qmp(result, 'return', {})
         self.wait_until_completed(drive0['id'])
         self.files.append(drive0['backup'])
 
@@ -417,7 +415,7 @@ class TestIncrementalBackup(TestIncrementalBackupBase):
                                            ('0xcd', '32M', '124k')))
 
         # Create a blkdebug interface to this img as 'drive1'
-        result = self.vm.qmp('blockdev-add',
+        self.vm.cmd('blockdev-add',
             node_name=drive1['id'],
             driver=drive1['fmt'],
             file={
@@ -440,7 +438,6 @@ class TestIncrementalBackup(TestIncrementalBackupBase):
                 }],
             }
         )
-        self.assert_qmp(result, 'return', {})
 
         # Create bitmaps and full backups for both drives
         drive0 = self.drives[0]
@@ -475,9 +472,8 @@ class TestIncrementalBackup(TestIncrementalBackupBase):
                                      format=drive1['fmt'], mode='existing',
                                      bitmap=dr1bm0.name)
         ]
-        result = self.vm.qmp('transaction', actions=transaction,
-                             properties={'completion-mode': 'grouped'} )
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('transaction', actions=transaction,
+                    properties={'completion-mode': 'grouped'} )
 
         # Observe that drive0's backup is cancelled and drive1 completes with
         # an error.
@@ -504,9 +500,8 @@ class TestIncrementalBackup(TestIncrementalBackupBase):
         target1 = self.prepare_backup(dr1bm0)
 
         # Re-run the exact same transaction.
-        result = self.vm.qmp('transaction', actions=transaction,
-                             properties={'completion-mode':'grouped'})
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('transaction', actions=transaction,
+                    properties={'completion-mode':'grouped'})
 
         # Both should complete successfully this time.
         self.assertTrue(self.wait_qmp_backup(drive0['id']))
@@ -617,7 +612,7 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
         '''
 
         drive0 = self.drives[0]
-        result = self.vm.qmp('blockdev-add',
+        self.vm.cmd('blockdev-add',
             node_name=drive0['id'],
             driver=drive0['fmt'],
             file={
@@ -640,7 +635,6 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
                 }],
             }
         )
-        self.assert_qmp(result, 'return', {})
 
         self.create_anchor_backup(drive0)
         self.add_bitmap('bitmap0', drive0)
@@ -668,29 +662,28 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
         drive0 = self.drives[0]
         # NB: The blkdebug script here looks for a "flush, read" pattern.
         # The flush occurs in hmp_io_writes, and the read during the block job.
-        result = self.vm.qmp('blockdev-add',
-                             node_name=drive0['id'],
-                             driver=drive0['fmt'],
-                             file={
-                                 'driver': 'blkdebug',
-                                 'image': {
-                                     'driver': 'file',
-                                     'filename': drive0['file']
-                                 },
-                                 'set-state': [{
-                                     'event': 'flush_to_disk',
-                                     'state': 1,
-                                     'new_state': 2
-                                 }],
-                                 'inject-error': [{
-                                     'event': 'read_aio',
-                                     'errno': 5,
-                                     'state': 2,
-                                     'immediately': False,
-                                     'once': True
-                                 }],
-                             })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add',
+                    node_name=drive0['id'],
+                    driver=drive0['fmt'],
+                    file={
+                        'driver': 'blkdebug',
+                        'image': {
+                            'driver': 'file',
+                            'filename': drive0['file']
+                        },
+                        'set-state': [{
+                            'event': 'flush_to_disk',
+                            'state': 1,
+                            'new_state': 2
+                        }],
+                        'inject-error': [{
+                            'event': 'read_aio',
+                            'errno': 5,
+                            'state': 2,
+                            'immediately': False,
+                            'once': True
+                        }],
+                    })
         self.create_anchor_backup(drive0)
         bitmap = self.add_bitmap('bitmap0', drive0)
 
diff --git a/tests/qemu-iotests/129 b/tests/qemu-iotests/129
index c75ec62ecf..cc39f2b6ed 100755
--- a/tests/qemu-iotests/129
+++ b/tests/qemu-iotests/129
@@ -55,11 +55,9 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
     def do_test_stop(self, cmd, **args):
         """Test 'stop' while block job is running on a throttled drive.
         The 'stop' command shouldn't drain the job"""
-        result = self.vm.qmp(cmd, **args)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd(cmd, **args)
 
-        result = self.vm.qmp("stop")
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd("stop")
         result = self.vm.qmp("query-block-jobs")
 
         self.assert_qmp(result, 'return[0]/status', 'running')
@@ -87,7 +85,7 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
         iotests.qemu_img('create', '-f', iotests.imgfmt, self.overlay_img,
                          '1G')
 
-        result = self.vm.qmp('blockdev-add', **{
+        self.vm.cmd('blockdev-add', {
             'node-name': 'overlay',
             'driver': iotests.imgfmt,
             'file': {
@@ -95,11 +93,8 @@ class TestStopWithBlockJob(iotests.QMPTestCase):
                 'filename': self.overlay_img
             }
         })
-        self.assert_qmp(result, 'return', {})
 
-        result = self.vm.qmp('blockdev-snapshot',
-                             node='source', overlay='overlay')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-snapshot', node='source', overlay='overlay')
 
         self.do_test_stop('block-commit', device='drive0', top_node='source')
 
diff --git a/tests/qemu-iotests/132 b/tests/qemu-iotests/132
index 367ea08036..12a64b3d95 100755
--- a/tests/qemu-iotests/132
+++ b/tests/qemu-iotests/132
@@ -47,9 +47,8 @@ class TestSingleDrive(iotests.QMPTestCase):
             pass
 
     def test_mirror_discard(self):
-        result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
-                             target=target_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', device='drive0', sync='full',
+                    target=target_img)
         self.vm.hmp_qemu_io('drive0', 'discard 0 64k')
         self.complete_and_wait('drive0')
         self.vm.shutdown()
diff --git a/tests/qemu-iotests/139 b/tests/qemu-iotests/139
index 178b1ee230..9fea38adff 100755
--- a/tests/qemu-iotests/139
+++ b/tests/qemu-iotests/139
@@ -58,8 +58,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
                 'file': {'driver': 'file',
                          'node-name': file_node,
                          'filename': base_img}}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         self.checkBlockDriverState(node)
         self.checkBlockDriverState(file_node)
 
@@ -73,8 +72,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
                 'backing': None,
                 'file': {'driver': 'file',
                          'filename': new_img}}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         self.checkBlockDriverState(node)
 
     # Delete a BlockDriverState
@@ -89,17 +87,14 @@ class TestBlockdevDel(iotests.QMPTestCase):
 
     # Add a device model
     def addDeviceModel(self, device, backend, driver = 'virtio-blk'):
-        result = self.vm.qmp('device_add', id = device,
-                             driver = driver, drive = backend)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_add', id = device,
+                    driver = driver, drive = backend)
 
     # Delete a device model
     def delDeviceModel(self, device, is_virtio_blk = True):
-        result = self.vm.qmp('device_del', id = device)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_del', id = device)
 
-        result = self.vm.qmp('system_reset')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('system_reset')
 
         if is_virtio_blk:
             device_path = '/machine/peripheral/%s/virtio-backend' % device
@@ -126,9 +121,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
     # Insert a BlockDriverState
     def insertDrive(self, device, node):
         self.checkBlockDriverState(node)
-        result = self.vm.qmp('blockdev-insert-medium',
-                             id = device, node_name = node)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-insert-medium', id = device, node_name = node)
         self.checkBlockDriverState(node)
 
     # Create a snapshot using 'blockdev-snapshot-sync'
@@ -139,8 +132,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
                 'snapshot-file': new_img,
                 'snapshot-node-name': overlay,
                 'format': iotests.imgfmt}
-        result = self.vm.qmp('blockdev-snapshot-sync', conv_keys=False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-snapshot-sync', conv_keys=False, **opts)
         self.checkBlockDriverState(node)
         self.checkBlockDriverState(overlay)
 
@@ -148,9 +140,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
     def createSnapshot(self, node, overlay):
         self.checkBlockDriverState(node)
         self.checkBlockDriverState(overlay)
-        result = self.vm.qmp('blockdev-snapshot',
-                             node = node, overlay = overlay)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-snapshot', node = node, overlay = overlay)
         self.checkBlockDriverState(node)
         self.checkBlockDriverState(overlay)
 
@@ -163,14 +153,12 @@ class TestBlockdevDel(iotests.QMPTestCase):
                 'node-name': new_node,
                 'sync': 'top',
                 'format': iotests.imgfmt}
-        result = self.vm.qmp('drive-mirror', conv_keys=False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('drive-mirror', conv_keys=False, **opts)
         self.checkBlockDriverState(new_node)
 
     # Complete an existing block job
     def completeBlockJob(self, id, node_before, node_after):
-        result = self.vm.qmp('block-job-complete', device=id)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-complete', device=id)
         self.wait_until_completed(id)
 
     # Add a BlkDebug node
@@ -186,8 +174,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
         opts = {'driver': 'blkdebug',
                 'node-name': debug,
                 'image': image}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         self.checkBlockDriverState(node)
         self.checkBlockDriverState(debug)
 
@@ -211,8 +198,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
                 'node-name': blkverify,
                 'test': node_0,
                 'raw': node_1}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         self.checkBlockDriverState(test)
         self.checkBlockDriverState(raw)
         self.checkBlockDriverState(blkverify)
@@ -235,8 +221,7 @@ class TestBlockdevDel(iotests.QMPTestCase):
                 'node-name': quorum,
                 'vote-threshold': 1,
                 'children': [ child_0, child_1 ]}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         self.checkBlockDriverState(child0)
         self.checkBlockDriverState(child1)
         self.checkBlockDriverState(quorum)
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 47dfa62e6b..8c5e08bf2b 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -58,8 +58,7 @@ class NBDBlockdevAddBase(iotests.QMPTestCase):
     def client_test(self, filename, address, export=None,
                     node_name='nbd-blockdev', delete=True):
         bao = self.blockdev_add_options(address, export, node_name)
-        result = self.vm.qmp('blockdev-add', **bao)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', **bao)
 
         found = False
         result = self.vm.qmp('query-named-block-nodes')
@@ -75,8 +74,7 @@ class NBDBlockdevAddBase(iotests.QMPTestCase):
         self.assertTrue(found)
 
         if delete:
-            result = self.vm.qmp('blockdev-del', node_name=node_name)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-del', node_name=node_name)
 
 
 class QemuNBD(NBDBlockdevAddBase):
@@ -158,16 +156,14 @@ class BuiltinNBD(NBDBlockdevAddBase):
         self.assert_qmp(result, 'return', {})
 
         if export_name is None:
-            result = self.server.qmp('nbd-server-add', device='nbd-export')
+            self.server.cmd('nbd-server-add', device='nbd-export')
         else:
-            result = self.server.qmp('nbd-server-add', device='nbd-export',
-                                     name=export_name)
-        self.assert_qmp(result, 'return', {})
+            self.server.cmd('nbd-server-add', device='nbd-export',
+                            name=export_name)
 
         if export_name2 is not None:
-            result = self.server.qmp('nbd-server-add', device='nbd-export',
-                                     name=export_name2)
-            self.assert_qmp(result, 'return', {})
+            self.server.cmd('nbd-server-add', device='nbd-export',
+                            name=export_name2)
 
         return True
 
@@ -175,8 +171,7 @@ class BuiltinNBD(NBDBlockdevAddBase):
         self.assertTrue(self._try_server_up(address, export_name, export_name2))
 
     def _server_down(self):
-        result = self.server.qmp('nbd-server-stop')
-        self.assert_qmp(result, 'return', {})
+        self.server.cmd('nbd-server-stop')
 
     def do_test_inet(self, export_name=None):
         while True:
@@ -218,10 +213,8 @@ class BuiltinNBD(NBDBlockdevAddBase):
                          flatten_sock_addr(address), 'exp1', 'node1', False)
         self.client_test('nbd://localhost:%i/%s' % (nbd_port, 'exp2'),
                          flatten_sock_addr(address), 'exp2', 'node2', False)
-        result = self.vm.qmp('blockdev-del', node_name='node1')
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('blockdev-del', node_name='node2')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', node_name='node1')
+        self.vm.cmd('blockdev-del', node_name='node2')
         self._server_down()
 
     def test_inet6(self):
@@ -272,8 +265,7 @@ class BuiltinNBD(NBDBlockdevAddBase):
         result = self.vm.send_fd_scm(fd=sockfd.fileno())
         self.assertEqual(result, 0, 'Failed to send socket FD')
 
-        result = self.vm.qmp('getfd', fdname='nbd-fifo')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('getfd', fdname='nbd-fifo')
 
         address = { 'type': 'fd',
                     'data': { 'str': 'nbd-fifo' } }
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 93d14193d0..26154d3d0c 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -75,14 +75,13 @@ class TestActiveMirror(iotests.QMPTestCase):
             self.vm.hmp_qemu_io('source', 'aio_write -z %i 1M' % offset)
 
         # Start the block job
-        result = self.vm.qmp('blockdev-mirror',
-                             job_id='mirror',
-                             filter_node_name='mirror-node',
-                             device='source-node',
-                             target='target-node',
-                             sync='full',
-                             copy_mode='write-blocking')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-mirror',
+                    job_id='mirror',
+                    filter_node_name='mirror-node',
+                    device='source-node',
+                    target='target-node',
+                    sync='full',
+                    copy_mode='write-blocking')
 
         # Start some more requests
         for offset in range(3 * self.image_len // 8, 5 * self.image_len // 8, 1024 * 1024):
@@ -121,23 +120,21 @@ class TestActiveMirror(iotests.QMPTestCase):
         result = self.vm.hmp_qemu_io('source', 'write -P 1 0 2M')
 
         # Start the block job (very slowly)
-        result = self.vm.qmp('blockdev-mirror',
-                             job_id='mirror',
-                             filter_node_name='mirror-node',
-                             device='source-node',
-                             target='target-node',
-                             sync='full',
-                             copy_mode='write-blocking',
-                             buf_size=(1048576 // 4),
-                             speed=1)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-mirror',
+                    job_id='mirror',
+                    filter_node_name='mirror-node',
+                    device='source-node',
+                    target='target-node',
+                    sync='full',
+                    copy_mode='write-blocking',
+                    buf_size=(1048576 // 4),
+                    speed=1)
 
         # Start an unaligned request to a dirty area
         result = self.vm.hmp_qemu_io('source', 'write -P 2 %i 1' % (1048576 + 42))
 
         # Let the job finish
-        result = self.vm.qmp('block-job-set-speed', device='mirror', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='mirror', speed=0)
         self.complete_and_wait(drive='mirror')
 
         self.potential_writes_in_flight = False
@@ -185,8 +182,7 @@ class TestActiveMirror(iotests.QMPTestCase):
         # After resuming 4, one of 2 and 3 goes first and set in_flight_bitmap,
         # so the other will wait for it.
 
-        result = self.vm.qmp('block-job-set-speed', device='mirror', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='mirror', speed=0)
         self.complete_and_wait(drive='mirror')
 
         self.potential_writes_in_flight = False
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index eadda52615..6b1625b8f3 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -110,8 +110,7 @@ class BaseClass(iotests.QMPTestCase):
                 elif self.target_blockdev_backing:
                         options['backing'] = self.target_blockdev_backing
 
-                result = self.vm.qmp('blockdev-add', **options)
-                self.assert_qmp(result, 'return', {})
+                self.vm.cmd('blockdev-add', **options)
 
     def tearDown(self):
         self.vm.shutdown()
@@ -178,20 +177,18 @@ class MirrorBaseClass(BaseClass):
 
     def runMirror(self, sync):
         if self.cmd == 'blockdev-mirror':
-            result = self.vm.qmp(self.cmd, job_id='mirror-job', device='source',
-                                 sync=sync, target='target',
-                                 auto_finalize=False)
+            self.vm.cmd(self.cmd, job_id='mirror-job', device='source',
+                        sync=sync, target='target',
+                        auto_finalize=False)
         else:
             if self.existing:
                 mode = 'existing'
             else:
                 mode = 'absolute-paths'
-            result = self.vm.qmp(self.cmd, job_id='mirror-job', device='source',
-                                 sync=sync, target=target_img,
-                                 format=iotests.imgfmt, mode=mode,
-                                 node_name='target', auto_finalize=False)
-
-        self.assert_qmp(result, 'return', {})
+            self.vm.cmd(self.cmd, job_id='mirror-job', device='source',
+                        sync=sync, target=target_img,
+                        format=iotests.imgfmt, mode=mode,
+                        node_name='target', auto_finalize=False)
 
         self.vm.run_job('mirror-job', auto_finalize=False,
                         pre_finalize=self.openBacking, auto_dismiss=True)
@@ -258,16 +255,14 @@ class TestBlockdevMirrorReopen(MirrorBaseClass):
 
     def openBacking(self):
         if not self.target_open_with_backing:
-            result = self.vm.qmp('blockdev-add', node_name="backing",
-                                 driver="null-co")
-            self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('blockdev-reopen', options=[{
-                                     'node-name': "target",
-                                     'driver': iotests.imgfmt,
-                                     'file': "target-file",
-                                     'backing': "backing"
-                                 }])
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add', node_name="backing",
+                        driver="null-co")
+            self.vm.cmd('blockdev-reopen', options=[{
+                'node-name': "target",
+                'driver': iotests.imgfmt,
+                'file': "target-file",
+                'backing': "backing"
+            }])
 
 class TestBlockdevMirrorReopenIothread(TestBlockdevMirrorReopen):
     use_iothread = True
@@ -281,12 +276,8 @@ class TestBlockdevMirrorSnapshot(MirrorBaseClass):
 
     def openBacking(self):
         if not self.target_open_with_backing:
-            result = self.vm.qmp('blockdev-add', node_name="backing",
-                                 driver="null-co")
-            self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp('blockdev-snapshot', node="backing",
-                                 overlay="target")
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add', node_name="backing", driver="null-co")
+            self.vm.cmd('blockdev-snapshot', node="backing", overlay="target")
 
 class TestBlockdevMirrorSnapshotIothread(TestBlockdevMirrorSnapshot):
     use_iothread = True
@@ -295,14 +286,12 @@ class TestCommit(BaseClass):
     existing = False
 
     def testCommit(self):
-        result = self.vm.qmp('block-commit', job_id='commit-job',
-                             device='source', base=back1_img)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', job_id='commit-job',
+                    device='source', base=back1_img)
 
         self.vm.event_wait('BLOCK_JOB_READY')
 
-        result = self.vm.qmp('block-job-complete', device='commit-job')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-complete', device='commit-job')
 
         self.vm.event_wait('BLOCK_JOB_COMPLETED')
 
diff --git a/tests/qemu-iotests/165 b/tests/qemu-iotests/165
index e3ef28e2ee..028c6a15ca 100755
--- a/tests/qemu-iotests/165
+++ b/tests/qemu-iotests/165
@@ -116,9 +116,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         sha256_2 = self.getSha256()
         assert sha256_1 != sha256_2 # Otherwise, it's not very interesting.
 
-        result = self.vm.qmp('block-dirty-bitmap-clear', node='drive0',
-                             name='bitmap0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-dirty-bitmap-clear', node='drive0', name='bitmap0')
 
         # Start with regions1
 
@@ -137,7 +135,7 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
         assert sha256_1 == self.getSha256()
 
         # Reopen to RW
-        result = self.vm.qmp('blockdev-reopen', options=[{
+        self.vm.cmd('blockdev-reopen', options=[{
             'node-name': 'node0',
             'driver': iotests.imgfmt,
             'file': {
@@ -146,7 +144,6 @@ class TestPersistentDirtyBitmap(iotests.QMPTestCase):
             },
             'read-only': False
         }])
-        self.assert_qmp(result, 'return', {})
 
         # Check that bitmap is reopened to RW and we can write to it.
         self.writeRegions(regions2)
diff --git a/tests/qemu-iotests/196 b/tests/qemu-iotests/196
index 76509a5ad1..e5105b1354 100755
--- a/tests/qemu-iotests/196
+++ b/tests/qemu-iotests/196
@@ -45,8 +45,7 @@ class TestInvalidateAutoclear(iotests.QMPTestCase):
         self.vm_b.add_incoming("exec: cat '" + migfile + "'")
 
     def test_migration(self):
-        result = self.vm_a.qmp('migrate', uri='exec:cat>' + migfile)
-        self.assert_qmp(result, 'return', {});
+        self.vm_a.cmd('migrate', uri='exec:cat>' + migfile)
         self.assertNotEqual(self.vm_a.event_wait("STOP"), None)
 
         with open(disk, 'r+b') as f:
diff --git a/tests/qemu-iotests/205 b/tests/qemu-iotests/205
index c0e107328f..5f5e595ee5 100755
--- a/tests/qemu-iotests/205
+++ b/tests/qemu-iotests/205
@@ -44,10 +44,8 @@ class TestNbdServerRemove(iotests.QMPTestCase):
             }
         }
 
-        result = self.vm.qmp('nbd-server-start', addr=address)
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('nbd-server-add', device='drive0', name='exp')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('nbd-server-start', addr=address)
+        self.vm.cmd('nbd-server-add', device='drive0', name='exp')
 
     def tearDown(self):
         self.vm.shutdown()
diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 8cbed7821b..6120cdd9ad 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -134,8 +134,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def test_incorrect_parameters_single_file(self):
         # Open 'hd0' only (no backing files)
         opts = hd_opts(0)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         original_graph = self.vm.qmp('query-named-block-nodes')
 
         # We can reopen the image passing the same options
@@ -169,8 +168,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.check_node_graph(original_graph)
 
         # Remove the node
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
     # This test opens an image with a backing file and tries to reopen
     # it with illegal / incorrect parameters.
@@ -178,8 +176,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # Open hd1 omitting the backing options (hd0 will be opened
         # with the default options)
         opts = hd_opts(1)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         original_graph = self.vm.qmp('query-named-block-nodes')
 
         # We can't reopen the image passing the same options, 'backing' is mandatory
@@ -211,8 +208,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.check_node_graph(original_graph)
 
         # Remove the node
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd1')
 
     # Reopen an image several times changing some of its options
     def test_reopen(self):
@@ -225,8 +221,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # Open the hd1 image passing all backing options
         opts = hd_opts(1)
         opts['backing'] = hd_opts(0)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
         original_graph = self.vm.qmp('query-named-block-nodes')
 
         # We can reopen the image passing the same options
@@ -301,8 +296,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.assert_qmp_absent(self.get_node('hd1'), 'image/backing-image')
 
         # Open the 'hd0' image
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd_opts(0))
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **hd_opts(0))
 
         # Reopen the hd1 image setting 'hd0' as its backing image
         self.reopen(opts, {'backing': 'hd0'})
@@ -321,10 +315,8 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.assert_qmp(result, 'error/desc', "Node 'hd0' is busy: node is used as backing hd of 'hd1'")
 
         # But we can remove both nodes if done in the proper order
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd1')
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd1')
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
     # Reopen a raw image and see the effect of changing the 'offset' option
     def test_reopen_raw(self):
@@ -340,8 +332,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         qemu_io('-f', 'raw', '-c', 'write -P 0xa1 1M 1M', hd_path[0])
 
         # Open the raw file with QEMU
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Read 1MB from offset 0
         self.run_qemu_io("hd0", "read -P 0xa0  0 1M")
@@ -357,8 +348,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.run_qemu_io("hd0", "read -P 0xa0  0 1M")
 
         # Remove the block device
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
     # Omitting an option should reset it to the default value, but if
     # an option cannot be changed it shouldn't be possible to reset it
@@ -372,8 +362,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                           'node-name': 'hd0-file' } }
 
         # Open the file with QEMU
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # file.x-check-cache-dropped can be changed...
         self.reopen(opts, { 'file.x-check-cache-dropped': False })
@@ -389,8 +378,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, { 'file.locking': 'off' })
 
         # Remove the block device
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
     # This test modifies the node graph a few times by changing the
     # 'backing' option on reopen and verifies that the guest data that
@@ -402,8 +390,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         for i in range(3):
             opts.append(hd_opts(i))
             opts[i]['backing'] = None
-            result = self.vm.qmp('blockdev-add', conv_keys = False, **opts[i])
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add', conv_keys = False, **opts[i])
 
         # hd0
         self.run_qemu_io("hd0", "read -P 0xa0  0 1M")
@@ -494,8 +481,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         for i in range(3):
             opts.append(hd_opts(i))
             opts[i]['backing'] = None
-            result = self.vm.qmp('blockdev-add', conv_keys = False, **opts[i])
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add', conv_keys = False, **opts[i])
 
         # hd1 <- hd0, hd1 <- hd2
         self.reopen(opts[0], {'backing': 'hd1'})
@@ -527,8 +513,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                   'node-name': 'bv',
                   'test': 'hd0',
                   'raw': 'hd1'}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **bvopts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **bvopts)
 
         # blkverify doesn't currently allow reopening. TODO: implement this
         self.reopen(bvopts, {}, "Block format 'blkverify' used by node 'bv'" +
@@ -539,8 +524,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                     "Making 'bv' a backing child of 'hd0' would create a cycle")
 
         # Delete the blkverify node
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bv')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'bv')
 
     # Replace the protocol layer ('file' parameter) of a disk image
     def test_replace_file(self):
@@ -551,16 +535,13 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         hd0_opts = {'driver': 'file', 'node-name': 'hd0-file', 'filename':  hd_path[0] }
         hd1_opts = {'driver': 'file', 'node-name': 'hd1-file', 'filename':  hd_path[1] }
 
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd1_opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **hd0_opts)
+        self.vm.cmd('blockdev-add', conv_keys = False, **hd1_opts)
 
         # Add a raw format layer that uses hd0-file as its protocol layer
         opts = {'driver': 'raw', 'node-name': 'hd', 'file': 'hd0-file'}
 
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Fill the image with data
         self.run_qemu_io("hd", "read  -P 0 0 10k")
@@ -583,21 +564,18 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def test_insert_throttle_filter(self):
         # Add an image to the VM
         hd0_opts = hd_opts(0)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **hd0_opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **hd0_opts)
 
         # Create a throttle-group object
         opts = { 'qom-type': 'throttle-group', 'id': 'group0',
                  'limits': { 'iops-total': 1000 } }
-        result = self.vm.qmp('object-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', conv_keys = False, **opts)
 
         # Add a throttle filter with the group that we just created.
         # The filter is not used by anyone yet
         opts = { 'driver': 'throttle', 'node-name': 'throttle0',
                  'throttle-group': 'group0', 'file': 'hd0-file' }
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Insert the throttle filter between hd0 and hd0-file
         self.reopen(hd0_opts, {'file': 'throttle0'})
@@ -609,15 +587,13 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def test_insert_compress_filter(self):
         # Add an image to the VM: hd (raw) -> hd0 (qcow2) -> hd0-file (file)
         opts = {'driver': 'raw', 'node-name': 'hd', 'file': hd_opts(0)}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Add a 'compress' filter
         filter_opts = {'driver': 'compress',
                        'node-name': 'compress0',
                        'file': 'hd0'}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **filter_opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **filter_opts)
 
         # Unmap the beginning of the image (we cannot write compressed
         # data to an allocated cluster)
@@ -653,12 +629,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def test_swap_files(self):
         # Add hd0 and hd2 (none of them with backing files)
         opts0 = hd_opts(0)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts0)
 
         opts2 = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts2)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts2)
 
         # Write different data to both block devices
         self.run_qemu_io("hd0", "write -P 0xa0 0 1k")
@@ -706,15 +680,13 @@ class TestBlockdevReopen(iotests.QMPTestCase):
             opts = hd_opts(i)
             # Open all three images without backing file
             opts['backing'] = None
-            result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         opts = {'driver': 'quorum',
                 'node-name': 'quorum0',
                 'children': ['hd0', 'hd1', 'hd2'],
                 'vote-threshold': 2}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Quorum doesn't currently allow reopening. TODO: implement this
         self.reopen(opts, {}, "Block format 'quorum' used by node 'quorum0'" +
@@ -726,14 +698,12 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                     "Making 'quorum0' a backing child of 'hd0' would create a cycle")
 
         # Delete quorum0
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'quorum0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'quorum0')
 
         # Delete hd0, hd1 and hd2
         for i in range(3):
-            result = self.vm.qmp('blockdev-del', conv_keys = True,
-                                 node_name = 'hd%d' % i)
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-del', conv_keys = True,
+                        node_name = 'hd%d' % i)
 
         ######################
         ###### blkdebug ######
@@ -742,8 +712,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
                 'node-name': 'bd',
                 'config': '/dev/null',
                 'image': hd_opts(0)}
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # blkdebug allows reopening if we keep the same options
         self.reopen(opts)
@@ -756,16 +725,14 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {}, "Option 'config' cannot be reset to its default value")
 
         # Delete the blkdebug node
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'bd')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'bd')
 
         ##################
         ###### null ######
         ##################
         opts = {'driver': 'null-co', 'node-name': 'root', 'size': 1024}
 
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # 1 << 30 is the default value, but we cannot change it explicitly
         self.reopen(opts, {'size': (1 << 30)}, "Cannot change the option 'size'")
@@ -774,16 +741,14 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         del opts['size']
         self.reopen(opts, {}, "Option 'size' cannot be reset to its default value")
 
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'root')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'root')
 
         ##################
         ###### file ######
         ##################
         opts = hd_opts(0)
         opts['file']['locking'] = 'on'
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # 'locking' cannot be changed
         del opts['file']['locking']
@@ -797,27 +762,23 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {'locking': 'off'}, "Cannot change the option 'locking'")
         self.reopen(opts, {}, "Option 'locking' cannot be reset to its default value")
 
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
         ######################
         ###### throttle ######
         ######################
         opts = { 'qom-type': 'throttle-group', 'id': 'group0',
                  'limits': { 'iops-total': 1000 } }
-        result = self.vm.qmp('object-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', conv_keys = False, **opts)
 
         opts = { 'qom-type': 'throttle-group', 'id': 'group1',
                  'limits': { 'iops-total': 2000 } }
-        result = self.vm.qmp('object-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', conv_keys = False, **opts)
 
         # Add a throttle filter with group = group0
         opts = { 'driver': 'throttle', 'node-name': 'throttle0',
                  'throttle-group': 'group0', 'file': hd_opts(0) }
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # We can reopen it if we keep the same options
         self.reopen(opts)
@@ -845,16 +806,13 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.assert_qmp(result, 'error/desc', "object 'group0' is in use, can not be deleted")
 
         # But group1 is free this time, and it can be deleted
-        result = self.vm.qmp('object-del', id = 'group1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-del', id = 'group1')
 
         # Let's delete the filter node
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'throttle0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'throttle0')
 
         # And we can finally get rid of group0
-        result = self.vm.qmp('object-del', id = 'group0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-del', id = 'group0')
 
     # If an image has a backing file then the 'backing' option must be
     # passed on reopen. We don't allow leaving the option out in this
@@ -862,13 +820,11 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def test_missing_backing_options_1(self):
         # hd2
         opts = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # hd0
         opts = hd_opts(0)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # hd0 has no backing file: we can omit the 'backing' option
         self.reopen(opts)
@@ -891,11 +847,9 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts)
 
         # Remove both hd0 and hd2
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd2')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd2')
 
     # If an image has default backing file (as part of its metadata)
     # then the 'backing' option must be passed on reopen. We don't
@@ -905,8 +859,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # hd0 <- hd1
         # (hd0 is hd1's default backing file)
         opts = hd_opts(1)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # hd1 has a backing file: we can't omit the 'backing' option
         self.reopen(opts, {}, "backing is missing for 'hd1'")
@@ -917,8 +870,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # No backing file attached to hd1 now, but we still can't omit the 'backing' option
         self.reopen(opts, {}, "backing is missing for 'hd1'")
 
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd1')
 
     # Test that making 'backing' a reference to an existing child
     # keeps its current options
@@ -931,8 +883,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts['detect-zeroes'] = 'on'
         opts['backing']['detect-zeroes'] = 'on'
         opts['backing']['backing']['detect-zeroes'] = 'on'
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Reopen the chain passing the minimum amount of required options.
         # By making 'backing' a reference to hd1 (instead of a sub-dict)
@@ -955,12 +906,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
         opts['backing']['backing'] = None
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Stream hd1 into hd0 and wait until it's done
-        result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0', device = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', conv_keys = True, job_id = 'stream0', device = 'hd0')
         self.wait_until_completed(drive = 'stream0')
 
         # Now we have only hd0
@@ -976,8 +925,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # We can also reopen hd0 if we set 'backing' to null
         self.reopen(opts, {'backing': None})
 
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
 
     # Another block_stream test
     def test_block_stream_2(self):
@@ -985,13 +933,11 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
         opts['backing']['backing'] = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # Stream hd1 into hd0 and wait until it's done
-        result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0',
-                             device = 'hd0', base_node = 'hd2')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', conv_keys = True, job_id = 'stream0',
+                    device = 'hd0', base_node = 'hd2')
         self.wait_until_completed(drive = 'stream0')
 
         # The chain is hd2 <- hd0 now. hd1 is missing
@@ -1013,8 +959,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.reopen(opts, {}, "backing is missing for 'hd0'")
 
         # Now we can delete hd0 (and hd2)
-        result = self.vm.qmp('blockdev-del', conv_keys = True, node_name = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', conv_keys = True, node_name = 'hd0')
         self.assertEqual(self.get_node('hd2'), None)
 
     # Reopen the chain during a block-stream job (from hd1 to hd0)
@@ -1023,14 +968,12 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
         opts['backing']['backing'] = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # hd2 <- hd0
-        result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0',
-                             device = 'hd0', base_node = 'hd2',
-                             auto_finalize = False)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', conv_keys = True, job_id = 'stream0',
+                    device = 'hd0', base_node = 'hd2',
+                    auto_finalize = False)
 
         # We can remove hd2 while the stream job is ongoing
         opts['backing']['backing'] = None
@@ -1048,14 +991,12 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
         opts['backing']['backing'] = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         # hd1 <- hd0
-        result = self.vm.qmp('block-stream', conv_keys = True, job_id = 'stream0',
-                             device = 'hd1', filter_node_name='cor',
-                             auto_finalize = False)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-stream', conv_keys = True, job_id = 'stream0',
+                    device = 'hd1', filter_node_name='cor',
+                    auto_finalize = False)
 
         # We can't reopen with the original options because there is a filter
         # inserted by stream job above hd1.
@@ -1084,12 +1025,10 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
         opts['backing']['backing'] = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
-        result = self.vm.qmp('block-commit', conv_keys = True, job_id = 'commit0',
-                             device = 'hd0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', conv_keys = True, job_id = 'commit0',
+                    device = 'hd0')
 
         # We can't remove hd2 while the commit job is ongoing
         opts['backing']['backing'] = None
@@ -1104,8 +1043,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.assert_qmp(event, 'data/type', 'commit')
         self.assert_qmp_absent(event, 'data/error')
 
-        result = self.vm.qmp('block-job-complete', device='commit0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-complete', device='commit0')
 
         self.wait_until_completed(drive = 'commit0')
 
@@ -1115,13 +1053,11 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         opts = hd_opts(0)
         opts['backing'] = hd_opts(1)
         opts['backing']['backing'] = hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
-        result = self.vm.qmp('block-commit', conv_keys = True, job_id = 'commit0',
-                             device = 'hd0', top_node = 'hd1',
-                             auto_finalize = False)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', conv_keys = True, job_id = 'commit0',
+                    device = 'hd0', top_node = 'hd1',
+                    auto_finalize = False)
 
         # We can't remove hd2 while the commit job is ongoing
         opts['backing']['backing'] = None
@@ -1141,36 +1077,28 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def run_test_iothreads(self, iothread_a, iothread_b, errmsg = None,
                            opts_a = None, opts_b = None):
         opts = opts_a or hd_opts(0)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts)
 
         opts2 = opts_b or hd_opts(2)
-        result = self.vm.qmp('blockdev-add', conv_keys = False, **opts2)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', conv_keys = False, **opts2)
 
-        result = self.vm.qmp('object-add', qom_type='iothread', id='iothread0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', qom_type='iothread', id='iothread0')
 
-        result = self.vm.qmp('object-add', qom_type='iothread', id='iothread1')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', qom_type='iothread', id='iothread1')
 
-        result = self.vm.qmp('device_add', driver='virtio-scsi', id='scsi0',
-                             iothread=iothread_a)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_add', driver='virtio-scsi', id='scsi0',
+                    iothread=iothread_a)
 
-        result = self.vm.qmp('device_add', driver='virtio-scsi', id='scsi1',
-                             iothread=iothread_b)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('device_add', driver='virtio-scsi', id='scsi1',
+                    iothread=iothread_b)
 
         if iothread_a:
-            result = self.vm.qmp('device_add', driver='scsi-hd', drive='hd0',
-                                 share_rw=True, bus="scsi0.0")
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('device_add', driver='scsi-hd', drive='hd0',
+                        share_rw=True, bus="scsi0.0")
 
         if iothread_b:
-            result = self.vm.qmp('device_add', driver='scsi-hd', drive='hd2',
-                                 share_rw=True, bus="scsi1.0")
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('device_add', driver='scsi-hd', drive='hd2',
+                        share_rw=True, bus="scsi1.0")
 
         # Attaching the backing file may or may not work
         self.reopen(opts, {'backing': 'hd2'}, errmsg)
@@ -1199,8 +1127,7 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         # Create a throttle-group object
         opts = { 'qom-type': 'throttle-group', 'id': 'group0',
                  'limits': { 'iops-total': 1000 } }
-        result = self.vm.qmp('object-add', conv_keys = False, **opts)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('object-add', conv_keys = False, **opts)
 
         # Options with a throttle filter between format and protocol
         opts = [
diff --git a/tests/qemu-iotests/264 b/tests/qemu-iotests/264
index bc431d1a19..67364a05e6 100755
--- a/tests/qemu-iotests/264
+++ b/tests/qemu-iotests/264
@@ -48,18 +48,16 @@ class TestNbdReconnect(iotests.QMPTestCase):
         """Stat job with nbd target and kill the server"""
         assert job in ('blockdev-backup', 'blockdev-mirror')
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
-            result = self.vm.qmp('blockdev-add',
-                                 **{'node_name': 'backup0',
-                                    'driver': 'raw',
-                                    'file': {'driver': 'nbd',
-                                             'server': {'type': 'unix',
-                                                        'path': nbd_sock},
-                                             'reconnect-delay': 10}})
-            self.assert_qmp(result, 'return', {})
-            result = self.vm.qmp(job, device='drive0',
-                                 sync='full', target='backup0',
-                                 speed=(1 * 1024 * 1024))
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-add',
+                        {'node-name': 'backup0',
+                         'driver': 'raw',
+                         'file': {'driver': 'nbd',
+                                  'server': {'type': 'unix',
+                                             'path': nbd_sock},
+                                  'reconnect-delay': 10}})
+            self.vm.cmd(job, device='drive0',
+                        sync='full', target='backup0',
+                        speed=(1 * 1024 * 1024))
 
             # Wait for some progress
             t = 0.0
@@ -77,8 +75,7 @@ class TestNbdReconnect(iotests.QMPTestCase):
         self.assertTrue(jobs)
         self.assertTrue(jobs[0]['offset'] < jobs[0]['len'])
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0', speed=0)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=0)
 
         # Emulate server down time for 1 second
         time.sleep(1)
@@ -91,12 +88,10 @@ class TestNbdReconnect(iotests.QMPTestCase):
         with qemu_nbd_popen('-k', nbd_sock, '-f', iotests.imgfmt, disk_b):
             e = self.vm.event_wait('BLOCK_JOB_COMPLETED')
             self.assertEqual(e['data']['offset'], size)
-            result = self.vm.qmp('blockdev-del', node_name='backup0')
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd('blockdev-del', node_name='backup0')
 
     def cancel_job(self):
-        result = self.vm.qmp('block-job-cancel', device='drive0', force=True)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-cancel', device='drive0', force=True)
 
         start_t = time.time()
         self.vm.event_wait('BLOCK_JOB_CANCELLED')
diff --git a/tests/qemu-iotests/281 b/tests/qemu-iotests/281
index 5e1339bd75..f6746a12e8 100755
--- a/tests/qemu-iotests/281
+++ b/tests/qemu-iotests/281
@@ -56,15 +56,13 @@ class TestDirtyBitmapIOThread(iotests.QMPTestCase):
             os.remove(self.images[name])
 
     def test_add_dirty_bitmap(self):
-        result = self.vm.qmp(
+        self.vm.cmd(
             'block-dirty-bitmap-add',
             node='drive0',
             name='bitmap1',
             persistent=True,
         )
 
-        self.assert_qmp(result, 'return', {})
-
 
 # Test for RHBZ#1746217 & RHBZ#1773517
 class TestNBDMirrorIOThread(iotests.QMPTestCase):
@@ -105,23 +103,21 @@ class TestNBDMirrorIOThread(iotests.QMPTestCase):
             os.remove(self.images[name])
 
     def test_nbd_mirror(self):
-        result = self.vm_tgt.qmp(
+        self.vm_tgt.cmd(
             'nbd-server-start',
             addr={
                 'type': 'unix',
                 'data': { 'path': self.nbd_sock }
             }
         )
-        self.assert_qmp(result, 'return', {})
 
-        result = self.vm_tgt.qmp(
+        self.vm_tgt.cmd(
             'nbd-server-add',
             device='drive0',
             writable=True
         )
-        self.assert_qmp(result, 'return', {})
 
-        result = self.vm_src.qmp(
+        self.vm_src.cmd(
             'drive-mirror',
             device='drive0',
             target='nbd+unix:///drive0?socket=' + self.nbd_sock,
@@ -130,7 +126,6 @@ class TestNBDMirrorIOThread(iotests.QMPTestCase):
             speed=64*1024*1024,
             job_id='j1'
         )
-        self.assert_qmp(result, 'return', {})
 
         self.vm_src.event_wait(name="BLOCK_JOB_READY")
 
@@ -290,8 +285,7 @@ class TestYieldingAndTimers(iotests.QMPTestCase):
         # they will remain active, fire later, and then access freed data.
         # (Or, with "block/nbd: Assert there are no timers when closed"
         # applied, the assertions added in that patch will fail.)
-        result = self.vm.qmp('blockdev-del', node_name='nbd')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', node_name='nbd')
 
         # Give the timers some time to fire (both have a timeout of 1 s).
         # (Sleeping in an iotest may ring some alarm bells, but note that if
@@ -303,9 +297,8 @@ class TestYieldingAndTimers(iotests.QMPTestCase):
     def test_yield_in_iothread(self):
         # Move the NBD node to the I/O thread; the NBD block driver should
         # attach the connection's QIOChannel to that thread's AioContext, too
-        result = self.vm.qmp('x-blockdev-set-iothread',
-                             node_name='nbd', iothread='iothr')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('x-blockdev-set-iothread',
+                    node_name='nbd', iothread='iothr')
 
         # Do some I/O that will be throttled by the QSD, so that the network
         # connection hopefully will yield here.  When it is resumed, it must
diff --git a/tests/qemu-iotests/295 b/tests/qemu-iotests/295
index 270ad3999f..2d472c9447 100755
--- a/tests/qemu-iotests/295
+++ b/tests/qemu-iotests/295
@@ -57,8 +57,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
         # create the secrets and load 'em into the VM
         self.secrets = [ Secret(i) for i in range(0, 6) ]
         for secret in self.secrets:
-            result = self.vm.qmp("object-add", **secret.to_qmp_object())
-            self.assert_qmp(result, 'return', {})
+            self.vm.cmd("object-add", **secret.to_qmp_object())
 
         if iotests.imgfmt == "qcow2":
             self.pfx = "encrypt."
@@ -102,26 +101,22 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
                 }
             }
 
-        result = self.vm.qmp('blockdev-add', **
-            {
-                'driver': iotests.imgfmt,
-                'node-name': id,
-                'read-only': read_only,
+        self.vm.cmd('blockdev-add', {
+            'driver': iotests.imgfmt,
+            'node-name': id,
+            'read-only': read_only,
 
-                **encrypt_options,
+            **encrypt_options,
 
-                'file': {
-                    'driver': 'file',
-                    'filename': test_img,
-                }
+            'file': {
+                'driver': 'file',
+                'filename': test_img,
             }
-        )
-        self.assert_qmp(result, 'return', {})
+        })
 
     # close the encrypted block device
     def closeImageQmp(self, id):
-        result = self.vm.qmp('blockdev-del', **{ 'node-name': id })
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-del', **{ 'node-name': id })
 
     ###########################################################################
     # add a key to an encrypted block device
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 0d21b740a7..75a8695cfa 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -61,10 +61,8 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
         # create the secrets and load 'em into the VMs
         self.secrets = [ Secret(i) for i in range(0, 4) ]
         for secret in self.secrets:
-            result = self.vm1.qmp("object-add", **secret.to_qmp_object())
-            self.assert_qmp(result, 'return', {})
-            result = self.vm2.qmp("object-add", **secret.to_qmp_object())
-            self.assert_qmp(result, 'return', {})
+            self.vm1.cmd("object-add", **secret.to_qmp_object())
+            self.vm2.cmd("object-add", **secret.to_qmp_object())
 
     # test case shutdown
     def tearDown(self):
@@ -132,10 +130,9 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
             }
 
         if reOpen:
-            result = vm.qmp(command, options=[opts])
+            vm.cmd(command, options=[opts])
         else:
-            result = vm.qmp(command, **opts)
-        self.assert_qmp(result, 'return', {})
+            vm.cmd(command, **opts)
 
 
     ###########################################################################
@@ -154,8 +151,7 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
     # close the encrypted block device
     def closeImageQmp(self, vm, id):
-        result = vm.qmp('blockdev-del', **{ 'node-name': id })
-        self.assert_qmp(result, 'return', {})
+        vm.cmd('blockdev-del', **{ 'node-name': id })
 
     ###########################################################################
 
diff --git a/tests/qemu-iotests/298 b/tests/qemu-iotests/298
index fae72211b1..c43c6586d3 100755
--- a/tests/qemu-iotests/298
+++ b/tests/qemu-iotests/298
@@ -80,25 +80,23 @@ class TestPreallocateFilter(TestPreallocateBase):
     def test_external_snapshot(self):
         self.test_prealloc()
 
-        result = self.vm.qmp('blockdev-snapshot-sync', node_name='disk',
-                             snapshot_file=overlay,
-                             snapshot_node_name='overlay')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-snapshot-sync', node_name='disk',
+                    snapshot_file=overlay,
+                    snapshot_node_name='overlay')
 
         # on reopen to  r-o base preallocation should be dropped
         self.check_small()
 
         self.vm.hmp_qemu_io('drive0', 'write 1M 1M')
 
-        result = self.vm.qmp('block-commit', device='overlay')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-commit', device='overlay')
         self.complete_and_wait()
 
         # commit of new megabyte should trigger preallocation
         self.check_big()
 
     def test_reopen_opts(self):
-        result = self.vm.qmp('blockdev-reopen', options=[{
+        self.vm.cmd('blockdev-reopen', options=[{
             'node-name': 'disk',
             'driver': iotests.imgfmt,
             'file': {
@@ -113,7 +111,6 @@ class TestPreallocateFilter(TestPreallocateBase):
                 }
             }
         }])
-        self.assert_qmp(result, 'return', {})
 
         self.vm.hmp_qemu_io('drive0', 'write 0 1M')
         self.assertTrue(os.path.getsize(disk) == 25 * MiB)
diff --git a/tests/qemu-iotests/300 b/tests/qemu-iotests/300
index dbd28384ec..7b479ab01e 100755
--- a/tests/qemu-iotests/300
+++ b/tests/qemu-iotests/300
@@ -50,10 +50,9 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.vm_b.add_incoming(f'unix:{mig_sock}')
         self.vm_b.launch()
 
-        result = self.vm_a.qmp('block-dirty-bitmap-add',
-                               node=self.src_node_name,
-                               name=self.src_bmap_name)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('block-dirty-bitmap-add',
+                      node=self.src_node_name,
+                      name=self.src_bmap_name)
 
         # Dirty some random megabytes
         for _ in range(9):
@@ -69,8 +68,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
                 for name in ('dirty-bitmaps', 'events')]
 
         for vm in (self.vm_a, self.vm_b):
-            result = vm.qmp('migrate-set-capabilities', capabilities=caps)
-            self.assert_qmp(result, 'return', {})
+            vm.cmd('migrate-set-capabilities', capabilities=caps)
 
     def tearDown(self) -> None:
         self.vm_a.shutdown()
@@ -93,8 +91,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
 
     def migrate(self, bitmap_name_valid: bool = True,
                 migration_success: bool = True) -> None:
-        result = self.vm_a.qmp('migrate', uri=f'unix:{mig_sock}')
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('migrate', uri=f'unix:{mig_sock}')
 
         with iotests.Timeout(5, 'Timeout waiting for migration to complete'):
             self.assertEqual(self.vm_a.wait_migration('postmigrate'),
@@ -442,10 +439,9 @@ class TestBlockBitmapMappingErrors(TestDirtyBitmapMigration):
     def test_bitmap_name_too_long(self) -> None:
         name = 'a' * 256
 
-        result = self.vm_a.qmp('block-dirty-bitmap-add',
-                               node=self.src_node_name,
-                               name=name)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('block-dirty-bitmap-add',
+                      node=self.src_node_name,
+                      name=name)
 
         self.migrate(False, False)
 
@@ -517,22 +513,16 @@ class TestCrossAliasMigration(TestDirtyBitmapMigration):
         TestDirtyBitmapMigration.setUp(self)
 
         # Now create another block device and let both have two bitmaps each
-        result = self.vm_a.qmp('blockdev-add',
-                               node_name='node-b', driver='null-co')
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('blockdev-add', node_name='node-b', driver='null-co')
 
-        result = self.vm_b.qmp('blockdev-add',
-                               node_name='node-a', driver='null-co')
-        self.assert_qmp(result, 'return', {})
+        self.vm_b.cmd('blockdev-add', node_name='node-a', driver='null-co')
 
         bmaps_to_add = (('node-a', 'bmap-b'),
                         ('node-b', 'bmap-a'),
                         ('node-b', 'bmap-b'))
 
         for (node, bmap) in bmaps_to_add:
-            result = self.vm_a.qmp('block-dirty-bitmap-add',
-                                   node=node, name=bmap)
-            self.assert_qmp(result, 'return', {})
+            self.vm_a.cmd('block-dirty-bitmap-add', node=node, name=bmap)
 
     @staticmethod
     def cross_mapping() -> BlockBitmapMapping:
@@ -611,24 +601,20 @@ class TestAliasTransformMigration(TestDirtyBitmapMigration):
         TestDirtyBitmapMigration.setUp(self)
 
         # Now create another block device and let both have two bitmaps each
-        result = self.vm_a.qmp('blockdev-add',
-                               node_name='node-b', driver='null-co',
-                               read_zeroes=False)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('blockdev-add',
+                      node_name='node-b', driver='null-co',
+                      read_zeroes=False)
 
-        result = self.vm_b.qmp('blockdev-add',
-                               node_name='node-a', driver='null-co',
-                               read_zeroes=False)
-        self.assert_qmp(result, 'return', {})
+        self.vm_b.cmd('blockdev-add',
+                      node_name='node-a', driver='null-co',
+                      read_zeroes=False)
 
         bmaps_to_add = (('node-a', 'bmap-b'),
                         ('node-b', 'bmap-a'),
                         ('node-b', 'bmap-b'))
 
         for (node, bmap) in bmaps_to_add:
-            result = self.vm_a.qmp('block-dirty-bitmap-add',
-                                   node=node, name=bmap)
-            self.assert_qmp(result, 'return', {})
+            self.vm_a.cmd('block-dirty-bitmap-add', node=node, name=bmap)
 
     @staticmethod
     def transform_mapping() -> BlockBitmapMapping:
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 87eb5f542f..e4777dcd9f 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1232,8 +1232,7 @@ def assert_json_filename_equal(self, json_filename, reference):
     def cancel_and_wait(self, drive='drive0', force=False,
                         resume=False, wait=60.0):
         '''Cancel a block job and wait for it to finish, returning the event'''
-        result = self.vm.qmp('block-job-cancel', device=drive, force=force)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-cancel', device=drive, force=force)
 
         if resume:
             self.vm.resume_drive(drive)
@@ -1295,8 +1294,7 @@ def complete_and_wait(self, drive='drive0', wait_ready=True,
         if wait_ready:
             self.wait_ready(drive=drive)
 
-        result = self.vm.qmp('block-job-complete', device=drive)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-complete', device=drive)
 
         event = self.wait_until_completed(drive=drive, error=completion_error)
         self.assertTrue(event['data']['type'] in ['mirror', 'commit'])
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index fc9c4b4ef4..2c33420151 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -118,11 +118,10 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
     def start_postcopy(self):
         """ Run migration until RESUME event on target. Return this event. """
         for i in range(nb_bitmaps):
-            result = self.vm_a.qmp('block-dirty-bitmap-add', node='drive0',
-                                   name='bitmap{}'.format(i),
-                                   granularity=granularity,
-                                   persistent=True)
-            self.assert_qmp(result, 'return', {})
+            self.vm_a.cmd('block-dirty-bitmap-add', node='drive0',
+                          name='bitmap{}'.format(i),
+                          granularity=granularity,
+                          persistent=True)
 
         result = self.vm_a.qmp('x-debug-block-dirty-bitmap-sha256',
                                node='drive0', name='bitmap0')
@@ -140,9 +139,8 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
         # We want to calculate resulting sha256. Do it in bitmap0, so, disable
         # other bitmaps
         for i in range(1, nb_bitmaps):
-            result = self.vm_a.qmp('block-dirty-bitmap-disable', node='drive0',
-                                   name='bitmap{}'.format(i))
-            self.assert_qmp(result, 'return', {})
+            self.vm_a.cmd('block-dirty-bitmap-disable', node='drive0',
+                          name='bitmap{}'.format(i))
 
         apply_discards(self.vm_a, discards2)
 
@@ -152,24 +150,19 @@ class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
 
         # Now, enable some bitmaps, to be updated during migration
         for i in range(2, nb_bitmaps, 2):
-            result = self.vm_a.qmp('block-dirty-bitmap-enable', node='drive0',
-                                   name='bitmap{}'.format(i))
-            self.assert_qmp(result, 'return', {})
+            self.vm_a.cmd('block-dirty-bitmap-enable', node='drive0',
+                          name='bitmap{}'.format(i))
 
         caps = [{'capability': 'dirty-bitmaps', 'state': True},
                 {'capability': 'events', 'state': True}]
 
-        result = self.vm_a.qmp('migrate-set-capabilities', capabilities=caps)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('migrate-set-capabilities', capabilities=caps)
 
-        result = self.vm_b.qmp('migrate-set-capabilities', capabilities=caps)
-        self.assert_qmp(result, 'return', {})
+        self.vm_b.cmd('migrate-set-capabilities', capabilities=caps)
 
-        result = self.vm_a.qmp('migrate', uri='exec:cat>' + fifo)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('migrate', uri='exec:cat>' + fifo)
 
-        result = self.vm_a.qmp('migrate-start-postcopy')
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('migrate-start-postcopy')
 
         event_resume = self.vm_b.event_wait('RESUME')
         self.vm_b_events.append(event_resume)
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index 59f3357580..b5b03c0377 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -67,8 +67,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         if persistent:
             params['persistent'] = True
 
-        result = vm.qmp('block-dirty-bitmap-add', **params)
-        self.assert_qmp(result, 'return', {})
+        vm.cmd('block-dirty-bitmap-add', **params)
 
     def check_bitmap(self, vm, sha256):
         result = vm.qmp('x-debug-block-dirty-bitmap-sha256',
@@ -91,9 +90,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         if migrate_bitmaps:
             mig_caps.append({'capability': 'dirty-bitmaps', 'state': True})
 
-        result = self.vm_a.qmp('migrate-set-capabilities',
-                               capabilities=mig_caps)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('migrate-set-capabilities', capabilities=mig_caps)
 
         self.add_bitmap(self.vm_a, granularity, persistent)
         for r in regions:
@@ -114,8 +111,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         removed = (not migrate_bitmaps) and persistent
         self.check_bitmap(self.vm_a, False if removed else sha256)
 
-        result = self.vm_a.qmp('cont')
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('cont')
 
         # test that bitmap is still here after invalidation
         self.check_bitmap(self.vm_a, sha256)
@@ -158,9 +154,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         if online:
             os.mkfifo(mig_file)
             self.vm_b.launch()
-            result = self.vm_b.qmp('migrate-set-capabilities',
-                                   capabilities=mig_caps)
-            self.assert_qmp(result, 'return', {})
+            self.vm_b.cmd('migrate-set-capabilities', capabilities=mig_caps)
 
         self.add_bitmap(self.vm_a, granularity, persistent)
         for r in regions:
@@ -171,9 +165,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
             self.vm_a.shutdown()
             self.vm_a.launch()
 
-        result = self.vm_a.qmp('migrate-set-capabilities',
-                               capabilities=mig_caps)
-        self.assert_qmp(result, 'return', {})
+        self.vm_a.cmd('migrate-set-capabilities', capabilities=mig_caps)
 
         result = self.vm_a.qmp('migrate', uri=mig_cmd)
         while True:
@@ -184,11 +176,8 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         if not online:
             self.vm_a.shutdown()
             self.vm_b.launch()
-            result = self.vm_b.qmp('migrate-set-capabilities',
-                                   capabilities=mig_caps)
-            self.assert_qmp(result, 'return', {})
-            result = self.vm_b.qmp('migrate-incoming', uri=incoming_cmd)
-            self.assert_qmp(result, 'return', {})
+            self.vm_b.cmd('migrate-set-capabilities', capabilities=mig_caps)
+            self.vm_b.cmd('migrate-incoming', uri=incoming_cmd)
 
         while True:
             event = self.vm_b.event_wait('MIGRATION')
@@ -254,8 +243,7 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         self.vm = iotests.VM()
         self.vm.launch()
 
-        result = self.vm.qmp('blockdev-add', **blockdev)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-add', **blockdev)
 
         # Check that the bitmaps are there
         nodes = self.vm.qmp('query-named-block-nodes', flat=True)['return']
@@ -264,8 +252,7 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
                 self.assert_qmp(node, 'dirty-bitmaps[0]/name', 'bmap0')
 
         caps = [{'capability': 'events', 'state': True}]
-        result = self.vm.qmp('migrate-set-capabilities', capabilities=caps)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('migrate-set-capabilities', capabilities=caps)
 
     def tearDown(self):
         self.vm.shutdown()
@@ -276,14 +263,12 @@ class TestDirtyBitmapBackingMigration(iotests.QMPTestCase):
         """
         Continue the source after migration.
         """
-        result = self.vm.qmp('migrate', uri='exec: cat > /dev/null')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('migrate', uri='exec: cat > /dev/null')
 
         with Timeout(10, 'Migration timeout'):
             self.vm.wait_migration('postmigrate')
 
-        result = self.vm.qmp('cont')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('cont')
 
 
 def main() -> None:
diff --git a/tests/qemu-iotests/tests/migrate-during-backup b/tests/qemu-iotests/tests/migrate-during-backup
index 34103229ee..0645b8a718 100755
--- a/tests/qemu-iotests/tests/migrate-during-backup
+++ b/tests/qemu-iotests/tests/migrate-during-backup
@@ -43,7 +43,7 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
 
         self.vm = iotests.VM().add_drive(disk_a)
         self.vm.launch()
-        result = self.vm.qmp('blockdev-add', {
+        self.vm.cmd('blockdev-add', {
             'node-name': 'target',
             'driver': iotests.imgfmt,
             'file': {
@@ -51,26 +51,21 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
                 'filename': disk_b
             }
         })
-        self.assert_qmp(result, 'return', {})
 
     def test_migrate(self):
-        result = self.vm.qmp('blockdev-backup', device='drive0',
-                             target='target', sync='full',
-                             speed=1, x_perf={
-                                 'max-workers': 1,
-                                 'max-chunk': 64 * 1024
-                             })
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('job-pause', id='drive0')
-        self.assert_qmp(result, 'return', {})
-
-        result = self.vm.qmp('migrate-set-capabilities',
-                             capabilities=[{'capability': 'events',
-                                            'state': True}])
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('migrate', uri=mig_cmd)
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-backup', device='drive0',
+                    target='target', sync='full',
+                    speed=1, x_perf={
+                        'max-workers': 1,
+                        'max-chunk': 64 * 1024
+                    })
+
+        self.vm.cmd('job-pause', id='drive0')
+
+        self.vm.cmd('migrate-set-capabilities',
+                    capabilities=[{'capability': 'events',
+                                   'state': True}])
+        self.vm.cmd('migrate', uri=mig_cmd)
 
         e = self.vm.events_wait((('MIGRATION',
                                   {'data': {'status': 'completed'}}),
@@ -80,11 +75,8 @@ class TestMigrateDuringBackup(iotests.QMPTestCase):
         # Don't assert that e is 'failed' now: this way we'll miss
         # possible crash when backup continues :)
 
-        result = self.vm.qmp('block-job-set-speed', device='drive0',
-                             speed=0)
-        self.assert_qmp(result, 'return', {})
-        result = self.vm.qmp('job-resume', id='drive0')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-set-speed', device='drive0', speed=0)
+        self.vm.cmd('job-resume', id='drive0')
 
         # For future: if something changes so that both migration
         # and backup pass, let's not miss that moment, as it may
diff --git a/tests/qemu-iotests/tests/migration-permissions b/tests/qemu-iotests/tests/migration-permissions
index 6be02581c7..04212e8cc8 100755
--- a/tests/qemu-iotests/tests/migration-permissions
+++ b/tests/qemu-iotests/tests/migration-permissions
@@ -45,11 +45,10 @@ class TestMigrationPermissions(iotests.QMPTestCase):
 
             vms[i].launch()
 
-            result = vms[i].qmp('migrate-set-capabilities',
-                                capabilities=[
-                                    {'capability': 'events', 'state': True}
-                                ])
-            self.assert_qmp(result, 'return', {})
+            vms[i].cmd('migrate-set-capabilities',
+                       capabilities=[
+                           {'capability': 'events', 'state': True}
+                       ])
 
         self.vm_s = vms[0]
         self.vm_d = vms[1]
diff --git a/tests/qemu-iotests/tests/mirror-top-perms b/tests/qemu-iotests/tests/mirror-top-perms
index 8bca592708..0e41504163 100755
--- a/tests/qemu-iotests/tests/mirror-top-perms
+++ b/tests/qemu-iotests/tests/mirror-top-perms
@@ -78,12 +78,11 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         difficult to let some other qemu process open the image.)
         """
 
-        result = self.vm.qmp('blockdev-mirror',
-                             job_id='mirror',
-                             device='drive0',
-                             target='null',
-                             sync='full')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('blockdev-mirror',
+                    job_id='mirror',
+                    device='drive0',
+                    target='null',
+                    sync='full')
 
         self.vm.event_wait('BLOCK_JOB_READY')
 
@@ -105,9 +104,7 @@ class TestMirrorTopPerms(iotests.QMPTestCase):
         except machine.VMLaunchFailure as exc:
             assert 'Is another process using the image' in exc.output
 
-        result = self.vm.qmp('block-job-cancel',
-                             device='mirror')
-        self.assert_qmp(result, 'return', {})
+        self.vm.cmd('block-job-cancel', device='mirror')
 
         self.vm.event_wait('BLOCK_JOB_COMPLETED')
 
-- 
2.35.1


