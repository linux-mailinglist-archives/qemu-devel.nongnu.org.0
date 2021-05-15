Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C830D381AA0
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:03:28 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhzZP-0007M7-1h
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lhzYQ-0006hS-LB
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lhzYN-0008U6-RF
 for qemu-devel@nongnu.org; Sat, 15 May 2021 15:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621105341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nl59KbCFbew/darToTdwGOy4Agxn61SNfktMgDr0d78=;
 b=W/kEFDcq8cDK87yqgqZNlQlVdhC0cLvxjwdhBF/IMk6TqPRhYgrt4dfDAGQOJor/ABstf7
 3G0+bSrg/CURVYzpmYs5IUD5zi3zg9DFYQAjrXBlY5aovt6D6Vme8oUIFj+10blFMp6XuO
 /p6LDYqfefGtautZzZYJYnMDIdPeW7g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-x1IIeUMoO3qZkT1J6oPtKA-1; Sat, 15 May 2021 15:02:18 -0400
X-MC-Unique: x1IIeUMoO3qZkT1J6oPtKA-1
Received: by mail-pj1-f70.google.com with SMTP id
 o1-20020a17090a4201b029015c8f11f550so3784735pjg.5
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 12:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nl59KbCFbew/darToTdwGOy4Agxn61SNfktMgDr0d78=;
 b=TCpcthi1lCc9TOHXzn61HOvESyy7OKcjn3a5A4ML28jVjWun2fzAJWtGnkLHDusCcs
 8uPG1WLncZRG9QlUtTJomqIKAJXZdAN602tqTJaWs/SCrp8ifvB21pCM7ms59D50iXYV
 Nl3TYKbA2yNOHhxjnjTYTym1G3XtGjDLwkA72FHTrlWJv+QG+8ciRqo8OYZSk4Q1EADC
 ebqSbVxvRQjsMydrl3eCAohla2zLvgNwNtlCLtHohyNMGXD4zvybtPppqNRRFxqSmIAQ
 byw1m6713faUV1SPtWsqPKrkEzS00su5Ql91T7C7AeOX2AITenCfHPYfzDookwqRF4iv
 CxkA==
X-Gm-Message-State: AOAM530Qh242XSevtIdY+S+NWmV4Ec3i8XnQw/R6UCVe5E++boJWPeA1
 vt9fL4X5wHUlWyDoruA7ExO7fzRbc9ocnjQqqwlgx3vsfOeypdadYX5hdw/2HxLMlTnwgV1oQrU
 SjK08jkXmzL20SGFNxnCntJGce8FQrQo=
X-Received: by 2002:a65:638e:: with SMTP id h14mr38546701pgv.108.1621105337474; 
 Sat, 15 May 2021 12:02:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyiWw4BpBmgk/rRHkPKUA+d1EklHMpCcdRv5Lqzhq2K+Sry69ZcRl/2zedvAc0h9uD8wCfe2ZYyPevdd8sjC/I=
X-Received: by 2002:a65:638e:: with SMTP id h14mr38546680pgv.108.1621105337253; 
 Sat, 15 May 2021 12:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210514111310.1756593-1-marcandre.lureau@redhat.com>
 <CAFEAcA_xf7CAqEsn5EPSht3+7wOXKvnnQ+OGGp8aDw9A_f3AEA@mail.gmail.com>
 <48378522-0a28-b1c6-2a28-72c85202fcb2@redhat.com>
