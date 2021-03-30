Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890C34E7EE
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 14:53:17 +0200 (CEST)
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRDrw-0003wd-2z
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 08:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfe-00017h-1b
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRDfW-0003Ww-0R
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 08:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617108025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pqZQIms9YMfRAaG1TL/hv7yX/gB0kV4uhCEXI6Anp8c=;
 b=LBfIdpYZYBetzA7RkmZGk/WuPGK2gl7OsAhQ9RwXxrpWitADlvqYZo7ep3onX6QTURkYOy
 uMkqDAoJYHlDZfkSiT+eqKzK4cIPgqr/iKK9H89e7HWryWajBEHY2XzlHmd/8aUJTC4G62
 ZvdG3nz658hUZDjbUU3LbSlj5RUK5mg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-ZHJ4dnO3OsutkSeIf8zsqw-1; Tue, 30 Mar 2021 08:40:20 -0400
X-MC-Unique: ZHJ4dnO3OsutkSeIf8zsqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E75A18030BB;
 Tue, 30 Mar 2021 12:40:19 +0000 (UTC)
Received: from localhost (ovpn-113-220.ams2.redhat.com [10.36.113.220])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5607A5D9CC;
 Tue, 30 Mar 2021 12:40:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 9/9] iotests/244: Test preallocation for data-file-raw
Date: Tue, 30 Mar 2021 14:39:57 +0200
Message-Id: <20210330123957.826170-10-mreitz@redhat.com>
In-Reply-To: <20210330123957.826170-1-mreitz@redhat.com>
References: <20210330123957.826170-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Three test cases:
(1) Adding a qcow2 (metadata) file to an existing data file, see whether
    we can read the existing data through the qcow2 image.
(2) Append data to the data file, grow the qcow2 image accordingly, see
    whether we can read the new data through the qcow2 image.
