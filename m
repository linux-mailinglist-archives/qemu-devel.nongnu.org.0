Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A9B3E0B25
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 02:27:48 +0200 (CEST)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBREh-0002Mi-K5
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 20:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBRDQ-0001hy-Tp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:26:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBRDO-0003e1-5S
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 20:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628123184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DDnG1cm5c86BwQIm9Ydv+Ba38i8cyIPTG8pglwPCddc=;
 b=WR3V5gfL+oaFvt+gNgU27YkFaL67dM2Ccc+VL3snFM/KbzjLYWp+IwlDGmDzRlJrWxm0mt
 HjFL2fFeoqs6SPHLyArk63eEA/lkPbsrnSucpBhJbR3voofSBAZfIG7alT7hK2fN5JsrqF
 jw2a12pPJwLwgrwXEW5nyLPnV2xk3k4=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-uPDfNAFtN52OG3xwytt7TQ-1; Wed, 04 Aug 2021 20:26:23 -0400
X-MC-Unique: uPDfNAFtN52OG3xwytt7TQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 y9-20020a0568302a09b02904f24c14aa21so1483983otu.15
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 17:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DDnG1cm5c86BwQIm9Ydv+Ba38i8cyIPTG8pglwPCddc=;
 b=CV7C8+3lyIB0f5YSyv+ZjyCO+JFbgoP0VwCi+Nku3DctMmMiMu6DLc+Ud4+zJ5eLce
 Hjfa7xFRCMrbuVd7n2KJuWbEJx2Y0qZaNusgvbDRShWjzfI8CCMbb9uCx8fHpzIsulcg
 jLlIfciMX6KiodUX//ZkbqHQg2rvs5h9IBd2lV+VrT6uUPESV4dYNom6yMRP7m3Gdxsn
 v6ei93lujnAj8Huxt+JfNdYv3RGAHfRoGGeGK+C9Y5ANXl2ExfP/tinSrheVt2CtX6lD
 1hx0sjiNCHe/K8OaAi5//FvjNN8Eeu3CnycHBri+lnTL26gwPIWCBZXNEHM6OuLOU+sB
 TlZw==
X-Gm-Message-State: AOAM530Y3ojC4Y4hQP+Zc2mijphI17mgZlP7V/URg4lVCcpD6rwqx36c
 gIKA4z9MbM+0zdiir9/JTeNP4DO0P1LmNSiUvHDutSArhTjhtYVT4oplH5510LPxsMGKbEGRwg3
 3UsK4i0PKCGtQWyMHTLdJvQmkR7aeFwU=
X-Received: by 2002:a54:489a:: with SMTP id r26mr1522688oic.168.1628123182214; 
 Wed, 04 Aug 2021 17:26:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpsYRAOkOXrYTXZJtVFlefx2PLUmACyKr/zyFpQmD/vo48QdqqjtZ0gndeEEdR1KEIXs5FVLipBHtvWPHwWX4=
X-Received: by 2002:a54:489a:: with SMTP id r26mr1522675oic.168.1628123182007; 
 Wed, 04 Aug 2021 17:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-2-ehabkost@redhat.com>
 <CAFEAcA8FdSL6YwL1GiEqc0sF087SFCzRN3QvjOeOYxWaPoTO2Q@mail.gmail.com>
 <20210804203116.nawhr7px2zhkpzxk@habkost.net>
 <CAFEAcA-cJe9NRVMJ6JFyEs+AJV6Wo8MfT+_1P4coWGVjfzLzVg@mail.gmail.com>
 <20210804210034.2dp6b2uqlfxkhjjo@habkost.net>
In-Reply-To: <20210804210034.2dp6b2uqlfxkhjjo@habkost.net>
From: John Snow <jsnow@redhat.com>
Date: Wed, 4 Aug 2021 20:26:10 -0400
Message-ID: <CAFn=p-bBK=LRG0u8dr_AqgMAzH3+KotRkRUZOLZP_cXFYkAa1g@mail.gmail.com>
Subject: Re: [PATCH for-6.2 01/10] docs: qom: Replace old GTK-Doc #symbol
 syntax with `symbol`
