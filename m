Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F099942FB31
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:43:06 +0200 (CEST)
Received: from localhost ([::1]:35796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSAc-0005AY-3e
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS8W-0003ip-U5
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:40:56 -0400
Received: from mail-ua1-x92a.google.com ([2607:f8b0:4864:20::92a]:46726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS8U-0002q7-IQ
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:40:56 -0400
Received: by mail-ua1-x92a.google.com with SMTP id u5so19780257uao.13
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AqYkdYG6Z5CqThIkvHeoK4AnCr/19FZCaxpPcBjqy40=;
 b=FumPBqASgkzULQ1vW89KqWquh+QT6Z8nqxTciov9biMBmO4qaXcin8IfOD99Mvv25t
 tZTiQL3yYzmgcpo1Dj8GW0+gvKFF1PQl6vo61WIu28dSkjTZFmzycKqEVKKAI2lflT5P
 D0AZ7hcsd8PIEYVOxCaYlKi1Y2pfYi1a8kh57WTs0GsnlC4tjMt38kXTDqpZgufl9EXO
 2F4bkEmis/6QnvLzj7Z8xW5SOo/1Hed7hWNkRRZQH18lHBFMrmsjOFmS3sZr0XSM7vBI
 SEXkRGxI0nLaXsvW4eFv9lv2JjCGfqmb/gV3LE6K1VPmw/+1pPCvCMf0udgQKLWWPkx3
 3Sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AqYkdYG6Z5CqThIkvHeoK4AnCr/19FZCaxpPcBjqy40=;
 b=ZJXZuESNEgz1l4euqYAtER6yrJqXuN0NNcshVvLt3A1alZZ0EerOn1SBsx8LieJIYv
 FIGX8+rH6HggOBMBfU3TS/tDLtLGYrtGw2+s/hXfaVF+Wl7MsX4klkFs4h3EDpp642oV
 NlHzjlCWAatf75B6wQuKqh/+eOM1Gx8EKw2rrSd+/gakvLqeOOdkVZIiILnl0Y6DaNrk
 wKjxdT7lY3GOzhdwzBB7K/zkq9warbTPqdijxjJAP1a16CIUev8Z9erqxra9Htmx3yVL
 75fbKA49bAz+ht+xCws/WObqxI8XmbI/2OMxKx1D4GZnJ+1W1FwxCr7E2m27s6AdWzX5
 csjg==
X-Gm-Message-State: AOAM531BmiAqt9hV5iGerAIflUSUQReo5q2xf2nL4hAABjLT7n8/4QVV
 yR3GHzJBztk++2WBovLSIbLb4NrlNGfgzPZCxbXwRg==
X-Google-Smtp-Source: ABdhPJx+XTSjJzLFK81L/nyAMsaE+m4V9taEp+zsit0rVF408tU6FUw82wyq74OOCVAPAbGk+ADPv5W3bEr7Zu4udYk=
X-Received: by 2002:ab0:6c56:: with SMTP id q22mr15317720uas.39.1634323253550; 
 Fri, 15 Oct 2021 11:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-31-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-31-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:40:42 -0600
Message-ID: <CANCZdfpQeG9GqoD2YJfg59+nuwqYQd+HYk9m2P6oPwnCbW+E=w@mail.gmail.com>
Subject: Re: [PATCH v5 30/67] target/mips: Make mips_cpu_tlb_fill sysemu only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000f9f08405ce6888fd"
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f9f08405ce6888fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> The fallback code in cpu_loop_exit_sigsegv is sufficient
> for mips linux-user.
>
> This means we can remove tcg/user/tlb_helper.c entirely.
> Remove the code from cpu_loop that raised SIGSEGV.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/tcg-internal.h    |  7 ++--
>  linux-user/mips/cpu_loop.c        | 11 ------
>  target/mips/cpu.c                 |  2 +-
>  target/mips/tcg/user/tlb_helper.c | 59 -------------------------------
>  target/mips/tcg/meson.build       |  3 --
>  target/mips/tcg/user/meson.build  |  3 --
>  6 files changed, 5 insertions(+), 80 deletions(-)
>  delete mode 100644 target/mips/tcg/user/tlb_helper.c
>  delete mode 100644 target/mips/tcg/user/meson.build
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

We do have mips support in bsd-user fork, but it's unclear how long we'll
continue
that support, though. This seems like it won't present a big problem for us
should
we continue that support, though (at least for FreeBSD). The usual
$(OTHER)BSD
caveats apply.

Warner


> diff --git a/target/mips/tcg/tcg-internal.h
> b/target/mips/tcg/tcg-internal.h
> index bad3deb611..466768aec4 100644
> --- a/target/mips/tcg/tcg-internal.h
> +++ b/target/mips/tcg/tcg-internal.h
> @@ -18,9 +18,6 @@
>  void mips_tcg_init(void);
>
>  void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock
> *tb);
> -bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                       MMUAccessType access_type, int mmu_idx,
> -                       bool probe, uintptr_t retaddr);
>  void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                    MMUAccessType access_type, int mmu_idx=
,
>                                    uintptr_t retaddr) QEMU_NORETURN;
> @@ -60,6 +57,10 @@ void mips_cpu_do_transaction_failed(CPUState *cs,
> hwaddr physaddr,
>                                      MemTxResult response, uintptr_t
> retaddr);
>  void cpu_mips_tlb_flush(CPUMIPSState *env);
>
> +bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> +                       MMUAccessType access_type, int mmu_idx,
> +                       bool probe, uintptr_t retaddr);
> +
>  #endif /* !CONFIG_USER_ONLY */
>
>  #endif
> diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
> index cb03fb066b..b735c99a24 100644
> --- a/linux-user/mips/cpu_loop.c
> +++ b/linux-user/mips/cpu_loop.c
> @@ -158,17 +158,6 @@ done_syscall:
>              }
>              env->active_tc.gpr[2] =3D ret;
>              break;
> -        case EXCP_TLBL:
> -        case EXCP_TLBS:
> -        case EXCP_AdEL:
> -        case EXCP_AdES:
> -            info.si_signo =3D TARGET_SIGSEGV;
> -            info.si_errno =3D 0;
> -            /* XXX: check env->error_code */
> -            info.si_code =3D TARGET_SEGV_MAPERR;
> -            info._sifields._sigfault._addr =3D env->CP0_BadVAddr;
> -            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
> -            break;
>          case EXCP_CpU:
>          case EXCP_RI:
>              info.si_signo =3D TARGET_SIGILL;
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 00e0c55d0e..4aae23934b 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -539,9 +539,9 @@ static const struct SysemuCPUOps mips_sysemu_ops =3D =
{
>  static const struct TCGCPUOps mips_tcg_ops =3D {
>      .initialize =3D mips_tcg_init,
>      .synchronize_from_tb =3D mips_cpu_synchronize_from_tb,
> -    .tlb_fill =3D mips_cpu_tlb_fill,
>
>  #if !defined(CONFIG_USER_ONLY)
> +    .tlb_fill =3D mips_cpu_tlb_fill,
>      .cpu_exec_interrupt =3D mips_cpu_exec_interrupt,
>      .do_interrupt =3D mips_cpu_do_interrupt,
>      .do_transaction_failed =3D mips_cpu_do_transaction_failed,
> diff --git a/target/mips/tcg/user/tlb_helper.c
> b/target/mips/tcg/user/tlb_helper.c
> deleted file mode 100644
> index 210c6d529e..0000000000
> --- a/target/mips/tcg/user/tlb_helper.c
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -/*
> - * MIPS TLB (Translation lookaside buffer) helpers.
> - *
> - *  Copyright (c) 2004-2005 Jocelyn Mayer
> - *
> - * This library is free software; you can redistribute it and/or
> - * modify it under the terms of the GNU Lesser General Public
> - * License as published by the Free Software Foundation; either
> - * version 2.1 of the License, or (at your option) any later version.
> - *
> - * This library is distributed in the hope that it will be useful,
> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> - * Lesser General Public License for more details.
> - *
> - * You should have received a copy of the GNU Lesser General Public
> - * License along with this library; if not, see <
> http://www.gnu.org/licenses/>.
> - */
> -#include "qemu/osdep.h"
> -
> -#include "cpu.h"
> -#include "exec/exec-all.h"
> -#include "internal.h"
> -
> -static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,
> -                                MMUAccessType access_type)
> -{
> -    CPUState *cs =3D env_cpu(env);
> -
> -    env->error_code =3D 0;
> -    if (access_type =3D=3D MMU_INST_FETCH) {
> -        env->error_code |=3D EXCP_INST_NOTAVAIL;
> -    }
> -
> -    /* Reference to kernel address from user mode or supervisor mode */
> -    /* Reference to supervisor address from user mode */
> -    if (access_type =3D=3D MMU_DATA_STORE) {
> -        cs->exception_index =3D EXCP_AdES;
> -    } else {
> -        cs->exception_index =3D EXCP_AdEL;
> -    }
> -
> -    /* Raise exception */
> -    if (!(env->hflags & MIPS_HFLAG_DM)) {
> -        env->CP0_BadVAddr =3D address;
> -    }
> -}
> -
> -bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
> -                       MMUAccessType access_type, int mmu_idx,
> -                       bool probe, uintptr_t retaddr)
> -{
> -    MIPSCPU *cpu =3D MIPS_CPU(cs);
> -    CPUMIPSState *env =3D &cpu->env;
> -
> -    /* data access */
> -    raise_mmu_exception(env, address, access_type);
> -    do_raise_exception_err(env, cs->exception_index, env->error_code,
> retaddr);
> -}
> diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build
> index 8f6f7508b6..98003779ae 100644
> --- a/target/mips/tcg/meson.build
> +++ b/target/mips/tcg/meson.build
> @@ -28,9 +28,6 @@ mips_ss.add(when: 'TARGET_MIPS64', if_true: files(
>    'mxu_translate.c',
>  ))
>
> -if have_user
> -  subdir('user')
> -endif
>  if have_system
>    subdir('sysemu')
>  endif
> diff --git a/target/mips/tcg/user/meson.build
> b/target/mips/tcg/user/meson.build
> deleted file mode 100644
> index 79badcd321..0000000000
> --- a/target/mips/tcg/user/meson.build
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -mips_user_ss.add(files(
> -  'tlb_helper.c',
> -))
> --
> 2.25.1
>
>

