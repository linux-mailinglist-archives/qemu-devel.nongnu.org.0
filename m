Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8E4337787
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:28:36 +0100 (CET)
Received: from localhost ([::1]:58082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNEo-0004ou-0b
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:28:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMc4-0004nt-8d
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKMbz-0002kv-99
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615474106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ecPgKp7w4AobSNh0Dy0z6U7t8cavD+1G2gImmxHx/wg=;
 b=fAeVC2tfN5HkWtjZyAyn8ZFukmF1psDdumXAcxsGSeCEa6CAhpf9pzqyjx2OkmdjNdwBos
 X2qZ78FxNWljoF4SIU+SyeiRrMsucEFrMmDaTZleLKABpPt9tlp5LcVcleZS64BOtMJhPk
 Cx5zxRU8m7eyQ3BBEjIfvl6UqBNJ8nY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-wurP1kLqMUO7FDfg-FIDeA-1; Thu, 11 Mar 2021 09:48:24 -0500
X-MC-Unique: wurP1kLqMUO7FDfg-FIDeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F291100C618;
 Thu, 11 Mar 2021 14:48:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0604E5D9F2;
 Thu, 11 Mar 2021 14:48:21 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/38] stream: Don't crash when node permission is denied
Date: Thu, 11 Mar 2021 15:47:36 +0100
Message-Id: <20210311144811.313451-4-kwolf@redhat.com>
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The image streaming block job restricts shared permissions of the nodes
it accesses. This can obviously fail when other users already got these
permissions. &error_abort is therefore wrong and can crash. Handle these
errors gracefully and just fail starting the block job.

Reported-by: Nini Gu <ngu@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210309173451.45152-1-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/stream.c                        | 15 +++++++++++----
 tests/qemu-iotests/tests/qsd-jobs     | 20 ++++++++++++++++++++
 tests/qemu-iotests/tests/qsd-jobs.out | 10 ++++++++++
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 1fa742b0db..97bee482dc 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -206,7 +206,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
                   const char *filter_node_name,
                   Error **errp)
 {
-    StreamBlockJob *s;
+    StreamBlockJob *s = NULL;
     BlockDriverState *iter;
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
@@ -214,6 +214,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     BlockDriverState *cor_filter_bs = NULL;
     BlockDriverState *above_base;
     QDict *opts;
+    int ret;
 
     assert(!(base && bottom));
     assert(!(backing_file_str && bottom));
@@ -303,7 +304,7 @@ void stream_start(const char *job_id, BlockDriverState *bs,
      * queried only at the job start and then cached.
      */
     if (block_job_add_bdrv(&s->common, "active node", bs, 0,
-                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
+                           basic_flags | BLK_PERM_WRITE, errp)) {
         goto fail;
     }
 
@@ -320,8 +321,11 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     for (iter = bdrv_filter_or_cow_bs(bs); iter != base;
          iter = bdrv_filter_or_cow_bs(iter))
     {
-        block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
-                           basic_flags, &error_abort);
+        ret = block_job_add_bdrv(&s->common, "intermediate node", iter, 0,
+                                 basic_flags, errp);
+        if (ret < 0) {
+            goto fail;
+        }
     }
 
     s->base_overlay = base_overlay;
@@ -337,6 +341,9 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     return;
 
 fail:
+    if (s) {
+        job_early_fail(&s->common.job);
+    }
     if (cor_filter_bs) {
         bdrv_cor_filter_drop(cor_filter_bs);
     }
diff --git a/tests/qemu-iotests/tests/qsd-jobs b/tests/qemu-iotests/tests/qsd-jobs
index 1a1c534fac..972b6b3898 100755
--- a/tests/qemu-iotests/tests/qsd-jobs
+++ b/tests/qemu-iotests/tests/qsd-jobs
@@ -30,6 +30,7 @@ status=1	# failure is the default!
 _cleanup()
 {
     _cleanup_test_img
+    rm -f "$SOCK_DIR/nbd.sock"
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
 
@@ -59,6 +60,25 @@ $QSD --chardev stdio,id=stdio --monitor chardev=stdio \
 {"execute": "quit"}
 EOF
 
+echo
+echo "=== Streaming can't get permission on base node ==="
+echo
+
+# Just make sure that this doesn't crash
+$QSD --chardev stdio,id=stdio --monitor chardev=stdio \
+    --blockdev node-name=file_base,driver=file,filename="$TEST_IMG.base" \
+    --blockdev node-name=fmt_base,driver=qcow2,file=file_base \
+    --blockdev node-name=file_overlay,driver=file,filename="$TEST_IMG" \
+    --blockdev node-name=fmt_overlay,driver=qcow2,file=file_overlay,backing=fmt_base \
+    --nbd-server addr.type=unix,addr.path="$SOCK_DIR/nbd.sock" \
+    --export type=nbd,id=export1,node-name=fmt_base,writable=on,name=export1 \
+    <<EOF | _filter_qmp
+{"execute": "qmp_capabilities"}
+{"execute": "block-stream",
+  "arguments": {"device": "fmt_overlay", "job-id": "job0"}}
+{"execute": "quit"}
+EOF
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/tests/qsd-jobs.out b/tests/qemu-iotests/tests/qsd-jobs.out
index e3a684b34d..05e1165e80 100644
--- a/tests/qemu-iotests/tests/qsd-jobs.out
+++ b/tests/qemu-iotests/tests/qsd-jobs.out
@@ -19,4 +19,14 @@ QMP_VERSION
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0, "offset": 0, "speed": 0, "type": "commit"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "concluded", "id": "job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
+
+=== Streaming can't get permission on base node ===
+
+QMP_VERSION
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "null", "id": "job0"}}
+{"error": {"class": "GenericError", "desc": "Conflicts with use by a block device as 'root', which uses 'write' on fmt_base"}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "export1"}}
 *** done
-- 
2.29.2


