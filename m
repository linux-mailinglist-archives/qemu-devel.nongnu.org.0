Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7D65683C0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:42:44 +0200 (CEST)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91YR-0004L2-K5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o90rN-0002PG-Cr
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:58:13 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:43782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o90rK-0006ao-TH
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:58:12 -0400
Received: by mail-lj1-x22a.google.com with SMTP id q8so5149708ljj.10
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrzlw4sP09oI5s1ibV3/VARLEtTuy4IdhDnkS+MuO34=;
 b=FwtX+vaXkpIpVGq6ejfekXyAgYmhUmYT85mcEkFcU+x7MkrgkS5kQ+16VirTs+HwRK
 p2mfj/bdRgCpqJbBoJWy0fURJCbhdjqcoTSxdec1h9vY1Qbsp1dTHELaVfWHXJ00QgpU
 Y6jiJQA6znL4h4UD3xcjrvn0ZXM4XbHQxLI+A0V5qRONKLFSCFtF9IvlevaUXAwAaGzZ
 MdrOJTYxByHDPRa3b2Y4rX7bo2sIeo5ms5wndDL+ePw3HNo6ttGT9hKPF4o/mMSJiD/w
 jMrLe8s5glr4k3SC3wMyVjCURFHNdU7sP4HnhaTouE3jcxgvKAxWQ6ugzqzfjJfuIq7j
 0SkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrzlw4sP09oI5s1ibV3/VARLEtTuy4IdhDnkS+MuO34=;
 b=IyKpzIsZyepQbzX1X8/r9NmQDxoEMR+1VQXWG/doBtA3yevAGqCaycE4QpS62xoyZ8
 V6UsiblA0RSjRu/3dTiunsMe4yyVYq5CF/w+tHrI4D/3icmZH8y6t97xxiROJz3vIPVC
 JnuuVjRSsmIBVu+3+W8pCoMVTgbyN1tzzYxTp3pctcj7y0hKFMUsJ+pDO1cKXhMfUS8Q
 3vCFmPp1R+ysXGUS8peed3KIhrd9Kp1kScKpI+ZIwfaxKudgwrz9EBHtJF4VyuT3aPVu
 DUu2uK4UtF8u+MC1edL6MmW03kV431ckL8hBuPzz64uoFT7cd2PgD1z7egon1GVGz+WK
 HT+A==
X-Gm-Message-State: AJIora89qy3N5EYmSaosIPh5YQAHRRYtqZ1cpaWJhyIGyi4lakHgjLql
 VUXvZARsMi6SsUtW0pcX8KfdzEu1/fql5UlvOnY=
X-Google-Smtp-Source: AGRyM1tgLL3wjHHdJKcbs5mq/PyNlQvKKgIYOK9serukrp+glUpKHi6UrHnFtZ587CM8pjnIVbn49xN/DOLX1v+U+T0=
X-Received: by 2002:a2e:9847:0:b0:25a:9ffe:da8 with SMTP id
 e7-20020a2e9847000000b0025a9ffe0da8mr23861071ljj.516.1657097888911; Wed, 06
 Jul 2022 01:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220704023618.626849-1-pizhenwei@bytedance.com>
 <20220704023618.626849-2-pizhenwei@bytedance.com>
 <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
 <1b3f926b-9fe6-a3ec-b697-6fa8471510ad@bytedance.com>
 <d43a478f-e54b-e624-8c67-2392bf3d3dbb@bytedance.com>
 <CAJ+F1CKpTz4pNKX9XdZER70wrgYkNmHTzhhWB69O1SS1kS-zrg@mail.gmail.com>
 <c420494e-52c1-e83f-c959-d4eb69799bd8@bytedance.com>
In-Reply-To: <c420494e-52c1-e83f-c959-d4eb69799bd8@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 6 Jul 2022 12:57:57 +0400
Message-ID: <CAJ+F1CL-=JYVhMJM4CNMhfrJsvu0vjfnxNOPvtVGkWR=m+X1vw@mail.gmail.com>
Subject: Re: Re: [PATCH v2 1/1] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000006d5b805e31f2bc1"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000006d5b805e31f2bc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Jul 6, 2022 at 11:49 AM zhenwei pi <pizhenwei@bytedance.com> wrote:

>
>
> On 7/6/22 15:20, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Wed, Jul 6, 2022 at 7:09 AM zhenwei pi <pizhenwei@bytedance.com
> > <mailto:pizhenwei@bytedance.com>> wrote:
> >
> >     On 7/4/22 16:00, zhenwei pi wrote:
> >      >
> >      >
> >      >>     +##
> >      >>     +# @GuestOsType:
> >      >>     +#
> >      >>     +# An enumeration of OS type
> >      >>     +#
> >      >>     +# Since: 7.1
> >      >>     +##
> >      >>     +{ 'enum': 'GuestOsType',
> >      >>     +  'data': [ 'linuxos', 'windowsos' ] }
> >      >>
> >      >>
> >      >> I would rather keep this enum specific to GuestCpuStats,
> >      >> "GuestLinuxCpuStatsType"?
> >      >>
> >      >
> >      > Hi,
> >      >
> >      > 'GuestOsType' may be re-used in the future, not only for the CPU
> >      > statistics case.
> >      >
> >      >> I would also drop the "os" suffix
> >      >>
> >      > I'm afraid we can not drop "os" suffix, build this without "os"
> >     suffix:
> >      > qga/qga-qapi-types.h:948:28: error: expected member name or ';'
> >     after
> >      > declaration specifiers
> >      >          GuestLinuxCpuStats linux;
> >      >          ~~~~~~~~~~~~~~~~~~ ^
> >      > <built-in>:336:15: note: expanded from here
> >      > #define linux 1
> >      >
> >
> >     Hi, Marc
> >
> >     Could you please give any hint about this issue?
> >
> >
> > Yes, it looks like we need to add "linux" to the "polluted_words":
> >
>
> OK, I'll fix this in the next versoin.
>
> By the way, 'GuestCpuStatsType' seems to be used for CPU statistics
> only, but 'data': [ 'linux', 'windows' ] } is quite common, it may be
> used for other OS specified commands in the future. Should I use
> 'GuestCpuStatsType' instead of 'GuestOsType'?
>

