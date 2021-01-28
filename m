Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6E30754B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:59:05 +0100 (CET)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55x2-0006R7-GN
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l55vT-0005AH-LB
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1l55vR-0002fb-CM
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611835043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7r19sItq/HEJzP3kLDZTcP+pUj8gX+RUKiwk0fbyeKk=;
 b=BnV8jscjTFPVh1yFpyp3KkQ+iTsKtmVxbSfB1+e7E9gvzFCc7WirfXI3xN1/73Lms95ZtH
 QVwxED59ZISzpT32uqyW95eoDPUKDu3+boSSvobliYKdPP1UpTQHk+CiQtWNgewR6vm3MF
 aUbtACAB/nEyookHRTYlV4REYo264Ww=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-xOKBcLtXMq6_QhvA2Ef81g-1; Thu, 28 Jan 2021 06:57:19 -0500
X-MC-Unique: xOKBcLtXMq6_QhvA2Ef81g-1
Received: by mail-il1-f198.google.com with SMTP id g3so4364722ild.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7r19sItq/HEJzP3kLDZTcP+pUj8gX+RUKiwk0fbyeKk=;
 b=HsmDvfuFA81adCjlHHis52dBbD8+WCN5r7glMI6hf2v5uDIyR8bkt4iodfajmnFBCL
 HekW8bx2rTI1u+f7TvTqAT3BpmMk3wyTQuEwz+62PmCNr7F8KIF0RcU5kV2Q7sovMIxQ
 fmVHVZJt5GJMEaVCHYBwYS+w23Aokwa6BszUvFqe4L09VoaA2uvaBb+QesdKCh3VFLpj
 vw4sa45GshUTcbb6r6D8agSsYAh4NSFKSaDokUmeznHCCHFibmiLV2qC1nyx912jEBFh
 vNtU8cY72JkSKsMAIA/G6h1tJYG3miMThRuZ0CRB0mTL+LhogC16T0ziu753xLbir3DD
 pTsg==
X-Gm-Message-State: AOAM531vC9Di1XRYexV6VjICbydLL0V1b1nxjHgXTdjZXb6n0VGjv+if
 QXFazFZdr95kXBm04AadfaHgfQaJiYSZhnBUhwK2j2syrtHU6D2QLd+/l0EajuDnUI8lfciFgUD
 wWEWmjEn5ELG/aTo/0G1NiojerwiKWwI=
X-Received: by 2002:a92:d94f:: with SMTP id l15mr12657775ilq.11.1611835039004; 
 Thu, 28 Jan 2021 03:57:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIT2OPridAmVucxc/U2rRZAPgjLVBEdtRhK1Xci3WR64OMAn9z0DnC+ApME/5C2YRW3rgo+0GRkVZCTKh/8jw=
X-Received: by 2002:a92:d94f:: with SMTP id l15mr12657770ilq.11.1611835038742; 
 Thu, 28 Jan 2021 03:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20210128111319.329755-1-marcandre.lureau@redhat.com>
 <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
In-Reply-To: <20210128114352.tvwnx435qbqcv4a4@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 28 Jan 2021 15:57:07 +0400
Message-ID: <CAMxuvazAToFV_uD3Q7whGymoY07eiq-hErToDPB41F2T9ZY7hg@mail.gmail.com>
Subject: Re: [PATCH] spice: delay starting until display are initialized
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ebd50c05b9f496fc"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ebd50c05b9f496fc
Content-Type: text/plain; charset="UTF-8"

Hi

On Thu, Jan 28, 2021 at 3:44 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > diff --git a/ui/spice-display.c b/ui/spice-display.c
> > index 0178d5766d..3d3e3bcb22 100644
> > --- a/ui/spice-display.c
> > +++ b/ui/spice-display.c
> > @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)
> >          }
> >          qemu_spice_display_init_one(con);
> >      }
>
>        if (runstate_is_running()) {
>             qemu_spice_display_start();
>        }
>
> Isn't that enough?
>

That should be fine too, I'll update the patch. thanks

--000000000000ebd50c05b9f496fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 28, 2021 at 3:44 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
 Hi,<br>
<br>
&gt; diff --git a/ui/spice-display.c b/ui/spice-display.c<br>
&gt; index 0178d5766d..3d3e3bcb22 100644<br>
&gt; --- a/ui/spice-display.c<br>
&gt; +++ b/ui/spice-display.c<br>
&gt; @@ -1188,4 +1188,6 @@ void qemu_spice_display_init(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spice_display_init_one(con);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (runstate_is_running()) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_spice_display_start();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Isn&#39;t that enough?<br></blockquote><div><br></div><div>That should be f=
ine too, I&#39;ll update the patch. thanks</div><br></div></div>

--000000000000ebd50c05b9f496fc--


