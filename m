Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629EC4A8629
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:25:56 +0100 (CET)
Received: from localhost ([::1]:52236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd3a-0003vc-Uq
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:25:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFckE-0000UF-0v
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:05:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nFckA-00019K-Hm
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:05:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaStFba05ADGSunpJPD3N9h4KBnyf627CHacRGq/h+4=;
 b=ernD4ValsfWa1Fgu2C4zlK+1XxNfdMEQvKEJDitM+FPt/cxubkETsjJ3Nwwj8U66qBvWvl
 3dwIsj+BMVRDYjND1zMcxer1P1lizwdKd2GfN9FtTmCx67cpe2mmYwpYiZreDxeEsDC82F
 WbODISplQKoyxju73S13N8jHgk8JHUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-_juMBQu5NK-kFzWxBBW_XA-1; Thu, 03 Feb 2022 09:05:46 -0500
X-MC-Unique: _juMBQu5NK-kFzWxBBW_XA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A129B81CBF4;
 Thu,  3 Feb 2022 14:05:44 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C361086489;
 Thu,  3 Feb 2022 14:05:43 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests: Test blockdev-reopen with iothreads and
 throttling
Date: Thu,  3 Feb 2022 15:05:34 +0100
Message-Id: <20220203140534.36522-3-kwolf@redhat.com>
In-Reply-To: <20220203140534.36522-1-kwolf@redhat.com>
References: <20220203140534.36522-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@virtuozzo.com,
 qinwang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'throttle' block driver implements .bdrv_co_drain_end, so
blockdev-reopen will have to wait for it to complete in the polling
loop at the end of qmp_blockdev_reopen(). This makes AIO_WAIT_WHILE()
release the AioContext lock, which causes a crash if the lock hasn't
correctly been taken.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/245     | 36 +++++++++++++++++++++++++++++++++---
 tests/qemu-iotests/245.out |  4 ++--
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/245 b/tests/qemu-iotests/245
index 24ac43f70e..8cbed7821b 100755
--- a/tests/qemu-iotests/245
+++ b/tests/qemu-iotests/245
@@ -1138,12 +1138,13 @@ class TestBlockdevReopen(iotests.QMPTestCase):
         self.assertEqual(self.get_node('hd1'), None)
         self.assert_qmp(self.get_node('hd2'), 'ro', True)
 
-    def run_test_iothreads(self, iothread_a, iothread_b, errmsg = None):
-        opts = hd_opts(0)
+    def run_test_iothreads(self, iothread_a, iothread_b, errmsg = None,
+                           opts_a = None, opts_b = None):
+        opts = opts_a or hd_opts(0)
         result = self.vm.qmp('blockdev-add', conv_keys = False, **opts)
         self.assert_qmp(result, 'return', {})
 
-        opts2 = hd_opts(2)
+        opts2 = opts_b or hd_opts(2)
         result = self.vm.qmp('blockdev-add', conv_keys = False, **opts2)
         self.assert_qmp(result, 'return', {})
 
@@ -1194,6 +1195,35 @@ class TestBlockdevReopen(iotests.QMPTestCase):
     def test_iothreads_switch_overlay(self):
         self.run_test_iothreads('', 'iothread0')
 
+    def test_iothreads_with_throttling(self):
+        # Create a throttle-group object
+        opts = { 'qom-type': 'throttle-group', 'id': 'group0',
+                 'limits': { 'iops-total': 1000 } }
+        result = self.vm.qmp('object-add', conv_keys = False, **opts)
+        self.assert_qmp(result, 'return', {})
+
+        # Options with a throttle filter between format and protocol
+        opts = [
+            {
+                'driver': iotests.imgfmt,
+                'node-name': f'hd{idx}',
+                'file' : {
+                    'node-name': f'hd{idx}-throttle',
+                    'driver': 'throttle',
+                    'throttle-group': 'group0',
+                    'file': {
+                        'driver': 'file',
+                        'node-name': f'hd{idx}-file',
+                        'filename': hd_path[idx],
+                    },
+                },
+            }
+            for idx in (0, 2)
+        ]
+
+        self.run_test_iothreads('iothread0', 'iothread0', None,
+                                opts[0], opts[1])
+
 if __name__ == '__main__':
     iotests.activate_logging()
     iotests.main(supported_fmts=["qcow2"],
diff --git a/tests/qemu-iotests/245.out b/tests/qemu-iotests/245.out
index 4eced19294..a4e04a3266 100644
--- a/tests/qemu-iotests/245.out
+++ b/tests/qemu-iotests/245.out
@@ -17,8 +17,8 @@ read 1/1 bytes at offset 262152
 read 1/1 bytes at offset 262160
 1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
-...............
+................
 ----------------------------------------------------------------------
-Ran 25 tests
+Ran 26 tests
 
 OK
-- 
2.31.1


