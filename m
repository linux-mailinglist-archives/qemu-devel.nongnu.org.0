Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6884735E862
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 23:38:01 +0200 (CEST)
Received: from localhost ([::1]:53806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWQjP-0002ey-VJ
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 17:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lWQgF-0001pH-Sw; Tue, 13 Apr 2021 17:34:43 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:47005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirsof@gmail.com>)
 id 1lWQgE-00039i-3D; Tue, 13 Apr 2021 17:34:43 -0400
Received: by mail-ed1-x534.google.com with SMTP id h10so21118304edt.13;
 Tue, 13 Apr 2021 14:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=afped6VEaBtOcQHlk52YMlj+nviLurbH3vzI9NDFDS0=;
 b=nyhhNP/8yLTA38sw22n/0I2dqLoetP5n/iTMFAhuIjfM5X4v8AdcceOtEPP9Wenxdu
 55p464Kqwt6CayWtT1dUhhwPr6A/7cR79bCwJIYrSDJi72nob34LjyLAOfQ5CQdHH8Wp
 OgIlBDwIJRs2L20kAJYvL+xOihRcmAHfU+3PJrAtrZZwCDTANH0EtEuR+Ldq/HqLTTW0
 /r9AsFaVXjFmkEoJSZDFmKdhF/INiHei9AIHXd19DlK48iM7rWIUtmTGZDaAPGvg8OBS
 0qw15Jwsr2ksTlrquycYWc1NCAyeIvHL1NU9iFhoXBke/qkpgJyUuBQzXs61HMhScbrF
 r+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=afped6VEaBtOcQHlk52YMlj+nviLurbH3vzI9NDFDS0=;
 b=g+UYI0C/d7SsSxnZAnbuytnvltxwMheNioMmOm56h+I8Jf2DJIKroN1Q6G6LbzRX7p
 25NtUSLiumNItB403Vqyt7WRl+L1+UkrJLwDb7/cS1L3x2UNPltBuChdbq3gTXcJMA5H
 cRsLnQVeIaHtH0ZIxxtmhHCoMVwqGhgh2Cbv3RnUEoVrs3hz7qtO3K54LeE+vYpV4d05
 qkGoDnFMZP6/+rmFjr/P+nh5bkn4mjyfEcudf4yjlDPrgK3AGBMo1ULKY0UWVeUKnYWR
 r1B4WQQp6WKnwSATM7zLsIosCXzdHgsoIzjgCOvhIdJgCEb6Rd6mjG5p0cbCrXOFg1l+
 m8HA==
X-Gm-Message-State: AOAM530ZBmNOVH4lYCSw3jPfIyBPtFoJUZB9/XmiKb+vz+K5wBEsSwqw
 WyQb6lSe82y51YzxCw0ayHqucXy5pmgLQaDA
X-Google-Smtp-Source: ABdhPJwyofHcOkP9ptKdjML1415+HsDr27eZFc9WCNlIC1foxbofCVUlxd3ccqOWT2dN5Hz7aVuWcw==
X-Received: by 2002:a05:6402:3092:: with SMTP id
 de18mr36171764edb.96.1618349679539; 
 Tue, 13 Apr 2021 14:34:39 -0700 (PDT)
Received: from localhost.localdomain (109-186-220-15.bb.netvision.net.il.
 [109.186.220.15])
 by smtp.gmail.com with ESMTPSA id f21sm10102455edq.55.2021.04.13.14.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 14:34:38 -0700 (PDT)
From: Nir Soffer <nirsof@gmail.com>
X-Google-Original-From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-iotest: Test NBD hole reporting for qcow2
Date: Wed, 14 Apr 2021 00:34:36 +0300
Message-Id: <20210413213436.280982-1-nsoffer@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=nirsof@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLY=1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nirsof@gmail.com>,
 qemu-block@nongnu.org, Richard Jones <rjones@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit commit 0da9856851dcca09222a1467e16ddd05dc66e460

    nbd: server: Report holes for raw images

we changed the way holes are reported for raw images, but also how
known-zero portions of qcow2 files are reported. This was not covered by
iotests, and revealed recently by libnbd tests[1].

Add the missing tests for single qcow2 image and qcow2 image with a
backing file.

[1] https://listman.redhat.com/archives/libguestfs/2021-April/msg00050.html

Signed-off-by: Nir Soffer <nirsof@gmail.com>
---
 tests/qemu-iotests/314       | 96 ++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/314.out   | 34 +++++++++++++
 tests/qemu-iotests/common.rc |  1 +
 3 files changed, 131 insertions(+)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out

