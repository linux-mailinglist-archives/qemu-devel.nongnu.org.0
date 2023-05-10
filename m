Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B29026FDAD2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:34:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgDH-0005iq-Fh; Wed, 10 May 2023 05:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pwgDF-0005gy-3J
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pwgCz-0004iy-Az
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683711244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i3RVPdXtmHgj98yaq6C++/G6KNpLQg10yUe3qaDlbJw=;
 b=g+E/p3b5UcWDF66z7IAgvXjSYSb0w121FktL59j3QSH2c+WhxtN29pg+U3HU+KslHY1a6z
 pFSAAEkXL/ci/Og9sYIB6OTcpKh5/VcgLTjSdEZ4BVI9/OSIPKxkDIUVpAGjyvgyNp42Y5
 ve/dIq1skpWpjEIUc+o4yWfsfxSmhZQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661--GPRgTmOOhW0fc7bql4_aA-1; Wed, 10 May 2023 05:34:03 -0400
X-MC-Unique: -GPRgTmOOhW0fc7bql4_aA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-965e5cfca7cso676002666b.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683711242; x=1686303242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i3RVPdXtmHgj98yaq6C++/G6KNpLQg10yUe3qaDlbJw=;
 b=aNcBkb2g5dwaiJZkDgmsVZfuqOqjun/1IrkOIZbhoyVTWkCx9yEJos0AAkXvtYP6Lt
 rdVwIqAfyQxwSEXUSOlponAbjoLrZqLFT6QERs8DA3xwIkO8/yAF+yD54+V1lxrLzhSs
 oRs2pKtrP/H+AhM1w3E7IqazPhcZlN8mKddIO5I+dyXnSR14Qbv3Ip14PgP2HdCFqyKj
 w19pUJ5LOpohghnipLFM1yEV4+cGsaoGR2yxBwGU/0jgSzNx6f6pPC960QqpmdxECT2/
 o7NxLgHE/YCqzjGQA7qtJmo4XHHW5BhjPw31bPSh34gBbGFs3fUDhQjOBdR8EnX/JxL/
 mqKA==
X-Gm-Message-State: AC+VfDxlRG59Tj9gwH0RztHxXXhjx6NcWkKE8w0Lfqvm1uoBiSLqvoGY
 bBo7CbB3M47kwpc1zM8af4WEMEZzTmPHS5dy6qeSo4HP8vQ5P6dWisEm3ky7QA04GmwJBXJrH8a
 aVHBBNVlE6Hnf3F/4Tw2PPB3tnKYL8X8=
X-Received: by 2002:a17:907:2d0c:b0:966:5c04:2c5a with SMTP id
 gs12-20020a1709072d0c00b009665c042c5amr9907691ejc.69.1683711242250; 
 Wed, 10 May 2023 02:34:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6RBI16G9QJMYMpSDXuvwpwjwlkMwdbad7WEKVYXHYCMS/RGrKN5h9oONKWUG2rro1/0fjrUvsUyABHVybInb0=
X-Received: by 2002:a17:907:2d0c:b0:966:5c04:2c5a with SMTP id
 gs12-20020a1709072d0c00b009665c042c5amr9907670ejc.69.1683711241907; Wed, 10
 May 2023 02:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230510072531.3937189-1-marcandre.lureau@redhat.com>
 <877ctg7csj.fsf@pond.sub.org>
In-Reply-To: <877ctg7csj.fsf@pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 10 May 2023 13:33:50 +0400
Message-ID: <CAMxuvaxDXA0+11a=Ors1UsBNpL5YaBDmVaerHJCW1-AWJ6pcGg@mail.gmail.com>
Subject: Re: [PATCH] chardev: report the handshake error
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000007a87ea05fb5392b4"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--0000000000007a87ea05fb5392b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, May 10, 2023 at 1:31=E2=80=AFPM Markus Armbruster <armbru@redhat.co=
m> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This can help to debug connection issues.
> >
> > Related to:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D2196182
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  chardev/char-socket.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> > index 8c58532171..e8e3a743d5 100644
> > --- a/chardev/char-socket.c
> > +++ b/chardev/char-socket.c
> > @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTask
> *task, gpointer user_data)
> >  {
> >      Chardev *chr =3D user_data;
> >      SocketChardev *s =3D user_data;
> > +    Error *err =3D NULL;
> >
> > -    if (qio_task_propagate_error(task, NULL)) {
> > +    if (qio_task_propagate_error(task, &err)) {
> > +        error_reportf_err(err,
> > +                          "websock handshake of character device %s
> failed: ",
> > +                          chr->label);
>
> Code smell: reports an error without failing the function.
>
> Should it be a warning instead?
>
>
Makes sense, I just did the same as check_report_connect_error() , but I
think they should all be warnings too.

>          tcp_chr_disconnect(chr);
> >      } else {
> >          if (s->do_telnetopt) {
> > @@ -778,8 +782,12 @@ static void tcp_chr_tls_handshake(QIOTask *task,
> >  {
> >      Chardev *chr =3D user_data;
> >      SocketChardev *s =3D user_data;
> > +    Error *err =3D NULL;
> >
> > -    if (qio_task_propagate_error(task, NULL)) {
> > +    if (qio_task_propagate_error(task, &err)) {
> > +        error_reportf_err(err,
> > +                          "TLS handshake of character device %s failed=
:
> ",
> > +                          chr->label);
> >          tcp_chr_disconnect(chr);
> >      } else {
> >          if (s->is_websock) {
>
> Likewise.
>

--0000000000007a87ea05fb5392b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 10, 2023 at 1:31=E2=80=
=AFPM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><a href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">mar=
candre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This can help to debug connection issues.<br>
&gt;<br>
&gt; Related to:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D2196182" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D2196182</a><br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 chardev/char-socket.c | 12 ++++++++++--<br>
&gt;=C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
&gt; index 8c58532171..e8e3a743d5 100644<br>
&gt; --- a/chardev/char-socket.c<br>
&gt; +++ b/chardev/char-socket.c<br>
&gt; @@ -742,8 +742,12 @@ static void tcp_chr_websock_handshake(QIOTask *ta=
sk, gpointer user_data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Chardev *chr =3D user_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SocketChardev *s =3D user_data;<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (qio_task_propagate_error(task, NULL)) {<br>
&gt; +=C2=A0 =C2=A0 if (qio_task_propagate_error(task, &amp;err)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;websock handshake of character device %s failed=
: &quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 chr-&gt;label);<br>
<br>
Code smell: reports an error without failing the function.<br>
<br>
Should it be a warning instead?<br>
<br></blockquote><div><br></div><div>Makes sense, I just did the same as ch=
eck_report_connect_error() , but I think they should all be warnings too.</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_chr_disconnect(chr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;do_telnetopt) {<br>
&gt; @@ -778,8 +782,12 @@ static void tcp_chr_tls_handshake(QIOTask *task,<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Chardev *chr =3D user_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SocketChardev *s =3D user_data;<br>
&gt; +=C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (qio_task_propagate_error(task, NULL)) {<br>
&gt; +=C2=A0 =C2=A0 if (qio_task_propagate_error(task, &amp;err)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_reportf_err(err,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 &quot;TLS handshake of character device %s failed: &q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 chr-&gt;label);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcp_chr_disconnect(chr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;is_websock) {<br>
<br>
Likewise.<br></blockquote>=C2=A0<br></div></div>

--0000000000007a87ea05fb5392b4--


