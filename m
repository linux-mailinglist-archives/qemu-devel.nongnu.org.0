Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE456F596F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 15:57:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puCxM-0005DP-Sg; Wed, 03 May 2023 09:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1puCxL-0005BK-3s
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1puCxJ-0001Ge-8V
 for qemu-devel@nongnu.org; Wed, 03 May 2023 09:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683122139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xe4e7jakaj2x5UAFxIqxCa/FXJVJtsceGKvK2ovw8FI=;
 b=HnK/2kXKpBkbXohSW5BZTiKA/pZkhhOaabY03uBEeYWjgL0wXfcwjefKEy+yeV3yuDPwmi
 dkC/V2yK2icwgLYfDV8ol0mM6/3CNvpZuw7rnU7ep8WkpCpPio1nJoFtFjeMH8uvAzSFcU
 MAp860wn4qIREcXvhaPqDEOLHoWbiCo=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-fTDQkCLKNIC7EZt1PZ1fMw-1; Wed, 03 May 2023 09:55:38 -0400
X-MC-Unique: fTDQkCLKNIC7EZt1PZ1fMw-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6435432f4ffso203911b3a.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 06:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683122137; x=1685714137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xe4e7jakaj2x5UAFxIqxCa/FXJVJtsceGKvK2ovw8FI=;
 b=b2Di0/+RAUlxchsvowmB06ferwrxx7idHGP6VzLMfKCsiaHOtpL8ta0isZ1cL9XKd4
 KpCL6GHjHm3J352yWMeTy6rlcOW+3f6dNNoXur7ZYmgGrBE0uariwaPZ+EtyicPuppYa
 PC3qNiBiU4QDcHI/sECyu4rGqeU0LpClZRwpCspmO3Utn1bRs46KSybf1uykxv2H4fSp
 Uy77D4rSGzOthh3nmi2Ff09kq90uAW6jxlshrvxJ7zgWniAMD3YDNEhz1in9FZkqNFfK
 FjjXr0EltUL7qgAe0rd9LndfL+nihQ2uKRp2ln2fhSQIqJ/uujMhnPeBsOZ9alEuLXVW
 siHw==
X-Gm-Message-State: AC+VfDzNHxw+bqDzxWAPm6IR9NsmtdyvDpGi6efw6xqp0YIFshw3br0S
 6crNrmHGu6UPMcUfCCYIitl0ifVp5L6bTPKmOUaarKgpWhvXiV5sePdnnRQYlEBqd04ueyOVGEC
 b5xTnYuJY1+3A5rYvYbYtN9VgFl8hnNk=
X-Received: by 2002:a05:6a21:100e:b0:ec:843a:6388 with SMTP id
 nk14-20020a056a21100e00b000ec843a6388mr22920247pzb.26.1683122137520; 
 Wed, 03 May 2023 06:55:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4v4y8IY+sBzxLspoHy15dcD/XAx+/2Lqo4v+CfaCsaVRVH/aW1h/FYwPd2g+usEdIsaBDN24XmZ3Tr3sW3SOY=
X-Received: by 2002:a05:6a21:100e:b0:ec:843a:6388 with SMTP id
 nk14-20020a056a21100e00b000ec843a6388mr22920232pzb.26.1683122137229; Wed, 03
 May 2023 06:55:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230502092339.27341-1-mads@ynddal.dk>
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
From: John Snow <jsnow@redhat.com>
Date: Wed, 3 May 2023 09:55:26 -0400
Message-ID: <CAFn=p-Zi-YfAeROOt=u3_xke+p7BT1Kt0Q9Vsm_gag5jW4FmGw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] simpletrace: refactor and general improvements
To: Mads Ynddal <mads@ynddal.dk>
Cc: qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Content-Type: multipart/alternative; boundary="0000000000001a85a705faca693a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

--0000000000001a85a705faca693a
Content-Type: text/plain; charset="UTF-8"

On Tue, May 2, 2023, 5:24 AM Mads Ynddal <mads@ynddal.dk> wrote:

> From: Mads Ynddal <m.ynddal@samsung.com>
>
> I wanted to use simpletrace.py for an internal project, so I tried to
> update
> and polish the code. Some of the commits resolve specific issues, while
> some
> are more subjective.
>
> I've tried to divide it into commits so we can discuss the
> individual changes, and I'm ready to pull things out, if it isn't needed.
>

Just a quick note to say that I'll be on and off the rest of this week, but
this is on my radar to look at soon.

A question for you: do you think it's possible to move simpletrace into
qemu/python/utils? This requires cleaning up the code to some fairly
pedantic standards, but helps protect it against rot as we change target
python versions.

