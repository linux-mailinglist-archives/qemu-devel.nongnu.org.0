Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA36FDDCB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 14:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwiru-0001wZ-8h; Wed, 10 May 2023 08:24:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwirr-0001l6-I5
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:24:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pwirp-0008Et-Pk
 for qemu-devel@nongnu.org; Wed, 10 May 2023 08:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683721465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=16elKj0ExiVWpz4Ea0AN5VTPrU5DO9G+aBqGtGoJ+VA=;
 b=RLnYtHuCw/cPDyVV8xSOUEfJhAJrPt7RRrYzxaJCmBD2nCHyaYsNTUSSxpzTeCTwYTK7N7
 Mcz/UEiY9A02zxPkrrJ4GRrXiXATSAMA3XiXZplC3WmBhBfafdVHdSXVnx+dJmXX1ExcBS
 8BgRUFjg20NZaSFy0/V9D1rijpYhS7g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-kymeAUKBMmqpck9koWLoAQ-1; Wed, 10 May 2023 08:21:47 -0400
X-MC-Unique: kymeAUKBMmqpck9koWLoAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D8C62812959;
 Wed, 10 May 2023 12:21:47 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B30A218EC1;
 Wed, 10 May 2023 12:21:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 11/28] iotests: Test resizing image attached to an iothread
Date: Wed, 10 May 2023 14:20:54 +0200
Message-Id: <20230510122111.46566-12-kwolf@redhat.com>
In-Reply-To: <20230510122111.46566-1-kwolf@redhat.com>
References: <20230510122111.46566-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This tests that trying to resize an image with QMP block_resize doesn't
hang or otherwise fail when the image is attached to a device running in
an iothread.

This is a regression test for the recent fix that changed
qmp_block_resize, which is a coroutine based QMP handler, to avoid
calling no_coroutine_fns directly.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230509134133.373408-1-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/iothreads-resize     | 71 +++++++++++++++++++
 tests/qemu-iotests/tests/iothreads-resize.out | 11 +++
 2 files changed, 82 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/iothreads-resize
 create mode 100644 tests/qemu-iotests/tests/iothreads-resize.out

diff --git a/tests/qemu-iotests/tests/iothreads-resize b/tests/qemu-iotests/tests/iothreads-resize
new file mode 100755
index 0000000000..36e4598c62
--- /dev/null
+++ b/tests/qemu-iotests/tests/iothreads-resize
@@ -0,0 +1,71 @@
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
+# Resizing images is only supported by a few block drivers
+_supported_fmt raw qcow2 qed
+_supported_proto file
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
+    -drive if=none,format=$IMGFMT,file="$TEST_IMG",node-name=img \
+    -object iothread,id=t0 \
+    -device virtio-scsi-pci,iothread=t0 \
+    -device scsi-hd,drive=none0 \
+    -qmp stdio \
+    | _filter_qmp
+
+_img_info | _filter_img_info
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/iothreads-resize.out b/tests/qemu-iotests/tests/iothreads-resize.out
new file mode 100644
index 0000000000..2ca5a9d964
--- /dev/null
+++ b/tests/qemu-iotests/tests/iothreads-resize.out
@@ -0,0 +1,11 @@
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
+*** done
-- 
2.40.1


