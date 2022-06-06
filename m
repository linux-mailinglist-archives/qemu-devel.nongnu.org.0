Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9251853E175
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:53:40 +0200 (CEST)
Received: from localhost ([::1]:60218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7YR-0007Vt-MG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79i-0005LT-N5; Mon, 06 Jun 2022 03:28:09 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:43322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79f-0002Z8-2N; Mon, 06 Jun 2022 03:28:05 -0400
Received: from sas1-3cba3404b018.qloud-c.yandex.net
 (sas1-3cba3404b018.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd26:0:640:3cba:3404])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id DF81B2E0B02;
 Mon,  6 Jun 2022 10:27:55 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-3cba3404b018.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HXkQyfoV51-RtKKZs3P; Mon, 06 Jun 2022 10:27:55 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500475; bh=TNd9paYlQcyi+CijYYIJb/prKFKoxyPaAS9b4hNo+Bo=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=bnP8C995fXdr31uoviZO1uZB8O2xUdvhOWg6pbzfIlQbLj17uMUJOV9MWIBXVsAXj
 i7+0uS2wOYOyqW2j441uaFk5GoNUicdfT/Z8+CY7rqPXoSQD+KUwwKBQEX8xD4MC/a
 Jy0o8SFiiCgoGmAj+yAQsSKu1Fk7kdd32/+A2PdQ=
Authentication-Results: sas1-3cba3404b018.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RtM4jkst; Mon, 06 Jun 2022 10:27:55 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 06/11] iotests: refactor some common qmp result checks into
 generic pattern
Date: Mon,  6 Jun 2022 10:27:26 +0300
Message-Id: <20220606072731.878226-7-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606072731.878226-1-vsementsov@yandex-team.ru>
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
2.25.1


