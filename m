Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E028C379
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Oct 2020 22:57:06 +0200 (CEST)
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS4sT-0007AL-5k
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 16:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WS-0002st-Rd
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kS4WK-0002iO-N7
 for qemu-devel@nongnu.org; Mon, 12 Oct 2020 16:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602534852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tdqta/OgTLIqjgwCnQ2LM9fr8hu/ySX9N6VMgJDiW0Q=;
 b=RAelExKnHqTgHA+b68l1p1w+UMFSo6iLNkhLqhoDzrvV9IGXpGZlRiU/pxMymVAlez5Yyz
 6cjBX5TkpgR6mEWBhOaWn/U+muchcQsf8bJuW9CUpfzAbeU0b5Vm2zasKR4o5YLMtLjONz
 9IYGCq06J2MyxIAgbUBlEEDxerg5bMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-nyruAmYEMs6BDUPBTkjfpw-1; Mon, 12 Oct 2020 16:34:09 -0400
X-MC-Unique: nyruAmYEMs6BDUPBTkjfpw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5257A18CBC5D
 for <qemu-devel@nongnu.org>; Mon, 12 Oct 2020 20:33:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E4526EF59;
 Mon, 12 Oct 2020 20:33:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/38] qemu-iotests, qtest: rewrite test 067 as a qtest
Date: Mon, 12 Oct 2020 16:33:32 -0400
Message-Id: <20201012203343.1105018-28-pbonzini@redhat.com>
In-Reply-To: <20201012203343.1105018-1-pbonzini@redhat.com>
References: <20201012203343.1105018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test 067 from qemu-iotests is executing QMP commands to hotplug
and hot-unplug disks, devices and blockdevs.  Because the power
of the text-based test harness is limited, it is actually limiting
the checks that it does, for example by skipping DEVICE_DELETED
events.

tests/qtest already has a similar test, drive_del-test.c.
We can merge them, and even reuse some of the existing code in
drive_del-test.c.  This will improve the quality of the test by
covering DEVICE_DELETED events and testing multiple architectures
(therefore covering multiple PCI hotplug mechanisms as well as s390x
virtio-ccw).

The only difference is that the new test will always use null-co:// for
the medium rather than qcow2 or raw, but this should be irrelevant for
what the test is covering.  For example there are no "qemu-img check"
runs in 067 that would check that the file is properly closed.

The new tests requires PCI hot-plug support, so drive_del-test
is moved from qemu-system-ppc to qemu-system-ppc64.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.yml               |   2 +-
 tests/qemu-iotests/067       | 157 -------------
 tests/qemu-iotests/067.out   | 414 -----------------------------------
 tests/qemu-iotests/group     |   2 +-
 tests/qtest/drive_del-test.c | 211 ++++++++++++++++--
 tests/qtest/meson.build      |   4 +-
 6 files changed, 191 insertions(+), 599 deletions(-)
 delete mode 100755 tests/qemu-iotests/067
 delete mode 100644 tests/qemu-iotests/067.out

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a51c89554f..a4cf87481e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -232,7 +232,7 @@ build-tcg-disabled:
     - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
             170 171 183 184 192 194 197 208 215 221 222 226 227 236 253 277
-    - ./check -qcow2 028 051 056 057 058 065 067 068 082 085 091 095 096 102 122
+    - ./check -qcow2 028 051 056 057 058 065 068 082 085 091 095 096 102 122
             124 132 139 142 144 145 151 152 155 157 165 194 196 197 200 202
             208 209 215 216 218 222 227 234 246 247 248 250 254 255 257 258
             260 261 262 263 264 270 272 273 277 279
