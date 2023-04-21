Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F39976EA730
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:38:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppn9H-0008Fo-G6; Fri, 21 Apr 2023 05:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn9A-0008Ex-Hh
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppn99-00033H-06
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:33:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682069618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iO/1n+pcKS6FRHfkbmdImpIrBTesk7jNxOCOpPvcGVo=;
 b=A5HO0Akx7FpJLYRJYDU55XgufgAV2n0pz7/1R7/Daoc7czdrF6ILAqXO1OZEhRzVuzwwFw
 WVGE66CXuc21+bssN20gZYElG56NMgL6Z+RlwU3XEKNBdkWVo/VDQwuv50IVHRUTuk75dg
 1ZfGdTFsfdRQOQYCIicoWDUw3qqi5tk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-WgTx5zhxNQilyfujbbCKRA-1; Fri, 21 Apr 2023 05:33:36 -0400
X-MC-Unique: WgTx5zhxNQilyfujbbCKRA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-506a7b4f141so1625544a12.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 02:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682069614; x=1684661614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iO/1n+pcKS6FRHfkbmdImpIrBTesk7jNxOCOpPvcGVo=;
 b=NGWL3BEBosWiaVSfYL10bPrhDHjI/9uG95imA2LEJ+3p4U4PVZv1J+3egMMcM42k5K
 nrLVAG96GW6w0csJICt7FH1R1x8hbxukHl1A4tVKuMuZZ5jadv3EbwLNFvqrc5xXpy1N
 iGdGu+89Jdr97/G5omZI2hMEv6ihnyZJFDrNBaTf3EZaTa7gmMvBIlxAm0GETptYi4UR
 cxEDzvw2/4FBXstKuQiSNGOKioJdUgB5meoCqhQug/pNEg4ZhBNBOSQ3G07RhxfUy+uw
 oxZGY2EH710+8AVDodq1xKhCCmfzdasr1It6Bz8anzqS2En59Z5DJtmA91uV/Qdqi8m4
 yVGA==
X-Gm-Message-State: AAQBX9cR+3J4Fx3qAsOzQvGittbKWiOv8TigiYR/+k9WASBtdXpC0wzZ
 TtILtJHxyEriokHEpFBF3SBUIePVQcj7z/Nr2nTO4fsQcgZg1nA/n5H73DyFr8MGK2e2RjdCUwj
 9mvcek8j2CrnM/rs9zoN+hHmxsiBoR9W2XIVNq5n75Z3ZKpCk/JIt61uRtoN7W7qLUQZxdeMzyo
 Fn+w==
X-Received: by 2002:a17:906:805a:b0:94e:fa56:a74f with SMTP id
 x26-20020a170906805a00b0094efa56a74fmr1777586ejw.14.1682069614521; 
 Fri, 21 Apr 2023 02:33:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350YVK19mRfWae5ZitbeFIh31eAAobQOeBVPMdF8qt6803rCJl952uRw7nmHz7EXo7I0izFvxDA==
X-Received: by 2002:a17:906:805a:b0:94e:fa56:a74f with SMTP id
 x26-20020a170906805a00b0094efa56a74fmr1777576ejw.14.1682069614257; 
 Fri, 21 Apr 2023 02:33:34 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 jt20-20020a170906ca1400b008e54ac90de1sm1804717ejb.74.2023.04.21.02.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 02:33:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
Subject: [PULL 12/25] qapi-gen: mark coroutine QMP command functions as
 coroutine_fn
Date: Fri, 21 Apr 2023 11:33:03 +0200
Message-Id: <20230421093316.17941-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421093316.17941-1-pbonzini@redhat.com>
References: <20230421093316.17941-1-pbonzini@redhat.com>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
2.40.0


