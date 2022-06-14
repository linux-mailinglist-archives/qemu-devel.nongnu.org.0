Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3DE54AEB0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 12:47:26 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o144y-0008Be-UA
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 06:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nx-0001Km-7k; Tue, 14 Jun 2022 06:29:49 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1o13nk-0000kx-4H; Tue, 14 Jun 2022 06:29:48 -0400
Received: from sas2-6a1db1376cb6.qloud-c.yandex.net
 (sas2-6a1db1376cb6.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bb0f:0:640:6a1d:b137])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id F00092E1254;
 Tue, 14 Jun 2022 13:29:26 +0300 (MSK)
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net [2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by sas2-6a1db1376cb6.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 VcyXRmeIrl-TQKKFDc8; Tue, 14 Jun 2022 13:29:26 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655202566; bh=SwiJlobG+0rQwQYpRcsJoNuPh6uBHalLWo4dNYOk2RQ=;
 h=Message-Id:References:Date:Subject:In-Reply-To:Cc:To:From;
 b=HJxU/HyHRSqweJTa8bMyJom2ke5wExpeFHACfwdc+mNmfIus1eCwB9LFErmYvLLrJ
 EAZ7QtlsmuUIZhJfkkNlUXGrvJprMTgoEcEHqzXuzTZsprxMSKzy3XtwTMYLdr2MIt
 CE3zuvrYTYaxjc6F8gU1a6vM1ghk2TF3WAu25iH0=
Authentication-Results: sas2-6a1db1376cb6.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:a427::1:2e])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 15x97ivcvu-TPMm13Kr; Tue, 14 Jun 2022 13:29:26 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@yandex-team.ru, peter.maydell@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Subject: [PULL 07/10] iotests: copy-before-write: add cases for cbw-timeout
 option
Date: Tue, 14 Jun 2022 13:29:07 +0300
Message-Id: <20220614102910.1431380-8-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
References: <20220614102910.1431380-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Add two simple test-cases: timeout failure with
break-snapshot-on-cbw-error behavior and similar with
break-guest-write-on-cbw-error behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 tests/qemu-iotests/tests/copy-before-write    | 81 +++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |  4 +-
 2 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
index 6c7638965e..f01f26f01c 100755
--- a/tests/qemu-iotests/tests/copy-before-write
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -126,6 +126,87 @@ read 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 """)
 
+    def do_cbw_timeout(self, on_cbw_error):
+        result = self.vm.qmp('object-add', {
+            'qom-type': 'throttle-group',
+            'id': 'group0',
+            'limits': {'bps-write': 300 * 1024}
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'on-cbw-error': on_cbw_error,
+            'cbw-timeout': 1,
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': 'throttle',
+                'throttle-group': 'group0',
+                'file': {
+                    'driver': 'qcow2',
+                    'file': {
+                        'driver': 'file',
+                        'filename': temp_img
+                    }
+                }
+            }
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'access',
+            'driver': 'snapshot-access',
+            'file': 'cbw'
+        })
+        self.assert_qmp(result, 'return', {})
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io cbw "write 0 512K"')
+        self.assert_qmp(result, 'return', '')
+
+        # We need second write to trigger throttling
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io cbw "write 512K 512K"')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.qmp('human-monitor-command',
+                             command_line='qemu-io access "read 0 1M"')
+        self.assert_qmp(result, 'return', '')
+
+        self.vm.shutdown()
+        log = self.vm.get_log()
+        log = re.sub(r'^\[I \d+\.\d+\] OPENED\n', '', log)
+        log = re.sub(r'\[I \+\d+\.\d+\] CLOSED\n?$', '', log)
+        log = iotests.filter_qemu_io(log)
+        return log
+
+    def test_timeout_break_guest(self):
+        log = self.do_cbw_timeout('break-guest-write')
+        self.assertEqual(log, """\
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+write failed: Connection timed out
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+""")
+
+    def test_timeout_break_snapshot(self):
+        log = self.do_cbw_timeout('break-snapshot')
+        self.assertEqual(log, """\
+wrote 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 524288/524288 bytes at offset 524288
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read failed: Permission denied
+""")
+
 
 if __name__ == '__main__':
     iotests.main(supported_fmts=['qcow2'],
diff --git a/tests/qemu-iotests/tests/copy-before-write.out b/tests/qemu-iotests/tests/copy-before-write.out
index fbc63e62f8..89968f35d7 100644
--- a/tests/qemu-iotests/tests/copy-before-write.out
+++ b/tests/qemu-iotests/tests/copy-before-write.out
@@ -1,5 +1,5 @@
-..
+....
 ----------------------------------------------------------------------
-Ran 2 tests
+Ran 4 tests
 
 OK
-- 
2.25.1


