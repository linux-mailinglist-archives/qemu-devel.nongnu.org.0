Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 538723FAEB1
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 23:24:01 +0200 (CEST)
Received: from localhost ([::1]:46140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKSHX-0005U2-Tv
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 17:23:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mKSGK-0004Qs-5T
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 17:22:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mKSGG-0000Mm-QT
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 17:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630272157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VDSHzI+3IXbVG+n+9QzOQf0snpcKZBa6UxFynHhXaD4=;
 b=WyJHeWHv9JFRajnRNif8eCLIsq6SMdiQ7UhvRQpUweMJ8RCfnZ98pVuOSXojl9YF5H+qq6
 GCNpO7HXnkEEmZk6wS7eoo8IBYzfohANFjE+O1c0KokCm6pnLLCwAIOSBOnJYgqaZi3eF1
 +FTzvp9mWBYHAC3k/Ca1r+9n8IWd4iQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-B87FPphnMlWDpasxQbmoiQ-1; Sun, 29 Aug 2021 17:22:34 -0400
X-MC-Unique: B87FPphnMlWDpasxQbmoiQ-1
Received: by mail-pg1-f197.google.com with SMTP id
 d1-20020a630e010000b029023afa459291so4524684pgl.11
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 14:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VDSHzI+3IXbVG+n+9QzOQf0snpcKZBa6UxFynHhXaD4=;
 b=YX+w9W8HYqX0KEfcexJb3u1IHC2DpLukcNAYUVfjCZfb6KPRXoExEapCSeZaNPKDbx
 GL+gvUf+nnD+mL1bsU7dRZRaUMVUdghPb9DUy9+Gc6k7uKPa0jc7rXVfabDIhMQXwspi
 9lMoR8HknS5plimFSCH4NUQ8d8cQK2d8D0Ew+V6EsKDneqQMXC47HfvE+XjGXWqOBqaO
 VHWZLsrdKiFr8B4A6cAXV771G0z1JVVY9CBB4LuDeCpf4YG1SetPSMXLYiH2ney6688P
 WXZ8TA6n1mTHohEMT+2RxO9AuQsw5bvcIbBBFV49pcFnVaqqfbzFo/miVW31Pbx/Y/Jp
 XiJw==
X-Gm-Message-State: AOAM530JpRmhF1ly6g+5Sdy2+mdobB0FLNzTH3YV8sST3A5HaPJJeRdW
 qrFaDk38ZZFaWdPXLa22FBJDFwZsLBIOlyxxeLAlJHN4riYrUsjxAoghG7NefVnfVkwuwv8q/xq
 /iTl77eOIGVgZZ+pGUKLcVTVB7SgepyA=
X-Received: by 2002:a17:902:968a:b0:133:e2c5:4908 with SMTP id
 n10-20020a170902968a00b00133e2c54908mr19054982plp.2.1630272153520; 
 Sun, 29 Aug 2021 14:22:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR25Kw4R49Hdwzhj0DQwl0FjdKw5Ok/Ncu57z8JVaBgmvTFX9wFVepY014BpXjxK71uU3abf3PNVIIOGxjEJE=
X-Received: by 2002:a17:902:968a:b0:133:e2c5:4908 with SMTP id
 n10-20020a170902968a00b00133e2c54908mr19054969plp.2.1630272153230; Sun, 29
 Aug 2021 14:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210829173210.39562-1-thuth@redhat.com>
In-Reply-To: <20210829173210.39562-1-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 30 Aug 2021 01:22:22 +0400
Message-ID: <CAMxuvawhwnwWRXAZOJj3SbtHXE8kC89=pHR+2-TD7ByLzoC_Pw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use meson_options.txt in the configure script
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000094b97705cab9503c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094b97705cab9503c
Content-Type: text/plain; charset="UTF-8"

Hi Thomas

On Sun, Aug 29, 2021 at 9:32 PM Thomas Huth <thuth@redhat.com> wrote:

> It's cumbersome to maintain the build options twice, one time in the
> configure script and one time in meson_options.txt. Thus let's add some
> logic to the configure script to look at the meson_options.txt file
> instead of handling every option twice.
>
> Thomas Huth (3):
>   configure: Add the possibility to read options from meson_options.txt
>   configure: Remove options that can be handled via meson_options.txt
>     instead
>   configure: Get help text from meson_options.txt
>
>  configure         | 429 ++++++----------------------------------------
>  meson_options.txt |   2 +-
>  2 files changed, 53 insertions(+), 378 deletions(-)
>
>
It looks similar to:
https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.com/

Isn't it? (I haven't studied in details neither, I may be out of topic).

--00000000000094b97705cab9503c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 29, 2021 at 9:32=
 PM Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">It&=
#39;s cumbersome to maintain the build options twice, one time in the<br>
configure script and one time in meson_options.txt. Thus let&#39;s add some=
<br>
logic to the configure script to look at the meson_options.txt file<br>
instead of handling every option twice.<br>
<br>
Thomas Huth (3):<br>
=C2=A0 configure: Add the possibility to read options from meson_options.tx=
t<br>
=C2=A0 configure: Remove options that can be handled via meson_options.txt<=
br>
=C2=A0 =C2=A0 instead<br>
=C2=A0 configure: Get help text from meson_options.txt<br>
<br>
=C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 429 ++++++--------------=
--------------------------<br>
=C2=A0meson_options.txt |=C2=A0 =C2=A02 +-<br>
=C2=A02 files changed, 53 insertions(+), 378 deletions(-)<br>
<br></blockquote><div><br></div><div>It looks similar to:<br></div><div><a =
href=3D"https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.co=
m/">https://patchew.org/QEMU/20210107140039.467969-1-pbonzini@redhat.com/</=
a></div><div><br></div><div>Isn&#39;t it? (I haven&#39;t studied in details=
 neither, I may be out of topic).<br></div></div></div>

--00000000000094b97705cab9503c--


