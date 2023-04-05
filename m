Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBF16D8054
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 17:03:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk4ex-0003Kh-BM; Wed, 05 Apr 2023 11:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk4ev-0003KA-Hh
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pk4et-00028f-Ur
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 11:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680706966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bbfpU6VOFXMZpagW8/QqPkXoEc0tvJXpCZNSlzEMxh0=;
 b=IVUWUcqpQS4WRXCKLJpMrZUiWxQlRXsmiRC+UNDIqIqJH+kWBXre/RPsW05iVUZHF8ox76
 LQISuCjWwX6tG7HIbR0O89V5LKPRIEx1mxTGs3mrmBm8UDQHI+/4c2e7jjicweDMbH2Ao4
 r7WbkX9bR7fgtMJpN5blvTNpUTXTRBA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-534-GFqotUfmOiShRIGIM3fiSg-1; Wed, 05 Apr 2023 11:02:44 -0400
X-MC-Unique: GFqotUfmOiShRIGIM3fiSg-1
Received: by mail-ed1-f71.google.com with SMTP id
 t26-20020a50d71a000000b005003c5087caso49721777edi.1
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680706963; x=1683298963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbfpU6VOFXMZpagW8/QqPkXoEc0tvJXpCZNSlzEMxh0=;
 b=WUOdS9+Hvw4w6t2lfs1PHyktqGsX1RPgmTYDQQUyFyPjlSahtZg6JVT4ep3TktieWd
 d+mGAlktvIEClOae1u3cnneRHF87xWYVuUyRLzLx0aU4vF/hBpUgk8B4O8svvB1ukMEF
 Ys18Akrl+KAc2sRjqGuFlMDdVxccDoPfBD+vBb0zN2rT9e6/rpN7bdNamfu5K78LbLVs
 l2FWHGD6GUZSn7DHRHaEhv3sme6pxhb04D1t7hb5FbcxkSLCi/52XGbaPTrnrJ+Sdaqn
 pY3QtNAnZ2e/z9VQrVd0eZaZTxBJXNJ4CdI3hKZKKcEbTQmSnsdSMl0blCKeuXpVKxFh
 JOvw==
X-Gm-Message-State: AAQBX9eDVrFvEH8maGgJJ2BjADUEp9acpNPGnMRzRBxfjx9WRsnbPhTo
 wpF6IO26e1d9ZhtOKk1CjC8YHmhIxF+gyTxkT3EBBXqBOuLS8pGXkMUmNOGeO3BIl2MIeNhsIXY
 rqRJ66qzNJnrXpKy6ZhdP10RjOUa8ElSKvphqoZoiky0mnS2SFMmrNG4dJhmcNrW48qrFUBD7ri
 Y=
X-Received: by 2002:a17:906:c7d9:b0:93c:847d:a456 with SMTP id
 dc25-20020a170906c7d900b0093c847da456mr3127847ejb.22.1680706962709; 
 Wed, 05 Apr 2023 08:02:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yxhoob5pzxmHA9Pq9sgwvA5miu3l4KtFWLhO89TVDuN5NpMSQ9XMS3ZKeKQcdOdcZ6RfhD5w==
X-Received: by 2002:a17:906:c7d9:b0:93c:847d:a456 with SMTP id
 dc25-20020a170906c7d900b0093c847da456mr3127815ejb.22.1680706962350; 
 Wed, 05 Apr 2023 08:02:42 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a17090625d400b00914001c91fcsm7453212ejb.86.2023.04.05.08.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:02:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com
Subject: [PATCH] qapi-gen: mark coroutine QMP command functions as coroutine_fn
Date: Wed,  5 Apr 2023 17:02:40 +0200
Message-Id: <20230405150240.182627-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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

Coroutine commands have to be declared as coroutine_fn, but the
marker does not show up in the qapi-comands-* headers; likewise, the
marshaling function calls the command and therefore must be coroutine_fn.
Static analysis would want coroutine_fn to match between prototype and
declaration, because in principle coroutines might be compiled to a
completely different calling convention.  So we would like to add the
marker to the header.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/commands.py | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 79c5e5c3a989..a079378d1b8d 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -41,11 +41,13 @@
 def gen_command_decl(name: str,
                      arg_type: Optional[QAPISchemaObjectType],
                      boxed: bool,
-                     ret_type: Optional[QAPISchemaType]) -> str:
+                     ret_type: Optional[QAPISchemaType],
+                     coroutine: bool) -> str:
     return mcgen('''
-%(c_type)s qmp_%(c_name)s(%(params)s);
+%(c_type)s %(coroutine_fn)sqmp_%(c_name)s(%(params)s);
 ''',
                  c_type=(ret_type and ret_type.c_type()) or 'void',
+                 coroutine_fn='coroutine_fn ' if coroutine else '',
                  c_name=c_name(name),
                  params=build_params(arg_type, boxed, 'Error **errp'))
 
@@ -157,16 +159,21 @@ def gen_marshal_output(ret_type: QAPISchemaType) -> str:
                  c_type=ret_type.c_type(), c_name=ret_type.c_name())
 
 
-def build_marshal_proto(name: str) -> str:
-    return ('void qmp_marshal_%s(QDict *args, QObject **ret, Error **errp)'
-            % c_name(name))
+def build_marshal_proto(name: str,
+                        coroutine: bool) -> str:
+    return ('void %(coroutine_fn)sqmp_marshal_%(c_name)s(%(params)s)' % {
+        'coroutine_fn': 'coroutine_fn ' if coroutine else '',
+        'c_name': c_name(name),
+        'params': 'QDict *args, QObject **ret, Error **errp',
+    })
 
 
-def gen_marshal_decl(name: str) -> str:
+def gen_marshal_decl(name: str,
+                     coroutine: bool) -> str:
     return mcgen('''
 %(proto)s;
 ''',
-                 proto=build_marshal_proto(name))
+                 proto=build_marshal_proto(name, coroutine))
 
 
 def gen_trace(name: str) -> str:
@@ -181,7 +188,8 @@ def gen_marshal(name: str,
                 arg_type: Optional[QAPISchemaObjectType],
                 boxed: bool,
                 ret_type: Optional[QAPISchemaType],
-                gen_tracing: bool) -> str:
+                gen_tracing: bool,
+                coroutine: bool) -> str:
     have_args = boxed or (arg_type and not arg_type.is_empty())
     if have_args:
         assert arg_type is not None
@@ -195,7 +203,7 @@ def gen_marshal(name: str,
     bool ok = false;
     Visitor *v;
 ''',
-                proto=build_marshal_proto(name))
+                proto=build_marshal_proto(name, coroutine))
 
     if ret_type:
         ret += mcgen('''
@@ -387,10 +395,11 @@ def visit_command(self,
                            self._genh, self._genc):
                 self._genc.add(gen_marshal_output(ret_type))
         with ifcontext(ifcond, self._genh, self._genc):
-            self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
-            self._genh.add(gen_marshal_decl(name))
+            self._genh.add(gen_command_decl(name, arg_type, boxed,
+                                            ret_type, coroutine))
+            self._genh.add(gen_marshal_decl(name, coroutine))
             self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
-                                       self._gen_tracing))
+                                       self._gen_tracing, coroutine))
             if self._gen_tracing:
                 self._gen_trace_events.add(gen_trace(name))
         with self._temp_module('./init'):
-- 
2.39.2


