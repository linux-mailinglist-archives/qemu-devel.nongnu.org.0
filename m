Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B21661004F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:35:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7gJ-0001io-KR; Thu, 27 Oct 2022 14:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7gF-0001YJ-QV
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oo7g7-0002RU-4A
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666895550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Me6Gni07bj7MkAw9VzgpghN7VMvK2kkoWIep+2wqvw=;
 b=F3H0vinz7mMKUK0gJaGBtpQEBtPOA3HCme0uEab+JzgMy6Ds4FVOk43yt2A0iwNKgoWFq8
 ihCBXFmQS4SMuabaBWHUf7fE5GBrIFQi6imbtv437GtQOzV1hdl5SL5UiH3Krk5lgSku7i
 zX8gvHzzvUyjVmQfowaKX8aRe1maa9A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-IU3e2tsVNcCnTPesnnCOWg-1; Thu, 27 Oct 2022 14:32:29 -0400
X-MC-Unique: IU3e2tsVNcCnTPesnnCOWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D2783833AF3;
 Thu, 27 Oct 2022 18:32:28 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0671121320;
 Thu, 27 Oct 2022 18:32:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 18/58] Revert "block: Restructure
 remove_file_or_backing_child()"
Date: Thu, 27 Oct 2022 20:31:06 +0200
Message-Id: <20221027183146.463129-19-kwolf@redhat.com>
In-Reply-To: <20221027183146.463129-1-kwolf@redhat.com>
References: <20221027183146.463129-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit 562bda8bb41879eeda0bd484dd3d55134579b28e.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220726201134.924743-12-vsementsov@yandex-team.ru>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 196d1cf665..2f80b7e094 100644
--- a/block.c
+++ b/block.c
@@ -5055,33 +5055,30 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
-    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
+    assert(child == bs->backing || child == bs->file);
+
     if (!child) {
         return;
     }
 
-    if (child == bs->backing) {
-        childp = &bs->backing;
-    } else if (child == bs->file) {
-        childp = &bs->file;
-    } else {
-        g_assert_not_reached();
-    }
-
     if (child->bs) {
-        bdrv_replace_child_tran(*childp, NULL, tran);
+        bdrv_replace_child_tran(child, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (childp == &bs->backing),
+        .is_backing = (child == bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    *childp = NULL;
+    if (s->is_backing) {
+        bs->backing = NULL;
+    } else {
+        bs->file = NULL;
+    }
 }
 
 /*
-- 
2.37.3