diff --git a/tests/qemu-iotests/067 b/tests/qemu-iotests/067
deleted file mode 100755
index a63be9cabf..0000000000
--- a/tests/qemu-iotests/067
+++ /dev/null
@@ -1,157 +0,0 @@
-#!/usr/bin/env bash
-#
-# Test automatic deletion of BDSes created by -drive/drive_add
-#
-# Copyright (C) 2013 Red Hat, Inc.
-#
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License as published by
-# the Free Software Foundation; either version 2 of the License, or
-# (at your option) any later version.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program.  If not, see <http://www.gnu.org/licenses/>.
-#
-
-# creator
-owner=kwolf@redhat.com
-
-seq=`basename $0`
-echo "QA output created by $seq"
-
-status=1	# failure is the default!
-
-# get standard environment, filters and checks
-. ./common.rc
-. ./common.filter
-
-_supported_fmt qcow2
-_supported_proto file
-# Because anything other than 16 would change the output of query-block,
-# and external data files would change the output of
-# query-named-block-nodes
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
-
-do_run_qemu()
-{
-    echo Testing: "$@"
-    $QEMU -nographic -qmp-pretty stdio -serial none "$@"
-    echo
-}
-
-# Remove QMP events from (pretty-printed) output. Doesn't handle
-# nested dicts correctly, but we don't get any of those in this test.
-_filter_qmp_events()
-{
-    tr '\n' '\t' | sed -e \
-	's/{\s*"timestamp":\s*{[^}]*},\s*"event":[^,}]*\(,\s*"data":\s*{[^}]*}\)\?\s*}\s*//g' \
-	| tr '\t' '\n'
-}
-
-run_qemu()
-{
-    do_run_qemu "$@" 2>&1 | _filter_testdir | _filter_qmp | _filter_qemu \
-                          | _filter_actual_image_size \
-                          | _filter_generated_node_ids | _filter_qmp_events \
-                          | _filter_img_info
-}
-
-size=128M
-
-_make_test_img $size
-
-echo
-echo === -drive/-device and device_del ===
-echo
-
-run_qemu -drive file=$TEST_IMG,format=$IMGFMT,if=none,id=disk -device virtio-blk,drive=disk,id=virtio0 <<EOF
-{ "execute": "qmp_capabilities" }
-{ "execute": "query-block" }
-{ "execute": "device_del", "arguments": { "id": "virtio0" } }
-{ "execute": "system_reset" }
-{ "execute": "query-block" }
-{ "execute": "quit" }
-EOF
-
-echo
-echo === -drive/device_add and device_del ===
-echo
-
-run_qemu -drive file=$TEST_IMG,format=$IMGFMT,if=none,id=disk <<EOF
-{ "execute": "qmp_capabilities" }
-{ "execute": "query-block" }
-{ "execute": "device_add",
-   "arguments": { "driver": "virtio-blk", "drive": "disk",
-                  "id": "virtio0" } }
-{ "execute": "device_del", "arguments": { "id": "virtio0" } }
-{ "execute": "system_reset" }
-{ "execute": "query-block" }
-{ "execute": "quit" }
-EOF
-
-echo
-echo === drive_add/device_add and device_del ===
-echo
-
-run_qemu <<EOF
-{ "execute": "qmp_capabilities" }
-{ "execute": "human-monitor-command",
-  "arguments": { "command-line": "drive_add 0 file=$TEST_IMG,format=$IMGFMT,if=none,id=disk" } }
-{ "execute": "query-block" }
-{ "execute": "device_add",
-   "arguments": { "driver": "virtio-blk", "drive": "disk",
-                  "id": "virtio0" } }
-{ "execute": "device_del", "arguments": { "id": "virtio0" } }
-{ "execute": "system_reset" }
-{ "execute": "query-block" }
-{ "execute": "quit" }
-EOF
-
-echo
-echo === blockdev_add/device_add and device_del ===
-echo
-
-run_qemu <<EOF
-{ "execute": "qmp_capabilities" }
-{ "execute": "blockdev-add",
-  "arguments": {
-      "driver": "$IMGFMT",
-      "node-name": "disk",
-      "file": {
-          "driver": "file",
-          "filename": "$TEST_IMG"
-      }
-    }
-  }
-{ "execute": "query-named-block-nodes" }
-{ "execute": "device_add",
-   "arguments": { "driver": "virtio-blk", "drive": "disk",
-                  "id": "virtio0" } }
-{ "execute": "device_del", "arguments": { "id": "virtio0" } }
-{ "execute": "system_reset" }
-{ "execute": "query-named-block-nodes" }
-{ "execute": "quit" }
-EOF
-
-echo
-echo === Empty drive with -device and device_del ===
-echo
-
-run_qemu -device virtio-scsi -device scsi-cd,id=cd0 <<EOF
-{ "execute": "qmp_capabilities" }
-{ "execute": "query-block" }
-{ "execute": "device_del", "arguments": { "id": "cd0" } }
-{ "execute": "system_reset" }
-{ "execute": "query-block" }
-{ "execute": "quit" }
-EOF
-
-# success, all done
-echo "*** done"
-rm -f $seq.full
-status=0
diff --git a/tests/qemu-iotests/067.out b/tests/qemu-iotests/067.out
deleted file mode 100644
index b10c71db03..0000000000
--- a/tests/qemu-iotests/067.out
+++ /dev/null
@@ -1,414 +0,0 @@
-QA output created by 067
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-
-=== -drive/-device and device_del ===
-
-Testing: -drive file=TEST_DIR/t.IMGFMT,format=IMGFMT,if=none,id=disk -device virtio-blk,drive=disk,id=virtio0
-{
-    QMP_VERSION
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-        {
-            "io-status": "ok",
-            "device": "disk",
-            "locked": false,
-            "removable": false,
-            "inserted": {
-                "iops_rd": 0,
-                "detect_zeroes": "off",
-                "image": {
-                    "virtual-size": 134217728,
-                    "filename": "TEST_DIR/t.IMGFMT",
-                    "cluster-size": 65536,
-                    "format": "IMGFMT",
-                    "actual-size": SIZE,
-                    "dirty-flag": false
-                },
-                "iops_wr": 0,
-                "ro": false,
-                "node-name": "NODE_NAME",
-                "backing_file_depth": 0,
-                "drv": "IMGFMT",
-                "iops": 0,
-                "bps_wr": 0,
-                "write_threshold": 0,
-                "encrypted": false,
-                "bps": 0,
-                "bps_rd": 0,
-                "cache": {
-                    "no-flush": false,
-                    "direct": false,
-                    "writeback": true
-                },
-                "file": "TEST_DIR/t.IMGFMT",
-                "encryption_key_missing": false
-            },
-            "qdev": "/machine/peripheral/virtio0/virtio-backend",
-            "type": "unknown"
-        }
-    ]
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-    ]
-}
-{
-    "return": {
-    }
-}
-
-=== -drive/device_add and device_del ===
-
-Testing: -drive file=TEST_DIR/t.IMGFMT,format=IMGFMT,if=none,id=disk
-{
-    QMP_VERSION
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-        {
-            "device": "disk",
-            "locked": false,
-            "removable": true,
-            "inserted": {
-                "iops_rd": 0,
-                "detect_zeroes": "off",
-                "image": {
-                    "virtual-size": 134217728,
-                    "filename": "TEST_DIR/t.IMGFMT",
-                    "cluster-size": 65536,
-                    "format": "IMGFMT",
-                    "actual-size": SIZE,
-                    "dirty-flag": false
-                },
-                "iops_wr": 0,
-                "ro": false,
-                "node-name": "NODE_NAME",
-                "backing_file_depth": 0,
-                "drv": "IMGFMT",
-                "iops": 0,
-                "bps_wr": 0,
-                "write_threshold": 0,
-                "encrypted": false,
-                "bps": 0,
-                "bps_rd": 0,
-                "cache": {
-                    "no-flush": false,
-                    "direct": false,
-                    "writeback": true
-                },
-                "file": "TEST_DIR/t.IMGFMT",
-                "encryption_key_missing": false
-            },
-            "type": "unknown"
-        }
-    ]
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-    ]
-}
-{
-    "return": {
-    }
-}
-
-=== drive_add/device_add and device_del ===
-
-Testing:
-{
-    QMP_VERSION
-}
-{
-    "return": {
-    }
-}
-{
-    "return": "OK\r\n"
-}
-{
-    "return": [
-        {
-            "device": "disk",
-            "locked": false,
-            "removable": true,
-            "inserted": {
-                "iops_rd": 0,
-                "detect_zeroes": "off",
-                "image": {
-                    "virtual-size": 134217728,
-                    "filename": "TEST_DIR/t.IMGFMT",
-                    "cluster-size": 65536,
-                    "format": "IMGFMT",
-                    "actual-size": SIZE,
-                    "dirty-flag": false
-                },
-                "iops_wr": 0,
-                "ro": false,
-                "node-name": "NODE_NAME",
-                "backing_file_depth": 0,
-                "drv": "IMGFMT",
-                "iops": 0,
-                "bps_wr": 0,
-                "write_threshold": 0,
-                "encrypted": false,
-                "bps": 0,
-                "bps_rd": 0,
-                "cache": {
-                    "no-flush": false,
-                    "direct": false,
-                    "writeback": true
-                },
-                "file": "TEST_DIR/t.IMGFMT",
-                "encryption_key_missing": false
-            },
-            "type": "unknown"
-        }
-    ]
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-    ]
-}
-{
-    "return": {
-    }
-}
-
-=== blockdev_add/device_add and device_del ===
-
-Testing:
-{
-    QMP_VERSION
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-        {
-            "iops_rd": 0,
-            "detect_zeroes": "off",
-            "image": {
-                "virtual-size": 134217728,
-                "filename": "TEST_DIR/t.IMGFMT",
-                "cluster-size": 65536,
-                "format": "IMGFMT",
-                "actual-size": SIZE,
-                "dirty-flag": false
-            },
-            "iops_wr": 0,
-            "ro": false,
-            "node-name": "disk",
-            "backing_file_depth": 0,
-            "drv": "IMGFMT",
-            "iops": 0,
-            "bps_wr": 0,
-            "write_threshold": 0,
-            "encrypted": false,
-            "bps": 0,
-            "bps_rd": 0,
-            "cache": {
-                "no-flush": false,
-                "direct": false,
-                "writeback": true
-            },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
-        },
-        {
-            "iops_rd": 0,
-            "detect_zeroes": "off",
-            "image": {
-                "virtual-size": 197120,
-                "filename": "TEST_DIR/t.IMGFMT",
-                "format": "file",
-                "actual-size": SIZE,
-                "dirty-flag": false
-            },
-            "iops_wr": 0,
-            "ro": false,
-            "node-name": "NODE_NAME",
-            "backing_file_depth": 0,
-            "drv": "file",
-            "iops": 0,
-            "bps_wr": 0,
-            "write_threshold": 0,
-            "encrypted": false,
-            "bps": 0,
-            "bps_rd": 0,
-            "cache": {
-                "no-flush": false,
-                "direct": false,
-                "writeback": true
-            },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
-        }
-    ]
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-        {
-            "iops_rd": 0,
-            "detect_zeroes": "off",
-            "image": {
-                "virtual-size": 134217728,
-                "filename": "TEST_DIR/t.IMGFMT",
-                "cluster-size": 65536,
-                "format": "IMGFMT",
-                "actual-size": SIZE,
-                "dirty-flag": false
-            },
-            "iops_wr": 0,
-            "ro": false,
-            "node-name": "disk",
-            "backing_file_depth": 0,
-            "drv": "IMGFMT",
-            "iops": 0,
-            "bps_wr": 0,
-            "write_threshold": 0,
-            "encrypted": false,
-            "bps": 0,
-            "bps_rd": 0,
-            "cache": {
-                "no-flush": false,
-                "direct": false,
-                "writeback": true
-            },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
-        },
-        {
-            "iops_rd": 0,
-            "detect_zeroes": "off",
-            "image": {
-                "virtual-size": 197120,
-                "filename": "TEST_DIR/t.IMGFMT",
-                "format": "file",
-                "actual-size": SIZE,
-                "dirty-flag": false
-            },
-            "iops_wr": 0,
-            "ro": false,
-            "node-name": "NODE_NAME",
-            "backing_file_depth": 0,
-            "drv": "file",
-            "iops": 0,
-            "bps_wr": 0,
-            "write_threshold": 0,
-            "encrypted": false,
-            "bps": 0,
-            "bps_rd": 0,
-            "cache": {
-                "no-flush": false,
-                "direct": false,
-                "writeback": true
-            },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
-        }
-    ]
-}
-{
-    "return": {
-    }
-}
-
-=== Empty drive with -device and device_del ===
-
-Testing: -device virtio-scsi -device scsi-cd,id=cd0
-{
-    QMP_VERSION
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-        {
-            "io-status": "ok",
-            "device": "",
-            "locked": false,
-            "removable": true,
-            "qdev": "cd0",
-            "tray_open": false,
-            "type": "unknown"
-        }
-    ]
-}
-{
-    "return": {
-    }
-}
-{
-    "return": {
-    }
-}
-{
-    "return": [
-    ]
-}
-{
-    "return": {
-    }
-}
-*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 9e4f7c0153..3432989283 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -88,7 +88,7 @@
 064 rw quick
 065 rw quick
 066 rw auto quick
