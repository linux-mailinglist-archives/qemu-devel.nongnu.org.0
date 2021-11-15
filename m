Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D304507BE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:59:42 +0100 (CET)
Received: from localhost ([::1]:35486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdSP-0006CP-Er
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:59:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNK-0003Lz-Ix
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNH-0007mX-I3
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bz96UtPE3myvzdapdLmAF+2XWx2TRaJMMfM4QfF/ssE=;
 b=B9z08kxWh9I5C92bl/sQ8ws/Aeh1dBoaBxC4/s65DV1HAtQXjAOcXYQgH8OLAcOmF1W0Z+
 9RELy+fLQg65Z4reC5qyaO5EE+nPNUcS1k90PyRq5LyesjSdm6hcdJ4ZSW122tHwQI1QuK
 x/H7ZEhIRs3ONWUu7qwcBM5Tgiffqj0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-6QpJeImnMTW93J6Ny2l2rQ-1; Mon, 15 Nov 2021 09:54:19 -0500
X-MC-Unique: 6QpJeImnMTW93J6Ny2l2rQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 871F81015DC9;
 Mon, 15 Nov 2021 14:54:18 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A49E19D9F;
 Mon, 15 Nov 2021 14:54:17 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/13] block: Unite remove_empty_child and child_free
Date: Mon, 15 Nov 2021 15:53:59 +0100
Message-Id: <20211115145409.176785-4-kwolf@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hanna Reitz <hreitz@redhat.com>

Now that bdrv_remove_empty_child() no longer removes the child from the
parent's children list but only checks that it is not in such a list, it
is only a wrapper around bdrv_child_free() that checks that the child is
empty and unused.  That should apply to all children that we free, so
put those checks into bdrv_child_free() and drop
bdrv_remove_empty_child().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211111120829.81329-4-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/block.c b/block.c
index ca024ffced..19bff4f95c 100644
--- a/block.c
+++ b/block.c
@@ -2740,19 +2740,19 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
 }
 
-static void bdrv_child_free(void *opaque)
-{
-    BdrvChild *c = opaque;
-
-    g_free(c->name);
-    g_free(c);
-}
-
-static void bdrv_remove_empty_child(BdrvChild *child)
+/**
+ * Free the given @child.
+ *
+ * The child must be empty (i.e. `child->bs == NULL`) and it must be
+ * unused (i.e. not in a children list).
+ */
+static void bdrv_child_free(BdrvChild *child)
 {
     assert(!child->bs);
     assert(!child->next.le_prev); /* not in children list */
-    bdrv_child_free(child);
+
+    g_free(child->name);
+    g_free(child);
 }
 
 typedef struct BdrvAttachChildCommonState {
@@ -2786,7 +2786,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     }
 
     bdrv_unref(bs);
-    bdrv_remove_empty_child(child);
+    bdrv_child_free(child);
     *s->child = NULL;
 }
 
@@ -2859,7 +2859,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
 
         if (ret < 0) {
             error_propagate(errp, local_err);
-            bdrv_remove_empty_child(new_child);
+            bdrv_child_free(new_child);
             return ret;
         }
     }
@@ -2925,7 +2925,7 @@ static void bdrv_detach_child(BdrvChild *child)
     BlockDriverState *old_bs = child->bs;
 
     bdrv_replace_child_noperm(child, NULL);
-    bdrv_remove_empty_child(child);
+    bdrv_child_free(child);
 
     if (old_bs) {
         /*
-- 
2.31.1


