Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4932F0A8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 18:05:40 +0100 (CET)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDtT-0000Px-Ss
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 12:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDkO-00070f-31
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lIDk7-0007EX-8n
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:56:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614963358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IH6cB1FtNJ4X/SFpceFy7ZgDVLT2So77w/rQ8fEUhsE=;
 b=bS+uwIIipr0ZUVhpag1TsCSAj9Qa2hq4oOu3o7E73AdsY8jVG0wFkyGAYq67vEItnyf41O
 CMD+KxmCO+ocIuo9/ZdP+DzZdCTwMQV6CInNYPCN5ROl9A8raAGnHGXtRcVXegkovc+ggM
 now+OZ+YGNgK6Z0+9ZIoltoQ+ZZ0JaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-6QOB4zsMND2sXEkTha7PTA-1; Fri, 05 Mar 2021 11:55:56 -0500
X-MC-Unique: 6QOB4zsMND2sXEkTha7PTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67DBCE4967;
 Fri,  5 Mar 2021 16:55:43 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B25B60BF3;
 Fri,  5 Mar 2021 16:55:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 26/31] block/parallels: BDRVParallelsState: add cluster_size
 field
Date: Fri,  5 Mar 2021 17:54:49 +0100
Message-Id: <20210305165454.356840-27-kwolf@redhat.com>
In-Reply-To: <20210305165454.356840-1-kwolf@redhat.com>
References: <20210305165454.356840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We are going to use it in more places, calculating
"s->tracks << BDRV_SECTOR_BITS" doesn't look good.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210224104707.88430-4-vsementsov@virtuozzo.com>
Reviewed-by: Denis V. Lunev <den@openvz.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/parallels.h | 1 +
 block/parallels.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/parallels.h b/block/parallels.h
index 5aa101cfc8..9a9209e320 100644
--- a/block/parallels.h
+++ b/block/parallels.h
@@ -79,6 +79,7 @@ typedef struct BDRVParallelsState {
     ParallelsPreallocMode prealloc_mode;
 
     unsigned int tracks;
+    unsigned int cluster_size;
 
     unsigned int off_multiplier;
     Error *migration_blocker;
diff --git a/block/parallels.c b/block/parallels.c
index 3c22dfdc9d..9594d84978 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -421,7 +421,6 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
     int ret;
     uint32_t i;
     bool flush_bat = false;
-    int cluster_size = s->tracks << BDRV_SECTOR_BITS;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -472,7 +471,7 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             high_off = off;
         }
 
-        if (prev_off != 0 && (prev_off + cluster_size) != off) {
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
             res->bfi.fragmented_clusters++;
         }
         prev_off = off;
@@ -487,10 +486,10 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         }
     }
 
-    res->image_end_offset = high_off + cluster_size;
+    res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
         int64_t count;
-        count = DIV_ROUND_UP(size - res->image_end_offset, cluster_size);
+        count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
                 size - res->image_end_offset);
@@ -771,6 +770,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
         ret = -EFBIG;
         goto fail;
     }
+    s->cluster_size = s->tracks << BDRV_SECTOR_BITS;
 
     s->bat_size = le32_to_cpu(ph.bat_entries);
     if (s->bat_size > INT_MAX / sizeof(uint32_t)) {
-- 
2.29.2


