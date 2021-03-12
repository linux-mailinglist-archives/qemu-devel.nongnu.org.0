Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1AF338E24
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:03:18 +0100 (CET)
Received: from localhost ([::1]:43070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhRl-0001wY-5L
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:03:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKhPL-00019p-HI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKhPD-0005Xz-Ms
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615554037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ofAYuwQuEviztNkxoBW+URNo1GfW6VA1VXPGwjmnoUo=;
 b=aVgsOtNlixmRNmsRkznhv69oHRNGupQPyhUUZfQOppIheeBcfiQYv7fih+tQkFSYCG6xMn
 9nvGSeSPfoDbBDleKHPSnPw/KP+JhIkbMpBmZMs3yhonAh5fwVRzKfBjqZgSsNhbcGjhro
 q0nLdMvRGNQFfl+2YPr/Zl9KSlNZcUg=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-gs1Oo-IVN9ObSl4wRbbAvg-1; Fri, 12 Mar 2021 08:00:34 -0500
X-MC-Unique: gs1Oo-IVN9ObSl4wRbbAvg-1
Received: by mail-il1-f200.google.com with SMTP id o7so17995407ilt.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofAYuwQuEviztNkxoBW+URNo1GfW6VA1VXPGwjmnoUo=;
 b=kSxOO10w9/CI7pIXWECSHrpPoWg0x2BdhVJDWl1vDf8OSBFTkhTQ0aUAAkxB7bK7gu
 VodyLj3UD7wQrYpioHcD9Mh583IXZvTduPg63175slCmSCHdcn/tsqC61kDdoqjRJ+cw
 FmA7JuQSegV24ATyNl9662ZDmjFD5ncdmeJyz1IqUxCqMgoV7ODn/A/VX6LAH3XUczO7
 nS+cpUOwn2vv0qQ51H7YhsDXIpKkqX10k0xBMEX8Mlnsm03VQrhhEiOfenzFe+Eh4dNO
 AJh04QvBf3L/V4z583bXUyqsdI0DXsg/AW/B2KxV6lyn3dSbaCMc6W0xeGqYSWWW7S2F
 3Gxg==
X-Gm-Message-State: AOAM530fweZkgi2aYFX2H+0gPDFKEHhRrecsgmPc0DNqc+9oEtVsqvZg
 Siu5vf0mfF617KATUMMlH4W0AcVq5C+C9SncMkyWPgKi349edpBE+tAKMHTPS7b5HKV8+sE1dcN
 Xq74t0odiy5hfy3+zhDrAqyM0NqBLKSU=
X-Received: by 2002:a92:d4c9:: with SMTP id o9mr1681866ilm.165.1615554033573; 
 Fri, 12 Mar 2021 05:00:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmqKZbQ521ih4wsE+8V4U2NAK92uXsOy+mAQHVdJ8QRj/o0aA4tPnHrb1OolJqwq5giGDVx+jhNdNXaBJGz00=
X-Received: by 2002:a92:d4c9:: with SMTP id o9mr1681851ilm.165.1615554033376; 
 Fri, 12 Mar 2021 05:00:33 -0800 (PST)
MIME-Version: 1.0
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
 <20200110153039.1379601-25-marcandre.lureau@redhat.com>
 <c3bbad37-410a-6f6a-c0e0-f0c1ea10e0a4@redhat.com>
In-Reply-To: <c3bbad37-410a-6f6a-c0e0-f0c1ea10e0a4@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 12 Mar 2021 17:00:22 +0400
Message-ID: <CAMxuvaysR6kGPd0DAY-ObTiqYHy-+Pu9abqRSDnBuP39o3jSYw@mail.gmail.com>
Subject: Re: [PATCH 24/26] qom: introduce object_property_help()
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000467ba305bd567c73"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000467ba305bd567c73
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 12, 2021 at 4:54 PM Thomas Huth <thuth@redhat.com> wrote:

> On 10/01/2020 16.30, Marc-Andr=C3=A9 Lureau wrote:
> > Let's factor out the code to format a help string for a property. We
> > are going to reuse it in qdev next, which will bring some consistency.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   include/qom/object.h    | 13 +++++++++++++
> >   qom/object_interfaces.c | 39 +++++++++++++++++++++++----------------
> >   2 files changed, 36 insertions(+), 16 deletions(-)
> >
> > diff --git a/include/qom/object.h b/include/qom/object.h
> > index 933e5c6cb9..a28e37a648 100644
> > --- a/include/qom/object.h
> > +++ b/include/qom/object.h
> > @@ -1854,6 +1854,19 @@ Object *container_get(Object *root, const char
> *path);
> >    */
> >   size_t object_type_get_instance_size(const char *typename);
> >
> > +/**
> > + * object_property_help:
> > + * @name: the name of the property
> > + * @type: the type of the property
> > + * @defval: the default value
> > + * @description: description of the property
> > + *
> > + * Returns: a user-friendly formatted string describing the property
> > + * for help purposes.
> > + */
> > +char *object_property_help(const char *name, const char *type,
> > +                           const char *defval, const char *description=
);
> > +
> >   G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
> >
> >   #endif
> > diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
> > index edb4cc4a3d..b7157d6ab0 100644
> > --- a/qom/object_interfaces.c
> > +++ b/qom/object_interfaces.c
> > @@ -158,6 +158,25 @@ int user_creatable_add_opts_foreach(void *opaque,
> QemuOpts *opts, Error **errp)
> >       return 0;
> >   }
> >
> > +char *object_property_help(const char *name, const char *type,
> > +                           const char *defval, const char *description=
)
> > +{
> > +    GString *str =3D g_string_new(NULL);
> > +
> > +    g_string_append_printf(str, "  %s=3D<%s>", name, type);
> > +    if (defval) {
> > +        g_string_append_printf(str, " (default: %s)", defval);
> > +    }
>
>   Hi!
>
> There is something weird going on wit the default value text...
>
> When I run:
>
> $ qemu-system-x86_64 -device isa-fdc,help
>
> I get:
>
> isa-fdc options:
>    bootindexA=3D<int32>
>    bootindexB=3D<int32>
>    dma=3D<uint32>           -  (default: (null))
>    driveA=3D<str>           - Node name or ID of a block device to use as=
 a
> backend
>    driveB=3D<str>           - Node name or ID of a block device to use as=
 a
> backend
>    fallback=3D<FdcDriveType> - FDC drive type, 144/288/120/none/auto
> (default: (null))
>    fdtypeA=3D<FdcDriveType> - FDC drive type, 144/288/120/none/auto
> (default: (null))
>    fdtypeB=3D<FdcDriveType> - FDC drive type, 144/288/120/none/auto
> (default: (null))
>    iobase=3D<uint32>        -  (default: (null))
>    irq=3D<uint32>           -  (default: (null))
>
> Why is it showing "(null)" as default values?
>

Congratulations, you found a regression! :)

