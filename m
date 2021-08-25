Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CF3F7955
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 17:45:55 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIv65-0000l1-8O
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 11:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIv50-0008V4-Tw
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:44:42 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mIv4z-0000qd-Ad
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 11:44:42 -0400
Received: by mail-ed1-x52e.google.com with SMTP id q17so15740929edv.2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 08:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3AvLItPW7chstCemg3XRNy7ZF1fFLsUdmeWwrY33Kd8=;
 b=b8XfoQjs/lLtXJIL6ibXzy77+zw0ZdGjuEJLz4AlfjUY8F+mpqqwHwvtsOrsmBg8no
 +bmnPuSIuI5xrltl+Sc1w2UeGgx1WkrFwUVq4PtUjtIAPoWkQHWbovqqCVHb2z6ZvTyX
 6B1tyao/tWwu0HAcysLSawZ004y/Lm/NfYATQC2ZtMMU09oaPPcBhbKDO6OBAs5fclcO
 J3uVmOhsmb09Vba6E6QxZbNpARSX7nzvdGZrYmN55VnqrnHGNxTBRj0ogJJuX4FcxOUy
 fhdVb5bMqKiBoqBAPbIRuOp1JljfM69kHXJlpDbI1wR7uP2UcrxJ4edDdMNARh95pPIK
 sOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3AvLItPW7chstCemg3XRNy7ZF1fFLsUdmeWwrY33Kd8=;
 b=pi5ZlfPmc4Gb0Ylm6jIMFzLEOrryUZubYTz+QlOxORCj20qAi3QTdjZL/WYVWYfJJ+
 3WuTff3zAmMk48PaMVISl0UYQNj8f7jwSNjqa7YR7ZfLjLS85sapf8wErQ3TZPrW7GrR
 FO5/YUeO52iM4oF9RHSjb2LGX4A4FIp6j3coTfne2A+LhpixDeTeaNTpTd5lVyS/m667
 X9okS++z5lbTMRXzlWtxWWRH3jcZ/NL5l7gLTp+1tK8JG2phqMzh5vYZP2U50/QrZZ3V
 mHJaY3MsQqDx7RJbedAcezdlAz+yJPxWapCwa/9vKxCZLsKRfJgiOeAePqdXwEZafEMa
 G52w==
X-Gm-Message-State: AOAM532vw+Opq38+i0Ag386T5q6i0BZBz5QuyxQIF6xCyp9uFzSMYyn6
 UEs99OK3qpiOaOgUJwN3jpnCNS5crWHWjhkaFA0=
X-Google-Smtp-Source: ABdhPJztZeGwiSTSPtl57dt8+YCyGa6FMeqYJSQwwQ6Sk1GeOo59jR4XpmlMXwZgNyTvZAP7HMdE/we8QBRzIigep2A=
X-Received: by 2002:aa7:cb8a:: with SMTP id r10mr49802953edt.237.1629906279802; 
 Wed, 25 Aug 2021 08:44:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201118082942.34167-1-marcandre.lureau@redhat.com>
 <877dqihbiq.fsf@dusky.pond.sub.org>
In-Reply-To: <877dqihbiq.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 25 Aug 2021 19:44:28 +0400
Message-ID: <CAJ+F1CJpgpywRyKa6QjeaGdPea=_cN-Q1QqtkYRwJR4cabzL8Q@mail.gmail.com>
Subject: Re: [PATCH] dbus-vmstate: replace g_return with error handling
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d32a6705ca6420fa"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52e.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d32a6705ca6420fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Nov 18, 2020 at 8:33 PM Markus Armbruster <armbru@redhat.com> wrote=
:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Since g_input_stream_read_all() may return less than requested when the
> > stream is malformed, we should treat this condition as a runtime user
> > error (g_return are for programming errors).
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  backends/dbus-vmstate.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c
> > index bd050e8e9c..616d291cfb 100644
> > --- a/backends/dbus-vmstate.c
> > +++ b/backends/dbus-vmstate.c
> > @@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, in=
t
> version_id)
> >                                       &bytes_read, NULL, &err)) {
> >              goto error;
> >          }
> > -        g_return_val_if_fail(bytes_read =3D=3D len, -1);
> > +        if (bytes_read !=3D len) {
> > +            error_report("%s: Failed to read proxy Id", __func__);
>
> Error messages containing function names are code smell.  It's
> consustent with nearby errors, i.e. this patch is not to blame.
>
> > +            return -1;
> > +        }
> >          id[len] =3D 0;
> >
> >          trace_dbus_vmstate_loading(id);
>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>
>
>
For the record, Markus sent a similar patch later "backends/dbus-vmstate:
Fix short read error handling", which has been applied.

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d32a6705ca6420fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 18, 2020 at 8:33 PM Mar=
kus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a=
 href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lu=
reau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Since g_input_stream_read_all() may return less than requested when th=
e<br>
&gt; stream is malformed, we should treat this condition as a runtime user<=
br>
&gt; error (g_return are for programming errors).<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 backends/dbus-vmstate.c | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/backends/dbus-vmstate.c b/backends/dbus-vmstate.c<br>
&gt; index bd050e8e9c..616d291cfb 100644<br>
&gt; --- a/backends/dbus-vmstate.c<br>
&gt; +++ b/backends/dbus-vmstate.c<br>
&gt; @@ -229,7 +229,10 @@ static int dbus_vmstate_post_load(void *opaque, i=
nt version_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;b=
ytes_read, NULL, &amp;err)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_return_val_if_fail(bytes_read =3D=3D le=
n, -1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (bytes_read !=3D len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Fail=
ed to read proxy Id&quot;, __func__);<br>
<br>
Error messages containing function names are code smell.=C2=A0 It&#39;s<br>
consustent with nearby errors, i.e. this patch is not to blame.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 id[len] =3D 0;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_dbus_vmstate_loading(id);<br>
<br>
Reviewed-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" tar=
get=3D"_blank">armbru@redhat.com</a>&gt;<br>
<br>
<br>
</blockquote></div><div><br></div><div>For the record, Markus sent a simila=
r patch later &quot;backends/dbus-vmstate: Fix short read error handling&qu=
ot;, which has been applied.<br></div><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d32a6705ca6420fa--

