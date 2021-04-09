Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C55035A2FB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:23:33 +0200 (CEST)
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtuu-0000Ui-DB
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:23:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnr-0007gS-IH
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lUtnj-0003Lo-7M
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617984966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZSXeO8oZCR3bRAXAIlADUmJrrUFAZHUJqPzVBpHGJ3Y=;
 b=htp9XgFgu1YDBz2kfqw4A0XUawYXIPmKY1K7xr8WcV9z0ldgHAJ/vDY2pVr6fCFrEuoo/g
 1Mwc6nEK9IhbiHH1+KkfqOO8gcH1S94asDZoqTE7YSFywRgF1rMNwTYdj0NMAmfPBOU4WP
 xANCc9fARnvM3Y+2dcUlB5EU8j4yP3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-5TmMWFBgMzGuQNqnmOHCag-1; Fri, 09 Apr 2021 12:16:04 -0400
X-MC-Unique: 5TmMWFBgMzGuQNqnmOHCag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C40E188352C;
 Fri,  9 Apr 2021 16:16:03 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-63.ams2.redhat.com [10.36.115.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4385D6A1;
 Fri,  9 Apr 2021 16:16:02 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/10] iotests: add test for removing persistent bitmap from
 backing file
Date: Fri,  9 Apr 2021 18:15:42 +0200
Message-Id: <20210409161548.341297-5-kwolf@redhat.com>
In-Reply-To: <20210409161548.341297-1-kwolf@redhat.com>
References: <20210409161548.341297-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Just demonstrate one of x-blockdev-reopen usecases. We can't simply
remove persistent bitmap from RO node (for example from backing file),
as we need to remove it from the image too. So, we should reopen the
node first.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210401161522.8001-1-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .../tests/remove-bitmap-from-backing          | 69 +++++++++++++++++++
 .../tests/remove-bitmap-from-backing.out      |  6 ++
 2 files changed, 75 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/remove-bitmap-from-backing
 create mode 100644 tests/qemu-iotests/tests/remove-bitmap-from-backing.out

diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing b/tests/qemu-iotests/tests/remove-bitmap-from-backing
new file mode 100755
index 0000000000..0ea4c36507
--- /dev/null
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing
@@ -0,0 +1,69 @@
+#!/usr/bin/env python3
+#
+# Test removing persistent bitmap from backing
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
+import iotests
+from iotests import log, qemu_img_create, qemu_img, qemu_img_pipe
+
+iotests.script_initialize(supported_fmts=['qcow2'])
+
+top, base = iotests.file_path('top', 'base')
+size = '1M'
+
+assert qemu_img_create('-f', iotests.imgfmt, base, size) == 0
+assert qemu_img_create('-f', iotests.imgfmt, '-b', base,
+                       '-F', iotests.imgfmt, top, size) == 0
+
+assert qemu_img('bitmap', '--add', base, 'bitmap0') == 0
+# Just assert that our method of checking bitmaps in the image works.
+assert 'bitmaps' in qemu_img_pipe('info', base)
+
+vm = iotests.VM().add_drive(top, 'backing.node-name=base')
+vm.launch()
+
+log('Trying to remove persistent bitmap from r-o base node, should fail:')
+vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
+
+new_base_opts = {
+    'node-name': 'base',
+    'driver': 'qcow2',
+    'file': {
+        'driver': 'file',
+        'filename':  base
+    },
+    'read-only': False
+}
+
+# Don't want to bother with filtering qmp_log for reopen command
+result = vm.qmp('x-blockdev-reopen', **new_base_opts)
+if result != {'return': {}}:
+    log('Failed to reopen: ' + str(result))
+
+log('Remove persistent bitmap from base node reopened to RW:')
+vm.qmp_log('block-dirty-bitmap-remove', node='base', name='bitmap0')
+
+new_base_opts['read-only'] = True
+result = vm.qmp('x-blockdev-reopen', **new_base_opts)
+if result != {'return': {}}:
+    log('Failed to reopen: ' + str(result))
+
+vm.shutdown()
+
+if 'bitmaps' in qemu_img_pipe('info', base):
+    log('ERROR: Bitmap is still in the base image')
diff --git a/tests/qemu-iotests/tests/remove-bitmap-from-backing.out b/tests/qemu-iotests/tests/remove-bitmap-from-backing.out
new file mode 100644
index 0000000000..c28af82c75
--- /dev/null
+++ b/tests/qemu-iotests/tests/remove-bitmap-from-backing.out
@@ -0,0 +1,6 @@
+Trying to remove persistent bitmap from r-o base node, should fail:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "bitmap0", "node": "base"}}
+{"error": {"class": "GenericError", "desc": "Bitmap 'bitmap0' is readonly and cannot be modified"}}
+Remove persistent bitmap from base node reopened to RW:
+{"execute": "block-dirty-bitmap-remove", "arguments": {"name": "bitmap0", "node": "base"}}
+{"return": {}}
-- 
2.30.2


