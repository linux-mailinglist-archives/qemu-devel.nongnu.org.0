Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0EA4F08D1
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Apr 2022 12:53:59 +0200 (CEST)
Received: from localhost ([::1]:37678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naxrq-0002So-Fs
	for lists+qemu-devel@lfdr.de; Sun, 03 Apr 2022 06:53:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1naxpX-00012U-90
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 06:51:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1naxpV-0000Hu-Rl
 for qemu-devel@nongnu.org; Sun, 03 Apr 2022 06:51:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648983092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JBEnWqyMQ1F/diQPdJNiGAXPo6FyWmt7GSjoEuLeaJs=;
 b=RcS6nBgyELZko58NHZKyfr9HyWC0w0m9aJgaFYP8Fz1yzkGhIQoQlHohIddB5IOxmcriit
 uO2y+L8VA9LZvLm9LJkPqQIakHkS7zoGQ3kMfF+RHlSVjIVVuxL5xDm7F1szfNtaRI7NUC
 An7YGnjL29Wo1k0/HjYVEJx0y4YVBvQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-cg9pIYeLPoif9KSIEC-6aQ-1; Sun, 03 Apr 2022 06:51:31 -0400
X-MC-Unique: cg9pIYeLPoif9KSIEC-6aQ-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-2eb5980c4f8so7841717b3.23
 for <qemu-devel@nongnu.org>; Sun, 03 Apr 2022 03:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JBEnWqyMQ1F/diQPdJNiGAXPo6FyWmt7GSjoEuLeaJs=;
 b=JEIE6a+fMnWW/4dOyUBxLbCF+QLdwYEQhuCcr9VvAAVAZ+61HLXja2U+gFldMNeQtR
 AaqsdOneDptMU+CK18z3TSEVtUeAd4nIEGfUYKxCk6qfCO5xEUzMSr9qc3x5pOb5cUkz
 dOVfMmkv66f6WLF46QTOpv52MFO34Gb7kvWMtSM9vLRupMtTZsLSYwxEJzRdpHPkwvmZ
 EFZOesem740mA9w7gsfpiHTF7P3OK3FTdBb7hh8xPMJ4WglAKj3tUkmI9cevkhu5rbYv
 FlC5ccoqPBw6FUq2MAfr07sBR+ZYXhJlwfRmOIQHowlX383IyfTg4sLY3WigXCQGNDXs
 86GQ==
X-Gm-Message-State: AOAM533q2FY4LGyEsWS/ueKDCI0i6eGSzXi3JFhC3KYCCGoEWxFoKcWj
 QfZNG9Xs40jq9G9RHzJkPW6+7AwQEqpEEMOiXuWDR7XPOEifk7GE40OdigD6Ii1lveyD0DxlOaG
 h4GEvo3hWfVePPazuCIIheJktEvhGUR8=
X-Received: by 2002:a0d:cc8a:0:b0:2eb:3faa:474c with SMTP id
 o132-20020a0dcc8a000000b002eb3faa474cmr5469482ywd.385.1648983090854; 
 Sun, 03 Apr 2022 03:51:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs6x8qyjRYyjq+5+KBD3NpyBVs+AgNk4zCwsD9tXs1X1nI9GXr6vBSXv1Lg3SthZd2PTVQXrgCluyOc2LnnZI=
X-Received: by 2002:a0d:cc8a:0:b0:2eb:3faa:474c with SMTP id
 o132-20020a0dcc8a000000b002eb3faa474cmr5469469ywd.385.1648983090589; Sun, 03
 Apr 2022 03:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220331201127.2006038-1-marcandre.lureau@redhat.com>
 <05601508-78fc-e861-53a5-539634d7d536@gmail.com>
In-Reply-To: <05601508-78fc-e861-53a5-539634d7d536@gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Sun, 3 Apr 2022 13:51:19 +0300
Message-ID: <CAPMcbCostn5qHtvP-fJLNL6cy9sr6OXzmW1jgAZER3MngGaeSQ@mail.gmail.com>
Subject: Re: [PATCH] build-sys: remove MSI's QEMU_GA_MSI_MINGW_DLL_PATH
To: qemu-devel@nongnu.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkostiuk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005b0b9d05dbbdcbe3"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b0b9d05dbbdcbe3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Thu, Mar 31, 2022 at 11:34 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> On 31/3/22 22:11, marcandre.lureau@redhat.com wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Since the introduction of the variable in commit 9dacf32d2cb ("qemu-ga:
> > Building Windows MSI installation with configure/Makefile"), nothing
> > makes use of the Mingw_dlls variable in the .wxs file.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >   configure       | 3 ---
> >   qga/meson.build | 1 -
> >   2 files changed, 4 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
>

--0000000000005b0b9d05dbbdcbe3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a hr=
ef=3D"mailto:kkostiuk@redhat.com" target=3D"_blank">kkostiuk@redhat.com</a>=
&gt;</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Mar 31, 2022 at 11:34 PM Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philippe.mathieu.daude@gmail.com">philippe.mathieu.daude@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On 31/3/22 22:11, <a href=3D"mailto:marcandre.lureau@redhat.com" target=
=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Since the introduction of the variable in commit 9dacf32d2cb (&quot;qe=
mu-ga:<br>
&gt; Building Windows MSI installation with configure/Makefile&quot;), noth=
ing<br>
&gt; makes use of the Mingw_dlls variable in the .wxs file.<br>
&gt; <br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0| 3 ---<br>
&gt;=C2=A0 =C2=A0qga/meson.build | 1 -<br>
&gt;=C2=A0 =C2=A02 files changed, 4 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
</blockquote></div></div>

--0000000000005b0b9d05dbbdcbe3--


