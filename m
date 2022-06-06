Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32653E170
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 09:47:56 +0200 (CEST)
Received: from localhost ([::1]:53930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ny7St-00037I-H1
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 03:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79h-0005Lu-SF; Mon, 06 Jun 2022 03:28:05 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:49314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ny79f-0002Yt-Fq; Mon, 06 Jun 2022 03:28:05 -0400
Received: from sas1-9c28cd37d27b.qloud-c.yandex.net
 (sas1-9c28cd37d27b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:309b:0:640:9c28:cd37])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id D52FF2E0E7E;
 Mon,  6 Jun 2022 10:27:54 +0300 (MSK)
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net [2a02:6b8:c08:bd1e:0:640:7470:3316])
 by sas1-9c28cd37d27b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 5oOtP7cLcT-RsKC8iL7; Mon, 06 Jun 2022 10:27:54 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1654500474; bh=Edut+AY2hvP7GrOcHq58wFMVjd21GtAeRlMGzAmi0dE=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=cElV0iVhB5dovHhuI8UvBw9m78W3d48coNA+OEhWalR19gdNG5TE/k6znYrbJEkf9
 tnJhRPFCsA0gIgg1J3cnte6dIdzTA0Q6V/t84qnih9sIsn6gGu4kmWsHWr+a1Imx+e
 vBUZDaYKJtcczaOBV855o/goSO5Q9AqgTPoU86cQ=
Authentication-Results: sas1-9c28cd37d27b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b6b6::1:2c])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 Y8SDrjDjAj-RrM4QNJR; Mon, 06 Jun 2022 10:27:54 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 jsnow@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v2 05/11] iotests: add some missed checks of qmp result
Date: Mon,  6 Jun 2022 10:27:25 +0300
Message-Id: <20220606072731.878226-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220606072731.878226-1-vsementsov@yandex-team.ru>
References: <20220606072731.878226-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/041                        | 1 +
 tests/qemu-iotests/151                        | 1 +
 tests/qemu-iotests/152                        | 2 ++
 tests/qemu-iotests/tests/migrate-bitmaps-test | 2 ++
 4 files changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/041 b/tests/qemu-iotests/041
index 8429958bf0..4d7a829b65 100755
--- a/tests/qemu-iotests/041
+++ b/tests/qemu-iotests/041
@@ -1087,6 +1087,7 @@ class TestRepairQuorum(iotests.QMPTestCase):
         result = self.vm.qmp('blockdev-snapshot-sync', node_name='img1',
                              snapshot_file=quorum_snapshot_file,
                              snapshot_node_name="snap1");
+        self.assert_qmp(result, 'return', {})
 
         result = self.vm.qmp('drive-mirror', job_id='job0', device='quorum0',
                              sync='full', node_name='repair0', replaces="img1",
diff --git a/tests/qemu-iotests/151 b/tests/qemu-iotests/151
index 93d14193d0..c017e0c7e2 100755
--- a/tests/qemu-iotests/151
+++ b/tests/qemu-iotests/151
@@ -155,6 +155,7 @@ class TestActiveMirror(iotests.QMPTestCase):
                              sync='full',
                              copy_mode='write-blocking',
                              speed=1)
+        self.assert_qmp(result, 'return', {})
 
         self.vm.hmp_qemu_io('source', 'break write_aio A')
         self.vm.hmp_qemu_io('source', 'aio_write 0 1M')  # 1
diff --git a/tests/qemu-iotests/152 b/tests/qemu-iotests/152
index 4e179c340f..b73a0d08a2 100755
--- a/tests/qemu-iotests/152
+++ b/tests/qemu-iotests/152
@@ -43,6 +43,7 @@ class TestUnaligned(iotests.QMPTestCase):
     def test_unaligned(self):
         result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
                              granularity=65536, target=target_img)
+        self.assert_qmp(result, 'return', {})
         self.complete_and_wait()
         self.vm.shutdown()
         self.assertEqual(iotests.image_size(test_img), iotests.image_size(target_img),
@@ -51,6 +52,7 @@ class TestUnaligned(iotests.QMPTestCase):
     def test_unaligned_with_update(self):
         result = self.vm.qmp('drive-mirror', device='drive0', sync='full',
                              granularity=65536, target=target_img)
+        self.assert_qmp(result, 'return', {})
         self.wait_ready()
         self.vm.hmp_qemu_io('drive0', 'write 0 512')
         self.complete_and_wait(wait_ready=False)
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-test b/tests/qemu-iotests/tests/migrate-bitmaps-test
index 59f3357580..8668caae1e 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-test
@@ -101,6 +101,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         sha256 = get_bitmap_hash(self.vm_a)
 
         result = self.vm_a.qmp('migrate', uri=mig_cmd)
+        self.assert_qmp(result, 'return', {})
         while True:
             event = self.vm_a.event_wait('MIGRATION')
             if event['data']['status'] == 'completed':
@@ -176,6 +177,7 @@ class TestDirtyBitmapMigration(iotests.QMPTestCase):
         self.assert_qmp(result, 'return', {})
 
         result = self.vm_a.qmp('migrate', uri=mig_cmd)
+        self.assert_qmp(result, 'return', {})
         while True:
             event = self.vm_a.event_wait('MIGRATION')
             if event['data']['status'] == 'completed':
-- 
2.25.1


