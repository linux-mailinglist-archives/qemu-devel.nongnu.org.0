Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100C742FBDE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:18:53 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSjE-0003oa-4W
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSZQ-000312-IH
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:08:44 -0400
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mbSZO-00057W-Pj
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:08:44 -0400
Received: by mail-vk1-xa2e.google.com with SMTP id l39so5642364vkd.7
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TclIhQhNcohQXEz/hBuvLsBhnv9LMDZSapl7lCucjME=;
 b=2/8GkCCovcnwnleK1exJKnWUNf3i2xYyDeAtNmZuT1PAyhwM9EpArXS80eDxppbcFu
 PuoAEiQ28HYG9uccWZjdNfMX/eS5pO7oABGU3+oDaFUNRGA0C+6k+4o4w72pzi5hBmiS
 rPChKGj1cftHlozwWAaUJqEXPECpkhi3BOaDaeDDZn8NRQX4GJdry7/uICoq5/nWqNAF
 1Ei8MHlK6ASehEfJ5h3XgWi/w7f3103321Sguag3H9ThdGsG0NWe82yu9TGA9juxskLz
 4eKyvBdgkkGNiRSN9wgB37KVan36I/Um/V2Bw/nVbSxdR1Qk/7zxBPg63Q1Aoelcafo6
 JmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TclIhQhNcohQXEz/hBuvLsBhnv9LMDZSapl7lCucjME=;
 b=U2joEMshhxE+KweyLmAwKeonSdVTQkvwfOpUhNBla+fDNI0XyYLqKUecvQer1Ife1u
 5sGiDMMf2Sx7413azDG24lZHUlod+UAF7C/dE2CKymplET6UVw62L+VWCyc5M39l4A4o
 1kDlbXSetqx7UV85vL/zjhwnCX++TwI+S11sSh+LQxiOTiGUuucXXuexpEtKeQAu7b7N
 8vAuCaVplJx75pzQC87fYHzgZoNxeVz/9FfUyJ0xt7GlY7tgBx/2dQ4T3Dr+bZAFd3mF
 o7cXNV8bcaqW4Csq3w6JQC/rP5j8+4Om86gBItxso25ITiXIdOoz0nB0yvLWqL81YTra
 cSyQ==
X-Gm-Message-State: AOAM533o8PJkQH1nBshIOxSuuwu735lvMtf6gTsp/tQiOkrg/XsMYG+m
 UE76kbx54KbL9BX4wZiA00RjnJQmbE9QcfQ61dmcOg==
X-Google-Smtp-Source: ABdhPJxNTfsNiYlSeoVlHAax9Kqj8KP1z8oY6kLi0JWrLbgOwNSPeiRaqrB1MFzI11KttdbPxrujU7Rw8oXB09bXu7Q=
X-Received: by 2002:a1f:2d83:: with SMTP id t125mr14127830vkt.23.1634324921788; 
 Fri, 15 Oct 2021 12:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
 <20211015041053.2769193-60-richard.henderson@linaro.org>
In-Reply-To: <20211015041053.2769193-60-richard.henderson@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 15 Oct 2021 13:08:30 -0600
Message-ID: <CANCZdfp0t_2E8Pvnxfz1d-ppEKkfbALgfD+-UzvudZwz1ivJPQ@mail.gmail.com>
Subject: Re: [PATCH v5 59/67] accel/tcg: Report unaligned load/store for
 user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000006940f705ce68eccb"
Received-SPF: none client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006940f705ce68eccb
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 14, 2021 at 10:14 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> Use the new cpu_loop_exit_sigbus for cpu_mmu_lookup.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/user-exec.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>

Reviewed-by: Warner Losh <imp@bsdimp.com>



> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 92cbffd7c6..7d50dd54f6 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -220,9 +220,14 @@ static void validate_memop(MemOpIdx oi, MemOp
> expected)
>  static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,
>                              MemOpIdx oi, uintptr_t ra, MMUAccessType type)
>  {
> +    MemOp mop = get_memop(oi);
> +    int a_bits = get_alignment_bits(mop);
>      void *ret;
>
> -    /* TODO: Enforce guest required alignment.  */
> +    /* Enforce guest required alignment.  */
> +    if (unlikely(addr & ((1 << a_bits) - 1))) {
> +        cpu_loop_exit_sigbus(env_cpu(env), addr, type, ra);
> +    }
>
>      ret = g2h(env_cpu(env), addr);
>      set_helper_retaddr(ra);
> --
> 2.25.1
>
>

--0000000000006940f705ce68eccb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 14, 2021 at 10:14 PM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Use the new cpu_loop_exit_sigbus for cpu_mmu_lookup.<br>
<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@li=
naro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
---<br>
=C2=A0accel/tcg/user-exec.c | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br></blockquote><div><=
br></div><div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdim=
p.com">imp@bsdimp.com</a>&gt;</div><div><br></div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c<br>
index 92cbffd7c6..7d50dd54f6 100644<br>
--- a/accel/tcg/user-exec.c<br>
+++ b/accel/tcg/user-exec.c<br>
@@ -220,9 +220,14 @@ static void validate_memop(MemOpIdx oi, MemOp expected=
)<br>
=C2=A0static void *cpu_mmu_lookup(CPUArchState *env, target_ulong addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MemOpIdx oi, uintptr_t ra, MMUAccessType typ=
e)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 MemOp mop =3D get_memop(oi);<br>
+=C2=A0 =C2=A0 int a_bits =3D get_alignment_bits(mop);<br>
=C2=A0 =C2=A0 =C2=A0void *ret;<br>
<br>
-=C2=A0 =C2=A0 /* TODO: Enforce guest required alignment.=C2=A0 */<br>
+=C2=A0 =C2=A0 /* Enforce guest required alignment.=C2=A0 */<br>
+=C2=A0 =C2=A0 if (unlikely(addr &amp; ((1 &lt;&lt; a_bits) - 1))) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_loop_exit_sigbus(env_cpu(env), addr, type,=
 ra);<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D g2h(env_cpu(env), addr);<br>
=C2=A0 =C2=A0 =C2=A0set_helper_retaddr(ra);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000006940f705ce68eccb--