(3) At runtime, add a backing image to a freshly created qcow2 image
    with an external data file (with data-file-raw).  Reading data from
    the qcow2 image must return the same result as reading data from the
    data file, so everything in the backing image must be ignored.
    (This did not use to be the case, because without the L2 tables
    preallocated, all clusters would appear as unallocated, and so the
    qcow2 driver would fall through to the backing file.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210326145509.163455-3-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/244     | 104 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/244.out |  59 +++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
index a46b441627..3e61fa25bb 100755
--- a/tests/qemu-iotests/244
+++ b/tests/qemu-iotests/244
@@ -38,6 +38,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 # get standard environment, filters and checks
 . ./common.rc
 . ./common.filter
+. ./common.qemu
 
 _supported_fmt qcow2
 _supported_proto file
@@ -267,6 +268,109 @@ case $result in
         ;;
 esac
 
+echo
+echo '=== Preallocation with data-file-raw ==='
+
+echo
+echo '--- Using a non-zeroed data file ---'
+
+# Using data-file-raw must enforce at least metadata preallocation so
+# that it does not matter whether one reads the raw file or the qcow2
+# file
+
+# Pre-create the data file, write some data.  Real-world use cases for
+# this are adding a qcow2 metadata file to a block device (i.e., using
+# the device as the data file) or adding qcow2 features to pre-existing
+# raw images (e.g. because the user now wants persistent dirty bitmaps).
+truncate -s 1M "$TEST_IMG.data"
+$QEMU_IO -f raw -c 'write -P 42 0 1M' "$TEST_IMG.data" | _filter_qemu_io
+
+# We cannot use qemu-img to create the qcow2 image, because it would
+# clear the data file.  Use the blockdev-create job instead, which will
+# only format the qcow2 image file.
+touch "$TEST_IMG"
+_launch_qemu \
+    -blockdev file,node-name=data,filename="$TEST_IMG.data" \
+    -blockdev file,node-name=meta,filename="$TEST_IMG"
+
+_send_qemu_cmd $QEMU_HANDLE '{ "execute": "qmp_capabilities" }' 'return'
+
+_send_qemu_cmd $QEMU_HANDLE \
+    '{ "execute": "blockdev-create",
+       "arguments": {
+           "job-id": "create",
+           "options": {
+               "driver": "qcow2",
+               "size": '"$((1 * 1024 * 1024))"',
+               "file": "meta",
+               "data-file": "data",
+               "data-file-raw": true
+           } } }' \
+    '"status": "concluded"'
+
+_send_qemu_cmd $QEMU_HANDLE \
+    '{ "execute": "job-dismiss", "arguments": { "id": "create" } }' \
+    'return'
+
+_cleanup_qemu
+
+echo
+echo 'Comparing pattern:'
+
+# Reading from either the qcow2 file or the data file should return
+# the same result:
+$QEMU_IO -f raw -c 'read -P 42 0 1M' "$TEST_IMG.data" | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c 'read -P 42 0 1M' "$TEST_IMG" | _filter_qemu_io
+
+# For good measure
+$QEMU_IMG compare -f raw "$TEST_IMG.data" "$TEST_IMG"
+
+echo
+echo '--- Truncation (growing) ---'
+
+# Append some new data to the raw file, then resize the qcow2 image
+# accordingly and see whether the new data is visible.  Technically
+# that is not allowed, but it is reasonable behavior, so test it.
+truncate -s 2M "$TEST_IMG.data"
+$QEMU_IO -f raw -c 'write -P 84 1M 1M' "$TEST_IMG.data" | _filter_qemu_io
+
+$QEMU_IMG resize "$TEST_IMG" 2M
+
+echo
+echo 'Comparing pattern:'
+
+$QEMU_IO -f raw -c 'read -P 42 0 1M' -c 'read -P 84 1M 1M' "$TEST_IMG.data" \
+    | _filter_qemu_io
+$QEMU_IO -f $IMGFMT -c 'read -P 42 0 1M' -c 'read -P 84 1M 1M' "$TEST_IMG" \
+    | _filter_qemu_io
+
+$QEMU_IMG compare -f raw "$TEST_IMG.data" "$TEST_IMG"
+
+echo
+echo '--- Giving a backing file at runtime ---'
+
+# qcow2 files with data-file-raw cannot have backing files given by
+# their image header, but qemu will allow you to set a backing node at
+# runtime -- it should not have any effect, though (because reading
+# from the qcow2 node should return the same data as reading from the
+# raw node).
+
+_make_test_img -o "data_file=$TEST_IMG.data,data_file_raw=on" 1M
+TEST_IMG="$TEST_IMG.base" _make_test_img 1M
+
+# Write something that is not zero into the base image
+$QEMU_IO -c 'write -P 42 0 1M' "$TEST_IMG.base" | _filter_qemu_io
+
+echo
+echo 'Comparing qcow2 image and raw data file:'
+
+# $TEST_IMG and $TEST_IMG.data must show the same data at all times;
+# that is, the qcow2 node must not fall through to the backing image
+# at any point
+$QEMU_IMG compare --image-opts \
+    "driver=raw,file.filename=$TEST_IMG.data"  \
+    "file.filename=$TEST_IMG,backing.file.filename=$TEST_IMG.base"
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/244.out b/tests/qemu-iotests/244.out
index 1a3ae31dde..99f56ac18c 100644
--- a/tests/qemu-iotests/244.out
+++ b/tests/qemu-iotests/244.out
@@ -137,4 +137,63 @@ wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 Success: qemu-io failed, so the data file was flushed
+
+=== Preallocation with data-file-raw ===
+
+--- Using a non-zeroed data file ---
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+{ "execute": "qmp_capabilities" }
+{"return": {}}
+{ "execute": "blockdev-create",
+       "arguments": {
+           "job-id": "create",
+           "options": {
+               "driver": "IMGFMT",
+               "size": 1048576,
+               "file": "meta",
+               "data-file": "data",
+               "data-file-raw": true
+           } } }
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "create"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "create"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "create"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "create"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "create"}}
+{ "execute": "job-dismiss", "arguments": { "id": "create" } }
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "create"}}
+{"return": {}}
+
+Comparing pattern:
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Images are identical.
+
+--- Truncation (growing) ---
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Image resized.
+
+Comparing pattern:
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Images are identical.
+
+--- Giving a backing file at runtime ---
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576 data_file=TEST_DIR/t.IMGFMT.data data_file_raw=on
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1048576
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+Comparing qcow2 image and raw data file:
+Images are identical.
 *** done
-- 
2.29.2


