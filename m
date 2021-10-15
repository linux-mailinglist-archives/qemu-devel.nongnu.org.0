Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE93C42FB3C
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 20:43:44 +0200 (CEST)
Received: from localhost ([::1]:37238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSBE-00068M-1U
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 14:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS2I-0003Q9-9E
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:34:31 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:35589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbS2G-0001Ts-Oi
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 14:34:30 -0400
Received: by mail-ua1-x92e.google.com with SMTP id q13so19878295uaq.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 11:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DBsUjE5AMaaQppByc5rAnQOne/ZU1d2Jk2PzOjVrI4M=;
 b=qVb8p/1wHAfkeuYqVK5zHWcM1nHjMpMpkEw6UkpQLr0ayMmtH5SfksH37dvOKp4/jX
 emIMU/vRERGi9GtVFgYdp67FIQi/1dN+aHxRg3blE1tZk5CNpA/o8EagPpAaGlKYIzZe
 URfpXA2Rg+K5apHdUV5DyBqw7W5ewrhjbLUJCSMIS5cK0VlYI4rEJyCcgx+tIudzhwNL
 yjgj9L7THlsIooSHloHEFLR0J9ch9nLPG8AEhXR4GRJKG8+CfVZzolrcC1lF0u54lmk2
 vchvRiNJfv3E1dEIaC7S2q+QpASxKzxVAAdMzLz2Lpe2pzsYA8Ezliojj8TvR4d4sBn1
 Ytqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DBsUjE5AMaaQppByc5rAnQOne/ZU1d2Jk2PzOjVrI4M=;
 b=GtHRWgZK92s8yXXqmUhvxGPpBqakha0zaxlvNCb6v6se4Z9dx6rbBmBRpVq9yePZ08
 ncOhwJkQ0YyV0xWcRhD5xU+9gSfj4vaKXf+DoH69WxlFZdhM4j1ak5bV7NygbM3xReHN
 U+4aWjSiyxlc/eaMWptJGSX84QL7hyvhGBBfMmnc8IywoBHDzkIg3RkZ1Bp6zdq3m0tl
 1e0RjwCnqAHaUDjW856KxwSc13g1jzYSgFKSw0O9nh+yVZFeCZ8BbLskQYkzS1g7CHKm
 tb1My4lQvEVJOJE2DsDbB4Pplp/kFmNpD5M1AVF41ndWkepokprkVal3BlKq4zPRRUkE
 ao5g==
X-Gm-Message-State: AOAM531/bOKm7PO8rw1pWCJPTr3h1XsP4GMtJIwQieQqzSKtNli4Cxvf
 vzERyzQ6ehlznLTGby3guCQRPem+ICW9bcJSap4v2A==
X-Google-Smtp-Source: ABdhPJzI610wbGghZktI9ydalEIaN8ARGx+xfg+vsqpxvn9yZb3XrZJaku6d92auH7u/FwwsMLFvO2wRN/6Hpox4XsI=
X-Received: by 2002:a67:fc8b:: with SMTP id x11mr15794175vsp.12.1634322867917; 
 Fri, 15 Oct 2021 11:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-23-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-23-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 12:34:17 -0600
Message-ID: <CANCZdfpyiJnSZZQ=7ukvHZ5qc5jo4ujT_JbOsxWrE7xvWNsC8g@mail.gmail.com>
Subject: Re: [PATCH v5 22/67] target/arm: Use cpu_loop_exit_sigsegv for mte
 tag lookup
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fda8f305ce68716b"
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

--000000000000fda8f305ce68716b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 14, 2021 at 10:11 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Use the new os interface for raising the exception,
> rather than calling arm_cpu_tlb_fill directly.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/mte_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
> index 724175210b..e09b7e46a2 100644
> --- a/target/arm/mte_helper.c
> +++ b/target/arm/mte_helper.c
> @@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env,
> int ptr_mmu_idx,
>      uintptr_t index;
>
>      if (!(flags & (ptr_access =3D=3D MMU_DATA_STORE ? PAGE_WRITE_ORG :
> PAGE_READ))) {
> -        /* SIGSEGV */
> -        arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
> -                         ptr_mmu_idx, false, ra);
> -        g_assert_not_reached();
> +        cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_access,
> +                              !(flags & PAGE_VALID), ra);
>      }
>
>      /* Require both MAP_ANON and PROT_MTE for the page. */
> --
> 2.25.1
>
>

--000000000000fda8f305ce68716b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:11 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Use the new os interface for raising the exception,<br>
rather than calling arm_cpu_tlb_fill directly.<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0target/arm/mte_helper.c | 6 ++----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br></blockquote><div>=
<br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdi=
mp.com">imp@bsdimp.com</a>&gt;</div></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c<br>
index 724175210b..e09b7e46a2 100644<br>
--- a/target/arm/mte_helper.c<br>
+++ b/target/arm/mte_helper.c<br>
@@ -84,10 +84,8 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int=
 ptr_mmu_idx,<br>
=C2=A0 =C2=A0 =C2=A0uintptr_t index;<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (!(flags &amp; (ptr_access =3D=3D MMU_DATA_STORE ? P=
AGE_WRITE_ORG : PAGE_READ))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* SIGSEGV */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, =
ptr_access,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ptr_mmu_idx, false, ra);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_assert_not_reached();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_sigsegv(env_cpu(env), ptr, ptr_a=
ccess,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !(flags &amp; PAGE_VALID), ra);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Require both MAP_ANON and PROT_MTE for the page. */<=
br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000fda8f305ce68716b--

