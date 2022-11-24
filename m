Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2BC6372A4
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:10:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy6Mg-0002KJ-7e; Thu, 24 Nov 2022 02:09:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oy6Me-0002KA-Sb
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:09:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oy6Md-0001wY-92
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669273778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xo7ufeDdIuNr34z7GpN1gsldaRGg+dhd+meVwFDerT0=;
 b=e5S5e2tFuoIU2PYdEwb24a13YF4bbW9BG84ET9Jx3m2Ylw3tl/PR9e4k80+8bWzhu02WDC
 Q+zY+KVaSidWKb5EwA9xdy04hgZeq59kmdkUX1cMVFLqrV0A5cZ6xT6uTZ/UzmZ3p07Pjo
 7eAqI50F8df8f1NHrsSyWm8t+l3NTpQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-257-Qnte3meoM7-VPzwXIo3YqA-1; Thu, 24 Nov 2022 02:09:36 -0500
X-MC-Unique: Qnte3meoM7-VPzwXIo3YqA-1
Received: by mail-ua1-f69.google.com with SMTP id
 w30-20020ab055de000000b00418d1543d9fso484676uaa.18
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 23:09:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xo7ufeDdIuNr34z7GpN1gsldaRGg+dhd+meVwFDerT0=;
 b=74T1Ymd5muZM/W8lqwMRzVTNobheHwR2ydJW38oAlVB18qxd5qwNv8VaFMGjGkyUk8
 53H3fJYmF1Xpl6KvFiSr9woc02YCL8eTfO4dmq1R1KNMFZhbuadz+098pwlY4b5M+hvr
 35thU4R6+B3UxQGThVg4Xez3xu1oLkya0apCqM0MRJcE4U4QYT9occ6Etec3IreDBwuG
 ZeDSmLWQWGExxHVOmqRnMmnQLM9y6SdCRo78wPDz7Ol3H2QQqpLzkt4AQoR7ecnHch6M
 Os9lbvLzyPE+2nT3ZztQIJdu8M6rqh8UNbrW17a3Z3UCmg/pBl1RDWn1tQPgdc7E5qtd
 KfFA==
X-Gm-Message-State: ANoB5pnEVS6blNUqHYx+9s/2gw6RVUrYwBIBMyL6JD5KG8ZZAVCZySxj
 JwpAMOQBWW9I+lfrEMNEZgdDYNTfqSvxo+H69FTW3YdYb2cTTlkLvLGQhj4BXVghzBDXEhVEX4N
 Z/7ulmIXN9gztb2T+JLFfaPZc7MuesX4=
X-Received: by 2002:a05:6102:3fa1:b0:3a6:aae4:cab6 with SMTP id
 o33-20020a0561023fa100b003a6aae4cab6mr17679883vsv.27.1669273775531; 
 Wed, 23 Nov 2022 23:09:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5A2zYMPjHjPfK4fsxVhIFetd1cZJB3LyrpY+B6kQ7oum9llyx0n0jS9PmqQ2cDMGOU1M6DgmADLNx7FdxYnHI=
X-Received: by 2002:a05:6102:3fa1:b0:3a6:aae4:cab6 with SMTP id
 o33-20020a0561023fa100b003a6aae4cab6mr17679871vsv.27.1669273775290; Wed, 23
 Nov 2022 23:09:35 -0800 (PST)
MIME-Version: 1.0
References: <20221123021842.1588898-1-jmaloy@redhat.com>
 <CAJ+F1CKbwgVQjXo3F_r0JsnSLfO14tyq_vX5MSwnVV3pWbEJNQ@mail.gmail.com>
In-Reply-To: <CAJ+F1CKbwgVQjXo3F_r0JsnSLfO14tyq_vX5MSwnVV3pWbEJNQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 24 Nov 2022 08:09:24 +0100
Message-ID: <CABgObfa3u2yE9yb0s1QQ39BwfexOEE4emJuJsAT848ZO5MV_YA@mail.gmail.com>
Subject: Re: [PATCH] hw/usb: add configuration flags for emulated and passthru
 usb smartcard
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: Jon Maloy <jmaloy@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 "Wang, Jason" <jasowang@redhat.com>, philmd@linaro.com, 
 "Hajnoczi, Stefan" <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000068ce4b05ee321667"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000068ce4b05ee321667
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il mer 23 nov 2022, 08:59 Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.co=
m> ha
scritto:

> config USB_SMARTCARD_PASSTHRU
>     bool
>     default y
>     select USB_SMARTCARD
>
> config USB_SMARTCARD_EMULATED
>     bool
>     default y
>     select USB_SMARTCARD
>

Yes, this is the way. (TM)

