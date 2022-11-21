Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC36321CE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:23:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox5oN-0006BT-SD; Mon, 21 Nov 2022 07:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox5oL-0006BL-K1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ox5oJ-0007j1-Oz
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669033323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/3qgvcI6c7FMizUkhvOfUbnWn1LRFP9h946g0QU6NAo=;
 b=iqT+jq7SrfJr5VdgaFKhsvaIYBpdemf/RuuD2O7LNaaxTURr7NiEhDKZjGktxfl8PX1uk2
 +Gfxrp9dPoBCrw6R9IK4NTck5gxBTcoDYVdJxE/uH5eAF05nuZM2WQQulJZPTpTgGtwou/
 tufL1KuimQch1RDqpokyFVfEiFcCkPc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-z3Zw-aZtOBaw3sxmsHUYXg-1; Mon, 21 Nov 2022 07:21:59 -0500
X-MC-Unique: z3Zw-aZtOBaw3sxmsHUYXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B228101A528;
 Mon, 21 Nov 2022 12:21:59 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF03492B06;
 Mon, 21 Nov 2022 12:21:57 +0000 (UTC)
Date: Mon, 21 Nov 2022 13:21:54 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v4 04/11] block-coroutine-wrapper.py: introduce
 generated_co_wrapper_simple
Message-ID: <Y3ttYuCVO9xTNBlH@redhat.com>
References: <20221116122241.2856527-1-eesposit@redhat.com>
 <20221116122241.2856527-5-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116122241.2856527-5-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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

Am 16.11.2022 um 13:22 hat Emanuele Giuseppe Esposito geschrieben:
> This new annotation creates just a function wrapper that creates
> a new coroutine. It assumes the caller is not a coroutine.
> 
> This is much better as g_c_w, because it is clear if the caller
> is a coroutine or not, and provides the advantage of automating
> the code creation. In the future all g_c_w functions will be
> substituted on g_c_w_simple.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>

$ mypy --strict scripts/block-coroutine-wrapper.py
scripts/block-coroutine-wrapper.py:31: error: Function is missing a return type annotation
scripts/block-coroutine-wrapper.py:90: error: Missing type parameters for generic type "Iterator"
scripts/block-coroutine-wrapper.py:110: error: "FuncDecl" has no attribute "co_name"
scripts/block-coroutine-wrapper.py:111: error: "FuncDecl" has no attribute "struct_name"
scripts/block-coroutine-wrapper.py:112: error: "FuncDecl" has no attribute "bs"
scripts/block-coroutine-wrapper.py:135: error: "FuncDecl" has no attribute "co_name"
scripts/block-coroutine-wrapper.py:136: error: "FuncDecl" has no attribute "struct_name"
scripts/block-coroutine-wrapper.py:137: error: "FuncDecl" has no attribute "bs"
scripts/block-coroutine-wrapper.py:160: error: "FuncDecl" has no attribute "co_name"
scripts/block-coroutine-wrapper.py:161: error: "FuncDecl" has no attribute "co_name"
scripts/block-coroutine-wrapper.py:172: error: "FuncDecl" has no attribute "bs"
scripts/block-coroutine-wrapper.py:173: error: "FuncDecl" has no attribute "struct_name"
scripts/block-coroutine-wrapper.py:174: error: "FuncDecl" has no attribute "struct_name"
scripts/block-coroutine-wrapper.py:218: error: Call to untyped function "gen_header" in typed context
Found 14 errors in 1 file (checked 1 source file)

The first two and the last one isn't the fault of this patch, but the
others are. When you add new attributes, they should be declared in
FuncDecl.__init__(). And actually, this even seems like a better place
to initialise them already with the right value than gen_wrapper().

