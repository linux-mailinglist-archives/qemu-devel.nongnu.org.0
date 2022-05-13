Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAFD526368
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:04:49 +0200 (CEST)
Received: from localhost ([::1]:60848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npVuS-0003aA-RA
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npVr3-0000Ac-P3
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:01:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npVr0-0008At-Pk
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652450473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=48ijokbVfLIHLgPfNYLaxAuM45Ek2mRYlAI0bFMPMjc=;
 b=NIwnjX8gDOccg5oo4wVebp+WiTpe0QJeiI7zqJHg4W3KlG8/XEtLVJjvUT77RGiHp+gJCm
 ZAN6+sDMA3wmgp24ALU7oNGQ5n7cQgR5v0mb0ZxQbrJKoNh03oACqyFGz9Y3c2ZatKU9+2
 Cnm3hw22ev04/UeyCCv8PH3DKw0PH9I=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-3aIGdVEhOdOhEedyQJ0rRQ-1; Fri, 13 May 2022 10:01:12 -0400
X-MC-Unique: 3aIGdVEhOdOhEedyQJ0rRQ-1
Received: by mail-ua1-f72.google.com with SMTP id
 z12-20020ab0770c000000b0035fb10cfc86so3831995uaq.2
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=48ijokbVfLIHLgPfNYLaxAuM45Ek2mRYlAI0bFMPMjc=;
 b=MZhSQXWC+dqqD4EqsWur73OUX3UeFM7bm6aU0V6/K0csczA0x8kXBH31LIfqV5NquO
 GSf3DFPlN/7ka1MPz41B5gB1U2/H20H9PxPVtW1cE/Hz2bTZYus0PV6Uq3N0nlQ79wXV
 ChqW3d4nvtONl/5l524xs12ixCOEMWVV2vG0heIUtETDgoJH1iEhmtIcoDO8C6g0GqwJ
 5hbUntvXU5XR0YtIRjgUo3YMAHc0Dna5zgRr1zrPbosoOXEVDYIhhxr7oBa/aG6lKPj7
 1PJ8QpaVW/aw+yQPEmPFOjCRTZtarGidfpWWZrquRiItRcpQBlmlx1umYKQLWjm+up7g
 n6CQ==
X-Gm-Message-State: AOAM530jmf873yy/3/151vsGErJD5pOz1KThq+r2n3fZsqXlG+ee89Qw
 hpOxQeB8O0XnOI9dnWyDIMM84eLkz9Wv8CHjIolLBwRW3wq+EBUtQo0uFpB2jsGhpAHwBkXTX4y
 z4L8wih+lcAojT5oPDa2Flu9BwF4Lu8o=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2523508vsa.38.1652450471220; 
 Fri, 13 May 2022 07:01:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHXcRtAYS+xD07jsjk++hjWc+e/dpFheU464dl9AbdlqimISKvQjJizPNn4ZCDUnNFcqXcWh1not5cmPYCONY=
X-Received: by 2002:a67:1a02:0:b0:320:a51f:8067 with SMTP id
 a2-20020a671a02000000b00320a51f8067mr2523443vsa.38.1652450470657; Fri, 13 May
 2022 07:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-4-jsnow@redhat.com>
 <e4cf4ded-6b04-ac69-e883-f6aa87a8f8fb@redhat.com>
In-Reply-To: <e4cf4ded-6b04-ac69-e883-f6aa87a8f8fb@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 10:01:00 -0400
Message-ID: <CAFn=p-a3xouvNRkjHnH72aeqHRiGSCKawah7_4U3_kKyCQ+HHQ@mail.gmail.com>
Subject: Re: [RFC PATCH 3/9] tests: install "qemu" namespace package into venv
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000050148505dee51b0a"
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

--00000000000050148505dee51b0a
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 4:26 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 02:06, John Snow wrote:
> > diff --git a/tests/requirements.txt b/tests/requirements.txt
> > index a21b59b4439..0ba561b6bdf 100644
> > --- a/tests/requirements.txt
> > +++ b/tests/requirements.txt
> > @@ -1,5 +1,6 @@
> >   # Add Python module requirements, one per line, to be installed
> >   # in the tests/venv Python virtual environment. For more info,
> >   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> > +# Note that qemu.git/python/ is always implicitly installed.
> >   avocado-framework==88.1
> >   pycdlib==1.11.0
>
> Any reason not to put ./python here?  But anyway,
>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Paolo
>

The path didn't work under all circumstances - I got some bad path errors
for some permutations of CWD/build-type.

And I was not able to combine -e (for qemu) and -r (for this file) in a
single command, so I kept the qemu install separate/special.

Not ideal, I do admit.

(I wanted -e for the in-tree install to not create a potential future
landmine for someone changing python code and then getting confused as to
why nothing changed when running e.g. iotests.)

--00000000000050148505dee51b0a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 4:26 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/13/22 02:06, John Snow wrote:<br>
&gt; diff --git a/tests/requirements.txt b/tests/requirements.txt<br>
&gt; index a21b59b4439..0ba561b6bdf 100644<br>
&gt; --- a/tests/requirements.txt<br>
&gt; +++ b/tests/requirements.txt<br>
&gt; @@ -1,5 +1,6 @@<br>
&gt;=C2=A0 =C2=A0# Add Python module requirements, one per line, to be inst=
alled<br>
&gt;=C2=A0 =C2=A0# in the tests/venv Python virtual environment. For more i=
nfo,<br>
&gt;=C2=A0 =C2=A0# refer to: <a href=3D"https://pip.pypa.io/en/stable/user_=
guide/#id1" rel=3D"noreferrer noreferrer" target=3D"_blank">https://pip.pyp=
a.io/en/stable/user_guide/#id1</a><br>
&gt; +# Note that qemu.git/python/ is always implicitly installed.<br>
&gt;=C2=A0 =C2=A0avocado-framework=3D=3D88.1<br>
&gt;=C2=A0 =C2=A0pycdlib=3D=3D1.11.0<br>
<br>
Any reason not to put ./python here?=C2=A0 But anyway,<br>
<br>
Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a>&gt;<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">The path didn&#39;t work under all circumstances - I got some bad path=
 errors for some permutations of CWD/build-type.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">And I was not able to combine -e (for qemu) and -r=
 (for this file) in a single command, so I kept the qemu install separate/s=
pecial.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Not ideal, I do =
admit.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(I wanted -e for =
the in-tree install to not create a potential future landmine for someone c=
hanging python code and then getting confused as to why nothing changed whe=
n running e.g. iotests.)</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000050148505dee51b0a--


