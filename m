Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B0F4E8BAB
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 03:37:57 +0200 (CEST)
Received: from localhost ([::1]:55908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYeKS-0001zy-DV
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 21:37:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nYeIg-0008AO-Qq
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 21:36:06 -0400
Received: from [2607:f8b0:4864:20::102f] (port=52762
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1nYeIW-0003Yx-P8
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 21:35:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id v4so12613093pjh.2
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 18:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CS7YjClUxBKvZsHCNVXDOr+DUz4LxewTxlbg+rFxMi4=;
 b=BI7paOPd5ZdlFX4K6Y+UPMVhFTLW2f5+REWsOLaVBVqdlOH0Ys1C+AxxYX+7tYoirW
 zR5ysoGy9h4N1Jkio96OgkxHaYHVU31o6Db3vTow0UjDIkytGZ1gehivimX4sV6hFq7Z
 N3WN5UTH1l78HPSmhdoxNHU9RNmOuWO5aP/U+L2z/VYOo7T7YFWa1+Lyd0+SZOwe5kOO
 nyRL4Wjy0N69fm/Zrv2oJDEyT1EKYWrk6m1wUIAE21fY9HdP6rT8f/Kgx5r441ZRnjR/
 iqSH0U36DiTha/E0PQ8x9OKNQ9dCWhaFrZRfeodmwPZn6iFkYo1oCtauvkI7NsW/o8GF
 XgDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CS7YjClUxBKvZsHCNVXDOr+DUz4LxewTxlbg+rFxMi4=;
 b=G6cA1Xi080xUd/9KJvZMW9A26EX+HGvKjGRPZ4cNwHJSLc6OTDdm3xICbRGsJNiXUK
 On6qhAj13uS8k8F4v11MXY4U6xEF7JW8skfrv5bpLL4vqwdugxp7L+Bcq4UcfLOtIlNk
 SOtm9aEwhtZQvRTQpwM7cLeLoKEQf9Ah2r9/ILOuGkQO2SayuWn7pV9jQRfwTR6w2u/X
 U+kRtul6Tb08Va+dEpiSMQoWgEGAhS195J1myWTjZYjMxPkiF5hgVRPN0QveGyyYx4vn
 VmnXel2MDk5aFnMw9YXP7YmIlkvS0hN4byGnRbyi9+U/3rNsS6vwiaaVYX6GQ1z0otNn
 l9HA==
X-Gm-Message-State: AOAM532kGx/XYHVhQRvtF3kn1O+bMQPuHFcR163+wLRrTNUjRr98E15A
 5v8YePxMRTFzu3Vq0FxTPXnuyMv9llha5g==
X-Google-Smtp-Source: ABdhPJxRMKTOztAP7Ha+PDuP410tZDC4qyF+KhNlDUWN/hitJEhCmcwWqei19SWmjnZJ4/m+nQoc0g==
X-Received: by 2002:a17:90b:3846:b0:1c6:841b:7470 with SMTP id
 nl6-20020a17090b384600b001c6841b7470mr26450891pjb.193.1648431354661; 
 Sun, 27 Mar 2022 18:35:54 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com.
 [209.85.216.44]) by smtp.gmail.com with ESMTPSA id
 p128-20020a625b86000000b004fa666a1327sm13503870pfb.102.2022.03.27.18.35.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 18:35:54 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id
 p4-20020a17090ad30400b001c7ca87c05bso8573136pju.1; 
 Sun, 27 Mar 2022 18:35:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8b:b0:1c7:386b:4811 with SMTP id
 ng11-20020a17090b1a8b00b001c7386b4811mr26750828pjb.4.1648431353538; Sun, 27
 Mar 2022 18:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648270894.git.research_trasio@irq.a4lg.com>
 <dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com>
 <CAKmqyKPGkdOJAXZjSKvk23RaNY01ZpUziG7hCHyc+0YbOqzstQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPGkdOJAXZjSKvk23RaNY01ZpUziG7hCHyc+0YbOqzstQ@mail.gmail.com>
From: Frank Chang <frank.chang@sifive.com>
Date: Mon, 28 Mar 2022 09:35:42 +0800
X-Gmail-Original-Message-ID: <CANzO1D2aqq3mqRbRO-TazHBP-NkG4YvDAcBpF4WHeSr98W=+3A@mail.gmail.com>
Message-ID: <CANzO1D2aqq3mqRbRO-TazHBP-NkG4YvDAcBpF4WHeSr98W=+3A@mail.gmail.com>
Subject: Re: [PATCH (PING) 1/1] target/riscv: misa to ISA string conversion fix
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000043aeba05db3d559f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000043aeba05db3d559f
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 28, 2022 at 7:30 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Sat, Mar 26, 2022 at 3:46 PM Tsukasa OI <research_trasio@irq.a4lg.com>
> wrote:
> >
> > Some bits in RISC-V `misa' CSR should not be reflected in the ISA
> > string.  For instance, `S' and `U' (represents existence of supervisor
> > and user mode, respectively) in `misa' CSR must not be copied since
> > neither `S' nor `U' are valid single-letter extensions.
>
> Thanks for the patch.
>
> >
> > This commit restricts which bits to copy from `misa' CSR to ISA string
> > with another fix: `C' extension should be preceded by `L' extension.
>
> The L extension has been removed, so it probably makes more sense to
> just remove it at this stage instead of fixing the order.
>
> >
> > It also clarifies that RISC-V extension order string is actually a
> > single-letter extension order list.
> >
> > Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> > ---
> >  target/riscv/cpu.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ddda4906ff..84877cf24a 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -34,7 +34,7 @@
> >
> >  /* RISC-V CPU definitions */
> >
> > -static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> > +static const char riscv_single_letter_exts[] = "IEMAFDQLCBJTPVNH";
>
> What about K?
>
> Why not use IEMAFDQCBKJTPVNH instead?
>
> Alistair
>

The RISC-V ISA Manual (version 20191213) is quite old.
Where "L" was not removed and "K" was not introduced.
It seems Unprivileged spec is not "ratified" as often as Privileged spec
does (most of them are drafts...).

But I agree that it's better to remove "L" and add "K" into ISA string.

Regards,
Frank Chang


>
> >
> >  const char * const riscv_int_regnames[] = {
> >    "x0/zero", "x1/ra",  "x2/sp",  "x3/gp",  "x4/tp",  "x5/t0",   "x6/t1",
> > @@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c,
> void *data)
> >  char *riscv_isa_string(RISCVCPU *cpu)
> >  {
> >      int i;
> > -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
> > +    const size_t maxlen = sizeof("rv128") +
> sizeof(riscv_single_letter_exts);
> >      char *isa_str = g_new(char, maxlen);
> >      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d",
> TARGET_LONG_BITS);
> > -    for (i = 0; i < sizeof(riscv_exts); i++) {
> > -        if (cpu->env.misa_ext & RV(riscv_exts[i])) {
> > -            *p++ = qemu_tolower(riscv_exts[i]);
> > +    for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
> > +        if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
> > +            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
> >          }
> >      }
> >      *p = '\0';
> > --
> > 2.32.0
> >
> >
>
>

--00000000000043aeba05db3d559f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 28, 2022 at 7:30 AM Alistair =
Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.com</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Sat, Mar 26, 2022 at 3:46 PM Tsukasa OI &lt;<a h=
ref=3D"mailto:research_trasio@irq.a4lg.com" target=3D"_blank">research_tras=
io@irq.a4lg.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Some bits in RISC-V `misa&#39; CSR should not be reflected in the ISA<=
br>
&gt; string.=C2=A0 For instance, `S&#39; and `U&#39; (represents existence =
of supervisor<br>
&gt; and user mode, respectively) in `misa&#39; CSR must not be copied sinc=
e<br>
&gt; neither `S&#39; nor `U&#39; are valid single-letter extensions.<br>
<br>
Thanks for the patch.<br>
<br>
&gt;<br>
&gt; This commit restricts which bits to copy from `misa&#39; CSR to ISA st=
ring<br>
&gt; with another fix: `C&#39; extension should be preceded by `L&#39; exte=
nsion.<br>
<br>
The L extension has been removed, so it probably makes more sense to<br>
just remove it at this stage instead of fixing the order.<br>
<br>
&gt;<br>
&gt; It also clarifies that RISC-V extension order string is actually a<br>
&gt; single-letter extension order list.<br>
&gt;<br>
&gt; Signed-off-by: Tsukasa OI &lt;<a href=3D"mailto:research_trasio@irq.a4=
lg.com" target=3D"_blank">research_trasio@irq.a4lg.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/riscv/cpu.c | 10 +++++-----<br>
&gt;=C2=A0 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
&gt; index ddda4906ff..84877cf24a 100644<br>
&gt; --- a/target/riscv/cpu.c<br>
&gt; +++ b/target/riscv/cpu.c<br>
&gt; @@ -34,7 +34,7 @@<br>
&gt;<br>
&gt;=C2=A0 /* RISC-V CPU definitions */<br>
&gt;<br>
&gt; -static const char riscv_exts[26] =3D &quot;IEMAFDQCLBJTPVNSUHKORWXYZG=
&quot;;<br>
&gt; +static const char riscv_single_letter_exts[] =3D &quot;IEMAFDQLCBJTPV=
NH&quot;;<br>
<br>
What about K?<br>
<br>
Why not use IEMAFDQCBKJTPVNH instead?<br>
<br>
Alistair<br></blockquote><div><br></div><div>The RISC-V ISA Manual (version=
 20191213) is quite old.</div><div>Where &quot;L&quot; was not removed and =
