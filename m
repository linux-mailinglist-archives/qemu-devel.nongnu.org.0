Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C81583E63
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 14:12:04 +0200 (CEST)
Received: from localhost ([::1]:40302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH2N2-0000E3-0b
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 08:12:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH2JJ-0001zh-2V
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH2JH-0005lx-8A
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 08:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659010090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dFDhWfBTvb7XJHJ4NSGJyYleLUmA//E0Tw0qA7rzJL8=;
 b=bvj68vjsLapfF9ZEYboQ3yz1c77bdpg61SBjmC3ynVSWP66Eh1Pz0K0mS/o/bC6mYusISf
 UKkTT/YcPu57dpTX0yz3YGXMYPLcFyB1lKzUDu4SZwTArAE/fG+UGiFsBGBrd0BfGMJOLf
 Bnl3tecNYrwQsiFI0Q55AySgvjHJPTI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-cksD_A0OMbm4MMIMdnVrHg-1; Thu, 28 Jul 2022 08:08:09 -0400
X-MC-Unique: cksD_A0OMbm4MMIMdnVrHg-1
Received: by mail-ej1-f70.google.com with SMTP id
 oz11-20020a1709077d8b00b0072f2f17c267so553111ejc.16
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 05:08:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dFDhWfBTvb7XJHJ4NSGJyYleLUmA//E0Tw0qA7rzJL8=;
 b=w9VdAgjbZcAHv967pqNkVvPxQa4/fx6Er9DpU0rI1vQqEyUjkA6E/r2PUabfvEPGkv
 9t5NxT25jLvq3Uki3UScaz0Us6gVq1gl34RILSe4R0CcBv0dTjqAV9qeB33XEEAY2d04
 gd2zj5etBf1BGpICF10B18d8qk0Z1qtluF9po2biDBeJoVGVJt+h86VU2nE/05huSCyj
 nK+l7CAakW75UP174fvx9gM4yVxcPqii68psV7iFlIfSJMuOEe8B+6yG/Zpo7i0OE9m6
 rt0fBnZggVKOBDWVLQ8mAhlBOV53TywTsFBKAwCLwDgWrAyI1T5PEvHAFRvbyY33hB5v
 yNKw==
X-Gm-Message-State: AJIora9wKBrCDjEzxiEZ7rY84TZMto4InxoNxwg1ZEerTlceiCMnrrlQ
 +pldvgF/VHCnpuZCAj2wgb8B4KZJoWdB3nVxpyer79MgSg4+AQpm/keiLx4DOgpExduZLWH2DnD
 CvrLOgRn0+RD8pMQ=
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr20626863ejc.49.1659010087835; 
 Thu, 28 Jul 2022 05:08:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tWJ2uOPPEW1hkGEoLDtUmdXZYv1dy7keeLQ/bWqPB/QWnAy2wt54WiDanweDFTYKE+/XusDQ==
X-Received: by 2002:a17:907:7396:b0:72d:a080:86a9 with SMTP id
 er22-20020a170907739600b0072da08086a9mr20626845ejc.49.1659010087595; 
 Thu, 28 Jul 2022 05:08:07 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a056402114500b0043cf0d56a61sm575194edw.8.2022.07.28.05.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 05:08:07 -0700 (PDT)
Date: Thu, 28 Jul 2022 14:08:06 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, t0rr3sp3dr0@gmail.com,
 alex.bennee@linaro.org, dgilbert@redhat.com, agraf@suse.de,
 peter.maydell@linaro.org
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
Message-ID: <20220728140806.7e85b183@redhat.com>
In-Reply-To: <YuJbaxMbqNF+Cw65@redhat.com>
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jul 2022 10:48:27 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote:
> > QEMU probably can't carry OSK key[1] for legal reasons so it
> > can't supply the valid default key. However when tests are run
> > applesmc will pollute test log with distracting warning,
> > silence that warning so it won't distract maintainers/CI. =20
>=20
> What test is causing this problem ?
>=20
> >=20
> > If user launches MacOS guest without supplying valid or any key
> > they will get upset MacOS (and legality of specifying valid key
> > on CLI is also questionable). This patch favors QEMU/tests vs
> > MacOS guest.
> >=20
> > A patch from Apple needed to change default to the valid key,
> > until then prefer QEMU maintainers sanity/cleaner test logs
> > vs any inconvenience users running MacOS guest might suffer.
> >=20
> > 1) After some googling, it seems 'secret' key is the same for
> >    all Mac hardware and is widely known but whether it's
> >    permited to use that is up to lawyers/Apple to decide.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/misc/applesmc.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
> > index 5f9c742e50..bce27b0950 100644
> > --- a/hw/misc/applesmc.c
> > +++ b/hw/misc/applesmc.c
> > @@ -84,7 +84,7 @@ enum {
> >  #define smc_debug(...) do { } while (0)
> >  #endif
> > =20
> > -static char default_osk[64] =3D "This is a dummy key. Enter the real k=
ey "
> > +static char default_osk[65] =3D "This is a dummy key. Enter the real k=
ey "
> >                                "using the -osk parameter"; =20
>=20
> This is a distinct bug fix from the problem described. We should
> take this as a standalone fix no matter what.

thought about it (until I started to write commit message for that)
but it becomes bug only if default_osk is treated as NULL terminated
string, which happens only if following hunk is applied.
Without that, it's treated as 64 bytes. (we can null-terminate it
anyways just to be on a safe side)

> >  struct AppleSMCData {
> > @@ -335,10 +335,12 @@ static void applesmc_isa_realize(DeviceState *dev=
, Error **errp)
> >      isa_register_ioport(&s->parent_obj, &s->io_err,
> >                          s->iobase + APPLESMC_ERR_PORT);
> > =20
> > -    if (!s->osk || (strlen(s->osk) !=3D 64)) {
> > -        warn_report("Using AppleSMC with invalid key");
> > +    if (!s->osk) {
> >          s->osk =3D default_osk;
> >      }
> > +    if (strlen(s->osk) !=3D 64) {
> > +        warn_report("Using AppleSMC with invalid key");
> > +    } =20
>=20
> This means users who invoke QEMU won't see the warning any more. This
> feels like a dubious change, as it degrades the user experiance for
> sake of tests - IMHO users takes priority over any testing.
>=20
> With regards,
> Daniel


