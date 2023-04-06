Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F36D8F03
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 08:02:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkIfi-0003qz-HW; Thu, 06 Apr 2023 02:00:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkIfI-0003ok-HL
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:00:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pkIfC-0007Ra-SE
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 02:00:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680760800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z/+AH17y6GSjr2WTMf94yalZ/HnpA12gfIN95y2OP34=;
 b=NZ4emGkUERkBzcfB7Gq6p0duNQEXAU1t7zGiexOFf10MNe4qBzcPIexJNeTDPWxyg+i+Z0
 cu6dFDyzJav2dD3N/8J4HKZr4e1CPu/oD331T5ThAdjppOdGffmza9iZvKH2ZkQgcu0u1o
 kKpQkcuXM4dCg0NvVNJBy0qtaNtZMo4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-WkdoJ3WvM9GjnA6Qn_jnWQ-1; Thu, 06 Apr 2023 01:59:59 -0400
X-MC-Unique: WkdoJ3WvM9GjnA6Qn_jnWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B78572A59548
 for <qemu-devel@nongnu.org>; Thu,  6 Apr 2023 05:59:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AA62492C3E
 for <qemu-devel@nongnu.org>; Thu,  6 Apr 2023 05:59:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 51B7921E6926; Thu,  6 Apr 2023 07:59:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org,  armbru@redhat.com, Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH] qapi-gen: mark coroutine QMP command functions as
 coroutine_fn
References: <20230405150240.182627-1-pbonzini@redhat.com>
Date: Thu, 06 Apr 2023 07:59:57 +0200
In-Reply-To: <20230405150240.182627-1-pbonzini@redhat.com> (Paolo Bonzini's
 message of "Wed, 5 Apr 2023 17:02:40 +0200")
Message-ID: <87v8i9pn36.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Paolo Bonzini <pbonzini@redhat.com> writes:

> Coroutine commands have to be declared as coroutine_fn, but the
> marker does not show up in the qapi-comands-* headers; likewise, the
> marshaling function calls the command and therefore must be coroutine_fn.
> Static analysis would want coroutine_fn to match between prototype and
> declaration, because in principle coroutines might be compiled to a
> completely different calling convention.  So we would like to add the
> marker to the header.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

This continues (completes?) Kevin's commit 04f22362f14 (qapi: Add a
'coroutine' flag for commands).  I'm cc'ing him so he's aware; not a
request for review.

> ---
>  scripts/qapi/commands.py | 33 +++++++++++++++++++++------------
>  1 file changed, 21 insertions(+), 12 deletions(-)
>
> diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> index 79c5e5c3a989..a079378d1b8d 100644
> --- a/scripts/qapi/commands.py
> +++ b/scripts/qapi/commands.py
> @@ -41,11 +41,13 @@
>  def gen_command_decl(name: str,
>                       arg_type: Optional[QAPISchemaObjectType],
>                       boxed: bool,
> -                     ret_type: Optional[QAPISchemaType]) -> str:
> +                     ret_type: Optional[QAPISchemaType],
> +                     coroutine: bool) -> str:
>      return mcgen('''
> -%(c_type)s qmp_%(c_name)s(%(params)s);
> +%(c_type)s %(coroutine_fn)sqmp_%(c_name)s(%(params)s);
>  ''',
>                   c_type=(ret_type and ret_type.c_type()) or 'void',
> +                 coroutine_fn='coroutine_fn ' if coroutine else '',
>                   c_name=c_name(name),
>                   params=build_params(arg_type, boxed, 'Error **errp'))
>  
> @@ -157,16 +159,21 @@ def gen_marshal_output(ret_type: QAPISchemaType) -> str:
>                   c_type=ret_type.c_type(), c_name=ret_type.c_name())
>  
>  
> -def build_marshal_proto(name: str) -> str:
> -    return ('void qmp_marshal_%s(QDict *args, QObject **ret, Error **errp)'
> -            % c_name(name))
> +def build_marshal_proto(name: str,
> +                        coroutine: bool) -> str:

No need for the line break.  No big deal, and certainly not worth a
respin.

> +    return ('void %(coroutine_fn)sqmp_marshal_%(c_name)s(%(params)s)' % {
> +        'coroutine_fn': 'coroutine_fn ' if coroutine else '',
> +        'c_name': c_name(name),
> +        'params': 'QDict *args, QObject **ret, Error **errp',
> +    })
>  
>  
> -def gen_marshal_decl(name: str) -> str:
> +def gen_marshal_decl(name: str,
> +                     coroutine: bool) -> str:

Likewise.

