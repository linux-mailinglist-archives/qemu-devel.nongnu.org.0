Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1636584066
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:52:33 +0200 (CEST)
Received: from localhost ([::1]:48318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3wG-0000gC-Ma
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH3k7-0006DN-2k
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oH3k2-0004GO-S0
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C1suQ564O99ILsBd9V37aojj/Fkc9ZXZqRnnQE99uWE=;
 b=F8JGOOiwBlWBaOiGTa0GVNeMzPhWJW5E6BpN9AKYVBee5h1PQauX580yTGwr9f5NGAaF2O
 yUXCkdSD5e8ydGirqEFTgqJHPdYECBXQmywgczyPTdsbEx3JfWsLZJwA0t49JfWUwh9m2p
 8LsRO33g3zJimor8OHXu96cPLRk9GJw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-359-OEfGnvOENFivG7tCCEKUwQ-1; Thu, 28 Jul 2022 09:39:52 -0400
X-MC-Unique: OEfGnvOENFivG7tCCEKUwQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y10-20020a056402270a00b0043c0fed89b9so1126256edd.15
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C1suQ564O99ILsBd9V37aojj/Fkc9ZXZqRnnQE99uWE=;
 b=POSfaJ52CM/xOBlqvv3EFee4IQIEaNVL3KMaDm4+nNfxhbxFlpEqMmY9aHB7jEDdyc
 QdpCvreCPUbT9g0x8KECrq4wjUTlEjay89nU9JRqi+NPQ1XTNcN+pxNXaBHv0vHQKgNJ
 gekjeGr2Ykj2LYZuy+R9V+KxJ+YmMj2V6BT2tx5+LCi7WRNkQBYzDNHJKCoASrSHOVOR
 iACcjGVO9eLp8ck8uKVVegcqF0Z6fRc6ldJ5KYfuWFjk0WbmSIgAH4k/EiwvEaWDIcDn
 Bhhzc8j+q6TK43UHhx3LDeVOyVj7tPHYE7CrwZanynpabVWIj/jNa3RKNsbCtMxZWWf4
 aq+w==
X-Gm-Message-State: AJIora+GG1GlWYHTVc/NJIWtKefm8KABQ9k+rbXvw+07bWomfIjceLH6
 oFz/wnEIHZc1pJpEJhCCOX1OitDyoAEj5IFoCeatVcOdZDxmDtwrFVO/nmLXXJBd9Xal1ZxD2NW
 xUXkJQqt/cnMAIHE=
X-Received: by 2002:a05:6402:294c:b0:43a:91a9:a691 with SMTP id
 ed12-20020a056402294c00b0043a91a9a691mr27909050edb.182.1659015591775; 
 Thu, 28 Jul 2022 06:39:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uf82VDA+piJKwoOkRTGLe94Rx2+M9KHLsl+pG+LhcusoXK9SXCf1TzeVLw6l0FOWqUsacIJg==
X-Received: by 2002:a05:6402:294c:b0:43a:91a9:a691 with SMTP id
 ed12-20020a056402294c00b0043a91a9a691mr27909029edb.182.1659015591518; 
 Thu, 28 Jul 2022 06:39:51 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 x13-20020aa7dacd000000b0043cab10f702sm731724eds.90.2022.07.28.06.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 06:39:51 -0700 (PDT)
Date: Thu, 28 Jul 2022 15:39:50 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, "Daniel P. =?UTF-8?B?QmVy?=
 =?UTF-8?B?cmFuZ8Op?=" <berrange@redhat.com>, qemu-devel@nongnu.org,
 mst@redhat.com, t0rr3sp3dr0@gmail.com, alex.bennee@linaro.org,
 dgilbert@redhat.com, agraf@suse.de
Subject: Re: [PATCH for-7.1] applesmc: silence invalid key warning in case
 default one is used
Message-ID: <20220728153950.7b48b7bb@redhat.com>
In-Reply-To: <87mtctxt49.fsf@pond.sub.org>
References: <20220728093558.1163751-1-imammedo@redhat.com>
 <YuJbaxMbqNF+Cw65@redhat.com>
 <CAFEAcA85qvEjV53XMs3uDWKqzY4vrLqxfLKjZ_qfbrYMmfkx=Q@mail.gmail.com>
 <YuJjhHLzQEx4Ui1J@redhat.com>
 <CAFEAcA_cH7_r7vFYno1A=1XfjfWHj=VbDY62up2yqrkQ3VdTLw@mail.gmail.com>
 <87mtctxt49.fsf@pond.sub.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 28 Jul 2022 15:29:58 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Peter Maydell <peter.maydell@linaro.org> writes:
>=20
> > On Thu, 28 Jul 2022 at 11:23, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote: =20
> >>
> >> On Thu, Jul 28, 2022 at 11:05:13AM +0100, Peter Maydell wrote: =20
> >> > On Thu, 28 Jul 2022 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote: =20
> >> > >
> >> > > On Thu, Jul 28, 2022 at 05:35:58AM -0400, Igor Mammedov wrote: =20
> >> > > > QEMU probably can't carry OSK key[1] for legal reasons so it
> >> > > > can't supply the valid default key. However when tests are run
> >> > > > applesmc will pollute test log with distracting warning,
> >> > > > silence that warning so it won't distract maintainers/CI. =20
> >> > >
> >> > > What test is causing this problem ? =20
> >> >
> >> > bios-tables-test -- see here for the relevant bit of the log:
> >> >
> >> > https://lore.kernel.org/qemu-devel/CAFEAcA8u8jm7b+JD_t0qMNMy+WSJPOw=
=3DqxqptZpwTp=3DTkcXrhg@mail.gmail.com/ =20
> >>
> >> The right fix is for bios-tables-tests to pass an explicit 'osk' value
> >> then. As its a test it doesn't have to be a genuine OSK, jsut any old
> >> 64-byte string
> >>
> >> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-=
test.c
> >> index 359916c228..f6b5adf200 100644
> >> --- a/tests/qtest/bios-tables-test.c
> >> +++ b/tests/qtest/bios-tables-test.c
> >> @@ -1632,7 +1632,7 @@ static void test_acpi_q35_applesmc(void)
> >>          .variant =3D ".applesmc",
> >>      };
> >>
> >> -    test_acpi_one("-device isa-applesmc", &data);
> >> +    test_acpi_one("-device isa-applesmc,osk=3Diamalsonottherealoskimj=
ustheretostopbiostablestestspammingstderr", &data);
> >>      free_test_data(&data); =20
> >
> > We should either have a comment saying that this has to be exactly
> > 64 characters and it doesn't matter what they are; or we could use
> >  any64characterfakeoskisenoughtopreventinvalidkeywarningsonstderr
> >
> > :-) =20
>=20
> I applaud the renaissance of roman-style inscriptions, but it's not just
> words without spaces, it's also capital letters only:
>=20
>     ANY64CHARACTERFAKEOSKISENOUGHTOPREVENTINVALIDKEYWARNINGSONSTDERR
>=20
> Seriously, throw in some dashes or spaces.

too late, but added a comment above hieroglyphs style string

>=20


