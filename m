Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 875DE6FC467
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 13:00:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwL4c-0000Mk-N3; Tue, 09 May 2023 07:00:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwL4J-0000Ip-Rl
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:59:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwL4I-0001JU-50
 for qemu-devel@nongnu.org; Tue, 09 May 2023 06:59:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683629981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tzmtYKY/NzadbeKyBG4AIVydtXRUS/seDtgBX1wegU0=;
 b=WupXgLhYOKsRIfhDm7EVPMTSFFoefec+9D4mCGyHvIqyzdtyBFlFFd9JhvGrnzJqITTGY3
 UNL+jIQImGcw2ZH/pDwtgyhAmHDFnvn93c0WUQTSa9+lEyc+Rg6Z6EOCMnXLhMx8G0vhj2
 N3Foc6HyqTU2QrE4zZ5rrdcOmo6wyeY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-s74Dy5RpN1aZVXI8tPGa9Q-1; Tue, 09 May 2023 06:59:40 -0400
X-MC-Unique: s74Dy5RpN1aZVXI8tPGa9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6E6C8026E8;
 Tue,  9 May 2023 10:59:39 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3304492C13;
 Tue,  9 May 2023 10:59:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	eblake@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH] iotests: Test resizing image attached to an iothread
Date: Tue,  9 May 2023 12:59:31 +0200
Message-Id: <20230509105931.177062-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This tests that trying to resize an image with QMP block_resize doesn't
hang or otherwise fail when the image is attached to a device running in
an iothread.

This is a regression test for the recent fix that changed
qmp_block_resize, which is a coroutine based QMP handler, to avoid
calling no_coroutine_fns directly.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/iothreads-resize     | 70 +++++++++++++++++++
 tests/qemu-iotests/tests/iothreads-resize.out | 12 ++++
 2 files changed, 82 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/iothreads-resize
 create mode 100644 tests/qemu-iotests/tests/iothreads-resize.out

diff --git a/tests/qemu-iotests/tests/iothreads-resize b/tests/qemu-iotests/tests/iothreads-resize
new file mode 100755
index 0000000000..fc710d4988
--- /dev/null
+++ b/tests/qemu-iotests/tests/iothreads-resize
@@ -0,0 +1,70 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Test resizing an image that is attached to a separate iothread
+#
+# Copyright (C) 2023 Red Hat, Inc.
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
+# creator
+owner=kwolf@redhat.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1 # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+cd ..
+. ./common.rc
+. ./common.filter
+
+_supported_fmt generic
+_supported_proto generic
+_require_devices virtio-scsi-pci
+
+size=64M
+_make_test_img $size
+
+qmp() {
+cat <<EOF
+{"execute":"qmp_capabilities"}
+{'execute': 'block_resize',
+ 'arguments': {'node-name': 'img', 'size': 134217728}}
+{"execute":"quit"}
+EOF
+}
+
+qmp | $QEMU -S -display none \
+    -drive if=none,file="$TEST_IMG",node-name=img \
+    -object iothread,id=t0 \
+    -device virtio-scsi-pci,iothread=t0 \
+    -device scsi-hd,drive=none0 \
+    -qmp stdio \
+    | _filter_qmp
+
+_img_info
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/iothreads-resize.out b/tests/qemu-iotests/tests/iothreads-resize.out
new file mode 100644
index 0000000000..91275f13cd
--- /dev/null
+++ b/tests/qemu-iotests/tests/iothreads-resize.out
@@ -0,0 +1,12 @@
+QA output created by iothreads-resize
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+QMP_VERSION
+{"return": {}}
+{"return": {}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+image: TEST_DIR/t.IMGFMT
+file format: IMGFMT
+virtual size: 128 MiB (134217728 bytes)
+cluster_size: 65536
+*** done
-- 
2.40.1


