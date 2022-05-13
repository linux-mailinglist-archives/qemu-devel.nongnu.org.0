Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD43526378
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:12:11 +0200 (CEST)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npW1a-0003ij-Oc
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npVzN-0001Ye-6V
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npVzK-0000sd-Tj
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652450989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5ew3iA+YLSOCD1jdSaOck8IOr/5g/1eQH7BgL/30BA=;
 b=GdTb7QknD/RbbvOKA2b5klhkxwqmPVe1WvDJS9iQPiCuNl+xk2bVoWlAsTZ2+VfaSdVfji
 EegFpdTfvukxwWQ4MVVDJK6cjsyfq5eeuooX/gcRyLr8C0b1nAlFQykpCokXOppcSRuTUb
 ydJE53aVA1/6brgY4SIUdyz0EJsuFxs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-rBl9wvqaNSePpYZl7_e5AA-1; Fri, 13 May 2022 10:09:48 -0400
X-MC-Unique: rBl9wvqaNSePpYZl7_e5AA-1
Received: by mail-ua1-f71.google.com with SMTP id
 p2-20020a9f3802000000b0036896bf1d77so40903uad.21
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X5ew3iA+YLSOCD1jdSaOck8IOr/5g/1eQH7BgL/30BA=;
 b=el0fh43mvGivy+hfBjehCclx4XR3Krris/0zXjpDrDx/FALhaH4s2yyuWf2eDqNjkU
 hDpwyA6PdVP+ZL7znRE2Sf72nlisME4EOeNF2hup/drkEdd/xyvCCx/Gq11N42soHDFC
 eb69I2yVJS2Ii5cguWH+zsxxpygUj8/nQbtC4eWOgQyP021pfI3D/IawPPsTQl9JSWbZ
 +q4gEkq9R/AEk7BRjIuVGxLfh/EUYIM1fdV4M4npj7nLm9TyIjwrJdEirD5pLJ8+0DPP
 +G9Q3PCmDxA0yQssBk5Axf1HaXtTEGY6kSELrGCquPtNOxuDXAhhV5EHjEHvj46BhxlU
 8CkQ==
X-Gm-Message-State: AOAM533Zebz1KR8N26OWK4mGOdvWhGYpoovDaTj1gmDxvIrZ8MNmUIsj
 zZrJY4SKqPcMV/+hw2Lw98fbkAUocfL+ud2NG5+FaPFnth/hoxDS7zvFt1OAYP4+griIlgMODUE
 +9p3BZsI/BGOWoYKFouAJ995W2BMawXg=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr2467149vsr.11.1652450987948; 
 Fri, 13 May 2022 07:09:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaDCF9UMpF3ROm45/a9N0xoBQYYnD+SWin6rzvN+PDUiASAC9MEWjzG0n24wgADPdyC6epfkSyxh2mxDIrkYk=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr2467121vsr.11.1652450987778; Fri, 13
 May 2022 07:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-2-jsnow@redhat.com>
 <1f2b00d0-2884-ec26-fe43-1a75f3d23e87@redhat.com>
In-Reply-To: <1f2b00d0-2884-ec26-fe43-1a75f3d23e87@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 10:09:37 -0400
Message-ID: <CAFn=p-YGoQnuaWMsOoiuyN6BFzFoBgK3W0A1u8hAXPo3D-c2+w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/9] python: update for mypy 0.950
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000022bebc05dee53a44"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

--00000000000022bebc05dee53a44
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 4:42 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 02:06, John Snow wrote:
> > typeshed (included in mypy) recently updated to improve the typing for
> > WriteTransport objects. I was working around this, but now there's a
> > version where I shouldn't work around it.
> >
> > Unfortunately this creates some minor ugliness if I want to support both
> > pre- and post-0.950 versions. For now, for my sanity, just disable the
> > unused-ignores warning.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> Whatever floats your boat :)
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Paolo
>

Maybe I'll move towards pinning specific versions of analysis tools once we
move to always using a venv, and I won't have to try so hard to target a
wide spread of versions for mypy, pylint, etc.

I've tried pretty hard to "just have it work", but with the prevailing
idioms in the Python world being what they are, I am playing whackamole
virtually every release.

But, yeah, for now... meh. This keeps the boat afloat.

--00000000000022bebc05dee53a44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 4:42 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/13/22 02:06, John Snow wrote:<br>
&gt; typeshed (included in mypy) recently updated to improve the typing for=
<br>
&gt; WriteTransport objects. I was working around this, but now there&#39;s=
 a<br>
&gt; version where I shouldn&#39;t work around it.<br>
&gt; <br>
&gt; Unfortunately this creates some minor ugliness if I want to support bo=
th<br>
&gt; pre- and post-0.950 versions. For now, for my sanity, just disable the=
<br>
&gt; unused-ignores warning.<br>
&gt; <br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
<br>
Whatever floats your boat :)<br>
<br>
Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Maybe I&#39;ll move towards pinning specific versions of analysis tool=
s once we move to always using a venv, and I won&#39;t have to try so hard =
to target a wide spread of versions for mypy, pylint, etc.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I&#39;ve tried pretty hard to &quot;just=
 have it work&quot;, but with the prevailing idioms in the Python world bei=
ng what they are, I am playing whackamole virtually every release.</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">But, yeah, for now... meh. This =
keeps the boat afloat.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000022bebc05dee53a44--


