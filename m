Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55E47D151
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:52:44 +0100 (CET)
Received: from localhost ([::1]:35686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n00Al-0000y6-Sq
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:52:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000W-0004IY-NP
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n000U-00085N-G0
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640173325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9RmymRulc9pH203Gj/j21Kt5Cc46uTBP82yKJPGkMaY=;
 b=GD00mM7QK6GAD+/r1KHLIQl/fgVf554e6xDZ53fa/Hbp0iW4lazMyy/zhK6Lk8GtaAXTb5
 hE49kXiWECW6WP275OFNzXOjypxB6wDB1KR7RNRJAqFQMEH+2objOCSbUyNoscKeTbQShb
 KyqW0EhAnpwyqrTVlk0Zqr6uXTyklEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-1CpK-c2qORWunc71Y72Ghw-1; Wed, 22 Dec 2021 06:42:04 -0500
X-MC-Unique: 1CpK-c2qORWunc71Y72Ghw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCC71006AA4;
 Wed, 22 Dec 2021 11:42:03 +0000 (UTC)
Received: from localhost (unknown [10.39.194.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43E876A023;
 Wed, 22 Dec 2021 11:42:03 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 3/3] iotests/185: Add post-READY quit tests
Date: Wed, 22 Dec 2021 12:41:53 +0100
Message-Id: <20211222114153.67721-4-hreitz@redhat.com>
In-Reply-To: <20211222114153.67721-1-hreitz@redhat.com>
References: <20211222114153.67721-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

185 tests quitting qemu while a block job is active.  It does not
specifically test quitting qemu while a mirror or active commit job is
in its READY phase.

Add two test cases for this, where we respectively mirror or commit to
an external QSD instance, which provides a throttled block device.  qemu
is supposed to cancel the job so that it can quit as soon as possible
instead of waiting for the job to complete (which it did before 6.2).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/185     | 190 ++++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/185.out |  48 ++++++++++
 2 files changed, 237 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
index f2ec5c5ceb..8b1143dc16 100755
--- a/tests/qemu-iotests/185
+++ b/tests/qemu-iotests/185
@@ -33,6 +33,12 @@ _cleanup()
     _rm_test_img "${TEST_IMG}.copy"
     _cleanup_test_img
     _cleanup_qemu
+
+    if [ -f "$TEST_DIR/qsd.pid" ]; then
+        kill -SIGKILL "$(cat "$TEST_DIR/qsd.pid")"
+        rm -f "$TEST_DIR/qsd.pid"
+    fi
+    rm -f "$SOCK_DIR/qsd.sock"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
 
@@ -45,7 +51,7 @@ _supported_fmt qcow2
 _supported_proto file
 _supported_os Linux
 
-size=64M
+size=$((64 * 1048576))
 TEST_IMG="${TEST_IMG}.base" _make_test_img $size
 
 echo
@@ -216,6 +222,188 @@ wait=1 _cleanup_qemu | grep -v 'JOB_STATUS_CHANGE'
 
 _check_test_img
 
+echo
+echo === Start mirror to throttled QSD and exit qemu ===
+echo
+
+# Mirror to a throttled QSD instance (so that qemu cannot drain the
+# throttling), wait for READY, then write some data to the device,
+# and then quit qemu.
+# (qemu should force-cancel the job and not wait for the data to be
+# written to the target.)
+
+_make_test_img $size
+
+# Will be used by this and the next case
+set_up_throttled_qsd() {
+    $QSD \
+        --object throttle-group,id=thrgr,limits.bps-total=1048576 \
+        --blockdev null-co,node-name=null,size=$size \
+        --blockdev throttle,node-name=throttled,throttle-group=thrgr,file=null \
+        --nbd-server addr.type=unix,addr.path="$SOCK_DIR/qsd.sock" \
+        --export nbd,id=exp,node-name=throttled,name=target,writable=true \
+        --pidfile "$TEST_DIR/qsd.pid" \
+        --daemonize
+}
+
+set_up_throttled_qsd
+
+# Need a virtio-blk device so that qemu-io writes will not block the monitor
+_launch_qemu \
+    --blockdev file,node-name=source-proto,filename="$TEST_IMG" \
+    --blockdev qcow2,node-name=source-fmt,file=source-proto \
+    --device virtio-blk,id=vblk,drive=source-fmt \
+    --blockdev "{\"driver\": \"nbd\",
+                 \"node-name\": \"target\",
+                 \"server\": {
+                     \"type\": \"unix\",
+                     \"path\": \"$SOCK_DIR/qsd.sock\"
+                 },
+                 \"export\": \"target\"}"
+
+h=$QEMU_HANDLE
+_send_qemu_cmd $h '{"execute": "qmp_capabilities"}' 'return'
+
+# Use sync=top, so the first pass will not copy the whole image
+_send_qemu_cmd $h \
+    '{"execute": "blockdev-mirror",
+      "arguments": {
+          "job-id": "mirror",
+          "device": "source-fmt",
+          "target": "target",
+          "sync": "top"
+      }}' \
+    'return' \
+    | grep -v JOB_STATUS_CHANGE # Ignore these events during creation
+
+# This too will be used by this and the next case
+# $1: QEMU handle
+# $2: Image size
+wait_for_job_and_quit() {
+    h=$1
+    size=$2
+
+    # List of expected events
+    capture_events='BLOCK_JOB_READY JOB_STATUS_CHANGE'
+    _wait_event $h 'BLOCK_JOB_READY'
+    QEMU_EVENTS= # Ignore all JOB_STATUS_CHANGE events that came before READY
+
+    # Write something to the device for post-READY mirroring.  Write it in
+    # blocks matching the cluster size, each spaced one block apart, so
+    # that the mirror job will have to spawn one request per cluster.
+    # Because the number of concurrent requests is limited (to 16), this
+    # limits the number of bytes concurrently in flight, which speeds up
+    # cancelling the job (in-flight requests still are waited for).
+    # To limit the number of bytes in flight, we could alternatively pass
+    # something for blockdev-mirror's @buf-size parameter, but
+    # block-commit does not have such a parameter, so we need to figure
+    # something out that works for both.
+
+    cluster_size=65536
+    step=$((cluster_size * 2))
+
+    echo '--- Writing data to the virtio-blk device ---'
+
+    for ofs in $(seq 0 $step $((size - step))); do
+        qemu_io_cmd="qemu-io -d vblk/virtio-backend "
+        qemu_io_cmd+="\\\"aio_write $ofs $cluster_size\\\""
+
+        # Do not include these requests in the reference output
+        # (it's just too much)
+        silent=yes _send_qemu_cmd $h \
+            "{\"execute\": \"human-monitor-command\",
+              \"arguments\": {
+                  \"command-line\": \"$qemu_io_cmd\"
+              }}" \
+            'return'
+    done
+
+    # Wait until the job's length is updated to reflect the write requests
+
+    # We have written to half of the device, so this is the expected job length
+    final_len=$((size / 2))
+    timeout=100 # unit: 0.1 seconds
+    while true; do
+        len=$(
+            _send_qemu_cmd $h \
+                '{"execute": "query-block-jobs"}' \
+                'return.*"len": [0-9]\+' \
+                | grep 'return.*"len": [0-9]\+' \
+                | sed -e 's/.*"len": \([0-9]\+\).*/\1/'
+        )
+        if [ "$len" -eq "$final_len" ]; then
+            break
+        fi
+        timeout=$((timeout - 1))
+        if [ "$timeout" -eq 0 ]; then
+            echo "ERROR: Timeout waiting for job to reach len=$final_len"
+            break
+        fi
+        sleep 0.1
+    done
+
+    sleep 1
+
+    _send_qemu_cmd $h \
+        '{"execute": "quit"}' \
+        'return'
+
+    # List of expected events
+    capture_events='BLOCK_JOB_CANCELLED JOB_STATUS_CHANGE SHUTDOWN'
+    _wait_event $h 'SHUTDOWN'
+    QEMU_EVENTS= # Ignore all JOB_STATUS_CHANGE events that came before SHUTDOWN
+    _wait_event $h 'JOB_STATUS_CHANGE' # standby
+    _wait_event $h 'JOB_STATUS_CHANGE' # ready
+    _wait_event $h 'JOB_STATUS_CHANGE' # aborting
+    # Filter the offset (depends on when exactly `quit` was issued)
+    _wait_event $h 'BLOCK_JOB_CANCELLED' \
+        | sed -e 's/"offset": [0-9]\+/"offset": (filtered)/'
+    _wait_event $h 'JOB_STATUS_CHANGE' # concluded
+    _wait_event $h 'JOB_STATUS_CHANGE' # null
+
+    wait=yes _cleanup_qemu
+
+    kill -SIGTERM "$(cat "$TEST_DIR/qsd.pid")"
+}
+
+wait_for_job_and_quit $h $size
+
+echo
+echo === Start active commit to throttled QSD and exit qemu ===
+echo
+
+# Same as the above, but instead of mirroring, do an active commit
+
+_make_test_img $size
+
+set_up_throttled_qsd
+
+_launch_qemu \
+    --blockdev "{\"driver\": \"nbd\",
+                 \"node-name\": \"target\",
+                 \"server\": {
+                     \"type\": \"unix\",
+                     \"path\": \"$SOCK_DIR/qsd.sock\"
+                 },
+                 \"export\": \"target\"}" \
+    --blockdev file,node-name=source-proto,filename="$TEST_IMG" \
+    --blockdev qcow2,node-name=source-fmt,file=source-proto,backing=target \
+    --device virtio-blk,id=vblk,drive=source-fmt
+
+h=$QEMU_HANDLE
+_send_qemu_cmd $h '{"execute": "qmp_capabilities"}' 'return'
+
+_send_qemu_cmd $h \
+    '{"execute": "block-commit",
+      "arguments": {
+          "job-id": "commit",
+          "device": "source-fmt"
+      }}' \
+    'return' \
+    | grep -v JOB_STATUS_CHANGE # Ignore these events during creation
+
+wait_for_job_and_quit $h $size
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/185.out b/tests/qemu-iotests/185.out
index 754a641258..70e8dd6c87 100644
--- a/tests/qemu-iotests/185.out
+++ b/tests/qemu-iotests/185.out
@@ -116,4 +116,52 @@ Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "disk", "len": 67108864, "offset": 524288, "speed": 65536, "type": "stream"}}
 No errors were found on the image.
+
+=== Start mirror to throttled QSD and exit qemu ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+{"execute": "qmp_capabilities"}
+{"return": {}}
+{"execute": "blockdev-mirror",
+      "arguments": {
+          "job-id": "mirror",
+          "device": "source-fmt",
+          "target": "target",
+          "sync": "top"
+      }}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "mirror", "len": 0, "offset": 0, "speed": 0, "type": "mirror"}}
+--- Writing data to the virtio-blk device ---
+{"execute": "quit"}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "mirror", "len": 33554432, "offset": (filtered), "speed": 0, "type": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "mirror"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "mirror"}}
+
+=== Start active commit to throttled QSD and exit qemu ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+{"execute": "qmp_capabilities"}
+{"return": {}}
+{"execute": "block-commit",
+      "arguments": {
+          "job-id": "commit",
+          "device": "source-fmt"
+      }}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "commit", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
+--- Writing data to the virtio-blk device ---
+{"execute": "quit"}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_CANCELLED", "data": {"device": "commit", "len": 33554432, "offset": (filtered), "speed": 0, "type": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "commit"}}
 *** done
-- 
2.33.1


