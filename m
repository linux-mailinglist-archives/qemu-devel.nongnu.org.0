Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B823E54528D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:58:59 +0200 (CEST)
Received: from localhost ([::1]:46314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLUo-0002OZ-QG
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK55-0008EV-Tu
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1nzK53-0000uS-0Q
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654788496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W74xPxHx/l/Ha5Xz0Wto2YjD6dtAGeNbL1hNCzhV0oA=;
 b=aW6vyjac7fSlU4AJpf8DfXE/4ZFs7X/RqGv5BVVOgCQ9YziFpIMNeBMVJ5l1gTHqG/sdwl
 NhhutHbAOMQtf1OUdoLTWdZImij1XcgReY4t6A6tksU1n/E41tuGgv3S3B0pwSqLVI4kzY
 5xLDHiX+7grX0NY7pdLwK/D0nqVrq7o=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-IRQOjrNJO6qhARAC24iqaA-1; Thu, 09 Jun 2022 11:28:13 -0400
X-MC-Unique: IRQOjrNJO6qhARAC24iqaA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4454E1C18272;
 Thu,  9 Jun 2022 15:28:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B31E492C3B;
 Thu,  9 Jun 2022 15:28:09 +0000 (UTC)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Fam Zheng <fam@euphon.net>,
 Jeff Cody <codyprime@gmail.com>, qemu-block@nongnu.org,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alberto Faria <afaria@redhat.com>
Subject: [PATCH v5 07/10] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
Date: Thu,  9 Jun 2022 16:27:41 +0100
Message-Id: <20220609152744.3891847-8-afaria@redhat.com>
In-Reply-To: <20220609152744.3891847-1-afaria@redhat.com>
References: <20220609152744.3891847-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_{pread,pwrite}() now return -EIO instead of -EINVAL when 'bytes' is
negative, making them consistent with bdrv_{preadv,pwritev}() and
bdrv_co_{pread,pwrite,preadv,pwritev}().

bdrv_pwrite_zeroes() now also calls trace_bdrv_co_pwrite_zeroes() and
clears the BDRV_REQ_MAY_UNMAP flag when appropriate, which it didn't
previously.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---

I audited all bdrv_{pread,pwrite}() callers to make sure that changing
the -EINVAL return code to -EIO wont't break things. However, there are
about 140 call sites, so the probability of me having missed something
isn't negligible. If someone more accustomed to the code base is able to
double-check this, that would be very much appreciated.

As a precaution, I also dropped Paolo's R-b.

 block/io.c               | 41 ----------------------------------------
 include/block/block-io.h | 15 +++++++++------
 2 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/block/io.c b/block/io.c
index 78a289192e..ecd1c2a53c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1061,14 +1061,6 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
     return 0;
 }
 
-int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int64_t bytes, BdrvRequestFlags flags)
-{
-    IO_CODE();
-    return bdrv_pwritev(child, offset, bytes, NULL,
-                        BDRV_REQ_ZERO_WRITE | flags);
-}
-
 /*
  * Completely zero out a block device with the help of bdrv_pwrite_zeroes.
  * The operation is sped up by checking the block status and only writing
@@ -1111,39 +1103,6 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
     }
 }
 
-/* See bdrv_pwrite() for the return codes */
-int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
-               BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_CODE();
-
-    if (bytes < 0) {
-        return -EINVAL;
-    }
-
-    return bdrv_preadv(child, offset, bytes, &qiov, flags);
-}
-
-/* Return no. of bytes on success or < 0 on error. Important errors are:
-  -EIO         generic I/O error (may happen for all errors)
-  -ENOMEDIUM   No media inserted.
-  -EINVAL      Invalid offset or number of bytes
-  -EACCES      Trying to write a read-only device
-*/
-int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
-                const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_CODE();
-
-    if (bytes < 0) {
-        return -EINVAL;
-    }
-
-    return bdrv_pwritev(child, offset, bytes, &qiov, flags);
-}
-
 /*
  * Writes to the file and ensures that no writes are reordered across this
  * request (acts as a barrier)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 879221cebe..c81739ad16 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -39,13 +39,16 @@
  * to catch when they are accidentally called by the wrong API.
  */
 
-int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int64_t bytes, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
+                                            int64_t bytes,
+                                            BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
-               BdrvRequestFlags flags);
-int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
-                const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
+                                    int64_t bytes, void *buf,
+                                    BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags);
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
                      const void *buf, BdrvRequestFlags flags);
 /*
-- 
2.35.3