>      return mcgen('''
>  %(proto)s;
>  ''',
> -                 proto=build_marshal_proto(name))
> +                 proto=build_marshal_proto(name, coroutine))
>  
>  
>  def gen_trace(name: str) -> str:
> @@ -181,7 +188,8 @@ def gen_marshal(name: str,
>                  arg_type: Optional[QAPISchemaObjectType],
>                  boxed: bool,
>                  ret_type: Optional[QAPISchemaType],
> -                gen_tracing: bool) -> str:
> +                gen_tracing: bool,
> +                coroutine: bool) -> str:
>      have_args = boxed or (arg_type and not arg_type.is_empty())
>      if have_args:
>          assert arg_type is not None
> @@ -195,7 +203,7 @@ def gen_marshal(name: str,
>      bool ok = false;
>      Visitor *v;
>  ''',
> -                proto=build_marshal_proto(name))
> +                proto=build_marshal_proto(name, coroutine))
>  
>      if ret_type:
>          ret += mcgen('''
> @@ -387,10 +395,11 @@ def visit_command(self,
>                             self._genh, self._genc):
>                  self._genc.add(gen_marshal_output(ret_type))
>          with ifcontext(ifcond, self._genh, self._genc):
> -            self._genh.add(gen_command_decl(name, arg_type, boxed, ret_type))
> -            self._genh.add(gen_marshal_decl(name))
> +            self._genh.add(gen_command_decl(name, arg_type, boxed,
> +                                            ret_type, coroutine))
> +            self._genh.add(gen_marshal_decl(name, coroutine))
>              self._genc.add(gen_marshal(name, arg_type, boxed, ret_type,
> -                                       self._gen_tracing))
> +                                       self._gen_tracing, coroutine))
>              if self._gen_tracing:
>                  self._gen_trace_events.add(gen_trace(name))
>          with self._temp_module('./init'):

Since we have just three commands marked 'coroutine' so far
(block_resize, screendump, and one in tests), reviewing how the
generated code changes is quite practical.  I append the diff.
Highlighting the changes confirms that we add coroutine_fn to the
prototypes and the definitions of these three commands and marshalling
helpers, and that's all.

Reviewed-by: Markus Armbruster <armbru@redhat.com>


diff -rup qapi-gen-efcd0ec14b/commit qapi-gen-e46cbd9158/commit
--- qapi-gen-efcd0ec14b/commit	2023-04-06 07:50:53.212606061 +0200
+++ qapi-gen-e46cbd9158/commit	2023-04-06 07:49:49.254991726 +0200
@@ -1 +1 @@
-efcd0ec14b Merge tag 'misc-fixes-20230330' of https://github.com/philmd/qemu into staging
+e46cbd9158 qapi-gen: mark coroutine QMP command functions as coroutine_fn
diff -rup qapi-gen-efcd0ec14b/qapi-commands-block-core.c qapi-gen-e46cbd9158/qapi-commands-block-core.c
--- qapi-gen-efcd0ec14b/qapi-commands-block-core.c	2023-04-06 07:50:41.951850170 +0200
+++ qapi-gen-e46cbd9158/qapi-commands-block-core.c	2023-04-06 07:49:36.071277209 +0200
@@ -208,7 +208,7 @@ out:
     visit_free(v);
 }
 
