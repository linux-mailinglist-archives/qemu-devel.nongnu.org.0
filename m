Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334B662C02A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 14:53:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovImw-0000kW-SH; Wed, 16 Nov 2022 08:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImq-0000gL-Nf
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovImk-00080C-ON
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 08:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668606538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CD4T8FZnqFnpexjp0cS8K7p/5BHP/cxjCBCVIeTGBE=;
 b=U47gm7MKdvxeterR9mNQ6FQPPNBFLohPhw/GW+LWzH064d9sp5Tr1yE6oYdF4R0HUOLoeu
 Tle3HHfAgdp1l7fq8HNj+d+CdGc5+g6qwwxGzTM9Hf637mIwQ+ZLQ+jtCTgcLeGjXmb2HX
 y9dZE4zB9MebWystWToxn/zz6lB1cp4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-D8YWGYuZMCe2nVa4BW127w-1; Wed, 16 Nov 2022 08:48:55 -0500
X-MC-Unique: D8YWGYuZMCe2nVa4BW127w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDF15811E67;
 Wed, 16 Nov 2022 13:48:54 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A09734A9265;
 Wed, 16 Nov 2022 13:48:54 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 08/20] block-coroutine-wrapper.py: take the graph rdlock in
 bdrv_* functions
Date: Wed, 16 Nov 2022 08:48:38 -0500
Message-Id: <20221116134850.3051419-9-eesposit@redhat.com>
In-Reply-To: <20221116134850.3051419-1-eesposit@redhat.com>
References: <20221116134850.3051419-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
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

All generated_co_wrapper functions create a coroutine when
called from non-coroutine context.

The format can be one of the two:

bdrv_something()
    if(qemu_in_coroutine()):
        bdrv_co_something();
    else:
        // create coroutine that calls bdrv_co_something();

blk_something()
    if(qemu_in_coroutine()):
        blk_co_something();
    else:
        // create coroutine that calls blk_co_something();
	// blk_co_something() then eventually calls bdrv_co_something()

The bdrv_co_something functions are recursively traversing the graph,
therefore they all need to be protected with the graph rdlock.
Instead, blk_co_something() calls bdrv_co_something(), so given that and
being always called at the root of the graph (not in recursive
callbacks), they should take the graph rdlock.

The contract is simple, from now on, all bdrv_co_* functions called by g_c_w
callbacks assume that the graph rdlock is taken at the coroutine
creation, i.e. in g_c_w or in specific coroutines (right now we just
consider the g_c_w case).

All the blk_co_* are responsible of taking the rdlock (at this point is still a TBD).

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 21ecb3e896..05267761f0 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -67,8 +67,11 @@ def __init__(self, return_type: str, name: str, args: str,
         self.return_type = return_type.strip()
         self.name = name.strip()
         self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
+        self.lock = True
         self.create_only_co = False
 
+        if variant == '_blk':
+            self.lock = False
         if variant == '_simple':
             self.create_only_co = True
 
@@ -86,7 +89,6 @@ def gen_block(self, format: str) -> str:
                           r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
                           r'\((?P<args>[^)]*)\);$', re.MULTILINE)
 
-
 def func_decl_iter(text: str) -> Iterator:
     for m in func_decl_re.finditer(text):
         yield FuncDecl(return_type=m.group('return_type'),
@@ -160,6 +162,13 @@ def gen_wrapper(func: FuncDecl) -> str:
     func.co_name = f'{subsystem}_co_{subname}'
     name = func.co_name
 
+    graph_lock=''
+    graph_unlock=''
+    if func.lock:
+        graph_lock='    bdrv_graph_co_rdlock();'
+        graph_unlock='    bdrv_graph_co_rdunlock();'
+
+
     t = func.args[0].type
     if t == 'BlockDriverState *':
         bs = 'bs'
@@ -192,7 +201,9 @@ def gen_wrapper(func: FuncDecl) -> str:
 {{
     {struct_name} *s = opaque;
 
+{graph_lock}
     s->ret = {name}({ func.gen_list('s->{name}') });
+{graph_unlock}
     s->poll_state.in_progress = false;
 
     aio_wait_kick();
-- 
2.31.1


