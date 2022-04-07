Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A924F80AD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 15:35:44 +0200 (CEST)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncSIZ-0006KD-IW
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 09:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAr-00077r-16
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:45 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:43947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncSAn-0007tb-EI
 for qemu-devel@nongnu.org; Thu, 07 Apr 2022 09:27:44 -0400
Received: by mail-lf1-x12b.google.com with SMTP id x17so498965lfa.10
 for <qemu-devel@nongnu.org>; Thu, 07 Apr 2022 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Imy0BAVZtr4vdL6h6uvdSBror6j/vhyw0fg7WP9NYCI=;
 b=gVPyTeAn0IV3/AAyKFK6YY4jmWCNahbv7X1HHxVlvn2nWKBT0LdxqJCmrfzLnAdLKI
 kgTzi6XWt5ypRMyvWcO0IyhgNtxzdkNHeOugRPTVzoVEYLsuYha6vYagpr8G7Fn+Lgdg
 FzsiQHb4+6h3aPSWs87j+sIO4qA+R5/0NmvSV2hXUHGX7f5YaQEyC6zOkpqyVegtmgLw
 HzAbD3GTiavLlXGnN+anujr0HQ3Rq6SHFRBBne4esW9wTKfEXlev9wp+AKqklBEUzAV7
 AdGUOfSYLKw/bKNww4mQlnfLIAEwHi2u4IGOFFoJYh16j+uBlkHaC3nXx6wf2YCKv/MM
 cbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Imy0BAVZtr4vdL6h6uvdSBror6j/vhyw0fg7WP9NYCI=;
 b=r8ah70aB7c5odokOqLsYuPTNu4J96ErKeQa35HiOaPUGREMjIZVdZft1Ch1FdbKBSH
 5M3U5+nYZLpYUFsBRKPuc5/SfSuNMrU0XEBlZ+U04sVslJaUgibiWaW8HswEVod6yHbX
 Ki9NcUxCzrfn7iolqDTrt861MhmOYKJ+RYLak2qm5oXCIYOOiLpuJGFQMJolkjE//+Rn
 SmIW2LG20Dk6fBLKKXCfQYxC41Hv3K5D741jiDH4Fyf6QdhnSmnN+eMT20sZyrEg8ZmB
 JFRdFJeArIO7k7ESDBcs78HBeqoEkXAEVRxrhtXl6mRdiTG9Bynlc8zhYqt+zqWQJHM8
 zVgQ==
X-Gm-Message-State: AOAM530JzTuwBGzUCjrWl86eokFQadVM26Dw5t07PcysbYhs1i7NY7Sp
 VjZRd+V1vJUG+DehWFJSVFHYLQ==
X-Google-Smtp-Source: ABdhPJynKg0FarBq2ZMIV35n0J50P3yfr4u+yOdkmjE13iN9RXgLB27f8d3nm53IsSQOlC3s7G+hTA==
X-Received: by 2002:a05:6512:280d:b0:44f:5af8:1958 with SMTP id
 cf13-20020a056512280d00b0044f5af81958mr9315788lfb.533.1649338059734; 
 Thu, 07 Apr 2022 06:27:39 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 o15-20020a2e90cf000000b0024b0437ed8asm1929271ljg.7.2022.04.07.06.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 06:27:39 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v4 3/7] iotests: add copy-before-write: on-cbw-error tests
Date: Thu,  7 Apr 2022 16:27:22 +0300
Message-Id: <20220407132726.85114-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407132726.85114-1-vsementsov@openvz.org>
References: <20220407132726.85114-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, jsnow@redhat.com,
 qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 vsementsov@openvz.org, stefanha@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add tests for new option of copy-before-write filter: on-cbw-error.

Note that we use QEMUMachine instead of VM class, because in further
commit we'll want to use throttling which doesn't work with -accel
qtest used by VM.

We also touch pylintrc to not break iotest 297.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 tests/qemu-iotests/pylintrc                   |   5 +
 tests/qemu-iotests/tests/copy-before-write    | 132 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 3 files changed, 142 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

diff --git a/tests/qemu-iotests/pylintrc b/tests/qemu-iotests/pylintrc
index 32ab77b8bb..f4f823a991 100644
--- a/tests/qemu-iotests/pylintrc
+++ b/tests/qemu-iotests/pylintrc
@@ -51,3 +51,8 @@ notes=FIXME,
 
 # Maximum number of characters on a single line.
 max-line-length=79
+
+
+[SIMILARITIES]
+
+min-similarity-lines=6
diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
new file mode 100755
index 0000000000..6c7638965e
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -0,0 +1,132 @@
+#!/usr/bin/env python3
+# group: auto backup
+#
+# Copyright (c) 2022 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+import os
+import re
+
+from qemu.machine import QEMUMachine
+
+import iotests
+from iotests import qemu_img_create, qemu_io
+
+
+temp_img = os.path.join(iotests.test_dir, 'temp')
+source_img = os.path.join(iotests.test_dir, 'source')
+size = '1M'
+
+
+class TestCbwError(iotests.QMPTestCase):
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(temp_img)
+        os.remove(source_img)
+
+    def setUp(self):
+        qemu_img_create('-f', iotests.imgfmt, source_img, size)
+        qemu_img_create('-f', iotests.imgfmt, temp_img, size)
+        qemu_io('-c', 'write 0 1M', source_img)
+
+        self.vm = QEMUMachine(iotests.qemu_prog)
+        self.vm.launch()
+
+    def do_cbw_error(self, on_cbw_error):
+        result = self.vm.qmp('blockdev-add', {
+            'node-name': 'cbw',
+            'driver': 'copy-before-write',
+            'on-cbw-error': on_cbw_error,
+            'file': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'file',
+                    'filename': source_img,
+                }
+            },
+            'target': {
+                'driver': iotests.imgfmt,
+                'file': {
+                    'driver': 'blkdebug',
+                    'image': {
+                        'driver': 'file',
+                        'filename': temp_img
+                    },
+                    'inject-error': [
+                        {
+                            'event': 'write_aio',
+                            'errno': 5,
+                            'immediately': False,
+                            'once': True
+                        }
+                    ]
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
+                             command_line='qemu-io cbw "write 0 1M"')
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
+    def test_break_snapshot_on_cbw_error(self):
+        """break-snapshot behavior:
+        Guest write succeed, but further snapshot-read fails, as snapshot is
+        broken.
+        """
+        log = self.do_cbw_error('break-snapshot')
+
+        self.assertEqual(log, """\
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read failed: Permission denied
+""")
+
+    def test_break_guest_write_on_cbw_error(self):
+        """break-guest-write behavior:
+        Guest write fails, but snapshot-access continues working and further
+        snapshot-read succeeds.
+        """
+        log = self.do_cbw_error('break-guest-write')
+
+        self.assertEqual(log, """\
+write failed: Input/output error
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+""")
+
+
+if __name__ == '__main__':
+    iotests.main(supported_fmts=['qcow2'],
+                 supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/copy-before-write.out b/tests/qemu-iotests/tests/copy-before-write.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.35.1


