Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8552ECE51
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:58:11 +0100 (CET)
Received: from localhost ([::1]:38940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSza-0000Dm-Lo
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:58:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kxSxv-0007N8-51
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kxSxs-0005Os-AJ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610016983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8y/VqgnJJR+0oDNqP1GLvdHYTamTUtpeqOFO2jOUqo=;
 b=Dtxx0JYBcc4Zefy4q63ZmMyM/8C0Fmny+djZW8lhn2H2Sv/ZUAiPVjnKyFJWPWLFarSOHs
 NOuJZ2ebBvm9vjzOkUPC6EwGLPgRgUhN6V6mOQdEB8tzk2S39hb3RQlp/+WTxnjG9/cq4x
 T+BRq9zrD+Ba86biRnEIFWPYFPLqoPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-kldhRcVsO5qRyW9VQY3hHA-1; Thu, 07 Jan 2021 05:56:20 -0500
X-MC-Unique: kldhRcVsO5qRyW9VQY3hHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26AD11005504;
 Thu,  7 Jan 2021 10:56:19 +0000 (UTC)
Received: from localhost (unknown [10.40.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BADFC36FA;
 Thu,  7 Jan 2021 10:56:17 +0000 (UTC)
Date: Thu, 7 Jan 2021 11:56:15 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 05/12] vt82c686: Make vt82c686b-pm an abstract base
 class and add vt8231-pm based on it
Message-ID: <20210107115615.3cac27b3@redhat.com>
In-Reply-To: <93a8537e-64c1-1a3-8eeb-2114a46458d@eik.bme.hu>
References: <cover.1609967638.git.balaton@eik.bme.hu>
 <c8fa8df147473c3ec5f3284b4a5d37fc9741e824.1609967638.git.balaton@eik.bme.hu>
 <bb288088-db7b-005d-db5a-5a41fb15f069@amsat.org>
 <93a8537e-64c1-1a3-8eeb-2114a46458d@eik.bme.hu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021 11:38:21 +0100 (CET)
BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Thu, 7 Jan 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > Hi Zoltan,
> >
> > On 1/6/21 10:13 PM, BALATON Zoltan wrote: =20
> >> The vt82c686b-pm model can be shared between VT82C686B and VT8231. The
> >> only difference between the two is the device id in what we emulate so
> >> make an abstract via-pm model by renaming appropriately and add types
> >> for vt82c686b-pm and vt8231-pm based on it.
> >>
> >> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >> ---
> >>  hw/isa/vt82c686.c         | 87 ++++++++++++++++++++++++++------------=
-
> >>  include/hw/isa/vt82c686.h |  1 +
> >>  2 files changed, 59 insertions(+), 29 deletions(-) =20
> > ...
> > =20
> >> +typedef struct via_pm_init_info {
> >> +    uint16_t device_id;
> >> +} ViaPMInitInfo;
> >> +
> >>  static void via_pm_class_init(ObjectClass *klass, void *data)
> >>  {
> >>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> >>      PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> >> +    ViaPMInitInfo *info =3D data;
> >>
> >> -    k->realize =3D vt82c686b_pm_realize;
> >> +    k->realize =3D via_pm_realize;
> >>      k->config_write =3D pm_write_config;
> >>      k->vendor_id =3D PCI_VENDOR_ID_VIA;
> >> -    k->device_id =3D PCI_DEVICE_ID_VIA_ACPI;
> >> +    k->device_id =3D info->device_id;
> >>      k->class_id =3D PCI_CLASS_BRIDGE_OTHER;
> >>      k->revision =3D 0x40;
> >> -    dc->reset =3D vt82c686b_pm_reset;
> >> -    dc->desc =3D "PM";
> >> +    dc->reset =3D via_pm_reset; =20
> > =20
> >> +    /* Reason: part of VIA south bridge, does not exist stand alone *=
/
> >> +    dc->user_creatable =3D false;
> >>      dc->vmsd =3D &vmstate_acpi;
> >> -    set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories); =20
> >
> > Please do this change in a previous patch. =20
>=20
> OK, done.
>=20
> >>  }
> >>
> >>  static const TypeInfo via_pm_info =3D {
> >> -    .name          =3D TYPE_VT82C686B_PM,
> >> +    .name          =3D TYPE_VIA_PM,
> >>      .parent        =3D TYPE_PCI_DEVICE,
> >> -    .instance_size =3D sizeof(VT686PMState),
> >> -    .class_init    =3D via_pm_class_init,
> >> +    .instance_size =3D sizeof(ViaPMState),
> >> +    .abstract      =3D true,
> >>      .interfaces =3D (InterfaceInfo[]) {
> >>          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >>          { },
> >>      },
> >>  };
> >>
> >> +static const ViaPMInitInfo vt82c686b_pm_init_info =3D {
> >> +    .device_id =3D PCI_DEVICE_ID_VIA_ACPI,
> >> +};
> >> +
> >> +static const TypeInfo vt82c686b_pm_info =3D {
> >> +    .name          =3D TYPE_VT82C686B_PM,
> >> +    .parent        =3D TYPE_VIA_PM,
> >> +    .class_init    =3D via_pm_class_init,
> >> +    .class_data    =3D (void *)&vt82c686b_pm_init_info, =20
> >
> > Igor said new code should avoid using .class_data:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg678305.html
> > Can you convert to "leaf class"? Then this patch is good to go. =20
>=20
> That says for machines it is not advised (and Igor generally prefers init=
=20
> funcs everywhere) but this is a device model. Is it still not allowed to=
=20
> use class_data here? I think this is shorter this way than with an init=
=20
> function but I may try to convert if absolutely necessary.

For this simple case class_init would be cleaner as it doesn't need casting=
 (void*).
But I'm fine with either approaches here.

> Regards,
> BALATON Zoltan
>=20
> > A trivial example of conversion is commit f0eeb4b6154
> > ("hw/arm/raspi: Avoid using TypeInfo::class_data pointer").
> > =20
> >> +};
> >> +
> >> +static const ViaPMInitInfo vt8231_pm_init_info =3D {
> >> +    .device_id =3D 0x8235,

Is it possible to replace magic number with a human readable macro?

> >> +};
> >> +
> >> +static const TypeInfo vt8231_pm_info =3D {
> >> +    .name          =3D TYPE_VT8231_PM,
> >> +    .parent        =3D TYPE_VIA_PM,
> >> +    .class_init    =3D via_pm_class_init,
> >> +    .class_data    =3D (void *)&vt8231_pm_init_info,
> >> +};
> >>
> >> =20
> >
> > =20


