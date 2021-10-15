Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F442FD4E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 23:16:49 +0200 (CEST)
Received: from localhost ([::1]:37092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbUZM-0007qI-FR
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 17:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTF-0007Ty-4z
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mbUTA-0000f3-HH
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 17:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634332222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qr041pWEVPDiPpPV3kx3/rrq+fwR3VtlU7StQJLlph0=;
 b=ef2N7ZKYiQ9RwxvzBKlFzGpQ8oNdKVobTpUf6FTlbwMXUN89vIJGuhL0Rj3iHjmvsk10mb
 rcWC39Val0qRSbkGEzPMzj0iFqNoj5vrKt++ErVdMjAmcNCMIHRfq0CxjIZWwh8L0278zx
 k3uZjSm1zsBlgaLvmzfyzc7NCGdu+9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-FuzB-_qbMOKiIvB4Lpt7tw-1; Fri, 15 Oct 2021 17:10:19 -0400
X-MC-Unique: FuzB-_qbMOKiIvB4Lpt7tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2142010A8E01;
 Fri, 15 Oct 2021 21:10:18 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-130.phx2.redhat.com [10.3.114.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8FE119739;
 Fri, 15 Oct 2021 21:10:17 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/15] block-backend: convert blk_co_pdiscard to int64_t bytes
Date: Fri, 15 Oct 2021 16:10:00 -0500
Message-Id: <20211015211011.1272011-6-eblake@redhat.com>
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

We updated blk_do_pdiscard() and its wrapper blk_co_pdiscard(). Both
functions are updated so that the parameter type becomes wider, so all
callers should be OK with it.

Look at blk_do_pdiscard(): bytes is passed only to
blk_check_byte_request() and bdrv_co_pdiscard(), which already have
int64_t bytes parameter, so we are OK.

Note that requests exceeding INT_MAX are still restricted by
blk_check_byte_request().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211006131718.214235-5-vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
[eblake: grammar tweaks]
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 include/sysemu/block-backend.h | 3 ++-
 block/block-backend.c          | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/block-backend.h b/include/sysemu/block-backend.h
index 91457a081ec1..3efa0256395f 100644
--- a/include/sysemu/block-backend.h
+++ b/include/sysemu/block-backend.h
@@ -181,7 +181,8 @@ void blk_aio_cancel_async(BlockAIOCB *acb);
 int blk_ioctl(BlockBackend *blk, unsigned long int req, void *buf);
 BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,
                           BlockCompletionFunc *cb, void *opaque);
-int blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes);
+int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
+                                 int64_t bytes);
 int blk_co_flush(BlockBackend *blk);
 int blk_flush(BlockBackend *blk);
 int blk_commit_all(void);
diff --git a/block/block-backend.c b/block/block-backend.c
index 105f0afff970..1e21498b2c4a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1626,7 +1626,7 @@ BlockAIOCB *blk_aio_ioctl(BlockBackend *blk, unsigned long int req, void *buf,

 /* To be called between exactly one pair of blk_inc/dec_in_flight() */
 static int coroutine_fn
-blk_do_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+blk_do_pdiscard(BlockBackend *blk, int64_t offset, int64_t bytes)
 {
     int ret;

@@ -1657,7 +1657,8 @@ BlockAIOCB *blk_aio_pdiscard(BlockBackend *blk,
                         cb, opaque);
 }

-int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset, int bytes)
+int coroutine_fn blk_co_pdiscard(BlockBackend *blk, int64_t offset,
+                                 int64_t bytes)
 {
     int ret;

-- 
2.31.1


