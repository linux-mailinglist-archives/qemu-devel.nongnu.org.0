Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4FF66A440
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:43:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQst-0008Ss-GE; Fri, 13 Jan 2023 15:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQso-0008R5-Kl
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pGQsm-00068x-Oa
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673642556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVOPB379Jvnni2ccSM+vLxv3AvP2G5ZvVhvcaqpt0+k=;
 b=Nl7KCMOqgnnhAaUBPthRDtMrYz+1Kq18ySWifhFCqgy2ZvPMQzCnWR8NAyhMpxWl0Yx1YY
 AIpAkoX+Eu5ijHXivVknoWW1E1oYCV53DW7qDmoI3D9d7s6ehOV4cv+TFgFQU+ffpK/BRn
 OLQcG512IIUiDUGBeYzUeLlfFTtlNXU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-190-IcwNE-4FPXKeYmCls-j39w-1; Fri, 13 Jan 2023 15:42:32 -0500
X-MC-Unique: IcwNE-4FPXKeYmCls-j39w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7894E1C02CBC;
 Fri, 13 Jan 2023 20:42:32 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.195.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 440752026D76;
 Fri, 13 Jan 2023 20:42:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH v2 01/14] block-coroutine-wrapper: support void functions
Date: Fri, 13 Jan 2023 21:41:59 +0100
Message-Id: <20230113204212.359076-2-kwolf@redhat.com>
In-Reply-To: <20230113204212.359076-1-kwolf@redhat.com>
References: <20230113204212.359076-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

Just omit the various 'return' when the return type is void.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 scripts/block-coroutine-wrapper.py | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
index 6e087fa0b7..0c5d7782b1 100644
--- a/scripts/block-coroutine-wrapper.py
+++ b/scripts/block-coroutine-wrapper.py
@@ -85,6 +85,16 @@ def __init__(self, return_type: str, name: str, args: str,
             ctx = 'qemu_get_aio_context()'
         self.ctx = ctx
 
+        self.get_result = 's->ret = '
+        self.ret = 'return s.ret;'
+        self.co_ret = 'return '
+        self.return_field = self.return_type + " ret;"
+        if self.return_type == 'void':
+            self.get_result = ''
+            self.ret = ''
+            self.co_ret = ''
+            self.return_field = ''
+
     def gen_list(self, format: str) -> str:
         return ', '.join(format.format_map(arg.__dict__) for arg in self.args)
 
@@ -131,7 +141,7 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
 {{
     if (qemu_in_coroutine()) {{
         {graph_assume_lock}
-        return {name}({ func.gen_list('{name}') });
+        {func.co_ret}{name}({ func.gen_list('{name}') });
     }} else {{
         {struct_name} s = {{
             .poll_state.ctx = {func.ctx},
@@ -143,7 +153,7 @@ def create_mixed_wrapper(func: FuncDecl) -> str:
         s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
         bdrv_poll_co(&s.poll_state);
-        return s.ret;
+        {func.ret}
     }}
 }}"""
 
@@ -168,7 +178,7 @@ def create_co_wrapper(func: FuncDecl) -> str:
     s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
 
     bdrv_poll_co(&s.poll_state);
-    return s.ret;
+    {func.ret}
 }}"""
 
 
@@ -195,7 +205,7 @@ def gen_wrapper(func: FuncDecl) -> str:
 
 typedef struct {struct_name} {{
     BdrvPollCo poll_state;
-    {func.return_type} ret;
+    {func.return_field}
 { func.gen_block('    {decl};') }
 }} {struct_name};
 
@@ -204,7 +214,7 @@ def gen_wrapper(func: FuncDecl) -> str:
     {struct_name} *s = opaque;
 
 {graph_lock}
-    s->ret = {name}({ func.gen_list('s->{name}') });
+    {func.get_result}{name}({ func.gen_list('s->{name}') });
 {graph_unlock}
     s->poll_state.in_progress = false;
 
-- 
2.38.1


