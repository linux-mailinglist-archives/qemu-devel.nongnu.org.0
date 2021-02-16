Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5831CC89
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 16:00:21 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1ps-00013X-MG
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 10:00:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lC1oL-0000bY-WF
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:58:46 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lC1oK-0005bN-3C
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:58:45 -0500
Received: by mail-ed1-x534.google.com with SMTP id j9so2301044edp.1
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P2Bm3LxHZ2shuWpxbjOSjlSO9DT0cOOlOM+uZFqiEE0=;
 b=oPPVSHfaiBsGbFt+WMAhGcKs3k+lgOdvwwvXJeS84Ni0Q91lQC266EfasZG1zjJgnE
 2S16+nwXDHJZ+jgnyQobQ7SbpHLlAX3HxgKPKc3r6qIYc7nQhIM7CF2MXr56cW2+zTXv
 DO57YKiVDpVK3t0qYW1CMZWy926BUdCY03h6lFTLZ03uuk6h2lv855SlNVXkcz46dKG5
 Gvi8AptdsOLCrl54KQaWBydobglqqFnJ3kP/+8bL+iYeR9r8vX9jvMPpx0+G1bfIMpt7
 kXXgYNIATJ6tuAU294TTUkb8ivUNS1crmvHFZXknrir8ydn8y/goCQvYRZCHkXCNwR3R
 bFQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P2Bm3LxHZ2shuWpxbjOSjlSO9DT0cOOlOM+uZFqiEE0=;
 b=d6AEWFmbZf++9pwBAQooZ+TeF3peN46CynjjnPq95avjn+Dc435kJy5gaKsNgD2DvR
 LxEigHtyuUi9+MT8cl1cQQln4FU4zd+W38KezX+nM1wbyUjW9ClYRd1C9JP6JWQLAkWM
 fLUT/qEwVf+oWbvNJ80uSJNPjE7SAEw+H72XRo8be0b0IieEc9Sxjk/ALeboist2CcWg
 htQ+dkow/xWbs6MGbchqQZF0WLCr8HhelmtY6AwcUVlbkske9MNVc99+ZA7sfiVuqbuW
 0561ewdXUR0CCde3rZEK3AfxiDeVEX5ub9hVogG0ZAXC+l1Y96hjjShUu4KespD+ZDyl
 ZdrQ==
X-Gm-Message-State: AOAM532x5WjZFz9rkYi3ksfiu6o7YYQircg6nMSpEPhhP34TCBUKDKJU
 9Fz0s07rjIToTHLeBTH9jBS8HEBsAucxoQMP8XI=
X-Google-Smtp-Source: ABdhPJxS9rgvWhEDEcuFd5YbIh1sf0G4WylZqMkqC6JatFPOEXdmPCAff6rtRjTZbGXaA1p7pi1j/NjhaqmYQr8ly80=
X-Received: by 2002:a05:6402:11d3:: with SMTP id
 j19mr21162417edw.314.1613487522568; 
 Tue, 16 Feb 2021 06:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20210216133837.2347190-1-marcandre.lureau@redhat.com>
 <20210216143027.GL2875719@angien.pipo.sk>
In-Reply-To: <20210216143027.GL2875719@angien.pipo.sk>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 16 Feb 2021 18:58:30 +0400
Message-ID: <CAJ+F1CJd1tReqXnoGZSh=BnRdvCcrQQ+XSH856OgEkOYM8VZ9w@mail.gmail.com>
Subject: Re: [PATCH] qga: return a more explicit error on why a command is
 disabled
To: Peter Krempa <pkrempa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000a1de4805bb7556f7"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a1de4805bb7556f7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 16, 2021 at 6:33 PM Peter Krempa <pkrempa@redhat.com> wrote:

