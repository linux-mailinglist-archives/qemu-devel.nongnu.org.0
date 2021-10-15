Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D8A42FAFA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:28:40 +0200 (CEST)
Received: from localhost ([::1]:38282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbRwd-0004Hx-O7
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:28:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRul-0002rG-0b
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:26:44 -0400
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34]:36474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRui-0001Gs-3L
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:26:42 -0400
Received: by mail-vk1-xa34.google.com with SMTP id f126so5597283vke.3
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePxZ7RjeKcoPje9VGfLYJM8NxopE3VKkckPCB13r+/Q=;
 b=18Pncwfm5mqlEvIhrVp+25O0zu3j+hFZ5KhIa2DRFQgrqNbSwMnSYapk9iwlJIgTjK
 Xn9TNNdSP3+7HFVFKbCzGgSzqrTavEopxlfoCehogqp5DX5PZIVf13BnhkBuuJ8yu8p4
 BreSJFgRGquMoPKVC05cTVWSUdY8138bFSO09ELjl9M48fJLTuyxGclAtpTLzL/h+bQu
 ORySvwaocR56Wz496fVS/HtfQOq2Ot5OR/BDYJMrJ19CG1ev2y31ltRw91w+MPVquQLa
 IU1CwPt37ZsI6Z3Fm1BwMWv4zyLhFEwlmHE3Mr4Xnpw4xWaOUqD//FT5I7WXroV1siCv
 8j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePxZ7RjeKcoPje9VGfLYJM8NxopE3VKkckPCB13r+/Q=;
 b=WZ+KdKUXQp0NxH27Hq/eynCZRU9qTAtfqlR5SPVe/w3z7uaQLXULgnxsyFdvgwD7K8
 Dak91zd5opjBHAskcDDJWNrlUVOsdiJrnEtZHab56nTjhq5gcrQlHQB/TN8ApgDyEOEB
 U0VfYlYMyLqfZFid7QcR3ND7UBMNAkIlDbpfD77YVAhMWzxhvIxv4ANGW7gf8sUrqWza
 pz32IdF//SRMTVgMoPgr+JZfwZMq/BWscgSoNGcXfrDUVVGn75gezjFLv7MIvuLGOkuC
 LQv1qM8w2koHziZWa3VqdBeP12muRHOhkqkcMgYuxZIpmwTzKoRzMscMxfKNQkKTsfnz
 AVUQ==
X-Gm-Message-State: AOAM532BQ0Ncdg1GZsO6x9wuXOyjHT7OlSNkEeFbOMlNSRCQLG6LzAFy
 Syv/D0mw21qoimGz0KmwZB2ukWO4aAVHVMD/1xDXQg==
X-Google-Smtp-Source: ABdhPJzGRHdn5YvantrsDGKBdUpCel2A8+Dgl6Ohn5Ru5ndxa/bVF2O65dQwnoYqaTZbw7mvchlzYkkA6Bw6byozQw8=
X-Received: by 2002:a1f:2006:: with SMTP id g6mr14008375vkg.22.1634322398754; 
 Fri, 15 Oct 2021 11:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-8-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-8-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:26:28 -0600
Message-ID: <CANCZdfqH81z02X3bSCOYmkHHvF+zx_YLbegYksAeRXetq677Sg@mail.gmail.com>
Subject: Re: [PATCH v5 07/67] linux-user/host/x86: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000006d04805ce685676"
Received-SPF: none client-ip=2607:f8b0:4864:20::a34;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa34.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000006d04805ce685676
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split host_signal_pc and host_signal_write out of user-exec.c.
> Drop the *BSD code, to be re-created under bsd-user/ later.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/i386/host-signal.h   |  25 ++++-
>  linux-user/host/x32/host-signal.h    |   2 +-
>  linux-user/host/x86_64/host-signal.h |  25 ++++-
>  accel/tcg/user-exec.c                | 136 +--------------------------
>  4 files changed, 50 insertions(+), 138 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

Though I've not pulled this into bsd-user to see how it affects me,
so I may come to regret this :)

