Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECEB36F982
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:41:39 +0200 (CEST)
Received: from localhost ([::1]:54020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRWc-0004Aa-1P
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQku-00045X-Fm
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkr-0002Uh-ED
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rGoJwNVvhlQTgMhwGQUBxm3mKCbGk8OzRyLkMBl1tqg=;
 b=Ru3idc9o8VyBqpp2xLEYYjyCtgX9HnrI6gJ8Hjcs0d/HCurbA0VZQ9cg3eHXZ5AuISymV6
 rjoLkfgAJUTvkWnIpHpIk4zK+YuSVy9MEOTgYKfFyB7d/5zodpGiG5KPbGKFLx7wBf3yUQ
 0VnKLX80qxwyrCfi6xcRvMBehzJY1Zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-pOBxAmCpORaeSczatvtquw-1; Fri, 30 Apr 2021 06:52:12 -0400
X-MC-Unique: pOBxAmCpORaeSczatvtquw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C571801106;
 Fri, 30 Apr 2021 10:52:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACF6217177;
 Fri, 30 Apr 2021 10:52:10 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 11/39] block: rewrite bdrv_child_try_set_perm() using
 bdrv_refresh_perms()
Date: Fri, 30 Apr 2021 12:51:19 +0200
Message-Id: <20210430105147.125840-12-kwolf@redhat.com>
In-Reply-To: <20210430105147.125840-1-kwolf@redhat.com>
References: <20210430105147.125840-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We are going to drop recursive bdrv_child_* functions, so stop use them
in bdrv_child_try_set_perm() as a first step.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-12-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 0ee0c2f29a..4511766825 100644
--- a/block.c
+++ b/block.c
@@ -2454,11 +2454,16 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
                             Error **errp)
 {
     Error *local_err = NULL;
+    Transaction *tran = tran_new();
     int ret;
 
-    ret = bdrv_child_check_perm(c, NULL, perm, shared, NULL, &local_err);
+    bdrv_child_set_perm_safe(c, perm, shared, tran);
+
+    ret = bdrv_refresh_perms(c->bs, &local_err);
+
+    tran_finalize(tran, ret);
+
     if (ret < 0) {
-        bdrv_child_abort_perm_update(c);
         if ((perm & ~c->perm) || (c->shared_perm & ~shared)) {
             /* tighten permissions */
             error_propagate(errp, local_err);
@@ -2472,12 +2477,9 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
             error_free(local_err);
             ret = 0;
         }
-        return ret;
     }
 
-    bdrv_child_set_perm(c);
-
-    return 0;
+    return ret;
 }
 
 int bdrv_child_refresh_perms(BlockDriverState *bs, BdrvChild *c, Error **errp)
-- 
2.30.2