> On Tue, Feb 16, 2021 at 17:38:37 +0400, marcandre.lureau@redhat.com wrote=
:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > qmp_disable_command() now takes an optional error string to return a
> > more explicit error message.
> >
> > Fixes:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1928806
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  include/qapi/qmp/dispatch.h | 3 ++-
> >  qapi/qmp-dispatch.c         | 2 +-
> >  qapi/qmp-registry.c         | 9 +++++----
> >  qga/main.c                  | 4 ++--
> >  4 files changed, 10 insertions(+), 8 deletions(-)
>
> [...]
>
> > diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c
> > index 0a2b20a4e4..ce4bf56b2c 100644
> > --- a/qapi/qmp-dispatch.c
> > +++ b/qapi/qmp-dispatch.c
> > @@ -157,7 +157,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds,
> QObject *request,
> >      }
> >      if (!cmd->enabled) {
> >          error_set(&err, ERROR_CLASS_COMMAND_NOT_FOUND,
> > -                  "The command %s has been disabled for this instance"=
,
> > +                  cmd->err_msg ?: "The command %s has been disabled fo=
r
> this instance",
>
> Passing in the formatting string from a variable looks shady and it's
> hard to ensure that callers pass in the appropriate format modifier ...
>
> >                    command);
> >          goto out;
> >      }
>
> [...]
>
> > diff --git a/qga/main.c b/qga/main.c
> > index e7f8f3b161..c59b610691 100644
> > --- a/qga/main.c
> > +++ b/qga/main.c
> > @@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const
> QmpCommand *cmd, void *opaque)
> >      }
> >      if (!whitelisted) {
> >          g_debug("disabling command: %s", name);
> > -        qmp_disable_command(&ga_commands, name);
> > +        qmp_disable_command(&ga_commands, name, "The command was
> disabled after fsfreeze.");
>
> ... such as here where '%s' is missing. Luckily that is not a problem
> compared to when there would be more than one format modifier.
>
>
Sure, although it's an internal API, I agree it's error prone.

But the error message looks definitely better.
>

> >      }
> >  }
>
> My suggestion would be to store a boolean flag that the command was
> disabled due to an ongoing fsfreeze and then choose the appropriate
> error message directly at the point where it's reported.
>

Let's make it an enum for the reason.
thanks


--=20
Marc-Andr=C3=A9 Lureau

--000000000000a1de4805bb7556f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 16, 2021 at 6:33 PM Peter=
 Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com">pkrempa@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 Feb 16, 2021 at 17:38:37 +0400, <a href=3D"mailto:marcandre.lureau@redhat.=
com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; qmp_disable_command() now takes an optional error string to return a<b=
r>
&gt; more explicit error message.<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1928806" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1928806</a><br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 include/qapi/qmp/dispatch.h | 3 ++-<br>
&gt;=C2=A0 qapi/qmp-dispatch.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 qapi/qmp-registry.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 9 +++++--=
--<br>
&gt;=C2=A0 qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 4 files changed, 10 insertions(+), 8 deletions(-)<br>
<br>
[...]<br>
<br>
&gt; diff --git a/qapi/qmp-dispatch.c b/qapi/qmp-dispatch.c<br>
&gt; index 0a2b20a4e4..ce4bf56b2c 100644<br>
&gt; --- a/qapi/qmp-dispatch.c<br>
&gt; +++ b/qapi/qmp-dispatch.c<br>
&gt; @@ -157,7 +157,7 @@ QDict *qmp_dispatch(const QmpCommandList *cmds, QO=
bject *request,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!cmd-&gt;enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_set(&amp;err, ERROR_CLASS_COMM=
AND_NOT_FOUND,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
The command %s has been disabled for this instance&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd-&g=
t;err_msg ?: &quot;The command %s has been disabled for this instance&quot;=
,<br>
<br>
Passing in the formatting string from a variable looks shady and it&#39;s<b=
r>
hard to ensure that callers pass in the appropriate format modifier ...<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
ommand);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
[...]<br>
<br>
&gt; diff --git a/qga/main.c b/qga/main.c<br>
&gt; index e7f8f3b161..c59b610691 100644<br>
&gt; --- a/qga/main.c<br>
&gt; +++ b/qga/main.c<br>
&gt; @@ -375,7 +375,7 @@ static void ga_disable_non_whitelisted(const QmpCo=
mmand *cmd, void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!whitelisted) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;disabling command: %s&=
quot;, name);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_disable_command(&amp;ga_commands, nam=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qmp_disable_command(&amp;ga_commands, nam=
e, &quot;The command was disabled after fsfreeze.&quot;);<br>
<br>
... such as here where &#39;%s&#39; is missing. Luckily that is not a probl=
em<br>
compared to when there would be more than one format modifier.<br>
<br></blockquote><div><br></div><div>Sure, although it&#39;s an internal AP=
I, I agree it&#39;s error prone.</div><div> <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
But the error message looks definitely better.<br></blockquote><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
<br>
My suggestion would be to store a boolean flag that the command was<br>
disabled due to an ongoing fsfreeze and then choose the appropriate<br>
error message directly at the point where it&#39;s reported.<br></blockquot=
e><div><br></div><div>Let&#39;s make it an enum for the reason.</div><div>t=
hanks<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000a1de4805bb7556f7--

