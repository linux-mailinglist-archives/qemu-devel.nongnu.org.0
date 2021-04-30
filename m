Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0637D36F988
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:44:29 +0200 (CEST)
Received: from localhost ([::1]:58942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRZM-0006I4-1W
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQm2-0005MO-G7
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlw-0002zz-OG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619780004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3g62pv01KCAWRhayeeMaWdBbIbPsWhoqn3TUsyQRQnU=;
 b=U2BUcgKdsnv6oFj03/AHJloBmEpT9/ypOjxBhIpGJ5aH01WAe3GQo+cQyEZrPNiL+Gl00P
 wTFOL8TRDH1BbleX49aoRXJqcnVrRcm8/K0zLL3WEyT3FeST7MV1kCvCZGu9eLEeMg69DA
 8AIb4EPg0zfY/5pY08TzRv7sFujRx+U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-F0BuJKgyNHKio0fT8JYnyw-1; Fri, 30 Apr 2021 06:53:20 -0400
X-MC-Unique: F0BuJKgyNHKio0fT8JYnyw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90A80890AEE;
 Fri, 30 Apr 2021 10:53:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F9995F707;
 Fri, 30 Apr 2021 10:53:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 28/39] block: add bdrv_set_backing_noperm() transaction action
Date: Fri, 30 Apr 2021 12:51:36 +0200
Message-Id: <20210430105147.125840-29-kwolf@redhat.com>
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

Split out no-perm part of bdrv_set_backing_hd() as a separate
transaction action. Note the in case of existing BdrvChild we reuse it,
not recreate, just to do less actions.

We don't need to create extra reference to backing_hd as we don't lose
it in bdrv_attach_child().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-29-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 54 +++++++++++++++++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 9922943793..bdfe59d94d 100644
--- a/block.c
+++ b/block.c
@@ -92,6 +92,8 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
                                     BdrvChild **child,
                                     Transaction *tran,
                                     Error **errp);
+static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
+                                            Transaction *tran);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -3322,8 +3324,9 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                        Error **errp)
+static int bdrv_set_backing_noperm(BlockDriverState *bs,
+                                   BlockDriverState *backing_hd,
+                                   Transaction *tran, Error **errp)
 {
     int ret = 0;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
@@ -3333,36 +3336,53 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         return -EPERM;
     }
 
-    if (backing_hd) {
-        bdrv_ref(backing_hd);
-    }
-
     if (bs->backing) {
         /* Cannot be frozen, we checked that above */
-        bdrv_unref_child(bs, bs->backing);
-        bs->backing = NULL;
+        bdrv_unset_inherits_from(bs, bs->backing, tran);
+        bdrv_remove_filter_or_cow_child(bs, tran);
     }
 
     if (!backing_hd) {
         goto out;
     }
 
-    bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
-                                    bdrv_backing_role(bs), errp);
-    if (!bs->backing) {
-        ret = -EPERM;
-        goto out;
+    ret = bdrv_attach_child_noperm(bs, backing_hd, "backing",
+                                   &child_of_bds, bdrv_backing_role(bs),
+                                   &bs->backing, tran, errp);
+    if (ret < 0) {
+        return ret;
     }
 
-    /* If backing_hd was already part of bs's backing chain, and
+
+    /*
+     * If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
-     * point directly to bs (else it will become NULL). */
+     * point directly to bs (else it will become NULL).
+     */
     if (update_inherits_from) {
-        backing_hd->inherits_from = bs;
+        bdrv_set_inherits_from(backing_hd, bs, tran);
     }
 
 out:
-    bdrv_refresh_limits(bs, NULL, NULL);
+    bdrv_refresh_limits(bs, tran, NULL);
+
+    return 0;
+}
+
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
+{
+    int ret;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = bdrv_refresh_perms(bs, errp);
+out:
+    tran_finalize(tran, ret);
 
     return ret;
 }
-- 
2.30.2


