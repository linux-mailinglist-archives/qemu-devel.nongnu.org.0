Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3AD62C2F8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 16:49:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKea-0004Y6-ER; Wed, 16 Nov 2022 10:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKeU-0004TX-55
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:48:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ovKeS-0002Jv-9R
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 10:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668613715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpszX8NAsdctKP7zqYiaMTdy749Jmnwnn12XCX7WItg=;
 b=XCVV38My4sn8KOQUeoIFMPKGcU3p9rl+Br2prQgbgzCUGr64eDaQ53ar0t+S3CpTvFYTrq
 JSlZ05qU6FPLAyuhxzpOHH4si+8Zm93XPZEsmiJr2UkL/Sx+QihWm2cQu656+F/0FiPfMW
 7HKnG//2pcVEfhBXUMmTUb1dSAT9H+8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-638-NxshHgtXMTi7VKEitEu_bg-1; Wed, 16 Nov 2022 10:48:34 -0500
X-MC-Unique: NxshHgtXMTi7VKEitEu_bg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g14-20020a056402090e00b0046790cd9082so8333911edz.21
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 07:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dpszX8NAsdctKP7zqYiaMTdy749Jmnwnn12XCX7WItg=;
 b=3JeDq+OOtLcGexmDxat8RD8xYz2X3sSdTvnqDQbjmAY4l8gY+sOMt2KUXtd745rAa0
 K6YoVrs68wYkptM2xwYDVVnPMQXmgGcgi9X7tg95pvmm0hwWzucskvche+1/eXX6D4Rm
 V51/3ipCKzf7unjIRWJ4l8v29npSx4Xa+OHmIkCQ54L6poxWJlelGQEauQQUh6kza4eB
 OOaYb3oj0tZxooLYNYiasXnB+w4u5Va7BZN7NDzci/hTl49swWE+4OsUs5JkZXFkN9rX
 9/4c6SHJCrhCEYh70JQC6RWoHcvzFkVcry4q0R0Lkm8/JPexRdCp9IER0c5YbQ6ngaXP
 aW6A==
X-Gm-Message-State: ANoB5plyIkE8HZd3kOmKTSWAyW/uRhbNwIJCfceEHLLCvC3GaEKGAxnm
 m8oYeeeNvQa/9xTS2pJepE2m2FFWTq/7YHP2Egk1G8RC4kdRoaPbYRuDmzVOVoDzMiJ1DAjYeXt
 bgnQdJ5dHvjNZIPI=
X-Received: by 2002:a17:906:b181:b0:7ad:69eb:90c3 with SMTP id
 w1-20020a170906b18100b007ad69eb90c3mr18676141ejy.285.1668613712944; 
 Wed, 16 Nov 2022 07:48:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4iD2AS+527xj/vRPLeg42So8Wyc/RymbCTlBvANG8/DE9CKacLFzUwtBMGVsv4l7Ivuh6zsg==
X-Received: by 2002:a17:906:b181:b0:7ad:69eb:90c3 with SMTP id
 w1-20020a170906b18100b007ad69eb90c3mr18676117ejy.285.1668613712737; 
 Wed, 16 Nov 2022 07:48:32 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b0079800b81709sm6953778ejo.219.2022.11.16.07.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 07:48:32 -0800 (PST)
Date: Wed, 16 Nov 2022 16:48:31 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, mst@redhat.com, ani@anisinha.ca,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 mark.cave-ayland@ilande.co.uk, peter.maydell@linaro.org,
 andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 2/2] pci: drop redundant PCIDeviceClass::is_bridge field
Message-ID: <20221116164831.4f4266cd@imammedo.users.ipa.redhat.com>
In-Reply-To: <894b767d-b071-a37a-db61-9538d63e00dc@linaro.org>
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-3-imammedo@redhat.com>
 <894b767d-b071-a37a-db61-9538d63e00dc@linaro.org>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 16 Nov 2022 16:35:10 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 16/11/22 16:27, Igor Mammedov wrote:
> > and use cast to TYPE_PCI_BRIDGE instead.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >   include/hw/pci/pci.h               | 11 +----------
> >   include/hw/pci/pci_bridge.h        |  1 +
> >   hw/acpi/pcihp.c                    |  3 +--
> >   hw/i386/acpi-build.c               |  5 ++---
> >   hw/pci-bridge/cxl_downstream.c     |  1 -
> >   hw/pci-bridge/cxl_upstream.c       |  1 -
> >   hw/pci-bridge/i82801b11.c          |  1 -
> >   hw/pci-bridge/pci_bridge_dev.c     |  1 -
> >   hw/pci-bridge/pcie_pci_bridge.c    |  1 -
> >   hw/pci-bridge/pcie_root_port.c     |  1 -
> >   hw/pci-bridge/simba.c              |  1 -
> >   hw/pci-bridge/xio3130_downstream.c |  1 -
> >   hw/pci-bridge/xio3130_upstream.c   |  1 -
> >   hw/pci-host/designware.c           |  1 -
> >   hw/pci-host/xilinx-pcie.c          |  1 -
> >   hw/pci/pci.c                       | 20 +++++++++-----------
> >   hw/ppc/spapr_pci.c                 | 15 +++++----------
> >   17 files changed, 19 insertions(+), 47 deletions(-) =20
>=20
> > @@ -1090,9 +1088,10 @@ static PCIDevice *do_pci_register_device(PCIDevi=
ce *pci_dev,
> >       Error *local_err =3D NULL;
> >       DeviceState *dev =3D DEVICE(pci_dev);
> >       PCIBus *bus =3D pci_get_bus(pci_dev);
> > +    bool is_bridge =3D IS_PCI_BRIDGE(pci_dev);
> >  =20
> >       /* Only pci bridges can be attached to extra PCI root buses */
> > -    if (pci_bus_is_root(bus) && bus->parent_dev && !pc->is_bridge) {
> > +    if (pci_bus_is_root(bus) && bus->parent_dev && !IS_PCI_BRIDGE(pci_=
dev)) { =20
>=20
> Can we use the recently assigned 'is_bridge' variable?

yep, that was an intention behind the variable.
I'll fix it up on respin.

>=20
> Otherwise:
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>=20


