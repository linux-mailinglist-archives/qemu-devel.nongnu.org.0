Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A71A6FF6E9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 18:16:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px8xx-00010Z-Mn; Thu, 11 May 2023 12:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8xp-0000zx-QI
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:16:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1px8xo-0001pt-C2
 for qemu-devel@nongnu.org; Thu, 11 May 2023 12:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683821779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FBGD3S2pIwqsCSuDziU5ZN9DZodPUsXOTc1UeUEBbIk=;
 b=c4i/XksmeMeZXJ1jWfYm3fh58rWTN2TBHtnRPV5N7vZQK/ZnUzTQw4898VFRZn2IPmNxcj
 U4NZjKh6v7TRmvsraherSM8FSaxDSy5Y7FfcotJJ06ep10pe6S9QRwh2bO831Mw5F2hhyW
 NWGqTnYaFjSCvdwt2PvJWhy3kyKjap8=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-XAPkFNpLNhqJntE9vOzhfg-1; Thu, 11 May 2023 12:16:16 -0400
X-MC-Unique: XAPkFNpLNhqJntE9vOzhfg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-645538f6101so28322792b3a.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 09:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683821775; x=1686413775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FBGD3S2pIwqsCSuDziU5ZN9DZodPUsXOTc1UeUEBbIk=;
 b=TA8Cf7gatpSOvdQ9Yjs9brCA9R+g6YsXZoeGNbsTQGKBqbqrQ+kmac1Wah2GEVWyGl
 euQWlZh2BIJSyH0K+B1HY02QQkO6/w0GaASjslW5+mhp/ybWLpTF2uIU847cv9EbKOyV
 QKlLjGImdPtOe5N/apF4mDXU019AqaW6ftT9p98jko5ByJcwBhWFD3JebDbxVQHQhMe6
 F/tzqAojxQjNZa6JXwbCgSBpkL+U6bRx6UUTpFOoJPY7LBhlD3pKC9ooA/nFVQFdxruV
 mub8F2eycIyWXn7DIoU5Xn7xUV6+Dr6WLxYxYL/1ML4fIEQezJ06bpp8604LbGU3ecR4
 ZRbA==
X-Gm-Message-State: AC+VfDxDF1di8Z+nrUT+TGOUZu+NECbTgrpYuPEAtgCGxhSzOhTg/8/6
 GluT2yfyL6Nde8wqvQmy/6ituCrrJqNYt8Fs/T+wa/vBVcD2kiXf1AbkGHuIx47nsMDpat+TaGq
 LRJznmrq7g2VISKhiQyTVpnye5jfZ8IU=
X-Received: by 2002:a05:6a00:15c6:b0:635:d9e1:8e1e with SMTP id
 o6-20020a056a0015c600b00635d9e18e1emr33635565pfu.11.1683821775194; 
 Thu, 11 May 2023 09:16:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6SM2KIAmO8k7Xyz9wtqJDw19IxHKTsnrvauGV9PHuNBVwhtbxJGerGO3B2FoGp0SfpAskeVz9q0e3kkXoQjaY=
X-Received: by 2002:a05:6a00:15c6:b0:635:d9e1:8e1e with SMTP id
 o6-20020a056a0015c600b00635d9e18e1emr33635522pfu.11.1683821774748; Thu, 11
 May 2023 09:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230511035435.734312-1-jsnow@redhat.com>
 <20230511035435.734312-28-jsnow@redhat.com>
 <ac20b31a-5018-186f-3d7c-ea9d7d0f11c4@redhat.com>
 <CAFn=p-axwgCSju3e86rRHMBbdSkYiTMPaaL857DO+4bW5fu9WQ@mail.gmail.com>
 <CABgObfYHpiHuRkFDVFU8YovqUqETzQBse9-tK7C+69VMFfrS2w@mail.gmail.com>
In-Reply-To: <CABgObfYHpiHuRkFDVFU8YovqUqETzQBse9-tK7C+69VMFfrS2w@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 11 May 2023 12:16:03 -0400
Message-ID: <CAFn=p-byZuCjxNGw4=N5n5oN5muYUVZhdZT7is62_r39n3qL4A@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000bfd73f05fb6d4eea"
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

--000000000000bfd73f05fb6d4eea
Content-Type: text/plain; charset="UTF-8"

On Thu, May 11, 2023, 12:14 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

>
>
> Il gio 11 mag 2023, 17:58 John Snow <jsnow@redhat.com> ha scritto:
>
>> I'll make that simplifying change, which will also allow me to just put
>>> the import in the global scope instead of trying to do it JIT to work
>>> around ensurepip shenanigans. Should be a few less "I know this is bad"
>>> comments for the linters, too.
>>
>>
> I don't think you can do that because, until you are running in the new
> venv, you aren't guaranteed to have either distlib or pip. Once in the venv
> you'll get the latter via ensurepip, if it wasn't already present in the
> system site-packages.
>
> Paolo
>

Yeah, not without a *little* trickery. It still needs a try/except but it
can be moved up.

Or I could leave well enough alone and worry about cleaning up imports when
we move to 3.8

--000000000000bfd73f05fb6d4eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, May 11, 2023, 12:14 PM Paolo Bonzini &lt;<a hr=
ef=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><br><br><div class=3D"g=
mail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Il gio 11 ma=
g 2023, 17:58 John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_=
blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt; ha scritto:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div dir=3D"auto"><div><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">I&#39;ll make that simplifying change, wh=
ich will also allow me to just put the import in the global scope instead o=
f trying to do it JIT to work around ensurepip shenanigans. Should be a few=
 less &quot;I know this is bad&quot; comments for the linters, too.</blockq=
uote></div></div></div></blockquote></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I don&#39;t think you can do that because, until you are runni=
ng in the new venv, you aren&#39;t guaranteed to have either distlib or pip=
. Once in the venv you&#39;ll get the latter via ensurepip, if it wasn&#39;=
t already present in the system site-packages.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Paolo</div></div></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Yeah, not without a *little* trickery=
. It still needs a try/except but it can be moved up.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Or I could leave well enough alone and worry =
about cleaning up imports when we move to 3.8</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>
</blockquote></div></div>
</blockquote></div></div></div>

--000000000000bfd73f05fb6d4eea--


