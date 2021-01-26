Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32728304034
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:25:39 +0100 (CET)
Received: from localhost ([::1]:43348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PHm-0004pV-81
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PCw-0007pv-6x
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PCu-0005ri-JD
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:20:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHUZY59Z4493UOCpqaU1A468PAiw0AAQeDN8rB+E2hU=;
 b=gc/Rn9Aiw1Z0eotTQq+g5l0jQNsYx5DONxcBqC+lWTSizwVjCFOPP256k55pi0GLjgYCsS
 o//0HT2yTqdVkm2D0hk3Cg6JEz9t0579Zb4mK+j3miUNEsrOu1QaMIr2RbUnwH4416p11q
 shKrhIuS+vFWiK+dsOATqU/DpjkcZY4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-U403ReqIO7inHITGDquavQ-1; Tue, 26 Jan 2021 09:20:32 -0500
X-MC-Unique: U403ReqIO7inHITGDquavQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFAAA1005E4A;
 Tue, 26 Jan 2021 14:20:25 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2D86E714;
 Tue, 26 Jan 2021 14:20:24 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/53] block: add API function to insert a node
Date: Tue, 26 Jan 2021 15:19:26 +0100
Message-Id: <20210126142016.806073-4-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>

Provide API for insertion a node to backing chain.

Suggested-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201216061703.70908-3-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block.h |  2 ++
 block.c               | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/block/block.h b/include/block/block.h
index a193545b6a..127bdf3392 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -358,6 +358,8 @@ void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                  Error **errp);
 void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                        Error **errp);
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+                                   int flags, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index 8b9d457546..91a66d4f3e 100644
--- a/block.c
+++ b/block.c
@@ -4660,6 +4660,31 @@ static void bdrv_delete(BlockDriverState *bs)
     g_free(bs);
 }
 
+BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
+                                   int flags, Error **errp)
+{
+    BlockDriverState *new_node_bs;
+    Error *local_err = NULL;
+
+    new_node_bs = bdrv_open(NULL, NULL, node_options, flags, errp);
+    if (new_node_bs == NULL) {
+        error_prepend(errp, "Could not create node: ");
+        return NULL;
+    }
+
+    bdrv_drained_begin(bs);
+    bdrv_replace_node(bs, new_node_bs, &local_err);
+    bdrv_drained_end(bs);
+
+    if (local_err) {
+        bdrv_unref(new_node_bs);
+        error_propagate(errp, local_err);
+        return NULL;
+    }
+
+    return new_node_bs;
+}
+
 /*
  * Run consistency checks on an image
  *
-- 
2.29.2


