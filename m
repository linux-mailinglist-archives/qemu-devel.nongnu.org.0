Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FE9645AAE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uLA-0007rC-Lg; Wed, 07 Dec 2022 08:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKz-0007kl-IY
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKw-0006V5-DE
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o49gjvy9vOu2Z38Ktc0I8iJC/3W79CgDm/nZYXeOSUY=;
 b=VVnsJ7q4BeedF/eAySKiLrw4/Y9XT67V11kdr+6HuvxJzEaFr5J2Y1Nc32Rgy0nqD2rlw7
 gkGl5mNB0F9wyWHPOXR0Mr6OE5Em0jw6ZlXMoCcZbN01+TyC0C8nR3byvXJwgVOTrjqqu0
 prCp+w5PZhOMH26bDGVOH4tuy3FfhiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-Enu7NUYkOgqKh-qrcZ90Dg-1; Wed, 07 Dec 2022 08:19:44 -0500
X-MC-Unique: Enu7NUYkOgqKh-qrcZ90Dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27C4B8027EC;
 Wed,  7 Dec 2022 13:19:44 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07E761121314;
 Wed,  7 Dec 2022 13:19:42 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 16/18] block-coroutine-wrapper.py: introduce annotations that
 take the graph rdlock
Date: Wed,  7 Dec 2022 14:18:36 +0100
Message-Id: <20221207131838.239125-17-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Add co_wrapper_bdrv_rdlock and co_wrapper_mixed_bdrv_rdlock option to
the block-coroutine-wrapper.py script.

This "_bdrv_rdlock" option takes and releases the graph rdlock when a
coroutine function is created.

This means that when used together with "_mixed", the function marked
with co_wrapper_mixed_bdrv_rdlock will support both coroutine and
non-coroutine case, and in the latter case it will create a coroutine
that takes and releases the rdlock. When called from a coroutine, the
caller must already hold the graph lock.

Example:
void co_wrapper_mixed_bdrv_rdlock bdrv_f1();

Becomes

static void bdrv_co_enter_f1()
{
    bdrv_graph_co_rdlock();
    bdrv_co_function();
    bdrv_graph_co_rdunlock();
}

void bdrv_f1()
{
    if (qemu_in_coroutine) {
        assume_graph_lock();
        bdrv_co_function();
    } else {
        qemu_co_enter(bdrv_co_enter_f1);
        ...
    }
}

When used alone, the function will not work in coroutine context, and
when called in non-coroutine context it will create a new coroutine that
takes care of taking and releasing the rdlock automatically.

Example:
void co_wrapper_bdrv_rdlock bdrv_f1();

Becomes

static void bdrv_co_enter_f1()
{
    bdrv_graph_co_rdlock();
    bdrv_co_function();
    bdrv_graph_co_rdunlock();
}

void bdrv_f1()
{
    assert(!qemu_in_coroutine());
    qemu_co_enter(bdrv_co_enter_f1);
    ...
}

About their usage:
- co_wrapper does not take the rdlock, so it can be used also outside
  the block layer.
- co_wrapper_mixed will be used by many blk_* functions, since the
  coroutine function needs to call blk_wait_while_drained() and
  the rdlock *must* be taken afterwards, otherwise it's a deadlock.
  In the future this annotation will go away, and blk_* will use
  co_wrapper directly.
- co_wrapper_bdrv_rdlock will be used by BlockDriver callbacks, ideally
  by all of them in the future.
- co_wrapper_mixed_bdrv_rdlock will be used by the remaining functions
  that are still called by coroutine and non-coroutine context. In the
  future this annotation will go away, as we will split such mixed
  functions.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-common.h       |  9 ++++++++-
 scripts/block-coroutine-wrapper.py | 12 ++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/block/block-common.h b/include/block/block-common.h
index 6cf603ab06..4749c46a5e 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -40,14 +40,21 @@
  *
  * Usage: read docs/devel/block-coroutine-wrapper.rst
  *
- * There are 2 kind of specifiers:
+ * There are 4 kind of specifiers:
  * - co_wrapper functions can be called by only non-coroutine context, because
  *   they always generate a new coroutine.
  * - co_wrapper_mixed functions can be called by both coroutine and
  *   non-coroutine context.
+ * - co_wrapper_bdrv_rdlock are co_wrapper functions but automatically take and
+ *   release the graph rdlock when creating a new coroutine
+ * - co_wrapper_mixed_bdrv_rdlock are co_wrapper_mixed functions but
+ *   automatically take and release the graph rdlock when creating a new
+ *   coroutine.
  */
 #define co_wrapper
 #define co_wrapper_mixed
+#define co_wrapper_bdrv_rdlock
+#define co_wrapper_mixed_bdrv_rdlock
 
 #include "block/dirty-bitmap.h"
 #include "block/blockjob.h"
diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 71a06e917a..6e087fa0b7 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -69,6 +69,7 @@ def __init__(self, return_type: str, name: str, args: str,
         self.struct_name = snake_to_camel(self.name)
         self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
         self.create_only_co = 'mixed' not in variant
+        self.graph_rdlock = 'bdrv_rdlock' in variant
 
         subsystem, subname = self.name.split('_', 1)
         self.co_name = f'{subsystem}_co_{subname}'
@@ -123,10 +124,13 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
     """
     name = func.co_name
     struct_name = func.struct_name
+    graph_assume_lock = 'assume_graph_lock();' if func.graph_rdlock else ''
+
     return f"""\
 {func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     if (qemu_in_coroutine()) {{
+        {graph_assume_lock}
         return {name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
@@ -174,6 +178,12 @@ def gen_wrapper(func: FuncDecl) -> str:
     name = func.co_name
     struct_name = func.struct_name
 
+    graph_lock=''
+    graph_unlock=''
+    if func.graph_rdlock:
+        graph_lock='    bdrv_graph_co_rdlock();'
+        graph_unlock='    bdrv_graph_co_rdunlock();'
+
     creation_function = create_mixed_wrapper
     if func.create_only_co:
         creation_function = create_co_wrapper
@@ -193,7 +203,9 @@ def gen_wrapper(func: FuncDecl) -> str:
 {{
     {struct_name} *s = opaque;
 
+{graph_lock}
     s->ret = {name}({ func.gen_list('s->{name}') });
+{graph_unlock}
     s->poll_state.in_progress = false;
 
     aio_wait_kick();
-- 
2.38.1


