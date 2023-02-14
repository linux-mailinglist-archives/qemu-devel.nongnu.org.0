Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1B696FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 22:32:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2tr-0003Xw-2y; Tue, 14 Feb 2023 16:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pS2to-0003Ie-NG
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:31:40 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pS2tm-0002eC-B2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 16:31:40 -0500
Received: by mail-ed1-x530.google.com with SMTP id d40so18130827eda.8
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 13:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xHTyoFkvcovrMpfShXIZsFIB7tKgtZYzeo8fE7Ek+hc=;
 b=hy0NPRhHq+a+I+K0bYEAggVmaEeLHKKrS5bff1zQdwu3hCxwEgjTG7pLETcyhSeFAd
 cMwL0GSFFtd9dItEPhu096hMb0+veSOnzD89T0Tc7O2XUWOvz6bQe4vziYBm5Rf4WDTg
 BMZcXiwZmAqSsd1rf5MgKhwWh0BUpemP5AIeTa3jyabxHlji1SxcqXj1cIICWgjmkGur
 TRDLFAEUlAKhwMGhs/JCWkYgAZHQ2sclAflnNFuV5pSs0OztRHBgWAosjen3Lh4/YyDb
 AX2G6lUv2uH4O0b5bxgkeMhbpkOCIiXbXtGteg4l1LEABg+KXvB9A1KB6sDAhDEsahif
 orlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xHTyoFkvcovrMpfShXIZsFIB7tKgtZYzeo8fE7Ek+hc=;
 b=axq4AUObDuUUxRr6MqkhfRBdWSeXwmbtnrfT2goPmZApWqqgMNfQ0s0olURVWgFA5P
 2rRoERs/qeMH2mnrcZCTTXCWf3NY8lIlrOfI+pKK1T1895IK8eggmf4+ZqD5mpUf6sIk
 vwx9Nw9uNgHRT3ZPPxrZcdHZon1XaJ474ZbINp3Ip1uRkjXwWDy0gx3KNSAS5meOVe8g
 G2INewJZ0JLPSqQKTvr3VAZehdEfmz2NMlR0+xTPh82qym+wOaX+SSoXXBJ6TxUBI/ry
 gpELBis+MGdn7EwIqZcKS+eaQY4QUYLbu6WszwfC0kHK+eDicBK9FphVYzob6NfsAfFr
 +m5w==
X-Gm-Message-State: AO0yUKXavwwdlskp2a+Qc11o1e+P+4eoZnowk9rwBImDUQObMvzYmf9l
 l8dkmC8t91zBWArtQ7QI7Lz7pIHmQWsdUoUT1etdTA==
X-Google-Smtp-Source: AK7set9ZpuxQQlLgY3le9hM2Qj1WmtmbsgM8UlUeCmnqi6Flf5I9vz1WUMp0pfSGZ2H87homu9Koqnj1rNys8aT6oBk=
X-Received: by 2002:a50:cdcf:0:b0:4ac:b4b3:b788 with SMTP id
 h15-20020a50cdcf000000b004acb4b3b788mr2046660edj.0.1676410296275; Tue, 14 Feb
 2023 13:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-5-imp@bsdimp.com>
 <a36ae3a6-50fa-d969-e9b2-6fe1ff9db9e1@linaro.org>
In-Reply-To: <a36ae3a6-50fa-d969-e9b2-6fe1ff9db9e1@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 14 Feb 2023 14:31:25 -0700
Message-ID: <CANCZdfpXnVHe4cq4mFJ=KPf+t4Sc9_2vqh4tdG+PgpfQQBvp1A@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] bsd-user: various helper routines for sysctl
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org, 
 Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000035298105f4afb0c7"
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x530.google.com
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

--00000000000035298105f4afb0c7
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 1:52 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/13/23 14:27, Warner Losh wrote:
> > +#ifdef TARGET_ABI32
> > +/*
> > + * Limit the amount of available memory to be most of the 32-bit address
> > + * space. 0x100c000 was arrived at through trial and error as a good
> > + * definition of 'most'.
> > + */
> > +static const abi_ulong target_max_mem = UINT32_MAX - 0x100c000 + 1;
> > +
> > +static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
> > +{
> > +    if (((unsigned long)target_max_mem) < mem) {
> > +        mem = target_max_mem;
> > +    }
> > +
> > +    return mem;
> > +}
> > +#endif
>
> Identity function for ABI64?
>

Indirectly, yes. For ABI64 we simply don't intercept these sysctl nodes.