-067 rw quick
+# 067 was removed, do not reuse
 068 rw quick
 069 rw auto quick
 070 rw quick
diff --git a/tests/qtest/drive_del-test.c b/tests/qtest/drive_del-test.c
index ff772b3671..8d08ee9995 100644
--- a/tests/qtest/drive_del-test.c
+++ b/tests/qtest/drive_del-test.c
@@ -16,21 +16,21 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qlist.h"
 
-static bool has_drive(QTestState *qts)
+static bool look_for_drive0(QTestState *qts, const char *command, const char *key)
 {
     QDict *response;
     QList *ret;
     QListEntry *entry;
     bool found;
 
-    response = qtest_qmp(qts, "{'execute': 'query-block'}");
+    response = qtest_qmp(qts, "{'execute': %s}", command);
     g_assert(response && qdict_haskey(response, "return"));
     ret = qdict_get_qlist(response, "return");
 
     found = false;
     QLIST_FOREACH_ENTRY(ret, entry) {
         QDict *entry_dict = qobject_to(QDict, entry->value);
-        if (!strcmp(qdict_get_str(entry_dict, "device"), "drive0")) {
+        if (!strcmp(qdict_get_str(entry_dict, key), "drive0")) {
             found = true;
             break;
         }
@@ -40,6 +40,38 @@ static bool has_drive(QTestState *qts)
     return found;
 }
 
+static bool has_drive(QTestState *qts)
+{
+    return look_for_drive0(qts, "query-block", "device");
+}
+
+static bool has_blockdev(QTestState *qts)
+{
+    return look_for_drive0(qts, "query-named-block-nodes", "node-name");
+}
+
+static void blockdev_add_with_media(QTestState *qts)
+{
+    QDict *response;
+
+    response = qtest_qmp(qts,
+                         "{ 'execute': 'blockdev-add',"
+                         "  'arguments': {"
+                         "      'driver': 'raw',"
+                         "      'node-name': 'drive0',"
+                         "      'file': {"
+                         "          'driver': 'null-co',"
+                         "          'read-zeroes': true"
+                         "      }"
+                         "  }"
+                         "}");
+
+    g_assert(response);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+    g_assert(has_blockdev(qts));
+}
+
 static void drive_add(QTestState *qts)
 {
     char *resp = qtest_hmp(qts, "drive_add 0 if=none,id=drive0");
@@ -49,6 +81,17 @@ static void drive_add(QTestState *qts)
     g_free(resp);
 }
 
+static void drive_add_with_media(QTestState *qts)
+{
+    char *resp = qtest_hmp(qts,
+                           "drive_add 0 if=none,id=drive0,file=null-co://,"
+                           "file.read-zeroes=on,format=raw");
+
+    g_assert_cmpstr(resp, ==, "OK\r\n");
+    g_assert(has_drive(qts));
+    g_free(resp);
+}
+
 static void drive_del(QTestState *qts)
 {
     char *resp;
@@ -60,7 +103,43 @@ static void drive_del(QTestState *qts)
     g_free(resp);
 }
 
-static void device_del(QTestState *qts)
+/*
+ * qvirtio_get_dev_type:
+ * Returns: the preferred virtio bus/device type for the current architecture.
+ * TODO: delete this
+ */
+static const char *qvirtio_get_dev_type(void)
+{
+    const char *arch = qtest_get_arch();
+
+    if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
+        return "device";  /* for virtio-mmio */
+    } else if (g_str_equal(arch, "s390x")) {
+        return "ccw";
+    } else {
+        return "pci";
+    }
+}
+
+static void device_add(QTestState *qts)
+{
+    QDict *response;
+    char driver[32];
+    snprintf(driver, sizeof(driver), "virtio-blk-%s",
+             qvirtio_get_dev_type());
+
+    response = qtest_qmp(qts, "{'execute': 'device_add',"
+                              " 'arguments': {"
+                              "   'driver': %s,"
+                              "   'drive': 'drive0',"
+                              "   'id': 'dev0'"
+                              "}}", driver);
+    g_assert(response);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void device_del(QTestState *qts, bool and_reset)
 {
     QDict *response;
 
@@ -70,6 +149,13 @@ static void device_del(QTestState *qts)
     g_assert(qdict_haskey(response, "return"));
     qobject_unref(response);
 
+    if (and_reset) {
+        response = qtest_qmp(qts, "{'execute': 'system_reset' }");
+        g_assert(response);
+        g_assert(qdict_haskey(response, "return"));
+        qobject_unref(response);
+    }
+
     qtest_qmp_eventwait(qts, "DEVICE_DELETED");
 }
 
@@ -91,24 +177,6 @@ static void test_drive_without_dev(void)
     qtest_quit(qts);
 }
 
-/*
- * qvirtio_get_dev_type:
- * Returns: the preferred virtio bus/device type for the current architecture.
- * TODO: delete this
- */
-static const char *qvirtio_get_dev_type(void)
-{
-    const char *arch = qtest_get_arch();
-
-    if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64")) {
-        return "device";  /* for virtio-mmio */
-    } else if (g_str_equal(arch, "s390x")) {
-        return "ccw";
-    } else {
-        return "pci";
-    }
-}
-
 static void test_after_failed_device_add(void)
 {
     char driver[32];
@@ -158,12 +226,97 @@ static void test_drive_del_device_del(void)
      * Doing it in this order takes notoriously tricky special paths
      */
     drive_del(qts);
-    device_del(qts);
+    device_del(qts, false);
     g_assert(!has_drive(qts));
 
     qtest_quit(qts);
 }
 
