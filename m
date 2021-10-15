Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D4F42FB1A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:35:10 +0200 (CEST)
Received: from localhost ([::1]:48686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbS2v-00031x-HC
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRzx-0000Dv-Lj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:32:07 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:33788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbRzv-00080L-KR
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:32:05 -0400
Received: by mail-ua1-x92e.google.com with SMTP id i15so19940555uap.0
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fz7SYEBfj4+ZUk74JGBHpfjj1iD0xCA/uoB2roquEgY=;
 b=0iWJB3FriY6VfXyfe+b1lucd4GTtwiO8CRODHs6CXJLI5BqX9FQ2wo1+ynH4sGMP/2
 DFFFWoGStNz1RDlLHFUJkkkDPk2Bh5E2H476fFkUD7QKNon9htkSZLd3xds5x4P4agtE
 mNaBU3WbjrksikBWXSr9mRB/a7XDMRNl0txF1LoJneKPyX4uXjJ/dQNzlwXe93uuBpol
 F4s8Xs24hkCkcQXbEwqymaGF/JKWdy5bMNuML7wi5wD45UUOzvvZzzz6y1mcFpNiA2uf
 jDcQ80wbJcbsOB1t/uJc9EnM0+EjwtcmzLn5ArH163jxvyLsTEJhxdfoUzL4RgBu08Fg
 WLdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fz7SYEBfj4+ZUk74JGBHpfjj1iD0xCA/uoB2roquEgY=;
 b=FsqcCJn6eJNSbQ/cXasKMq/rN0SK/H1oy4p2YEsJoTu5hpXHcYVGL3zi6Ye+4EDt8e
 q6zUIZ+okWW4/td5RaYAcCdY1ppVVZ7X1VqYBUgh3K6Nlhk9ielOl+cCd3K2scrslv8Z
 AzFzFmVX0zLGypOQ8U9Js4UFV2kvn4MeSc1WAXgDRIYW1hslinf+PQUANHHMlNuZrUR+
 FtpHrRtwTO7cVrkiAkKIN6NowOiF5igQn0mGvMALK5kk+UN7q/Qqsxz1Fe2aPHkL6iZJ
 uPhOo7zQNR+RIPo8UAfXOAXwmYejQQmpi7NSyqpqdWtR0vzBTQaaKkffhRDSmCF0eFtp
 koZQ==
X-Gm-Message-State: AOAM532584egvzZ3Hw0I2PS3HhH9ezOxANk1Y3EdI2Id59vOBNmDTFcx
 OdDurD03xpHreigHnHMSEh4Hlanfjh/pmQ8i1+epcw==
X-Google-Smtp-Source: ABdhPJzx4yxwcj4DNifdvEpykvvLfPo47cLZlDI6HbUvtR3sjZE0B/rQPFxTBTtOi38/i3KZFM8X2zMpUZmF7M+y/sk=
X-Received: by 2002:a67:c903:: with SMTP id w3mr15966179vsk.6.1634322722339;
 Fri, 15 Oct 2021 11:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-15-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-15-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:31:51 -0600
Message-ID: <CANCZdfqFO8mKt+FB0KxO94QVmQ2K+2r8iE6KX28SeTvovYzW0g@mail.gmail.com>
Subject: Re: [PATCH v5 14/67] linux-user/host/mips: Populate host_signal.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000504e0e05ce68696d"
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
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

--000000000000504e0e05ce68696d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Split host_signal_pc and host_signal_write out of user-exec.c.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/mips/host-signal.h | 62 +++++++++++++++++++++++++++++-
>  accel/tcg/user-exec.c              | 52 +------------------------
>  2 files changed, 62 insertions(+), 52 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/linux-user/host/mips/host-signal.h
> b/linux-user/host/mips/host-signal.h
> index f4b4d65031..9c83e51130 100644
> --- a/linux-user/host/mips/host-signal.h
> +++ b/linux-user/host/mips/host-signal.h
> @@ -1 +1,61 @@
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
> +#ifndef MIPS_HOST_SIGNAL_H
> +#define MIPS_HOST_SIGNAL_H
> +
> +static inline uintptr_t host_signal_pc(ucontext_t *uc)
> +{
> +    return uc->uc_mcontext.pc;
> +}
> +
> +#if defined(__misp16) || defined(__mips_micromips)
> +#error "Unsupported encoding"
> +#endif
> +
> +static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
> +{
> +    uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);
> +
> +    /* Detect all store instructions at program counter. */
> +    switch ((insn >> 26) & 077) {
> +    case 050: /* SB */
> +    case 051: /* SH */
> +    case 052: /* SWL */
> +    case 053: /* SW */
> +    case 054: /* SDL */
> +    case 055: /* SDR */
> +    case 056: /* SWR */
> +    case 070: /* SC */
> +    case 071: /* SWC1 */
> +    case 074: /* SCD */
> +    case 075: /* SDC1 */
> +    case 077: /* SD */
> +#if !defined(__mips_isa_rev) || __mips_isa_rev < 6
> +    case 072: /* SWC2 */
> +    case 076: /* SDC2 */
> +#endif
> +        return true;
> +    case 023: /* COP1X */
> +        /*
> +         * Required in all versions of MIPS64 since
> +         * MIPS64r1 and subsequent versions of MIPS32r2.
> +         */
> +        switch (insn & 077) {
> +        case 010: /* SWXC1 */
> +        case 011: /* SDXC1 */
> +        case 015: /* SUXC1 */
> +            return true;
> +        }
> +        break;
> +    }
> +    return false;
> +}
> +
> +#endif
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index bfd964b578..287f03dac5 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -255,57 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong
> addr, int size,
>      return size ? g2h(env_cpu(env), addr) : NULL;
>  }
>
> -#if defined(__mips__)
> -
> -#if defined(__misp16) || defined(__mips_micromips)
> -#error "Unsupported encoding"
> -#endif
> -
> -int cpu_signal_handler(int host_signum, void *pinfo,
> -                       void *puc)
> -{
> -    siginfo_t *info =3D pinfo;
> -    ucontext_t *uc =3D puc;
> -    uintptr_t pc =3D uc->uc_mcontext.pc;
> -    uint32_t insn =3D *(uint32_t *)pc;
> -    int is_write =3D 0;
> -
> -    /* Detect all store instructions at program counter. */
> -    switch((insn >> 26) & 077) {
> -    case 050: /* SB */
> -    case 051: /* SH */
> -    case 052: /* SWL */
> -    case 053: /* SW */
> -    case 054: /* SDL */
> -    case 055: /* SDR */
> -    case 056: /* SWR */
> -    case 070: /* SC */
> -    case 071: /* SWC1 */
> -    case 074: /* SCD */
> -    case 075: /* SDC1 */
> -    case 077: /* SD */
> -#if !defined(__mips_isa_rev) || __mips_isa_rev < 6
> -    case 072: /* SWC2 */
> -    case 076: /* SDC2 */
> -#endif
> -        is_write =3D 1;
> -        break;
> -    case 023: /* COP1X */
> -        /* Required in all versions of MIPS64 since
> -           MIPS64r1 and subsequent versions of MIPS32r2. */
> -        switch (insn & 077) {
> -        case 010: /* SWXC1 */
> -        case 011: /* SDXC1 */
> -        case 015: /* SUXC1 */
> -            is_write =3D 1;
> -        }
> -        break;
> -    }
> -
> -    return handle_cpu_signal(pc, info, is_write, &uc->uc_sigmask);
> -}
> -
> -#elif defined(__riscv)
> +#if defined(__riscv)
>
>  int cpu_signal_handler(int host_signum, void *pinfo,
>                         void *puc)
> --
> 2.25.1
>
>

