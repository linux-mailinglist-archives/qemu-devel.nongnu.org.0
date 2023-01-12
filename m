Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14303667EDB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 20:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG32g-0007cg-OC; Thu, 12 Jan 2023 14:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32e-0007bp-2M
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pG32c-0008FR-55
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 14:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673550909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4MDbCo26xsnOuPtADTJRyhBP684s/8bn9h+SiAIwujI=;
 b=GpYmFjy2fXfE/4Y6nEjlc5brfHx34iI4Mjo4/NQwRPDD8Cu9ykywL8BOg5uqrJU6FIA2OX
 JrMjWI1PzfM33+FQwOOrVcFeV6UcHqG9syzV/PkCEd3QRLPnIOv+eedko2jvyL2HsdNuB0
 djBb/K05Cb96Rze38CxRtF0vG+e+YwI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-TqrguxZRPWSyOJdd7VoCxg-1; Thu, 12 Jan 2023 14:15:05 -0500
X-MC-Unique: TqrguxZRPWSyOJdd7VoCxg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B4963806721;
 Thu, 12 Jan 2023 19:15:05 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4704B492C14;
 Thu, 12 Jan 2023 19:15:04 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, aesteve@redhat.com,
 nsoffer@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 4/4] qemu-iotests: Test qemu-img bitmap/commit exit code on
 error
Date: Thu, 12 Jan 2023 20:14:54 +0100
Message-Id: <20230112191454.169353-5-kwolf@redhat.com>
In-Reply-To: <20230112191454.169353-1-kwolf@redhat.com>
References: <20230112191454.169353-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

This tests that when an error happens while writing back bitmaps to the
image file in qcow2_inactivate(), 'qemu-img bitmap/commit' actually
return an error value in their exit code instead of making the operation
look successful to scripts.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .../qemu-iotests/tests/qemu-img-close-errors  | 95 +++++++++++++++++++
 .../tests/qemu-img-close-errors.out           | 23 +++++
 2 files changed, 118 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-close-errors
 create mode 100644 tests/qemu-iotests/tests/qemu-img-close-errors.out

diff --git a/tests/qemu-iotests/tests/qemu-img-close-errors b/tests/qemu-iotests/tests/qemu-img-close-errors
new file mode 100755
index 0000000000..662f726e5d
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-close-errors
@@ -0,0 +1,95 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Check that errors while closing the image, in particular writing back dirty
+# bitmaps, is correctly reported with a failing qemu-img exit code.
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
+seq="$(basename $0)"
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
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
+_supported_fmt qcow2
+_supported_proto generic
+
+size=1G
+
+# The error we are going to use is ENOSPC. Depending on how many bitmaps we
+# create in the backing file (and therefore increase the used up space), we get
+# failures in different places. With a low number, only merging the bitmap
+# fails, whereas with a higher number, already 'qemu-img commit' fails.
+for max_bitmap in 6 7; do
+    echo
+    echo "=== Test with $max_bitmap bitmaps ==="
+
+    TEST_IMG="$TEST_IMG.base" _make_test_img -q $size
+    for i in $(seq 1 $max_bitmap); do
+        $QEMU_IMG bitmap --add "$TEST_IMG.base" "stale-bitmap-$i"
+    done
+
+    # Simulate a block device of 128 MB by resizing the image file accordingly
+    # and then enforcing the size with the raw driver
+    truncate "$TEST_IMG.base" --size 128M
+    BASE_JSON='json:{
+        "driver": "qcow2",
+        "file": {
+            "driver": "raw",
+            "size": 134217728,
+            "file": {
+                "driver": "file",
+                "filename":"'"$TEST_IMG.base"'"
+            }
+        }
+    }'
+
+    _make_test_img -q -b "$BASE_JSON" -F $IMGFMT
+    $QEMU_IMG bitmap --add "$TEST_IMG" "good-bitmap"
+
+    $QEMU_IO -c 'write 0 126m' "$TEST_IMG" | _filter_qemu_io
+
+    $QEMU_IMG commit -d "$TEST_IMG" 2>&1 | _filter_generated_node_ids
+    echo "qemu-img commit exit code: ${PIPESTATUS[0]}"
+
+    $QEMU_IMG bitmap --add "$BASE_JSON" "good-bitmap"
+    echo "qemu-img bitmap --add exit code: $?"
+
+    $QEMU_IMG bitmap --merge "good-bitmap" -b "$TEST_IMG" "$BASE_JSON" \
+        "good-bitmap" 2>&1 | _filter_generated_node_ids
+    echo "qemu-img bitmap --merge exit code:  ${PIPESTATUS[0]}"
+done
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
+
diff --git a/tests/qemu-iotests/tests/qemu-img-close-errors.out b/tests/qemu-iotests/tests/qemu-img-close-errors.out
new file mode 100644
index 0000000000..1bfe88f176
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-close-errors.out
@@ -0,0 +1,23 @@
+QA output created by qemu-img-close-errors
+
+=== Test with 6 bitmaps ===
+wrote 132120576/132120576 bytes at offset 0
+126 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Image committed.
+qemu-img commit exit code: 0
+qemu-img bitmap --add exit code: 0
+qemu-img: Lost persistent bitmaps during inactivation of node 'NODE_NAME': Failed to write bitmap 'good-bitmap' to file: No space left on device
+qemu-img: Error while closing the image: Invalid argument
+qemu-img: Lost persistent bitmaps during inactivation of node 'NODE_NAME': Failed to write bitmap 'good-bitmap' to file: No space left on device
+qemu-img bitmap --merge exit code:  1
+
+=== Test with 7 bitmaps ===
+wrote 132120576/132120576 bytes at offset 0
+126 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+qemu-img: Lost persistent bitmaps during inactivation of node 'NODE_NAME': Failed to write bitmap 'stale-bitmap-7' to file: No space left on device
+qemu-img: Lost persistent bitmaps during inactivation of node 'NODE_NAME': Failed to write bitmap 'stale-bitmap-7' to file: No space left on device
+qemu-img: Error while closing the image: Invalid argument
+qemu-img commit exit code: 1
+qemu-img bitmap --add exit code: 0
+qemu-img bitmap --merge exit code:  0
+*** done
-- 
2.38.1


