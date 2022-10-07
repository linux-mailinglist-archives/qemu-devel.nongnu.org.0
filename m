Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C95F7802
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:36:38 +0200 (CEST)
Received: from localhost ([::1]:33782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmaj-0004P3-Fi
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogl0u-0001JL-55
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:55:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogl0r-0004KV-9T
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665140128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LR64z9tpD5q5kLTHlTIWBzNNn9hIJP7ERF5yiEfl3iM=;
 b=iztQnmJhEihpv8pofFGNgqn9XpyCsZ5dvHlwwPbwWAE8uudInZ7ZzsmXSbJZY/QwLc2/Zq
 HmFiROoeJUxhjuT+xi+ANmlhU+YLoonh/NVa8Dc8myZBUz9Au0jGofx+9rN+OIe/n7XZoj
 SfNKK+6fDGIpHnH52OXz8xF/65bvOjQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-RlYAlLTKOn6B8BByeCfPeg-1; Fri, 07 Oct 2022 06:55:27 -0400
X-MC-Unique: RlYAlLTKOn6B8BByeCfPeg-1
Received: by mail-vs1-f72.google.com with SMTP id
 q185-20020a6743c2000000b003a6ee1e0c90so1144644vsa.17
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 03:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LR64z9tpD5q5kLTHlTIWBzNNn9hIJP7ERF5yiEfl3iM=;
 b=26fAoUk6NTLp4Jy5iNHWOofIuvuxe6vbh0vAkajVKRHOvNYfo+P0Bu9Cn9NstS1oZk
 mjvg0I7RTQgdye22wSdxwZ0/4h3HMuJLZ6LMdNN9IxNu19Nsmc8fkZrxdT4TTtrLOg8b
 h/7gvtv/bdzyNE10DEpJAe5b4MAojU/xC3kDhzwOo+quunOe1m4O+oIJDqLFPWwTfWtS
 VbR4HnMdoQ8Rxr6xWcOvpWza3BkOJjQ11czlFg7Iaz7b+oRI8LyMAk5JNnzpxrYuImyP
 79QqoT33DRTVy3wRx0qAnx9BwoHDLIWXVVYEkUaWCdkOJJ0koKea5YtXcfxSy5evib1V
 cJfw==
X-Gm-Message-State: ACrzQf1Jg3Uba+6zOh2NmEUao1RCFcF2ZjYgMqzdzI7p9j0XP0TpgdNx
 SZTjgp9cdidskFREIF77v+UhdvBXPxz6xGK4pSg3PKfAZUSa7Fm7xSeoYrPiHXJ2TphCiy/A3kJ
 42Lp9QFJtqM3RS4Bqgi0FbFwAv0CXM0A=
X-Received: by 2002:ab0:7789:0:b0:3be:fd5f:768f with SMTP id
 x9-20020ab07789000000b003befd5f768fmr2604697uar.109.1665140126554; 
 Fri, 07 Oct 2022 03:55:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7z47vvSNwcJZfMIYVIqV5wsMQyk3FPL1u/LcLv52c5O4BsLPAXI8lCk/WfdaURMULNF5n6yLczT2H2b2yPaPE=
X-Received: by 2002:ab0:7789:0:b0:3be:fd5f:768f with SMTP id
 x9-20020ab07789000000b003befd5f768fmr2604689uar.109.1665140126344; Fri, 07
 Oct 2022 03:55:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220928180603.101533-1-venu.busireddy@oracle.com>
 <CABgObfYXMBnVp2NqhyxOGjppDPc81Qk_fKepF6uzTkOBMoj2zA@mail.gmail.com>
 <YzYcqNqVCiobf/IB@lt>
 <CABgObfbydWZbUvgQVA4ACaR8GgZuft8c9bMTm7_bM86P44vnig@mail.gmail.com>
 <YzcAK23fRnohvXNT@lt>
 <CABgObfZ-8T+=PgPuxtTc5GHgK9sGGTs_HUrcWG0N3kXXLXAZnQ@mail.gmail.com>
 <YztsgiapfWC78BG+@lt> <bb2d1de3-5622-076a-7282-06c812bb4804@redhat.com>
 <Yz8rdO34FowbLH/c@lt>
In-Reply-To: <Yz8rdO34FowbLH/c@lt>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 7 Oct 2022 06:55:15 -0400
Message-ID: <CABgObfbznb1Yn1TK-4AU5vVd_-fhNqrxjVKJCBbu19_+1Z=mcg@mail.gmail.com>
Subject: Re: [PATCH v3] virtio-scsi: Send "REPORTED LUNS CHANGED" sense data
 upon disk hotplug events.
To: Venu Busireddy <venu.busireddy@oracle.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bb7c1f05ea6fa58c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000bb7c1f05ea6fa58c
Content-Type: text/plain; charset="UTF-8"

Il gio 6 ott 2022, 15:25 Venu Busireddy <venu.busireddy@oracle.com> ha
scritto:

> I do see that the Solaris driver does send the 0x1a command during
> the initialization, perhaps (?) seeking the value of UA_INTLCK_CTRL.
> Since QEMU currently does not support it, QEMU sends back a
> key/asc/ascq=0x05/0x24/0x00 response, indicating that 0x1a is an Illegal
> Request.


What is your QEMU command line and what is the full CDB (apart from 0x1a)?

I am assuming that the Solaris driver does not handle that
> response well (I still don't have access to the source code to verify
> that), confuses itself about the value of UA_INTLCK_CTRL, and hence does
> not handle the response to the REPORT_LUNS command correctly.


No this has nothing to do with what's happening. The most likely reason for
the bug IMO is simple: the event is causing the driver to send the REPORT
LUNS command, but it does so in a way that does not handle the unit
attention when it is reported.

Paolo

Maybe the
> Solaris driver assumes that QEMU will retain the unit attention condition
> (UA_INTLCK_CTRL = 10b?), and will respond with a REPORTED_LUNS_CHANGED
> for a subsequent command?
>
> Based on your confirmation that we want to handle the REPORT_LUNS command
> as if UA_INTLCK_CTRL is set to 0, I will proceed with the assumption
> that the Solaris driver is at fault, and will work with the Solaris
> driver folks.
>
> In the meantime, as you suggested, I will post v4 with the bus unit
> attention mechanism implemented. We still need that.
>
> Venu
>
>

--000000000000bb7c1f05ea6fa58c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 6 ott 2022, 15:25 Venu Busireddy &lt;<a href=3D=
"mailto:venu.busireddy@oracle.com" target=3D"_blank" rel=3D"noreferrer">ven=
u.busireddy@oracle.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">I do see that the Solaris driver does send the 0x1a command during<=
br>
the initialization, perhaps (?) seeking the value of UA_INTLCK_CTRL.<br>
Since QEMU currently does not support it, QEMU sends back a<br>
key/asc/ascq=3D0x05/0x24/0x00 response, indicating that 0x1a is an Illegal<=
br>
Request.</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">What is your QEMU command line and what is the full CDB (apart from 0x1=
a)?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">I am assuming that the Solaris driver=
 does not handle that<br>
response well (I still don&#39;t have access to the source code to verify<b=
r>
that), confuses itself about the value of UA_INTLCK_CTRL, and hence does<br=
>
not handle the response to the REPORT_LUNS command correctly.</blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto">No this has nothin=
g to do with what&#39;s happening. The most likely reason for the bug IMO i=
s simple: the event is causing the driver to send the REPORT LUNS command, =
but it does so in a way that does not handle the unit attention when it is =
reported.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Maybe the<br>
Solaris driver assumes that QEMU will retain the unit attention condition<b=
r>
(UA_INTLCK_CTRL =3D 10b?), and will respond with a REPORTED_LUNS_CHANGED<br=
>
for a subsequent command?<br>
<br>
Based on your confirmation that we want to handle the REPORT_LUNS command<b=
r>
as if UA_INTLCK_CTRL is set to 0, I will proceed with the assumption<br>
that the Solaris driver is at fault, and will work with the Solaris<br>
driver folks.<br>
<br>
In the meantime, as you suggested, I will post v4 with the bus unit<br>
attention mechanism implemented. We still need that.<br>
<br>
Venu<br>
<br>
</blockquote></div></div></div>

--000000000000bb7c1f05ea6fa58c--