To: Eduardo Habkost <ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ea1b4c05c8c4f7f9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ea1b4c05c8c4f7f9
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 4, 2021 at 5:00 PM Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, Aug 04, 2021 at 09:42:24PM +0100, Peter Maydell wrote:
> > On Wed, 4 Aug 2021 at 21:31, Eduardo Habkost <ehabkost@redhat.com>
> wrote:
> > >
> > > On Mon, Aug 02, 2021 at 01:14:57PM +0100, Peter Maydell wrote:
> > > > On Thu, 29 Jul 2021 at 19:00, Eduardo Habkost <ehabkost@redhat.com>
> wrote:
> > > > > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > > > > index e5fe3597cd8..9c1be5d7fc2 100644
> > > > > --- a/docs/devel/qom.rst
> > > > > +++ b/docs/devel/qom.rst
> > > > > @@ -3,6 +3,7 @@ The QEMU Object Model (QOM)
> > > > >  ===========================
> > > > >
> > > > >  .. highlight:: c
> > > > > +.. default-role:: any
> > > > >
> > > > >  The QEMU Object Model provides a framework for registering user
> creatable
> > > > >  types and instantiating objects from those types.  QOM provides
> the following
> > > > > @@ -42,8 +43,8 @@ features:
> > > > >
> > > > >     type_init(my_device_register_types)
> > > > >
> > > > > -In the above example, we create a simple type that is described
> by #TypeInfo.
> > > > > -#TypeInfo describes information about the type including what it
> inherits
> > > > > +In the above example, we create a simple type that is described
> by `TypeInfo`.
> > > > > +`TypeInfo` describes information about the type including what it
> inherits
> > > >
> > > > I've just gone through all of docs/ finding the places where we had
> `foo` and
> > > > probably meant ``foo``, so please don't add any new ones. I would
> suggest
> > > > that you either use the ``double-backtick`` syntax to render as
> fixed-width
> > > > font, or use an explicit role tag so readers of the rST source can
> tell that
> > > > that's what you meant to use, ie avoid "default-role".
> > >
> > > I don't understand why that would be a reason to not use
> > > default-role.  With default-role, we get an error when misusing
> > > `foo`.  Without default-role, misuse won't be detected at all
> > > (except by manual inspection).
> >
> > Ah, I didn't realize that we got an error if we set the default-role
> > to 'any'. That certainly makes it nicer than the default default
> > of 'cite'.
> >
> > Is there a sensible default-role we can use as the default for the whole
> manual,
> > rather than only declaring it in individual .rst files ?  One of the
> > things I don't
> > like about the change here is that it means that `thing` in this
> individual .rst
> > file is different from `thing` in every other .rst file in our docs.
>
> I believe "any" would be a very sensible default role for all
> documents, but I don't know how to set default-role globally.
> I'll try to find out.
>
> --
> Eduardo
>

Oh, I actually fixed that issue I referenced there back in May -- I keep a
patchset up to date whenever I work on modernizing the QAPI python code
that actually DOES switch our default role to "any" ... I updated it just
today, in fact. I will send it to the list if there's an appetite for it
now.

--js

