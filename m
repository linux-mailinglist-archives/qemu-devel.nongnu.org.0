Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B8A526398
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:16:10 +0200 (CEST)
Received: from localhost ([::1]:49692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npW5R-0008QY-HL
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npW2A-0005IT-GH
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:12:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1npW25-0001SG-Tx
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652451157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mm5m1OOG1CkbU2nDBLtgIqKXJMsHWwAruqxzFrEDzc0=;
 b=MM8pCn56o9efan4Fau26J+m4pGFPTQKbNXeG9JedgcgsS4u0psow/iwZRLsIj+sNbD6BsQ
 B0EdE/ZSV/8GLRC4UOmXP20MXN7z3IMTdRGchGqnxtISt1aK0Bs+Bvc5b6HePTSC1s6qjY
 ZNTYiKfN1RbOhTDYexQnC7VLU+80prU=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-DiPF2X-uP7KWRd1VEAD0GA-1; Fri, 13 May 2022 10:12:36 -0400
X-MC-Unique: DiPF2X-uP7KWRd1VEAD0GA-1
Received: by mail-ua1-f70.google.com with SMTP id
 c19-20020ab023d3000000b003627f7c63d4so3817252uan.13
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mm5m1OOG1CkbU2nDBLtgIqKXJMsHWwAruqxzFrEDzc0=;
 b=qWxBcQxhUBQ8PdTQp7KklOLw5ECL5sDNL2VMl3yFx9MGWzJ3aisRy8mYyALPU9lE5d
 f788tZGQEujlXK5izGwUmM4wmCs+NfnL44j1EZath9hFveTu6/bovp0HRdHq+7894/FS
 zvX/r8MRbG/5ym02Sr0iZf1RUOJyOCZgz6PrxD8OQ98rlBa8/DWaIb97S+tX+aKnh3y9
 GFnPX/nyHnrA0sR0KphNyMzr49c/xsAZnN+v6098dQcHwmZhTc+4vMKhh69iZ2K6NjSK
 smLyl7olAEWvDSiPTKbd7XARFZukuaJSi9BMuNgFb/E0C/6aRjvD8Xzwyp0s9HmrKmnz
 sWEg==
X-Gm-Message-State: AOAM530xND1EgFdC+WNZIZ+MYLa03Ss1KtdaCjrImvCePTjQBscG97uz
 pWqk+hWAGsnE/QoxyOKtMUguj55FkEkd+coBxMiEaLg+sT+66oC+DRoHevzEnvksUi+xwYYnkBg
 WtvGMRFt4BCnBzFK0eItLUwC1AZNhafo=
X-Received: by 2002:a1f:ce46:0:b0:34e:b018:c8a4 with SMTP id
 e67-20020a1fce46000000b0034eb018c8a4mr2239722vkg.26.1652451155720; 
 Fri, 13 May 2022 07:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRN8QU8EM+3rdq7UJiCrqzlujo2qBsA8RF6rh959JEfeHoJk5nMtP3pvOAmoLtv4UF/2uhX5iD/tXOGeEUFn0=
X-Received: by 2002:a1f:ce46:0:b0:34e:b018:c8a4 with SMTP id
 e67-20020a1fce46000000b0034eb018c8a4mr2239709vkg.26.1652451155479; Fri, 13
 May 2022 07:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220513000609.197906-1-jsnow@redhat.com>
 <20220513000609.197906-7-jsnow@redhat.com>
 <cce38c36-30d6-2868-8e50-570216891549@redhat.com>
In-Reply-To: <cce38c36-30d6-2868-8e50-570216891549@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 13 May 2022 10:12:24 -0400
Message-ID: <CAFn=p-ZXjaGN8Sf8+UxS9q1-xZD4_g4A6MBes2ip3JevUt1Tpw@mail.gmail.com>
Subject: Re: [RFC PATCH 6/9] tests: add check-venv as a dependency of check
 and check-block
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Daniel Berrange <berrange@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000021a52a05dee54474"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

--00000000000021a52a05dee54474
Content-Type: text/plain; charset="UTF-8"

On Fri, May 13, 2022, 4:41 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 5/13/22 02:06, John Snow wrote:
> >   meson, create the python venv for block tests.
> > +.PHONY: check-block
> > +check-block: check-venv
> > +     @echo  # Without some rule, this doesn't run at all. Why?
> > +
> > +
> >   # Consolidated targets
> >
> >   .PHONY: check check-clean get-vm-images
> > -check:
> > +check: check-venv
> > +     @echo # ???
> >
>
> I think you need instead:
>
> # The do-meson-check and do-meson-bench targets are defined in
> Makefile.mtest
> do-meson-check do-meson-bench: check-venv
>
> and I would even add "all" to the targets that create the virtual
> environment.
>
> Paolo
>

Great, thanks! I'll try that out today.

--00000000000021a52a05dee54474
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, May 13, 2022, 4:41 AM Paolo Bonzini &lt;<a hre=
f=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On 5/13/22 02:06, John Snow wrote:<br>
&gt;=C2=A0 =C2=A0meson, create the python venv for block tests.<br>
&gt; +.PHONY: check-block<br>
&gt; +check-block: check-venv<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo=C2=A0 # Without some rule, this doesn&#39;t=
 run at all. Why?<br>
&gt; +<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0# Consolidated targets<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0.PHONY: check check-clean get-vm-images<br>
&gt; -check:<br>
&gt; +check: check-venv<br>
&gt; +=C2=A0 =C2=A0 =C2=A0@echo # ???<br>
&gt;=C2=A0 =C2=A0<br>
<br>
I think you need instead:<br>
<br>
# The do-meson-check and do-meson-bench targets are defined in Makefile.mte=
st<br>
do-meson-check do-meson-bench: check-venv<br>
<br>
and I would even add &quot;all&quot; to the targets that create the virtual=
 environment.<br>
<br>
Paolo<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Great, thanks! I&#39;ll try that out today.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--00000000000021a52a05dee54474--


