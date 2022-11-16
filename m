Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF362C082
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 15:08:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovJ55-0001DP-K2; Wed, 16 Nov 2022 09:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4z-0000uD-Bc
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ovJ4t-0006BQ-3n
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 09:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668607666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwLDLnzEP3/wR4BUpGqG03oyOcX+DzKDBTWtcaqpOzE=;
 b=gyXoe7MYXKhNHGuLkE2QqS9mc81KWcjpjtrTKlEqaBmMfuOk6NpYJgxIRhXQZB+Tj9war1
 Sd5e14CcixJfE9rmtfYh6NHtd8SHUhfiOuHksL99f8ZpxCReFp03xwYiKUCRp2Jr6rByDv
 o00mfDAoPc0U7EmDTt2X0rLqZGPBzhc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-tcVJnZaUPq6cFx4BOy1jSQ-1; Wed, 16 Nov 2022 09:07:41 -0500
X-MC-Unique: tcVJnZaUPq6cFx4BOy1jSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A6086F13D;
 Wed, 16 Nov 2022 14:07:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85B56C1908A;
 Wed, 16 Nov 2022 14:07:39 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alberto Garcia <berto@igalia.com>, Ilya Dryomov <idryomov@gmail.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 09/15] block-coroutine-wrapper: support void functions
Date: Wed, 16 Nov 2022 09:07:24 -0500
Message-Id: <20221116140730.3056048-10-eesposit@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
References: <20221116140730.3056048-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just omit the various 'return' when the return type is
void.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 05267761f0..8d7aa5d7f4 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -115,7 +115,7 @@ def create_g_c_w(func: FuncDecl) -> str:
 {func.return_type} {func.name}({ func.gen_list('{decl}') })
 {{
     if (qemu_in_coroutine()) {{
-        return {name}({ func.gen_list('{name}') });
+        {func.co_ret}{name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
             .poll_state.bs = {func.bs},
@@ -127,7 +127,7 @@ def create_g_c_w(func: FuncDecl) -> str:
         s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
         bdrv_poll_co(&s.poll_state);
-        return s.ret;
+        {func.ret}
     }}
 }}"""
 
@@ -150,7 +150,7 @@ def create_coroutine_only(func: FuncDecl) -> str:
     s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
     bdrv_poll_co(&s.poll_state);
-    return s.ret;
+    {func.ret}
 }}"""
 
 
@@ -168,6 +168,15 @@ def gen_wrapper(func: FuncDecl) -> str:
         graph_lock='    bdrv_graph_co_rdlock();'
         graph_unlock='    bdrv_graph_co_rdunlock();'
 
+    func.get_result = 's->ret = '
+    func.ret = 'return s.ret;'
+    func.co_ret = 'return '
+    func.return_field = func.return_type + " ret;"
+    if func.return_type == 'void':
+        func.get_result = ''
+        func.ret = ''
+        func.co_ret = ''
+        func.return_field = ''
 
     t = func.args[0].type
     if t == 'BlockDriverState *':
@@ -193,7 +202,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 
 typedef struct {struct_name} {{
     BdrvPollCo poll_state;
-    {func.return_type} ret;
+    {func.return_field}
 { func.gen_block('    {decl};') }
 }} {struct_name};
 
@@ -202,7 +211,7 @@ def gen_wrapper(func: FuncDecl) -> str:
     {struct_name} *s = opaque;
 
 {graph_lock}
-    s->ret = {name}({ func.gen_list('s->{name}') });
+    {func.get_result}{name}({ func.gen_list('s->{name}') });
 {graph_unlock}
     s->poll_state.in_progress = false;
 
-- 
2.31.1


