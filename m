Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1224F689A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 20:11:49 +0200 (CEST)
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncA8C-00046Y-0A
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 14:11:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA5E-0000OS-Aa
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:44 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:38400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1ncA58-0001xq-EB
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 14:08:41 -0400
Received: by mail-lf1-x136.google.com with SMTP id b21so5490957lfb.5
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 11:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rJRsr0n/uu+BAoATVvTtIWzH8Hkbp0PXJYDRy4MnElY=;
 b=hPEmyY2Ul2xSbKfx62i/US4tKCwChfc+OtOD8Dg7bds8mUnEIU9b7pHggG8U+DQJAR
 q40tk3DL5YWgf/xIJuB519yT4xRN2U4ZYijOHkmWvFzL65eJmrOZrZeUYyB7K9DNXXPQ
 4xRr7oaiz6bQ85zyuS/8CHuM7ifDA65wKkizBunkOjBPJaKsEd7R88Xg5I2lwNrafeYJ
 G1c9Q+3Ze+R25r16AAKUJ/g9WO9q4OvGTsLWEsGyAI0GrQYSvOTxgbdT1tfCxcXVgvRN
 uvr80sdKNeM53C5eCmToac2hZP340iWV6F71ru16AGHvoBOMswj6Co76e93+aXYf3CB8
 O6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rJRsr0n/uu+BAoATVvTtIWzH8Hkbp0PXJYDRy4MnElY=;
 b=uya9U3INl5XbJFsh9JpyEdiTKa7EJMUh+62Gk2cakX6XeyKAK4r17B3HRDAdhjyJNR
 mZlK3i1qUCchTk69wLhd2Q7IugHrUAzz6Z8qbbbhGwFykEy/VcC/iPSsVU+Li1PHADxc
 7LkmkYPTe/PhEie21z77rv5BGRUTM4SBHlMEL89Yt3iCpzn1EdyPQBLRGUkOcS9hI4Ru
 6Elfy2K3rC0Zsry2EB7nfHH1uOwj/179jZIsP35AG760+nD8fn1C/Ate4k4A7IsWqeww
 paSaYcFD81mG8bhatirRF+q7OW3wG0c2Wn0X8qCr5W9m+Ji6ZBGWRlhKz3GFBxbv6BFU
 tl8A==
X-Gm-Message-State: AOAM530Eks9SQSm+VNKz4eY2wg/48Ri05BXutlVCbxDcE8XTkHk+jr3C
 wgqL11v9ffUnSziRe/pdvVe84Q==
X-Google-Smtp-Source: ABdhPJyJ4QCNU8+EcVtbjTNM1NbUY0b4X6WhWu3bJ+1aoIvDIWAigrCP2X1WfqHQK+hmbFnqQekvGg==
X-Received: by 2002:ac2:4250:0:b0:44a:ff88:3795 with SMTP id
 m16-20020ac24250000000b0044aff883795mr6848801lfl.384.1649268516748; 
 Wed, 06 Apr 2022 11:08:36 -0700 (PDT)
Received: from fedora.. ([185.215.60.161]) by smtp.gmail.com with ESMTPSA id
 a20-20020a194f54000000b0044a9afab7e7sm1904321lfk.290.2022.04.06.11.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 11:08:36 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/7] iotests: add copy-before-write: on-cbw-error tests
Date: Wed,  6 Apr 2022 21:07:57 +0300
Message-Id: <20220406180801.374844-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406180801.374844-1-vsementsov@openvz.org>
References: <20220406180801.374844-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x136.google.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/tests/copy-before-write    | 128 ++++++++++++++++++
 .../qemu-iotests/tests/copy-before-write.out  |   5 +
 2 files changed, 133 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/copy-before-write
 create mode 100644 tests/qemu-iotests/tests/copy-before-write.out

diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
new file mode 100755
index 0000000000..a32608f597
--- /dev/null
+++ b/tests/qemu-iotests/tests/copy-before-write
@@ -0,0 +1,128 @@
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
+        self.vm = iotests.VM()
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
+        result = self.vm.hmp_qemu_io('cbw', 'write 0 1M')
+        self.assert_qmp(result, 'return', '')
+
+        result = self.vm.hmp_qemu_io('access', 'read 0 1M')
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


