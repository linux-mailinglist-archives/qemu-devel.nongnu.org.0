Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5B454AF4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 17:29:35 +0100 (CET)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnNoU-0002G4-HS
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 11:29:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNio-0005J3-GP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:23:42 -0500
Received: from [2607:f8b0:4864:20::92b] (port=35335
 helo=mail-ua1-x92b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mnNil-0006OD-L2
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 11:23:42 -0500
Received: by mail-ua1-x92b.google.com with SMTP id l24so7177882uak.2
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 08:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EctiOxK2Ej+K0Vzo/vW70pCxS0j+i29UIaeqGARfG6A=;
 b=y09tjnu1NUVIQmRAGs8VRfx9lrQorc7VSUwga0TK3eJkFQCflG4IMO1qZHakIYlLB4
 3kQBZy0gT3k+62JdT3p5jdKfSfQ2FulAKmJj13e3U2ZprtENQp/cHzx82XEtK1sn710U
 ixL82PaDGWdXD4wVYTGcckzEWC+Fd6fZjdNKjwRotFPBAChm/qM6XkU12vAhZYo/BIsU
 cD1M+rlbzg6o0JPWgDfCvM9yddaRm1f9xKRQyXxEn0QcNavLh7YxFX7dZX0RigVQeHto
 BY63DnkF6aKbYwjQqe6AH59Ft3nHbJHuV+jwjwB8T29tKkA51zwbIkSz+ctwNyEK2454
 EGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EctiOxK2Ej+K0Vzo/vW70pCxS0j+i29UIaeqGARfG6A=;
 b=ims/KruATmbYDk1bWQ4vsjugTz2hra9hOZX3RhJl6llEBx7aqvfh4e6a4tNMOG+LFz
 xmjYlQdqm7EcWkAxrDEZrP6doOoTwMfjt2CNYzaZTbt2aydtMuDONmN1+ic/ckshatAm
 jttpNMWJyvvLUYkm/E8y3pB+lUG2yuEUmuMXfQBVO3jG4kUSHxxUeLjhkgSrrRXmw1ka
 /C9TnlV1UxSayzBetQ+mv1IC8/+LdIm9KG/9UVWK1yI9nM/vwvaLk8mrmAMBBLHxviTt
 orUhAlazUKJe55u56mRjxSKIL+p5Vw+OoTnQ0DVaAa8h5YWO/zztbu/3Gl37gAHN2Wxc
 mUSg==
X-Gm-Message-State: AOAM533prFtXYE9dB5+TuVKwn5teLBUOQFEVQdU/QK6unrZt1nMzTDIC
 gfBV2F032if4DbWsUlmeBvEWyqXb/SsPF9DdjUTL0w==
X-Google-Smtp-Source: ABdhPJz9RyhOBnkrO51PSCSSP6NaTR0Y6+oTV50v484ovIJY9QusWOFEiZw7p4m488gIucAYNGrM5ftM1LcaM/ua0dE=
X-Received: by 2002:a05:6102:5f2:: with SMTP id
 w18mr72772982vsf.6.1637166218637; 
 Wed, 17 Nov 2021 08:23:38 -0800 (PST)
MIME-Version: 1.0
References: <20211117160412.71563-1-richard.henderson@linaro.org>
 <20211117160412.71563-2-richard.henderson@linaro.org>
In-Reply-To: <20211117160412.71563-2-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 17 Nov 2021 09:23:28 -0700
Message-ID: <CANCZdfq7mB1KzxednFeFJn7bxo=SQyPU=4CX3+6WiEVkB5Gsyg@mail.gmail.com>
Subject: Re: [PATCH v5 01/17] linux-user: Add host_signal_set_pc to set pc in
 mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000e6805405d0fe7691"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92b
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92b;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92b.google.com
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

--000000000000e6805405d0fe7691
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 9:04 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> From: Warner Losh <imp@bsdimp.com>
>
> Add a new function host_signal_set_pc to set the next pc in an
> mcontext. The caller should ensure this is a valid PC for execution.
>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20211113045603.60391-2-imp@bsdimp.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/host/aarch64/host-signal.h | 5 +++++
>  linux-user/host/alpha/host-signal.h   | 5 +++++
>  linux-user/host/arm/host-signal.h     | 5 +++++
>  linux-user/host/i386/host-signal.h    | 5 +++++
>  linux-user/host/mips/host-signal.h    | 5 +++++
>  linux-user/host/ppc/host-signal.h     | 5 +++++
>  linux-user/host/riscv/host-signal.h   | 5 +++++
>  linux-user/host/s390/host-signal.h    | 5 +++++
>  linux-user/host/sparc/host-signal.h   | 9 +++++++++
>  linux-user/host/x86_64/host-signal.h  | 5 +++++
>  10 files changed, 54 insertions(+)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>

I'm unsure on the protocol for this situation (where I wrote the change,
but someone else picked it up), but the change looks good to me....


