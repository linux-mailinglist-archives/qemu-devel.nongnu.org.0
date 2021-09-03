Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA524003BD
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 18:56:03 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCTy-0004YR-J5
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 12:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1mMCRl-0003Rj-9H
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:53:45 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1mMCRj-0006zA-Bv
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 12:53:44 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so9116028wrb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40dCSG4nQjF2G54fatAtYT5IbaBrhy8rI1gzcFMx808=;
 b=BgH78wmeOwnUpvFwyy5hCQvELLdW0FFTZujE9fHM8GgzgHfkk9heyYuB51S6FLbGY/
 cx8OP1B281+P8pzxW1aQiVrp9jrkmk11XaTOVxkwJZk3QNgTC10Z6o/ZtfFkrTB5b3Ug
 AqBovnK04t5OEjAIog77ho+NsAhbjxr7g+83/s98KppnjK4RivUhk0/lQUWah/9kNhL5
 Kxf8W7N+7kF3etxS72fPVm0twgF8moI9KfOuQGtZuEcuREQvUIV7hZG1E3XPazSC1qKA
 sZStzOS6dd7Vw89fO5pn3+x4ai2amXWCchwmI5FkdZG2I0iY/nqtFsn6FKmkXYOv+9Xl
 9y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40dCSG4nQjF2G54fatAtYT5IbaBrhy8rI1gzcFMx808=;
 b=Hwyvgjkq48TBGysCC1QFtIaiAiJl6qauv3c6dQeSvyaPVBD0v97WvDSHHm6jDhHdMl
 ui6VxgYAe07Nf8BEmmT26rPdUF6tc1A25PWPcQoBkJRntjB0m79hFsOJy42mwMroKl0j
 mC/vXVangLzsSGGgEv5N7BzmZqIA2xkchwYgJ5tqKaSWveOAbgL7bYhoP8QXVNNxkBla
 Xp0CQ2TckA6q1r7+CpwM+MeWFYQ1m/gWnSWXrqMRRAkPlyBNv+QiKBwD+hDjbK0ENJEC
 8U1RzrGoiyUpmk0YFvfIDjmsgk7e6c8S0UqyC8c7RMYQYliENGSB8fe4rOSfUZa6CGK4
 M3cQ==
X-Gm-Message-State: AOAM5333wSbzlh2huEqmIEJbYSKKRTNFqqrw3ysM/grS71tbDOqwIOAu
 rqdO3FJIjZnMp4ivcsP/nFWOYdBXq3YbImvT1p1Uqg==
X-Google-Smtp-Source: ABdhPJz5iEJ1PsPeVr0geXO/R01r+5CpJvCr6DzAgHetYxMOUB7ESzBvAS/6e1ecJ2K77YXy3bAqTWYbJUZ3OYMANGQ=
X-Received: by 2002:a05:6000:1627:: with SMTP id
 v7mr5222332wrb.195.1630688020049; 
 Fri, 03 Sep 2021 09:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210902212015.1303865-1-dje@google.com>
 <875yvi2sh2.fsf@dusky.pond.sub.org>
In-Reply-To: <875yvi2sh2.fsf@dusky.pond.sub.org>
From: Doug Evans <dje@google.com>
Date: Fri, 3 Sep 2021 09:53:02 -0700
Message-ID: <CADPb22TrHzujCONPAqdTcOYWNw2YtdKn+vPnitL7eU2hJJNDNg@mail.gmail.com>
Subject: Re: [PATCH] net: Add "info neighbors" command
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000002d311305cb1a24de"
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=dje@google.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002d311305cb1a24de
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 3, 2021 at 6:08 AM Markus Armbruster <armbru@redhat.com> wrote:

