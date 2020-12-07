Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860302D1E34
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 00:16:41 +0100 (CET)
Received: from localhost ([::1]:54228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPkG-0002gV-Ki
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 18:16:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kmPiW-00029Q-VB
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:14:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kmPiU-0006Pa-8H
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 18:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607382888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PqK/BI3IktDvwaYDL8l/vH0wDxFpJ2mEOcAJPKUBRUk=;
 b=dukuWHwWTtIrPFEr8bwR6rjfpAo2jgv3lwQEUdpbJOyz9USJmFTOhUu6Pw1QsVYsCvf4XA
 JOen1QLrppyVnID3z3SR6CRvavovh78L4dDUrceIq9LNfbO/dpAYjQQbuFqrfwrkAe6EvN
 IAU1cul1pNpD4gRz7JkRyFA2A8Y9A3I=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-8hSB6CIXO1KJwfx_lxRqwQ-1; Mon, 07 Dec 2020 18:14:46 -0500
X-MC-Unique: 8hSB6CIXO1KJwfx_lxRqwQ-1
Received: by mail-vk1-f198.google.com with SMTP id x134so6857088vkd.17
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 15:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PqK/BI3IktDvwaYDL8l/vH0wDxFpJ2mEOcAJPKUBRUk=;
 b=JLURAOYRgPy2PwYf+5kRM8i/essHtyYmlk/oQoN1qacePqENTw4fFehG1NsA60IJyj
 uq71+pBISExPaV+8bRWB5URnoTvSPzY3jYzalokCxOr5/ZkWwSDAJsQ5FEN+TvpUHrk2
 dvxa1KqJ3XpxGvj0o/OLB5aXUCSslhbaqjQU/ewijBEDR+aWsLR7ojOLwoJcjhG6+WMX
 aW+mEubCtGU5z3JcIHNFelEea35zuanopCMNWHGpy1rDsWiCb4jO8eJ17VERm9Niz79K
 DkZt/ydfYfjYKLCjC5fE6ZWxkco2l19+/b4V+A36/R2Fo8ZksRw6oDmcoZ5w/XGu6D6h
 NOkw==
X-Gm-Message-State: AOAM532VhQMGhCoMP+cl7J54WBQB2kRep8qL9VS0wFYqn4h8x/pc3f8a
 rYT8ELBFDk3xf2plMIW00H9J+JrKPvbWzCNuQhAmvRewsGhKUej8EAlMbkVh8ZhLZVeryl4w/iY
 ffRAB6UT1I+rLBGZ+Q/2Rg9LjDiBE034=
X-Received: by 2002:ab0:4306:: with SMTP id k6mr13690695uak.113.1607382885295; 
 Mon, 07 Dec 2020 15:14:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGEkQJbGpt/Lw8hCYQTZvt0hDoG8aq4uWIyaG7IPtGyrDUw3yKzp4O5H9VzJoB19nAfXSIeTNeUI/qpdgmsVs=
X-Received: by 2002:ab0:4306:: with SMTP id k6mr13690690uak.113.1607382885120; 
 Mon, 07 Dec 2020 15:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20201207200737.5090-1-alex.bennee@linaro.org>
 <CAKJDGDbdHXPAKUXpJFXufs6ip0LNikacvBstdyxr4v3kv8ox=w@mail.gmail.com>
 <8a605a83-1be2-fd93-988f-4b70773e11d2@redhat.com>
In-Reply-To: <8a605a83-1be2-fd93-988f-4b70773e11d2@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 7 Dec 2020 20:14:35 -0300
Message-ID: <CAKJDGDYXY7O_eU1RruiEYxQuBEFOCa_NcZyWo3nqkAtBTM0T-A@mail.gmail.com>
Subject: Re: [RFC PATCH] python: add __repr__ to ConsoleSocket to aid debugging
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000e2d1d705b5e7fdc0"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e2d1d705b5e7fdc0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg, 7 de dez de 2020 19:14, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
escreveu:

> Hi Willian,
>
> On 12/7/20 10:35 PM, Willian Rampazzo wrote:
> > On Mon, Dec 7, 2020 at 5:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org=
>
> wrote:
> >>
> >> While attempting to debug some console weirdness I thought it would be
> >> worth making it easier to see what it had inside.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> ---
> >>  python/qemu/console_socket.py | 8 ++++++++
> >>  1 file changed, 8 insertions(+)
> >>
> >> diff --git a/python/qemu/console_socket.py
> b/python/qemu/console_socket.py
> >> index f060d79e06..77966d1fe9 100644
> >> --- a/python/qemu/console_socket.py
> >> +++ b/python/qemu/console_socket.py
> >> @@ -45,6 +45,14 @@ class ConsoleSocket(socket.socket):
> >>          if drain:
> >>              self._drain_thread =3D self._thread_start()
> >>
> >> +    def __repr__(self):
> >> +        s =3D super(ConsoleSocket, self).__repr__()
> >> +        s =3D s.rstrip(">")
> >> +        s +=3D ", logfile=3D%s" % (self._logfile)
> >> +        s +=3D ", drain_thread=3D%s" % (self._drain_thread)
> >> +        s +=3D ">"
> >
> > We could use something more pythonic for this file. Instead of 3
> > string concatenations, my suggestion is to go with string formatting,
> > like:
> >
> > s =3D "%s,  logfile=3D%s, drain_thread=3D%s>" % (s, self._logfile,
> self._drain_thread)
> >
> > As str is immutable in Python, it avoids unnecessary copies.
>
> With this (and John's comment) addressed, are you OK to add
> your R-b tag?
>

Absolutely!

The result will be the same in the end, so

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


> >
> >> +        return s
> >> +
> >>      def _drain_fn(self) -> None:
> >>          """Drains the socket and runs while the socket is open."""
> >>          while self._open:
> >> --
> >> 2.20.1
> >>
> >>
> >
> >
>
>

--000000000000e2d1d705b5e7fdc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Em seg, 7 de dez de 2020 19:14, Philippe Mathieu-Daud=
=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; e=
screveu:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Willian,<br>
<br>
On 12/7/20 10:35 PM, Willian Rampazzo wrote:<br>
&gt; On Mon, Dec 7, 2020 at 5:10 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:=
alex.bennee@linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@li=
naro.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; While attempting to debug some console weirdness I thought it woul=
d be<br>
&gt;&gt; worth making it easier to see what it had inside.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@=
linaro.org" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>=
&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 python/qemu/console_socket.py | 8 ++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 8 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/python/qemu/console_socket.py b/python/qemu/console_s=
ocket.py<br>
&gt;&gt; index f060d79e06..77966d1fe9 100644<br>
&gt;&gt; --- a/python/qemu/console_socket.py<br>
&gt;&gt; +++ b/python/qemu/console_socket.py<br>
&gt;&gt; @@ -45,6 +45,14 @@ class ConsoleSocket(socket.socket):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if drain:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self._drain_thread=
 =3D self._thread_start()<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 def __repr__(self):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D super(ConsoleSocket, self).__re=
pr__()<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s =3D s.rstrip(&quot;&gt;&quot;)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D &quot;, logfile=3D%s&quot; % (=
self._logfile)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D &quot;, drain_thread=3D%s&quot=
; % (self._drain_thread)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s +=3D &quot;&gt;&quot;<br>
&gt; <br>
&gt; We could use something more pythonic for this file. Instead of 3<br>
&gt; string concatenations, my suggestion is to go with string formatting,<=
br>
&gt; like:<br>
&gt; <br>
&gt; s =3D &quot;%s,=C2=A0 logfile=3D%s, drain_thread=3D%s&gt;&quot; % (s, =
self._logfile, self._drain_thread)<br>
&gt; <br>
&gt; As str is immutable in Python, it avoids unnecessary copies.<br>
<br>
With this (and John&#39;s comment) addressed, are you OK to add<br>
your R-b tag?<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Absolutely!</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>The result will be the same in the end, so</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:wil=
lianr@redhat.com">willianr@redhat.com</a>&gt;</div><div dir=3D"auto"><br></=
div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
&gt; <br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return s<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 def _drain_fn(self) -&gt; None:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;Drains the soc=
ket and runs while the socket is open.&quot;&quot;&quot;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while self._open:<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000e2d1d705b5e7fdc0--


