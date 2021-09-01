Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA63FDEF3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 17:46:46 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLSRp-0005L1-Jj
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 11:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzs-00060Y-NY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mLRzn-00048p-BJ
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:17:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630509466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6CrWSLc3t0yRvV/kkN1IYFmg4j1DGx5L52rMlwfjCjE=;
 b=CJ995Qc2jRdWLuhKyiHlzSg5QJbHTp7TmtrnZU5V+V1Fb0CUijn1uqoaD45lobSzhsQBGf
 7OtnvAcP3hk9TKPbB3EC+RgO5ExEB2nMwpX0AMq8CH78p1gma/mUTIkgynI1BeCcppeyWU
 4rH2OzXV19B85oCDvpAJxyJYDpPQX04=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-oj3Bkk8jO5W5CdLnoVod5w-1; Wed, 01 Sep 2021 11:17:44 -0400
X-MC-Unique: oj3Bkk8jO5W5CdLnoVod5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86C24801B3C;
 Wed,  1 Sep 2021 15:17:43 +0000 (UTC)
Received: from localhost (unknown [10.39.193.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20204380;
 Wed,  1 Sep 2021 15:17:42 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 38/56] block/copy-before-write: cbw_init(): use options
Date: Wed,  1 Sep 2021 17:16:01 +0200
Message-Id: <20210901151619.689075-39-hreitz@redhat.com>
In-Reply-To: <20210901151619.689075-1-hreitz@redhat.com>
References: <20210901151619.689075-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210824083856.17408-19-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block/copy-before-write.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1e7180760a..1cefcade78 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -209,6 +204,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -220,7 +216,12 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.31.1


