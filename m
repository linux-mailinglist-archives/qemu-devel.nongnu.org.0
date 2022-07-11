Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC85570CBA
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 23:33:20 +0200 (CEST)
Received: from localhost ([::1]:51704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB11r-0008WH-4G
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 17:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0yw-0006Vn-7t
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:30:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1oB0yt-00023Y-81
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 17:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657575014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCHGZwHPlGBsSTJGdV154dZiAEV0GDqcnCDxKPbcgng=;
 b=J4FdCVV4fv51FAgPAdS6rtPKjWs/Q781aXGCcsXCi3Nc2lI1tSeItlXvLCho4SaBl2X0W7
 /wo6gnlLLxHvdMP1w1MZEtayWaVXogZWHt2AF8hszzrp164pfOc1a+99U67T61NAVML49R
 wuxRhKKOj/zPYKxZbWrNkI1pXsjlHhk=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-A2RW9B_sOiClmIoOI0VSZQ-1; Mon, 11 Jul 2022 17:30:12 -0400
X-MC-Unique: A2RW9B_sOiClmIoOI0VSZQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 33-20020ab00424000000b003829f08fd3fso1271449uav.22
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 14:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCHGZwHPlGBsSTJGdV154dZiAEV0GDqcnCDxKPbcgng=;
 b=mKmzfL+n4/wjU/pkJh6J6UM2y0GUpIF/y5PFxP46Ba7PLtzTS9RvZjcS0KZkpi67CX
 HhBn1xoxOHlGpT8EARvywi8LHnYcLqMm5izpdRbYv5QDAUzrvSHxaQaAYUYs3DRmpJ+u
 WI/mqxb8SkArTIOcDXS8B6h2XKsc191gS2ywibzPE2/udTM6Ca8Nvy9o890VTAW+EKfV
 TIG6iS9K5FqTbxWLktzVCmiP4tNlPmyy7JxDvFsPkVIEffG8f9O1vTJKLZMPpj3JSa9D
 I8EcWT4rR0y6lGKeJFAtkkQ3j/hwcrTdek6A0+AuhpcuppTiNCCyiZ60mup4dFYfGmST
 pkJw==
X-Gm-Message-State: AJIora83A3X7HN2BAduQr33l4BZqlAJ8Cjb5rJ5eUy8aTFUTChmnLOu2
 6ZBVS0Y52dW7WzmR0X7A4caG7Av+Rh7qceJ/SW8LaZyrNcXm0BLkdqSRMd0DReh9XUbkd1PgmEc
 TufR9o2uh8v+yKcXtXgp4LbxiDuVdQE8=
X-Received: by 2002:ab0:59e6:0:b0:383:6c3d:a6d5 with SMTP id
 k35-20020ab059e6000000b003836c3da6d5mr1592914uad.100.1657575012118; 
 Mon, 11 Jul 2022 14:30:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tT7SLZedd/lX3NFTBdi9/2teUhWWaXa9yquklyLOHyIY+vLIrBqpwHo7EZyGTT7zoTU/iONdijkZsF+NOMKIo=
X-Received: by 2002:ab0:59e6:0:b0:383:6c3d:a6d5 with SMTP id
 k35-20020ab059e6000000b003836c3da6d5mr1592908uad.100.1657575011842; Mon, 11
 Jul 2022 14:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220526002512.1585246-1-jsnow@redhat.com>
 <Yo8yMoNjKsjZROQK@redhat.com>
 <CAFn=p-Y2+3JyTd_nn_HfCz6BbE=G3FYf5E1hZF7sovXBRK7YpQ@mail.gmail.com>
 <YpD8aeAUxXokKy4n@redhat.com>
In-Reply-To: <YpD8aeAUxXokKy4n@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 11 Jul 2022 17:30:01 -0400
Message-ID: <CAFn=p-Z0pqYhGXkrTPq9W8FePxbycKD8wAVztJNatxJjWTarhw@mail.gmail.com>
Subject: Re: [PATCH] iotests: fix source directory location
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c513a705e38e4141"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

--000000000000c513a705e38e4141
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2022, 12:29 PM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 26.05.2022 um 16:21 hat John Snow geschrieben:
> > On Thu, May 26, 2022, 3:54 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com>
> > wrote:
> >
> > > On Wed, May 25, 2022 at 08:25:12PM -0400, John Snow wrote:
> > > > If you invoke the check script from outside of the tests/qemu-iotes=
ts
> > > > directory, the directories initialized as source_iotests and
> > > > build_iotests will be incorrect.
> > > >
> > > > We can use the location of the source file itself to be more
> accurate.
> > > >
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > ---
> > > >  tests/qemu-iotests/testenv.py | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tests/qemu-iotests/testenv.py
> > > b/tests/qemu-iotests/testenv.py
> > > > index a864c74b123..9b0f01e84db 100644
> > > > --- a/tests/qemu-iotests/testenv.py
> > > > +++ b/tests/qemu-iotests/testenv.py
> > > > @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgproto: str=
,
> > > aiomode: str,
> > > >              self.build_iotests =3D
> > > os.path.dirname(os.path.abspath(sys.argv[0]))
> > > >          else:
> > > >              # called from the source tree
> > > > -            self.source_iotests =3D os.getcwd()
> > > > +            self.source_iotests =3D str(Path(__file__,
> '..').resolve())
> > >
> > > Path(__file__).parent
> > >
> > > >              self.build_iotests =3D self.source_iotests
> > > >
> > > > -        self.build_root =3D os.path.join(self.build_iotests, '..',
> '..')
> > > > +        self.build_root =3D str(Path(self.build_iotests,
> > > '../..').resolve())
> > >
> > > Path(self.build_iotests).parent.parent
> > >
> > > to be portable
> > >
> >
> > With windows? I think Path() is meant to be a fully portable class as-i=
s,
> > but I'll double-check my assumption. I use ".." elsewhere in code alrea=
dy
> > checked in, so if it's a problem I ought to fix it everywhere.
>
> I don't see any potential problem with the second hunk because we're
> dealing with the path of a directory there, but "regular_file.py/.."
> looks a bit fishy to me and doesn't work if you ask the kernel. Is this
> guaranteed to work in Python or is it an implementation detail of Path
> that may change?
>

... I apparently never hit send on this draft reply:

Good question, I don't know. I just know that when starting from __file__,
it seems to work in that manner. I used that trick when I added the
PYTHONPATH stuff directly into testenv a while back and never thought more
of it.

If it makes people uneasy to look at, I can just use .parent for the
Principle of Least Surprise.

--000000000000c513a705e38e4141
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 27, 2022, 12:29 PM Kevin =
Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D"_blank">kwolf@redhat=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Am 26.05.2022 u=
m 16:21 hat John Snow geschrieben:<br>
&gt; On Thu, May 26, 2022, 3:54 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D"m=
ailto:berrange@redhat.com" rel=3D"noreferrer" target=3D"_blank">berrange@re=
dhat.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, May 25, 2022 at 08:25:12PM -0400, John Snow wrote:<br>
&gt; &gt; &gt; If you invoke the check script from outside of the tests/qem=
u-iotests<br>
&gt; &gt; &gt; directory, the directories initialized as source_iotests and=
<br>
&gt; &gt; &gt; build_iotests will be incorrect.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; We can use the location of the source file itself to be more=
 accurate.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.=
com" rel=3D"noreferrer" target=3D"_blank">jsnow@redhat.com</a>&gt;<br>
&gt; &gt; &gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@re=
dhat.com" rel=3D"noreferrer" target=3D"_blank">pbonzini@redhat.com</a>&gt;<=
br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 tests/qemu-iotests/testenv.py | 4 ++--<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/tests/qemu-iotests/testenv.py<br>
&gt; &gt; b/tests/qemu-iotests/testenv.py<br>
&gt; &gt; &gt; index a864c74b123..9b0f01e84db 100644<br>
&gt; &gt; &gt; --- a/tests/qemu-iotests/testenv.py<br>
&gt; &gt; &gt; +++ b/tests/qemu-iotests/testenv.py<br>
&gt; &gt; &gt; @@ -217,10 +217,10 @@ def __init__(self, imgfmt: str, imgpro=
to: str,<br>
&gt; &gt; aiomode: str,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_i=
otests =3D<br>
&gt; &gt; os.path.dirname(os.path.abspath(sys.argv[0]))<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # called fro=
m the source tree<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_iotes=
ts =3D os.getcwd()<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.source_iotes=
ts =3D str(Path(__file__, &#39;..&#39;).resolve())<br>
&gt; &gt;<br>
&gt; &gt; Path(__file__).parent<br>
&gt; &gt;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_i=
otests =3D self.source_iotests<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_root =3D os.path.joi=
n(self.build_iotests, &#39;..&#39;, &#39;..&#39;)<br>
&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.build_root =3D str(Path(se=
lf.build_iotests,<br>
&gt; &gt; &#39;../..&#39;).resolve())<br>
&gt; &gt;<br>
&gt; &gt; Path(self.build_iotests).parent.parent<br>
&gt; &gt;<br>
&gt; &gt; to be portable<br>
&gt; &gt;<br>
&gt; <br>
&gt; With windows? I think Path() is meant to be a fully portable class as-=
is,<br>
&gt; but I&#39;ll double-check my assumption. I use &quot;..&quot; elsewher=
e in code already<br>
&gt; checked in, so if it&#39;s a problem I ought to fix it everywhere.<br>
<br>
I don&#39;t see any potential problem with the second hunk because we&#39;r=
e<br>
dealing with the path of a directory there, but &quot;<a href=3D"http://reg=
ular_file.py/." rel=3D"noreferrer noreferrer" target=3D"_blank">regular_fil=
e.py/.</a>.&quot;<br>
looks a bit fishy to me and doesn&#39;t work if you ask the kernel. Is this=
<br>
guaranteed to work in Python or is it an implementation detail of Path<br>
that may change?<br></blockquote></div></div><div dir=3D"auto"><br></div><d=
iv>... I apparently never hit send on this draft reply:<br></div><div><br><=
/div><div dir=3D"auto">Good question, I don&#39;t know. I just know that wh=
en starting from __file__, it seems to work in that manner. I used that tri=
ck when I added the PYTHONPATH stuff directly into testenv a while back and=
 never thought more of it.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">If it makes people uneasy to look at, I can just use .parent for the Pri=
nciple of Least Surprise.</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>
</div>

--000000000000c513a705e38e4141--


