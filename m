Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07744D66E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 13:14:14 +0100 (CET)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml8y5-0000W6-Um
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 07:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8su-0008VL-Ie
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ml8sr-000366-TM
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 07:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636632529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62CeFwou3FsoOAyfFpCis1e0vM8bDZyqp8CVWH3+0+A=;
 b=bwfROfkCKqEbqzEfZTxSlhTTVoQ01yyLmjIML13lkI+/PHini5b+ksUUD37Q9EI3GRgir3
 a7XvaODvlGratiwK9B7hbgY30h7e7pHrG5Igyo0PiOeAu3dxNEDg8lzkDstnsY9p0mvu/n
 cY8fYTVzY6eZgO6DCLupyDcP7YMCiNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-FmF-P-FRP4mAPw8P2cR_BA-1; Thu, 11 Nov 2021 07:08:48 -0500
X-MC-Unique: FmF-P-FRP4mAPw8P2cR_BA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA2A87D541;
 Thu, 11 Nov 2021 12:08:47 +0000 (UTC)
Received: from localhost (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA7B95C1A3;
 Thu, 11 Nov 2021 12:08:46 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 04/10] block: Drop detached child from ignore list
Date: Thu, 11 Nov 2021 13:08:23 +0100
Message-Id: <20211111120829.81329-5-hreitz@redhat.com>
In-Reply-To: <20211111120829.81329-1-hreitz@redhat.com>
References: <20211111120829.81329-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bdrv_attach_child_common_abort() restores the parent's AioContext.  To
do so, the child (which was supposed to be attached, but is now detached
again by this abort handler) is added to the ignore list for the
AioContext changing functions.

However, since we modify a BDS's children list in the BdrvChildClass's
.attach and .detach handlers, the child is already effectively detached
from the parent by this point.  We do not need to put it into the ignore
list.

Use this opportunity to clean up the empty line structure: Keep setting
the ignore list, invoking the AioContext function, and freeing the
ignore list in blocks separated by empty lines.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index 19bff4f95c..c7d5aa5254 100644
--- a/block.c
+++ b/block.c
@@ -2774,14 +2774,16 @@ static void bdrv_attach_child_common_abort(void *opaque)
     }
 
     if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
-        GSList *ignore = g_slist_prepend(NULL, child);
+        GSList *ignore;
 
+        /* No need to ignore `child`, because it has been detached already */
+        ignore = NULL;
         child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
                                       &error_abort);
         g_slist_free(ignore);
-        ignore = g_slist_prepend(NULL, child);
-        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
 
+        ignore = NULL;
+        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
         g_slist_free(ignore);
     }
 
-- 
2.33.1


