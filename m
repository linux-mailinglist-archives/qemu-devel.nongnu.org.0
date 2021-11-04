Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE194451AE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:46:05 +0100 (CET)
Received: from localhost ([::1]:45826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miaFw-0004Gh-6I
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9t-0004w3-PW
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mia9r-0006wI-JA
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636022386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KiT5wJE3hpi6OY87AfVxU1M/IJt6n26tzfmI8okiQDQ=;
 b=NK8srRRi2LwZ/1FwafZzhzaDiKPYsD7nNjY/QSTcjuMyQ5tlrZH52UIQmk5uKKkYzkZfH/
 3HoX7z0Tr/ic20le0XW0FDH6ibTccbP3V00vc4DbHxXa+wz9CSjFSwl5dzjjxfhnN7vlFP
 l2XIh4nqeHrjmrLYoXt2UJnT1bIqTmE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-yLqMb_33Mg-OUR4aspFjvA-1; Thu, 04 Nov 2021 06:39:43 -0400
X-MC-Unique: yLqMb_33Mg-OUR4aspFjvA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC4511005E65;
 Thu,  4 Nov 2021 10:39:42 +0000 (UTC)
Received: from localhost (unknown [10.39.192.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A4857092B;
 Thu,  4 Nov 2021 10:39:40 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] block: Drop detached child from ignore list
Date: Thu,  4 Nov 2021 11:38:46 +0100
Message-Id: <20211104103849.46855-5-hreitz@redhat.com>
In-Reply-To: <20211104103849.46855-1-hreitz@redhat.com>
References: <20211104103849.46855-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
---
 block.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/block.c b/block.c
index b95f8dcf8f..6d230ad3d1 100644
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


