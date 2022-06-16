Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0CD54DF6F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:48:30 +0200 (CEST)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1n37-0006Zs-9g
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:48:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mjk-0001ju-I5
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:28 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:46684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mji-0001tz-2W
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:28:27 -0400
Received: by mail-lj1-x22a.google.com with SMTP id l18so979852lje.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7QiRPB+DwgPdQ5tbpC7RSf9cTa8Nua9jBz5J8RJizgs=;
 b=WK0cgAOG7m1jo6wcRVt2ECYthCET1Sy9tzZorHKV8x+8DMLbJh2KwoAjO8AzojWGwM
 fUvS+LB3raOLscHwAXrgI0+Ovurnq1XpfAunZ5zoxrx71KD2NSKGuJJtd5WRKThVYGnD
 L00k9rXDgxyOef47nwKzXZaVFfPVg7OR25H1PcF6iGqZKklbMeLdRpb1+LgmKIkOQ3PE
 lh3YFsTFrDFULZIccHN+axeY6MMQLopxjJcqkNIbC5UuUFVS/zu90+hNfTDyJELYpLLr
 //eI/fmfV0aCubPcDI0bZ+k4tm3S7yozFAa8ORx1Ris6sS3lDXWZ/XoohLMxRhQxu2y1
 9Tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7QiRPB+DwgPdQ5tbpC7RSf9cTa8Nua9jBz5J8RJizgs=;
 b=i1zvizQrRfFZXAc6a+y4Y9i92eGdWX6MINxfAOYi0Jr1Bv2Ims5NLnkO8OEq8AAxEO
 nSeqtjm+kbVoU0R7me7GjKChBGHvGQXK+DnOrWV+jDhaDRdTfqKwq6AXDcqPqV9fqY90
 1HAZvyJ9o9hLByZt3rwSxZcx8+yAa9PQPqUWXnmuHeohnmwoe4xHJN5u1We3wxBp5LWW
 9eV7ZjgOBowKbElmNDp6ZRxMqTmqjNusqeBdnIFe6BOrC5n+CH6vI087fuNKOgH8jb5q
 MgZPwuQYUdVxVseMQywxj7Is2l7qx0BlB1iIb1eZPnZlpdIdaA5naC35/oAphcM14plM
 c7+w==
X-Gm-Message-State: AJIora+tt2D61yuePO1v9OSropfVMnIy4T16kesxkcNz4sv1OVeBrSmg
 OdjOHJj5r+/avW0QcxWG+o3KTNS4y8PahJoj
X-Google-Smtp-Source: AGRyM1sWpAUJPhJ2dFltnoqhCZnW/ZnOwvQxiJK0Tl9gwUDI7HRGPgWL6GJlnYt1UBWKg5Pw63eihg==
X-Received: by 2002:a2e:881a:0:b0:255:7c2c:46d8 with SMTP id
 x26-20020a2e881a000000b002557c2c46d8mr2161717ljh.364.1655375304355; 
 Thu, 16 Jun 2022 03:28:24 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a199158000000b0047255d21128sm182581lfj.87.2022.06.16.03.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:28:23 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH v3 08/17] migration: Test for RAM and vmstate parts
Date: Thu, 16 Jun 2022 13:28:02 +0300
Message-Id: <20220616102811.219007-9-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102811.219007-1-nikita.lapshin@openvz.org>
References: <20220616102811.219007-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x22a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Lapshin <nikita.lapshin@openvz.org>

All other parts works just like existed capabilities. Thus there is
no need to make new tests. Though RAM and vmstate are new so here
is new test for that parts.

Signed-off-by: Nikita Lapshin <nikita.lapshin@openvz.org>
---
 .../tests/migrate-ram-stream-content-test     | 96 +++++++++++++++++++
 .../tests/migrate-ram-stream-content-test.out |  5 +
 2 files changed, 101 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migrate-ram-stream-content-test
 create mode 100644 tests/qemu-iotests/tests/migrate-ram-stream-content-test.out

diff --git a/tests/qemu-iotests/tests/migrate-ram-stream-content-test b/tests/qemu-iotests/tests/migrate-ram-stream-content-test
new file mode 100755
index 0000000000..2855ca4a64
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-ram-stream-content-test
@@ -0,0 +1,96 @@
+#!/usr/bin/env python3
+# group: rw migration
+#
+# Tests for 'no-ram' and 'ram-only' capabilities
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
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
+import json
+import subprocess
+import iotests
+
+img = os.path.join(iotests.test_dir, 'disk.img')
+
+class TestRamCapabilities(iotests.QMPTestCase):
+    def setUp(self):
+        iotests.qemu_img('create', '-f', iotests.imgfmt, img, '10M')
+        self.vm = iotests.VM()
+        self.vm.launch()
+        self.vm.qmp('migrate-set-capabilities', capabilities=[
+            {
+                'capability': 'events',
+                'state': True
+            }
+        ])
+
+    def tearDown(self):
+        self.vm.shutdown()
+        os.remove(img)
+
+    def check_ram_only(self, output):
+        str_json = output.decode()
+        json_obj = json.loads(str_json)
+
+        success = False
+        for key in json_obj:
+            self.assertTrue("ram" in key)
+            success = True
+        self.assertTrue(success)
+
+    def run_migration(self, no_ram, tmp_stream):
+        if no_ram:
+            output = self.vm.qmp('migrate-set-parameters',
+                    stream_content_list = ['vmstate'])
+        else:
+            self.vm.qmp('migrate-set-parameters',
+                    stream_content_list = ['ram'])
+
+        self.vm.qmp('migrate', uri='exec:cat>' + tmp_stream)
+
+        while True:
+            event = self.vm.event_wait('MIGRATION')
+
+            if event['data']['status'] == 'completed':
+                break
+
+
+    def test_no_ram(self):
+        with iotests.FilePath('tmp_stream') as tmp_stream:
+            self.run_migration(True, tmp_stream)
+            output = subprocess.run(
+                ['../../../scripts/analyze-migration.py', '-f', tmp_stream],
+                stdout=subprocess.PIPE,
+                stderr=subprocess.STDOUT,
+                check=False).stdout
+
+            self.assertFalse('ram' in output.decode())
+
+    def test_ram_only(self):
+        with iotests.FilePath('tmp_stream') as tmp_stream:
+            self.run_migration(False, tmp_stream)
+            output = subprocess.run(
+                ['../../../scripts/analyze-migration.py', '-f', tmp_stream,
+                    '--ram-only'],
+                stdout=subprocess.PIPE,
+                stderr=subprocess.STDOUT,
+                check=False).stdout
+
+            self.check_ram_only(output)
+
+if __name__ == '__main__':
+    iotests.main(supported_protocols=['file'])
diff --git a/tests/qemu-iotests/tests/migrate-ram-stream-content-test.out b/tests/qemu-iotests/tests/migrate-ram-stream-content-test.out
new file mode 100644
index 0000000000..fbc63e62f8
--- /dev/null
+++ b/tests/qemu-iotests/tests/migrate-ram-stream-content-test.out
@@ -0,0 +1,5 @@
+..
+----------------------------------------------------------------------
+Ran 2 tests
+
+OK
-- 
2.31.1


