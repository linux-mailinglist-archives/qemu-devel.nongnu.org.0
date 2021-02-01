Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C6330B018
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 20:10:32 +0100 (CET)
Received: from localhost ([::1]:49988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6eam-0005Vs-0F
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 14:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXz-0003ks-A9
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6eXx-0000Oz-Nd
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 14:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612206457;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/UPzXrJ27AqJD479c69kO56oBloOrR2rW0hBBE0pdeM=;
 b=cTToOm+SSMojEm544KtCw/gEGP9ar6Oxs+XhrzB7/FONJW+7rNc0hVejmeuSe4bkQ4KckU
 kdZSMNV7192oXjU5qa19yR7RIXH5TpCTGcr/zoMxk4JFM3swAhGLro/kt8TLlVms/hOC7R
 4ZRwSm71fet09BhOySYMsIqxoQpnIek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-aFBTATnuPOKPHDOpzAKQKg-1; Mon, 01 Feb 2021 14:07:33 -0500
X-MC-Unique: aFBTATnuPOKPHDOpzAKQKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFDB081620;
 Mon,  1 Feb 2021 19:07:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F8560C05;
 Mon,  1 Feb 2021 19:07:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 2/6] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Date: Mon,  1 Feb 2021 20:07:16 +0100
Message-Id: <20210201190720.245732-3-kwolf@redhat.com>
In-Reply-To: <20210201190720.245732-1-kwolf@redhat.com>
References: <20210201190720.245732-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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

From: Sergio Lopez <slp@redhat.com>

Some graphs may contain an indirect reference to the first BDS in the
chain that can be reached while walking it bottom->up from one its
children.

Doubling-processing of a BDS is especially problematic for the
aio_notifiers, as they might attempt to work on both the old and the
new AIO contexts.

To avoid this problem, add every child and parent to the ignore list
before actually processing them.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Sergio Lopez <slp@redhat.com>
Message-Id: <20210201125032.44713-2-slp@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 91a66d4f3e..5c428e1595 100644
--- a/block.c
+++ b/block.c
@@ -6439,7 +6439,10 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
                                  AioContext *new_context, GSList **ignore)
 {
     AioContext *old_context = bdrv_get_aio_context(bs);
-    BdrvChild *child;
+    GSList *children_to_process = NULL;
+    GSList *parents_to_process = NULL;
+    GSList *entry;
+    BdrvChild *child, *parent;
 
     g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
 
@@ -6454,16 +6457,33 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
             continue;
         }
         *ignore = g_slist_prepend(*ignore, child);
-        bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
+        children_to_process = g_slist_prepend(children_to_process, child);
     }
-    QLIST_FOREACH(child, &bs->parents, next_parent) {
-        if (g_slist_find(*ignore, child)) {
+
+    QLIST_FOREACH(parent, &bs->parents, next_parent) {
+        if (g_slist_find(*ignore, parent)) {
             continue;
         }
-        assert(child->klass->set_aio_ctx);
-        *ignore = g_slist_prepend(*ignore, child);
-        child->klass->set_aio_ctx(child, new_context, ignore);
+        *ignore = g_slist_prepend(*ignore, parent);
+        parents_to_process = g_slist_prepend(parents_to_process, parent);
+    }
+
+    for (entry = children_to_process;
+         entry != NULL;
+         entry = g_slist_next(entry)) {
+        child = entry->data;
+        bdrv_set_aio_context_ignore(child->bs, new_context, ignore);
+    }
+    g_slist_free(children_to_process);
+
+    for (entry = parents_to_process;
+         entry != NULL;
+         entry = g_slist_next(entry)) {
+        parent = entry->data;
+        assert(parent->klass->set_aio_ctx);
+        parent->klass->set_aio_ctx(parent, new_context, ignore);
     }
+    g_slist_free(parents_to_process);
 
     bdrv_detach_aio_context(bs);
 
-- 
2.29.2