> > +static unsigned long host_page_size;
> > +
> > +static abi_ulong G_GNUC_UNUSED scale_to_target_pages(uint64_t pages)
> > +{
> > +    if (host_page_size == 0) {
> > +        host_page_size = getpagesize();
> > +    }
>
> qemu_real_host_page_size()
>

OK. Easy enough. That was a warning from checkpatch anyway that had slipped
my mind.


> > +
> > +    pages = muldiv64(pages, host_page_size, TARGET_PAGE_SIZE);
> > +#ifdef TARGET_ABI32
> > +    abi_ulong maxpages = target_max_mem / (abi_ulong)TARGET_PAGE_SIZE;
> > +
> > +    if (((unsigned long)maxpages) < pages) {
> > +        pages = maxpages;
> > +    }
> > +#endif
>
> No need for either cast.  Just use MIN().
>

Gotcha.


> > +#ifdef TARGET_ABI32
> > +static abi_long G_GNUC_UNUSED h2t_long_sat(long l)
>
> h2g.
>

OK.


> > +{
> > +    if (l > INT32_MAX) {
> > +        l = INT32_MAX;
> > +    } else if (l < INT32_MIN) {
> > +        l = INT32_MIN;
> > +    }
> > +    return l;
> > +}
> > +
> > +static abi_ulong G_GNUC_UNUSED h2t_ulong_sat(u_long ul)
> > +{
> > +    if (ul > UINT32_MAX) {
> > +        ul = UINT32_MAX;
> > +    }
> > +    return ul;
> > +}
> > +#endif
>
> Anyway, identity functions for ABI64?
>

Right now they aren't used at all for ABI64...  But that's in later
patches...  We only do
special things for  LONG or ULONG on ABI32... Otherwise, the normal paths
wouldn't
call these at all.

Warner

--00000000000035298105f4afb0c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 14, 2023 at 1:52 PM Richa=
rd Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.he=
nderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On 2/13/23 14:27, Warner Losh wrote:<br>
&gt; +#ifdef TARGET_ABI32<br>
&gt; +/*<br>
&gt; + * Limit the amount of available memory to be most of the 32-bit addr=
ess<br>
&gt; + * space. 0x100c000 was arrived at through trial and error as a good<=
br>
&gt; + * definition of &#39;most&#39;.<br>
&gt; + */<br>
&gt; +static const abi_ulong target_max_mem =3D UINT32_MAX - 0x100c000 + 1;=
<br>
&gt; +<br>
&gt; +static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (((unsigned long)target_max_mem) &lt; mem) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mem =3D target_max_mem;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return mem;<br>
&gt; +}<br>
&gt; +#endif<br>
<br>
Identity function for ABI64?<br></blockquote><div><br></div><div>Indirectly=
, yes. For ABI64 we simply don&#39;t intercept these sysctl nodes.</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +static unsigned long host_page_size;<br>
&gt; +<br>
&gt; +static abi_ulong G_GNUC_UNUSED scale_to_target_pages(uint64_t pages)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (host_page_size =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host_page_size =3D getpagesize();<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
qemu_real_host_page_size()<br></blockquote><div><br></div><div>OK. Easy eno=
ugh. That was a warning from checkpatch anyway that had slipped my mind.</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +=C2=A0 =C2=A0 pages =3D muldiv64(pages, host_page_size, TARGET_PAGE_S=
IZE);<br>
&gt; +#ifdef TARGET_ABI32<br>
&gt; +=C2=A0 =C2=A0 abi_ulong maxpages =3D target_max_mem / (abi_ulong)TARG=
ET_PAGE_SIZE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (((unsigned long)maxpages) &lt; pages) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pages =3D maxpages;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
<br>
No need for either cast.=C2=A0 Just use MIN().<br></blockquote><div><br></d=
iv><div>Gotcha.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt; +#ifdef TARGET_ABI32<br>
&gt; +static abi_long G_GNUC_UNUSED h2t_long_sat(long l)<br>
<br>
h2g.<br></blockquote><div><br></div><div>OK.=C2=A0</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (l &gt; INT32_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D INT32_MAX;<br>
&gt; +=C2=A0 =C2=A0 } else if (l &lt; INT32_MIN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D INT32_MIN;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return l;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static abi_ulong G_GNUC_UNUSED h2t_ulong_sat(u_long ul)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (ul &gt; UINT32_MAX) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ul =3D UINT32_MAX;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 return ul;<br>
&gt; +}<br>
&gt; +#endif<br>
<br>
Anyway, identity functions for ABI64?<br></blockquote><div><br></div><div>R=
ight now they aren&#39;t used at all for ABI64...=C2=A0 But that&#39;s in l=
ater patches...=C2=A0 We only do</div><div>special things for=C2=A0 LONG or=
 ULONG on ABI32... Otherwise, the normal paths wouldn&#39;t</div><div>call =
these at all.</div><div><br></div><div>Warner</div></div></div>

--00000000000035298105f4afb0c7--

