Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 998F15A9AE4
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 16:52:57 +0200 (CEST)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTlYt-0007NK-MF
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 10:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlTA-0001Bt-0H
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1oTlGp-0006z9-56
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 10:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662042853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EkRsP9fWWOpk1xsECwKFbrlU5bQB+gkBZQ8RVDIqAPM=;
 b=PttQGbZM2nkEqQxT+q1UFJyKDuwkLeYvP9dweeW0R6wMXFAmJApOhh0PCZBD93DxA+s0zH
 +ZotxK/MuIEjQKkjb0XAM/Evj1Mfb2TCm9gOc0UMvV7ri7HG69Z46PBdRF9/H8verUOKus
 4cvaWP8K3lyZorHiZB+mviVPjLvM39A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-NKrmJcKUM_GT9H4WvtR31w-1; Thu, 01 Sep 2022 10:32:29 -0400
X-MC-Unique: NKrmJcKUM_GT9H4WvtR31w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B2D029324A4;
 Thu,  1 Sep 2022 14:32:29 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EB22492C3B;
 Thu,  1 Sep 2022 14:32:28 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH 2/3] iotests: Test qemu-img checksum
Date: Thu,  1 Sep 2022 17:32:22 +0300
Message-Id: <20220901143223.201295-3-nsoffer@redhat.com>
In-Reply-To: <20220901143223.201295-1-nsoffer@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add simple tests creating an image with all kinds of extents, different
formats, different backing chain, different protocol, and different
image options. Since all images have the same guest visible content they
must have the same checksum.

To help debugging in case of failures, the output includes a json map of
every test image.

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
---
 tests/qemu-iotests/tests/qemu-img-checksum    | 149 ++++++++++++++++++
 .../qemu-iotests/tests/qemu-img-checksum.out  |  74 +++++++++
 2 files changed, 223 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qemu-img-checksum
 create mode 100644 tests/qemu-iotests/tests/qemu-img-checksum.out