+static void test_cli_device_del(void)
+{
+    QTestState *qts;
+
+    /*
+     * -drive/-device and device_del.  Start with a drive used by a
+     * device that unplugs after reset.
+     */
+    qts = qtest_initf("-drive if=none,id=drive0,file=null-co://,"
+                      "file.read-zeroes=on,format=raw"
+                      " -device virtio-blk-%s,drive=drive0,id=dev0",
+                      qvirtio_get_dev_type());
+
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
+static void test_empty_device_del(void)
+{
+    QTestState *qts;
+
+    /* device_del with no drive plugged.  */
+    qts = qtest_initf("-device virtio-scsi-%s -device scsi-cd,id=dev0",
+                      qvirtio_get_dev_type());
+
+    device_del(qts, false);
+    qtest_quit(qts);
+}
+
+static void test_device_add_and_del(void)
+{
+    QTestState *qts;
+
+    /*
+     * -drive/device_add and device_del.  Start with a drive used by a
+     * device that unplugs after reset.
+     */
+    qts = qtest_init("-drive if=none,id=drive0,file=null-co://,"
+                     "file.read-zeroes=on,format=raw");
+
+    device_add(qts);
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
+static void test_drive_add_device_add_and_del(void)
+{
+    QTestState *qts;
+
+    qts = qtest_init("");
+
+    /*
+     * drive_add/device_add and device_del.  The drive is used by a
+     * device that unplugs after reset.
+     */
+    drive_add_with_media(qts);
+    device_add(qts);
+    device_del(qts, true);
+    g_assert(!has_drive(qts));
+
+    qtest_quit(qts);
+}
+
+static void test_blockdev_add_device_add_and_del(void)
+{
+    QTestState *qts;
+
+    qts = qtest_init("");
+
+    /*
+     * blockdev_add/device_add and device_del.  The it drive is used by a
+     * device that unplugs after reset, but it doesn't go away.
+     */
+    blockdev_add_with_media(qts);
+    device_add(qts);
+    device_del(qts, true);
+    g_assert(has_blockdev(qts));
+
+    qtest_quit(qts);
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -173,8 +326,18 @@ int main(int argc, char **argv)
     if (qvirtio_get_dev_type() != NULL) {
         qtest_add_func("/drive_del/after_failed_device_add",
                        test_after_failed_device_add);
-        qtest_add_func("/blockdev/drive_del_device_del",
+        qtest_add_func("/drive_del/drive_del_device_del",
                        test_drive_del_device_del);
+        qtest_add_func("/device_del/drive/cli_device",
+                       test_cli_device_del);
+        qtest_add_func("/device_del/drive/device_add",
+                       test_device_add_and_del);
+        qtest_add_func("/device_del/drive/drive_add_device_add",
+                       test_drive_add_device_add_and_del);
+        qtest_add_func("/device_del/empty",
+                       test_empty_device_del);
+        qtest_add_func("/device_del/blockdev",
+                       test_blockdev_add_device_add_and_del);
     }
 
     return g_test_run();
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 28bafc02a2..1c4b87e3e2 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -111,7 +111,7 @@ qtests_moxie = [ 'boot-serial-test' ]
 qtests_ppc = \
   (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : []) +            \
   (config_all_devices.has_key('CONFIG_M48T59') ? ['m48t59-test'] : []) +                     \
-  ['boot-order-test', 'prom-env-test', 'drive_del-test', 'boot-serial-test']                 \
+  ['boot-order-test', 'prom-env-test', 'boot-serial-test']                 \
 
 qtests_ppc64 = \
   (config_all_devices.has_key('CONFIG_PSERIES') ? ['device-plug-test'] : []) +               \
@@ -121,7 +121,7 @@ qtests_ppc64 = \
   (config_all_devices.has_key('CONFIG_USB_UHCI') ? ['usb-hcd-uhci-test'] : []) +             \
   (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ? ['usb-hcd-xhci-test'] : []) +         \
   (config_host.has_key('CONFIG_POSIX') ? ['test-filter-mirror'] : []) +                      \
-  qtests_pci + ['migration-test', 'numa-test', 'cpu-plug-test']
+  qtests_pci + ['migration-test', 'numa-test', 'cpu-plug-test', 'drive_del-test']
 
 qtests_sh4 = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
 qtests_sh4eb = (config_all_devices.has_key('CONFIG_ISA_TESTDEV') ? ['endianness-test'] : [])
-- 
2.26.2