--000000000000f9f08405ce6888fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">The fallback code in cpu_loop_exit_sigsegv is sufficient=
<br>
for mips linux-user.<br>
<br>
This means we can remove tcg/user/tlb_helper.c entirely.<br>
Remove the code from cpu_loop that raised SIGSEGV.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/mips/tcg/tcg-internal.h=C2=A0 =C2=A0 |=C2=A0 7 ++--<br>
=C2=A0linux-user/mips/cpu_loop.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 11 ------<br>
=C2=A0target/mips/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0target/mips/tcg/user/tlb_helper.c | 59 ------------------------------=
-<br>
=C2=A0target/mips/tcg/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 --<br=
>
=C2=A0target/mips/tcg/user/meson.build=C2=A0 |=C2=A0 3 --<br>
=C2=A06 files changed, 5 insertions(+), 80 deletions(-)<br>
=C2=A0delete mode 100644 target/mips/tcg/user/tlb_helper.c<br>
=C2=A0delete mode 100644 target/mips/tcg/user/meson.build<br></blockquote><=
div><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchang=
e-newline"></div><div>We do have mips support in bsd-user fork, but it&#39;=
s unclear how long we&#39;ll continue</div><div>that support, though. This =
seems like it won&#39;t present a big problem for us should</div><div>we co=
ntinue that support, though (at least for FreeBSD). The usual $(OTHER)BSD</=
div><div>caveats apply.</div><div><br></div><div>Warner</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.=
h<br>
index bad3deb611..466768aec4 100644<br>
--- a/target/mips/tcg/tcg-internal.h<br>
+++ b/target/mips/tcg/tcg-internal.h<br>
@@ -18,9 +18,6 @@<br>
=C2=A0void mips_tcg_init(void);<br>
<br>
=C2=A0void mips_cpu_synchronize_from_tb(CPUState *cs, const TranslationBloc=
k *tb);<br>
-bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
=C2=A0void mips_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MMUAccessType access_ty=
pe, int mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uintptr_t retaddr) QEMU=
_NORETURN;<br>
@@ -60,6 +57,10 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr=
 physaddr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemTxResult resp=
