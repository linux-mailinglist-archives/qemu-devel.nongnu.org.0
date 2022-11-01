Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F2C6151DB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 20:01:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opwVf-0005yt-Rz; Tue, 01 Nov 2022 15:01:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opwVS-0005mD-8H
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:01:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1opwVM-0004KZ-BI
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 15:01:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667329255;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5VS4xrxKb46L8wD9rGlnnrigI463dvsqve/1eQSqxrQ=;
 b=ijx4GIwmAd+K2hevPmmWZ4lK6UjFHnMZkhYgvm4xwY4r/3JCatIyoPZmkgq/DqT3YB32+V
 PGic6YHxZE15Na3xCkR3zr+DfGqWVSRP8VDv9ItOXjcWybDQdhNyJKfKOIdu1Ul0FjFhrY
 omvDTcAOpd6x9TYedAVAiAAEwwMKMLw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-RhOggFYzM5uOSmiok3FsfA-1; Tue, 01 Nov 2022 15:00:52 -0400
X-MC-Unique: RhOggFYzM5uOSmiok3FsfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE53A101A5C0;
 Tue,  1 Nov 2022 19:00:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FAF740C945A;
 Tue,  1 Nov 2022 19:00:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: hreitz@redhat.com, qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 nsoffer@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH 2/2] file-posix: add statx(STATX_DIOALIGN) support
Date: Tue,  1 Nov 2022 15:00:31 -0400
Message-Id: <20221101190031.6766-3-stefanha@redhat.com>
In-Reply-To: <20221101190031.6766-1-stefanha@redhat.com>
References: <20221101190031.6766-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Linux commit 825cf206ed51 ("statx: add direct I/O alignment
information") added an interface to fetch O_DIRECT alignment values for
block devices and file systems.

Prefer STATX_DIOALIGN to older interfaces and probing, but keep them as
fallbacks in case STATX_DIOALIGN cannot provide the information.

Testing shows the status of STATX_DIOALIGN support in Linux 6.1-rc3
appears to be:
- btrfs: no
- ext4: yes
- XFS: yes
- NVMe block devices: yes
- dm-crypt: yes

Cc: Eric Biggers <ebiggers@google.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/file-posix.c | 54 +++++++++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index b9d62f52fe..00d8191880 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -372,28 +372,48 @@ static void raw_probe_alignment(BlockDriverState *bs, int fd, Error **errp)
 
     bs->bl.request_alignment = 0;
     s->buf_align = 0;
+
+#if defined(__linux__) && defined(STATX_DIOALIGN)
+    struct statx stx;
+
+    /*
+     * Linux 6.1 introduced an interface for both block devices and file
+     * systems. The system call returns with the STATX_DIOALIGN bit cleared
+     * when the information is unavailable.
+     */
+    if (statx(fd, "", AT_EMPTY_PATH, STATX_DIOALIGN, &stx) == 0 &&
+        (stx.stx_mask & STATX_DIOALIGN)) {
+        bs->bl.request_alignment = stx.stx_dio_offset_align;
+        s->buf_align = stx.stx_dio_mem_align;
+    }
+#endif /* defined(__linux__) && defined(STATX_DIOALIGN) */
+
     /* Let's try to use the logical blocksize for the alignment. */
-    if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0) {
-        bs->bl.request_alignment = 0;
+    if (!bs->bl.request_alignment) {
+        if (probe_logical_blocksize(fd, &bs->bl.request_alignment) < 0) {
+            bs->bl.request_alignment = 0;
+        }
     }
 
 #ifdef __linux__
-    /*
-     * The XFS ioctl definitions are shipped in extra packages that might
-     * not always be available. Since we just need the XFS_IOC_DIOINFO ioctl
-     * here, we simply use our own definition instead:
-     */
-    struct xfs_dioattr {
-        uint32_t d_mem;
-        uint32_t d_miniosz;
-        uint32_t d_maxiosz;
-    } da;
-    if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >= 0) {
-        bs->bl.request_alignment = da.d_miniosz;
-        /* The kernel returns wrong information for d_mem */
-        /* s->buf_align = da.d_mem; */
+    if (!bs->bl.request_alignment) {
+        /*
+         * The XFS ioctl definitions are shipped in extra packages that might
+         * not always be available. Since we just need the XFS_IOC_DIOINFO ioctl
+         * here, we simply use our own definition instead:
+         */
+        struct xfs_dioattr {
+            uint32_t d_mem;
+            uint32_t d_miniosz;
+            uint32_t d_maxiosz;
+        } da;
+        if (ioctl(fd, _IOR('X', 30, struct xfs_dioattr), &da) >= 0) {
+            bs->bl.request_alignment = da.d_miniosz;
+            /* The kernel returns wrong information for d_mem */
+            /* s->buf_align = da.d_mem; */
+        }
     }
-#endif
+#endif /* __linux__ */
 
     /*
      * If we could not get the sizes so far, we can only guess them. First try
-- 
2.38.1


