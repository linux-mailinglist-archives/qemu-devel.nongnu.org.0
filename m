Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E58F4507B8
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 15:58:40 +0100 (CET)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmdRP-0003CJ-Ej
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 09:58:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNJ-0003Hq-HB
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mmdNG-0007m7-OS
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 09:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636988062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q9i98B6FfifASQ8YRx9sl+umM4N4n2zAtTX381Z51PI=;
 b=MoM+m3ThC9q4EUaDkK5NQt1PIqkM0vgeB14+TEo51OYo6zZjQuUT1Ef73JbyVvhfVcMDdB
 M5NHtb2F3OnrzjkDA+cchhgEw+uqnP9O2WcVMEAwESyWYR2RIOqOSX8LEacypiWo97jBER
 i1NuLFuJyxrSRbeNhefGdhZwZ2qHfjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-MJpWrEZgP6KDfnA3puobuw-1; Mon, 15 Nov 2021 09:54:21 -0500
X-MC-Unique: MJpWrEZgP6KDfnA3puobuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF28F1015DA4;
 Mon, 15 Nov 2021 14:54:19 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D215E19723;
 Mon, 15 Nov 2021 14:54:18 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 04/13] block: Drop detached child from ignore list
Date: Mon, 15 Nov 2021 15:54:00 +0100
Message-Id: <20211115145409.176785-5-kwolf@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Message-Id: <20211111120829.81329-5-hreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
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
2.31.1


