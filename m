Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FAD445245
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:33:21 +0100 (CET)
Received: from localhost ([::1]:58770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miazg-0001Sl-DH
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miaxt-00006L-OF
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:31:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1miaxp-0001kN-PZ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:31:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636025485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iMULFL0+u86e4XjrBLjJ8jfevodljvo7Fnipj9bAY08=;
 b=ZWCPtkefQ0/dBFATEmwXf4Q6Idnd7nHq0MDaqaq9oTCMEKptDD6oY3Hiy13U8Ace5ik69K
 +BfuqlHmq/UtMgCGUeANttRStqNnPnDx85qxQA2HFXCfDRhLgJ8uJbq4nu9ZUWGXiRbgKe
 xWSULQG/uPxxve260SfBWXvOsEUXYvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-ixA5EMugO5CNJ9oSR3QAzg-1; Thu, 04 Nov 2021 07:31:22 -0400
X-MC-Unique: ixA5EMugO5CNJ9oSR3QAzg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4317210A8E02;
 Thu,  4 Nov 2021 11:31:21 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE0E197FC;
 Thu,  4 Nov 2021 11:31:19 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] file-posix: Fix alignment after reopen changing O_DIRECT
Date: Thu,  4 Nov 2021 12:31:09 +0100
Message-Id: <20211104113109.56336-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, hreitz@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At the end of a reopen, we already call bdrv_refresh_limits(), which
should update bs->request_alignment according to the new file
descriptor. However, raw_probe_alignment() relies on s->needs_alignment
and just uses 1 if it isn't set. We neglected to update this field, so
starting with cache=writeback and then reopening with cache=none means
that we get an incorrect bs->request_alignment == 1 and unaligned
requests fail instead of being automatically aligned.

Fix this by recalculating s->needs_alignment in raw_refresh_limits()
before calling raw_probe_alignment().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c         | 20 ++++++++++++++++----
 tests/qemu-iotests/142     | 22 ++++++++++++++++++++++
 tests/qemu-iotests/142.out | 15 +++++++++++++++
 3 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 7a27c83060..3f14e47096 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -167,6 +167,7 @@ typedef struct BDRVRawState {
     int page_cache_inconsistent; /* errno from fdatasync failure */
     bool has_fallocate;
     bool needs_alignment;
+    bool force_alignment;
     bool drop_cache;
     bool check_cache_dropped;
     struct {
@@ -351,6 +352,17 @@ static bool dio_byte_aligned(int fd)
     return false;
 }
 
+static int raw_needs_alignment(BlockDriverState *bs)
+{
+    BDRVRawState *s = bs->opaque;
+
+    if ((bs->open_flags & BDRV_O_NOCACHE) != 0 && !dio_byte_aligned(s->fd)) {
+        return true;
+    }
+
+    return s->force_alignment;
+}
+
 /* Check if read is allowed with given memory buffer and length.
  *
  * This function is used to check O_DIRECT memory buffer and request alignment.
@@ -728,9 +740,6 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
 
     s->has_discard = true;
     s->has_write_zeroes = true;
-    if ((bs->open_flags & BDRV_O_NOCACHE) != 0 && !dio_byte_aligned(s->fd)) {
-        s->needs_alignment = true;
-    }
 
     if (fstat(s->fd, &st) < 0) {
         ret = -errno;
@@ -784,9 +793,10 @@ static int raw_open_common(BlockDriverState *bs, QDict *options,
          * so QEMU makes sure all IO operations on the device are aligned
          * to sector size, or else FreeBSD will reject them with EINVAL.
          */
-        s->needs_alignment = true;
+        s->force_alignment = true;
     }
 #endif
+    s->needs_alignment = raw_needs_alignment(bs);
 
 #ifdef CONFIG_XFS
     if (platform_test_xfs_fd(s->fd)) {
@@ -1251,7 +1261,9 @@ static void raw_refresh_limits(BlockDriverState *bs, Error **errp)
     BDRVRawState *s = bs->opaque;
     struct stat st;
 
+    s->needs_alignment = raw_needs_alignment(bs);
     raw_probe_alignment(bs, s->fd, errp);
+
     bs->bl.min_mem_alignment = s->buf_align;
     bs->bl.opt_mem_alignment = MAX(s->buf_align, qemu_real_host_page_size);
 
diff --git a/tests/qemu-iotests/142 b/tests/qemu-iotests/142
index 69fd10ef51..07003c597a 100755
--- a/tests/qemu-iotests/142
+++ b/tests/qemu-iotests/142
@@ -350,6 +350,28 @@ info block backing-file"
 
 echo "$hmp_cmds" | run_qemu -drive "$files","$ids" | grep "Cache"
 
+echo
+echo "--- Alignment after changing O_DIRECT ---"
+echo
+
+# Directly test the protocol level: Can unaligned requests succeed even if
+# O_DIRECT was only enabled through a reopen and vice versa?
+
+$QEMU_IO --cache=writeback -f file $TEST_IMG <<EOF | _filter_qemu_io
+read 42 42
+reopen -o cache.direct=on
+read 42 42
+reopen -o cache.direct=off
+read 42 42
+EOF
+$QEMU_IO --cache=none -f file $TEST_IMG <<EOF | _filter_qemu_io
+read 42 42
+reopen -o cache.direct=off
+read 42 42
+reopen -o cache.direct=on
+read 42 42
+EOF
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/142.out b/tests/qemu-iotests/142.out
index a92b948edd..f167038230 100644
--- a/tests/qemu-iotests/142.out
+++ b/tests/qemu-iotests/142.out
@@ -747,4 +747,19 @@ cache.no-flush=on on backing-file
     Cache mode:       writeback
     Cache mode:       writeback, direct
     Cache mode:       writeback, ignore flushes
+
+--- Alignment after changing O_DIRECT ---
+
+read 42/42 bytes at offset 42
+42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 42/42 bytes at offset 42
+42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 42/42 bytes at offset 42
+42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 42/42 bytes at offset 42
+42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 42/42 bytes at offset 42
+42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 42/42 bytes at offset 42
+42 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.31.1


