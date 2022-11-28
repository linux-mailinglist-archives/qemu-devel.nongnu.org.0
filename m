Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05EA63AAB8
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozewA-0008Ny-QB; Mon, 28 Nov 2022 09:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevX-0008DY-C9
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevU-0005Sy-CM
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669644963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KEZwO46uDaY3GxoK7rTkj6GzQamI/aMOXzkbw53IhQw=;
 b=iv9Rcqmy9JJCfjPT/1iKO3JG+wmw86n8rIEAMZcAdHxZBZ6+w1YoNVXeRoOSB90vh6RlCg
 QdrouCMnNa518xiaCGBK2Fo1KT43J2tWJsG/Y0VWTOUiTbL9xOLew2EqqhQt7gA8/HJYqX
 ae5yLgsTeoOZwD+0Up/CTcIC/jB9sqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-rep5zv2GNP2vKtw-ktOJdQ-1; Mon, 28 Nov 2022 09:16:02 -0500
X-MC-Unique: rep5zv2GNP2vKtw-ktOJdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A60E877CB8;
 Mon, 28 Nov 2022 14:15:26 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DED82166B2E;
 Mon, 28 Nov 2022 14:15:24 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH v2 4/5] iotests: Test qemu-img checksum
Date: Mon, 28 Nov 2022 16:15:13 +0200
Message-Id: <20221128141514.388724-5-nsoffer@redhat.com>
In-Reply-To: <20221128141514.388724-1-nsoffer@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add simple tests computing a checksum for image with all kinds of
extents in raw and qcow2 formats.

The test can be extended later for other formats, format options (e..g
compressed qcow2), protocols (e.g. nbd), and image with a backing chain,
but I'm not sure this is really needed.

To help debugging in case of failures, the output includes a json map of
the test image.

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 tests/qemu-iotests/tests/qemu-img-checksum    | 63 +++++++++++++++++++
 .../tests/qemu-img-checksum.out.qcow2         | 11 ++++
 .../tests/qemu-img-checksum.out.raw           | 10 +++
 3 files changed, 84 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out.qcow2
 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out.raw

diff --git a/tests/qemu-iotests/tests/qemu-img-checksum b/tests/qemu-iotests/tests/qemu-img-checksum
new file mode 100755
index 0000000000..3577a0bc41
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-checksum
@@ -0,0 +1,63 @@
+#!/usr/bin/env python3
+# group: rw auto quick
+#
+# Test cases for qemu-img checksum.
+#
+# Copyright (C) 2022 Red Hat, Inc.
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
+
+import re
+
+import iotests
+
+from iotests import (
+    filter_testfiles,
+    qemu_img,
+    qemu_img_log,
+    qemu_io,
+)
+
+
+def checksum_available():
+    out = qemu_img("--help").stdout
+    return re.search(r"\bchecksum .+ filename\b", out) is not None
+
+
+if not checksum_available():
+    iotests.notrun("checksum command not available")
+
+iotests.script_initialize(
+    supported_fmts=["raw", "qcow2"],
+    supported_cache_modes=["none", "writeback"],
+    supported_protocols=["file"],
+)
+
+print("=== Create test image ===\n")
+
+disk = iotests.file_path('disk')
+qemu_img("create", "-f", iotests.imgfmt, disk, "10m")
+qemu_io("-f", iotests.imgfmt,
+        "-c", "write -P 0x1 0 2m",      # data
+        "-c", "write -P 0x0 2m 2m",     # data with zeroes
+        "-c", "write -z 4m 2m",         # zero allocated
+        "-c", "write -z -u 6m 2m",      # zero hole
+                                        # unallocated
+        disk)
+print(filter_testfiles(disk))
+qemu_img_log("map", "--output", "json", disk)
+
+print("=== Compute checksum ===\n")
+
+qemu_img_log("checksum", "-T", iotests.cachemode, disk)
diff --git a/tests/qemu-iotests/tests/qemu-img-checksum.out.qcow2 b/tests/qemu-iotests/tests/qemu-img-checksum.out.qcow2
new file mode 100644
index 0000000000..02b9616e5b
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-checksum.out.qcow2
@@ -0,0 +1,11 @@
+=== Create test image ===
+
+TEST_DIR/PID-disk
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680},
+{ "start": 4194304, "length": 4194304, "depth": 0, "present": true, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 0, "present": false, "zero": true, "data": false}]
+
+=== Compute checksum ===
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-disk
+
diff --git a/tests/qemu-iotests/tests/qemu-img-checksum.out.raw b/tests/qemu-iotests/tests/qemu-img-checksum.out.raw
new file mode 100644
index 0000000000..6294e4dace
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-checksum.out.raw
@@ -0,0 +1,10 @@
+=== Create test image ===
+
+TEST_DIR/PID-disk
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 0},
+{ "start": 4194304, "length": 6291456, "depth": 0, "present": true, "zero": true, "data": false, "offset": 4194304}]
+
+=== Compute checksum ===
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-disk
+
-- 
2.38.1