In-Reply-To: <48378522-0a28-b1c6-2a28-72c85202fcb2@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Sat, 15 May 2021 23:02:06 +0400
Message-ID: <CAMxuvayho0Lgyejz8KPCDfmsbHZE9ANMdKv+NCdooUHoaJyY4Q@mail.gmail.com>
Subject: Re: [PULL v3 0/1] Rtd patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c556ff05c262ff94"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c556ff05c262ff94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sat, May 15, 2021 at 5:20 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> On 5/14/21 8:33 PM, Peter Maydell wrote:
> > On Fri, 14 May 2021 at 12:13, <marcandre.lureau@redhat.com> wrote:
> >>
> >> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >>
> >> The following changes since commit
> 2d3fc4e2b069494b1e9e2e4a1e3de24cbc036426:
> >>
> >>   Merge remote-tracking branch
> 'remotes/armbru/tags/pull-misc-2021-05-12' into staging (2021-05-13
> 20:13:24 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>   git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull-request
> >>
> >> for you to fetch changes up to 73e6aec6522e1edd63f631c52577b49a39bc234=
f:
> >>
> >>   sphinx: adopt kernel readthedoc theme (2021-05-14 15:05:03 +0400)
> >>
> >> ----------------------------------------------------------------
> >> Pull request
> >>
> >> ----------------------------------------------------------------
> >
> >
> > Applied, thanks.
>
> After rebasing I'm getting:
>
> Program sphinx-build-3 found: YES
> docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
> Configuration error:
> There is a programmable error in your configuration file:
>
> Traceback (most recent call last):
>   File "/home/phil/source/qemu/docs/conf.py", line 155, in <module>
>     import sphinx_rtd_theme
> ModuleNotFoundError: No module named 'sphinx_rtd_theme'
>
> During handling of the above exception, another exception occurred:
>
> Traceback (most recent call last):
>   File "/usr/lib/python3.8/site-packages/sphinx/config.py", line 361, in
> eval_config_file
>     execfile_(filename, namespace)
>   File "/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py", line
> 81, in execfile_
>     exec(code, _globals)
>   File "/home/phil/source/qemu/docs/conf.py", line 157, in <module>
>     raise ConfigError(
> sphinx.errors.ConfigError: The Sphinx 'sphinx_rtd_theme' HTML theme was
> not found.
>
> Is python3-sphinx_rtd_theme a required dependency now?
>
>
Yes, only If you --enable-docs. Otherwise, you should get a warning and doc
will be disabled. Mine is less ugly than yours, not sure why:

Program sphinx-build-3 found: YES (/usr/bin/sphinx-build-3)
../docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:
Configuration error:
The Sphinx 'sphinx_rtd_theme' HTML theme was not found.


Program python3 found: YES (/usr/bin/python3)

--000000000000c556ff05c262ff94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 15, 2021 at 5:20 PM Phi=
lippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 5/14/21 8:33 PM, Peter Maydell wrote:<br>
&gt; On Fri, 14 May 2021 at 12:13, &lt;<a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit 2d3fc4e2b069494b1e9e2e4a1e3de24=
cbc036426:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/armbru/tags/=
pull-misc-2021-05-12&#39; into staging (2021-05-13 20:13:24 +0100)<br>
&gt;&gt;<br>
&gt;&gt; are available in the Git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0git@gitlab.com:marcandre.lureau/qemu.git tags/rtd-pull=
-request<br>
&gt;&gt;<br>
&gt;&gt; for you to fetch changes up to 73e6aec6522e1edd63f631c52577b49a39b=
c234f:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0sphinx: adopt kernel readthedoc theme (2021-05-14 15:0=
5:03 +0400)<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt;&gt; Pull request<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt; <br>
&gt; <br>
&gt; Applied, thanks.<br>
<br>
After rebasing I&#39;m getting:<br>
<br>
Program sphinx-build-3 found: YES<br>
docs/meson.build:30: WARNING: /usr/bin/sphinx-build-3:<br>
Configuration error:<br>
There is a programmable error in your configuration file:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/home/phil/source/qemu/docs/conf.py&quot;, line 155, in &=
lt;module&gt;<br>
=C2=A0 =C2=A0 import sphinx_rtd_theme<br>
ModuleNotFoundError: No module named &#39;sphinx_rtd_theme&#39;<br>
<br>
During handling of the above exception, another exception occurred:<br>
<br>
Traceback (most recent call last):<br>
=C2=A0 File &quot;/usr/lib/python3.8/site-packages/sphinx/config.py&quot;, =
line 361, in<br>
eval_config_file<br>
=C2=A0 =C2=A0 execfile_(filename, namespace)<br>
=C2=A0 File &quot;/usr/lib/python3.8/site-packages/sphinx/util/pycompat.py&=
quot;, line<br>
81, in execfile_<br>
=C2=A0 =C2=A0 exec(code, _globals)<br>
=C2=A0 File &quot;/home/phil/source/qemu/docs/conf.py&quot;, line 157, in &=
lt;module&gt;<br>
=C2=A0 =C2=A0 raise ConfigError(<br>
sphinx.errors.ConfigError: The Sphinx &#39;sphinx_rtd_theme&#39; HTML theme=
 was<br>
not found.<br>
<br>
Is python3-sphinx_rtd_theme a required dependency now?<br>
<br></blockquote><div><br></div><div>Yes, only If you --enable-docs. Otherw=
ise, you should get a warning and doc will be disabled. Mine is less ugly t=
han yours, not sure why:<br></div><div><br></div><div>Program sphinx-build-=
3 found: YES (/usr/bin/sphinx-build-3)<br>../docs/meson.build:30: WARNING: =
/usr/bin/sphinx-build-3: <br>Configuration error:<br>The Sphinx &#39;sphinx=
_rtd_theme&#39; HTML theme was not found.<br><br><br>Program python3 found:=
 YES (/usr/bin/python3)</div><div><br></div><br></div></div>

--000000000000c556ff05c262ff94--