onse, uintptr_t retaddr);<br>
=C2=A0void cpu_mips_tlb_flush(CPUMIPSState *env);<br>
<br>
+bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr);<br>
+<br>
=C2=A0#endif /* !CONFIG_USER_ONLY */<br>
<br>
=C2=A0#endif<br>
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c<br>
index cb03fb066b..b735c99a24 100644<br>
--- a/linux-user/mips/cpu_loop.c<br>
+++ b/linux-user/mips/cpu_loop.c<br>
@@ -158,17 +158,6 @@ done_syscall:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env-&gt;active_tc.gpr[2] =
=3D ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_TLBL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_TLBS:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_AdEL:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case EXCP_AdES:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_signo =3D TARGET_SIGSEGV=
;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_errno =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX: check env-&gt;error_code=
 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info.si_code =3D TARGET_SEGV_MAP=
ERR;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info._sifields._sigfault._addr =
=3D env-&gt;CP0_BadVAddr;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 queue_signal(env, info.si_signo,=
 QEMU_SI_FAULT, &amp;info);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_CpU:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case EXCP_RI:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info.si_signo =3D TARGET_SI=
GILL;<br>
diff --git a/target/mips/cpu.c b/target/mips/cpu.c<br>
index 00e0c55d0e..4aae23934b 100644<br>
--- a/target/mips/cpu.c<br>
+++ b/target/mips/cpu.c<br>
@@ -539,9 +539,9 @@ static const struct SysemuCPUOps mips_sysemu_ops =3D {<=
br>
=C2=A0static const struct TCGCPUOps mips_tcg_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.initialize =3D mips_tcg_init,<br>
=C2=A0 =C2=A0 =C2=A0.synchronize_from_tb =3D mips_cpu_synchronize_from_tb,<=
br>
-=C2=A0 =C2=A0 .tlb_fill =3D mips_cpu_tlb_fill,<br>
<br>
=C2=A0#if !defined(CONFIG_USER_ONLY)<br>
+=C2=A0 =C2=A0 .tlb_fill =3D mips_cpu_tlb_fill,<br>
=C2=A0 =C2=A0 =C2=A0.cpu_exec_interrupt =3D mips_cpu_exec_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_interrupt =3D mips_cpu_do_interrupt,<br>
=C2=A0 =C2=A0 =C2=A0.do_transaction_failed =3D mips_cpu_do_transaction_fail=
ed,<br>
diff --git a/target/mips/tcg/user/tlb_helper.c b/target/mips/tcg/user/tlb_h=
elper.c<br>
deleted file mode 100644<br>
index 210c6d529e..0000000000<br>
--- a/target/mips/tcg/user/tlb_helper.c<br>
+++ /dev/null<br>
@@ -1,59 +0,0 @@<br>
-/*<br>
- * MIPS TLB (Translation lookaside buffer) helpers.<br>
- *<br>
- *=C2=A0 Copyright (c) 2004-2005 Jocelyn Mayer<br>
- *<br>
- * This library is free software; you can redistribute it and/or<br>
- * modify it under the terms of the GNU Lesser General Public<br>
- * License as published by the Free Software Foundation; either<br>
- * version 2.1 of the License, or (at your option) any later version.<br>
- *<br>
- * This library is distributed in the hope that it will be useful,<br>
- * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<=
br>
- * Lesser General Public License for more details.<br>
- *<br>
- * You should have received a copy of the GNU Lesser General Public<br>
- * License along with this library; if not, see &lt;<a href=3D"http://www.=
gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/=
licenses/</a>&gt;.<br>
- */<br>
-#include &quot;qemu/osdep.h&quot;<br>
-<br>
-#include &quot;cpu.h&quot;<br>
-#include &quot;exec/exec-all.h&quot;<br>
-#include &quot;internal.h&quot;<br>
-<br>
-static void raise_mmu_exception(CPUMIPSState *env, target_ulong address,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MMUAccessType access_type)<br>
-{<br>
-=C2=A0 =C2=A0 CPUState *cs =3D env_cpu(env);<br>
-<br>
-=C2=A0 =C2=A0 env-&gt;error_code =3D 0;<br>
-=C2=A0 =C2=A0 if (access_type =3D=3D MMU_INST_FETCH) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;error_code |=3D EXCP_INST_NOTAVAIL;<br=
>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Reference to kernel address from user mode or supervisor =
mode */<br>
-=C2=A0 =C2=A0 /* Reference to supervisor address from user mode */<br>
-=C2=A0 =C2=A0 if (access_type =3D=3D MMU_DATA_STORE) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_AdES;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D EXCP_AdEL;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 /* Raise exception */<br>
-=C2=A0 =C2=A0 if (!(env-&gt;hflags &amp; MIPS_HFLAG_DM)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;CP0_BadVAddr =3D address;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-bool mips_cpu_tlb_fill(CPUState *cs, vaddr address, int size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0MMUAccessType access_type, int mmu_idx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool probe, uintptr_t retaddr)<br>
-{<br>
-=C2=A0 =C2=A0 MIPSCPU *cpu =3D MIPS_CPU(cs);<br>
-=C2=A0 =C2=A0 CPUMIPSState *env =3D &amp;cpu-&gt;env;<br>
-<br>
-=C2=A0 =C2=A0 /* data access */<br>
-=C2=A0 =C2=A0 raise_mmu_exception(env, address, access_type);<br>
-=C2=A0 =C2=A0 do_raise_exception_err(env, cs-&gt;exception_index, env-&gt;=
error_code, retaddr);<br>
-}<br>
diff --git a/target/mips/tcg/meson.build b/target/mips/tcg/meson.build<br>
index 8f6f7508b6..98003779ae 100644<br>
--- a/target/mips/tcg/meson.build<br>
+++ b/target/mips/tcg/meson.build<br>
@@ -28,9 +28,6 @@ mips_ss.add(when: &#39;TARGET_MIPS64&#39;, if_true: files=
(<br>
=C2=A0 =C2=A0&#39;mxu_translate.c&#39;,<br>
=C2=A0))<br>
<br>
-if have_user<br>
-=C2=A0 subdir(&#39;user&#39;)<br>
-endif<br>
=C2=A0if have_system<br>
=C2=A0 =C2=A0subdir(&#39;sysemu&#39;)<br>
=C2=A0endif<br>
diff --git a/target/mips/tcg/user/meson.build b/target/mips/tcg/user/meson.=
build<br>
deleted file mode 100644<br>
index 79badcd321..0000000000<br>
--- a/target/mips/tcg/user/meson.build<br>
+++ /dev/null<br>
@@ -1,3 +0,0 @@<br>
-mips_user_ss.add(files(<br>
-=C2=A0 &#39;tlb_helper.c&#39;,<br>
-))<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000f9f08405ce6888fd--