Also, you should add a "config LIBCACARD" (resp. "CONFIG_LIBCACARD=3Dy")
symbol to Kconfig.host and the root meson.build, so that you can make these
symbols "depends on CACARD" and remove the "if cacard.found()" below.

Paolo


>
> > +
> > +config USB_SMARTCARD_EMULATED
> > +    bool
> > +    default y
> > +    depends on USB
> >
> >  config USB_STORAGE_MTP
> >      bool
> > diff --git a/hw/usb/meson.build b/hw/usb/meson.build
> > index 793df42e21..353006fb6c 100644
> > --- a/hw/usb/meson.build
> > +++ b/hw/usb/meson.build
> > @@ -51,8 +51,8 @@ softmmu_ss.add(when: 'CONFIG_USB_SMARTCARD', if_true:
> files('dev-smartcard-reade
> >
> >  if cacard.found()
> >    usbsmartcard_ss =3D ss.source_set()
> > -  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD',
> > -                      if_true: [cacard, files('ccid-card-emulated.c',
> 'ccid-card-passthru.c')])
> > +  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_EMULATED', if_true:
> [cacard, files('ccid-card-emulated.c')])
> > +  usbsmartcard_ss.add(when: 'CONFIG_USB_SMARTCARD_PASSTHRU', if_true:
> [cacard, files('ccid-card-passthru.c')])
> >    hw_usb_modules +=3D {'smartcard': usbsmartcard_ss}
> >  endif
> >
> > --
> > 2.35.3
> >
> >
>
>
> --
> Marc-Andr=C3=A9 Lureau
>
>

--00000000000068ce4b05ee321667
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 23 nov 2022, 08:59 Marc-Andr=C3=A9 Lureau &lt;<=
a href=3D"mailto:marcandre.lureau@gmail.com">marcandre.lureau@gmail.com</a>=
&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">config USB_SMARTCA=
RD_PASSTHRU<br>
=C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 default y<br>
=C2=A0 =C2=A0 select USB_SMARTCARD<br>
<br>
config USB_SMARTCARD_EMULATED<br>
=C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 default y<br>
=C2=A0 =C2=A0 select USB_SMARTCARD<br></blockquote></div></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Yes, this is the way. (TM)</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Also, you should add a &quot;config L=
IBCACARD&quot; (resp. &quot;CONFIG_LIBCACARD=3Dy&quot;) symbol to Kconfig.h=
ost and the root meson.build, so that you can make these symbols &quot;depe=
nds on CACARD&quot; and remove the &quot;if cacard.found()&quot; below.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
<br>
&gt; +<br>
&gt; +config USB_SMARTCARD_EMULATED<br>
&gt; +=C2=A0 =C2=A0 bool<br>
&gt; +=C2=A0 =C2=A0 default y<br>
&gt; +=C2=A0 =C2=A0 depends on USB<br>
&gt;<br>
&gt;=C2=A0 config USB_STORAGE_MTP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool<br>
&gt; diff --git a/hw/usb/meson.build b/hw/usb/meson.build<br>
&gt; index 793df42e21..353006fb6c 100644<br>
&gt; --- a/hw/usb/meson.build<br>
&gt; +++ b/hw/usb/meson.build<br>
&gt; @@ -51,8 +51,8 @@ softmmu_ss.add(when: &#39;CONFIG_USB_SMARTCARD&#39;,=
 if_true: files(&#39;dev-smartcard-reade<br>
&gt;<br>
&gt;=C2=A0 if cacard.found()<br>
&gt;=C2=A0 =C2=A0 usbsmartcard_ss =3D ss.source_set()<br>
&gt; -=C2=A0 usbsmartcard_ss.add(when: &#39;CONFIG_USB_SMARTCARD&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 if_true: [cacard, files(&#39;ccid-card-emulated.c&#39;, &#39;ccid-c=
ard-passthru.c&#39;)])<br>
&gt; +=C2=A0 usbsmartcard_ss.add(when: &#39;CONFIG_USB_SMARTCARD_EMULATED&#=
39;, if_true: [cacard, files(&#39;ccid-card-emulated.c&#39;)])<br>
&gt; +=C2=A0 usbsmartcard_ss.add(when: &#39;CONFIG_USB_SMARTCARD_PASSTHRU&#=
39;, if_true: [cacard, files(&#39;ccid-card-passthru.c&#39;)])<br>
&gt;=C2=A0 =C2=A0 hw_usb_modules +=3D {&#39;smartcard&#39;: usbsmartcard_ss=
}<br>
&gt;=C2=A0 endif<br>
&gt;<br>
&gt; --<br>
&gt; 2.35.3<br>
&gt;<br>
&gt;<br>
<br>
<br>
-- <br>
Marc-Andr=C3=A9 Lureau<br>
<br>
</blockquote></div></div></div>

--00000000000068ce4b05ee321667--