We can always generalize later, but for now I think this may just create
confusion on the usage of the enum, I'd make it GuestCpuStatsType for now.

(for example GuestOSInfo can't use GuestOsType)


>
> > diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> > index 489273574aee..737b059e6291 100644
> > --- a/scripts/qapi/common.py
> > +++ b/scripts/qapi/common.py
> > @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -> st=
r:
> >                        'and', 'and_eq', 'bitand', 'bitor', 'compl',
> 'not',
> >                        'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
> >       # namespace pollution:
> > -    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386'])
> > +    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386',
> > 'linux'])
> >
> >
> >      >>     +
> >      >>     +
> >      >>
> >      >>
> >      >>
> >      >> Looks good to me otherwise.
> >      >> thanks
> >      >>
> >      >> --
> >      >> Marc-Andr=C3=A9 Lureau
> >      >
> >
> >     --
> >     zhenwei pi
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>
> --
> zhenwei pi
>


--=20
Marc-Andr=C3=A9 Lureau

--00000000000006d5b805e31f2bc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 6, 2022 at 11:49 AM zhe=
nwei pi &lt;<a href=3D"mailto:pizhenwei@bytedance.com">pizhenwei@bytedance.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><br>
<br>
On 7/6/22 15:20, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Wed, Jul 6, 2022 at 7:09 AM zhenwei pi &lt;<a href=3D"mailto:pizhen=
wei@bytedance.com" target=3D"_blank">pizhenwei@bytedance.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:pizhenwei@bytedance.com" target=3D"_blank=
">pizhenwei@bytedance.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 7/4/22 16:00, zhenwei pi wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +##<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +# @GuestOsType:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +# An enumeration of O=
S type<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +# Since: 7.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +##<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +{ &#39;enum&#39;: &#3=
9;GuestOsType&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +=C2=A0 &#39;data&#39;=
: [ &#39;linuxos&#39;, &#39;windowsos&#39; ] }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I would rather keep this enum specific to=
 GuestCpuStats,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; &quot;GuestLinuxCpuStatsType&quot;?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;GuestOsType&#39; may be re-used in the f=
uture, not only for the CPU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; statistics case.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; I would also drop the &quot;os&quot; suff=
ix<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I&#39;m afraid we can not drop &quot;os&quot;=
 suffix, build this without &quot;os&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0suffix:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; qga/qga-qapi-types.h:948:28: error: expected =
member name or &#39;;&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0after<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; declaration specifiers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 GuestLinuxCpuStats linux;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ~~~~~~~~~~~~~~~~~~ ^<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;built-in&gt;:336:15: note: expanded from =
here<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; #define linux 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi, Marc<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Could you please give any hint about this issue?<br=
>
&gt; <br>
&gt; <br>
&gt; Yes, it looks like we need to add &quot;linux&quot; to the &quot;pollu=
ted_words&quot;:<br>
&gt; <br>
<br>
OK, I&#39;ll fix this in the next versoin.<br>
<br>
By the way, &#39;GuestCpuStatsType&#39; seems to be used for CPU statistics=
 <br>
only, but &#39;data&#39;: [ &#39;linux&#39;, &#39;windows&#39; ] } is quite=
 common, it may be <br>
used for other OS specified commands in the future. Should I use <br>
&#39;GuestCpuStatsType&#39; instead of &#39;GuestOsType&#39;?<br></blockquo=
te><div><br></div><div>We can always generalize later, but for now I think =
this may just create confusion on the usage of the enum, I&#39;d make it Gu=
estCpuStatsType for now.</div><div><br></div><div>(for example GuestOSInfo =
can&#39;t use GuestOsType)<br></div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py<br>
&gt; index 489273574aee..737b059e6291 100644<br>
&gt; --- a/scripts/qapi/common.py<br>
&gt; +++ b/scripts/qapi/common.py<br>
&gt; @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -&gt=
; str:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;and&#39;, &#39;and_eq&#39;, &#39;bitand&#39;, &#39;bitor=
&#39;, &#39;compl&#39;, &#39;not&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &#39;not_eq&#39;, &#39;or&#39;, &#39;or_eq&#39;, &#39;xor&#39=
;, &#39;xor_eq&#39;])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# namespace pollution:<br>
&gt; - =C2=A0 =C2=A0polluted_words =3D set([&#39;unix&#39;, &#39;errno&#39;=
, &#39;mips&#39;, &#39;sparc&#39;, &#39;i386&#39;])<br>
&gt; + =C2=A0 =C2=A0polluted_words =3D set([&#39;unix&#39;, &#39;errno&#39;=
, &#39;mips&#39;, &#39;sparc&#39;, &#39;i386&#39;, <br>
&gt; &#39;linux&#39;])<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; =C2=A0=C2=A0=C2=A0 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Looks good to me otherwise.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; thanks<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Marc-Andr=C3=A9 Lureau<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0zhenwei pi<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
<br>
-- <br>
zhenwei pi<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000006d5b805e31f2bc1--

