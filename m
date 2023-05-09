Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 001EC6FC059
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 09:24:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwHfW-0003oa-He; Tue, 09 May 2023 03:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pwHfT-0003o0-UP
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:21:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pwHfS-0000gM-0t
 for qemu-devel@nongnu.org; Tue, 09 May 2023 03:21:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683616908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0KVlAUrwtuSs3qOFqg2YnDc9pLw+A1nC0KQ0Nx0ajF4=;
 b=fAZ99d35Tr42UDVxvRrIm+AdDctEAD+czSC03CgQ2Ah8ddfuZMqI8B1ldwPtp7WVZQ1aKt
 RzsfRiEN5asJy8E+zeJmNUg8dLWHg6c+zH9/OlHUG7otSJvKWyg/rt/1OZTDbaMno1kHT7
 2lqkKzQhIQ3AWYGKW3pxFzr/Xdc4zsk=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-4dIpy1qZMee2pENEDgpzAg-1; Tue, 09 May 2023 03:21:47 -0400
X-MC-Unique: 4dIpy1qZMee2pENEDgpzAg-1
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-520f3f18991so2903783a12.3
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 00:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683616906; x=1686208906;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0KVlAUrwtuSs3qOFqg2YnDc9pLw+A1nC0KQ0Nx0ajF4=;
 b=ee96XLW1QJmEAMkzY5fA+vkcbUYtCbS2RTWURJyBFV87ZHTH99xPf4X4awgYtQYx8/
 Kq7g+CD4QElRg6jZFoiFmK3TzUBsbvhF5AGqaMPk9G/s/Xg736ptOjHZBtrH849ZOWKF
 oi7Nd7YRCP44Zbz5pLuO6L9AnkZvJsfECdtAKjWdjAX4i8+D3P3fiCJBEzJDbjHYeOEZ
 vHVzFt1Cl5+2xLn0vNZ2F3pYjSEOW6Bfmk0NL44/kv8B0osYfNYTzIx5vENOzSU6grOK
 SLR1pKSg9MZNv2Adf3PKVD7ZEk/oBBzmExdB3jWdXKOymN5yT6/j/Qmtpnl2bSMp7Ea5
 heHA==
X-Gm-Message-State: AC+VfDzwO/SDB0pmorwnmxlUvNv6TVKx1/ZqKBbmLpj/DXpj4hFlkeUN
 QZZEp5vKFdWG8MyXi8hshf0/dOGZLUaa60+Va2eTAL3wW//jGp5bH6gWr4dii1vVLVVOaO+BboY
 N3qN+Ej/dGviwVdqTTnAoH0SbOv6EnDU=
X-Received: by 2002:a05:6a20:4408:b0:101:6be3:f675 with SMTP id
 ce8-20020a056a20440800b001016be3f675mr618969pzb.17.1683616906076; 
 Tue, 09 May 2023 00:21:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ652e28enrvIX73yoedOYOxCl5R2A3a5WDW0buRYfyyFI5k0Eu3YxdfLby3FzvNe0M7lLEXptoqGmHlyhPPzvw=
X-Received: by 2002:a05:6a20:4408:b0:101:6be3:f675 with SMTP id
 ce8-20020a056a20440800b001016be3f675mr618955pzb.17.1683616905772; Tue, 09 May
 2023 00:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230503081911.119168-1-aesteve@redhat.com>
 <20230503081911.119168-2-aesteve@redhat.com>
 <87o7mvc6hi.fsf@redhat.com>
In-Reply-To: <87o7mvc6hi.fsf@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 9 May 2023 09:21:34 +0200
Message-ID: <CADSE00+TF7m-DM8Z_QEtUa356GkiCCgtjE8a=-78OEFuhvzKAg@mail.gmail.com>
Subject: Re: [PATCH 1/4] virtio-dmabuf: introduce virtio-dmabuf
To: Cornelia Huck <cohuck@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009b591405fb3d9b29"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--0000000000009b591405fb3d9b29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 8, 2023 at 3:12=E2=80=AFPM Cornelia Huck <cohuck@redhat.com> wr=
ote:

