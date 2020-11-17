Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8170A2B5EFE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:19:39 +0100 (CET)
Received: from localhost ([::1]:41136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezxS-00076J-JC
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuW-0002ZA-B4
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuI-0002jf-60
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605615380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mQJbM/9DQsgu+0544X/GcuXqB5Nc5QMqfzmDY9E92A=;
 b=CRLmPDT2jGGu7hHY9GQOyHCSvM6yrke5PWhFLmiJknq7Ex6YtaYtBRKC7TquQzeC7nGfQ6
 DVtxvmQUyiNrb157hPSJgoT4e3HPtdKw82SAx/xr27OhQtr4WmvbnmW0m5QdS96ghzRYhX
 xV20ZTSCa1tea4Yfqn5iYwhGWK1gh20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-a8SMFGlIOv-0ozcY6OvMWQ-1; Tue, 17 Nov 2020 07:16:16 -0500
X-MC-Unique: a8SMFGlIOv-0ozcY6OvMWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C73A610B9CA3;
 Tue, 17 Nov 2020 12:16:15 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C797110013D0;
 Tue, 17 Nov 2020 12:16:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 7/7] iotests/081: Test rewrite-corrupted without WRITE
Date: Tue, 17 Nov 2020 13:15:58 +0100
Message-Id: <20201117121558.249585-8-kwolf@redhat.com>
In-Reply-To: <20201117121558.249585-1-kwolf@redhat.com>
References: <20201117121558.249585-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Test what happens when a rewrite-corrupted quorum node performs such a
rewrite, while there is no parent that has taken the WRITE permission.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201113211718.261671-4-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/081     | 54 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/081.out | 27 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/tests/qemu-iotests/081 b/tests/qemu-iotests/081
index 253b7576be..4e19972931 100755
--- a/tests/qemu-iotests/081
+++ b/tests/qemu-iotests/081
@@ -42,6 +42,7 @@ _supported_fmt raw
 _supported_proto file
 _supported_os Linux
 _require_drivers quorum
+_require_devices virtio-scsi
 
 do_run_qemu()
 {
@@ -155,6 +156,59 @@ echo "== checking that quorum has corrected the corrupted file =="
 
 $QEMU_IO -c "read -P 0x32 0 $size" "$TEST_DIR/2.raw" | _filter_qemu_io
 
+echo
+echo "== using quorum rewrite corrupted mode without WRITE permission =="
+
+# The same as above, but this time, do it on a quorum node whose only
+# parent will not take the WRITE permission
+
+echo '-- corrupting --'
+# Only corrupt a portion: The guest device (scsi-hd on virtio-scsi)
+# will read some data (looking for a partition table to guess the
+# disk's geometry), which would trigger a quorum mismatch if the
+# beginning of the image was corrupted.  The subsequent
+# QUORUM_REPORT_BAD event would be suppressed (because at that point,
+# there cannot have been a qmp_capabilities on the monitor).  Because
+# that event is rate-limited, the next QUORUM_REPORT_BAD that happens
+# thanks to our qemu-io read (which should trigger a mismatch) would
+# then be delayed past the VM quit and not appear in the output.
+# So we keep the first 1M intact to see a QUORUM_REPORT_BAD resulting
+# from the qemu-io invocation.
+$QEMU_IO -c "write -P 0x42 1M 1M" "$TEST_DIR/2.raw" | _filter_qemu_io
+
+# Fix the corruption (on a read-only quorum node, i.e. without taking
+# the WRITE permission on it -- its child nodes need to be R/W OTOH,
+# so that rewrite-corrupted works)
+echo
+echo '-- running quorum --'
+run_qemu \
+    -blockdev file,node-name=file1,filename="$TEST_DIR/1.raw" \
+    -blockdev file,node-name=file2,filename="$TEST_DIR/2.raw" \
+    -blockdev file,node-name=file3,filename="$TEST_DIR/3.raw" \
+    -blockdev '{
+        "driver": "quorum",
+        "node-name": "quorum",
+        "read-only": true,
+        "vote-threshold": 2,
+        "rewrite-corrupted": true,
+        "children": [ "file1", "file2", "file3" ]
+    }' \
+    -device virtio-scsi,id=scsi \
+    -device scsi-hd,id=quorum-drive,bus=scsi.0,drive=quorum \
+    <<EOF
+{ "execute": "qmp_capabilities" }
+{
+    "execute": "human-monitor-command",
+    "arguments": {
+        "command-line": 'qemu-io -d quorum-drive "read -P 0x32 0 $size"'
+    }
+}
+{ "execute": "quit" }
+EOF
+
+echo '-- checking that the image has been corrected --'
+$QEMU_IO -c "read -P 0x32 0 $size" "$TEST_DIR/2.raw" | _filter_qemu_io
+
 echo
 echo "== breaking quorum =="
 
diff --git a/tests/qemu-iotests/081.out b/tests/qemu-iotests/081.out
index 04091b64e5..1974262fac 100644
--- a/tests/qemu-iotests/081.out
+++ b/tests/qemu-iotests/081.out
@@ -47,6 +47,33 @@ read 10485760/10485760 bytes at offset 0
 read 10485760/10485760 bytes at offset 0
 10 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
+== using quorum rewrite corrupted mode without WRITE permission ==
+-- corrupting --
+wrote 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+-- running quorum --
+Testing: -blockdev file,node-name=file1,filename=TEST_DIR/1.IMGFMT -blockdev file,node-name=file2,filename=TEST_DIR/2.IMGFMT -blockdev file,node-name=file3,filename=TEST_DIR/3.IMGFMT -blockdev {
+        "driver": "quorum",
+        "node-name": "quorum",
+        "read-only": true,
+        "vote-threshold": 2,
+        "rewrite-corrupted": true,
+        "children": [ "file1", "file2", "file3" ]
+    } -device virtio-scsi,id=scsi -device scsi-hd,id=quorum-drive,bus=scsi.0,drive=quorum
+QMP_VERSION
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "QUORUM_REPORT_BAD", "data": {"node-name": "file2", "sectors-count": 20480, "sector-num": 0, "type": "read"}}
+read 10485760/10485760 bytes at offset 0
+10 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+{"return": ""}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "SHUTDOWN", "data": {"guest": false, "reason": "host-qmp-quit"}}
+
+-- checking that the image has been corrected --
+read 10485760/10485760 bytes at offset 0
+10 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
 == breaking quorum ==
 wrote 10485760/10485760 bytes at offset 0
 10 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-- 
2.28.0


