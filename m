Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F011F4532A1
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 14:10:16 +0100 (CET)
Received: from localhost ([::1]:49370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmyE3-0006YG-RM
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 08:10:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAY-0003id-Ir
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mmyAW-00074w-Af
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 08:06:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637067995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LLYsAlb07F0tRT5odCuXa1cegvWwkx7TK2hKxJzaeek=;
 b=PCuF6OjtaCFH7i2t/+Alx/oR3vezBIH1EE+u7Y53D5YI6TfxCK6BVAG6ITsICAIhlsZw0r
 couLTWhVcZbOpxwUfRFTFDo2JDdXR1Xsth+abPMkKgFfJMINg2PUEsZPMFsSAUUvexZYoL
 yUF1OkPoR92k8KiXpqjBMHXwdc0y05A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-dDL3zUSPPOSbCqO_Pn-7lQ-1; Tue, 16 Nov 2021 08:06:33 -0500
X-MC-Unique: dDL3zUSPPOSbCqO_Pn-7lQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D7538799EB;
 Tue, 16 Nov 2021 13:06:32 +0000 (UTC)
Received: from localhost (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F3D85D6D5;
 Tue, 16 Nov 2021 13:06:28 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL v2 04/13] block: Drop detached child from ignore list
Date: Tue, 16 Nov 2021 14:06:09 +0100
Message-Id: <20211116130618.700441-5-hreitz@redhat.com>
In-Reply-To: <20211116130618.700441-1-hreitz@redhat.com>
References: <20211116130618.700441-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Message-Id: <20211115145409.176785-5-kwolf@redhat.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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