> Doug Evans <dje@google.com> writes:
>
> > This command dumps the ARP and NDP tables maintained within slirp.
> > One use-case for it is showing the guest's IPv6 address(es).
> >
> > Signed-off-by: Doug Evans <dje@google.com>
> > ---
> >  hmp-commands-info.hx               | 15 +++++++
> >  include/net/slirp.h                |  1 +
> >  net/slirp.c                        | 15 +++++++
> >  tests/acceptance/info_neighbors.py | 69 ++++++++++++++++++++++++++++++
> >  4 files changed, 100 insertions(+)
> >  create mode 100644 tests/acceptance/info_neighbors.py
>
> Standard request for new HMP commands without corresponding QMP
> commands: please state in the commit message why the QMP command is not
> worthwhile.
>
> HMP commands without a QMP equivalent are okay if their functionality
> makes no sense in QMP, or is of use only for human users.
>
> Example for "makes no sense in QMP": setting the current CPU, because a
> QMP monitor doesn't have a current CPU.
>
> Examples for "is of use only for human users": HMP command "help", the
> integrated pocket calculator.
>
> Debugging commands are kind of borderline.  Debugging is commonly a
> human activity, where HMP is just fine.  However, humans create tools to
> assist with their activities, and then QMP is useful.  While I wouldn't
> encourage HMP-only for the debugging use case, I wouldn't veto it.
>


Mostly I was following what I saw for "info usernet".
I don't see a difference between "info neighbors" and "info usernet" so I
went with that.
Both draw their data from libslirp.

I'm happy to add QMP support if necessary.
Note that there is code that parses "info usernet" output, e.g.,
get_info_usernet_hostfwd_port for python.

Presumably we don't want to print text in slirp only to parse it in qemu,
right?
That'll change the qemu/slirp interface.
OTOH, to what extent does libslirp want to export a more formal API for
this, vs just text?

--0000000000002d311305cb1a24de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Fri, Sep 3, 2021 at 6:08 AM Markus Armbruster &lt;<a href=
=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wrote:<br></div></d=
iv><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje=
@google.com</a>&gt; writes:<br>
<br>
&gt; This command dumps the ARP and NDP tables maintained within slirp.<br>
&gt; One use-case for it is showing the guest&#39;s IPv6 address(es).<br>
&gt;<br>
&gt; Signed-off-by: Doug Evans &lt;<a href=3D"mailto:dje@google.com" target=
=3D"_blank">dje@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hmp-commands-info.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 15 +++++++<br>
&gt;=C2=A0 include/net/slirp.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 net/slirp.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++++<br>
&gt;=C2=A0 tests/acceptance/info_neighbors.py | 69 ++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 4 files changed, 100 insertions(+)<br>
&gt;=C2=A0 create mode 100644 tests/acceptance/info_neighbors.py<br>
<br>
Standard request for new HMP commands without corresponding QMP<br>
commands: please state in the commit message why the QMP command is not<br>
worthwhile.<br>
<br>
HMP commands without a QMP equivalent are okay if their functionality<br>
makes no sense in QMP, or is of use only for human users.<br>
<br>
Example for &quot;makes no sense in QMP&quot;: setting the current CPU, bec=
ause a<br>
QMP monitor doesn&#39;t have a current CPU.<br>
<br>
Examples for &quot;is of use only for human users&quot;: HMP command &quot;=
help&quot;, the<br>
integrated pocket calculator.<br>
<br>
Debugging commands are kind of borderline.=C2=A0 Debugging is commonly a<br=
>
human activity, where HMP is just fine.=C2=A0 However, humans create tools =
to<br>
assist with their activities, and then QMP is useful.=C2=A0 While I wouldn&=
#39;t<br>
encourage HMP-only for the debugging use case, I wouldn&#39;t veto it.<br><=
/blockquote><div><br></div><div><br></div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Mostly I was following what I saw for &quot;info user=
net&quot;.</div><div class=3D"gmail_default" style=3D"font-size:small">I do=
n&#39;t see a difference between &quot;info neighbors&quot; and &quot;info =
usernet&quot; so I went with that.</div><div class=3D"gmail_default" style=
=3D"font-size:small">Both draw their data from libslirp.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I&#39;m happy to add QMP support if necessa=
ry.</div><div class=3D"gmail_default" style=3D"font-size:small">Note that t=
here is code that parses &quot;info usernet&quot; output, e.g., get_info_us=
ernet_hostfwd_port for python.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Presumably we don&#39;t want to print text in slirp only to parse it =
in qemu, right?</div><div class=3D"gmail_default" style=3D"font-size:small"=
>That&#39;ll change the qemu/slirp interface.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">OTOH, to what extent does libslirp want to e=
xport a more formal API for this, vs just text?</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div></div></div>

--0000000000002d311305cb1a24de--

