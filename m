Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8E42FD63
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:27:01 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUjE-00020R-DY
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTQ-0007gH-2A
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTI-0000k4-IT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=phCrbGuwXMiTVkL+w3AnM6RYndZqedcNqgxPPLwg4QQ=;
 b=d0A6p7SeMuR9kzXpkmeWHHP675LErkFEEZSzr+XXz4DwleSi1WIMLebM1UUleIjFhSZljT
 MTySgBBYvliQcF+rX4+N/e3OLcH3YtmaGC25BCEIq1LTeWFCcE2jFpieaWQouWDdtO5lOv
 RpGKwow5G01IkA2z/ISVF9OkqjdXeqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-ezWXMOOLPgSQX7nAwbLhTQ-1; Fri, 15 Oct 2021 17:10:25 -0400
X-MC-Unique: ezWXMOOLPgSQX7nAwbLhTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C2808042CC;
 Fri, 15 Oct 2021 21:10:24 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C01319736;
 Fri, 15 Oct 2021 21:10:23 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] block-backend: update blk_co_pwrite() and blk_co_pread()
 wrappers
Date: Fri, 15 Oct 2021 16:10:10 -0500
Message-Id: <20211015211011.1272011-16-eblake@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Make bytes argument int64_t to be consistent with modern block-layer.
Callers should be OK with it as type becomes wider.

What is inside functions?

- Conversion from int64_t to size_t. Still, we
can't have a buffer larger than SIZE_MAX, therefore bytes should not be
larger than SIZE_MAX as well. Add an assertion.

- Passing to blk_co_pwritev() / blk_co_preadv() which already has
  int64_t bytes argument.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211007175243.642516-2-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: spelling fix]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/sysemu/block-backend.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 3fbc74e17cb4..e5e1524f065b 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -137,20 +137,24 @@ int coroutine_fn blk_co_pwritev(BlockBackend *blk, int64_t offset,
                                BdrvRequestFlags flags);

 static inline int coroutine_fn blk_co_pread(BlockBackend *blk, int64_t offset,
-                                            unsigned int bytes, void *buf,
+                                            int64_t bytes, void *buf,
                                             BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);

+    assert(bytes <= SIZE_MAX);
+
     return blk_co_preadv(blk, offset, bytes, &qiov, flags);
 }

 static inline int coroutine_fn blk_co_pwrite(BlockBackend *blk, int64_t offset,
-                                             unsigned int bytes, void *buf,
+                                             int64_t bytes, void *buf,
                                              BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);

+    assert(bytes <= SIZE_MAX);
+
     return blk_co_pwritev(blk, offset, bytes, &qiov, flags);
 }

-- 
2.31.1


