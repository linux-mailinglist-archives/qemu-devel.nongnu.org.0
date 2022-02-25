Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8754C47CB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 15:42:50 +0100 (CET)
Received: from localhost ([::1]:55370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNbo1-0000eq-A4
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 09:42:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNbQQ-0002ey-IY
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:18:31 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNbQM-0003VG-WD
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 09:18:26 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3AC01B830C8
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5A79C340F0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 14:18:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZEH8RZdN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645798695;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uSqLnlnlYkI9AFDK+dTAw0XhAkDujSKiKT+1u2tB1Eg=;
 b=ZEH8RZdNgmHSXQzPHqqnaD5t4qhgKau/jiAp1RuGyohXpI72JAVjuSDtlWwQuTnNheLGe1
 FXrVjlBeqgPWwYjAUVQb5DsWGXyXm3DRp5aYT/J3dKNbYykQxV2dAPOC3m0caf/CE1QbDY
 PnaGUKPis3pEOjxOcaRhL4qjhWZdKcs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17970c2c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 25 Feb 2022 14:18:15 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so35081347b3.2
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 06:18:14 -0800 (PST)
X-Gm-Message-State: AOAM533aokv+rd+T5gF6MiEG16N565I1VH6sOS+G4PBqjvi1pTdZO0Pk
 0aLPbhGSwsOh/5tyu2FoToERoZhVranhXcF05lU=
X-Google-Smtp-Source: ABdhPJyAIBjcgySwjHVFkFa3Dtx+CHfd3sGiVdtkFFH5oIAfMcpE/adDECZiwcrv/0KSOJJf+VkyDHuROOt3DAiKeMA=
X-Received: by 2002:a0d:e005:0:b0:2d7:fb79:8f36 with SMTP id
 j5-20020a0de005000000b002d7fb798f36mr8270139ywe.404.1645798693111; Fri, 25
 Feb 2022 06:18:13 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
 <YhjjuMOeV7+T7thS@zx2c4.com>
In-Reply-To: <YhjjuMOeV7+T7thS@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Feb 2022 15:18:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9ov+4Eh0Gzi0XpS6dQ5u-FQnxXoMSQ-HEpFucEmWtNV2A@mail.gmail.com>
Message-ID: <CAHmME9ov+4Eh0Gzi0XpS6dQ5u-FQnxXoMSQ-HEpFucEmWtNV2A@mail.gmail.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: linux-hyperv@vger.kernel.org, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "K . Y . Srinivasan" <kys@microsoft.com>, Ard Biesheuvel <ardb@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 ben@skyportsystems.com, Dexuan Cui <decui@microsoft.com>,
 Eric Biggers <ebiggers@kernel.org>, Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, adrian@parity.io,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Theodore Ts'o <tytso@mit.edu>, Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 3:12 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Alex,
>
> On Fri, Feb 25, 2022 at 02:57:38PM +0100, Alexander Graf wrote:
> > > +static const struct acpi_device_id vmgenid_ids[] = {
> > > +       { "VMGENID", 0 },
> > > +       { "QEMUVGID", 0 },
> >
> >
> > According to the VMGenID spec[1], you can only rely on _CID and _DDN for
> > matching. They both contain "VM_Gen_Counter". The list above contains
> > _HID values which are not an official identifier for the VMGenID device.
> >
> > IIRC the ACPI device match logic does match _CID in addition to _HID.
> > However, it is limited to 8 characters. Let me paste an experimental
> > hack I did back then to do the _CID matching instead.
> >
> > [1]
> > https://download.microsoft.com/download/3/1/C/31CFC307-98CA-4CA5-914C-D9772691E214/VirtualMachineGenerationID.docx
> >
> >
> > Alex
> >
> > diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> > index 1682f8b454a2..452443d79d87 100644
> > --- a/drivers/acpi/bus.c
> > +++ b/drivers/acpi/bus.c
> > @@ -748,7 +748,7 @@ static bool __acpi_match_device(struct acpi_device
> > *device,
> >           /* First, check the ACPI/PNP IDs provided by the caller. */
> >           if (acpi_ids) {
> >               for (id = acpi_ids; id->id[0] || id->cls; id++) {
> > -                if (id->id[0] && !strcmp((char *)id->id, hwid->id))
> > +                if (id->id[0] && !strncmp((char *)id->id, hwid->id,
> > ACPI_ID_LEN - 1))
> >                       goto out_acpi_match;
> >                   if (id->cls && __acpi_match_device_cls(id, hwid))
> >                       goto out_acpi_match;
> > diff --git a/drivers/virt/vmgenid.c b/drivers/virt/vmgenid.c
> > index 75a787da8aad..0bfa422cf094 100644
> > --- a/drivers/virt/vmgenid.c
> > +++ b/drivers/virt/vmgenid.c
> > @@ -356,7 +356,8 @@ static void vmgenid_acpi_notify(struct acpi_device
> > *device, u32 event)
> >   }
> >
> >   static const struct acpi_device_id vmgenid_ids[] = {
> > -    {"QEMUVGID", 0},
> > +    /* This really is VM_Gen_Counter, but we can only match 8 characters */
> > +    {"VM_GEN_C", 0},
> >       {"", 0},
> >   };
>
> I recall this part of the old thread. From what I understood, using
> "VMGENID" + "QEMUVGID" worked /well enough/, even if that wasn't
> technically in-spec. Ard noted that relying on _CID like that is
> technically an ACPI spec notification. So we're between one spec and
> another, basically, and doing "VMGENID" + "QEMUVGID" requires fewer
> changes, as mentioned, appears to work fine in my testing.
>
> However, with that said, I think supporting this via "VM_Gen_Counter"
> would be a better eventual thing to do, but will require acks and
> changes from the ACPI maintainers. Do you think you could prepare your
> patch proposal above as something on-top of my tree [1]? And if you can
> convince the ACPI maintainers that that's okay, then I'll happily take
> the patch.

Closely related concern that whatever patch you come up with will have
to handle is MODULE_DEVICE_TABLE and udev autoloading. I don't know if
_CID matching is something that happens in udev or what its limits
are, so that'll have to be researched and tested a bit.

Jason

