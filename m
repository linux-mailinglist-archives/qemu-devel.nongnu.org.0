Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498144D65D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:11:55 +0100 (CET)
Received: from localhost ([::1]:46136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8vo-0003HN-VF
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:11:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sp-0008QW-8m
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sm-00032X-TV
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qf2yowMAttbNAAjdTZUK5uUohwtUk695K3OtJ96ke0=;
 b=TzAKUN1oV3lmtZsdqY4ImQ80u+hXHBL5icm3iPs8sVJqcj5Orl7tsgRbBfDfxcr6OPlEDc
 HLRPj+K/gdjzL7KQGsqCaG7pKuvpSYWzTq5mX9x0hR6rTLfxi6LrMb/NtQsc85fzOECxaA
 76jBzHFb3ox6zBQLVDKMmZlTHssZmg8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-7K8bEA2LMOG7CptutArtBQ-1; Thu, 11 Nov 2021 07:08:38 -0500
X-MC-Unique: 7K8bEA2LMOG7CptutArtBQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C8D3425C8;
 Thu, 11 Nov 2021 12:08:37 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 011785D6B1;
 Thu, 11 Nov 2021 12:08:35 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 01/10] stream: Traverse graph after modification
Date: Thu, 11 Nov 2021 13:08:20 +0100
Message-Id: <20211111120829.81329-2-hreitz@redhat.com>
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
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