-void qmp_marshal_block_resize(QDict *args, QObject **ret, Error **errp)
+void coroutine_fn qmp_marshal_block_resize(QDict *args, QObject **ret, Error **errp)
 {
     Error *err = NULL;
     bool ok = false;
diff -rup qapi-gen-efcd0ec14b/qapi-commands-block-core.h qapi-gen-e46cbd9158/qapi-commands-block-core.h
--- qapi-gen-efcd0ec14b/qapi-commands-block-core.h	2023-04-06 07:50:41.951850170 +0200
+++ qapi-gen-e46cbd9158/qapi-commands-block-core.h	2023-04-06 07:49:36.071277209 +0200
@@ -25,8 +25,8 @@ BlockStatsList *qmp_query_blockstats(boo
 void qmp_marshal_query_blockstats(QDict *args, QObject **ret, Error **errp);
 BlockJobInfoList *qmp_query_block_jobs(Error **errp);
 void qmp_marshal_query_block_jobs(QDict *args, QObject **ret, Error **errp);
-void qmp_block_resize(const char *device, const char *node_name, int64_t size, Error **errp);
-void qmp_marshal_block_resize(QDict *args, QObject **ret, Error **errp);
+void coroutine_fn qmp_block_resize(const char *device, const char *node_name, int64_t size, Error **errp);
+void coroutine_fn qmp_marshal_block_resize(QDict *args, QObject **ret, Error **errp);
 void qmp_blockdev_snapshot_sync(const char *device, const char *node_name, const char *snapshot_file, const char *snapshot_node_name, const char *format, bool has_mode, NewImageMode mode, Error **errp);
 void qmp_marshal_blockdev_snapshot_sync(QDict *args, QObject **ret, Error **errp);
 void qmp_blockdev_snapshot(const char *node, const char *overlay, Error **errp);
diff -rup qapi-gen-efcd0ec14b/qapi-commands-ui.c qapi-gen-e46cbd9158/qapi-commands-ui.c
--- qapi-gen-efcd0ec14b/qapi-commands-ui.c	2023-04-06 07:50:41.953850127 +0200
+++ qapi-gen-e46cbd9158/qapi-commands-ui.c	2023-04-06 07:49:36.073277166 +0200
@@ -107,7 +107,7 @@ out:
     visit_free(v);
 }
 
-void qmp_marshal_screendump(QDict *args, QObject **ret, Error **errp)
+void coroutine_fn qmp_marshal_screendump(QDict *args, QObject **ret, Error **errp)
 {
     Error *err = NULL;
     bool ok = false;
diff -rup qapi-gen-efcd0ec14b/qapi-commands-ui.h qapi-gen-e46cbd9158/qapi-commands-ui.h
--- qapi-gen-efcd0ec14b/qapi-commands-ui.h	2023-04-06 07:50:41.953850127 +0200
+++ qapi-gen-e46cbd9158/qapi-commands-ui.h	2023-04-06 07:49:36.073277166 +0200
@@ -21,8 +21,8 @@ void qmp_set_password(SetPasswordOptions
 void qmp_marshal_set_password(QDict *args, QObject **ret, Error **errp);
 void qmp_expire_password(ExpirePasswordOptions *arg, Error **errp);
 void qmp_marshal_expire_password(QDict *args, QObject **ret, Error **errp);
-void qmp_screendump(const char *filename, const char *device, bool has_head, int64_t head, bool has_format, ImageFormat format, Error **errp);
-void qmp_marshal_screendump(QDict *args, QObject **ret, Error **errp);
+void coroutine_fn qmp_screendump(const char *filename, const char *device, bool has_head, int64_t head, bool has_format, ImageFormat format, Error **errp);
+void coroutine_fn qmp_marshal_screendump(QDict *args, QObject **ret, Error **errp);
 #if defined(CONFIG_SPICE)
 SpiceInfo *qmp_query_spice(Error **errp);
 void qmp_marshal_query_spice(QDict *args, QObject **ret, Error **errp);
diff -rup qapi-gen-efcd0ec14b/test-qapi-commands.c qapi-gen-e46cbd9158/test-qapi-commands.c
--- qapi-gen-efcd0ec14b/test-qapi-commands.c	2023-04-06 07:50:42.146845943 +0200
+++ qapi-gen-e46cbd9158/test-qapi-commands.c	2023-04-06 07:49:36.286272553 +0200
@@ -213,7 +213,7 @@ out:
     visit_free(v);
 }
 
-void qmp_marshal_coroutine_cmd(QDict *args, QObject **ret, Error **errp)
+void coroutine_fn qmp_marshal_coroutine_cmd(QDict *args, QObject **ret, Error **errp)
 {
     Error *err = NULL;
     bool ok = false;
diff -rup qapi-gen-efcd0ec14b/test-qapi-commands.h qapi-gen-e46cbd9158/test-qapi-commands.h
--- qapi-gen-efcd0ec14b/test-qapi-commands.h	2023-04-06 07:50:42.146845943 +0200
+++ qapi-gen-e46cbd9158/test-qapi-commands.h	2023-04-06 07:49:36.286272553 +0200
@@ -26,8 +26,8 @@ UserDefTwo *qmp_user_def_cmd2(UserDefOne
 void qmp_marshal_user_def_cmd2(QDict *args, QObject **ret, Error **errp);
 void qmp_cmd_success_response(Error **errp);
 void qmp_marshal_cmd_success_response(QDict *args, QObject **ret, Error **errp);
-void qmp_coroutine_cmd(Error **errp);
-void qmp_marshal_coroutine_cmd(QDict *args, QObject **ret, Error **errp);
+void coroutine_fn qmp_coroutine_cmd(Error **errp);
+void coroutine_fn qmp_marshal_coroutine_cmd(QDict *args, QObject **ret, Error **errp);
 int64_t qmp_guest_get_time(int64_t a, bool has_b, int64_t b, Error **errp);
 void qmp_marshal_guest_get_time(QDict *args, QObject **ret, Error **errp);
 QObject *qmp_guest_sync(QObject *arg, Error **errp);