No problem if that's too much to ask. just want to know if you had looked
into it.


> v2:
>  * Added myself as maintainer of simpletrace.py
>  * Improve docstring on `process`
>  * Changed call to `process` in scripts/analyse-locks-simpletrace.py to
> reflect new argument types
>  * Replaced `iteritems()` with `items()` in
> scripts/analyse-locks-simpletrace.py to support Python 3
>
> Mads Ynddal (12):
>   simpletrace: Improve parsing of sys.argv; fix files never closed.
>   simpletrace: Annotate magic constants from QEMU code
>   simpletrace: changed naming of edict and idtoname to improve
>     readability
>   simpletrace: update code for Python 3.11
>   simpletrace: Changed Analyzer class to become context-manager
>   simpletrace: Simplify construction of tracing methods
>   simpletrace: Improved error handling on struct unpack
>   simpletrace: define exception and add handling
>   simpletrace: Refactor to separate responsibilities
>   MAINTAINERS: add maintainer of simpletrace.py
>   scripts/analyse-locks-simpletrace.py: changed iteritems() to items()
>   scripts/analyse-locks-simpletrace.py: reflect changes to process in
>     simpletrace.py
>
>  MAINTAINERS                          |   8 +-
>  scripts/analyse-locks-simpletrace.py |   5 +-
>  scripts/simpletrace.py               | 307 ++++++++++++---------------
>  3 files changed, 150 insertions(+), 170 deletions(-)
>
> --
> 2.38.1
>
>
>

--0000000000001a85a705faca693a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, May 2, 2023, 5:24 AM Mads Ynddal &lt;<a href=
=3D"mailto:mads@ynddal.dk">mads@ynddal.dk</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">From: Mads Ynddal &lt;<a href=3D"mailto:m.ynddal@sams=
ung.com" target=3D"_blank" rel=3D"noreferrer">m.ynddal@samsung.com</a>&gt;<=
br>
<br>
I wanted to use simpletrace.py for an internal project, so I tried to updat=
e<br>
and polish the code. Some of the commits resolve specific issues, while som=
e<br>
are more subjective.<br>
<br>
I&#39;ve tried to divide it into commits so we can discuss the<br>
individual changes, and I&#39;m ready to pull things out, if it isn&#39;t n=
eeded.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Just a quick note to say that I&#39;ll be on and off the rest of this=
 week, but this is on my radar to look at soon.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">A question for you: do you think it&#39;s possible =
to move simpletrace into qemu/python/utils? This requires cleaning up the c=
ode to some fairly pedantic standards, but helps protect it against rot as =
we change target python versions.=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">No problem if that&#39;s too much to ask. just want to know=
 if you had looked into it.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
v2:<br>
=C2=A0* Added myself as maintainer of simpletrace.py<br>
=C2=A0* Improve docstring on `process`<br>
=C2=A0* Changed call to `process` in scripts/analyse-locks-simpletrace.py t=
o reflect new argument types<br>
=C2=A0* Replaced `iteritems()` with `items()` in scripts/analyse-locks-simp=
letrace.py to support Python 3<br>
<br>
Mads Ynddal (12):<br>
=C2=A0 simpletrace: Improve parsing of sys.argv; fix files never closed.<br=
>
=C2=A0 simpletrace: Annotate magic constants from QEMU code<br>
=C2=A0 simpletrace: changed naming of edict and idtoname to improve<br>
=C2=A0 =C2=A0 readability<br>
=C2=A0 simpletrace: update code for Python 3.11<br>
=C2=A0 simpletrace: Changed Analyzer class to become context-manager<br>
=C2=A0 simpletrace: Simplify construction of tracing methods<br>
=C2=A0 simpletrace: Improved error handling on struct unpack<br>
=C2=A0 simpletrace: define exception and add handling<br>
=C2=A0 simpletrace: Refactor to separate responsibilities<br>
=C2=A0 MAINTAINERS: add maintainer of simpletrace.py<br>
=C2=A0 scripts/analyse-locks-simpletrace.py: changed iteritems() to items()=
<br>
=C2=A0 scripts/analyse-locks-simpletrace.py: reflect changes to process in<=
br>
=C2=A0 =C2=A0 simpletrace.py<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
=C2=A0scripts/analyse-locks-simpletrace.py |=C2=A0 =C2=A05 +-<br>
=C2=A0scripts/simpletrace.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 307 ++++++++++++---------------<br>
=C2=A03 files changed, 150 insertions(+), 170 deletions(-)<br>
<br>
-- <br>
2.38.1<br>
<br>
<br>
</blockquote></div></div></div>

--0000000000001a85a705faca693a--


