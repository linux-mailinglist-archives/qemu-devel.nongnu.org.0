Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEE836F96F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:37:39 +0200 (CEST)
Received: from localhost ([::1]:45414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRSk-0000bu-F5
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:37:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkt-00045F-I6
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQkn-0002RE-23
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtC+YiJNW+JtxzMvznROYF1hErGyKKeaSwnCI2MEui0=;
 b=Qo8u1izs0Ax2gzhF7oK0L3u3KrW2yGNHiMfdwQYT+MKYRob9Ffix6nn7kNH+uVDLabYl/f
 SRn/YsQscvlrSrmrLM6BxiKI8QOLWfdbk8IZmKjkR2Rreg+FklIlGvQd1bwv3IwR5TACTp
 fOkOiwCJMVuw4kdDzjjzPC0KLuG+LNY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-EI4nN9XTO_ygdkoNALLLIA-1; Fri, 30 Apr 2021 06:52:10 -0400
X-MC-Unique: EI4nN9XTO_ygdkoNALLLIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19E51107ACE3;
 Fri, 30 Apr 2021 10:52:09 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01C6817177;
 Fri, 30 Apr 2021 10:52:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 09/39] block: bdrv_refresh_perms: check for parents permissions
 conflict
Date: Fri, 30 Apr 2021 12:51:17 +0200
Message-Id: <20210430105147.125840-10-kwolf@redhat.com>
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

Add additional check that node parents do not interfere with each
other. This should not hurt existing callers and allows in further
patch use bdrv_refresh_perms() to update a subtree of changed
BdrvChild (check that change is correct).

New check will substitute bdrv_check_update_perm() in following
permissions refactoring, so keep error messages the same to avoid
unit test result changes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-10-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/block.c b/block.c
index 34c728d7e4..fd621f0403 100644
--- a/block.c
+++ b/block.c
@@ -2026,6 +2026,57 @@ bool bdrv_is_writable(BlockDriverState *bs)
     return bdrv_is_writable_after_reopen(bs, NULL);
 }
 
+static char *bdrv_child_user_desc(BdrvChild *c)
+{
+    if (c->klass->get_parent_desc) {
+        return c->klass->get_parent_desc(c);
+    }
+
+    return g_strdup("another user");
+}
+
+static bool bdrv_a_allow_b(BdrvChild *a, BdrvChild *b, Error **errp)
+{
+    g_autofree char *user = NULL;
+    g_autofree char *perm_names = NULL;
+
+    if ((b->perm & a->shared_perm) == b->perm) {
+        return true;
+    }
+
+    perm_names = bdrv_perm_names(b->perm & ~a->shared_perm);
+    user = bdrv_child_user_desc(a);
+    error_setg(errp, "Conflicts with use by %s as '%s', which does not "
+               "allow '%s' on %s",
+               user, a->name, perm_names, bdrv_get_node_name(b->bs));
+
+    return false;
+}
+
+static bool bdrv_parent_perms_conflict(BlockDriverState *bs, Error **errp)
+{
+    BdrvChild *a, *b;
+
+    /*
+     * During the loop we'll look at each pair twice. That's correct because
+     * bdrv_a_allow_b() is asymmetric and we should check each pair in both
+     * directions.
+     */
+    QLIST_FOREACH(a, &bs->parents, next_parent) {
+        QLIST_FOREACH(b, &bs->parents, next_parent) {
+            if (a == b) {
+                continue;
+            }
+
+            if (!bdrv_a_allow_b(a, b, errp)) {
+                return true;
+            }
+        }
+    }
+
+    return false;
+}
+
 static void bdrv_child_perm(BlockDriverState *bs, BlockDriverState *child_bs,
                             BdrvChild *c, BdrvChildRole role,
                             BlockReopenQueue *reopen_queue,
@@ -2203,15 +2254,6 @@ void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
     *shared_perm = cumulative_shared_perms;
 }
 
-static char *bdrv_child_user_desc(BdrvChild *c)
-{
-    if (c->klass->get_parent_desc) {
-        return c->klass->get_parent_desc(c);
-    }
-
-    return g_strdup("another user");
-}
-
 char *bdrv_perm_names(uint64_t perm)
 {
     struct perm_name {
@@ -2355,6 +2397,9 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
     int ret;
     uint64_t perm, shared_perm;
 
+    if (bdrv_parent_perms_conflict(bs, errp)) {
+        return -EPERM;
+    }
     bdrv_get_cumulative_perm(bs, &perm, &shared_perm);
     ret = bdrv_check_perm(bs, NULL, perm, shared_perm, NULL, errp);
     if (ret < 0) {
-- 
2.30.2