--000000000000504e0e05ce68696d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Split host_signal_pc and host_signal_write out of user-e=
xec.c.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/mips/host-signal.h | 62 +++++++++++++++++++++++++++++=
-<br>
=C2=A0accel/tcg/user-exec.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 | 52 +------------------------<br>
=C2=A02 files changed, 62 insertions(+), 52 deletions(-)<br></blockquote><d=
iv><br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com">imp@bsdimp.com</a>&gt;</div><br class=3D"gmail-Apple-interchange=
-newline"></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host=
-signal.h<br>
index f4b4d65031..9c83e51130 100644<br>
--- a/linux-user/host/mips/host-signal.h<br>
+++ b/linux-user/host/mips/host-signal.h<br>
@@ -1 +1,61 @@<br>
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
+#ifndef MIPS_HOST_SIGNAL_H<br>
+#define MIPS_HOST_SIGNAL_H<br>
+<br>
+static inline uintptr_t host_signal_pc(ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 return uc-&gt;uc_mcontext.pc;<br>
+}<br>
+<br>
+#if defined(__misp16) || defined(__mips_micromips)<br>
+#error &quot;Unsupported encoding&quot;<br>
+#endif<br>
+<br>
+static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);<br>
+<br>
+=C2=A0 =C2=A0 /* Detect all store instructions at program counter. */<br>
+=C2=A0 =C2=A0 switch ((insn &gt;&gt; 26) &amp; 077) {<br>
+=C2=A0 =C2=A0 case 050: /* SB */<br>
+=C2=A0 =C2=A0 case 051: /* SH */<br>
+=C2=A0 =C2=A0 case 052: /* SWL */<br>
+=C2=A0 =C2=A0 case 053: /* SW */<br>
+=C2=A0 =C2=A0 case 054: /* SDL */<br>
+=C2=A0 =C2=A0 case 055: /* SDR */<br>
+=C2=A0 =C2=A0 case 056: /* SWR */<br>
+=C2=A0 =C2=A0 case 070: /* SC */<br>
+=C2=A0 =C2=A0 case 071: /* SWC1 */<br>
+=C2=A0 =C2=A0 case 074: /* SCD */<br>
+=C2=A0 =C2=A0 case 075: /* SDC1 */<br>
+=C2=A0 =C2=A0 case 077: /* SD */<br>
+#if !defined(__mips_isa_rev) || __mips_isa_rev &lt; 6<br>
+=C2=A0 =C2=A0 case 072: /* SWC2 */<br>
+=C2=A0 =C2=A0 case 076: /* SDC2 */<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 case 023: /* COP1X */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Required in all versions of MIPS64 sin=
ce<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MIPS64r1 and subsequent versions of MI=
PS32r2.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 077) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 010: /* SWXC1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 011: /* SDXC1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 015: /* SUXC1 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return false;<br>
+}<br>
+<br>
+#endif<br>
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index bfd964b578..287f03dac5 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -255,57 +255,7 @@ void *probe_access(CPUArchState *env, target_ulong add=
r, int size,<br>
=C2=A0 =C2=A0 =C2=A0return size ? g2h(env_cpu(env), addr) : NULL;<br>
=C2=A0}<br>
<br>
-#if defined(__mips__)<br>
-<br>
-#if defined(__misp16) || defined(__mips_micromips)<br>
-#error &quot;Unsupported encoding&quot;<br>
-#endif<br>
-<br>
-int cpu_signal_handler(int host_signum, void *pinfo,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0void *puc)<br>
-{<br>
-=C2=A0 =C2=A0 siginfo_t *info =3D pinfo;<br>
-=C2=A0 =C2=A0 ucontext_t *uc =3D puc;<br>
-=C2=A0 =C2=A0 uintptr_t pc =3D uc-&gt;uc_mcontext.pc;<br>
-=C2=A0 =C2=A0 uint32_t insn =3D *(uint32_t *)pc;<br>
-=C2=A0 =C2=A0 int is_write =3D 0;<br>
-<br>
-=C2=A0 =C2=A0 /* Detect all store instructions at program counter. */<br>
-=C2=A0 =C2=A0 switch((insn &gt;&gt; 26) &amp; 077) {<br>
-=C2=A0 =C2=A0 case 050: /* SB */<br>
-=C2=A0 =C2=A0 case 051: /* SH */<br>
-=C2=A0 =C2=A0 case 052: /* SWL */<br>
-=C2=A0 =C2=A0 case 053: /* SW */<br>
-=C2=A0 =C2=A0 case 054: /* SDL */<br>
-=C2=A0 =C2=A0 case 055: /* SDR */<br>
-=C2=A0 =C2=A0 case 056: /* SWR */<br>
-=C2=A0 =C2=A0 case 070: /* SC */<br>
-=C2=A0 =C2=A0 case 071: /* SWC1 */<br>
-=C2=A0 =C2=A0 case 074: /* SCD */<br>
-=C2=A0 =C2=A0 case 075: /* SDC1 */<br>
-=C2=A0 =C2=A0 case 077: /* SD */<br>
-#if !defined(__mips_isa_rev) || __mips_isa_rev &lt; 6<br>
-=C2=A0 =C2=A0 case 072: /* SWC2 */<br>
-=C2=A0 =C2=A0 case 076: /* SDC2 */<br>
-#endif<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 case 023: /* COP1X */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Required in all versions of MIPS64 since<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MIPS64r1 and subsequent versions =
of MIPS32r2. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (insn &amp; 077) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 010: /* SWXC1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 011: /* SDXC1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 case 015: /* SUXC1 */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_write =3D 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 return handle_cpu_signal(pc, info, is_write, &amp;uc-&gt;uc_=
sigmask);<br>
-}<br>
-<br>
-#elif defined(__riscv)<br>
+#if defined(__riscv)<br>
<br>
=C2=A0int cpu_signal_handler(int host_signum, void *pinfo,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void *puc)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000504e0e05ce68696d--