diff --git a/tests/qemu-iotests/tests/qemu-img-checksum b/tests/qemu-iotests/tests/qemu-img-checksum
new file mode 100755
index 0000000000..3a85ba33f2
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-checksum
@@ -0,0 +1,149 @@
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
+    qemu_nbd_popen,
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
+    supported_protocols=["file", "nbd"],
+    required_fmts=["raw", "qcow2"],
+)
+
+print()
+print("=== Test images ===")
+print()
+
+disk_raw = iotests.file_path('raw')
+qemu_img("create", "-f", "raw", disk_raw, "10m")
+qemu_io("-f", "raw",
+        "-c", "write -P 0x1 0 2m",      # data
+        "-c", "write -P 0x0 2m 2m",     # data with zeroes
+        "-c", "write -z 4m 2m",         # zero allocated
+        "-c", "write -z -u 6m 2m",      # zero hole
+                                        # unallocated
+        disk_raw)
+print(filter_testfiles(disk_raw))
+qemu_img_log("map", "--output", "json", disk_raw)
+
+disk_qcow2 = iotests.file_path('qcow2')
+qemu_img("create", "-f", "qcow2", disk_qcow2, "10m")
+qemu_io("-f", "qcow2",
+        "-c", "write -P 0x1 0 2m",      # data
+        "-c", "write -P 0x0 2m 2m",     # data with zeroes
+        "-c", "write -z 4m 2m",         # zero allocated
+        "-c", "write -z -u 6m 2m",      # zero hole
+                                        # unallocated
+        disk_qcow2)
+print(filter_testfiles(disk_qcow2))
+qemu_img_log("map", "--output", "json", disk_qcow2)
+
+disk_compressed = iotests.file_path('compressed')
+qemu_img("convert", "-f", "qcow2", "-O", "qcow2", "-c",
+         disk_qcow2, disk_compressed)
+print(filter_testfiles(disk_compressed))
+qemu_img_log("map", "--output", "json", disk_compressed)
+
+disk_base = iotests.file_path('base')
+qemu_img("create", "-f", "raw", disk_base, "10m")
+qemu_io("-f", "raw",
+        "-c", "write -P 0x1 0 2m",
+        "-c", "write -P 0x0 2m 2m",
+        disk_base)
+print(filter_testfiles(disk_base))
+qemu_img_log("map", "--output", "json", disk_base)
+
+disk_top = iotests.file_path('top')
+qemu_img("create", "-f", "qcow2", "-b", disk_base, "-F", "raw",
+         disk_top)
+qemu_io("-f", "qcow2",
+        "-c", "write -z 4m 2m",
+        "-c", "write -z -u 6m 2m",
+        disk_top)
+print(filter_testfiles(disk_top))
+qemu_img_log("map", "--output", "json", disk_top)
+
+print()
+print("=== Checksums - file ===")
+print()
+
+qemu_img_log("checksum", disk_raw)
+qemu_img_log("checksum", disk_qcow2)
+qemu_img_log("checksum", disk_compressed)
+qemu_img_log("checksum", disk_top)
+qemu_img_log("checksum", disk_base)
+
+print()
+print("=== Checksums - nbd ===")
+print()
+
+nbd_sock = iotests.file_path("nbd.sock", base_dir=iotests.sock_dir)
+nbd_uri = f"nbd+unix:///{{}}?socket={nbd_sock}"
+
+with qemu_nbd_popen("-k", nbd_sock, "-f", "raw", "-x", "raw", disk_raw):
+    qemu_img_log("checksum", nbd_uri.format("raw"))
+
+with qemu_nbd_popen("-k", nbd_sock, "-f", "qcow2", "-x", "qcow2", disk_qcow2):
+    qemu_img_log("checksum", nbd_uri.format("qcow2"))
+
+with qemu_nbd_popen("-k", nbd_sock, "-f", "qcow2", "-x", "compressed", disk_compressed):
+    qemu_img_log("checksum", nbd_uri.format("compressed"))
+
+with qemu_nbd_popen("-k", nbd_sock, "-f", "raw", "-x", "base", disk_base):
+    qemu_img_log("checksum", nbd_uri.format("base"))
+
+with qemu_nbd_popen("-k", nbd_sock, "-f", "qcow2", "-x", "top", disk_top):
+    qemu_img_log("checksum", nbd_uri.format("top"))
+
+print()
+print("=== Command line options ===")
+print()
+
+qemu_img_log("checksum", "-f", "qcow2", disk_top)
+qemu_img_log("checksum", "-T", "none", disk_top)
+
+out = qemu_img("checksum", "-p", disk_top).stdout
+last = out.splitlines()[-1]  # Filter progress lines.
+print(filter_testfiles(last))
+
+print()
+print("=== Incorrect usage ===")
+print()
+
+qemu_img_log("checksum", "-f", "qcow2", disk_raw, check=False)
diff --git a/tests/qemu-iotests/tests/qemu-img-checksum.out b/tests/qemu-iotests/tests/qemu-img-checksum.out
new file mode 100644
index 0000000000..2cff03439f
--- /dev/null
+++ b/tests/qemu-iotests/tests/qemu-img-checksum.out
@@ -0,0 +1,74 @@
+
+=== Test images ===
+
+TEST_DIR/PID-raw
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 0},
+{ "start": 4194304, "length": 6291456, "depth": 0, "present": true, "zero": true, "data": false, "offset": 4194304}]
+
+TEST_DIR/PID-qcow2
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 327680},
+{ "start": 4194304, "length": 4194304, "depth": 0, "present": true, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 0, "present": false, "zero": true, "data": false}]
+
+TEST_DIR/PID-compressed
+[{ "start": 0, "length": 2097152, "depth": 0, "present": true, "zero": false, "data": true},
+{ "start": 2097152, "length": 8388608, "depth": 0, "present": false, "zero": true, "data": false}]
+
+TEST_DIR/PID-base
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": 0},
+{ "start": 4194304, "length": 6291456, "depth": 0, "present": true, "zero": true, "data": false, "offset": 4194304}]
+
+TEST_DIR/PID-top
+[{ "start": 0, "length": 4194304, "depth": 1, "present": true, "zero": false, "data": true, "offset": 0},
+{ "start": 4194304, "length": 4194304, "depth": 0, "present": true, "zero": true, "data": false},
+{ "start": 8388608, "length": 2097152, "depth": 1, "present": true, "zero": true, "data": false, "offset": 8388608}]
+
+
+=== Checksums - file ===
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-raw
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-qcow2
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-compressed
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-top
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-base
+
+
+=== Checksums - nbd ===
+
+Start NBD server
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  nbd+unix:///raw?socket=SOCK_DIR/PID-nbd.sock
+
+Kill NBD server
+Start NBD server
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  nbd+unix:///qcow2?socket=SOCK_DIR/PID-nbd.sock
+
+Kill NBD server
+Start NBD server
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  nbd+unix:///compressed?socket=SOCK_DIR/PID-nbd.sock
+
+Kill NBD server
+Start NBD server
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  nbd+unix:///base?socket=SOCK_DIR/PID-nbd.sock
+
+Kill NBD server
+Start NBD server
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  nbd+unix:///top?socket=SOCK_DIR/PID-nbd.sock
+
+Kill NBD server
+
+=== Command line options ===
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-top
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-top
+
+57cd8ef0cfad106d737f8fb0de3a0306a8a1a41db7bf7c0c36e2dfe75ee9bd26  TEST_DIR/PID-top
+
+=== Incorrect usage ===
+
+qemu-img: Could not open 'TEST_DIR/PID-raw': Image is not in qcow2 format
+
-- 
2.37.2


