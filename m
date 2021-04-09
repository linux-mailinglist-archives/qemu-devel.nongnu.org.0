Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A81BB359E5C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 14:09:08 +0200 (CEST)
Received: from localhost ([::1]:36658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUpwh-0001of-Nz
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 08:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsS-000873-OE
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lUpsO-0008H9-SM
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 08:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617969880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1srMCU2bYhO+BsWlK/xCgdMlVZmHB88CcU9bByF1iPo=;
 b=e48pTYTrkMSwv75g1H8j9RuU3Nco7BBoJdBW46cU2p23v5dAGay0UPsIaEkKBG0C5cNbg8
 mFZFM5HY2WgypkiAMveNdNFEt3YUxRtcRaaZYVgOmG+/qIv18MVFFwgt5P8gBEP6jkFYsk
 EukAaR8li6Otoa6mfW5/H+teAVtL0Bo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-mzFZdOegNa6256xBo88UXA-1; Fri, 09 Apr 2021 08:04:36 -0400
X-MC-Unique: mzFZdOegNa6256xBo88UXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F82E107ACCA;
 Fri,  9 Apr 2021 12:04:35 +0000 (UTC)
Received: from localhost (ovpn-114-67.ams2.redhat.com [10.36.114.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C9C25C1A1;
 Fri,  9 Apr 2021 12:04:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/4] iotests: Test completion immediately after drain
Date: Fri,  9 Apr 2021 14:04:22 +0200
Message-Id: <20210409120422.144040-6-mreitz@redhat.com>
In-Reply-To: <20210409120422.144040-1-mreitz@redhat.com>
References: <20210409120422.144040-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test what happens when you have multiple busy block jobs, drain all (via
an empty transaction), and immediately issue a block-job-complete on one
of the jobs.

Sometimes it will still be in STANDBY, in which case block-job-complete
used to fail.  It should not.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 .../tests/mirror-complete-after-drain         | 89 +++++++++++++++++++
 .../tests/mirror-complete-after-drain.out     | 14 +++
 2 files changed, 103 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/mirror-complete-after-drain
 create mode 100644 tests/qemu-iotests/tests/mirror-complete-after-drain.out

diff --git a/tests/qemu-iotests/tests/mirror-complete-after-drain b/tests/qemu-iotests/tests/mirror-complete-after-drain
new file mode 100755
index 0000000000..b096ffbcb4
--- /dev/null
+++ b/tests/qemu-iotests/tests/mirror-complete-after-drain
@@ -0,0 +1,89 @@
+#!/usr/bin/env python3
+# group: rw
+#
+# Tests for block-job-complete immediately after a drain
+#
+# Copyright (c) 2021 Red Hat, Inc.
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
+
+iotests.script_initialize(supported_fmts=['raw'])
+
+DISK_JOBS = 4
+NULL_JOBS = 1
+
+
+# We cannot auto-generate these in a loop because the files are
+# deleted when their scope ends
+src_imgs = iotests.file_path('src0', 'src1', 'src2', 'src3')
+dst_imgs = iotests.file_path('dst0', 'dst1', 'dst2', 'dst3')
+
+assert len(src_imgs) == DISK_JOBS
+assert len(dst_imgs) == DISK_JOBS
+
+
+for i in range(DISK_JOBS):
+    ret = iotests.qemu_img('create', '-f', iotests.imgfmt, src_imgs[i], '128M')
+    assert ret == 0
+
+    ret = iotests.qemu_img('create', '-f', iotests.imgfmt, dst_imgs[i], '128M')
+    assert ret == 0
+
+with iotests.VM() as vm:
+    vm.add_object('iothread,id=iothr0')
+    vm.add_device('virtio-scsi,iothread=iothr0')
+
+    for i in range(DISK_JOBS):
+        vm.add_blockdev(f'file,node-name=source-disk-{i},'
+                        f'filename={src_imgs[i]}')
+
+        vm.add_blockdev(f'file,node-name=target-disk-{i},'
+                        f'filename={dst_imgs[i]}')
+
+        vm.add_device(f'scsi-hd,id=device-disk-{i},drive=source-disk-{i}')
+
+    for i in range(NULL_JOBS):
+        vm.add_blockdev(f'null-co,node-name=source-null-{i},read-zeroes=on')
+        vm.add_blockdev(f'null-co,node-name=target-null-{i},read-zeroes=on')
+        vm.add_device(f'scsi-hd,id=device-null-{i},drive=source-null-{i}')
+
+    vm.launch()
+
+    for i in range(DISK_JOBS):
+        vm.qmp_log('blockdev-mirror',
+                   job_id=f'mirror-disk-{i}',
+                   device=f'source-disk-{i}',
+                   target=f'target-disk-{i}',
+                   sync='full',
+                   granularity=1048576,
+                   buf_size=(16 * 1048576))
+
+    for i in range(NULL_JOBS):
+        vm.qmp_log('blockdev-mirror',
+                   job_id=f'mirror-null-{i}',
+                   device=f'source-null-{i}',
+                   target=f'target-null-{i}',
+                   sync='full')
+
+    for i in range(DISK_JOBS + NULL_JOBS):
+        vm.event_wait('BLOCK_JOB_READY')
+
+    for i in range(DISK_JOBS):
+        vm.hmp(f'qemu-io -d device-disk-{i} "write 0 128M"')
+
+    vm.qmp_log('transaction', actions=[])
+    vm.qmp_log('block-job-complete', device='mirror-null-0')
diff --git a/tests/qemu-iotests/tests/mirror-complete-after-drain.out b/tests/qemu-iotests/tests/mirror-complete-after-drain.out
new file mode 100644
index 0000000000..4d9d0529fe
--- /dev/null
+++ b/tests/qemu-iotests/tests/mirror-complete-after-drain.out
@@ -0,0 +1,14 @@
+{"execute": "blockdev-mirror", "arguments": {"buf-size": 16777216, "device": "source-disk-0", "granularity": 1048576, "job-id": "mirror-disk-0", "sync": "full", "target": "target-disk-0"}}
+{"return": {}}
+{"execute": "blockdev-mirror", "arguments": {"buf-size": 16777216, "device": "source-disk-1", "granularity": 1048576, "job-id": "mirror-disk-1", "sync": "full", "target": "target-disk-1"}}
+{"return": {}}
+{"execute": "blockdev-mirror", "arguments": {"buf-size": 16777216, "device": "source-disk-2", "granularity": 1048576, "job-id": "mirror-disk-2", "sync": "full", "target": "target-disk-2"}}
+{"return": {}}
+{"execute": "blockdev-mirror", "arguments": {"buf-size": 16777216, "device": "source-disk-3", "granularity": 1048576, "job-id": "mirror-disk-3", "sync": "full", "target": "target-disk-3"}}
+{"return": {}}
+{"execute": "blockdev-mirror", "arguments": {"device": "source-null-0", "job-id": "mirror-null-0", "sync": "full", "target": "target-null-0"}}
+{"return": {}}
+{"execute": "transaction", "arguments": {"actions": []}}
+{"return": {}}
+{"execute": "block-job-complete", "arguments": {"device": "mirror-null-0"}}
+{"return": {}}
-- 
2.29.2


