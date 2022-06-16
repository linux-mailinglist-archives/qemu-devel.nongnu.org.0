Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1EF54DF3E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:37264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mtU-0002ho-UJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcD-0006vS-LU
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:42 -0400
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:36464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcB-0000Vd-RJ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:41 -0400
Received: by mail-lj1-x232.google.com with SMTP id h23so990848ljl.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7QiRPB+DwgPdQ5tbpC7RSf9cTa8Nua9jBz5J8RJizgs=;
 b=i4h78/bO4m+3cRgWpeMpcAk3PJk30omzF5vhIuhmogS03MKng4TBOcDx9cSRwtxslI
 CKV0zVvSv1WRijYI2qcTby3OZW2vN6tAXzuPKmk4YLCl6Kko2nVfc0DyK2PwZT6BDpyz
 hzimkwv8kGcga4hg16OTOWxiTQyJOLTJ8pvo76RxdaFi/T8+p9dIk516Pm+26mrG02Ai
 GuKdV0PS5noIx86dftB7uk5dsNBqVi7ZMeho29bcxKlcZ7xV1J0/JlWdB6zKAay5wIKZ
 2EA7CDmh+CCeZ5N9hP59DGbQsrdgaxTtmDyTHvFHM16RXZWdE4GSHeD4BhYru6dWLbij
 7ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7QiRPB+DwgPdQ5tbpC7RSf9cTa8Nua9jBz5J8RJizgs=;
 b=nTcNyRRXvS/1YyRT/TDnlEOBVZCEDXNyw8Cd+6joNp5lo2wropB1lDoq5Fl2pezMg7
 EyZh/VGVaQPvQjlHWIEVf/oWwKFsexBGBEu7+Qv+ZB/z0nzvLTNLUSIte9XsaU89L55+
 aD+zicEAee2Pa8KGJHUw5s6aZFMCoJYRif6Bjm5AxXs8HJDsQF7k+b4VlEpOCaeqa2Y/
 545BNnkRnRobwcaDfn+pHf9ZCRSRcgeFjNSJuk9Apz5Qg6H8xQ4UBU2222ALUvVlCRAk
 yG2izK73SVmWESXub0XBY6joiMRm2HioClYSrWs6AASZHZ5M2xCMrBNFSnbWuw/3XyYI
 V6NA==
X-Gm-Message-State: AJIora/WBXeVVNSpGWdhVnVvv7IAY0+ZsWV/U2EIBX+RiGZCKkscK9NR
 0atDTQ/n3dmrQXXPPKFL56PbVp2Rjxs7hJwV
X-Google-Smtp-Source: AGRyM1s4f45CqSWA3tNwbhgLaW3S6A7OjNFO8wKcZQ9kGoKqnM9pVaGzt5GPHE80XOkMW27x55JWJQ==
X-Received: by 2002:a2e:818e:0:b0:25a:4363:78b2 with SMTP id
 e14-20020a2e818e000000b0025a436378b2mr2093647ljg.31.1655374838629; 
 Thu, 16 Jun 2022 03:20:38 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:38 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 8/8] migration: Test for RAM and vmstate parts
Date: Thu, 16 Jun 2022 13:20:06 +0300
Message-Id: <20220616102006.218693-11-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220616102006.218693-1-nikita.lapshin@openvz.org>
References: <20220616102006.218693-1-nikita.lapshin@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x232.google.com
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


