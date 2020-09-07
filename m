Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CD25F9AD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:41:14 +0200 (CEST)
Received: from localhost ([::1]:42642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFWL-0006fT-DX
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF3F-0004Cb-1V
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:09 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49684
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF3B-0008JW-3G
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAp7PIrhjxPmTalsQmRzgZeWYNFROFj0NoL75xt+z9c=;
 b=XHS5pvv65/nCAqetZqO+05pKmZeLfhJQ8Z5C8NXwiVVLtICSBqzIWpZ7N8kce2nCqgXWD4
 GXV0OenltW6a6u7J1KYQif1wSt9TIRjaeoOgb8dIdp9QlNn5NDLsRr1k9yZggFVOMCQIhW
 wGN7vJnzbLnJVKiWVWm+Wrd6teIqdoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-cgB9MEfNPwyR1DrmKipzhg-1; Mon, 07 Sep 2020 07:11:02 -0400
X-MC-Unique: cgB9MEfNPwyR1DrmKipzhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 203211084C85;
 Mon,  7 Sep 2020 11:11:01 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 288559CBA;
 Mon,  7 Sep 2020 11:11:00 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 59/64] iotests: Test committing to overridden backing
Date: Mon,  7 Sep 2020 13:09:31 +0200
Message-Id: <20200907110936.261684-60-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/06 22:29:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Max Reitz <mreitz@redhat.com>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/040     | 61 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/040.out |  4 +--
 2 files changed, 63 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 71c6d7f621..2a54f9ad21 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -911,6 +911,67 @@ class TestCommitWithFilters(iotests.QMPTestCase):
         # 3 has been comitted into 2
         self.pattern_files[3] = self.img2
 
+class TestCommitWithOverriddenBacking(iotests.QMPTestCase):
+    img_base_a = os.path.join(iotests.test_dir, 'base_a.img')
+    img_base_b = os.path.join(iotests.test_dir, 'base_b.img')
+    img_top = os.path.join(iotests.test_dir, 'top.img')
+
+    def setUp(self):
+        qemu_img('create', '-f', iotests.imgfmt, self.img_base_a, '1M')
+        qemu_img('create', '-f', iotests.imgfmt, self.img_base_b, '1M')
+        qemu_img('create', '-f', iotests.imgfmt, '-b', self.img_base_a, \
+                 self.img_top)
+
+        self.vm = iotests.VM()
+        self.vm.launch()
+
+        # Use base_b instead of base_a as the backing of top
+        result = self.vm.qmp('blockdev-add', **{
+                                'node-name': 'top',
+                                'driver': iotests.imgfmt,
+                                'file': {
+                                    'driver': 'file',
+                                    'filename': self.img_top
+                                },
+                                'backing': {
+                                    'node-name': 'base',
+                                    'driver': iotests.imgfmt,
+                                    'file': {
+                                        'driver': 'file',
+                                        'filename': self.img_base_b
+                                    }
+                                }
+                            })
+        self.assert_qmp(result, 'return', {})
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(self.img_top)
+        os.remove(self.img_base_a)
+        os.remove(self.img_base_b)
+
+    def test_commit_to_a(self):
+        # Try committing to base_a (which should fail, as top's
+        # backing image is base_b instead)
+        result = self.vm.qmp('block-commit',
+                             job_id='commit',
+                             device='top',
+                             base=self.img_base_a)
+        self.assert_qmp(result, 'error/class', 'GenericError')
+
+    def test_commit_to_b(self):
+        # Try committing to base_b (which should work, since that is
+        # actually top's backing image)
+        result = self.vm.qmp('block-commit',
+                             job_id='commit',
+                             device='top',
+                             base=self.img_base_b)
+        self.assert_qmp(result, 'return', {})
+
+        self.vm.event_wait('BLOCK_JOB_READY')
+        self.vm.qmp('block-job-complete', device='commit')
+        self.vm.event_wait('BLOCK_JOB_COMPLETED')
+
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2', 'qed'],
                  supported_protocols=['file'])
diff --git a/tests/qemu-iotests/040.out b/tests/qemu-iotests/040.out
index 4823c113d5..1bb1dc5f0e 100644
--- a/tests/qemu-iotests/040.out
+++ b/tests/qemu-iotests/040.out
@@ -1,5 +1,5 @@
-...............................................................
+.................................................................
 ----------------------------------------------------------------------
-Ran 63 tests
+Ran 65 tests
 
 OK
-- 
2.25.4


