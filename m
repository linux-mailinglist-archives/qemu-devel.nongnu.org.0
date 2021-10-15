Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C514342FD51
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:18:16 +0200 (CEST)
Received: from localhost ([::1]:40216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUal-0001pD-RE
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTR-0007ld-D8
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTK-0000h2-Gi
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EulQQBtafpCiBB2Q4OhWiPgWSM0Wmz7L3ybuTxHwaFA=;
 b=R4WxNF4j2A5AnTG/TsLhJoZkZfPpnbmaCZNd/r/QJVMBoFdwRAlhY34bC35PC5Mh4DhzO1
 5zBn97Id3tabv7FqsOve8yrQ3JYZ0VmLvnXkYCZZKl2F+l2/b/o+DqvtDCTkr5b4eKaCSa
 2MsoHq+ASIIB89D375EFtAZeXx9jve0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-UlPihwrUMxWLeNqRjht2ig-1; Fri, 15 Oct 2021 17:10:23 -0400
X-MC-Unique: UlPihwrUMxWLeNqRjht2ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C41091006AA3;
 Fri, 15 Oct 2021 21:10:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5882D196E2;
 Fri, 15 Oct 2021 21:10:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] block-backend: blk_pread,
 blk_pwrite: rename count parameter to bytes
Date: Fri, 15 Oct 2021 16:10:07 -0500
Message-Id: <20211015211011.1272011-13-eblake@redhat.com>
In-Reply-To: <20211015211011.1272011-1-eblake@redhat.com>
References: <20211015211011.1272011-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

To be consistent with declarations in include/sysemu/block-backend.h.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-12-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/block-backend.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index c889d0f97c45..59746eda45b0 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1477,27 +1477,27 @@ BlockAIOCB *blk_aio_pwrite_zeroes(BlockBackend *blk, int64_t offset,
                         flags | BDRV_REQ_ZERO_WRITE, cb, opaque);
 }

-int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int count)
+int blk_pread(BlockBackend *blk, int64_t offset, void *buf, int bytes)
 {
     int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);

     blk_inc_in_flight(blk);
-    ret = blk_do_preadv(blk, offset, count, &qiov, 0);
+    ret = blk_do_preadv(blk, offset, bytes, &qiov, 0);
     blk_dec_in_flight(blk);

-    return ret < 0 ? ret : count;
+    return ret < 0 ? ret : bytes;
 }

-int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int count,
+int blk_pwrite(BlockBackend *blk, int64_t offset, const void *buf, int bytes,
                BdrvRequestFlags flags)
 {
     int ret;
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, count);
+    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);

-    ret = blk_pwritev_part(blk, offset, count, &qiov, 0, flags);
+    ret = blk_pwritev_part(blk, offset, bytes, &qiov, 0, flags);

-    return ret < 0 ? ret : count;
+    return ret < 0 ? ret : bytes;
 }

 int64_t blk_getlength(BlockBackend *blk)
-- 
2.31.1


