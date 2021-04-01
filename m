Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFCD351538
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:33:19 +0200 (CEST)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxRn-0005CK-0f
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRxND-0001Mb-Df
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:28:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRxNA-0004F0-Uq
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:28:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617283711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ji3bqdOEmcQvLs4vMQdyc1J8FYafSezblmrQofvaCuc=;
 b=WGbSsPUowARjljGaIPwkiDudMXvoKIe8ozV9AvAaY0jpMpAygs01DYj/d0fsXSBSSFi5jt
 e3ZsWpWptXitW0WuMAZyj1LYadqA56eiuClKcMWkoJBPWI4ybkLLkVuw+L28UoKk/2nnbu
 emusKlb2vnib09vtP+SkYSbur7JeBZ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-TfvknapTMpKuyVx_qEMHhA-1; Thu, 01 Apr 2021 09:28:29 -0400
X-MC-Unique: TfvknapTMpKuyVx_qEMHhA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C71190D342;
 Thu,  1 Apr 2021 13:28:28 +0000 (UTC)
Received: from localhost (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D6A31001281;
 Thu,  1 Apr 2021 13:28:27 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] iotests/qsd-jobs: Use common.qemu for the QSD
Date: Thu,  1 Apr 2021 15:28:15 +0200
Message-Id: <20210401132815.139575-3-mreitz@redhat.com>
In-Reply-To: <20210401132815.139575-1-mreitz@redhat.com>
References: <20210401132815.139575-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using common.qemu allows us to wait for specific replies, so we can for
example wait for events.  This allows starting the active commit job and
then wait for it to be ready before quitting the QSD, so we the output
is always the same.

(Strictly speaking, this is only necessary for the first test in
qsd-jobs, but we might as well make the second one use common.qemu's
infrastructure, too.)

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/tests/qsd-jobs     | 55 ++++++++++++++++++++-------
 tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++-
 2 files changed, 49 insertions(+), 16 deletions(-)

diff --git a/tests/qemu-iotests/tests/qsd-jobs b/tests/qemu-iotests/tests/qsd-jobs
index 972b6b3898..af7f886f15 100755
--- a/tests/qemu-iotests/tests/qsd-jobs
+++ b/tests/qemu-iotests/tests/qsd-jobs
@@ -38,6 +38,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 cd ..
 . ./common.rc
 . ./common.filter
+. ./common.qemu
 
 _supported_fmt qcow2
 _supported_proto generic
@@ -52,32 +53,58 @@ echo "=== Job still present at shutdown ==="
 echo
 
 # Just make sure that this doesn't crash
-$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
+qsd=y _launch_qemu \
     --blockdev node-name=file0,driver=file,filename="$TEST_IMG" \
-    --blockdev node-name=fmt0,driver=qcow2,file=file0 <<EOF | _filter_qmp
-{"execute":"qmp_capabilities"}
-{"execute": "block-commit", "arguments": {"device": "fmt0", "job-id": "job0"}}
-{"execute": "quit"}
-EOF
+    --blockdev node-name=fmt0,driver=qcow2,file=file0
+
+_send_qemu_cmd \
+    $QEMU_HANDLE \
+    '{"execute":"qmp_capabilities"}' \
+    'return'
+
+_send_qemu_cmd \
+    $QEMU_HANDLE \
+    '{"execute": "block-commit",
+      "arguments": {"device": "fmt0", "job-id": "job0"}}' \
+    'BLOCK_JOB_READY'
+
+_send_qemu_cmd \
+    $QEMU_HANDLE \
+    '{"execute": "quit"}' \
+    'return'
+
+wait=y _cleanup_qemu
 
 echo
 echo "=== Streaming can't get permission on base node ==="
 echo
 
 # Just make sure that this doesn't crash
-$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
+qsd=y _launch_qemu \
     --blockdev node-name=file_base,driver=file,filename="$TEST_IMG.base" \
     --blockdev node-name=fmt_base,driver=qcow2,file=file_base \
     --blockdev node-name=file_overlay,driver=file,filename="$TEST_IMG" \
     --blockdev node-name=fmt_overlay,driver=qcow2,file=file_overlay,backing=fmt_base \
     --nbd-server addr.type=unix,addr.path="$SOCK_DIR/nbd.sock" \
-    --export type=nbd,id=export1,node-name=fmt_base,writable=on,name=export1 \
-    <<EOF | _filter_qmp
-{"execute": "qmp_capabilities"}
-{"execute": "block-stream",
-  "arguments": {"device": "fmt_overlay", "job-id": "job0"}}
-{"execute": "quit"}
-EOF
+    --export type=nbd,id=export1,node-name=fmt_base,writable=on,name=export1
+
+_send_qemu_cmd \
+    $QEMU_HANDLE \
+    '{"execute": "qmp_capabilities"}' \
+    'return'
+
+_send_qemu_cmd \
+    $QEMU_HANDLE \
+    '{"execute": "block-stream",
+      "arguments": {"device": "fmt_overlay", "job-id": "job0"}}' \
+    'error'
+
+_send_qemu_cmd \
+    $QEMU_HANDLE \
+    '{"execute": "quit"}' \
+    'return'
+
+wait=y _cleanup_qemu
 
 # success, all done
 echo "*** done"
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index 05e1165e80..5a14668939 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -4,13 +4,16 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/
 
 === Job still present at shutdown ===
 
-QMP_VERSION
+{"execute":"qmp_capabilities"}
 {"return": {}}
+{"execute": "block-commit",
+      "arguments": {"device": "fmt0", "job-id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "job0"}}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
+{"execute": "quit"}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id": "job0"}}
@@ -22,11 +25,14 @@ QMP_VERSION
 
 === Streaming can't get permission on base node ===
 
-QMP_VERSION
+{"execute": "qmp_capabilities"}
 {"return": {}}
+{"execute": "block-stream",
+      "arguments": {"device": "fmt_overlay", "job-id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
 {"error": {"class": "GenericError", "desc": "Conflicts with use by a block device as 'root', which uses 'write' on fmt_base"}}
+{"execute": "quit"}
 {"return": {}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.29.2


