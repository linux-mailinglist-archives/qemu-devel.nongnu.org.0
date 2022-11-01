Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE76151DD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:01:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opwVi-0006Bo-H9; Tue, 01 Nov 2022 15:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opwVf-0005ze-2C
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:01:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opwVW-0004LA-C4
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667329264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLagzt3b9eFE5VQap6yM2xzJT792otpID4qDi8KriWE=;
 b=B+RuLre0Z3tWReLKDbwrP9eb/Vu+P3pSjPk1qq4qargCJ7ZBqJCjt+ft6MzqGWMQszD8SY
 Ask9P361FqqNXvIKDIk623sl5fiaM1X6oEc8zqP4uNsrEstn43vSW3RxFBjKlxQ3d1YfOO
 c/34I6O4TELNv6d37+rCIvXF0SqUhKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-8Ks1pwd6ON69v6pwij917Q-1; Tue, 01 Nov 2022 15:00:59 -0400
X-MC-Unique: 8Ks1pwd6ON69v6pwij917Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 363083C02B89;
 Tue,  1 Nov 2022 19:00:59 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1A882028CE4;
 Tue,  1 Nov 2022 19:00:58 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 nsoffer@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 1/2] file-posix: fix Linux alignment probing when EIO is
 returned
Date: Tue,  1 Nov 2022 15:00:30 -0400
Message-Id: <20221101190031.6766-2-stefanha@redhat.com>
In-Reply-To: <20221101190031.6766-1-stefanha@redhat.com>
References: <20221101190031.6766-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.051,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Linux dm-crypt returns errno EIO from unaligned O_DIRECT pread(2) calls.
Alignment probing fails on dm-crypt devices because the code expects
EINVAL.

Treating any errno as an "unaligned" indicator would be easy, but breaks
commit 22d182e82b4b ("block/raw-posix: fix launching with failed
disks"). Offline disks return EIO for correctly aligned requests and
EINVAL for unaligned requests.

It's possible to make both dm-crypt and offline disks work: look for the
transition from EINVAL to EIO instead of for a single EINVAL value.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
Fixes: 22d182e82b4b ("block/raw-posix: fix launching with failed disks")
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 42 +++++++++++++++---------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b9647c5ffc..b9d62f52fe 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -355,31 +355,6 @@ static bool raw_needs_alignment(BlockDriverState *bs)
     return s->force_alignment;
 }
 
-/* Check if read is allowed with given memory buffer and length.
- *
- * This function is used to check O_DIRECT memory buffer and request alignment.
- */
-static bool raw_is_io_aligned(int fd, void *buf, size_t len)
-{
-    ssize_t ret = pread(fd, buf, len, 0);
-
-    if (ret >= 0) {
-        return true;
-    }
-
-#ifdef __linux__
-    /* The Linux kernel returns EINVAL for misaligned O_DIRECT reads.  Ignore
-     * other errors (e.g. real I/O error), which could happen on a failed
-     * drive, since we only care about probing alignment.
-     */
-    if (errno != EINVAL) {
-        return true;
-    }
-#endif
-
-    return false;
-}
-
 static void raw_probe_alignment(BlockDriverState *bs, int fd, Error **errp)
 {
     BDRVRawState *s = bs->opaque;
@@ -426,34 +401,47 @@ static void raw_probe_alignment(BlockDriverState *bs, int fd, Error **errp)
      * try to detect buf_align, which cannot be detected in some cases (e.g.
      * Gluster). If buf_align cannot be detected, we fallback to the value of
      * request_alignment.
+     *
+     * The probing loop keeps track of the last errno so that the alignment of
+     * offline disks can be probed. On Linux pread(2) returns with errno EINVAL
+     * for most file descriptors when O_DIRECT alignment constraints are unmet.
+     * Offline disks fail correctly aligned pread(2) with EIO. Therefore it's
+     * possible to detect alignment on offline disks by observing when the
+     * errno changes from EINVAL to something else.
      */
 
     if (!bs->bl.request_alignment) {
+        int last_errno = 0;
         int i;
         size_t align;
         buf = qemu_memalign(max_align, max_align);
         for (i = 0; i < ARRAY_SIZE(alignments); i++) {
             align = alignments[i];
-            if (raw_is_io_aligned(fd, buf, align)) {
+            if (pread(fd, buf, align, 0) >= 0 ||
+                (errno != EINVAL && last_errno == EINVAL)) {
                 /* Fallback to safe value. */
                 bs->bl.request_alignment = (align != 1) ? align : max_align;
                 break;
             }
+            last_errno = errno;
         }
         qemu_vfree(buf);
     }
 
     if (!s->buf_align) {
+        int last_errno = 0;
         int i;
         size_t align;
         buf = qemu_memalign(max_align, 2 * max_align);
         for (i = 0; i < ARRAY_SIZE(alignments); i++) {
             align = alignments[i];
-            if (raw_is_io_aligned(fd, buf + align, max_align)) {
+            if (pread(fd, buf + align, max_align, 0) >= 0 ||
+                (errno != EINVAL && last_errno == EINVAL)) {
                 /* Fallback to request_alignment. */
                 s->buf_align = (align != 1) ? align : bs->bl.request_alignment;
                 break;
             }
+            last_errno = errno;
         }
         qemu_vfree(buf);
     }
-- 
2.38.1


