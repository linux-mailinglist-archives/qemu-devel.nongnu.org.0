Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86EF4532ED
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:36:26 +0100 (CET)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmydN-00025O-De
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:36:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyD4-0007J0-PE
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:09:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyD2-0007Mj-TF
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nev6fyeldn+IEwMjHlHF+B7kJv0EQKHzF2xnCOHBGyA=;
 b=SQWd6TyXMo6xOcX9wIWkPI7Yec9KozN06Ka5aX38WdZDYjIrWvF+ImV66Yap6pYlZ/et3Q
 mFEtOnrUNGwf/mqxpxS8wNH7tR+ZyhmY4tD/TxLX+/H6N4ojY5vCB3lrPXQPEkcNRwEX0V
 iwIdNEtAXPrlensToG7y4KL2xvRP2iY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-w6w70SUIMfyD_1GfWxe1qQ-1; Tue, 16 Nov 2021 08:06:24 -0500
X-MC-Unique: w6w70SUIMfyD_1GfWxe1qQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDB7F879A07;
 Tue, 16 Nov 2021 13:06:22 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91F2A60C13;
 Tue, 16 Nov 2021 13:06:22 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 01/13] stream: Traverse graph after modification
Date: Tue, 16 Nov 2021 14:06:06 +0100
Message-Id: <20211116130618.700441-2-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_cor_filter_drop() modifies the block graph.  That means that other
parties can also modify the block graph before it returns.  Therefore,
we cannot assume that the result of a graph traversal we did before
remains valid afterwards.

We should thus fetch `base` and `unfiltered_base` afterwards instead of
before.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211111120829.81329-2-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-2-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/stream.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/stream.c b/block/stream.c
index 97bee482dc..e45113aed6 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -54,8 +54,8 @@ static int stream_prepare(Job *job)
 {
     StreamBlockJob *s = container_of(job, StreamBlockJob, common.job);
     BlockDriverState *unfiltered_bs = bdrv_skip_filters(s->target_bs);
-    BlockDriverState *base = bdrv_filter_or_cow_bs(s->above_base);
-    BlockDriverState *unfiltered_base = bdrv_skip_filters(base);
+    BlockDriverState *base;
+    BlockDriverState *unfiltered_base;
     Error *local_err = NULL;
     int ret = 0;
 
@@ -63,6 +63,9 @@ static int stream_prepare(Job *job)
     bdrv_cor_filter_drop(s->cor_filter_bs);
     s->cor_filter_bs = NULL;
 
+    base = bdrv_filter_or_cow_bs(s->above_base);
+    unfiltered_base = bdrv_skip_filters(base);
+
     if (bdrv_cow_child(unfiltered_bs)) {
         const char *base_id = NULL, *base_fmt = NULL;
         if (unfiltered_base) {
-- 
2.33.1


