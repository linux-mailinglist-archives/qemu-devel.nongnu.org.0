Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83134507A9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:56:39 +0100 (CET)
Received: from localhost ([::1]:50976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdPS-0006CN-Tv
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:56:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNG-0003A5-Vv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNF-0007lK-68
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpxC+2IJsYUvPEa/2qZDF6B1VbMTSoDQpd6XxDZfkxI=;
 b=UBXO0K/+jwVUPfqef823BVKvCo+oNic+PIrlqkcYKy/bDtRT08oFV48FWAmEN5ETg7CN+a
 /8BXyNek/yVyMeBiqh9fKdTgr3jl4id4dlBYMj2NC2hVBIhcsw4SBMsVTRW+9Q7PpgC89f
 ZDIyJOfpHilvD01fZAlnYkvunPOyubg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-tfd95u-yPOGRgUJyH33wng-1; Mon, 15 Nov 2021 09:54:17 -0500
X-MC-Unique: tfd95u-yPOGRgUJyH33wng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED7721015DC9;
 Mon, 15 Nov 2021 14:54:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA25C19D9F;
 Mon, 15 Nov 2021 14:54:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 01/13] stream: Traverse graph after modification
Date: Mon, 15 Nov 2021 15:53:57 +0100
Message-Id: <20211115145409.176785-2-kwolf@redhat.com>
In-Reply-To: <20211115145409.176785-1-kwolf@redhat.com>
References: <20211115145409.176785-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

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
2.31.1


