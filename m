Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404DD36F98C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 13:46:43 +0200 (CEST)
Received: from localhost ([::1]:35452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcRbW-0008D1-AX
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 07:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQly-0005Dm-Tj
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcQlp-0002uA-Gj
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:53:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619779989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uGG0fmrhfcOATjuUJX1bVZwjwTj+jLWrAd4mWW7jh2o=;
 b=HElPVsXTSceg0gcIwmD1Mxp5+teRKs3ZdLxJcKd5fdqaoBQkigKjNw1ciOBAfc/K95vTmY
 H/rLM4HDO2ncL+PlPPTei17js7xPF0bk34zS4SXjXH38sckoUpp/zsDYDVkm/pUBKufg6M
 lH3+svDMOb/xK6GM75cusmHID2Dblas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-Ga2-SRgDPa6mPhjvvRhrOw-1; Fri, 30 Apr 2021 06:53:01 -0400
X-MC-Unique: Ga2-SRgDPa6mPhjvvRhrOw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D14DD108597F;
 Fri, 30 Apr 2021 10:52:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726A767889;
 Fri, 30 Apr 2021 10:52:29 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 16/39] block: add bdrv_replace_child_safe() transaction action
Date: Fri, 30 Apr 2021 12:51:24 +0200
Message-Id: <20210430105147.125840-17-kwolf@redhat.com>
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

To be used in the following commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20210428151804.439460-17-vsementsov@virtuozzo.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/block.c b/block.c
index 98b7bc179c..a5305662dc 100644
--- a/block.c
+++ b/block.c
@@ -83,6 +83,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static void bdrv_replace_child_noperm(BdrvChild *child,
+                                      BlockDriverState *new_bs);
+
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
@@ -2237,6 +2240,57 @@ static int bdrv_drv_set_perm(BlockDriverState *bs, uint64_t perm,
     return 0;
 }
 
+typedef struct BdrvReplaceChildState {
+    BdrvChild *child;
+    BlockDriverState *old_bs;
+} BdrvReplaceChildState;
+
+static void bdrv_replace_child_commit(void *opaque)
+{
+    BdrvReplaceChildState *s = opaque;
+
+    bdrv_unref(s->old_bs);
+}
+
+static void bdrv_replace_child_abort(void *opaque)
+{
+    BdrvReplaceChildState *s = opaque;
+    BlockDriverState *new_bs = s->child->bs;
+
+    /* old_bs reference is transparently moved from @s to @s->child */
+    bdrv_replace_child_noperm(s->child, s->old_bs);
+    bdrv_unref(new_bs);
+}
+
+static TransactionActionDrv bdrv_replace_child_drv = {
+    .commit = bdrv_replace_child_commit,
+    .abort = bdrv_replace_child_abort,
+    .clean = g_free,
+};
+
+/*
+ * bdrv_replace_child_safe
+ *
+ * Note: real unref of old_bs is done only on commit.
+ */
+__attribute__((unused))
+static void bdrv_replace_child_safe(BdrvChild *child, BlockDriverState *new_bs,
+                                    Transaction *tran)
+{
+    BdrvReplaceChildState *s = g_new(BdrvReplaceChildState, 1);
+    *s = (BdrvReplaceChildState) {
+        .child = child,
+        .old_bs = child->bs,
+    };
+    tran_add(tran, &bdrv_replace_child_drv, s);
+
+    if (new_bs) {
+        bdrv_ref(new_bs);
+    }
+    bdrv_replace_child_noperm(child, new_bs);
+    /* old_bs reference is transparently moved from @child to @s */
+}
+
 /*
  * Check whether permissions on this node can be changed in a way that
  * @cumulative_perms and @cumulative_shared_perms are the new cumulative
-- 
2.30.2


