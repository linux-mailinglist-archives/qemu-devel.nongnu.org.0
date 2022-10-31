Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2CF6134AF
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 12:42:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opTA4-00071Z-Qn; Mon, 31 Oct 2022 07:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1opTA2-00071E-QA
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:40:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1opTA1-0000Xx-Bt
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 07:40:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667216456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=30iTnvLUr/rGBaFGX1KomQZMW4XXaz+kBkdz4k6YIzM=;
 b=S89RLfKhpxCUm1ZvoCOeDhCzXZGKCZRJAYwQtmf3f0/HZ/jz6G6xnGUA8FP30rRKVTm/rZ
 6jn/ckocRxLIvcuillggrbAWCiueSKW8D3qwEE/f02drC3fJ5XdEGirK8qfDGKS+HNvW/S
 lbXPaV6g5TYcvyFMStfYm8MRF3uY2hY=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-103-aZLOpj9oOpaAXaQdZyF8Ow-1; Mon, 31 Oct 2022 07:40:53 -0400
X-MC-Unique: aZLOpj9oOpaAXaQdZyF8Ow-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-13ca47a9815so2192645fac.17
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 04:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=30iTnvLUr/rGBaFGX1KomQZMW4XXaz+kBkdz4k6YIzM=;
 b=znfOT3b0k5Mtf7AnpDdW1mqF8ZMRjaAXHgcYTvSe/ZZTSA0vSRhzPJWKhasPINtQei
 41FofLRZ+hZ7dx+2E4EY1of7tMEaJ8zK7H96FxTq2DzwzZk7lP16mXKkasao5bfAgwx4
 9hE4x6PG1voLJGDZRIoateKmYbFRGA4NURBg6R76A+hehIFATZGzmrorMvtSYghaLM0Y
 bTPKszQMS3WJFuN2lbup18pKZYPc3o1oV7aT40HvC/1omUnVkiFiNIWelPzH/LFbUewJ
 ChGfJ4nsxCqSHjzhlNOhA8XDyBtfn+FMzvCqbeACpWK3qbPsvXoLwjDhw97rTOcM1pEp
 skFg==
X-Gm-Message-State: ACrzQf0UlBAvO5IiXTOyT0OVgLuHCdv9CiYEmZ/R8q79lhvYl8mnYHm5
 BXD2J2itHZD8dDqSGUCAuQoKsgc1tZq+Mml86W9ug18cUXuO/mPiaf5g7f7evpHo8XvoSCeu0xA
 f0CuwwS3BS+tBkL3SGv9M1ng8H8ZXas0=
X-Received: by 2002:a05:6870:8306:b0:13c:c80:6cbd with SMTP id
 p6-20020a056870830600b0013c0c806cbdmr7284463oae.68.1667216452695; 
 Mon, 31 Oct 2022 04:40:52 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qjyifrRrHsQySYLN+mlSDLgcU3nK3Y3tqHv4bUIr0W0OMVBBnZYsYHM6E9xAn5TWzKCgbixR3k4o4MN0o8Wc=
X-Received: by 2002:a05:6870:8306:b0:13c:c80:6cbd with SMTP id
 p6-20020a056870830600b0013c0c806cbdmr7284448oae.68.1667216452465; Mon, 31 Oct
 2022 04:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <Y19Rqp61A16MJqJI@humpty.home.comstyle.com>
 <178e9535-b70b-bfff-cc07-06bd51bea83a@linaro.org>
In-Reply-To: <178e9535-b70b-bfff-cc07-06bd51bea83a@linaro.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Mon, 31 Oct 2022 13:40:41 +0200
Message-ID: <CAPMcbCr6idtYaSprNcu=riQmR0ctt8AsUUy+bJerc408o=4kBQ@mail.gmail.com>
Subject: Re: [PATCH] qga: Add initial OpenBSD support
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Brad Smith <brad@comstyle.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000069c9a105ec531495"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--00000000000069c9a105ec531495
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>

On Mon, Oct 31, 2022 at 10:12 AM Philippe Mathieu-Daud=C3=A9 <philmd@linaro=
.org>
wrote:

> On 31/10/22 05:40, Brad Smith wrote:
> > qga: Add initial OpenBSD support
> >
> > Signed-off-by: Brad Smith <brad@comstyle.com>
> > ---
> >   meson.build          | 2 +-
> >   qga/commands-bsd.c   | 5 +++++
> >   qga/commands-posix.c | 9 +++++++--
> >   qga/main.c           | 4 ++--
> >   4 files changed, 15 insertions(+), 5 deletions(-)
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
>

--00000000000069c9a105ec531495
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkos=
tiuk@redhat.com">kkostiuk@redhat.com</a>&gt;</div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 31, 2022 at 10:12 A=
M Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org">phil=
md@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 31/10/22 05:40, Brad Smith wrote:<br>
&gt; qga: Add initial OpenBSD support<br>
&gt; <br>
&gt; Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" tar=
get=3D"_blank">brad@comstyle.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;=C2=A0 =C2=A0qga/commands-bsd.c=C2=A0 =C2=A0| 5 +++++<br>
&gt;=C2=A0 =C2=A0qga/commands-posix.c | 9 +++++++--<br>
&gt;=C2=A0 =C2=A0qga/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++-=
-<br>
&gt;=C2=A0 =C2=A04 files changed, 15 insertions(+), 5 deletions(-)<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linar=
o.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
<br>
</blockquote></div>

--00000000000069c9a105ec531495--


