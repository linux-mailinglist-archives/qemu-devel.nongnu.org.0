Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361AD314385
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:12:20 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Fhb-0003H1-Ag
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:12:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9BlD-0001cZ-Pf
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:59:48 -0500
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29]:44149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1l9Bl7-0004Iz-H0
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:59:46 -0500
Received: by mail-vk1-xa29.google.com with SMTP id k1so3372163vkb.11
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Of2VEG1RuJXyTHNuieaZghUQDCqJ3O2Jukiu+Y1mZp4=;
 b=s1ytNWDbqXRXwaqQIdi5K3VNhOGPcAMAQpXqs/LwTmkY611SUUzg7NT5NcLgIwqVdm
 NembCu/A+1cy/8iL1ZCJohelC2W8UqE0C+1WigE87SyWfc7qGqLPRH1npU11iT5UFqdJ
 rriazB8rlcCzj42QGyJDA8QPUDOw9SK5lDx6CMTJdih04YQ+HkzQgkoSYehBra681K3S
 YfXko0Vxnsi3JEkWNKO/QTANGmYVsRKgMhFBWMqWr4I8036dTJedmsRazLZ7PGskgQdU
 qXeHwx02W8T9W/GxFTgzgwLuevLhgoMY4Ro53NaYbS+FSAOEGHv0Jaep8vq2KSRznpYy
 n89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Of2VEG1RuJXyTHNuieaZghUQDCqJ3O2Jukiu+Y1mZp4=;
 b=SM1dGUsAcMPOyfTqF5M48Vr8kQ7gvm4VZx+XsHjJeEFkYAwTesHOpQZdn+ySiSjk92
 aBP1bBGq5I+F6zqQzlFjahztjzSYSK60HRbzKBVbW08rqUOuwqzTSctgkch1lwPZGbMC
 pYj/AeRSbo5Ki68mg/ANenJbDi70yaIKQ1Llw3wB3gYftrxTRr7j/Q5gEPndhgYyGp9u
 Zq+sEIv2jyaLtvPmScJ9ANhJLfGrVxt/whHQvil0nL0g6qaQJ/l7qopFD3MWeTxCwL6P
 ivMJQruDIfTyst07TQnxDPMQEfu4XtJSsdq6KMRLISGDklPNPtUL8D367QO72CELoTpD
 aNBQ==
X-Gm-Message-State: AOAM531gIcoPoX4VC7Kb+1tdujVQ5BrwAEiwZau9x/J/Pihp7AgreN9d
 4kWLAGTzYIMqlJvdSubfpqIPAMgkBXyAAGdd2pIT0A==
X-Google-Smtp-Source: ABdhPJzewBvGmgW11X13UE2lpE/7xZjVlSLFMUTN+2rcN9H0FTKWtGieTAy6rOl91OIJqpWKFBlA2cMTDtzhGr70tAA=
X-Received: by 2002:ac5:cb0f:: with SMTP id r15mr11216619vkl.18.1612810778269; 
 Mon, 08 Feb 2021 10:59:38 -0800 (PST)
MIME-Version: 1.0
References: <20210203213729.1940893-1-dje@google.com>
 <20210203213729.1940893-2-dje@google.com>
 <fc97283f-51ca-2a2d-d8ae-1345b990e52c@redhat.com>
In-Reply-To: <fc97283f-51ca-2a2d-d8ae-1345b990e52c@redhat.com>
From: Doug Evans <dje@google.com>
Date: Mon, 8 Feb 2021 10:59:01 -0800
Message-ID: <CADPb22TSNA-KQmUO0hSGLtWr0tc7H5++gKBAqnpTP-5iarisMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] net/slirp.c: Refactor address parsing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Content-Type: multipart/alternative; boundary="00000000000087c82805bad7c583"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a29;
 envelope-from=dje@google.com; helo=mail-vk1-xa29.google.com
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

--00000000000087c82805bad7c583
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 8, 2021 at 3:09 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om>
wrote:

> Hi Doug,
>
> On 2/3/21 10:37 PM, dje--- via wrote:
> > ... in preparation for adding ipv6 host forwarding support.
>
> Please duplicate subject line, else this commit description as it
> doesn't make sense.
>


Hmmm. Is this a bug in git format-patch/send-email?

