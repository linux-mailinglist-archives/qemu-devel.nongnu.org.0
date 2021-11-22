Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CC44590D9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:04:28 +0100 (CET)
Received: from localhost ([::1]:46794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpArq-0007Oe-RW
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:04:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mpAoq-0003zw-8L
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:01:20 -0500
Received: from [2607:f8b0:4864:20::92a] (port=46724
 helo=mail-ua1-x92a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mpAol-0008Dh-6c
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:01:19 -0500
Received: by mail-ua1-x92a.google.com with SMTP id az37so37074355uab.13
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nm/kY+Nkh4m8i9zHe0tmSMvjxrNBqF8vMpSagpedPjU=;
 b=5+9YIXqRpfsgM9e3Pyif8YPlZgb0Yuwn+Ch2ZOUYkdCkFGgv5wBzAFjQhNgREZ2V75
 0y+UeUht2PJN5vksgtEFznBFPeSVU2Pu3sfopJefMj4Fr8FNppNWeuGkIgnJQ5Mld+h8
 eXkS/cGySJ2LAy4X3vISFOLdqrboLJD6qBQ//2hJiP31UapNpzNAh6WcupqShQUzyF70
 UvYTAoRZJZ56VuTtqwu55H/Unq+wcT1vXClvzlwEb4N0RQ9lhyvqOLlC6txAp4R7cTOr
 zjpCYZTAQeMc9lAdiYG02ZjRqZaXV1Y5rs639Qzuft7FNUln1S5HF/fMrdJztIq9tf8w
 Pj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nm/kY+Nkh4m8i9zHe0tmSMvjxrNBqF8vMpSagpedPjU=;
 b=mjTvkW5XwMrTOHI3Wp5F6B6zi7pJm8i1oPvgjxBeQfY19VViKpY2Dd9sBH2dlJTqrL
 W/HNhS6J9PuEJ/o6CyuJUKmtSrDsHWVF6ZUi0u4ida2wVZOtlVCey0sqY3zdDPhJR2Yy
 z5YvfwEbEuIEx7GSfEgZkhr8fPSsW+o2b9jv+qG5HY4nHJ4iW7zhSoMsSwpzdqc+6Z6a
 /KYzQVUmDFrkCnOyA3ldOYv/Z26fpY6wtyhsFgh6lGvsPgeQWLIWx8TrkDIaTxJIqFoK
 case2wMnAByPa0yJQb+OBsNAIPypTvnnurENhi91xG+m03poARE2w3P0bXlYUPYQS7lV
 51Mw==
X-Gm-Message-State: AOAM530/iulyINRXSFxPWhCSEbpIkQi/XrZIRyUcqzWvNKV02TfV8SfF
 OkRmNjLsTe0yIurS+amDNLTulpqaTLrzOBjQfrjGgA==
X-Google-Smtp-Source: ABdhPJw9UIwjeWRssE422DVZxmnqRKuRyqqbazxizpx6BNK0yaV0VyNwpAUrMYULv15SoVmLQUu8V35N42Soewqd/BY=
X-Received: by 2002:a05:6102:d94:: with SMTP id
 d20mr134501462vst.12.1637593273401; 
 Mon, 22 Nov 2021 07:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20211122131200.229286-1-richard.henderson@linaro.org>
 <20211122131200.229286-3-richard.henderson@linaro.org>
In-Reply-To: <20211122131200.229286-3-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 22 Nov 2021 08:01:02 -0700
Message-ID: <CANCZdfred9sw_3beK6_eGRJSg9wVhbzotWatCbesEyEh5RGPpQ@mail.gmail.com>
Subject: Re: [PATCH for-6.2 2/2] linux-user/signal.c: Create a common
 rewind_if_in_safe_syscall
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000059144c05d161e54f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92a;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92a.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Khem Raj <raj.khem@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000059144c05d161e54f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 6:12 AM Richard Henderson <
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

Reviewed-by: Warner Losh <imp@bsdimp.com>

The changes to what I wrote look good.

Warner


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

--00000000000059144c05d161e54f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov 22, 2021 at 6:12 AM Richa=
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
div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;</div><div><br></div><div>The changes to what =
I wrote look good.<br></div><div><br></div><div>Warner<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--00000000000059144c05d161e54f--

