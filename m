Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4E5697D38
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHo4-0002ls-7g; Wed, 15 Feb 2023 08:26:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnj-0002gi-Kb
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:26:26 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnd-0006F7-UA
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 08:26:19 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id DDD8A60073;
 Wed, 15 Feb 2023 16:26:07 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nPk8g80UxeA1-obrbTl5H; Wed, 15 Feb 2023 16:26:07 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676467567; bh=q65mSZu0xdYWtdX1kdwO/chIdWJeyl4LNH4kexNOfLU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=aX7J6YfWK/kdN99mrFXvqZfZC6Mo0W7GNJlN2Xmmv7ScsqXNDyQDxvZYUUt/poHlc
 Zfbj7mqWBRSH4/utRk1la62eUig7uRqmt/VbrpQPwmWADLg9CIUPZHOEb7OU3Cw6Wd
 yOr9L3op4/mHQY/fbBvUvXsbPC0XDCRYD+154Ijc=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, jsnow@redhat.com,
 crosa@redhat.com, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 11/16] iotests: refactor some common qmp result checks into
 generic pattern
Date: Wed, 15 Feb 2023 16:25:42 +0300
Message-Id: <20230215132547.1620575-12-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

To simplify further conversion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/040 | 3 ++-
 tests/qemu-iotests/147 | 3 ++-
 tests/qemu-iotests/155 | 4 ++--
 tests/qemu-iotests/218 | 4 ++--
 tests/qemu-iotests/296 | 3 ++-
 5 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/040 b/tests/qemu-iotests/040
index 30eb97829e..2b68946744 100755
--- a/tests/qemu-iotests/040
+++ b/tests/qemu-iotests/040
@@ -62,9 +62,10 @@ class ImageCommitTestCase(iotests.QMPTestCase):
         self.assert_no_active_block_jobs()
         if node_names:
             result = self.vm.qmp('block-commit', device='drive0', top_node=top, base_node=base)
+            self.assert_qmp(result, 'return', {})
         else:
             result = self.vm.qmp('block-commit', device='drive0', top=top, base=base)
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
         self.wait_for_complete(need_ready)
 
     def run_default_commit_test(self):
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 47dfa62e6b..770b73e2f4 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -159,10 +159,11 @@ class BuiltinNBD(NBDBlockdevAddBase):
 
         if export_name is None:
             result = self.server.qmp('nbd-server-add', device='nbd-export')
+            self.assert_qmp(result, 'return', {})
         else:
             result = self.server.qmp('nbd-server-add', device='nbd-export',
                                      name=export_name)
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
 
         if export_name2 is not None:
             result = self.server.qmp('nbd-server-add', device='nbd-export',
diff --git a/tests/qemu-iotests/155 b/tests/qemu-iotests/155
index eadda52615..d3e1b7401e 100755
--- a/tests/qemu-iotests/155
+++ b/tests/qemu-iotests/155
@@ -181,6 +181,7 @@ class MirrorBaseClass(BaseClass):
             result = self.vm.qmp(self.cmd, job_id='mirror-job', device='source',
                                  sync=sync, target='target',
                                  auto_finalize=False)
+            self.assert_qmp(result, 'return', {})
         else:
             if self.existing:
                 mode = 'existing'
@@ -190,8 +191,7 @@ class MirrorBaseClass(BaseClass):
                                  sync=sync, target=target_img,
                                  format=iotests.imgfmt, mode=mode,
                                  node_name='target', auto_finalize=False)
-
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
 
         self.vm.run_job('mirror-job', auto_finalize=False,
                         pre_finalize=self.openBacking, auto_dismiss=True)
diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
index 6320c4cb56..5e74c55b6a 100755
--- a/tests/qemu-iotests/218
+++ b/tests/qemu-iotests/218
@@ -61,14 +61,14 @@ def start_mirror(vm, speed=None, buf_size=None):
                          sync='full',
                          speed=speed,
                          buf_size=buf_size)
+        assert ret['return'] == {}
     else:
         ret = vm.qmp('blockdev-mirror',
                          job_id='mirror',
                          device='source',
                          target='target',
                          sync='full')
-
-    assert ret['return'] == {}
+        assert ret['return'] == {}
 
 
 log('')
diff --git a/tests/qemu-iotests/296 b/tests/qemu-iotests/296
index 0d21b740a7..19a674c5ae 100755
--- a/tests/qemu-iotests/296
+++ b/tests/qemu-iotests/296
@@ -133,9 +133,10 @@ class EncryptionSetupTestCase(iotests.QMPTestCase):
 
         if reOpen:
             result = vm.qmp(command, options=[opts])
+            self.assert_qmp(result, 'return', {})
         else:
             result = vm.qmp(command, **opts)
-        self.assert_qmp(result, 'return', {})
+            self.assert_qmp(result, 'return', {})
 
 
     ###########################################################################
-- 
2.34.1


