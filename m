Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 624FC380EAE
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:15:20 +0200 (CEST)
Received: from localhost ([::1]:41776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbPD-0003pW-DJ
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:15:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawf-0005iD-7v
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawZ-0005vb-M9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cig0ixGhXgdJioN+hzT95qIQ6ue1Fhcydjzmn1FsSIc=;
 b=W/EPKrt6/LveHquBJyeFtAejLQpCLwlh0swxPJ0PG0oe0n0MHeA7TfezyAdcVlqDhW9Q8U
 lacWZkhkeGGrfcSMUCazkvIQSPLNrBqbqGhhMK3E81du7uBGq/sLNPoDXKMQFlxh6nT+i9
 JGSSrUqKZcKnAGKC3KymssoZfP5hh0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-n4nRHYlaNOOp_PlgNAe1Qg-1; Fri, 14 May 2021 12:45:40 -0400
X-MC-Unique: n4nRHYlaNOOp_PlgNAe1Qg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BA711854E21;
 Fri, 14 May 2021 16:45:39 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2298D5C1C4;
 Fri, 14 May 2021 16:45:38 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/19] block/copy-on-read: use bdrv_drop_filter() and drop
 s->active
Date: Fri, 14 May 2021 18:45:06 +0200
Message-Id: <20210514164514.1057680-12-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Now, after huge update of block graph permission update algorithm, we
don't need this workaround with active state of the filter. Drop it and
use new smart bdrv_drop_filter() function.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210506194143.394141-1-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/copy-on-read.c | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index 9cad9e1b8c..c428682272 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -29,7 +29,6 @@
 
 
 typedef struct BDRVStateCOR {
-    bool active;
     BlockDriverState *bottom_bs;
     bool chain_frozen;
 } BDRVStateCOR;
@@ -89,7 +88,6 @@ static int cor_open(BlockDriverState *bs, QDict *options, int flags,
          */
         bdrv_ref(bottom_bs);
     }
-    state->active = true;
     state->bottom_bs = bottom_bs;
 
     /*
@@ -112,17 +110,6 @@ static void cor_child_perm(BlockDriverState *bs, BdrvChild *c,
                            uint64_t perm, uint64_t shared,
                            uint64_t *nperm, uint64_t *nshared)
 {
-    BDRVStateCOR *s = bs->opaque;
-
-    if (!s->active) {
-        /*
-         * While the filter is being removed
-         */
-        *nperm = 0;
-        *nshared = BLK_PERM_ALL;
-        return;
-    }
-
     *nperm = perm & PERM_PASSTHROUGH;
     *nshared = (shared & PERM_PASSTHROUGH) | PERM_UNCHANGED;
 
@@ -280,32 +267,14 @@ static BlockDriver bdrv_copy_on_read = {
 
 void bdrv_cor_filter_drop(BlockDriverState *cor_filter_bs)
 {
-    BdrvChild *child;
-    BlockDriverState *bs;
     BDRVStateCOR *s = cor_filter_bs->opaque;
 
-    child = bdrv_filter_child(cor_filter_bs);
-    if (!child) {
-        return;
-    }
-    bs = child->bs;
-
-    /* Retain the BDS until we complete the graph change. */
-    bdrv_ref(bs);
-    /* Hold a guest back from writing while permissions are being reset. */
-    bdrv_drained_begin(bs);
-    /* Drop permissions before the graph change. */
-    s->active = false;
     /* unfreeze, as otherwise bdrv_replace_node() will fail */
     if (s->chain_frozen) {
         s->chain_frozen = false;
         bdrv_unfreeze_backing_chain(cor_filter_bs, s->bottom_bs);
     }
-    bdrv_child_refresh_perms(cor_filter_bs, child, &error_abort);
-    bdrv_replace_node(cor_filter_bs, bs, &error_abort);
-
-    bdrv_drained_end(bs);
-    bdrv_unref(bs);
+    bdrv_drop_filter(cor_filter_bs, &error_abort);
     bdrv_unref(cor_filter_bs);
 }
 
-- 
2.31.1