&quot;K&quot; was not introduced.</div><div>It seems Unprivileged spec is n=
ot &quot;ratified&quot; as often as Privileged spec does (most of them are =
drafts...).</div><div><br></div><div>But I agree that it&#39;s better to re=
move &quot;L&quot; and add &quot;K&quot; into=C2=A0ISA string.</div><div><b=
r></div><div>Regards,</div><div>Frank Chang</div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;=C2=A0 const char * const riscv_int_regnames[] =3D {<br>
&gt;=C2=A0 =C2=A0 &quot;x0/zero&quot;, &quot;x1/ra&quot;,=C2=A0 &quot;x2/sp=
&quot;,=C2=A0 &quot;x3/gp&quot;,=C2=A0 &quot;x4/tp&quot;,=C2=A0 &quot;x5/t0=
&quot;,=C2=A0 =C2=A0&quot;x6/t1&quot;,<br>
&gt; @@ -901,12 +901,12 @@ static void riscv_cpu_class_init(ObjectClass *c,=
 void *data)<br>
&gt;=C2=A0 char *riscv_isa_string(RISCVCPU *cpu)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; -=C2=A0 =C2=A0 const size_t maxlen =3D sizeof(&quot;rv128&quot;) + siz=
eof(riscv_exts) + 1;<br>
&gt; +=C2=A0 =C2=A0 const size_t maxlen =3D sizeof(&quot;rv128&quot;) + siz=
eof(riscv_single_letter_exts);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *isa_str =3D g_new(char, maxlen);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 char *p =3D isa_str + snprintf(isa_str, maxlen, &q=
uot;rv%d&quot;, TARGET_LONG_BITS);<br>
&gt; -=C2=A0 =C2=A0 for (i =3D 0; i &lt; sizeof(riscv_exts); i++) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.misa_ext &amp; RV(riscv_e=
xts[i])) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =3D qemu_tolower(riscv=
_exts[i]);<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; sizeof(riscv_single_letter_exts) -=
 1; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;env.misa_ext &amp; RV(riscv_s=
ingle_letter_exts[i])) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *p++ =3D qemu_tolower(riscv=
_single_letter_exts[i]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *p =3D &#39;\0&#39;;<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--00000000000043aeba05db3d559f--