--000000000000ea1b4c05c8c4f7f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 4, 2021 at 5:00 PM Eduard=
o Habkost &lt;<a href=3D"mailto:ehabkost@redhat.com">ehabkost@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Wed, Aug 04, 2021 at 09:42:24PM +0100, Peter Maydell wrote:<br>
&gt; On Wed, 4 Aug 2021 at 21:31, Eduardo Habkost &lt;<a href=3D"mailto:eha=
bkost@redhat.com" target=3D"_blank">ehabkost@redhat.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Aug 02, 2021 at 01:14:57PM +0100, Peter Maydell wrote:<br=
>
&gt; &gt; &gt; On Thu, 29 Jul 2021 at 19:00, Eduardo Habkost &lt;<a href=3D=
"mailto:ehabkost@redhat.com" target=3D"_blank">ehabkost@redhat.com</a>&gt; =
wrote:<br>
&gt; &gt; &gt; &gt; diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst<br=
>
&gt; &gt; &gt; &gt; index e5fe3597cd8..9c1be5d7fc2 100644<br>
&gt; &gt; &gt; &gt; --- a/docs/devel/qom.rst<br>
&gt; &gt; &gt; &gt; +++ b/docs/devel/qom.rst<br>
&gt; &gt; &gt; &gt; @@ -3,6 +3,7 @@ The QEMU Object Model (QOM)<br>
&gt; &gt; &gt; &gt;=C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 .. highlight:: c<br>
&gt; &gt; &gt; &gt; +.. default-role:: any<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 The QEMU Object Model provides a framework for re=
gistering user creatable<br>
&gt; &gt; &gt; &gt;=C2=A0 types and instantiating objects from those types.=
=C2=A0 QOM provides the following<br>
&gt; &gt; &gt; &gt; @@ -42,8 +43,8 @@ features:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0type_init(my_device_register_types)<=
br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -In the above example, we create a simple type that is =
described by #TypeInfo.<br>
&gt; &gt; &gt; &gt; -#TypeInfo describes information about the type includi=
ng what it inherits<br>
&gt; &gt; &gt; &gt; +In the above example, we create a simple type that is =
described by `TypeInfo`.<br>
&gt; &gt; &gt; &gt; +`TypeInfo` describes information about the type includ=
ing what it inherits<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;ve just gone through all of docs/ finding the places w=
here we had `foo` and<br>
&gt; &gt; &gt; probably meant ``foo``, so please don&#39;t add any new ones=
. I would suggest<br>
&gt; &gt; &gt; that you either use the ``double-backtick`` syntax to render=
 as fixed-width<br>
&gt; &gt; &gt; font, or use an explicit role tag so readers of the rST sour=
ce can tell that<br>
&gt; &gt; &gt; that&#39;s what you meant to use, ie avoid &quot;default-rol=
e&quot;.<br>
&gt; &gt;<br>
&gt; &gt; I don&#39;t understand why that would be a reason to not use<br>
&gt; &gt; default-role.=C2=A0 With default-role, we get an error when misus=
ing<br>
&gt; &gt; `foo`.=C2=A0 Without default-role, misuse won&#39;t be detected a=
t all<br>
&gt; &gt; (except by manual inspection).<br>
&gt; <br>
&gt; Ah, I didn&#39;t realize that we got an error if we set the default-ro=
le<br>
&gt; to &#39;any&#39;. That certainly makes it nicer than the default defau=
lt<br>
&gt; of &#39;cite&#39;.<br>
&gt; <br>
&gt; Is there a sensible default-role we can use as the default for the who=
le manual,<br>
&gt; rather than only declaring it in individual .rst files ?=C2=A0 One of =
the<br>
&gt; things I don&#39;t<br>
&gt; like about the change here is that it means that `thing` in this indiv=
idual .rst<br>
&gt; file is different from `thing` in every other .rst file in our docs.<b=
r>
<br>
I believe &quot;any&quot; would be a very sensible default role for all<br>
documents, but I don&#39;t know how to set default-role globally.<br>
I&#39;ll try to find out.<br>
<br>
-- <br>
Eduardo<br></blockquote><div><br></div><div>Oh, I actually fixed that issue=
 I referenced there back in May -- I keep a patchset up to date whenever I =
work on modernizing the QAPI python code that actually DOES switch our defa=
ult role to &quot;any&quot; ... I updated it just today, in fact. I will se=
nd it to the list if there&#39;s an appetite for it now.<br></div><div><br>=
</div><div>--js<br></div></div></div>

--000000000000ea1b4c05c8c4f7f9--


