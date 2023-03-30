Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7046D0FF0
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 22:23:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phymF-00027u-6o; Thu, 30 Mar 2023 16:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phymD-00027E-Ea
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 16:21:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1phymA-0006j2-Bs
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 16:21:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id y4so81413638edo.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680207689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GkWVAJlvqCL8AOYL044L7LO1MKVoq6fjRUEAS5j/cTY=;
 b=UOt40J/7GP8TcfuqEDGf/b5hSNsJuoQZhr+B3dFyFGqJ86Ez51xmotnGFoGZIDdriu
 xZemF5mxK9rRtyaXA9GyWEkR4YcN4mZ22sM/oTGh3bAHs7y5/DjopmIh9rrLlCfbkS8u
 vpUKusoJL7WT3eWuhc1ocu7W+SGUWSQD7GZw7UkXvNdIwoEz4ppuEDwgek2m0bDlvRjR
 s8joraZRbY2w8hYaVgKAHbYGRaxh/RwtVo9ZX6OVtDgqFsCZ1ptP4Djy+zXHK6gzwH3z
 FWUSnH9qRzaO/nweiZ3ZQ4audO6bXuJB+M3AnwCfeeEgr12FmRe3kyhfrpo+aKrDkFra
 7ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680207689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkWVAJlvqCL8AOYL044L7LO1MKVoq6fjRUEAS5j/cTY=;
 b=ApEJjraSCWzK0NtroRCI1GVP+aTNlROtVyXTrkLavISfBCe1+i2mq1oG+smUjxdKFX
 z3nExrxtzL7HVkegCosvDZfRTEzPSimbNWPrHvEkxdV49VRgVdFeS0c7zKKRTt7ItOsH
 AlDuI9Kv8uRVky8OMtUmoQl87Iv6Mgnb+AgS4tNfwqv8Utses6sdoMPjO+XkS06p60Dy
 mtyttlPtRJPm3VGaXkxeW50/JEdHIjfBVxHRKaA2ljURooU0HDt64evelHSuvNE3J+Gp
 8XfpSTh5trXwQonky7XdqoEDOgX8DJfOuAJlN5gwwbF0m59MwKihWm8ab+vc9OLu/rY/
 VIsQ==
X-Gm-Message-State: AAQBX9fgKt4+WroMMMupvw+qSnhDyEUgNbDA8n/UHvEaLbYeYKSZ665V
 XaSPTMT/sxqikjGfdoZpKC0RCeLtcaj3rvtxvfqL+g==
X-Google-Smtp-Source: AKy350bTGy+8G73MwUuIOTgYGrx/l7gU8qgJByrhI/4YM3Taem9Qpfer9UuG01m2/6YuWGSHWb1thXUa1QDtVQEs4hU=
X-Received: by 2002:a05:6402:a47:b0:502:3e65:44f7 with SMTP id
 bt7-20020a0564020a4700b005023e6544f7mr4275784edb.3.1680207689289; Thu, 30 Mar
 2023 13:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230330101900.2320380-1-peter.maydell@linaro.org>
In-Reply-To: <20230330101900.2320380-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Thu, 30 Mar 2023 13:21:19 -0700
Message-ID: <CAFXwXrnYWD967nATYA+YAVdxmfvh3jQs-=6-Re34_HAqY+xLQA@mail.gmail.com>
Subject: Re: [PATCH v2 for-8.0] target/arm: Fix generated code for cpreg reads
 when HSTR is active
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000785bee05f823d6d8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000785bee05f823d6d8
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

On Thu, 30 Mar 2023, 03:19 Peter Maydell, <peter.maydell@linaro.org> wrote:

> In commit 049edada we added some code to handle HSTR_EL2 traps, which
> we did as an inline "conditionally branch over a
> gen_exception_insn()".  Unfortunately this fails to take account of
> the fact that gen_exception_insn() will set s->base.is_jmp to
> DISAS_NORETURN.  That means that at the end of the TB we won't
> generate the necessary code to handle the "branched over the trap and
> continued normal execution" codepath.  The result is that the TCG
> main loop thinks that we stopped execution of the TB due to a
> situation that only happens when icount is enabled, and hits an
> assertion. Explicitly set is_jmp back to DISAS_NEXT so we generate
> the correct code for when execution continues past this insn.
>
> Note that this only happens for cpreg reads; writes will call
> gen_lookup_tb() which generates a valid end-of-TB.
>
> Fixes: 049edada ("target/arm: Make HSTR_EL2 traps take priority over
> UNDEF-at-EL1")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1551
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2: just unconditionally set is_jmp to DISAS_NEXT.
> ---
>  target/arm/tcg/translate.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index 2cb9368b1ba..3c8401e9086 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -4623,6 +4623,12 @@ static void do_coproc_insn(DisasContext *s, int
> cpnum, int is64,
>              tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
>
>              gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
> +            /*
> +             * gen_exception_insn() will set is_jmp to DISAS_NORETURN,
> +             * but since we're conditionally branching over it, we want
> +             * to assume continue-to-next-instruction.
> +             */
> +            s->base.is_jmp = DISAS_NEXT;
>              set_disas_label(s, over);
>          }
>      }
> --
> 2.34.1
>
>

--000000000000785bee05f823d6d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:rich=
ard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;<br><br><div =
data-smartmail=3D"gmail_signature">r~</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 30 Mar 2023, 03:19 Peter=
 Maydell, &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">In commit 04=
9edada we added some code to handle HSTR_EL2 traps, which<br>
we did as an inline &quot;conditionally branch over a<br>
gen_exception_insn()&quot;.=C2=A0 Unfortunately this fails to take account =
of<br>
the fact that gen_exception_insn() will set s-&gt;base.is_jmp to<br>
DISAS_NORETURN.=C2=A0 That means that at the end of the TB we won&#39;t<br>
generate the necessary code to handle the &quot;branched over the trap and<=
br>
continued normal execution&quot; codepath.=C2=A0 The result is that the TCG=
<br>
main loop thinks that we stopped execution of the TB due to a<br>
situation that only happens when icount is enabled, and hits an<br>
assertion. Explicitly set is_jmp back to DISAS_NEXT so we generate<br>
the correct code for when execution continues past this insn.<br>
<br>
Note that this only happens for cpreg reads; writes will call<br>
gen_lookup_tb() which generates a valid end-of-TB.<br>
<br>
Fixes: 049edada (&quot;target/arm: Make HSTR_EL2 traps take priority over U=
NDEF-at-EL1&quot;)<br>
Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1551" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-proje=
ct/qemu/-/issues/1551</a><br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
" target=3D"_blank" rel=3D"noreferrer">peter.maydell@linaro.org</a>&gt;<br>
---<br>
v1-&gt;v2: just unconditionally set is_jmp to DISAS_NEXT.<br>
---<br>
=C2=A0target/arm/tcg/translate.c | 6 ++++++<br>
=C2=A01 file changed, 6 insertions(+)<br>
<br>
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c<br>
index 2cb9368b1ba..3c8401e9086 100644<br>
--- a/target/arm/tcg/translate.c<br>
+++ b/target/arm/tcg/translate.c<br>
@@ -4623,6 +4623,12 @@ static void do_coproc_insn(DisasContext *s, int cpnu=
m, int is64,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_brcondi_i32(TCG_CON=
D_EQ, t, 0, over.label);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_exception_insn(s, 0, EX=
CP_UDEF, syndrome);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* gen_exception_insn() wil=
l set is_jmp to DISAS_NORETURN,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* but since we&#39;re cond=
itionally branching over it, we want<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to assume continue-to-ne=
xt-instruction.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;base.is_jmp =3D DISAS_NEXT=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_disas_label(s, over);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000785bee05f823d6d8--

