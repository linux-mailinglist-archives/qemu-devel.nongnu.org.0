Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAFC6FF699
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 17:59:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8ge-0007tO-Lc; Thu, 11 May 2023 11:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8gZ-0007jd-7q
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:58:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8gR-0005vf-Pv
 for qemu-devel@nongnu.org; Thu, 11 May 2023 11:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683820700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yE5/aBhyoczO9Gp8TX7ccJPQGruek44ZD/fAL61sRYk=;
 b=UQF4rR1O3mgAcdKNjqmeacjSHoq4Vb/B8+jlXrsIuD5V6aIMtdyXECzmxjFCqke/lQHMRP
 nV8s0IYfGdPAMUDxBuu1ivm0487/z221z6YS/Swup15DZfVSlxF5DeQVyMqSas7YHFrEWn
 x1UjY88q+h8MO6o8F6f7V/CbDRkU58Y=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-oLunVSYYPhmYwjU6wR_r_g-1; Thu, 11 May 2023 11:58:19 -0400
X-MC-Unique: oLunVSYYPhmYwjU6wR_r_g-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-644c382a49aso3739625b3a.2
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 08:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683820698; x=1686412698;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yE5/aBhyoczO9Gp8TX7ccJPQGruek44ZD/fAL61sRYk=;
 b=FZIzaVY3MQsIv8w5HA/PUPs0mB3v5O3gVMi72vqP2H6yygwLDnPmOZygINgX2S1eSU
 x5LSRal5VRkWs76rqjcQj025YQsKR8jErBGF9sW9esOOWlNkbcFoK/2wLmr8M6XaQeag
 VDTOm9k9CQJasL/7gJ0BTMuT9L6dNte3y5BPNAWi3dfaxJ1UAxblQ1cLC4EcTlXiYdK6
 oE7e2Mn5aWpJ4Mpc+sITolrTLwiiA/oCDsyG9Z21s1uZR6/eYhS2CLTgy37P8AsF3YZ8
 oE79Dz5n7km46tNMK+P9O16gBA//4sr+adTNAj3sqConJ8iUzYL734uz+azoImSN1LVU
 KB6g==
X-Gm-Message-State: AC+VfDzWjyukJqdC0/43dyPqiGEiVyVWL1y8zXBBsDddTzuj/eMVvOVA
 +pUNI7uKYxJyvlm5lBael2sdzvh45Cmyfh33BwBdLb+XI2S7gt3UmbaMlf5L955bo3u15/u9tCP
 6JP9s2uRcqPQTBpLEOaZXyZLvm7Y1BN8=
X-Received: by 2002:a05:6a00:1582:b0:643:b37d:d350 with SMTP id
 u2-20020a056a00158200b00643b37dd350mr28440865pfk.31.1683820697992; 
 Thu, 11 May 2023 08:58:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ZuoKiek1SsLGSuGDvSMOF7NZ1zOcC/GjdsDM50ojqMzaY93Tljc26lvjWd8IC1KbQcxjOAx6AoDV113rs4oE=
X-Received: by 2002:a05:6a00:1582:b0:643:b37d:d350 with SMTP id
 u2-20020a056a00158200b00643b37dd350mr28440851pfk.31.1683820697785; Thu, 11
 May 2023 08:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-28-jsnow@redhat.com>
 <ac20b31a-5018-186f-3d7c-ea9d7d0f11c4@redhat.com>
In-Reply-To: <ac20b31a-5018-186f-3d7c-ea9d7d0f11c4@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 11 May 2023 11:58:06 -0400
Message-ID: <CAFn=p-axwgCSju3e86rRHMBbdSkYiTMPaaL857DO+4bW5fu9WQ@mail.gmail.com>
Subject: Re: [PATCH 27/27] mkvenv.py: experiment; use distlib to generate
 script entry points
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <anisinha@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kyle Evans <kevans@freebsd.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Michael Roth <michael.roth@amd.com>, Reinoud Zandijk <reinoud@netbsd.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008eb1ce05fb6d0e61"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008eb1ce05fb6d0e61
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 11, 2023, 3:02 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/11/23 05:54, John Snow wrote:
> > +    if checkpip():
> > +        # We ran ensurepip. We need to re-run post_init...!
> > +        args =3D [sys.executable, __file__, "post_init"]
> > +        subprocess.run(args, check=3DTrue)
> > +        return
> > +
> >       # Finally, generate a 'pip' script so the venv is usable in a
> normal
> >       # way from the CLI. This only happens when we inherited pip from =
a
> >       # parent/system-site and haven't run ensurepip in some way.
>
> Can't this just be:
>
> +    if not checkpip():
> +        # Finally, generate a 'pip' script so the venv is usable in a
> normal
> +        # way from the CLI. This only happens when we inherited pip from=
 a
> +        # parent/system-site and haven't run ensurepip in some way.
> +        generate_console_scripts(["pip"])
>
> even squashed in the original

Debian 10 patch?
>
> You don't need to generate the pip shims if ensurepip has been run.
>
> Paolo
>

*cough*

You=E2=80=99re completely right. I was so preoccupied on diagnosing why it =
was
failing I didn't even recognize that it wasn't even needed...

*facepalm*

I'll make that simplifying change, which will also allow me to just put the
import in the global scope instead of trying to do it JIT to work around
ensurepip shenanigans. Should be a few less "I know this is bad" comments
for the linters, too.

--js

>

--0000000000008eb1ce05fb6d0e61
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 11, 2023, 3:02 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/11/23 05:54, John Snow wrote:<br>
&gt; +=C2=A0 =C2=A0 if checkpip():<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We ran ensurepip. We need to re-run pos=
t_init...!<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 args =3D [sys.executable, __file__, &quot=
;post_init&quot;]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.run(args, check=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Finally, generate a &#39;pip&#39; script s=
o the venv is usable in a normal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# way from the CLI. This only happens when w=
e inherited pip from a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# parent/system-site and haven&#39;t run ens=
urepip in some way.<br>
<br>
Can&#39;t this just be:<br>
<br>
+=C2=A0 =C2=A0 if not checkpip():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Finally, generate a &#39;pip&#39; script so =
the venv is usable in a normal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # way from the CLI. This only happens when we =
inherited pip from a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # parent/system-site and haven&#39;t run ensur=
epip in some way.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 generate_console_scripts([&quot;pip&quot;])<br=
>
<br>
even squashed in the original</blockquote></div></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Debian 10 patch?<br>
<br>
You don&#39;t need to generate the pip shims if ensurepip has been run.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">*cough*</div><div dir=3D"auto"><br></div><div dir=3D"auto">You=E2=80=
=99re completely right. I was so preoccupied on diagnosing why it was faili=
ng I didn&#39;t even recognize that it wasn&#39;t even needed...</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">*facepalm*</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">I&#39;ll make that simplifying change, which wi=
ll also allow me to just put the import in the global scope instead of tryi=
ng to do it JIT to work around ensurepip shenanigans. Should be a few less =
&quot;I know this is bad&quot; comments for the linters, too.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">--js</div><div dir=3D"auto"><div clas=
s=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000008eb1ce05fb6d0e61--