> On Wed, May 03 2023, Albert Esteve <aesteve@redhat.com> wrote:
>
> > This API manages objects (in this iteration,
> > dmabuf fds) that can be shared along different
> > virtio devices.
> >
> > The API allows the different devices to add,
> > remove and/or retrieve the objects by simply
> > invoking the public functions that reside in the
> > virtio-dmabuf file.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  hw/display/meson.build            |   1 +
> >  hw/display/virtio-dmabuf.c        |  88 +++++++++++++++++++++++
> >  include/hw/virtio/virtio-dmabuf.h |  58 ++++++++++++++++
> >  tests/unit/meson.build            |   1 +
> >  tests/unit/test-virtio-dmabuf.c   | 112 ++++++++++++++++++++++++++++++
> >  5 files changed, 260 insertions(+)
> >  create mode 100644 hw/display/virtio-dmabuf.c
> >  create mode 100644 include/hw/virtio/virtio-dmabuf.h
> >  create mode 100644 tests/unit/test-virtio-dmabuf.c
> >
> > diff --git a/hw/display/meson.build b/hw/display/meson.build
> > index 17165bd536..62a27395c0 100644
> > --- a/hw/display/meson.build
> > +++ b/hw/display/meson.build
> > @@ -37,6 +37,7 @@ softmmu_ss.add(when: 'CONFIG_MACFB', if_true:
> files('macfb.c'))
> >  softmmu_ss.add(when: 'CONFIG_NEXTCUBE', if_true: files('next-fb.c'))
> >
> >  softmmu_ss.add(when: 'CONFIG_VGA', if_true: files('vga.c'))
> > +softmmu_ss.add(when: 'CONFIG_VIRTIO', if_true: files('virtio-dmabuf.c'=
))
> >
> >  if (config_all_devices.has_key('CONFIG_VGA_CIRRUS') or
> >      config_all_devices.has_key('CONFIG_VGA_PCI') or
> > diff --git a/hw/display/virtio-dmabuf.c b/hw/display/virtio-dmabuf.c
> > new file mode 100644
>
> General comment: new files should be covered in MAINTAINERS; not sure if
> there is any generic section that could match it, or if this should go
> into a new section.
>

You are right. I thought the entire folder would have an owner already, but
I see
it is split by features. I guess this would make sense under a new section
then.
Thanks!


>
> > index 0000000000..3db939a2e3
> > --- /dev/null
> > +++ b/hw/display/virtio-dmabuf.c
>
> Is virtio-dmabuf only useful for stuff under display/, or could it go
> into a more generic section?
>
>
I hesitated myself and I wouldn't be against changing the location.
In this first version of the infrastructure, it is introduced with dma-buf
sharing in mind, and virtio-gpu -> virtio-video as the main usecase.
Both these devices are/will be at display/, hence I ended up adding
the infrastructure in the same folder, close from where it is going to be
used.

However, in the future other devices may want to use the shared table
for other object types, the virtio specs seem to leave that door open.
In that case, it may be more interesting in another folder.
I had ui/ or hw/virtio/ as candidates myself. Depends on whether
we want to plan ahead for future uses or keep it closer to where it
is being to be used now.

--0000000000009b591405fb3d9b29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><br></div></div></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 8, 2023 at 3:12=
=E2=80=AFPM Cornelia Huck &lt;<a href=3D"mailto:cohuck@redhat.com">cohuck@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, May 03 2023, Albert Esteve &lt;<a href=3D"mailto:aesteve=
@redhat.com" target=3D"_blank">aesteve@redhat.com</a>&gt; wrote:<br>
<br>
&gt; This API manages objects (in this iteration,<br>
&gt; dmabuf fds) that can be shared along different<br>
&gt; virtio devices.<br>
&gt;<br>
&gt; The API allows the different devices to add,<br>
&gt; remove and/or retrieve the objects by simply<br>
&gt; invoking the public functions that reside in the<br>
&gt; virtio-dmabuf file.<br>
&gt;<br>
&gt; Signed-off-by: Albert Esteve &lt;<a href=3D"mailto:aesteve@redhat.com"=
 target=3D"_blank">aesteve@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/display/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 hw/display/virtio-dmabuf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 88=
 +++++++++++++++++++++++<br>
&gt;=C2=A0 include/hw/virtio/virtio-dmabuf.h |=C2=A0 58 ++++++++++++++++<br=
>
&gt;=C2=A0 tests/unit/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 tests/unit/test-virtio-dmabuf.c=C2=A0 =C2=A0| 112 ++++++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 5 files changed, 260 insertions(+)<br>
&gt;=C2=A0 create mode 100644 hw/display/virtio-dmabuf.c<br>
&gt;=C2=A0 create mode 100644 include/hw/virtio/virtio-dmabuf.h<br>
&gt;=C2=A0 create mode 100644 tests/unit/test-virtio-dmabuf.c<br>
&gt;<br>
&gt; diff --git a/hw/display/meson.build b/hw/display/meson.build<br>
&gt; index 17165bd536..62a27395c0 100644<br>
&gt; --- a/hw/display/meson.build<br>
&gt; +++ b/hw/display/meson.build<br>
&gt; @@ -37,6 +37,7 @@ softmmu_ss.add(when: &#39;CONFIG_MACFB&#39;, if_true=
: files(&#39;macfb.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_NEXTCUBE&#39;, if_true: files(&=
#39;next-fb.c&#39;))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 softmmu_ss.add(when: &#39;CONFIG_VGA&#39;, if_true: files(&#39;v=
ga.c&#39;))<br>
&gt; +softmmu_ss.add(when: &#39;CONFIG_VIRTIO&#39;, if_true: files(&#39;vir=
tio-dmabuf.c&#39;))<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 if (config_all_devices.has_key(&#39;CONFIG_VGA_CIRRUS&#39;) or<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 config_all_devices.has_key(&#39;CONFIG_VGA_PCI&#39=
;) or<br>
&gt; diff --git a/hw/display/virtio-dmabuf.c b/hw/display/virtio-dmabuf.c<b=
r>
&gt; new file mode 100644<br>
<br>
General comment: new files should be covered in MAINTAINERS; not sure if<br=
>
there is any generic section that could match it, or if this should go<br>
into a new section.<br></blockquote><div><br></div><div>You are right. I th=
ought the entire folder would have an owner already, but I see</div><div>it=
 is split by features. I guess this would make sense under a new section th=
en.</div><div>Thanks!</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
&gt; index 0000000000..3db939a2e3<br>
&gt; --- /dev/null<br>
&gt; +++ b/hw/display/virtio-dmabuf.c<br>
<br>
Is virtio-dmabuf only useful for stuff under display/, or could it go<br>
into a more generic section?<br>
<br></blockquote><div><br></div><div>I hesitated myself and I wouldn&#39;t =
be against changing the location.</div><div>In this first version of the in=
frastructure, it is introduced with dma-buf</div><div>sharing in mind, and =
virtio-gpu -&gt; virtio-video as the main usecase.</div><div>Both these dev=
ices are/will be at display/, hence I ended up adding</div><div>the infrast=
ructure in the same folder, close from where it is going to be</div><div>us=
ed.</div><div><br></div><div>However, in the future other devices may want =
to use the shared table</div><div>for other object types, the virtio specs =
seem to leave that door open.</div><div>In that case, it may be more intere=
sting in another folder.</div><div>I had ui/ or hw/virtio/ as candidates my=
self. Depends on whether</div><div>we want to plan ahead for future uses or=
 keep it closer to where it</div><div>is being to be used now.=C2=A0</div><=
/div></div>

--0000000000009b591405fb3d9b29--


