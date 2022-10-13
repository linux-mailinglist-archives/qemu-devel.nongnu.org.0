Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A795F5FD75C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 11:53:51 +0200 (CEST)
Received: from localhost ([::1]:45134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiuuS-0006Nn-7c
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 05:53:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiucm-0003BX-6u
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:35:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiuch-0006jp-RO
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 05:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665653726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gmZmqAc/GjqBAb5+KyAfl68rbirTNLAYsz5Gl5lS1YM=;
 b=dLvU2OJMP5qnn7p9xC9N6aYfJAH2R0nYpfoScPjmZuj1VmxrDTSo6x3ZiP8LNysXzeGgIt
 Y4nE/PauVvZOufIWhkUHhLXqG1/DIje0mC2JYxwUzBpoEWTrdyCRqsHHg1iCsaW48dYqBI
 HaKK3moCLqnrKwpY7ypbXNWppTUgUBs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-250-x5JTcNvYNdCPOdO85RQGIg-1; Thu, 13 Oct 2022 05:35:25 -0400
X-MC-Unique: x5JTcNvYNdCPOdO85RQGIg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hd11-20020a170907968b00b0078df60485fdso613322ejc.17
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 02:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gmZmqAc/GjqBAb5+KyAfl68rbirTNLAYsz5Gl5lS1YM=;
 b=Efp4+p3yfSwpnb8e7qfLrdMnydNMIr2NGs8Bjk2XosQ+ZgFmpAAz9MrgQBk3pQ6cuU
 eguGdnRNogJ+862ME66eUAwFljRJPf1WdAcj5thn6s93R7soVKv8lwFOucSwA3Vqm5m9
 DYfzOELNBsA0otTVJ+1IZWmZBfKIgULzS2zyFXX85wv8ym+5SYhE0RBG6IyWcgLQTm0R
 xejWM/VgUAJQGbqbozZIXkeVUpNgsiGHlTTJHScJR8xRX+Q10IhA3vGZaog2nAckGfl+
 DsE6lAXdSQ+w7YhdVxhG7sFady1X8bVCxaTPtvAHpVyWZiDr6HePwyclm1CZrzbPisyt
 9iAw==
X-Gm-Message-State: ACrzQf24yMDcwWuyYz+3zL4nyQ7iAiNQDwjMvuwOlDVVsufnEcUTj+GU
 uVNlgtL+MAje+coGYqYxO2fetWddTBHfiXc1WZWxniOkQU8ldDe2ZyV5PLECES/wriKxGfYN47h
 3lrh87DvmS+8C8maOP3Kh4CcJr5JQe5UxzQOtTIcz+ekKC8v4OSA7SZ0KsVC3CB0/oL4=
X-Received: by 2002:a17:907:6d9b:b0:78d:ce6a:3300 with SMTP id
 sb27-20020a1709076d9b00b0078dce6a3300mr11325709ejc.91.1665653724076; 
 Thu, 13 Oct 2022 02:35:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5/m1hYhi/7Gu+11xqId4rGmytF+TBJ8+fg9N1hsXkK+wwp+FZm6roKB6fJZTCSiItv30whUQ==
X-Received: by 2002:a17:907:6d9b:b0:78d:ce6a:3300 with SMTP id
 sb27-20020a1709076d9b00b0078dce6a3300mr11325691ejc.91.1665653723762; 
 Thu, 13 Oct 2022 02:35:23 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a17090681d800b0078d0981516esm2690167ejx.38.2022.10.13.02.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 02:35:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: afaria@redhat.com,
	qemu-block@nongnu.org,
	armbru@redhat.com
Subject: [PATCH] qapi-gen: mark coroutine QMP command functions as coroutine_fn
Date: Thu, 13 Oct 2022 11:35:20 +0200
Message-Id: <20221013093520.586312-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coroutine commands have to be declared as coroutine_fn, but the
marker does not show up in the qapi-comands-* headers; likewise, the
marshaling function calls the command and therefore must be coroutine_fn.
Static analysis would want coroutine_fn to match between prototype and
declaration, because in principle coroutines might be compiled to a
completely different calling convention.  So we would like to add the
marker to the header.

Unfortunately, doing so causes lots of files to fail to compile because
they do not include qemu/coroutine.h; which in principle is legitimate
because the files could be only dealing with non-coroutine commands.
There are three ways to deal with this:

- include qemu/coroutine.h in all the files that include the qapi-commands-*
  headers.  This would be a large change and in many case unnecessary,
  because only very few files deal with coroutine commands

- include qemu/coroutine.h from the headers themselves.  This is
  ugly for the same reason, and also because headers-including-headers
  make it harder to avoid world rebuilds

- only define the affected prototypes if coroutine_fn is defined,
  meaning that the .c file has already included qemu/coroutine.h.
  This is what the patch goes for.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/qapi/commands.py | 38 ++++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 38ca38a7b9..31833f172f 100644
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
@@ -314,6 +322,7 @@ def _begin_user_module(self, name: str) -> None:
 #include "qapi/qmp/qdict.h"
 #include "qapi/dealloc-visitor.h"
 #include "qapi/error.h"
+#include "qemu/coroutine.h"
 #include "%(visit)s.h"
 #include "%(commands)s.h"
 
@@ -388,10 +397,15 @@ def visit_command(self,
                            self._genh, self._genc):
                 self._genc.add(gen_marshal_output(ret_type))
         with ifcontext(ifcond, self._genh, self._genc):
-            self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
-            self._genh.add(gen_marshal_decl(name))
+            if coroutine:
+                self._genh.add('#ifdef coroutine_fn\n')
+            self._genh.add(gen_command_decl(name, arg_type, boxed,
+                                            ret_type, coroutine))
+            self._genh.add(gen_marshal_decl(name, coroutine))
+            if coroutine:
+                self._genh.add('#endif\n')
             self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
-                                       self._gen_tracing))
+                                       self._gen_tracing, coroutine))
             if self._gen_tracing:
                 self._gen_trace_events.add(gen_trace(name))
         with self._temp_module('./init'):
-- 
2.37.3