diff --git a/tests/qemu-iotests/314 b/tests/qemu-iotests/314
new file mode 100755
index 0000000000..81c0169eac
--- /dev/null
+++ b/tests/qemu-iotests/314
@@ -0,0 +1,96 @@
+#!/usr/bin/env bash
+# group: rw quick
+#
+# Test qemu-nbd base:allocation metacontext
+#
+# Copyright (C) 2021 Nir Soffer <nirsof@gmail.com>
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
+# owner=nirsof@gmail.com
+
+seq="$(basename $0)"
+echo "QA output created by $seq"
+
+status=1 # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+    rm -f "$TEST_DIR/server.log"
+    nbd_server_stop
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.nbd
+
+_supported_fmt qcow2
+_supported_proto nbd
+_supported_os Linux
+_require_command QEMU_NBD
+
+TEST_IMG="nbd+unix:///?socket=$nbd_unix_socket"
+
+echo
+echo "=== Single image ==="
+echo
+
+$QEMU_IMG create -f "$IMGFMT" -o cluster_size=64k \
+    "$TEST_IMG_FILE" 384k | _filter_img_create_filenames
+
+$QEMU_IO -f $IMGFMT -c "write -P 1 0k 64k" "$TEST_IMG_FILE" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c "write -P 2 64k 512" "$TEST_IMG_FILE" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c "write -z 192k 64k" "$TEST_IMG_FILE" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c "write -z 256k 512" "$TEST_IMG_FILE" | _filter_qemu_io
+
+nbd_server_start_unix_socket -f $IMGFMT "$TEST_IMG_FILE"
+
+echo
+$QEMU_NBD_PROG --list -k $nbd_unix_socket >/dev/null
+$QEMU_IMG map -f raw --output=json "$TEST_IMG" | _filter_qemu_img_map
+
+nbd_server_stop
+
+echo
+echo "=== Image with backing file ==="
+echo
+
+$QEMU_IMG create -f "$IMGFMT" -o cluster_size=64k \
+    "$TEST_IMG_FILE.base" 384k | _filter_img_create_filenames
+
+$QEMU_IO -f $IMGFMT -c "write -P 1 0k 64k" "$TEST_IMG_FILE.base" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c "write -P 2 64k 512" "$TEST_IMG_FILE.base" | _filter_qemu_io
+
+$QEMU_IMG create -f "$IMGFMT" -o cluster_size=64k \
+    -b "$TEST_IMG_FILE.base" -F $IMGFMT "$TEST_IMG_FILE" | _filter_img_create_filenames
+
+$QEMU_IO -f $IMGFMT -c "write -z 192k 64k" "$TEST_IMG_FILE" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c "write -z 256k 512" "$TEST_IMG_FILE" | _filter_qemu_io
+
+nbd_server_start_unix_socket -f $IMGFMT "$TEST_IMG_FILE"
+
+echo
+$QEMU_NBD_PROG --list -k $nbd_unix_socket >/dev/null
+$QEMU_IMG map -f raw --output=json "$TEST_IMG" | _filter_qemu_img_map
+
+nbd_server_stop
+
+# success, all done
+echo
+echo '*** done'
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/314.out b/tests/qemu-iotests/314.out
new file mode 100644
index 0000000000..df7eef023f
--- /dev/null
+++ b/tests/qemu-iotests/314.out
@@ -0,0 +1,34 @@
+QA output created by 314
+
+=== Single image ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT cluster_size=65536 extended_l2=off compression_type=zlib size=393216 lazy_refcounts=off refcount_bits=16
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 512/512 bytes at offset 65536
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 196608
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 512/512 bytes at offset 262144
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+[{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 131072, "length": 262144, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+
+=== Image with backing file ===
+
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT cluster_size=65536 extended_l2=off compression_type=zlib size=393216 lazy_refcounts=off refcount_bits=16
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 512/512 bytes at offset 65536
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT cluster_size=65536 extended_l2=off compression_type=zlib size=393216 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT lazy_refcounts=off refcount_bits=16
+wrote 65536/65536 bytes at offset 196608
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 512/512 bytes at offset 262144
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+[{ "start": 0, "length": 131072, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 131072, "length": 262144, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+
+*** done
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index 7f49c9716d..1dafac6d66 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -612,6 +612,7 @@ _cleanup_test_img()
         nbd)
             _stop_nbd_server
             rm -f "$TEST_IMG_FILE"
+            rm -f "$TEST_IMG_FILE.base"
             ;;
 
         fuse)
-- 
2.26.3


