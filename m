Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059A154CA0C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 15:44:14 +0200 (CEST)
Received: from localhost ([::1]:45432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1TJc-0003SH-Gz
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 09:44:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1THM-0002b5-HM
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o1THJ-0003RT-6I
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 09:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655300507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aKDbUv/t8SK20cwR/GbEIINxAOlVcHYnT0SEaG29lJs=;
 b=OgByEP2Nm0QpSX/E7c/Jx39IT0wZZN5CjxJXHEgEg1tE3vdSxRumyVL0XUEu2nPRe/TUDR
 0mbVCidqcIlvfS3BBrRtbXmmESHDxcUUdy2irvKwgDdwmt8xxbYaBR9aQg/p8WQL/qD3A/
 e1ZmX28KAoR5ZLJrGe8dHFLIjd4nQEM=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-RC4vFEEfORmuVKAlVcFknA-1; Wed, 15 Jun 2022 09:41:44 -0400
X-MC-Unique: RC4vFEEfORmuVKAlVcFknA-1
Received: by mail-vk1-f198.google.com with SMTP id
 bk49-20020a0561220e3100b0035ce7546b32so2029279vkb.18
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 06:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aKDbUv/t8SK20cwR/GbEIINxAOlVcHYnT0SEaG29lJs=;
 b=JxV8zcosFxpytDvGRBCPrbjLvBEuU83swQ5bsfveKs/4SP3EU4KR9Tt39jgxwENdt/
 Sb82v+Hmal/Y7CK4bMmj4VPlIpTe3g2qIry14PW+HhOpqqDaGnaYIYxak3Iegjnoi7qG
 lCJYPt50IlxA+fe/8oyI0q/QCOFgpygDrpmldgmSSZOMi9BDDwGP23Sq0X28Pl9k8tB2
 umMdAzZuHlFYbXz3/HZn06dHjbxdj8irKJBlgXfsGCUO9ByegLINSDVyW8TUseZQKbrP
 Kv3tNbYLnF+Al8otp8aX3uJRkRL+izu1NvAtIOYdK4qkUbAdCKPpp1ZXKTpSSrCR2FPf
 5jqg==
X-Gm-Message-State: AJIora9m/yHLwzh+pxNd3yWLuKGmTH0fhGlYDEzrexvgUZoSL9fSvpBy
 xfFXmJb6u07GnIsyPysqCJK19dXBLON1ZCmB9B68ZqzaXVvq8SuHJJsr3w4REXQCUm2Fv3IwkIF
 h3lbvcrroCYa8PtvnZjaP2j23pent3dw=
X-Received: by 2002:a1f:2093:0:b0:35e:21fb:1b65 with SMTP id
 g141-20020a1f2093000000b0035e21fb1b65mr4738340vkg.35.1655300503912; 
 Wed, 15 Jun 2022 06:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfC6jAvIyTIc8jJStHzZtTL33em3LLVpesKF7G4aO2GH3h8Fu+ogw3fcMcNDKsMz72kpdncOaC8W1MEeAVWuo=
X-Received: by 2002:a1f:2093:0:b0:35e:21fb:1b65 with SMTP id
 g141-20020a1f2093000000b0035e21fb1b65mr4738321vkg.35.1655300503667; Wed, 15
 Jun 2022 06:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-3-jsnow@redhat.com>
 <fa6e9152-73a1-d6ca-269a-1b1513472aa8@redhat.com>
 <YqhN50NeY3RIfvmy@redhat.com>
 <CAFn=p-a0hf6tp7NYS73S3OW9N_KA+NQRcLNAxh-UreVF9RkZ2Q@mail.gmail.com>
In-Reply-To: <CAFn=p-a0hf6tp7NYS73S3OW9N_KA+NQRcLNAxh-UreVF9RkZ2Q@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 15 Jun 2022 09:41:32 -0400
Message-ID: <CAFn=p-a2kQcuy6T47dWiFUOR2eWZhMOw9VJNEYT0Y6xau7YqTQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] tests/qemu-iotests: skip 108 when FUSE is not loaded
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
 Qemu-block <qemu-block@nongnu.org>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, Jun 14, 2022 at 10:30 AM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Jun 14, 2022 at 4:59 AM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> >
> > On Tue, Jun 14, 2022 at 06:46:35AM +0200, Thomas Huth wrote:
> > > On 14/06/2022 03.50, John Snow wrote:
> > > > In certain container environments we may not have FUSE at all, so s=
kip
> > > > the test in this circumstance too.
> > > >
> > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > ---
> > > >   tests/qemu-iotests/108 | 6 ++++++
> > > >   1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/tests/qemu-iotests/108 b/tests/qemu-iotests/108
> > > > index 9e923d6a59f..e401c5e9933 100755
> > > > --- a/tests/qemu-iotests/108
> > > > +++ b/tests/qemu-iotests/108
> > > > @@ -60,6 +60,12 @@ if sudo -n losetup &>/dev/null; then
> > > >   else
> > > >       loopdev=3Dfalse
> > > > +    # Check for fuse support in the host environment:
> > > > +    lsmod | grep fuse &>/dev/null;
> > >
> > > That doesn't work if fuse has been linked statically into the kernel.=
 Would
> > > it make sense to test for /sys/fs/fuse instead?
> > >
> > > (OTOH, we likely hardly won't run this on statically linked kernels a=
nyway,
> > > so it might not matter too much)
> >
> > But more importantly 'lsmod' may not be installed in our container
> > images. So checking /sys/fs/fuse avoids introducing a dep on the
> > 'kmod' package.
> >
> > >
> > > > +    if [[ $? -ne 0 ]]; then
> > >
> > > I'd prefer single "[" instead of "[[" ... but since we're requiring b=
ash
> > > anyway, it likely doesn't matter.
> >
> > Or
> >
> >     if  test $? !=3D 0 ; then
> >
> > >
> > > > +        _notrun 'No Passwordless sudo nor FUSE kernel module'
> > > > +    fi
> > > > +
> > > >       # QSD --export fuse will either yield "Parameter 'id' is miss=
ing"
> > > >       # or "Invalid parameter 'fuse'", depending on whether there i=
s
> > > >       # FUSE support or not.
> > >
>
> Good suggestions, thanks!
>

I think I need to test against /dev/fuse instead, because /sys/fs/fuse
actually exists, but because of docker permissions (etc), FUSE isn't
actually usable from the child container.

I wound up with this:

# Check for usable FUSE in the host environment:
if test ! -c "/dev/fuse"; then
    _notrun 'No passwordless sudo nor usable /dev/fuse'
fi

Seems to work for my case here, at least, but I don't have a good
sense for how broadly flexible it might be. It might be nicer to
concoct some kind of NOP fuse mount instead, but I wasn't able to
figure out such a command quickly.

The next problem I have is actually related; test-qga (for the
Centos.x86_64 run) is failing because the guest agent is reading
/proc/self/mountinfo -- which contains entries for block devices that
are not visible in the current container scope. I think when QGA goes
to read info about these devices to populate a response, it chokes.
This might be a genuine bug in QGA if we want it to tolerate existing
inside of a container.

--js


