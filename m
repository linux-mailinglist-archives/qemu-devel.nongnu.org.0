Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE82452ED2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:16:18 +0100 (CET)
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvVh-0002tu-4U
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:16:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmvUA-0001zc-8Z
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:14:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmvU6-0007E9-Jd
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637057677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YCLCfurQdaBqGEfwPzann/mf1LzdmS93fqGidmDo5pE=;
 b=L+0JujvIURWr34FCJjaapARRzf1k4CHSxacbt8QPEayJj+f18Q/9PmIriKGxhFWdt89KG3
 vtXVpSUt6pjaN10qjheZYmN4blyArqju8fEXlEijZY1biGGvnvzTFsivzhZinMj3UEXSXp
 JBrYhBaEqRWmUo1S7PGZS8Eujd++mUg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-paQoZKqNPKuD_m6pQ0kDvw-1; Tue, 16 Nov 2021 05:14:34 -0500
X-MC-Unique: paQoZKqNPKuD_m6pQ0kDvw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79BBC80A5CF;
 Tue, 16 Nov 2021 10:14:33 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFD2D57CAB;
 Tue, 16 Nov 2021 10:14:32 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 for-6.2] file-posix: Fix alignment after reopen changing
 O_DIRECT
Date: Tue, 16 Nov 2021 11:14:31 +0100
Message-Id: <20211116101431.105252-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

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
Message-Id: <20211104113109.56336-1-kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-13-kwolf@redhat.com>
[hreitz: Fix iotest 142 for block sizes greater than 512 by operating on
         a file with a size of 1 MB]
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
v1:
https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00129.html

Though Kevin modified this patch according to Stefano's suggestion
(letting raw_needs_alignment() return a bool instead of an int) in his
block branch, and so the version in the pull request was slighly
different:
https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00356.html

That is also the reason why there are already two Message-Id tags in
this patch.

(Kevin is on PTO, which is why I'm taking over this patch.)

v2:
Don't continue operating on a qcow2 file with an effectively random
size, but create a new 1 MB file to run our O_DIRECT reopen read tests
on.  Otherwise, we'll get into permission trouble because qemu-io does
not take the RESIZE permission by default, which it would need to
auto-align the file size to the sector size.

Note that the qcow2 file is not even aligned to 512 byte sectors before
the test case (its size is 196616), but the error message doesn't appear
then because qemu internally calculates file sizes in multiples of 512
bytes (BDRV_SECTOR_SIZE), so a misalignment can only become visible when
the physical sector size exceeds 512 bytes.
(That's "OK" because qemu only counts sizes in multiples of 512, so any
resize below that granularity is not visible as a resize to qemu, and so
does not need the RESIZE permission.)

Another way we could solve this problem is by having qemu-io take the
RESIZE permission, but I believe it would need to retain it not only
through the reopen, but until the image size is aligned to the sector
size; that is, we would need to resize the image anyway to be able to
drop the permission and not keep it constantly.  So it's simpler to just
create an aligned image from the start.
---
 block/file-posix.c         | 20 ++++++++++++++++----
 tests/qemu-iotests/142     | 29 +++++++++++++++++++++++++++++
 tests/qemu-iotests/142.out | 18 ++++++++++++++++++
 3 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 7a27c83060..b283093e5b 100644
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
 
+static bool raw_needs_alignment(BlockDriverState *bs)
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
index 69fd10ef51..86d65a2d1a 100755
--- a/tests/qemu-iotests/142
+++ b/tests/qemu-iotests/142
@@ -350,6 +350,35 @@ info block backing-file"
 
 echo "$hmp_cmds" | run_qemu -drive "$files","$ids" | grep "Cache"
 
+echo
+echo "--- Alignment after changing O_DIRECT ---"
+echo
+
+# Directly test the protocol level: Can unaligned requests succeed even if
+# O_DIRECT was only enabled through a reopen and vice versa?
+
+# Ensure image size is a multiple of the sector size (required for O_DIRECT)
+$QEMU_IMG create -f file "$TEST_IMG" 1M | _filter_img_create
+
+# And write some data (not strictly necessary, but it feels better to actually
+# have something to be read)
+$QEMU_IO -f file -c 'write 0 4096' "$TEST_IMG" | _filter_qemu_io
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
index a92b948edd..e20cfc8eb8 100644
--- a/tests/qemu-iotests/142.out
+++ b/tests/qemu-iotests/142.out
@@ -747,4 +747,22 @@ cache.no-flush=on on backing-file
     Cache mode:       writeback
     Cache mode:       writeback, direct
     Cache mode:       writeback, ignore flushes
+
+--- Alignment after changing O_DIRECT ---
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=file size=1048576
+wrote 4096/4096 bytes at offset 0
+4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
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
2.33.1


