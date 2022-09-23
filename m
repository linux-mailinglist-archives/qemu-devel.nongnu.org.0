Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564565E7B4B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:06:08 +0200 (CEST)
Received: from localhost ([::1]:49008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiNb-00073n-23
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBy-00040O-7t
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBu-0004J6-JE
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663937640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oqaBaOGdyy1YdBdUubG5/n0xrm29DW3Coz1MbYetgXc=;
 b=RhlD3zm6lffVnns7Cd01UHh+AQNjsqruxOB0sMjOkScDQuksskkKo6YZ+I6OCNefyynD51
 3/UWvG24jv6NoVyNR4iwrNgnyOV78FNM8Bt6U7kNw4dfrgtdUab9MUx2vG14WTVe6l828n
 c6tG7otgFFWuP4HU0iaA3Tv6lE7BHek=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-131-MmKbIhnXPvexlQUSdfb-og-1; Fri, 23 Sep 2022 08:52:32 -0400
X-MC-Unique: MmKbIhnXPvexlQUSdfb-og-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C736185A7AE;
 Fri, 23 Sep 2022 12:52:32 +0000 (UTC)
Received: from localhost (unknown [10.39.194.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B2B2492B08;
 Fri, 23 Sep 2022 12:52:32 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 2/3] block-backend: Update ctx immediately after root
Date: Fri, 23 Sep 2022 14:52:26 +0200
Message-Id: <20220923125227.300202-3-hreitz@redhat.com>
In-Reply-To: <20220923125227.300202-1-hreitz@redhat.com>
References: <20220923125227.300202-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

blk_get_aio_context() asserts that blk->ctx is always equal to the root
BDS's context (if there is a root BDS).  Therefore,
blk_do_set_aio_context() must update blk->ctx immediately after the root
BDS's context has changed.

Without this patch, the next patch would break iotest 238, because
bdrv_drained_begin() (called by blk_do_set_aio_context()) may then
invoke bdrv_child_get_parent_aio_context() on the root child, i.e.
blk_get_aio_context().  However, by this point, blk->ctx would not have
been updated and thus differ from the root node's context.  This patch
fixes that.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/block-backend.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index d4a5df2ac2..abdb5ff5af 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2156,6 +2156,7 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
                 return ret;
             }
         }
+        blk->ctx = new_context;
         if (tgm->throttle_state) {
             bdrv_drained_begin(bs);
             throttle_group_detach_aio_context(tgm);
@@ -2164,9 +2165,10 @@ static int blk_do_set_aio_context(BlockBackend *blk, AioContext *new_context,
         }
 
         bdrv_unref(bs);
+    } else {
+        blk->ctx = new_context;
     }
 
-    blk->ctx = new_context;
     return 0;
 }
 
-- 
2.36.1


