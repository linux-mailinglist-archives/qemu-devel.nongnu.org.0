Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 129ED304039
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:27:12 +0100 (CET)
Received: from localhost ([::1]:47880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PJH-0006nC-2R
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:27:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDR-0008JU-5I
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDK-00063a-2Z
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwtEBlSE7/lm6OE/ImHvXcmg1QBGILkYMHIX7pf9mek=;
 b=YRMrmOCuLNNiJHkM24SPvKvh9fSwZaX5kekFsyiIt1NF7hR9MWip/Mnm3OWXodd7SuFtlv
 8g3jJrAjzg/UT0aERHhypUBC28jAnVgqrL3rBTo4U/AvJ3LDRie1Hnp8Hd0Gmi/QbHCqaQ
 jVeNLRo1eM2Sf6Eq+/NMqEAzWKdU3Mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-A7rqamWPOFuNUxOsAZ_4rw-1; Tue, 26 Jan 2021 09:20:57 -0500
X-MC-Unique: A7rqamWPOFuNUxOsAZ_4rw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD02B10AA00D;
 Tue, 26 Jan 2021 14:20:34 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7803F6F45C;
 Tue, 26 Jan 2021 14:20:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 07/53] iotests: add #310 to test bottom node in COR driver
Date: Tue, 26 Jan 2021 15:19:30 +0100
Message-Id: <20210126142016.806073-8-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

The test case #310 is similar to #216 by Max Reitz. The difference is
that the test #310 involves a bottom node to the COR filter driver.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
  [vsementsov: detach backing to test reads from top, limit to qcow2]
Message-Id: <20201216061703.70908-7-vsementsov@virtuozzo.com>
[mreitz: Add "# group:" line]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/310     | 117 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/310.out |  15 +++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 133 insertions(+)
 create mode 100755 tests/qemu-iotests/310
 create mode 100644 tests/qemu-iotests/310.out

diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
new file mode 100755
index 0000000000..9d9c928c4b
--- /dev/null
+++ b/tests/qemu-iotests/310
@@ -0,0 +1,117 @@
+#!/usr/bin/env python3
+# group: rw quick
+#
+# Copy-on-read tests using a COR filter with a bottom node
+#
+# Copyright (C) 2018 Red Hat, Inc.
+# Copyright (c) 2020 Virtuozzo International GmbH
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
+import iotests
+from iotests import log, qemu_img, qemu_io_silent
+
+# Need backing file support
+iotests.script_initialize(supported_fmts=['qcow2'],
+                          supported_platforms=['linux'])
+
+log('')
+log('=== Copy-on-read across nodes ===')
+log('')
+
+# This test is similar to the 216 one by Max Reitz <mreitz@redhat.com>
+# The difference is that this test case involves a bottom node to the
+# COR filter driver.
+
+with iotests.FilePath('base.img') as base_img_path, \
+     iotests.FilePath('mid.img') as mid_img_path, \
+     iotests.FilePath('top.img') as top_img_path, \
+     iotests.VM() as vm:
+
+    log('--- Setting up images ---')
+    log('')
+
+    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, '64M') == 0
+    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
+    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
+    assert qemu_img('create', '-f', iotests.imgfmt, '-b', base_img_path,
+                    '-F', iotests.imgfmt, mid_img_path) == 0
+    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 2M 1M') == 0
+    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 4M 1M') == 0
+    assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
+                    '-F', iotests.imgfmt, top_img_path) == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
+
+#      0 1 2 3 4
+# top    2
+# mid      3   3
+# base 1     1
+
+    log('Done')
+
+    log('')
+    log('--- Doing COR ---')
+    log('')
+
+    vm.launch()
+
+    log(vm.qmp('blockdev-add',
+               node_name='node0',
+               driver='copy-on-read',
+               bottom='node2',
+               file={
+                   'driver': iotests.imgfmt,
+                   'file': {
+                       'driver': 'file',
+                       'filename': top_img_path
+                   },
+                   'backing': {
+                       'node-name': 'node2',
+                       'driver': iotests.imgfmt,
+                       'file': {
+                           'driver': 'file',
+                           'filename': mid_img_path
+                       },
+                       'backing': {
+                           'driver': iotests.imgfmt,
+                           'file': {
+                               'driver': 'file',
+                               'filename': base_img_path
+                           }
+                       },
+                   }
+               }))
+
+    # Trigger COR
+    log(vm.qmp('human-monitor-command',
+               command_line='qemu-io node0 "read 0 5M"'))
+
+    vm.shutdown()
+
+    log('')
+    log('--- Checking COR result ---')
+    log('')
+
+    # Detach backing to check that we can read the data from the top level now
+    assert qemu_img('rebase', '-u', '-b', '', '-f', iotests.imgfmt,
+                    top_img_path) == 0
+
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 0 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 2 1M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 2M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 0 3M 1M') == 0
+    assert qemu_io_silent(top_img_path,  '-c', 'read -P 3 4M 1M') == 0
+
+    log('Done')
diff --git a/tests/qemu-iotests/310.out b/tests/qemu-iotests/310.out
new file mode 100644
index 0000000000..a70aa5cdae
--- /dev/null
+++ b/tests/qemu-iotests/310.out
@@ -0,0 +1,15 @@
+
+=== Copy-on-read across nodes ===
+
+--- Setting up images ---
+
+Done
+
+--- Doing COR ---
+
+{"return": {}}
+{"return": ""}
+
+--- Checking COR result ---
+
+Done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index bc5bc324fe..d4a3e36a9a 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -318,4 +318,5 @@
 307 rw quick export
 308 rw
 309 rw auto quick
+310 rw quick
 312 rw quick
-- 
2.29.2