QEMU emulator version 5.2.0 (qemu-5.2.0-6.fc33.1)
qemu-system-x86_64 -device isa-fdc,help
isa-fdc options:
  bootindexA=3D<int32>
  bootindexB=3D<int32>
  check_media_rate=3D<bool> - on/off (default: true)
  dma=3D<uint32>           -  (default: 2)
  driveA=3D<str>           - Node name or ID of a block device to use as a
backend
  driveB=3D<str>           - Node name or ID of a block device to use as a
backend
  fallback=3D<FdcDriveType> - FDC drive type, 144/288/120/none/auto (defaul=
t:
"288")
  fdtypeA=3D<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default=
:
"auto")
  fdtypeB=3D<FdcDriveType> - FDC drive type, 144/288/120/none/auto (default=
:
"auto")
  iobase=3D<uint32>        -  (default: 1008)
  irq=3D<uint32>           -  (default: 6)

--000000000000467ba305bd567c73
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 4:54 PM Tho=
mas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 10/01/2=
020 16.30, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Let&#39;s factor out the code to format a help string for a property. =
We<br>
&gt; are going to reuse it in qdev next, which will bring some consistency.=
<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0include/qom/object.h=C2=A0 =C2=A0 | 13 +++++++++++++<br>
&gt;=C2=A0 =C2=A0qom/object_interfaces.c | 39 +++++++++++++++++++++++------=
----------<br>
&gt;=C2=A0 =C2=A02 files changed, 36 insertions(+), 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/include/qom/object.h b/include/qom/object.h<br>
&gt; index 933e5c6cb9..a28e37a648 100644<br>
&gt; --- a/include/qom/object.h<br>
&gt; +++ b/include/qom/object.h<br>
&gt; @@ -1854,6 +1854,19 @@ Object *container_get(Object *root, const char =
*path);<br>
&gt;=C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0size_t object_type_get_instance_size(const char *typename)=
;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +/**<br>
&gt; + * object_property_help:<br>
&gt; + * @name: the name of the property<br>
&gt; + * @type: the type of the property<br>
&gt; + * @defval: the default value<br>
&gt; + * @description: description of the property<br>
&gt; + *<br>
&gt; + * Returns: a user-friendly formatted string describing the property<=
br>
&gt; + * for help purposes.<br>
&gt; + */<br>
&gt; +char *object_property_help(const char *name, const char *type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *defval, const char *description);<b=
r>
&gt; +<br>
&gt;=C2=A0 =C2=A0G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt; diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c<br>
&gt; index edb4cc4a3d..b7157d6ab0 100644<br>
&gt; --- a/qom/object_interfaces.c<br>
&gt; +++ b/qom/object_interfaces.c<br>
&gt; @@ -158,6 +158,25 @@ int user_creatable_add_opts_foreach(void *opaque,=
 QemuOpts *opts, Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +char *object_property_help(const char *name, const char *type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *defval, const char *description)<br=
>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 GString *str =3D g_string_new(NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_string_append_printf(str, &quot;=C2=A0 %s=3D&lt;%s&gt=
;&quot;, name, type);<br>
&gt; +=C2=A0 =C2=A0 if (defval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_string_append_printf(str, &quot; (defau=
lt: %s)&quot;, defval);<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 Hi!<br>
<br>
There is something weird going on wit the default value text...<br>
<br>
When I run:<br>
<br>
$ qemu-system-x86_64 -device isa-fdc,help<br>
<br>
I get:<br>
<br>
isa-fdc options:<br>
=C2=A0 =C2=A0bootindexA=3D&lt;int32&gt;<br>
=C2=A0 =C2=A0bootindexB=3D&lt;int32&gt;<br>
=C2=A0 =C2=A0dma=3D&lt;uint32&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
=C2=A0 (default: (null))<br>
=C2=A0 =C2=A0driveA=3D&lt;str&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
 Node name or ID of a block device to use as a backend<br>
=C2=A0 =C2=A0driveB=3D&lt;str&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
 Node name or ID of a block device to use as a backend<br>
=C2=A0 =C2=A0fallback=3D&lt;FdcDriveType&gt; - FDC drive type, 144/288/120/=
none/auto (default: (null))<br>
=C2=A0 =C2=A0fdtypeA=3D&lt;FdcDriveType&gt; - FDC drive type, 144/288/120/n=
one/auto (default: (null))<br>
=C2=A0 =C2=A0fdtypeB=3D&lt;FdcDriveType&gt; - FDC drive type, 144/288/120/n=
one/auto (default: (null))<br>
=C2=A0 =C2=A0iobase=3D&lt;uint32&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 -=C2=A0 (de=
fault: (null))<br>
=C2=A0 =C2=A0irq=3D&lt;uint32&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-=
=C2=A0 (default: (null))<br>
<br>
Why is it showing &quot;(null)&quot; as default values?<br></blockquote><di=
v><br></div><div>Congratulations, you found a regression! :)</div><div><br>=
</div><div>QEMU emulator version 5.2.0 (qemu-5.2.0-6.fc33.1)<br></div><div>=
qemu-system-x86_64 -device isa-fdc,help <br>isa-fdc options:<br>=C2=A0 boot=
indexA=3D&lt;int32&gt;<br>=C2=A0 bootindexB=3D&lt;int32&gt;<br>=C2=A0 check=
_media_rate=3D&lt;bool&gt; - on/off (default: true)<br>=C2=A0 dma=3D&lt;uin=
t32&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0(default: 2)<br>=C2=A0 d=
riveA=3D&lt;str&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Node name or ID of=
 a block device to use as a backend<br>=C2=A0 driveB=3D&lt;str&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 - Node name or ID of a block device to use as a=
 backend<br>=C2=A0 fallback=3D&lt;FdcDriveType&gt; - FDC drive type, 144/28=
8/120/none/auto (default: &quot;288&quot;)<br>=C2=A0 fdtypeA=3D&lt;FdcDrive=
Type&gt; - FDC drive type, 144/288/120/none/auto (default: &quot;auto&quot;=
)<br>=C2=A0 fdtypeB=3D&lt;FdcDriveType&gt; - FDC drive type, 144/288/120/no=
ne/auto (default: &quot;auto&quot;)<br>=C2=A0 iobase=3D&lt;uint32&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0- =C2=A0(default: 1008)<br>=C2=A0 irq=3D&lt;uint32&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - =C2=A0(default: 6)<br></div><div><=
/div></div></div>

--000000000000467ba305bd567c73--


