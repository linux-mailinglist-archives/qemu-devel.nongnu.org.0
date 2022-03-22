Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79574E4415
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:20:56 +0100 (CET)
Received: from localhost ([::1]:54872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhFf-0001QH-Gq
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:20:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhEE-0000cF-3p
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWhEB-0004N2-SI
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647965962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q8350RdMzhr3dJRMOnZaykDsv3S6xE3zE684Yijhy9Q=;
 b=R3+eMHmswT758YuXH6CTq1v/XwHouGPAKOgH85QKn5VsPgXa3KQLvqVKWoKY32DozOktDH
 gjcX0MrObFEvi/E4R57c1YFNbAMlhAQiHXZJtxyredaa8YCD1rc2OF6xfncwhOpOVL7x7s
 S6RxcoBVxRiIXUPa5rBy0T/K9mefmBA=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-vQ4aOM7EMSuBL-sU_vnDpw-1; Tue, 22 Mar 2022 12:19:20 -0400
X-MC-Unique: vQ4aOM7EMSuBL-sU_vnDpw-1
Received: by mail-vs1-f70.google.com with SMTP id
 s125-20020a675e83000000b00320c64c3205so2096115vsb.2
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 09:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q8350RdMzhr3dJRMOnZaykDsv3S6xE3zE684Yijhy9Q=;
 b=Z8rLkkgQvM2378OkivPX647bmCanTCrimi6Ma1IkZJrKC3Y89hdovIZb0+190EPHSr
 bWJRtam9mUg1HZS2xY5x/ieYyiCfcSzEN9+GWwCXJap5kbOYBTfIxZPjVjPLON028ZbL
 EpzMQzuMXlKhikBdg6CLWtBy9Z0E9HrdWAY5EbHiQew2UwnC2ab1hwi5HK4z02lzYMCU
 6iTr+URHysTomJhbGD30xq/6v/MLjhfw9nKDk2wVOegZE5cSPd2OdcrJjycu15i5oJms
 CXKcI3U59+k5Ua9Xt+Ux7HjneRZt7QPB9Q/5GLGYi3pDaMSXjAUS6J2JZSZYja0571EG
 hPSQ==
X-Gm-Message-State: AOAM530XNKqHBjbEcTKr+NSdrBEfBBvBEkpaQaURQ79tjG6wSx3xbtIi
 Q3Nryfd/bwvUMircT1aTd/2fIC9cDmTFCXNcBdPSWJlSzNBQ4S8Dq/DA0uiXWnzr0OyqsL7Es0q
 Tx/Y7MrB3ehW0JdES5YZyEkX23c7UlIk=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr9198916vsx.61.1647965960196; 
 Tue, 22 Mar 2022 09:19:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcuK+9cUpoEDlXvIq7nxZFcgm0JC7iz2WE4eUlfVZ8HyTAxheS0h3VJonBklWkIvxNIA2PEo0A7GFUAZC4XO4=
X-Received: by 2002:a67:17c4:0:b0:322:cfd8:15a1 with SMTP id
 187-20020a6717c4000000b00322cfd815a1mr9198908vsx.61.1647965960016; Tue, 22
 Mar 2022 09:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220318203655.676907-1-jsnow@redhat.com>
 <20220318203655.676907-5-jsnow@redhat.com>
 <df38293e-2b72-7678-e684-398514fce655@redhat.com>
In-Reply-To: <df38293e-2b72-7678-e684-398514fce655@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 22 Mar 2022 12:19:10 -0400
Message-ID: <CAFn=p-Z-JADwHe9oV9s8eg=9gPHVejYCUw=3=x3PkpxJBTxs+w@mail.gmail.com>
Subject: Re: [PATCH 04/15] iotests/040: Don't check image pattern on
 zero-length image
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a62a9d05dad0f9e7"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a62a9d05dad0f9e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 22, 2022, 10:22 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.03.22 21:36, John Snow wrote:
> > qemu-io fails on read/write with zero-length raw images, so skip these
> > when running the zero-length image tests.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >   tests/qemu-iotests/040 | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
>
> Doesn=E2=80=99t look specific to zero-length images, but the fact that we=
 do I/O
> beyond the image size, i.e. any image below 1 MB would be affected.
>
> Anyway, the zero-length image is the only one tested with a size of less
> than 1 MB, so this works.
>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
>

(Check the cover letter, too - this patch is still good, but iotest 040
still fails and I'm not 100% clear as to why.)

>

--000000000000a62a9d05dad0f9e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Mar 22, 2022, 10:22 AM Hanna Reitz &lt;<a href=
=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">On 18.03.22 21:36, John Snow wrote:<br>
&gt; qemu-io fails on read/write with zero-length raw images, so skip these=
<br>
&gt; when running the zero-length image tests.<br>
&gt;<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qemu-iotests/040 | 14 ++++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 12 insertions(+), 2 deletions(-)<br>
<br>
Doesn=E2=80=99t look specific to zero-length images, but the fact that we d=
o I/O <br>
beyond the image size, i.e. any image below 1 MB would be affected.<br>
<br>
Anyway, the zero-length image is the only one tested with a size of less <b=
r>
than 1 MB, so this works.<br>
<br>
Reviewed-by: Hanna Reitz &lt;<a href=3D"mailto:hreitz@redhat.com" target=3D=
"_blank" rel=3D"noreferrer">hreitz@redhat.com</a>&gt;<br></blockquote></div=
></div><div dir=3D"auto"><br></div><div dir=3D"auto">(Check the cover lette=
r, too - this patch is still good, but iotest 040 still fails and I&#39;m n=
ot 100% clear as to why.)</div><div dir=3D"auto"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"></blockquote></div></div></div>

--000000000000a62a9d05dad0f9e7--