Warner


> diff --git a/linux-user/host/i386/host-signal.h
> b/linux-user/host/i386/host-signal.h
> index f4b4d65031..ccbbee5082 100644
> --- a/linux-user/host/i386/host-signal.h
> +++ b/linux-user/host/i386/host-signal.h
> @@ -1 +1,24 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef I386_HOST_SIGNAL_H
> +#define I386_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_EIP];
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
> +        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
> +}
> +
> +#endif
> diff --git a/linux-user/host/x32/host-signal.h
> b/linux-user/host/x32/host-signal.h
> index f4b4d65031..26800591d3 100644
> --- a/linux-user/host/x32/host-signal.h
> +++ b/linux-user/host/x32/host-signal.h
> @@ -1 +1 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +#include "../x86_64/host-signal.h"
> diff --git a/linux-user/host/x86_64/host-signal.h
> b/linux-user/host/x86_64/host-signal.h
> index f4b4d65031..883d2fcf65 100644
> --- a/linux-user/host/x86_64/host-signal.h
> +++ b/linux-user/host/x86_64/host-signal.h
> @@ -1 +1,24 @@
> -#define HOST_SIGNAL_PLACEHOLDER
> +/*
> + * host-signal.h: signal info dependent on the host architecture
> + *
> + * Copyright (C) 2021 Linaro Limited
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef X86_64_HOST_SIGNAL_H
> +#define X86_64_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_RIP];
> +}
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.gregs[REG_TRAPNO] == 0xe
> +        && (uc->uc_mcontext.gregs[REG_ERR] & 0x2);
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 744af19397..474cb9cf82 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -29,19 +29,6 @@
>  #include "trace/trace-root.h"
>  #include "internal.h"
>
> -#undef EAX
> -#undef ECX
> -#undef EDX
> -#undef EBX
> -#undef ESP
> -#undef EBP
> -#undef ESI
> -#undef EDI
> -#undef EIP
> -#ifdef __linux__
> -#include <sys/ucontext.h>
> -#endif
> -
>  __thread uintptr_t helper_retaddr;
>
>  //#define DEBUG_SIGNAL
> @@ -268,123 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__i386__)
> -
> -#if defined(__NetBSD__)
> -#include <ucontext.h>
> -#include <machine/trap.h>
> -
> -#define EIP_sig(context)     ((context)->uc_mcontext.__gregs[_REG_EIP])
> -#define TRAP_sig(context)    ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
> -#define ERROR_sig(context)   ((context)->uc_mcontext.__gregs[_REG_ERR])
> -#define MASK_sig(context)    ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP      T_PAGEFLT
> -#elif defined(__FreeBSD__) || defined(__DragonFly__)
> -#include <ucontext.h>
> -#include <machine/trap.h>
> -
> -#define EIP_sig(context)  (*((unsigned long
> *)&(context)->uc_mcontext.mc_eip))
> -#define TRAP_sig(context)    ((context)->uc_mcontext.mc_trapno)
> -#define ERROR_sig(context)   ((context)->uc_mcontext.mc_err)
> -#define MASK_sig(context)    ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP      T_PAGEFLT
> -#elif defined(__OpenBSD__)
> -#include <machine/trap.h>
> -#define EIP_sig(context)     ((context)->sc_eip)
> -#define TRAP_sig(context)    ((context)->sc_trapno)
> -#define ERROR_sig(context)   ((context)->sc_err)
> -#define MASK_sig(context)    ((context)->sc_mask)
> -#define PAGE_FAULT_TRAP      T_PAGEFLT
> -#else
> -#define EIP_sig(context)     ((context)->uc_mcontext.gregs[REG_EIP])
> -#define TRAP_sig(context)    ((context)->uc_mcontext.gregs[REG_TRAPNO])
> -#define ERROR_sig(context)   ((context)->uc_mcontext.gregs[REG_ERR])
> -#define MASK_sig(context)    ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP      0xe
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
> -    ucontext_t *uc = puc;
> -#elif defined(__OpenBSD__)
> -    struct sigcontext *uc = puc;
> -#else
> -    ucontext_t *uc = puc;
> -#endif
> -    unsigned long pc;
> -    int trapno;
> -
> -#ifndef REG_EIP
> -/* for glibc 2.1 */
> -#define REG_EIP    EIP
> -#define REG_ERR    ERR
> -#define REG_TRAPNO TRAPNO
> -#endif
> -    pc = EIP_sig(uc);
> -    trapno = TRAP_sig(uc);
> -    return handle_cpu_signal(pc, info,
> -                             trapno == PAGE_FAULT_TRAP ?
> -                             (ERROR_sig(uc) >> 1) & 1 : 0,
> -                             &MASK_sig(uc));
> -}
> -
> -#elif defined(__x86_64__)
> -
> -#ifdef __NetBSD__
> -#include <machine/trap.h>
> -#define PC_sig(context)       _UC_MACHINE_PC(context)
> -#define TRAP_sig(context)
>  ((context)->uc_mcontext.__gregs[_REG_TRAPNO])
> -#define ERROR_sig(context)    ((context)->uc_mcontext.__gregs[_REG_ERR])
> -#define MASK_sig(context)     ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP       T_PAGEFLT
> -#elif defined(__OpenBSD__)
> -#include <machine/trap.h>
> -#define PC_sig(context)       ((context)->sc_rip)
> -#define TRAP_sig(context)     ((context)->sc_trapno)
> -#define ERROR_sig(context)    ((context)->sc_err)
> -#define MASK_sig(context)     ((context)->sc_mask)
> -#define PAGE_FAULT_TRAP       T_PAGEFLT
> -#elif defined(__FreeBSD__) || defined(__DragonFly__)
> -#include <ucontext.h>
> -#include <machine/trap.h>
> -
> -#define PC_sig(context)  (*((unsigned long
> *)&(context)->uc_mcontext.mc_rip))
> -#define TRAP_sig(context)     ((context)->uc_mcontext.mc_trapno)
> -#define ERROR_sig(context)    ((context)->uc_mcontext.mc_err)
> -#define MASK_sig(context)     ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP       T_PAGEFLT
> -#else
> -#define PC_sig(context)       ((context)->uc_mcontext.gregs[REG_RIP])
> -#define TRAP_sig(context)     ((context)->uc_mcontext.gregs[REG_TRAPNO])
> -#define ERROR_sig(context)    ((context)->uc_mcontext.gregs[REG_ERR])
> -#define MASK_sig(context)     ((context)->uc_sigmask)
> -#define PAGE_FAULT_TRAP       0xe
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info = pinfo;
> -    unsigned long pc;
> -#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)
> -    ucontext_t *uc = puc;
> -#elif defined(__OpenBSD__)
> -    struct sigcontext *uc = puc;
> -#else
> -    ucontext_t *uc = puc;
> -#endif
> -
> -    pc = PC_sig(uc);
> -    return handle_cpu_signal(pc, info,
> -                             TRAP_sig(uc) == PAGE_FAULT_TRAP ?
> -                             (ERROR_sig(uc) >> 1) & 1 : 0,
> -                             &MASK_sig(uc));
> -}
> -
> -#elif defined(_ARCH_PPC)
> +#if defined(_ARCH_PPC)
>
>  /***********************************************************************
>   * signal context platform-specific definitions
> @@ -895,11 +766,6 @@ int cpu_signal_handler(int host_signum, void *pinfo,
>
>      return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
>  }
> -
> -#else
> -
> -#error host CPU specific signal handler needed
> -
>  #endif
>
>  /* The softmmu versions of these helpers are in cputlb.c.  */
> --
> 2.25.1
>
>

