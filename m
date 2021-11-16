Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763154532C6
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:21:38 +0100 (CET)
Received: from localhost ([::1]:39176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyP2-0002Qa-DW
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAk-0003xT-5I
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAe-000777-1K
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637068003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78dbJyI736fdJGWkf5REWFBHsbj3usllaO5KgY231Qo=;
 b=isJDCkXUMJXHFwadasMJ4gu220AI61DOoyWMh+S8pAkdkla0ngnszutgGz8Mpcm7sAByhH
 F4J4l4gRqUAguaMkKUA8Uz7jNvaxnK5w51NFDtqhQE1SEfP7kQbE1iUK7WD/qVvpkJIYaY
 pp4r8AWZExsnVTlgqzCrhAFdaGaRF8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-5DJeUTb9PAW8vEfUr4NACw-1; Tue, 16 Nov 2021 08:06:40 -0500
X-MC-Unique: 5DJeUTb9PAW8vEfUr4NACw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08EE83DC12;
 Tue, 16 Nov 2021 13:06:38 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62FC81970E;
 Tue, 16 Nov 2021 13:06:38 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 06/13] block: Restructure remove_file_or_backing_child()
Date: Tue, 16 Nov 2021 14:06:11 +0100
Message-Id: <20211116130618.700441-7-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As of a future patch, bdrv_replace_child_tran() will take a BdrvChild **
pointer.  Prepare for that by getting such a pointer and using it where
applicable, and (dereferenced) as a parameter for
bdrv_replace_child_tran().

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20211111120829.81329-7-hreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20211115145409.176785-7-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 block.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index d668156eca..8da057f800 100644
--- a/block.c
+++ b/block.c
@@ -4887,30 +4887,33 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
                                               Transaction *tran)
 {
+    BdrvChild **childp;
     BdrvRemoveFilterOrCowChild *s;
 
-    assert(child == bs->backing || child == bs->file);
-
     if (!child) {
         return;
     }
 
+    if (child == bs->backing) {
+        childp = &bs->backing;
+    } else if (child == bs->file) {
+        childp = &bs->file;
+    } else {
+        g_assert_not_reached();
+    }
+
     if (child->bs) {
-        bdrv_replace_child_tran(child, NULL, tran);
+        bdrv_replace_child_tran(*childp, NULL, tran);
     }
 
     s = g_new(BdrvRemoveFilterOrCowChild, 1);
     *s = (BdrvRemoveFilterOrCowChild) {
         .child = child,
-        .is_backing = (child == bs->backing),
+        .is_backing = (childp == &bs->backing),
     };
     tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, s);
 
-    if (s->is_backing) {
-        bs->backing = NULL;
-    } else {
-        bs->file = NULL;
-    }
+    *childp = NULL;
 }
 
 /*
-- 
2.33.1