I agree the current behaviour is suboptimal ... Perhaps there's an option
I'm not adding?
Or does one manually work around this?


> ---
> >  net/slirp.c | 200 +++++++++++++++++++++++++++++++++-------------------
> >  slirp       |   2 +-
> >  2 files changed, 130 insertions(+), 72 deletions(-)
> >
> ...
>
> > diff --git a/slirp b/slirp
> > index 8f43a99191..358c0827d4 160000
> > --- a/slirp
> > +++ b/slirp
> > @@ -1 +1 @@
> > -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> > +Subproject commit 358c0827d49778f016312bfb4167fe639900681f
> >
>
> When updating submodules, please describe changes (usually -
> when possible - a previous commit updating the submodule is
> preferred).
>
> I can not apply your patch using either
> https://git.qemu.org/git/libslirp.git or
> https://gitlab.freedesktop.org/slirp/libslirp.git:
>
> fatal: bad object 358c0827d49778f016312bfb4167fe639900681f
>


I think that's expected until the patch has been merged from libslirp into
qemu 's tree.
Samuel, how do qemu patches involving libslirp changes usually work?
Should I have held off submitting the qemu patch until the libslirp
prerequisite has been added to qemu's tree,
or maybe I should include the libslirp patch so that people can at least
apply it (with a caveat saying the patch is already in libslirp.git) until
it's added to the qemu tree?

--00000000000087c82805bad7c583
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Mon, Feb 8, 2021 at 3:09 AM Philippe Mathieu-Daud=C3=A9 &l=
t;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; wrote:<br>=
</div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Doug,<br>
<br>
On 2/3/21 10:37 PM, dje--- via wrote:<br>
&gt; ... in preparation for adding ipv6 host forwarding support.<br>
<br>
Please duplicate subject line, else this commit description as it<br>
doesn&#39;t make sense.<br></blockquote><div><br></div><div><br></div><div =
class=3D"gmail_default" style=3D"font-size:small">Hmmm. Is this a bug in gi=
t format-patch/send-email?</div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small=
">I agree the current behaviour is suboptimal ... Perhaps there&#39;s an op=
tion I&#39;m not adding?</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">Or does one manually work around this?</div><div class=3D"gmail_d=
efault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; ---<br>
&gt;=C2=A0 net/slirp.c | 200 +++++++++++++++++++++++++++++++++-------------=
------<br>
&gt;=C2=A0 slirp=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 2 files changed, 130 insertions(+), 72 deletions(-)<br>
&gt; <br>
...<br>
<br>
&gt; diff --git a/slirp b/slirp<br>
&gt; index 8f43a99191..358c0827d4 160000<br>
&gt; --- a/slirp<br>
&gt; +++ b/slirp<br>
&gt; @@ -1 +1 @@<br>
&gt; -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece<br>
&gt; +Subproject commit 358c0827d49778f016312bfb4167fe639900681f<br>
&gt; <br>
<br>
When updating submodules, please describe changes (usually -<br>
when possible - a previous commit updating the submodule is<br>
preferred).<br>
<br>
I can not apply your patch using either<br>
<a href=3D"https://git.qemu.org/git/libslirp.git" rel=3D"noreferrer" target=
=3D"_blank">https://git.qemu.org/git/libslirp.git</a> or<br>
<a href=3D"https://gitlab.freedesktop.org/slirp/libslirp.git" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.freedesktop.org/slirp/libslirp.git</=
a>:<br>
<br>
fatal: bad object 358c0827d49778f016312bfb4167fe639900681f<br></blockquote>=
<div><br></div><div><br></div><div class=3D"gmail_default" style=3D"font-si=
ze:small">I think that&#39;s expected until the patch has been merged from =
libslirp=C2=A0into qemu &#39;s tree.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">Samuel, how do qemu patches involving libslirp=C2=A0c=
hanges usually work?</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Should I have held off submitting the qemu patch until the libslirp p=
rerequisite has been added to qemu&#39;s tree,</div><div class=3D"gmail_def=
ault" style=3D"font-size:small">or maybe I should include the libslirp=C2=
=A0patch so that people can at least apply it (with a caveat saying the pat=
ch is already in libslirp.git) until it&#39;s added to the qemu tree?</div>=
<div class=3D"gmail_default" style=3D"font-size:small"></div></div></div>

--00000000000087c82805bad7c583--

