Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2483B86EE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:16:26 +0200 (CEST)
Received: from localhost ([::1]:45876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyct0-00023w-0z
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfl-0002w1-KZ
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfV-00073d-F4
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EJQnL7sDNEh3cUuLLgYudcyp4Qjd7GjnLgEdQDqKhKg=;
 b=Er0tpvlRLCqoSjcvmE9jIM6mySKDip5vD3O9agjW6Xp9emO03dqn/5FDo8fioCoeS0+z0G
 u77AZeqlN6pX8E6ZO4pyZ/2D9Xu08H8goGwtxDYRn1Fx0wMY0Y5dux/caDwYusqBxqSM9M
 aUFoVCKzw201LE7IfefSJEwpzt/bYHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-a_aUIjWTPeivHc1AsqaBxQ-1; Wed, 30 Jun 2021 12:02:25 -0400
X-MC-Unique: a_aUIjWTPeivHc1AsqaBxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC26F100C665;
 Wed, 30 Jun 2021 16:02:23 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8A36604CD;
 Wed, 30 Jun 2021 16:02:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/24] block: bdrv_reopen_parse_backing(): simplify handling
 implicit filters
Date: Wed, 30 Jun 2021 18:01:52 +0200
Message-Id: <20210630160206.276439-11-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The logic around finding overlay here is not obvious. Actually it does
two simple things:

1. If new bs is already in backing chain, split from parent bs by
   several implicit filters we are done, do nothing.

2. Otherwise, don't try to replace implicit filter.

Let's rewrite this in more obvious way.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210610120537.196183-6-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 53 ++++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 37 deletions(-)

diff --git a/block.c b/block.c
index 6472866283..d047cae43c 100644
--- a/block.c
+++ b/block.c
@@ -4237,7 +4237,7 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
-    BlockDriverState *overlay_bs, *below_bs, *new_backing_bs;
+    BlockDriverState *new_backing_bs;
     QObject *value;
     const char *str;
 
@@ -4266,6 +4266,18 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         g_assert_not_reached();
     }
 
+    if (bs->backing) {
+        if (bdrv_skip_implicit_filters(bs->backing->bs) == new_backing_bs) {
+            return 0;
+        }
+
+        if (bs->backing->bs->implicit) {
+            error_setg(errp, "Cannot change backing link if '%s' has "
+                       "an implicit backing file", bs->node_name);
+            return -EPERM;
+        }
+    }
+
     /*
      * Ensure that @bs can really handle backing files, because we are
      * about to give it one (or swap the existing one)
@@ -4283,42 +4295,9 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
         return -EINVAL;
     }
 
-    /*
-     * Find the "actual" backing file by skipping all links that point
-     * to an implicit node, if any (e.g. a commit filter node).
-     * We cannot use any of the bdrv_skip_*() functions here because
-     * those return the first explicit node, while we are looking for
-     * its overlay here.
-     */
-    overlay_bs = bs;
-    for (below_bs = bdrv_filter_or_cow_bs(overlay_bs);
-         below_bs && below_bs->implicit;
-         below_bs = bdrv_filter_or_cow_bs(overlay_bs))
-    {
-        overlay_bs = below_bs;
-    }
-
-    /* If we want to replace the backing file we need some extra checks */
-    if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
-        int ret;
-
-        /* Check for implicit nodes between bs and its backing file */
-        if (bs != overlay_bs) {
-            error_setg(errp, "Cannot change backing link if '%s' has "
-                       "an implicit backing file", bs->node_name);
-            return -EPERM;
-        }
-
-        reopen_state->replace_backing_bs = true;
-        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
-        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
-                                      errp);
-        if (ret < 0) {
-            return ret;
-        }
-    }
-
-    return 0;
+    reopen_state->replace_backing_bs = true;
+    reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
+    return bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran, errp);
 }
 
 /*
-- 
2.31.1


