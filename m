Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFF369043
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 12:23:55 +0200 (CEST)
Received: from localhost ([::1]:56708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZsyY-0001vL-MZ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 06:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZsxc-0001N1-2d
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:22:56 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:44673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lZsxa-00070Z-2J
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 06:22:55 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so920486wmf.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 03:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=0s1e6nEGlsf4wHVdX65ma7qBVQPJyFOm4YwGQKQ7UfI=;
 b=Xb0RlACy3uBAHsljvohl9zgDt6yerslRdIYZqcY9T/ah8KESgereBN7dnJLS5jjXiP
 /gCunj1ChJvRKAkqmeoDxGo53iDRC56rL1WRDlKJlkFr2jRx9u0/jOyzzVCtI2j3eHOX
 EX8tUmZ14/zXRJEBjnIzN4rBuTyShNV+AxkER4P+Dv1Whg+qBsHlpjRFz7x5QCTIL+aN
 RmCqyS+5ki4Q/xCH3m3MYmfryhDRXTNJqetfwb4deKcXH6GCfBnKTNVIxD3mR64eilVv
 zTHJdM9R9RitL1Fkl5DVhYVp3zBLMri9Am5RIxZB6uXwXtK9KU4To8yWq2yXPgpqSHvy
 qb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=0s1e6nEGlsf4wHVdX65ma7qBVQPJyFOm4YwGQKQ7UfI=;
 b=IeqconjXBiXKLAQz/lbXoTags0rtK7S5dMXU7XUMTm740TZIijCkHDDkOLBhYIL51/
 r2QGYollhP3H4lNovc+R2xN8SH9QtI6GQlw0aUiWINt0x5+Zyr9Oe2/edVKfq9BXfZtd
 l85Um28ySlgSULiHVaoU6ZS0NMCfnYi2xdkfROgQrMVeGIdAff59g6zlclE54Lb9bUOj
 f57o+ZS+IHYNCTLFoxlClTp3PCf6hj5ONkGmq37tfMHzBUcn5ajIDRN324p0i9gucMHp
 3gGiFyex0pBQ29vHtyUi2jeBb0WY0+SR1snCRjXEx90ovtjkULKSU9sWfs4m1/Ro+eG7
 ruTA==
X-Gm-Message-State: AOAM533AnBqRY/tSsG6C7n+nWGnwxRn1eO5biajCY1Wq0wQKc5n2PVIJ
 0ZM0XQDRVPbS8aUkz3TEFVfV2Q==
X-Google-Smtp-Source: ABdhPJzIE+I2EAMKov2d8KfmIgeOqgaVO9IiYsUazBbPs0lFHS/4jv1FPMLjsAlLsE4BavnwWami3Q==
X-Received: by 2002:a05:600c:410b:: with SMTP id
 j11mr3507460wmi.82.1619173372404; 
 Fri, 23 Apr 2021 03:22:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm8592688wrx.22.2021.04.23.03.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 03:22:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 03AB61FF7E;
 Fri, 23 Apr 2021 11:22:51 +0100 (BST)
References: <20210422230227.314751-1-richard.henderson@linaro.org>
 <20210422230227.314751-3-richard.henderson@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 2/7] linux-user/alpha: Rename the sigaction restorer
 field
Date: Fri, 23 Apr 2021 11:16:15 +0100
In-reply-to: <20210422230227.314751-3-richard.henderson@linaro.org>
Message-ID: <87wnst711h.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use ka_restorer, in line with TARGET_ARCH_HAS_KA_RESTORER
> vs TARGET_ARCH_HAS_SA_RESTORER, since Alpha passes this
> field as a syscall argument.

I'm still slightly confused - but that's to be expected from signals :-/

Anyway I understand that the SA_RESTORER points to the vdso trampoline
(at least according to man sigreturn). What is ka_restorer - if this the
in sigframe restorer?

>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/syscall_defs.h | 2 +-
>  linux-user/alpha/signal.c | 8 ++++----
>  linux-user/syscall.c      | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index 25be414727..693d4f3788 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -519,7 +519,7 @@ struct target_sigaction {
>      abi_ulong _sa_handler;
>      abi_ulong sa_flags;
>      target_sigset_t sa_mask;
> -    abi_ulong sa_restorer;
> +    abi_ulong ka_restorer;
>  };

Maybe this is something we could expand a little on in the difference
between the two here (or maybe in the later commit?).


>  #elif defined(TARGET_MIPS)
>  struct target_sigaction {
> diff --git a/linux-user/alpha/signal.c b/linux-user/alpha/signal.c
> index 86f5d2276d..3aa4b339a4 100644
> --- a/linux-user/alpha/signal.c
> +++ b/linux-user/alpha/signal.c
> @@ -138,8 +138,8 @@ void setup_frame(int sig, struct target_sigaction *ka,
>=20=20
>      setup_sigcontext(&frame->sc, env, frame_addr, set);
>=20=20
> -    if (ka->sa_restorer) {
> -        r26 =3D ka->sa_restorer;
> +    if (ka->ka_restorer) {
> +        r26 =3D ka->ka_restorer;
>      } else {
>          __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
>          __put_user(INSN_LDI_R0 + TARGET_NR_sigreturn,
> @@ -192,8 +192,8 @@ void setup_rt_frame(int sig, struct target_sigaction =
*ka,
>          __put_user(set->sig[i], &frame->uc.tuc_sigmask.sig[i]);
>      }
>=20=20
> -    if (ka->sa_restorer) {
> -        r26 =3D ka->sa_restorer;
> +    if (ka->ka_restorer) {
> +        r26 =3D ka->ka_restorer;
>      } else {
>          __put_user(INSN_MOV_R30_R16, &frame->retcode[0]);
>          __put_user(INSN_LDI_R0 + TARGET_NR_rt_sigreturn,
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 95d79ddc43..ee21eb5e6f 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8989,7 +8989,7 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,
>                  act._sa_handler =3D old_act->_sa_handler;
>                  target_siginitset(&act.sa_mask, old_act->sa_mask);
>                  act.sa_flags =3D old_act->sa_flags;
> -                act.sa_restorer =3D 0;
> +                act.ka_restorer =3D 0;
>                  unlock_user_struct(old_act, arg2, 0);
>                  pact =3D &act;
>              }
> @@ -9085,7 +9085,7 @@ static abi_long do_syscall1(void *cpu_env, int num,=
 abi_long arg1,
>                  act._sa_handler =3D rt_act->_sa_handler;
>                  act.sa_mask =3D rt_act->sa_mask;
>                  act.sa_flags =3D rt_act->sa_flags;
> -                act.sa_restorer =3D arg5;
> +                act.ka_restorer =3D arg5;
>                  unlock_user_struct(rt_act, arg2, 0);
>                  pact =3D &act;
>              }

Otherwise looks fine to me:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

