Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366AE62F595
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 14:10:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ow16v-0004oX-OX; Fri, 18 Nov 2022 08:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ow16q-0004oF-4w
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:08:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ow16o-0005fU-6w
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 08:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668776920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAMDp/libg+8f2EYj8QXeMPmc60wrxKfrD4XjjxfkT4=;
 b=Meh021M1HcvCjti1QFphUuQ3ZHt7dZpY6nWYtPJQBOrNflfDB/xeUQhPG80QlRZZ+/xt6c
 QMviQeHsYMYGStr8H4Mb4i5M1ly5Gc6wTxe5UQ9/4O/rlxqh9Q9eA0ibU+/yv1zHPWM2J9
 /PJWWvyShEAtm1okIctY6l1k8ZDxHRM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-u7_D5SOJM9KZZ7yV-3oLbQ-1; Fri, 18 Nov 2022 08:08:39 -0500
X-MC-Unique: u7_D5SOJM9KZZ7yV-3oLbQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 hp16-20020a1709073e1000b007adf5a83df7so3001867ejc.1
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 05:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WAMDp/libg+8f2EYj8QXeMPmc60wrxKfrD4XjjxfkT4=;
 b=AXt5Vw0BePCcfNS8jGHfg4BZ3Zbsu6FkJMEDjvZ84hRoygC3vlBhmmNiemq9uTYFoY
 29tJMdwL9YgnoVqTkl3ziLAG9NvFK57MMBSowAOUJ5eVCfCXshKS27ViI2APnRQT3eMb
 J9GbUVwgJcBhiZaSjUpn3fuVwTTUuFC7LU70+clOXR89aWfxYQNAes7pFk1vtan38w0H
 bqt5u1kCNXdxRu1hneJLHqlB+caMw1c0EGJAlgGo9KY2YRJdLbhXMDdh/jodInX13VVf
 F8IOUYJPezbfeLwSIJNuLyWnnZ/JJoO2ltiJV0bZUqL5HPGkw90iHQmKr9q2c1f7fLCI
 4RgA==
X-Gm-Message-State: ANoB5pkBCw6NzIpDjXrsJPsA5xgMaVWekmaTVaOf22J9StET4YdcmMYV
 cW/Iko7Uv+zpFCMcqUPYbb2BEnoaKceReJxEy/6J2ryoRTOM0AfD6k+LvY9DkWsusFijPm+jRl0
 Z9Vm4gu2zKDjCN2s=
X-Received: by 2002:aa7:c04f:0:b0:45c:f13b:4b96 with SMTP id
 k15-20020aa7c04f000000b0045cf13b4b96mr6105544edo.129.1668776918571; 
 Fri, 18 Nov 2022 05:08:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59ep/8HClAdju0HPvtVkXVxtuxDnB68EmmrXaCCLKE6tJGRELG8drOtLfNsiXUcspUxJO1jA==
X-Received: by 2002:aa7:c04f:0:b0:45c:f13b:4b96 with SMTP id
 k15-20020aa7c04f000000b0045cf13b4b96mr6105518edo.129.1668776918339; 
 Fri, 18 Nov 2022 05:08:38 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 r9-20020a17090609c900b0078c1e174e11sm1660567eje.136.2022.11.18.05.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Nov 2022 05:08:37 -0800 (PST)
Date: Fri, 18 Nov 2022 14:08:36 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Volker =?UTF-8?B?UsO8bWVsaW4=?= <vr_qemu@t-online.de>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, qemu-devel@nongnu.org
Subject: Re: [PULL v4 46/83] acpi: pc/q35: drop ad-hoc PCI-ISA bridge AML
 routines and let bus ennumeration generate AML
Message-ID: <20221118140836.73d76e08@imammedo.users.ipa.redhat.com>
In-Reply-To: <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
References: <20221107224600.934080-1-mst@redhat.com>
 <20221107224600.934080-47-mst@redhat.com>
 <d1e1b4a5-1200-dad7-4e82-eacdbd71b92d@t-online.de>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Thu, 17 Nov 2022 22:51:46 +0100
Volker R=C3=BCmelin <vr_qemu@t-online.de> wrote:

> > From: Igor Mammedov<imammedo@redhat.com>
> >
> > PCI-ISA bridges that are built in PIIX/Q35 are building its own AML
> > using AcpiDevAmlIf interface. Now build_append_pci_bus_devices()
> > gained AcpiDevAmlIf interface support to get AML of devices atached
> > to PCI slots.
> > So drop ad-hoc build_q35_isa_bridge()/build_piix4_isa_bridge()
> > and let PCI bus enumeration to include PCI-ISA bridge AML
> > when it's enumerated by build_append_pci_bus_devices().
> >
> > AML change is mostly contextual, which moves whole ISA hierarchy
> > directly under PCI host bridge instead of it being described
> > as separate \SB.PCI0.ISA block.
> >
> > Note:
> > If bus/slot that hosts ISA bridge has BSEL set, it will gain new
> > ASUN and _DMS entries (i.e. acpi-index support, but it should not
> > cause any functional change and that is fine from PCI Firmware
> > spec point of view), potentially it's possible to suppress that
> > by adding a flag to PCIDevice but I don't see a reason to do that
> > yet, I'd rather treat bridge just as any other PCI device if it's
> > possible.
> >
> > Signed-off-by: Igor Mammedov<imammedo@redhat.com>
> > Message-Id:<20221017102146.2254096-4-imammedo@redhat.com>
> > Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin<mst@redhat.com>
> > ---
> >   hw/i386/acpi-build.c | 75 --------------------------------------------
> >   hw/isa/lpc_ich9.c    | 23 ++++++++++++++
> >   hw/isa/piix3.c       | 17 +++++++++-
> >   3 files changed, 39 insertions(+), 76 deletions(-) =20
>=20
> Hi Igor,
>=20
> since this patch SeaBIOS no longer detects the PS/2 keyboard. This means=
=20
> there's no keyboard in SeaBIOS, GRUB or FreeDOS. OVMF and Linux detect=20
> the PS/2 keyboard without issues.
>=20
> Here are a few lines from the SeaBIOS debug log.
>=20
> table(50434146)=3D0x007e1971 (via rsdt)
> ACPI: parse DSDT at 0x007e0040 (len 6449)
> parse_termlist: parse error, skip from 92/465
> Scan for VGA option rom
> Running option rom at c000:0003
> Start SeaVGABIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
>=20
> and later
>=20
> SeaBIOS (version rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org)
> ACPI: no PS/2 keyboard present

it looks like SeaBIOS looks for EISA id,
but what is strange is that this patch doesn't have anything
that touches eisaid.

I'll have to debug seabios to figure out why this patch
affects it.

>=20
> It doesn't matter if the machine type is pc or q35.
>=20
> If I revert this patch, the PS/2 keyboard works again.
>=20
> With best regards,
> Volker
>=20
>=20
>=20
>=20
>=20


