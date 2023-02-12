Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AD9693933
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 18:54:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRGXP-0006Rw-0K; Sun, 12 Feb 2023 12:53:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRGXM-0006R6-2P
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 12:53:16 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pRGXJ-0002j1-QP
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 12:53:15 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ud5so26830737ejc.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 09:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WEJyhjlM6BxfVEM70e4b2Ur8XWpjL0eBz0in/YOy61M=;
 b=Ygky6EyGozZ2Yt9AqST/PXBQKlNR0JMQRUsTJckH0pY+YzTxl1is0ue4GOMlLyS9CV
 gdkWGhF0EhulTx1dsIpvehyFBVklxjuGfttJZbtv8nq4OylR/mcMpN1BNurzmCiBASMI
 GQecWyQXGQd2+BL/smNKBB81jTAYt8kluLDTwTuf2/6mMhOo2/N7Xkyw8PQFy0eQ88ce
 gtmFlknmFMAgCteynu3Kh8nb5+gVOkw+p39lnzhDaw48DhLf3wru4ab6AkFcc6XyshbB
 9YzVpHk+8HZoaIojuJe/Nf4vIJQ3EwjInzZE58U04DZIJuI3qkIS2x/nsf9Rllf5q+1A
 6Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WEJyhjlM6BxfVEM70e4b2Ur8XWpjL0eBz0in/YOy61M=;
 b=0NpcBScXW49XrKKZjZYrcM+mV6rpAC2AMTN8cYrjcjsEWa224FVnxpgcGZvnNHpJIX
 eUSoDWAZ7QFd1D2zyB6q20lSSEmnvTBsdkZWp9uHe0MCWoKI7u2u6RGK4Yh2frf8Limi
 X6sUL9icu5+9CFohk3XQHBygt8WgYYf8KvC8sx3N2ObHVsQ9RcsiAV7L1mQBUSFi/2BC
 6krJsByQbTkGlcjadm5nAmgWkY40x785VFdBrK4nocbIbmm4Zv2LpYNb3XJ37Wcqgbxw
 VZIhcaEjiJkzg/FLoEyDDSoZksOBwsCBlNdZA55UMoqP3SAn6N1NVCU9Hu5RNHCVnKvh
 DQAQ==
X-Gm-Message-State: AO0yUKVh3LQQvkc0rmuLZ6+xLL6IsbIJpDphYzJQXpyibTKS5ga1+caH
 2jyVWZpp6cCwuRLIborUSNYpOvaxT/M/fV0O/Cv4rw==
X-Google-Smtp-Source: AK7set+LaA50l1hyGYH0xC3LpsCeF25HNf9T0hogmaebMptMFW59zL/hl6OaxWa3Ay3K7R1bNxs7xYVdjRx2hr0VNn0=
X-Received: by 2002:a17:906:8403:b0:8b0:7c88:e869 with SMTP id
 n3-20020a170906840300b008b07c88e869mr1789396ejx.2.1676224390767; Sun, 12 Feb
 2023 09:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-8-imp@bsdimp.com>
 <3277df5d-7c6a-d33a-1cab-6506742c66db@linaro.org>
In-Reply-To: <3277df5d-7c6a-d33a-1cab-6506742c66db@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 12 Feb 2023 10:53:06 -0700
Message-ID: <CANCZdfoZm3QwOFMo-aSYhKjzdP-cuKrgtSaVnj9kq2kD0E2c3g@mail.gmail.com>
Subject: Re: [PATCH 7/9] bsd-user: do_freebsd_sysctl helper for sysctl(2)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juergen Lock <nox@jelal.kn-bremen.de>, 
 Stacey Son <sson@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000060382505f48467d4"
Received-SPF: none client-ip=2a00:1450:4864:20::62f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000060382505f48467d4
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 11, 2023 at 4:09 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/10/23 13:18, Warner Losh wrote:
> > +abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_t
> namelen,
> > +        abi_ulong oldp, abi_ulong oldlenp, abi_ulong newp, abi_ulong
> newlen)
> > +{
> > +    abi_long ret;
> > +    void *hnamep, *holdp = NULL, *hnewp = NULL;
> > +    size_t holdlen;
> > +    abi_ulong oldlen = 0;
> > +    int32_t *snamep = g_malloc(sizeof(int32_t) * namelen), *p, *q, i;
> > +
> > +    if (oldlenp) {
> > +        if (get_user_ual(oldlen, oldlenp)) {
> > +            return -TARGET_EFAULT;
> > +        }
> > +    }
>
> You need to check for write early.  Either access_ok, or lock_user.
>
> > +    for (p = hnamep, q = snamep, i = 0; i < namelen; p++, i++) {
> > +        *q++ = tswap32(*p);
> > +    }
>
> Why the inconsistent increments?
>

no reason... Fixed.


> > +    unlock_user(holdp, oldp, holdlen);
>
> Usually we don't want writeback on error.
>

Indeed. Fixed as well.. in the other fixes for error handling.

Warner


>
> r~
>

--00000000000060382505f48467d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 11, 2023 at 4:09 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/10/23 13:18, Warner Losh wrote:<br>
&gt; +abi_long do_freebsd_sysctl(CPUArchState *env, abi_ulong namep, int32_=
t namelen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abi_ulong oldp, abi_ulong oldlenp, abi_ul=
ong newp, abi_ulong newlen)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 abi_long ret;<br>
&gt; +=C2=A0 =C2=A0 void *hnamep, *holdp =3D NULL, *hnewp =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 size_t holdlen;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong oldlen =3D 0;<br>
&gt; +=C2=A0 =C2=A0 int32_t *snamep =3D g_malloc(sizeof(int32_t) * namelen)=
, *p, *q, i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (oldlenp) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_user_ual(oldlen, oldlenp)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -TARGET_EFAULT;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
You need to check for write early.=C2=A0 Either access_ok, or lock_user.<br=
>
<br>
&gt; +=C2=A0 =C2=A0 for (p =3D hnamep, q =3D snamep, i =3D 0; i &lt; namele=
n; p++, i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *q++ =3D tswap32(*p);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
Why the inconsistent increments?<br></blockquote><div><br></div><div>no rea=
son... Fixed.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
&gt; +=C2=A0 =C2=A0 unlock_user(holdp, oldp, holdlen);<br>
<br>
Usually we don&#39;t want writeback on error.<br></blockquote><div><br></di=
v>Indeed. Fixed as well.. in the other fixes for error handling.</div><div =
class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">Warner<br></div>=
<div class=3D"gmail_quote"><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
r~<br>
</blockquote></div></div>

--00000000000060382505f48467d4--

