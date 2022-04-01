Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440E34EEA64
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:27:22 +0200 (CEST)
Received: from localhost ([::1]:53328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDYt-00085I-Hi
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:27:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRa-0000IA-D9
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:46 -0400
Received: from [2a00:1450:4864:20::136] (port=42609
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1naDRV-0006sx-3n
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:19:45 -0400
Received: by mail-lf1-x136.google.com with SMTP id d5so3716005lfj.9
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rpLiCSzJwgOLvt2u/fjZZnNkCVti5LYFLIM9A5wltYA=;
 b=4+aKUHrtHC3Lk0r2WohT5JxBybGdKBnVIvqsOenpSkZz3UqikOl7l9Sxpg+jLCqy3M
 T7uaaaXUvR3ROUl1EIf6qOp1nQs/6zNwGAjpo4Qe0z0iniJ8rQEp/3ts47oyz9fhYzOI
 ndYhPoY0pAb7Oe9LoGaVxA29sjblLXGqn1Jo84gTqy64pzoT7KPg+hHCEu47yCfs1CFU
 L7lbZaBPnhYRdVWGAQ6jMlStfI3o77zzIuCom1EwfiFl8W9ZLk6hWPMQbaGDEo1pzUaw
 +TttnJtdUxw5aat11Jr7Fbfk8XGMY5odesygrHxYT9F8kwYKtr7wSnYl9+t0WNEGOrJd
 r92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rpLiCSzJwgOLvt2u/fjZZnNkCVti5LYFLIM9A5wltYA=;
 b=q9jIlcfRN4jpEuqI0Bw8TMtCBdKxVg3IpjIEfymMD8rC9asGnawQBE2GDNOw8FJDEL
 469QZWUg/mL07nM5zpbcSJZ4IICHso2ZxyHFNGD/RSu6Gm6DWvo3mFyYeBzrfohPjnFa
 GwCVNOevxa6t+VJ8ZAm0k7+QrlWrnu1E7wXdA3KHczvR9+1HMhZjjbKtw+9i8FEfZehk
 1gOH/D/ZjTOdGwYiScLPVTy3/6RPfciXGYA6jQ6bY9m4rzsURrqv4TYbGkkuMbV07kIe
 +NZ/sEqcLRPt0+2GaEz0YUmd0HxC7i/3IFN0JlpbIhOiM/6XTz+1eHXejgcu4MXq+s2a
 yvNA==
X-Gm-Message-State: AOAM532sjEuyCJiUo293tWhvz+T97wM4PHp0SDqEBC/mKALMRETmbuBv
 /VCwRLIcr8CCGkJfn/jlU5LKF9Be+z7t1Q==
X-Google-Smtp-Source: ABdhPJzRXEKn2UbulbJNwCc2rTipRk0odOdAX0XZzacvI9X265jwDVatrJF+eJdyQ0csB7GyVKnGRA==
X-Received: by 2002:a05:6512:318a:b0:44a:be25:7082 with SMTP id
 i10-20020a056512318a00b0044abe257082mr9235154lfe.439.1648804776260; 
 Fri, 01 Apr 2022 02:19:36 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 d16-20020a2eb050000000b002461d8f365bsm155135ljl.38.2022.04.01.02.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 02:19:36 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v2 3/7] iotests: add copy-before-write: on-cbw-error tests
Date: Fri,  1 Apr 2022 12:19:16 +0300
Message-Id: <20220401091920.287612-4-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401091920.287612-1-vsementsov@openvz.org>
References: <20220401091920.287612-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x136.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