--00000000000006d04805ce685676
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Split host_signal_pc and host_signal_write out of user-e=
xec.c.<br>
Drop the *BSD code, to be re-created under bsd-user/ later.<br>
<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/i386/host-signal.h=C2=A0 =C2=A0|=C2=A0 25 ++++-<br>
=C2=A0linux-user/host/x32/host-signal.h=C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0linux-user/host/x86_64/host-signal.h |=C2=A0 25 ++++-<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 136 +--------------------------<br>
=C2=A04 files changed, 50 insertions(+), 138 deletions(-)<br></blockquote><=
div><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com">imp@bsdimp.com</a>&gt;</div></div><div><br></div><div>Though I&=
#39;ve not=C2=A0pulled this into bsd-user to see how it affects me,</div><d=
iv>so I may come to regret=C2=A0this :)</div><div><br></div><div>Warner</di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host=
-signal.h<br>
index f4b4d65031..ccbbee5082 100644<br>
--- a/linux-user/host/i386/host-signal.h<br>
+++ b/linux-user/host/i386/host-signal.h<br>
@@ -1 +1,24 @@<br>
-#define HOST_SIGNAL_PLACEHOLDER<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef I386_HOST_SIGNAL_H<br>
+#define I386_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_EIP];<br>
+}<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (uc-&gt;uc_mcontext.gregs[REG_ERR] =
&amp; 0x2);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/linux-user/host/x32/host-signal.h b/linux-user/host/x32/host-s=
ignal.h<br>
index f4b4d65031..26800591d3 100644<br>
--- a/linux-user/host/x32/host-signal.h<br>
+++ b/linux-user/host/x32/host-signal.h<br>
@@ -1 +1 @@<br>
-#define HOST_SIGNAL_PLACEHOLDER<br>
+#include &quot;../x86_64/host-signal.h&quot;<br>
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/=
host-signal.h<br>
index f4b4d65031..883d2fcf65 100644<br>
--- a/linux-user/host/x86_64/host-signal.h<br>
+++ b/linux-user/host/x86_64/host-signal.h<br>
@@ -1 +1,24 @@<br>
-#define HOST_SIGNAL_PLACEHOLDER<br>
+/*<br>
+ * host-signal.h: signal info dependent on the host architecture<br>
+ *<br>
+ * Copyright (C) 2021 Linaro Limited<br>
+ *<br>
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.<br>
+ * See the COPYING file in the top-level directory.<br>
+ */<br>
+<br>
+#ifndef X86_64_HOST_SIGNAL_H<br>
+#define X86_64_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_RIP];<br>
+}<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; (uc-&gt;uc_mcontext.gregs[REG_ERR] =
&amp; 0x2);<br>
+}<br>
+<br>
+#endif<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 744af19397..474cb9cf82 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -29,19 +29,6 @@<br>
=C2=A0#include &quot;trace/trace-root.h&quot;<br>
=C2=A0#include &quot;internal.h&quot;<br>
<br>
-#undef EAX<br>
-#undef ECX<br>
-#undef EDX<br>
-#undef EBX<br>
-#undef ESP<br>
-#undef EBP<br>
-#undef ESI<br>
-#undef EDI<br>
-#undef EIP<br>
-#ifdef __linux__<br>
-#include &lt;sys/ucontext.h&gt;<br>
-#endif<br>
-<br>
=C2=A0__thread uintptr_t helper_retaddr;<br>
<br>
=C2=A0//#define DEBUG_SIGNAL<br>
@@ -268,123 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong ad=
dr, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__i386__)<br>
-<br>
-#if defined(__NetBSD__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;machine/trap.h&gt;<br>
-<br>
-#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.__g=
regs[_REG_EIP])<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.__gregs[=
_REG_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.__gregs[=
_REG_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
-#elif defined(__FreeBSD__) || defined(__DragonFly__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;machine/trap.h&gt;<br>
-<br>
-#define EIP_sig(context)=C2=A0 (*((unsigned long *)&amp;(context)-&gt;uc_m=
context.mc_eip))<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.mc_trapn=
o)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.mc_err)<=
br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
-#elif defined(__OpenBSD__)<br>
-#include &lt;machine/trap.h&gt;<br>
-#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_eip)<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_trapno)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;sc_err)<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_mask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 T_PAGEFLT<br>
-#else<br>
-#define EIP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.gre=
gs[REG_EIP])<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.gregs[RE=
G_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0((context)-&gt;uc_mcontext.gregs[RE=
G_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_sigmask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 0xe<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)<=
br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#elif defined(__OpenBSD__)<br>
-=C2=A0 =C2=A0 struct sigcontext *uc =3D puc;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-=C2=A0 =C2=A0 int trapno;<br>
-<br>
-#ifndef REG_EIP<br>
-/* for glibc 2.1 */<br>
-#define REG_EIP=C2=A0 =C2=A0 EIP<br>
-#define REG_ERR=C2=A0 =C2=A0 ERR<br>
-#define REG_TRAPNO TRAPNO<br>
-#endif<br>
-=C2=A0 =C2=A0 pc =3D EIP_sig(uc);<br>
-=C2=A0 =C2=A0 trapno =3D TRAP_sig(uc);<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trapno =3D=3D PAGE_FAULT_TRAP ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;MASK_sig(uc));<br>
-}<br>
-<br>
-#elif defined(__x86_64__)<br>
-<br>
-#ifdef __NetBSD__<br>
-#include &lt;machine/trap.h&gt;<br>
-#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0_UC_MACHINE_PC(context)<=
br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.__=
gregs[_REG_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.__gregs=
[_REG_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmask)<br=
>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
-#elif defined(__OpenBSD__)<br>
-#include &lt;machine/trap.h&gt;<br>
-#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_rip)<b=
r>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_trapno)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;sc_err)<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;sc_mask)<br>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
-#elif defined(__FreeBSD__) || defined(__DragonFly__)<br>
-#include &lt;ucontext.h&gt;<br>
-#include &lt;machine/trap.h&gt;<br>
-<br>
-#define PC_sig(context)=C2=A0 (*((unsigned long *)&amp;(context)-&gt;uc_mc=
ontext.mc_rip))<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.mc=
_trapno)<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.mc_err)=
<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmask)<br=
>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A0T_PAGEFLT<br>
-#else<br>
-#define PC_sig(context)=C2=A0 =C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mconte=
xt.gregs[REG_RIP])<br>
-#define TRAP_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_mcontext.gr=
egs[REG_TRAPNO])<br>
-#define ERROR_sig(context)=C2=A0 =C2=A0 ((context)-&gt;uc_mcontext.gregs[R=
EG_ERR])<br>
-#define MASK_sig(context)=C2=A0 =C2=A0 =C2=A0((context)-&gt;uc_sigmask)<br=
>
-#define PAGE_FAULT_TRAP=C2=A0 =C2=A0 =C2=A0 =C2=A00xe<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 unsigned long pc;<br>
-#if defined(__NetBSD__) || defined(__FreeBSD__) || defined(__DragonFly__)<=
br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#elif defined(__OpenBSD__)<br>
-=C2=A0 =C2=A0 struct sigcontext *uc =3D puc;<br>
-#else<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-#endif<br>
-<br>
-=C2=A0 =C2=A0 pc =3D PC_sig(uc);<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TRAP_sig(uc) =3D=3D PAGE_FAULT_TRAP ?<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(ERROR_sig(uc) &gt;&gt; 1) &amp; 1 : 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;MASK_sig(uc));<br>
-}<br>
-<br>
-#elif defined(_ARCH_PPC)<br>
+#if defined(_ARCH_PPC)<br>
<br>
=C2=A0/********************************************************************=
***<br>
=C2=A0 * signal context platform-specific definitions<br>
@@ -895,11 +766,6 @@ int cpu_signal_handler(int host_signum, void *pinfo,<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0return handle_cpu_signal(pc, info, is_write, &amp;uc-&g=
t;uc_sigmask);<br>
=C2=A0}<br>
-<br>
-#else<br>
-<br>
-#error host CPU specific signal handler needed<br>
-<br>
=C2=A0#endif<br>
<br>
=C2=A0/* The softmmu versions of these helpers are in cputlb.c.=C2=A0 */<br=
>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000006d04805ce685676--

