Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC37B69DC8C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:08:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOc2-00084q-I1; Tue, 21 Feb 2023 04:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pUOc0-00084Q-7o
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:07:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1pUObw-0006bl-N5
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676970415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wh9KY0pIsNRH6HWS63II12DcigTcu7yq4JSVnoSRPrw=;
 b=KmUPm4Klun7TK5zob2gmacodDeQFg/T3vgf5B9Pucdnru4uoDKfie7gKrLX0BCdG6S5ghE
 rW+EJQzWKvLrz88hr4Wyx1YH3B/+FzBBwhjCoFzZdpums/lTjJ6L2vPbwLl8vIcTmWoVsx
 rXESOYExqZ7T94BoIsvsZWTW4FNFHAw=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-p3UyIl6sP4qRFlZeKi39Uw-1; Tue, 21 Feb 2023 04:06:53 -0500
X-MC-Unique: p3UyIl6sP4qRFlZeKi39Uw-1
Received: by mail-vs1-f72.google.com with SMTP id
 o9-20020a0561020e0900b0041710d01919so881027vst.21
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 01:06:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676970413;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh9KY0pIsNRH6HWS63II12DcigTcu7yq4JSVnoSRPrw=;
 b=ET+8nVdw9/Lddxt9rrtWJoycorlzaxzggC2Fw9V1vcdm+cpB/o5aplwrMfxGiDL7cU
 73s9ursCJ0OyswuR/DhCYKtd+rbWpsn4C16KJzVRtCn8HMnwj7hTlNPXeBV1gcu/YPpj
 Ji18Hyf8X89GsZBBW42vUQeYBf8TNvbERJxWnrnt0JazzMP7SVvmdaRXAQR85flL4D6F
 yFRza3+XUoDTc6qtpRF9pJJZhBo7WdyuOHHXZXQygUrT8lrclPaxTbmnmvHJvalGJbNA
 2c5sby0iGUmGLscdJUIOP4dqv++ETbJbONBn4Yu5prpXPP5NFKr1NmLquwsm/xmhC5xS
 FOmw==
X-Gm-Message-State: AO0yUKVz2U1EddtCAfqjafkD3B9YDvfpAjpiYbUqLtqz1/jQbXuyiBD/
 Wz/ftAhBA+4X/HznmkjAljmm8Hus6VtvswViz99EXILEMwJZhA1XfoERiAdxCPA9vCgx9AT7s2j
 q7oXiFJFoFFqVZaKhVI4QIc3zYmWB/gM=
X-Received: by 2002:a67:fe14:0:b0:41e:9f03:1e41 with SMTP id
 l20-20020a67fe14000000b0041e9f031e41mr30768vsr.81.1676970413239; 
 Tue, 21 Feb 2023 01:06:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8kA2tkt2zXp4SHjkWK/UZ+CLHVjBWjWS/kZIB2cwkJm+drdvus3/n8I3jo0rvPqH5x0Kp2EusOcxqCAYZWtso=
X-Received: by 2002:a67:fe14:0:b0:41e:9f03:1e41 with SMTP id
 l20-20020a67fe14000000b0041e9f031e41mr30764vsr.81.1676970413036; Tue, 21 Feb
 2023 01:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20230220174142.240393-1-kkostiuk@redhat.com>
 <20230220174142.240393-2-kkostiuk@redhat.com>
 <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
In-Reply-To: <790be50d-9a52-6f92-f053-ee9a4eec0a31@linaro.org>
From: Mauro Matteo Cascella <mcascell@redhat.com>
Date: Tue, 21 Feb 2023 10:06:42 +0100
Message-ID: <CAA8xKjUQFBVgDVJ059FvGoSjkv+kZ5jB1gfMNz+ao-twH7FDRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] qga/win32: Remove change action from MSI installer
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org, 
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>, 
 Yonggang Luo <luoyonggang@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Michael Roth <michael.roth@amd.com>, Yan Vugenfirer <yvugenfi@redhat.com>, 
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, 
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, brian.wiltse@live.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Philippe,

On Tue, Feb 21, 2023 at 9:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 20/2/23 18:41, Konstantin Kostiuk wrote:
> > resolves: rhbz#2167436
>
> "You are not authorized to access bug #2167436."

Please refer to https://bugzilla.redhat.com/show_bug.cgi?id=3D2167423.
It should now be accessible.

> > fixes: CVE-2023-0664
>
> This commit description is rather scarce...
>
> I understand you are trying to fix a CVE, but we shouldn't play
> the "security by obscurity" card. How can the community and
> distributions know this security fix is enough with the bare
> "Remove change action from MSI installer" justification?
> Can't we do better?

CCing Brian Wiltse, who originally found and reported this issue.

Reported-by: Brian Wiltse <brian.wiltse@live.com>

> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
> > ---
> >   qga/installer/qemu-ga.wxs | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/qga/installer/qemu-ga.wxs b/qga/installer/qemu-ga.wxs
> > index 51340f7ecc..feb629ec47 100644
> > --- a/qga/installer/qemu-ga.wxs
> > +++ b/qga/installer/qemu-ga.wxs
> > @@ -31,6 +31,7 @@
> >         />
> >       <Media Id=3D"1" Cabinet=3D"qemu_ga.$(var.QEMU_GA_VERSION).cab" Em=
bedCab=3D"yes" />
> >       <Property Id=3D"WHSLogo">1</Property>
> > +    <Property Id=3D"ARPNOMODIFY" Value=3D"yes" Secure=3D"yes" />
> >       <MajorUpgrade
> >         DowngradeErrorMessage=3D"Error: A newer version of QEMU guest a=
gent is already installed."
> >         />
> > --
> > 2.25.1
> >
> >
>

--=20
Mauro Matteo Cascella
Red Hat Product Security
PGP-Key ID: BB3410B0


