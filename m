Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9762D7D2D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:45:02 +0100 (CET)
Received: from localhost ([::1]:40934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmTV-0005x8-OW
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlv6-0004IB-TO
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluZ-0002HJ-Nw
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s8KcERNqQxzFl34w8yhz7YnvE6cyta9/a1xCZWPuoH8=;
 b=EVDq/Fa5cOdYMg72bpeQPf1mlocj8qas2P1yqCXxG/TO1RsuGo2RnBH7jNVHIDPXKVgxti
 +ECFeChdVji6yj8P1swPKMejTyfzbXOyXHPqkXH8r5EhsIVhe8zZavLWK2JgquQqAHUlix
 cFXB96m9SpC5RvMp1JBUxP+lxX7vilE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-jpfSp0_BPXm4Ulgal0tR3Q-1; Fri, 11 Dec 2020 12:08:52 -0500
X-MC-Unique: jpfSp0_BPXm4Ulgal0tR3Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7054180E469;
 Fri, 11 Dec 2020 17:08:50 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C64E25D6A8;
 Fri, 11 Dec 2020 17:08:49 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/34] iotests/308: Add test for FUSE exports
Date: Fri, 11 Dec 2020 18:08:02 +0100
Message-Id: <20201211170812.228643-25-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

We have good coverage of the normal I/O paths now, but what remains is a
test that tests some more special cases: Exporting an image on itself
(thus turning a formatted image into a raw one), some error cases, and
non-writable and non-growable exports.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-21-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/308     | 339 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/308.out |  97 +++++++++++
 tests/qemu-iotests/group   |   1 +
 3 files changed, 437 insertions(+)
 create mode 100755 tests/qemu-iotests/308
 create mode 100644 tests/qemu-iotests/308.out

diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
new file mode 100755
index 0000000000..b30f4400f6
--- /dev/null
+++ b/tests/qemu-iotests/308
@@ -0,0 +1,339 @@
+#!/usr/bin/env bash
+#
+# Test FUSE exports (in ways that are not captured by the generic
+# tests)
+#
+# Copyright (C) 2020 Red Hat, Inc.
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
+    rmdir "$EXT_MP" 2>/dev/null
+    rm -f "$EXT_MP"
+    rm -f "$COPIED_IMG"
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.qemu
+
+# Generic format, but needs a plain filename
+_supported_fmt generic
+if [ "$IMGOPTSSYNTAX" = "true" ]; then
+    _unsupported_fmt $IMGFMT
+fi
+# We need the image to have exactly the specified size, and VPC does
+# not allow that by default
+_unsupported_fmt vpc
+
+_supported_proto file # We create the FUSE export manually
+_supported_os Linux # We need /dev/urandom
+
+# $1: Export ID
+# $2: Options (beyond the node-name and ID)
+# $3: Expected return value (defaults to 'return')
+# $4: Node to export (defaults to 'node-format')
+fuse_export_add()
+{
+    _send_qemu_cmd $QEMU_HANDLE \
+        "{'execute': 'block-export-add',
+          'arguments': {
+              'type': 'fuse',
+              'id': '$1',
+              'node-name': '${4:-node-format}',
+              $2
+          } }" \
+        "${3:-return}" \
+        | _filter_imgfmt
+}
+
+# $1: Export ID
+fuse_export_del()
+{
+    _send_qemu_cmd $QEMU_HANDLE \
+        "{'execute': 'block-export-del',
+          'arguments': {
+              'id': '$1'
+          } }" \
+        'return'
+
+    _send_qemu_cmd $QEMU_HANDLE \
+        '' \
+        'BLOCK_EXPORT_DELETED'
+}
+
+# Return the length of the protocol file
+# $1: Protocol node export mount point
+# $2: Original file (to compare)
+get_proto_len()
+{
+    len1=$(stat -c '%s' "$1")
+    len2=$(stat -c '%s' "$2")
+
+    if [ "$len1" != "$len2" ]; then
+        echo 'ERROR: Length of export and original differ:' >&2
+        echo "$len1 != $len2" >&2
+    else
+        echo '(OK: Lengths of export and original are the same)' >&2
+    fi
+
+    echo "$len1"
+}
+
+COPIED_IMG="$TEST_IMG.copy"
+EXT_MP="$TEST_IMG.fuse"
+
+echo '=== Set up ==='
+
+# Create image with random data
+_make_test_img 64M
+$QEMU_IO -c 'write -s /dev/urandom 0 64M' "$TEST_IMG" | _filter_qemu_io
+
+_launch_qemu
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'qmp_capabilities'}" \
+    'return'
+
+# Separate blockdev-add calls for format and protocol so we can remove
+# the format layer later on
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'blockdev-add',
+      'arguments': {
+          'driver': 'file',
+          'node-name': 'node-protocol',
+          'filename': '$TEST_IMG'
+      } }" \
+    'return'
+
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'blockdev-add',
+      'arguments': {
+          'driver': '$IMGFMT',
+          'node-name': 'node-format',
+          'file': 'node-protocol'
+      } }" \
+    'return'
+
+echo
+echo '=== Mountpoint not present ==='
+
+rmdir "$EXT_MP" 2>/dev/null
+rm -f "$EXT_MP"
+output=$(fuse_export_add 'export-err' "'mountpoint': '$EXT_MP'" error)
+
+if echo "$output" | grep -q "Invalid parameter 'fuse'"; then
+    _notrun 'No FUSE support'
+fi
+
+echo "$output"
+
+echo
+echo '=== Mountpoint is a directory ==='
+
+mkdir "$EXT_MP"
+fuse_export_add 'export-err' "'mountpoint': '$EXT_MP'" error
+rmdir "$EXT_MP"
+
+echo
+echo '=== Mountpoint is a regular file ==='
+
+touch "$EXT_MP"
+fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP'"
+
+# Check that the export presents the same data as the original image
+$QEMU_IMG compare -f raw -F $IMGFMT -U "$EXT_MP" "$TEST_IMG"
+
+echo
+echo '=== Mount over existing file ==='
+
+# This is the coolest feature of FUSE exports: You can transparently
+# make images in any format appear as raw images
+fuse_export_add 'export-img' "'mountpoint': '$TEST_IMG'"
+
+# Accesses both exports at the same time, so we get a concurrency test
+$QEMU_IMG compare -f raw -F raw -U "$EXT_MP" "$TEST_IMG"
+
+# Just to be sure, we later want to compare the data offline.  Also,
+# this allows us to see that cp works without complaining.
+# (This is not a given, because cp will expect a short read at EOF.
+# Internally, qemu does not allow short reads, so we have to check
+# whether the FUSE export driver lets them work.)
+cp "$TEST_IMG" "$COPIED_IMG"
+
+# $TEST_IMG will be in mode 0400 because it is read-only; we are going
+# to write to the copy, so make it writable
+chmod 0600 "$COPIED_IMG"
+
+echo
+echo '=== Double export ==='
+
+# We have already seen that exporting a node twice works fine, but you
+# cannot export anything twice on the same mount point.  The reason is
+# that qemu has to stat the given mount point, and this would have to
+# be answered by the same qemu instance if it already has an export
+# there.  However, it cannot answer the stat because it is itself
+# caught up in that same stat.
+fuse_export_add 'export-err' "'mountpoint': '$EXT_MP'" error
+
+echo
+echo '=== Remove export ==='
+
+# Double-check that $EXT_MP appears as a non-empty file (the raw image)
+$QEMU_IMG info -f raw "$EXT_MP" | grep 'virtual size'
+
+fuse_export_del 'export-mp'
+
+# See that the file appears empty again
+$QEMU_IMG info -f raw "$EXT_MP" | grep 'virtual size'
+
+echo
+echo '=== Writable export ==='
+
+fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP', 'writable': true"
+
+# Check that writing to the read-only export fails
+$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" | _filter_qemu_io
+
+# But here it should work
+$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$EXT_MP" | _filter_qemu_io
+
+# (Adjust the copy, too)
+$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$COPIED_IMG" | _filter_qemu_io
+
+echo
+echo '=== Resizing exports ==='
+
+# Here, we need to export the protocol node -- the format layer may
+# not be growable, simply because the format does not support it.
+
+# Remove all exports and the format node first so permissions will not
+# get in the way
+fuse_export_del 'export-mp'
+fuse_export_del 'export-img'
+
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'blockdev-del',
+      'arguments': {
+          'node-name': 'node-format'
+      } }" \
+    'return'
+
+# Now export the protocol node
+fuse_export_add \
+    'export-mp' \
+    "'mountpoint': '$EXT_MP', 'writable': true" \
+    'return' \
+    'node-protocol'
+
+echo
+echo '--- Try growing non-growable export ---'
+
+# Get the current size so we can write beyond the EOF
+orig_len=$(get_proto_len "$EXT_MP" "$TEST_IMG")
+orig_disk_usage=$(stat -c '%b' "$TEST_IMG")
+
+# Should fail (exports are non-growable by default)
+# (Note that qemu-io can never write beyond the EOF, so we have to use
+# dd here)
+dd if=/dev/zero of="$EXT_MP" bs=1 count=64k seek=$orig_len 2>&1 \
+    | _filter_testdir | _filter_imgfmt
+
+echo
+echo '--- Resize export ---'
+
+# But we can truncate it explicitly; even with fallocate
+fallocate -o "$orig_len" -l 64k "$EXT_MP"
+
+new_len=$(get_proto_len "$EXT_MP" "$TEST_IMG")
+if [ "$new_len" != "$((orig_len + 65536))" ]; then
+    echo 'ERROR: Unexpected post-truncate image size:'
+    echo "$new_len != $((orig_len + 65536))"
+else
+    echo 'OK: Post-truncate image size is as expected'
+fi
+
+new_disk_usage=$(stat -c '%b' "$TEST_IMG")
+if [ "$new_disk_usage" -gt "$orig_disk_usage" ]; then
+    echo 'OK: Disk usage grew with fallocate'
+else
+    echo 'ERROR: Disk usage did not grow despite fallocate:'
+    echo "$orig_disk_usage => $new_disk_usage"
+fi
+
+echo
+echo '--- Try growing growable export ---'
+
+# Now export as growable
+fuse_export_del 'export-mp'
+fuse_export_add \
+    'export-mp' \
+    "'mountpoint': '$EXT_MP', 'writable': true, 'growable': true" \
+    'return' \
+    'node-protocol'
+
+# Now we should be able to write beyond the EOF
+dd if=/dev/zero of="$EXT_MP" bs=1 count=64k seek=$new_len 2>&1 \
+    | _filter_testdir | _filter_imgfmt
+
+new_len=$(get_proto_len "$EXT_MP" "$TEST_IMG")
+if [ "$new_len" != "$((orig_len + 131072))" ]; then
+    echo 'ERROR: Unexpected post-grow image size:'
+    echo "$new_len != $((orig_len + 131072))"
+else
+    echo 'OK: Post-grow image size is as expected'
+fi
+
+echo
+echo '--- Shrink export ---'
+
+# Now go back to the original size
+truncate -s "$orig_len" "$EXT_MP"
+
+new_len=$(get_proto_len "$EXT_MP" "$TEST_IMG")
+if [ "$new_len" != "$orig_len" ]; then
+    echo 'ERROR: Unexpected post-truncate image size:'
+    echo "$new_len != $orig_len"
+else
+    echo 'OK: Post-truncate image size is as expected'
+fi
+
+echo
+echo '=== Tear down ==='
+
+_send_qemu_cmd $QEMU_HANDLE \
+    "{'execute': 'quit'}" \
+    'return'
+
+wait=yes _cleanup_qemu
+
+echo
+echo '=== Compare copy with original ==='
+
+$QEMU_IMG compare -f raw -F $IMGFMT "$COPIED_IMG" "$TEST_IMG"
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
new file mode 100644
index 0000000000..b93aceed2e
--- /dev/null
+++ b/tests/qemu-iotests/308.out
@@ -0,0 +1,97 @@
+QA output created by 308
+=== Set up ===
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+wrote 67108864/67108864 bytes at offset 0
+64 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+{'execute': 'qmp_capabilities'}
+{"return": {}}
+{'execute': 'blockdev-add', 'arguments': { 'driver': 'file', 'node-name': 'node-protocol', 'filename': 'TEST_DIR/t.IMGFMT' } }
+{"return": {}}
+{'execute': 'blockdev-add', 'arguments': { 'driver': 'IMGFMT', 'node-name': 'node-format', 'file': 'node-protocol' } }
+{"return": {}}
+
+=== Mountpoint not present ===
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-err', 'node-name': 'node-format', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse' } }
+{"error": {"class": "GenericError", "desc": "Failed to stat 'TEST_DIR/t.IMGFMT.fuse': No such file or directory"}}
+
+=== Mountpoint is a directory ===
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-err', 'node-name': 'node-format', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse' } }
+{"error": {"class": "GenericError", "desc": "'TEST_DIR/t.IMGFMT.fuse' is not a regular file"}}
+
+=== Mountpoint is a regular file ===
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-mp', 'node-name': 'node-format', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse' } }
+{"return": {}}
+Images are identical.
+
+=== Mount over existing file ===
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-img', 'node-name': 'node-format', 'mountpoint': 'TEST_DIR/t.IMGFMT' } }
+{"return": {}}
+Images are identical.
+
+=== Double export ===
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-err', 'node-name': 'node-format', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse' } }
+{"error": {"class": "GenericError", "desc": "There already is a FUSE export on 'TEST_DIR/t.IMGFMT.fuse'"}}
+
+=== Remove export ===
+virtual size: 64 MiB (67108864 bytes)
+{'execute': 'block-export-del', 'arguments': { 'id': 'export-mp' } }
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export-mp"}}
+virtual size: 0 B (0 bytes)
+
+=== Writable export ===
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-mp', 'node-name': 'node-format', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true } }
+{"return": {}}
+write failed: Permission denied
+wrote 65536/65536 bytes at offset 1048576
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 1048576
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+=== Resizing exports ===
+{'execute': 'block-export-del', 'arguments': { 'id': 'export-mp' } }
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export-mp"}}
+{'execute': 'block-export-del', 'arguments': { 'id': 'export-img' } }
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export-img"}}
+{'execute': 'blockdev-del', 'arguments': { 'node-name': 'node-format' } }
+{"return": {}}
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-mp', 'node-name': 'node-protocol', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true } }
+{"return": {}}
+
+--- Try growing non-growable export ---
+(OK: Lengths of export and original are the same)
+dd: error writing 'TEST_DIR/t.IMGFMT.fuse': Input/output error
+1+0 records in
+0+0 records out
+
+--- Resize export ---
+(OK: Lengths of export and original are the same)
+OK: Post-truncate image size is as expected
+OK: Disk usage grew with fallocate
+
+--- Try growing growable export ---
+{'execute': 'block-export-del', 'arguments': { 'id': 'export-mp' } }
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export-mp"}}
+{'execute': 'block-export-add', 'arguments': { 'type': 'fuse', 'id': 'export-mp', 'node-name': 'node-protocol', 'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true, 'growable': true } }
+{"return": {}}
+65536+0 records in
+65536+0 records out
+(OK: Lengths of export and original are the same)
+OK: Post-grow image size is as expected
+
+--- Shrink export ---
+(OK: Lengths of export and original are the same)
+OK: Post-truncate image size is as expected
+
+=== Tear down ===
+{'execute': 'quit'}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export-mp"}}
+
+=== Compare copy with original ===
+Images are identical.
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index 2960dff728..9a8394b4cd 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -315,4 +315,5 @@
 304 rw quick
 305 rw quick
 307 rw quick export
+308 rw
 309 rw auto quick
-- 
2.29.2