> diff --git a/linux-user/host/aarch64/host-signal.h
> b/linux-user/host/aarch64/host-signal.h
> index 0c0b08383a..9770b36dc1 100644
> --- a/linux-user/host/aarch64/host-signal.h
> +++ b/linux-user/host/aarch64/host-signal.h
> @@ -35,6 +35,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.pc;
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.pc =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      struct _aarch64_ctx *hdr;
> diff --git a/linux-user/host/alpha/host-signal.h
> b/linux-user/host/alpha/host-signal.h
> index e080be412f..f4c942948a 100644
> --- a/linux-user/host/alpha/host-signal.h
> +++ b/linux-user/host/alpha/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.sc_pc;
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.sc_pc =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      uint32_t *pc =3D (uint32_t *)host_signal_pc(uc);
> diff --git a/linux-user/host/arm/host-signal.h
> b/linux-user/host/arm/host-signal.h
> index efb165c0c5..6c095773c0 100644
> --- a/linux-user/host/arm/host-signal.h
> +++ b/linux-user/host/arm/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.arm_pc;
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.arm_pc =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      /*
> diff --git a/linux-user/host/i386/host-signal.h
> b/linux-user/host/i386/host-signal.h
> index 4c8eef99ce..abe1ece5c9 100644
> --- a/linux-user/host/i386/host-signal.h
> +++ b/linux-user/host/i386/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.gregs[REG_EIP];
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.gregs[REG_EIP] =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      return uc->uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe
> diff --git a/linux-user/host/mips/host-signal.h
> b/linux-user/host/mips/host-signal.h
> index ef341f7c20..c666ed8c3f 100644
> --- a/linux-user/host/mips/host-signal.h
> +++ b/linux-user/host/mips/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.pc;
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.pc =3D pc;
> +}
> +
>  #if defined(__misp16) || defined(__mips_micromips)
>  #error "Unsupported encoding"
>  #endif
> diff --git a/linux-user/host/ppc/host-signal.h
> b/linux-user/host/ppc/host-signal.h
> index a491c413dc..1d8e658ff7 100644
> --- a/linux-user/host/ppc/host-signal.h
> +++ b/linux-user/host/ppc/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.regs->nip;
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.regs->nip =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      return uc->uc_mcontext.regs->trap !=3D 0x400
> diff --git a/linux-user/host/riscv/host-signal.h
> b/linux-user/host/riscv/host-signal.h
> index 3b168cb58b..a4f170efb0 100644
> --- a/linux-user/host/riscv/host-signal.h
> +++ b/linux-user/host/riscv/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.__gregs[REG_PC];
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.__gregs[REG_PC] =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      /*
> diff --git a/linux-user/host/s390/host-signal.h
> b/linux-user/host/s390/host-signal.h
> index 26990e4893..a524f2ab00 100644
> --- a/linux-user/host/s390/host-signal.h
> +++ b/linux-user/host/s390/host-signal.h
> @@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.psw.addr;
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.psw.addr =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      uint16_t *pinsn =3D (uint16_t *)host_signal_pc(uc);
> diff --git a/linux-user/host/sparc/host-signal.h
> b/linux-user/host/sparc/host-signal.h
> index 5e71d33f8e..7342936071 100644
> --- a/linux-user/host/sparc/host-signal.h
> +++ b/linux-user/host/sparc/host-signal.h
> @@ -20,6 +20,15 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>  #endif
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +#ifdef __arch64__
> +    uc->uc_mcontext.mc_gregs[MC_PC] =3D pc;
> +#else
> +    uc->uc_mcontext.gregs[REG_PC] =3D pc;
> +#endif
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);
> diff --git a/linux-user/host/x86_64/host-signal.h
> b/linux-user/host/x86_64/host-signal.h
> index 883d2fcf65..c71d597eb2 100644
> --- a/linux-user/host/x86_64/host-signal.h
> +++ b/linux-user/host/x86_64/host-signal.h
> @@ -15,6 +15,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)
>      return uc->uc_mcontext.gregs[REG_RIP];
>  }
>
> +static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)
> +{
> +    uc->uc_mcontext.gregs[REG_RIP] =3D pc;
> +}
> +
>  static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)
>  {
>      return uc->uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe
> --
> 2.25.1
>
>

--000000000000e6805405d0fe7691
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
Add a new function host_signal_set_pc to set the next pc in an<br>
mcontext. The caller should ensure this is a valid PC for execution.<br>
<br>
Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"=
_blank">imp@bsdimp.com</a>&gt;<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20211113045603.60391-2-imp@bsdimp.com" ta=
rget=3D"_blank">20211113045603.60391-2-imp@bsdimp.com</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0linux-user/host/aarch64/host-signal.h | 5 +++++<br>
=C2=A0linux-user/host/alpha/host-signal.h=C2=A0 =C2=A0| 5 +++++<br>
=C2=A0linux-user/host/arm/host-signal.h=C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0linux-user/host/i386/host-signal.h=C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0linux-user/host/mips/host-signal.h=C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0linux-user/host/ppc/host-signal.h=C2=A0 =C2=A0 =C2=A0| 5 +++++<br>
=C2=A0linux-user/host/riscv/host-signal.h=C2=A0 =C2=A0| 5 +++++<br>
=C2=A0linux-user/host/s390/host-signal.h=C2=A0 =C2=A0 | 5 +++++<br>
=C2=A0linux-user/host/sparc/host-signal.h=C2=A0 =C2=A0| 9 +++++++++<br>
=C2=A0linux-user/host/x86_64/host-signal.h=C2=A0 | 5 +++++<br>
=C2=A010 files changed, 54 insertions(+)<br></blockquote><div><br></div><di=
v>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp=
.com</a>&gt;</div><div><br></div><div>I&#39;m unsure on the protocol for th=
is situation (where I wrote the change,</div><div>but someone else picked i=
t up), but the change looks good to me....</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
diff --git a/linux-user/host/aarch64/host-signal.h b/linux-user/host/aarch6=
4/host-signal.h<br>
index 0c0b08383a..9770b36dc1 100644<br>
--- a/linux-user/host/aarch64/host-signal.h<br>
+++ b/linux-user/host/aarch64/host-signal.h<br>
@@ -35,6 +35,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.pc;<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.pc =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0struct _aarch64_ctx *hdr;<br>
diff --git a/linux-user/host/alpha/host-signal.h b/linux-user/host/alpha/ho=
st-signal.h<br>
index e080be412f..f4c942948a 100644<br>
--- a/linux-user/host/alpha/host-signal.h<br>
+++ b/linux-user/host/alpha/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.sc_pc;<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.sc_pc =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t *pc =3D (uint32_t *)host_signal_pc(uc);<br>
diff --git a/linux-user/host/arm/host-signal.h b/linux-user/host/arm/host-s=
ignal.h<br>
index efb165c0c5..6c095773c0 100644<br>
--- a/linux-user/host/arm/host-signal.h<br>
+++ b/linux-user/host/arm/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.arm_pc;<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.arm_pc =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/linux-user/host/i386/host-signal.h b/linux-user/host/i386/host=
-signal.h<br>
index 4c8eef99ce..abe1ece5c9 100644<br>
--- a/linux-user/host/i386/host-signal.h<br>
+++ b/linux-user/host/i386/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.gregs[REG_EIP];<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.gregs[REG_EIP] =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe<=
br>
diff --git a/linux-user/host/mips/host-signal.h b/linux-user/host/mips/host=
-signal.h<br>
index ef341f7c20..c666ed8c3f 100644<br>
--- a/linux-user/host/mips/host-signal.h<br>
+++ b/linux-user/host/mips/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.pc;<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.pc =3D pc;<br>
+}<br>
+<br>
=C2=A0#if defined(__misp16) || defined(__mips_micromips)<br>
=C2=A0#error &quot;Unsupported encoding&quot;<br>
=C2=A0#endif<br>
diff --git a/linux-user/host/ppc/host-signal.h b/linux-user/host/ppc/host-s=
ignal.h<br>
index a491c413dc..1d8e658ff7 100644<br>
--- a/linux-user/host/ppc/host-signal.h<br>
+++ b/linux-user/host/ppc/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.regs-&gt;nip;<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.regs-&gt;nip =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.regs-&gt;trap !=3D 0x400<br>
diff --git a/linux-user/host/riscv/host-signal.h b/linux-user/host/riscv/ho=
st-signal.h<br>
index 3b168cb58b..a4f170efb0 100644<br>
--- a/linux-user/host/riscv/host-signal.h<br>
+++ b/linux-user/host/riscv/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.__gregs[REG_PC];<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.__gregs[REG_PC] =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
diff --git a/linux-user/host/s390/host-signal.h b/linux-user/host/s390/host=
-signal.h<br>
index 26990e4893..a524f2ab00 100644<br>
--- a/linux-user/host/s390/host-signal.h<br>
+++ b/linux-user/host/s390/host-signal.h<br>
@@ -16,6 +16,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.psw.addr;<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.psw.addr =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint16_t *pinsn =3D (uint16_t *)host_signal_pc(uc);<br>
diff --git a/linux-user/host/sparc/host-signal.h b/linux-user/host/sparc/ho=
st-signal.h<br>
index 5e71d33f8e..7342936071 100644<br>
--- a/linux-user/host/sparc/host-signal.h<br>
+++ b/linux-user/host/sparc/host-signal.h<br>
@@ -20,6 +20,15 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0#endif<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+#ifdef __arch64__<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.mc_gregs[MC_PC] =3D pc;<br>
+#else<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.gregs[REG_PC] =3D pc;<br>
+#endif<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint32_t insn =3D *(uint32_t *)host_signal_pc(uc);<br>
diff --git a/linux-user/host/x86_64/host-signal.h b/linux-user/host/x86_64/=
host-signal.h<br>
index 883d2fcf65..c71d597eb2 100644<br>
--- a/linux-user/host/x86_64/host-signal.h<br>
+++ b/linux-user/host/x86_64/host-signal.h<br>
@@ -15,6 +15,11 @@ static inline uintptr_t host_signal_pc(ucontext_t *uc)<b=
r>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.gregs[REG_RIP];<br>
=C2=A0}<br>
<br>
+static inline void host_signal_set_pc(ucontext_t *uc, uintptr_t pc)<br>
+{<br>
+=C2=A0 =C2=A0 uc-&gt;uc_mcontext.gregs[REG_RIP] =3D pc;<br>
+}<br>
+<br>
=C2=A0static inline bool host_signal_write(siginfo_t *info, ucontext_t *uc)=
<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0return uc-&gt;uc_mcontext.gregs[REG_TRAPNO] =3D=3D 0xe<=
br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000e6805405d0fe7691--

