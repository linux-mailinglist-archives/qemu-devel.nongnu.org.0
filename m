Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787324590DF
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 16:06:02 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAtN-0001Vf-JR
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 10:06:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mpAqf-0006kp-G8
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:03:13 -0500
Received: from [2607:f8b0:4864:20::935] (port=42940
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mpAqY-00009O-Rw
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 10:03:13 -0500
Received: by mail-ua1-x935.google.com with SMTP id t13so37089160uad.9
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 07:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EmAGaw5kRpez1jLTPSpWtKtZbGI3Ajvi+X5YLNSqjc4=;
 b=be4xlZG3N8wBkkfbMPuyFwe3798w8T5wo8DuSLZaqqN8u0GSCgJoCjEIrT91FKt58x
 448zSxWEkBklqLbXPU0UUNQAQ0iCEhYGJw0n70PSt6+SBwQ1Bx1FUWNntmIoen2EXogq
 uFXkVTMMD/IBy9WbcS6ffn2hEv5iDeZGxXuYIELmPm6G0A0UZf11fwATDvUkhZG8HrYa
 Li5EZ70FW/nfu8qbcl0ajnWOyfhz5aLmC8GGXHs3ifEFh25jWGZ+PpL3OBx2oR6FRxEa
 EsxFaaRHZm6mtr/TQd+AYHWzqp7YJAfxyM86dSSRBwhjXT9mg7OkhlUVUkDSOeh9pJAW
 cSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EmAGaw5kRpez1jLTPSpWtKtZbGI3Ajvi+X5YLNSqjc4=;
 b=jEB8lX9ApjJFOMwSC+Cjr9/LACfPT7fZYCJYhKl1KAeWX0xO7dnd/BAI9mMT5omfjX
 zxuOncKyQ54aH5WxLdFEDhkuFoaRRS7SO0rh2gntj8wXFFnpLWnmX39E7PpwmMriQldG
 9jR+4JkKPdNfNfrVqgPhZYmFOgWeM3DHu4SUSDA02Mv37Ibz8uxIiC9OE1IBC0PTZi28
 3wNBhRhjppjiXfyRDIL42P7TCPvWxg1RikbR8SWLlqkS/pfgtYEuw2htLwHNQaiuHSd6
 ENIQ08U2A7gEVdchgN3n0RYHP02QP8SL6EOD41HMzqRibNp68h20/RTyKiVSa1pcCeQg
 Yv2w==
X-Gm-Message-State: AOAM531OaLTQ9S+HPPUIGNjqjQliCrdIVsd3Ac5py7J0oez2ZCsCjo2j
 BJ8Tb9GnZXS0vaZso/EdzSiJHr3FqzrYibQ1Eep55A==
X-Google-Smtp-Source: ABdhPJzLbd3GgFKy+hFntOVLMF0NDOqmzR4QP39GGE+FBD0PmhOKj0OS+pam1ybGo/jOReyf35fG3TBTUnEBgoBNooY=
X-Received: by 2002:ab0:6f47:: with SMTP id r7mr86263206uat.85.1637593384941; 
 Mon, 22 Nov 2021 07:03:04 -0800 (PST)
MIME-Version: 1.0
References: <20211122131200.229286-1-richard.henderson@linaro.org>
 <20211122131200.229286-2-richard.henderson@linaro.org>
In-Reply-To: <20211122131200.229286-2-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 22 Nov 2021 08:02:53 -0700
Message-ID: <CANCZdfqvnO2+EAOU2_z1fPZh2GLgzO34wGAWrrRW8PbLzoOaTw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 1/2] linux-user: Add host_signal_set_pc to set pc
 in mcontext
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ff0f1e05d161ebe4"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::935;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x935.google.com
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

--000000000000ff0f1e05d161ebe4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 6:12 AM Richard Henderson <
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

This looks like what I submitted, and will work with the cleaned up other
half.

Warner


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

--000000000000ff0f1e05d161ebe4
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
.com</a>&gt;</div><div><br></div><div>This looks like what I submitted, and=
 will work with the cleaned up other half.</div><div><br></div><div>Warner<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
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

--000000000000ff0f1e05d161ebe4--

