Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDE56390C0
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 21:34:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyfNz-0004dz-Uq; Fri, 25 Nov 2022 15:33:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfNs-0004d6-33; Fri, 25 Nov 2022 15:33:16 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oyfNp-0001Aw-4M; Fri, 25 Nov 2022 15:33:15 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 463DE5FF14;
 Fri, 25 Nov 2022 23:32:59 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id vWT5m30NhKo1-i2nc57zj; Fri, 25 Nov 2022 23:32:58 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669408378; bh=BXZwi1erYJd2qIZuSOmcrTARm6Djeq/d+xpWexo8eV0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=1Io5nDgCx4B8FpzIHFUsbBLkL7tSQwv9u9wDB7MHKsK9pClnssBjG7/sI5vbA8Fry
 GW3vwyafwQtxObLAMgqbhCBgxt+CnYQEbkjcurVVThA/bZ9+ws5VUqKhn3F3/cpyau
 8DlLISg6s5mJG+w0tG3a9tsEyMZBNaHUgGz8pEms=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <37c3385a-719d-053c-66f0-c4a923048b77@yandex-team.ru>
Date: Fri, 25 Nov 2022 23:32:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 10/14] block-coroutine-wrapper.py: introduce co_wrapper
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Stefan Weil <sw@weilnetz.de>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20221125133518.418328-1-eesposit@redhat.com>
 <20221125133518.418328-11-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125133518.418328-11-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/25/22 16:35, Emanuele Giuseppe Esposito wrote:
> This new annotation creates just a function wrapper that creates
> a new coroutine.

Actually, not just create, but create, start and wait for finish.. Maybe s/creates/starts/

> It assumes the caller is not a coroutine.
> It will be the default annotation to be used in the future.
> 
> This is much better as c_w_mixed, because it is clear if the caller
> is a coroutine or not, and provides the advantage of automating
> the code creation. In the future all c_w_mixed functions will be
> substituted by co_wrapper.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
> ---

[..]

>   
>   class FuncDecl:
> -    def __init__(self, return_type: str, name: str, args: str) -> None:
> +    def __init__(self, return_type: str, name: str, args: str,
> +                 variant: str) -> None:

I'd prefer mixed: bool parameter instead, to be more strict.

>           self.return_type = return_type.strip()
>           self.name = name.strip()
> +        self.struct_name = snake_to_camel(self.name)
>           self.args = [ParamDecl(arg.strip()) for arg in args.split(',')]
> +        self.create_only_co = True
> +
> +        if 'mixed' in variant:
> +            self.create_only_co = False

hmm, just

   self.create_only_co = 'mixed' not in variant

? And even better with boolean argument.

> +
> +        subsystem, subname = self.name.split('_', 1)
> +        self.co_name = f'{subsystem}_co_{subname}'
> +
> +        t = self.args[0].type
> +        if t == 'BlockDriverState *':
> +            bs = 'bs'
> +        elif t == 'BdrvChild *':
> +            bs = 'child->bs'
> +        else:
> +            bs = 'blk_bs(blk)'
> +        self.bs = bs
>   
>       def gen_list(self, format: str) -> str:
>           return ', '.join(format.format_map(arg.__dict__) for arg in self.args)
> @@ -74,8 +92,9 @@ def gen_block(self, format: str) -> str:
>           return '\n'.join(format.format_map(arg.__dict__) for arg in self.args)
>   
>   
> -# Match wrappers declared with a co_wrapper_mixed mark
> -func_decl_re = re.compile(r'^int\s*co_wrapper_mixed\s*'
> +# Match wrappers declared with a co_wrapper mark
> +func_decl_re = re.compile(r'^int\s*co_wrapper'
> +                          r'(?P<variant>(_[a-z][a-z0-9_]*)?)\s*'

Why you allow everything here?
I'd write just
  
   (?P<mixed>(_mixed)?)

or

   (?P<marker>co_wrapper(_mixed)?)

>                             r'(?P<wrapper_name>[a-z][a-z0-9_]*)'
>                             r'\((?P<args>[^)]*)\);$', re.MULTILINE)
>   
> @@ -84,7 +103,8 @@ def func_decl_iter(text: str) -> Iterator:
>       for m in func_decl_re.finditer(text):
>           yield FuncDecl(return_type='int',
>                          name=m.group('wrapper_name'),
> -                       args=m.group('args'))
> +                       args=m.group('args'),
> +                       variant=m.group('variant'))
>   
>   
>   def snake_to_camel(func_name: str) -> str:
> @@ -97,24 +117,63 @@ def snake_to_camel(func_name: str) -> str:
>       return ''.join(words)
>   
>   
> +# Checks if we are already in coroutine

Please, do function documentation in doc-sting

> +def create_g_c_w(func: FuncDecl) -> str:

maybe, create_mixed_wrapper?

g_c_w refer to "generated_co_wrapper" and it was dropped from everywhere already

> +    name = func.co_name
> +    struct_name = func.struct_name
> +    return f"""\

[..]

> +
> +# Assumes we are not in coroutine, and creates one

move to doc-string

> +def create_coroutine_only(func: FuncDecl) -> str:

maybe, create_co_wrapper ?

Also, in the file functions that generate code are called gen_*,

so better gen_co_wrapper() and gen_co_wrapper_mixed()


> +    name = func.co_name
> +    struct_name = func.struct_name
> +    return f"""\
> +int {func.name}({ func.gen_list('{decl}') })
> +{{

[..]

>   
>   def gen_wrappers(input_code: str) -> str:


With at least comments for new functions turned into doc-strings:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