>  include/block/block-common.h       |  1 +
>  scripts/block-coroutine-wrapper.py | 87 ++++++++++++++++++++++--------
>  2 files changed, 66 insertions(+), 22 deletions(-)
> 
> diff --git a/include/block/block-common.h b/include/block/block-common.h
> index 297704c1e9..8ae750c7cf 100644
> --- a/include/block/block-common.h
> +++ b/include/block/block-common.h
> @@ -43,6 +43,7 @@
>   * Read more in docs/devel/block-coroutine-wrapper.rst
>   */
>  #define generated_co_wrapper
> +#define generated_co_wrapper_simple
>  
>  /* block.c */
>  typedef struct BlockDriver BlockDriver;
> diff --git a/scripts/block-coroutine-wrapper.py b/scripts/block-coroutine-wrapper.py
> index 08be813407..f88ef53964 100644
> --- a/scripts/block-coroutine-wrapper.py
> +++ b/scripts/block-coroutine-wrapper.py
> @@ -62,10 +62,15 @@ def __init__(self, param_decl: str) -> None:
>  
>  
>  class FuncDecl:
> -    def __init__(self, return_type: str, name: str, args: str) -> None:
> +    def __init__(self, return_type: str, name: str, args: str,
> +                 variant: str) -> None:
>          self.return_type = return_type.strip()
>          self.name = name.strip()
>          self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
> +        self.create_only_co = False
> +
> +        if variant == '_simple':
> +            self.create_only_co = True
>  
>      def gen_list(self, format: str) -> str:
>          return ', '.join(format.format_map(arg.__dict__) for arg in self.args)
> @@ -75,7 +80,8 @@ def gen_block(self, format: str) -> str:
>  
>  
>  # Match wrappers declared with a generated_co_wrapper mark
> -func_decl_re = re.compile(r'^int\s*generated_co_wrapper\s*'
> +func_decl_re = re.compile(r'^int\s*generated_co_wrapper'
> +                          r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'
>                            r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
>                            r'\((?P<args>[^)]*)\);$', re.MULTILINE)
>  
> @@ -84,7 +90,8 @@ def func_decl_iter(text: str) -> Iterator:
>      for m in func_decl_re.finditer(text):
>          yield FuncDecl(return_type='int',
>                         name=m.group('wrapper_name'),
> -                       args=m.group('args'))
> +                       args=m.group('args'),
> +                       variant=m.group('variant'))
>  
>  
>  def snake_to_camel(func_name: str) -> str:
> @@ -97,6 +104,51 @@ def snake_to_camel(func_name: str) -> str:
>      return ''.join(words)
>  
>  
> +# Checks if we are already in coroutine
> +def create_g_c_w(func: FuncDecl) -> str:
> +    name = func.co_name
> +    struct_name = func.struct_name
> +    return f"""\
> +int {func.name}({ func.gen_list('{decl}') })
> +{{
> +    if (qemu_in_coroutine()) {{
> +        return {name}({ func.gen_list('{name}') });
> +    }} else {{
> +        {struct_name} s = {{
> +            .poll_state.bs = {func.bs},
> +            .poll_state.in_progress = true,
> +
> +{ func.gen_block('            .{name} = {name},') }
> +        }};
> +
> +        s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
> +
> +        return bdrv_poll_co(&s.poll_state);
> +    }}
> +}}"""
> +
> +
> +# Assumes we are not in coroutine, and creates one
> +def create_coroutine_only(func: FuncDecl) -> str:
> +    name = func.co_name
> +    struct_name = func.struct_name
> +    return f"""\
> +int {func.name}({ func.gen_list('{decl}') })
> +{{
> +    assert(!qemu_in_coroutine());
> +    {struct_name} s = {{
> +        .poll_state.bs = {func.bs},
> +        .poll_state.in_progress = true,
> +
> +{ func.gen_block('        .{name} = {name},') }
> +    }};

Not sure how strict we are about this in generated code, but generally
the QEMU coding style requires declarations to come first, so the
assertion should be below it.

> +
> +    s.poll_state.co = qemu_coroutine_create({name}_entry, &s);
> +
> +    return bdrv_poll_co(&s.poll_state);
> +}}"""

Kevin


