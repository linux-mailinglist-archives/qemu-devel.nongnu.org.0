Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F28B0454AF3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:29:34 +0100 (CET)
Received: from localhost ([::1]:43270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNoU-0002Dx-2F
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNjo-0006Ax-VL
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:24:44 -0500
Received: from [2607:f8b0:4864:20::a36] (port=44710
 helo=mail-vk1-xa36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNjk-0006W4-KP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:24:44 -0500
Received: by mail-vk1-xa36.google.com with SMTP id u68so1962785vke.11
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EKkWCNHyCx6MRQ7T5ayU30iuQsBXYbs11ad8f7Zz9Pk=;
 b=mZ/+FJU5xt/Zs5AUivHMnQkExQC8BHY0bMcn3ZX2Djo5ywbbsNP8NJC6wmsInuEqHv
 +Qk2sb5DalukJD/RVZebxWqLPHeVWTrOp5zwl6e4Ea834al8V4Svd4qU7X2/FPP2ug8S
 rffAbQZ3zHUmU4HszmlsFulU/U3nwhSxiAQtsw9jbHxw4fnObfeAajLCrhJLWsnKN+62
 Z1/ElD/6pPMaNB71dfZwaOpdwCGX58cO0gvQBvDLeRRpQko740KAIe1xFDk0qjwQNxR+
 Xk4JnYJOmTFZqbN20mi9ZEyL2B+vJrOPQpIRY6h0tHKxsBOuh19NQMrAgJ3zETEAICPR
 tl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EKkWCNHyCx6MRQ7T5ayU30iuQsBXYbs11ad8f7Zz9Pk=;
 b=kqgN5N0LfjD9SJDLwAhPpcLnjpNo7uecVaGS8LcfVOzNvlBQslZemMUKoAVkQG5jbx
 Qxn14l5N0BPLU+0wfSchw4wjEZmOH82cgIj38DJzcjd1FGD/QXLlvVv6xbLrrr2iVQQZ
 PErpU1dYTE2BE0KDO2+US7Z+XeDjg3nhrX1gwFsBZeM8ixluVg+OdvjiWvtckVCoRNtu
 MGebcyZe13EOk5xI5BLSexfUyIcTxY9WDgwIN28mHIp6V97EeFYAk6NPOBrQuhy+iFdg
 isU4+5pIGsHPZ4Wweguv7Vr3J3V9bNfdONumvFLx+iV8TaHwatZ2vM3iFdsEhOjFMJuw
 TCKQ==
X-Gm-Message-State: AOAM530mjmcLYbJQtZPNLouwPtta6VgKJOxI13VVWEoV4qosBzXYUT7e
 yRY1T2NuesyvBY2/nlSFFOo3rPTnScaQWCuOC9FE9w==
X-Google-Smtp-Source: ABdhPJzjg/4MTqsx9Xer5ZjzKVTvVWV7xZ5VrLdSmIj19Cmckv89as5iiwXGgMAeTRJigs85qkZyZjwvNdFeW/AqjAY=
X-Received: by 2002:a05:6122:2090:: with SMTP id
 i16mr91457385vkd.18.1637166276370; 
 Wed, 17 Nov 2021 08:24:36 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-3-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-3-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:24:26 -0700
Message-ID: <CANCZdfrDezCdADAL-0pbNzbAbK3AXyJ6KM0-oDzXiXtRhVtMSg@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005799f405d0fe7a5b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a36;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005799f405d0fe7a5b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> All instances of rewind_if_in_safe_syscall are the same, differing only
> in how the instruction point is fetched from the ucontext and the size
> of the registers. Use host_signal_pc and new host_signal_set_pc
> interfaces to fetch the pointer to the PC and adjust if needed. Delete
> all the old copies of rewind_if_in_safe_syscall.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20211113045603.60391-3-imp@bsdimp.com>
> [rth: include safe-syscall.h, simplify ifdefs]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/aarch64/hostdep.h | 20 --------------------
>  linux-user/host/arm/hostdep.h     | 20 --------------------
>  linux-user/host/i386/hostdep.h    | 20 --------------------
>  linux-user/host/ppc64/hostdep.h   | 20 --------------------
>  linux-user/host/riscv/hostdep.h   | 20 --------------------
>  linux-user/host/s390x/hostdep.h   | 20 --------------------
>  linux-user/host/x86_64/hostdep.h  | 20 --------------------
>  linux-user/safe-syscall.h         |  3 +++
>  linux-user/signal.c               | 15 ++++++++++++---
>  9 files changed, 15 insertions(+), 143 deletions(-)
>


Reviewed by: Warner Losh <imp@bsdimp.com>

(this one I'm sure it's ok since things changed from my original
and the changes are good).


> diff --git a/linux-user/host/aarch64/hostdep.h
> b/linux-user/host/aarch64/hostdep.h
> index a8d41a21ad..39299d798a 100644
> --- a/linux-user/host/aarch64/hostdep.h
> +++ b/linux-user/host/aarch64/hostdep.h
> @@ -15,24 +15,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    __u64 *pcreg =3D &uc->uc_mcontext.pc;
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/host/arm/hostdep.h b/linux-user/host/arm/hostdep.=
h
> index 9276fe6ceb..86b137875a 100644
> --- a/linux-user/host/arm/hostdep.h
> +++ b/linux-user/host/arm/hostdep.h
> @@ -15,24 +15,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    unsigned long *pcreg =3D &uc->uc_mcontext.arm_pc;
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/host/i386/hostdep.h
> b/linux-user/host/i386/hostdep.h
> index 073be74d87..ce7136501f 100644
> --- a/linux-user/host/i386/hostdep.h
> +++ b/linux-user/host/i386/hostdep.h
> @@ -15,24 +15,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    greg_t *pcreg =3D &uc->uc_mcontext.gregs[REG_EIP];
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/host/ppc64/hostdep.h
> b/linux-user/host/ppc64/hostdep.h
> index 98979ad917..0c290dd904 100644
> --- a/linux-user/host/ppc64/hostdep.h
> +++ b/linux-user/host/ppc64/hostdep.h
> @@ -15,24 +15,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    unsigned long *pcreg =3D &uc->uc_mcontext.gp_regs[PT_NIP];
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/host/riscv/hostdep.h
> b/linux-user/host/riscv/hostdep.h
> index 2ba07456ae..7f67c22868 100644
> --- a/linux-user/host/riscv/hostdep.h
> +++ b/linux-user/host/riscv/hostdep.h
> @@ -11,24 +11,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    unsigned long *pcreg =3D &uc->uc_mcontext.__gregs[REG_PC];
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/host/s390x/hostdep.h
> b/linux-user/host/s390x/hostdep.h
> index 4f0171f36f..d801145854 100644
> --- a/linux-user/host/s390x/hostdep.h
> +++ b/linux-user/host/s390x/hostdep.h
> @@ -15,24 +15,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    unsigned long *pcreg =3D &uc->uc_mcontext.psw.addr;
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/host/x86_64/hostdep.h
> b/linux-user/host/x86_64/hostdep.h
> index a4fefb5114..9c62bd26bd 100644
> --- a/linux-user/host/x86_64/hostdep.h
> +++ b/linux-user/host/x86_64/hostdep.h
> @@ -15,24 +15,4 @@
>  /* We have a safe-syscall.inc.S */
>  #define HAVE_SAFE_SYSCALL
>
> -#ifndef __ASSEMBLER__
> -
> -/* These are defined by the safe-syscall.inc.S file */
> -extern char safe_syscall_start[];
> -extern char safe_syscall_end[];
> -
> -/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
> -static inline void rewind_if_in_safe_syscall(void *puc)
> -{
> -    ucontext_t *uc =3D puc;
> -    greg_t *pcreg =3D &uc->uc_mcontext.gregs[REG_RIP];
> -
> -    if (*pcreg > (uintptr_t)safe_syscall_start
> -        && *pcreg < (uintptr_t)safe_syscall_end) {
> -        *pcreg =3D (uintptr_t)safe_syscall_start;
> -    }
> -}
> -
> -#endif /* __ASSEMBLER__ */
> -
>  #endif
> diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h
> index 6bc0390262..aaa9ffc0e2 100644
> --- a/linux-user/safe-syscall.h
> +++ b/linux-user/safe-syscall.h
> @@ -127,6 +127,9 @@
>  #ifdef HAVE_SAFE_SYSCALL
>  /* The core part of this function is implemented in assembly */
>  extern long safe_syscall_base(int *pending, long number, ...);
> +/* These are defined by the safe-syscall.inc.S file */
> +extern char safe_syscall_start[];
> +extern char safe_syscall_end[];
>
>  #define safe_syscall(...)                                               =
\
>      ({                                                                  =
\
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 81c45bfce9..6d5e5b698c 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -31,6 +31,7 @@
>  #include "trace.h"
>  #include "signal-common.h"
>  #include "host-signal.h"
> +#include "safe-syscall.h"
>
>  static struct target_sigaction sigact_table[TARGET_NSIG];
>
> @@ -793,12 +794,20 @@ int queue_signal(CPUArchState *env, int sig, int
> si_type,
>      return 1; /* indicates that the signal was queued */
>  }
>
> -#ifndef HAVE_SAFE_SYSCALL
> +
> +/* Adjust the signal context to rewind out of safe-syscall if we're in i=
t
> */
>  static inline void rewind_if_in_safe_syscall(void *puc)
>  {
> -    /* Default version: never rewind */
> -}
> +#ifdef HAVE_SAFE_SYSCALL
> +    ucontext_t *uc =3D (ucontext_t *)puc;
> +    uintptr_t pcreg =3D host_signal_pc(uc);
> +
> +    if (pcreg > (uintptr_t)safe_syscall_start
> +        && pcreg < (uintptr_t)safe_syscall_end) {
> +        host_signal_set_pc(uc, (uintptr_t)safe_syscall_start);
> +    }
>  #endif
> +}
>
>  static void host_signal_handler(int host_sig, siginfo_t *info, void *puc=
)
>  {
> --
> 2.25.1
>
>

--0000000000005799f405d0fe7a5b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 9:04 AM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" t=
arget=3D"_blank">imp@bsdimp.com</a>&gt;<br>
<br>
All instances of rewind_if_in_safe_syscall are the same, differing only<br>
in how the instruction point is fetched from the ucontext and the size<br>
of the registers. Use host_signal_pc and new host_signal_set_pc<br>
interfaces to fetch the pointer to the PC and adjust if needed. Delete<br>
all the old copies of rewind_if_in_safe_syscall.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20211113045603.60391-3-imp@bsdimp.com" ta=
rget=3D"_blank">20211113045603.60391-3-imp@bsdimp.com</a>&gt;<br>
[rth: include safe-syscall.h, simplify ifdefs]<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/aarch64/hostdep.h | 20 --------------------<br>
=C2=A0linux-user/host/arm/hostdep.h=C2=A0 =C2=A0 =C2=A0| 20 ---------------=
-----<br>
=C2=A0linux-user/host/i386/hostdep.h=C2=A0 =C2=A0 | 20 --------------------=
<br>
=C2=A0linux-user/host/ppc64/hostdep.h=C2=A0 =C2=A0| 20 --------------------=
<br>
=C2=A0linux-user/host/riscv/hostdep.h=C2=A0 =C2=A0| 20 --------------------=
<br>
=C2=A0linux-user/host/s390x/hostdep.h=C2=A0 =C2=A0| 20 --------------------=
<br>
=C2=A0linux-user/host/x86_64/hostdep.h=C2=A0 | 20 --------------------<br>
=C2=A0linux-user/safe-syscall.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 =
+++<br>
=C2=A0linux-user/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 15 ++++++++++++---<br>
=C2=A09 files changed, 15 insertions(+), 143 deletions(-)<br></blockquote><=
div><br></div><div><br></div><div>Reviewed by: Warner Losh &lt;<a href=3D"m=
ailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>(this=
 one I&#39;m sure it&#39;s ok since things changed from my original</div><d=
iv>and the changes are good).</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/ho=
stdep.h<br>
index a8d41a21ad..39299d798a 100644<br>
--- a/linux-user/host/aarch64/hostdep.h<br>
+++ b/linux-user/host/aarch64/hostdep.h<br>
@@ -15,24 +15,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 __u64 *pcreg =3D &amp;uc-&gt;uc_mcontext.pc;<br>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/arm/hostdep.h b/linux-user/host/arm/hostdep.h<=
br>
index 9276fe6ceb..86b137875a 100644<br>
--- a/linux-user/host/arm/hostdep.h<br>
+++ b/linux-user/host/arm/hostdep.h<br>
@@ -15,24 +15,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long *pcreg =3D &amp;uc-&gt;uc_mcontext.arm_pc;<br>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/i386/hostdep.h b/linux-user/host/i386/hostdep.=
h<br>
index 073be74d87..ce7136501f 100644<br>
--- a/linux-user/host/i386/hostdep.h<br>
+++ b/linux-user/host/i386/hostdep.h<br>
@@ -15,24 +15,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 greg_t *pcreg =3D &amp;uc-&gt;uc_mcontext.gregs[REG_EIP];<br=
>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/ppc64/hostdep.h b/linux-user/host/ppc64/hostde=
p.h<br>
index 98979ad917..0c290dd904 100644<br>
--- a/linux-user/host/ppc64/hostdep.h<br>
+++ b/linux-user/host/ppc64/hostdep.h<br>
@@ -15,24 +15,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long *pcreg =3D &amp;uc-&gt;uc_mcontext.gp_regs[PT_=
NIP];<br>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/riscv/hostdep.h b/linux-user/host/riscv/hostde=
p.h<br>
index 2ba07456ae..7f67c22868 100644<br>
--- a/linux-user/host/riscv/hostdep.h<br>
+++ b/linux-user/host/riscv/hostdep.h<br>
@@ -11,24 +11,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long *pcreg =3D &amp;uc-&gt;uc_mcontext.__gregs[REG=
_PC];<br>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/s390x/hostdep.h b/linux-user/host/s390x/hostde=
p.h<br>
index 4f0171f36f..d801145854 100644<br>
--- a/linux-user/host/s390x/hostdep.h<br>
+++ b/linux-user/host/s390x/hostdep.h<br>
@@ -15,24 +15,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 unsigned long *pcreg =3D &amp;uc-&gt;uc_mcontext.psw.addr;<b=
r>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/x86_64/hostdep.h b/linux-user/host/x86_64/host=
dep.h<br>
index a4fefb5114..9c62bd26bd 100644<br>
--- a/linux-user/host/x86_64/hostdep.h<br>
+++ b/linux-user/host/x86_64/hostdep.h<br>
@@ -15,24 +15,4 @@<br>
=C2=A0/* We have a safe-syscall.inc.S */<br>
=C2=A0#define HAVE_SAFE_SYSCALL<br>
<br>
-#ifndef __ASSEMBLER__<br>
-<br>
-/* These are defined by the safe-syscall.inc.S file */<br>
-extern char safe_syscall_start[];<br>
-extern char safe_syscall_end[];<br>
-<br>
-/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
-static inline void rewind_if_in_safe_syscall(void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 greg_t *pcreg =3D &amp;uc-&gt;uc_mcontext.gregs[REG_RIP];<br=
>
-<br>
-=C2=A0 =C2=A0 if (*pcreg &gt; (uintptr_t)safe_syscall_start<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; *pcreg &lt; (uintptr_t)safe_syscall=
_end) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 *pcreg =3D (uintptr_t)safe_syscall_start;<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-#endif /* __ASSEMBLER__ */<br>
-<br>
=C2=A0#endif<br>
diff --git a/linux-user/safe-syscall.h b/linux-user/safe-syscall.h<br>
index 6bc0390262..aaa9ffc0e2 100644<br>
--- a/linux-user/safe-syscall.h<br>
+++ b/linux-user/safe-syscall.h<br>
@@ -127,6 +127,9 @@<br>
=C2=A0#ifdef HAVE_SAFE_SYSCALL<br>
=C2=A0/* The core part of this function is implemented in assembly */<br>
=C2=A0extern long safe_syscall_base(int *pending, long number, ...);<br>
+/* These are defined by the safe-syscall.inc.S file */<br>
+extern char safe_syscall_start[];<br>
+extern char safe_syscall_end[];<br>
<br>
=C2=A0#define safe_syscall(...)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0 =C2=A0 =C2=A0({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
diff --git a/linux-user/signal.c b/linux-user/signal.c<br>
index 81c45bfce9..6d5e5b698c 100644<br>
--- a/linux-user/signal.c<br>
+++ b/linux-user/signal.c<br>
@@ -31,6 +31,7 @@<br>
=C2=A0#include &quot;trace.h&quot;<br>
=C2=A0#include &quot;signal-common.h&quot;<br>
=C2=A0#include &quot;host-signal.h&quot;<br>
+#include &quot;safe-syscall.h&quot;<br>
<br>
=C2=A0static struct target_sigaction sigact_table[TARGET_NSIG];<br>
<br>
@@ -793,12 +794,20 @@ int queue_signal(CPUArchState *env, int sig, int si_t=
ype,<br>
=C2=A0 =C2=A0 =C2=A0return 1; /* indicates that the signal was queued */<br=
>
=C2=A0}<br>
<br>
-#ifndef HAVE_SAFE_SYSCALL<br>
+<br>
+/* Adjust the signal context to rewind out of safe-syscall if we&#39;re in=
 it */<br>
=C2=A0static inline void rewind_if_in_safe_syscall(void *puc)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 /* Default version: never rewind */<br>
-}<br>
+#ifdef HAVE_SAFE_SYSCALL<br>
+=C2=A0 =C2=A0 ucontext_t *uc =3D (ucontext_t *)puc;<br>
+=C2=A0 =C2=A0 uintptr_t pcreg =3D host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 if (pcreg &gt; (uintptr_t)safe_syscall_start<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; pcreg &lt; (uintptr_t)safe_syscall_=
end) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_signal_set_pc(uc, (uintptr_t)safe_syscall=
_start);<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0#endif<br>
+}<br>
<br>
=C2=A0static void host_signal_handler(int host_sig, siginfo_t *info, void *=
puc)<br>
=C2=A0{<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000005799f405d0fe7a5b--

