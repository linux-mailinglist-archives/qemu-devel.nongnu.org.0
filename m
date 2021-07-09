Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6C3C23F3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 15:03:55 +0200 (CEST)
Received: from localhost ([::1]:46098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1qAc-0008Ti-HK
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 09:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pz0-0004gM-De
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m1pyx-0003d1-SG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 08:51:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625835111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wxR01XQHtjyGba4gMbq6xoH9JiVMI1wyONs7DwE+meU=;
 b=MCZ8g0nd982YxXo35gTo9x/UK/xwcVknepf/8kEeLHLQZhkF1FwBHuxf4u1XX4leCo24cF
 my33v8nN52KK9U0qxrAkEomEQvsra/HAGuI63/j1+Cc8/exXrd43Mwyc3nuyzDX2bx5s0z
 t1ezobuQqmunanL2h74fPb7mkHpTirA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-ZpmX_UBqMTKe4Nl_7Nq7TQ-1; Fri, 09 Jul 2021 08:51:49 -0400
X-MC-Unique: ZpmX_UBqMTKe4Nl_7Nq7TQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2726D362F9;
 Fri,  9 Jul 2021 12:51:48 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-113-203.ams2.redhat.com [10.36.113.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3900F60843;
 Fri,  9 Jul 2021 12:51:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/28] iotests/fuse-allow-other: Test allow-other
Date: Fri,  9 Jul 2021 14:50:22 +0200
Message-Id: <20210709125035.191321-16-kwolf@redhat.com>
In-Reply-To: <20210709125035.191321-1-kwolf@redhat.com>
References: <20210709125035.191321-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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

From: Max Reitz <mreitz@redhat.com>

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210625142317.271673-7-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/tests/fuse-allow-other     | 168 ++++++++++++++++++
 tests/qemu-iotests/tests/fuse-allow-other.out |  88 +++++++++
 2 files changed, 256 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/fuse-allow-other
 create mode 100644 tests/qemu-iotests/tests/fuse-allow-other.out

diff --git a/tests/qemu-iotests/tests/fuse-allow-other b/tests/qemu-iotests/tests/fuse-allow-other
new file mode 100755
index 0000000000..19f494aefb
--- /dev/null
+++ b/tests/qemu-iotests/tests/fuse-allow-other
@@ -0,0 +1,168 @@
+#!/usr/bin/env bash
+# group: rw
+#
+# Test FUSE exports' allow-other option
+#
+# Copyright (C) 2021 Red Hat, Inc.
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
+seq=$(basename "$0")
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _cleanup_qemu
+    _cleanup_test_img
+    rm -f "$EXT_MP"
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ../common.rc
+. ../common.filter
+. ../common.qemu
+
+_supported_fmt generic
+
+_supported_proto file # We create the FUSE export manually
+
+sudo -n -u nobody true || \
+    _notrun 'Password-less sudo as nobody required to test allow_other'
+
+# $1: Export ID
+# $2: Options (beyond the node-name and ID)
+# $3: Expected return value (defaults to 'return')
+# $4: Node to export (defaults to 'node-format')
+fuse_export_add()
+{
+    allow_other_not_supported='option allow_other only allowed if'
+
+    output=$(
+        success_or_failure=yes _send_qemu_cmd $QEMU_HANDLE \
+            "{'execute': 'block-export-add',
+              'arguments': {
+                  'type': 'fuse',
+                  'id': '$1',
+                  'node-name': '${4:-node-format}',
+                  $2
+              } }" \
+            "${3:-return}" \
+            "$allow_other_not_supported" \
+            | _filter_imgfmt
+    )
+
+    if echo "$output" | grep -q "$allow_other_not_supported"; then
+        # Shut down qemu gracefully so it can unmount the export
+        _send_qemu_cmd $QEMU_HANDLE \
+            "{'execute': 'quit'}" \
+            'return'
+
+        wait=yes _cleanup_qemu
+
+        _notrun "allow_other not supported"
+    fi
+
+    echo "$output"
+}
+
+EXT_MP="$TEST_DIR/fuse-export"
+
+_make_test_img 64k
+touch "$EXT_MP"
+
+echo
+echo '=== Test permissions ==='
+
+# $1: allow-other value ('on'/'off'/'auto')
+run_permission_test()
+{
+    _launch_qemu \
+        -blockdev \
+        "$IMGFMT,node-name=node-format,file.driver=file,file.filename=$TEST_IMG"
+
+    _send_qemu_cmd $QEMU_HANDLE \
+        "{'execute': 'qmp_capabilities'}" \
+        'return'
+
+    fuse_export_add 'export' \
+        "'mountpoint': '$EXT_MP',
+         'allow-other': '$1'"
+
+    # Should always work
+    echo '(Removing all permissions)'
+    chmod 000 "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+    stat -c 'Permissions post-chmod: %a' "$EXT_MP"
+
+    # Should always work
+    echo '(Granting u+r)'
+    chmod u+r "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+    stat -c 'Permissions post-chmod: %a' "$EXT_MP"
+
+    # Should only work with allow-other: Otherwise, no permissions can be
+    # granted to the group or others
+    echo '(Granting read permissions for everyone)'
+    chmod 444 "$EXT_MP" 2>&1 | _filter_testdir | _filter_imgfmt
+    stat -c 'Permissions post-chmod: %a' "$EXT_MP"
+
+    echo 'Doing operations as nobody:'
+    # Change to TEST_DIR, so nobody will not have to attempt a lookup
+    pushd "$TEST_DIR" >/dev/null
+
+    # This is already prevented by the permissions (without allow-other, FUSE
+    # exports always have o-r), but test it anyway
+    sudo -n -u nobody cat fuse-export >/dev/null
+
+    # If the only problem were the lack of permissions, we should still be able
+    # to stat the export as nobody; it should not work without allow-other,
+    # though
+    sudo -n -u nobody \
+        stat -c 'Permissions seen by nobody: %a' fuse-export 2>&1 \
+        | _filter_imgfmt
+
+    # To prove the point, revoke read permissions for others and try again
+    chmod o-r fuse-export 2>&1 | _filter_testdir | _filter_imgfmt
+
+    # Should fail
+    sudo -n -u nobody cat fuse-export >/dev/null
+    # Should work with allow_other
+    sudo -n -u nobody \
+        stat -c 'Permissions seen by nobody: %a' fuse-export 2>&1 \
+        | _filter_imgfmt
+
+    popd >/dev/null
+
+    _send_qemu_cmd $QEMU_HANDLE \
+        "{'execute': 'quit'}" \
+        'return'
+
+    wait=yes _cleanup_qemu
+}
+
+# 'auto' should behave exactly like 'on', because 'on' tests that
+# allow_other works (otherwise, this test is skipped)
+for ao in off on auto; do
+    echo
+    echo "--- allow-other=$ao ---"
+
+    run_permission_test "$ao"
+done
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/fuse-allow-other.out b/tests/qemu-iotests/tests/fuse-allow-other.out
new file mode 100644
index 0000000000..543fa52a06
--- /dev/null
+++ b/tests/qemu-iotests/tests/fuse-allow-other.out
@@ -0,0 +1,88 @@
+QA output created by fuse-allow-other
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=65536
+
+=== Test permissions ===
+
+--- allow-other=off ---
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'block-export-add',
+              'arguments': {
+                  'type': 'fuse',
+                  'id': 'export',
+                  'node-name': 'node-format',
+                  'mountpoint': 'TEST_DIR/fuse-export',
+         'allow-other': 'off'
+              } }
+{"return": {}}
+(Removing all permissions)
+Permissions post-chmod: 0
+(Granting u+r)
+Permissions post-chmod: 400
+(Granting read permissions for everyone)
+chmod: changing permissions of 'TEST_DIR/fuse-export': Operation not permitted
+Permissions post-chmod: 400
+Doing operations as nobody:
+cat: fuse-export: Permission denied
+stat: cannot statx 'fuse-export': Permission denied
+cat: fuse-export: Permission denied
+stat: cannot statx 'fuse-export': Permission denied
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export"}}
+
+--- allow-other=on ---
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'block-export-add',
+              'arguments': {
+                  'type': 'fuse',
+                  'id': 'export',
+                  'node-name': 'node-format',
+                  'mountpoint': 'TEST_DIR/fuse-export',
+         'allow-other': 'on'
+              } }
+{"return": {}}
+(Removing all permissions)
+Permissions post-chmod: 0
+(Granting u+r)
+Permissions post-chmod: 400
+(Granting read permissions for everyone)
+Permissions post-chmod: 444
+Doing operations as nobody:
+Permissions seen by nobody: 444
+cat: fuse-export: Permission denied
+Permissions seen by nobody: 440
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export"}}
+
+--- allow-other=auto ---
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'block-export-add',
+              'arguments': {
+                  'type': 'fuse',
+                  'id': 'export',
+                  'node-name': 'node-format',
+                  'mountpoint': 'TEST_DIR/fuse-export',
+         'allow-other': 'auto'
+              } }
+{"return": {}}
+(Removing all permissions)
+Permissions post-chmod: 0
+(Granting u+r)
+Permissions post-chmod: 400
+(Granting read permissions for everyone)
+Permissions post-chmod: 444
+Doing operations as nobody:
+Permissions seen by nobody: 444
+cat: fuse-export: Permission denied
+Permissions seen by nobody: 440
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export"}}
+*** done
-- 
2.31.1


