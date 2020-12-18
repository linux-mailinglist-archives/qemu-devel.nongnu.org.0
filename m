Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2B2DE674
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:23:41 +0100 (CET)
Received: from localhost ([::1]:39120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHbY-0005mR-93
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRl-0002P9-L9
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRY-0005Mb-Ne
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMA9/l+fvoL9xbJXJhENML8DdN9ZjKIsDJEXEF7PAFI=;
 b=NHHc5cJvvqW4FhfOiR6crZQ+/uSEzROzn9pSXv9hmdwVYkZ5CrIrPhwXlCJWEwEsfBwxtV
 AKgksGhTNwCbWa4FJVuQHD2LgNDZQ9OZQgM4IJSSozcrTvIPeD/WhNQPysuZSzLADbCNVW
 WGhGv05wzB5Ha7bjnZVqCpywzJSN/aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-YcEcPmpvMgKTa4HPZuOReA-1; Fri, 18 Dec 2020 10:13:18 -0500
X-MC-Unique: YcEcPmpvMgKTa4HPZuOReA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A52D803626;
 Fri, 18 Dec 2020 15:13:17 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3D2C17577;
 Fri, 18 Dec 2020 15:13:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/30] block: bdrv_check_perm(): process children anyway
Date: Fri, 18 Dec 2020 16:12:30 +0100
Message-Id: <20201218151249.715731-12-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Do generic processing even for drivers which define .bdrv_check_perm
handler. It's needed for further preallocate filter: it will need to do
additional action on bdrv_check_perm, but don't want to reimplement
generic logic.

The patch doesn't change existing behaviour: the only driver that
implements bdrv_check_perm is file-posix, but it never has any
children.

Also, bdrv_set_perm() don't stop processing if driver has
.bdrv_set_perm handler as well.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20201021145859.11201-8-vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index b57421a969..64412ee7de 100644
--- a/block.c
+++ b/block.c
@@ -2028,8 +2028,11 @@ static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
     }
 
     if (drv->bdrv_check_perm) {
-        return drv->bdrv_check_perm(bs, cumulative_perms,
-                                    cumulative_shared_perms, errp);
+        ret = drv->bdrv_check_perm(bs, cumulative_perms,
+                                   cumulative_shared_perms, errp);
+        if (ret < 0) {
+            return ret;
+        }
     }
 
     /* Drivers that never have children can omit .bdrv_child_perm() */
-- 
2.29.2


