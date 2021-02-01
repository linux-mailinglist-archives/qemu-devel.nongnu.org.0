Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5C430A80D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 13:54:21 +0100 (CET)
Received: from localhost ([::1]:42884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Yij-0004St-0O
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 07:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YfF-0001Uk-TH
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:50:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1l6YfD-0004Kv-Dn
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 07:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612183842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJAGJCmimKYcS+clNb/u180mdWeuRwVVjwSl9bvxVJo=;
 b=KN0z9xTjERDKeuIteduWLrzG3bv9Mg4kKZejz3d9lFiKV4H2PNYd7X6wiKmkpgm5kiB78a
 A3vLXorunrMN1foY0KTiuBKmwvWcN2fWOFxWUBektIzMQ9/ez0jxp2FpmnWmSnhavn8x4+
 8vcdzsknFnWuSWKO/mcMIKVvApukYNs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-jlXvGvTGMbusheJGlG-PpQ-1; Mon, 01 Feb 2021 07:50:40 -0500
X-MC-Unique: jlXvGvTGMbusheJGlG-PpQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 776AE107ACE3;
 Mon,  1 Feb 2021 12:50:39 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-113-25.rdu2.redhat.com [10.10.113.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EFB010016DB;
 Mon,  1 Feb 2021 12:50:37 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] block: Avoid processing BDS twice in
 bdrv_set_aio_context_ignore()
Date: Mon,  1 Feb 2021 13:50:31 +0100
Message-Id: <20210201125032.44713-2-slp@redhat.com>
In-Reply-To: <20210201125032.44713-1-slp@redhat.com>
References: <20210201125032.44713-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 block.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/block.c b/block.c
index 8b9d457546..3da99312db 100644
--- a/block.c
+++ b/block.c
@@ -6414,7 +6414,10 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
                                  AioContext *new_context, GSList **ignore)
 {
     AioContext *old_context = bdrv_get_aio_context(bs);
-    BdrvChild *child;
+    GSList *children_to_process = NULL;
+    GSList *parents_to_process = NULL;
+    GSList *entry;
+    BdrvChild *child, *parent;
 
     g_assert(qemu_get_current_aio_context() == qemu_get_aio_context());
 
@@ -6429,16 +6432,33 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
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
2.26.2


