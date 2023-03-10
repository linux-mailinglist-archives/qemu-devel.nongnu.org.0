Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 954276B4FA2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 18:56:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pagy0-0003mj-DK; Fri, 10 Mar 2023 12:55:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagxx-0003ki-I3
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:55:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pagxv-0002pc-HN
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 12:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678470939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vr4/OFozqoVc1HwVpsW/PlPneWCNhbJZRR4egYp+MbM=;
 b=Csb/HI+eHJE1O1hwPzF+/JzoCYgqi/xXz/c7nh9Z3/tWoNbBoYDI2zVMvBVdHfB6WYcwNh
 wimyU7Rv0Ly/r1dizayrZkwQAETUa1tt50VlmOpqDyAr/qJIwG+xuiMGIiE4iWCIrXWoCD
 LrJIaLcJGYxiXm02vFf4DgAkBxjLTAE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-1Kg9ZHSCOOqyBb9KHRAgQQ-1; Fri, 10 Mar 2023 12:55:35 -0500
X-MC-Unique: 1Kg9ZHSCOOqyBb9KHRAgQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FD3E811E9C;
 Fri, 10 Mar 2023 17:55:34 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC65C1121318;
 Fri, 10 Mar 2023 17:55:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 2/3] iotests/308: Add test for 'write -zu'
Date: Fri, 10 Mar 2023 18:55:28 +0100
Message-Id: <20230310175529.240379-3-kwolf@redhat.com>
In-Reply-To: <20230310175529.240379-1-kwolf@redhat.com>
References: <20230310175529.240379-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Hanna Czenczek <hreitz@redhat.com>

Try writing zeroes to a FUSE export while allowing the area to be
unmapped; block/file-posix.c generally implements writing zeroes with
BDRV_REQ_MAY_UNMAP ('write -zu') by calling fallocate(PUNCH_HOLE).  This
used to lead to a blk_pdiscard() in the FUSE export, which may or may
not lead to the area being zeroed.  HEAD^ fixed this to use
blk_pwrite_zeroes() instead (again with BDRV_REQ_MAY_UNMAP), so verify
that running `qemu-io 'write -zu'` on a FUSE exports always results in
zeroes being written.

Signed-off-by: Hanna Czenczek <hreitz@redhat.com>
Message-Id: <20230227104725.33511-3-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/308     | 43 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/308.out | 35 +++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index 09275e9a10..de12b2b1b9 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -370,6 +370,49 @@ echo
 echo '=== Compare copy with original ==='
 
 $QEMU_IMG compare -f raw -F $IMGFMT "$COPIED_IMG" "$TEST_IMG"
+_cleanup_test_img
+
+echo
+echo '=== Writing zeroes while unmapping ==='
+# Regression test for https://gitlab.com/qemu-project/qemu/-/issues/1507
+_make_test_img 64M
+$QEMU_IO -c 'write -s /dev/urandom 0 64M' "$TEST_IMG" | _filter_qemu_io
+
+_launch_qemu
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'qmp_capabilities'}" \
+    'return'
+
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'blockdev-add',
+      'arguments': {
+          'driver': '$IMGFMT',
+          'node-name': 'node-format',
+          'file': {
+              'driver': 'file',
+              'filename': '$TEST_IMG'
+          }
+      } }" \
+    'return'
+
+fuse_export_add 'export' "'mountpoint': '$EXT_MP', 'writable': true"
+
+# Try writing zeroes by unmapping
+$QEMU_IO -f raw -c 'write -zu 0 64M' "$EXT_MP" | _filter_qemu_io
+
+# Check the result
+$QEMU_IO -f raw -c 'read -P 0 0 64M' "$EXT_MP" | _filter_qemu_io
+
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'quit'}" \
+    'return'
+
+wait=yes _cleanup_qemu
+
+# Check the original image
+$QEMU_IO -c 'read -P 0 0 64M' "$TEST_IMG" | _filter_qemu_io
+
+_cleanup_test_img
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
index e4467a10cf..d5767133b1 100644
--- a/tests/qemu-iotests/308.out
+++ b/tests/qemu-iotests/308.out
@@ -171,4 +171,39 @@ OK: Post-truncate image size is as expected
 
 === Compare copy with original ===
 Images are identical.
+
+=== Writing zeroes while unmapping ===
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+wrote 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'blockdev-add',
+      'arguments': {
+          'driver': 'IMGFMT',
+          'node-name': 'node-format',
+          'file': {
+              'driver': 'file',
+              'filename': 'TEST_DIR/t.IMGFMT'
+          }
+      } }
+{"return": {}}
+{'execute': 'block-export-add',
+          'arguments': {
+              'type': 'fuse',
+              'id': 'export',
+              'node-name': 'node-format',
+              'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
+          } }
+{"return": {}}
+wrote 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export"}}
+read 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.39.2


