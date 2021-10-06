Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BF6423C2E
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 13:11:59 +0200 (CEST)
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY4q6-0005bf-GH
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 07:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eK-0008EZ-Bd
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mY4eH-00063x-Bw
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 06:59:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633517984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JRceF0LMand2ACut0y8W1Ywg/k35iNtfLJXW/w9ptao=;
 b=ZTuDW9x/PsUfmN9s7tlqDXRXtlCbDzkpFopa57zrWmulETIfPndDvYks89v6hCZgbEJIlm
 y+MFhEl0lN1wvDeVySuZpTbchRhk6jT0mu7dbtRUx/aXv6P62xx9otTU2iY/X+t5X6H7BE
 tMIFY2E+oI7chy6R8QTtANYGeP26YCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-Uh695-74NyOgpdy2wUw1iA-1; Wed, 06 Oct 2021 06:59:43 -0400
X-MC-Unique: Uh695-74NyOgpdy2wUw1iA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81B12802C80;
 Wed,  6 Oct 2021 10:59:42 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD53360BE5;
 Wed,  6 Oct 2021 10:59:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/13] block: bdrv_insert_node(): fix and improve error handling
Date: Wed,  6 Oct 2021 12:59:14 +0200
Message-Id: <20211006105923.223549-5-kwolf@redhat.com>
In-Reply-To: <20211006105923.223549-1-kwolf@redhat.com>
References: <20211006105923.223549-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

 - use ERRP_GUARD(): function calls error_prepend(), so it must use
   ERRP_GUARD(), otherwise error_prepend() would not be called when
   passed errp is error_fatal

 - drop error propagation, handle return code instead

 - for symmetry, do error_prepend() for the second failure

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210920115538.264372-3-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block.c b/block.c
index 917fb7faca..5d49188073 100644
--- a/block.c
+++ b/block.c
@@ -5122,8 +5122,9 @@ static void bdrv_delete(BlockDriverState *bs)
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp)
 {
+    ERRP_GUARD();
+    int ret;
     BlockDriverState *new_node_bs;
-    Error *local_err = NULL;
 
     new_node_bs = bdrv_open(NULL, NULL, node_options, flags, errp);
     if (new_node_bs == NULL) {
@@ -5132,12 +5133,12 @@ BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
     }
 
     bdrv_drained_begin(bs);
-    bdrv_replace_node(bs, new_node_bs, &local_err);
+    ret = bdrv_replace_node(bs, new_node_bs, errp);
     bdrv_drained_end(bs);
 
-    if (local_err) {
+    if (ret < 0) {
+        error_prepend(errp, "Could not replace node: ");
         bdrv_unref(new_node_bs);
-        error_propagate(errp, local_err);
         return NULL;
     }
 
-- 
2.31.1


