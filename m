Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCABD33772B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:26:53 +0100 (CET)
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNDA-0000PL-S8
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc3-0004mH-LG
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMbz-0002l4-Mh
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXoMc6C7Xdyx/f0+y1o3NuQ4z0mMVN9CoTPUOs5g8z4=;
 b=Gbeg6Du4GRr7fjB4fBSSSAzI2ZTyIUJBQAtWhfvlK7RL/BdaVTxodOPpBt2Z5utPs2AF8z
 qZVju06mDd6bvOi/1nizz9ujh9Y/8uhR8qbv54t6Vp0BG5K7RPcFIFz+jkoPVELqML2tzu
 kDx/ks5LI2aK1c182F6niOcC2i+5wlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-njNebdYAMlyNCxGhniPnCw-1; Thu, 11 Mar 2021 09:48:22 -0500
X-MC-Unique: njNebdYAMlyNCxGhniPnCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA7AB92509;
 Thu, 11 Mar 2021 14:48:21 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93EC85D9F2;
 Thu, 11 Mar 2021 14:48:20 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 02/38] storage-daemon: Call job_cancel_sync_all() on shutdown
Date: Thu, 11 Mar 2021 15:47:35 +0100
Message-Id: <20210311144811.313451-3-kwolf@redhat.com>
In-Reply-To: <20210311144811.313451-1-kwolf@redhat.com>
References: <20210311144811.313451-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

bdrv_close_all() asserts that no jobs are running any more, so we need
to cancel all jobs first to avoid failing the assertion.

Fixes: b55a3c8860b763b62b2cc2f4a6f55379977bbde5
Reported-by: Nini Gu <ngu@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210309121814.31078-1-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c  |  1 +
 tests/qemu-iotests/tests/qsd-jobs     | 66 +++++++++++++++++++++++++++
 tests/qemu-iotests/tests/qsd-jobs.out | 22 +++++++++
 3 files changed, 89 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qsd-jobs
 create mode 100644 tests/qemu-iotests/tests/qsd-jobs.out

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index 23756fc8e5..a39a22386a 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -368,6 +368,7 @@ int main(int argc, char *argv[])
 
     blk_exp_close_all();
     bdrv_drain_all_begin();
+    job_cancel_sync_all();
     bdrv_close_all();
 
     monitor_cleanup();
diff --git a/tests/qemu-iotests/tests/qsd-jobs b/tests/qemu-iotests/tests/qsd-jobs
new file mode 100755
index 0000000000..1a1c534fac
--- /dev/null
+++ b/tests/qemu-iotests/tests/qsd-jobs
@@ -0,0 +1,66 @@
+#!/usr/bin/env bash
+# group: rw auto quick qsd
+#
+# Job tests related specifically to qemu-storage-daemon
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
+size=128M
+
+TEST_IMG="$TEST_IMG.base" _make_test_img $size
+_make_test_img -b "$TEST_IMG.base" -F $IMGFMT
+
+echo
+echo "=== Job still present at shutdown ==="
+echo
+
+# Just make sure that this doesn't crash
+$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
+    --blockdev node-name=file0,driver=file,filename="$TEST_IMG" \
+    --blockdev node-name=fmt0,driver=qcow2,file=file0 <<EOF | _filter_qmp
+{"execute":"qmp_capabilities"}
+{"execute": "block-commit", "arguments": {"device": "fmt0", "job-id": "job0"}}
+{"execute": "quit"}
+EOF
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
+
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
new file mode 100644
index 0000000000..e3a684b34d
--- /dev/null
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -0,0 +1,22 @@
+QA output created by qsd-jobs
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
+
+=== Job still present at shutdown ===
+
+QMP_VERSION
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
+*** done
-- 
2.29.2


