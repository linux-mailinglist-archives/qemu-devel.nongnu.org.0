Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2F04C4451
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 13:09:05 +0100 (CET)
Received: from localhost ([::1]:49908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNZPE-0002Qu-MD
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 07:09:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNZHf-0005eM-MD
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:01:19 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:54822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=hxd0=TI=zx2c4.com=Jason@kernel.org>)
 id 1nNZHc-00050R-Fc
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 07:01:15 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 333BEB82F58
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B198C340F1
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 12:01:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Mg6X/Zur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645790466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKJ8kj3JCrrxThlQ3iYnN2yFuKHQlideGF4Hi15eC4A=;
 b=Mg6X/Zur+6rkOR1Wdb+Hl1lFB5C9toAKZ9YHA7zKPZ8WGRLOyDc8rshkwscr3x1WDqoBsJ
 i3IOEHOnNKqj6W2AT9jo6Foq1PEAKaQQp8DpBIOGGSCmUicJbmX0O0JgQabqM1b4vlAZIs
 iiZ8qskkV1AJ8q2qlg5KKNM/6qRPyrg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3094513e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Fri, 25 Feb 2022 12:01:06 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2d79394434dso30812467b3.5
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 04:01:05 -0800 (PST)
X-Gm-Message-State: AOAM533uq4/LOb3UCukwKAde6jySNn4JzURUrxm9mR6YmXtPvkhBpbXa
 fvLAoZLw1sNDPL+fNo/K5Ra55AMHO8JCi+8PyGA=
X-Google-Smtp-Source: ABdhPJzOZdurIMZ0P9SbV33Il9mssGaSP73pY/PcPM5ehDl2bVRn5dIeKDcCAaK2fAgt/Er6hip+9B77IAK11QE0Db8=
X-Received: by 2002:a0d:d995:0:b0:2d6:f086:c0ec with SMTP id
 b143-20020a0dd995000000b002d6f086c0ecmr7354502ywe.396.1645790463524; Fri, 25
 Feb 2022 04:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20220224133906.751587-1-Jason@zx2c4.com>
 <20220224133906.751587-3-Jason@zx2c4.com>
 <CAMj1kXE-2sknZD7o72G-ZARpfm4Q0m+im1pTLuPhPu6TkqKOPQ@mail.gmail.com>
In-Reply-To: <CAMj1kXE-2sknZD7o72G-ZARpfm4Q0m+im1pTLuPhPu6TkqKOPQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Feb 2022 13:00:52 +0100
X-Gmail-Original-Message-ID: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
Message-ID: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] virt: vmgenid: introduce driver for reinitializing
 RNG on VM fork
To: Ard Biesheuvel <ardb@kernel.org>
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
 KY Srinivasan <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, ben@skyportsystems.com,
 Dexuan Cui <decui@microsoft.com>, Eric Biggers <ebiggers@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 adrian@parity.io, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Alexander Graf <graf@amazon.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>, Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 25, 2022 at 12:24 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> > @@ -13,6 +13,15 @@ menuconfig VIRT_DRIVERS
> >
> >  if VIRT_DRIVERS
> >
> > +config VMGENID
> > +       tristate "Virtual Machine Generation ID driver"
> > +       default y
>
> Please make this default m - this code can run as a module and the
> feature it relies on is discoverable by udev

Will do.

> > index 000000000000..5da4dc8f25e3
> > --- /dev/null
> > +++ b/drivers/virt/vmgenid.c
> > @@ -0,0 +1,121 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Virtual Machine Generation ID driver
> > + *
> > + * Copyright (C) 2022 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
> > + * Copyright (C) 2020 Amazon. All rights reserved.
> > + * Copyright (C) 2018 Red Hat Inc. All rights reserved.
> > + */
> > +
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/acpi.h>
> > +#include <linux/random.h>
> > +
> > +ACPI_MODULE_NAME("vmgenid");
> > +
> > +enum { VMGENID_SIZE = 16 };
> > +
> > +static struct {
> > +       u8 this_id[VMGENID_SIZE];
> > +       u8 *next_id;
> > +} state;
> > +
>
> This state is singular
>
>
> > +static int vmgenid_acpi_add(struct acpi_device *device)
> > +{
>
> ... whereas this may be called for multiple instances of the device.
> This likely makes no sense, so it is better to reject it here.

Like, return early if it's called a second time? I can do that.

>
> > +       struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER };
> > +       union acpi_object *pss;
> > +       phys_addr_t phys_addr;
> > +       acpi_status status;
> > +       int ret = 0;
> > +
> > +       if (!device)
> > +               return -EINVAL;
> > +
> > +       status = acpi_evaluate_object(device->handle, "ADDR", NULL, &buffer);
> > +       if (ACPI_FAILURE(status)) {
> > +               ACPI_EXCEPTION((AE_INFO, status, "Evaluating ADDR"));
> > +               return -ENODEV;
> > +       }
> > +       pss = buffer.pointer;
> > +       if (!pss || pss->type != ACPI_TYPE_PACKAGE || pss->package.count != 2 ||
> > +           pss->package.elements[0].type != ACPI_TYPE_INTEGER ||
> > +           pss->package.elements[1].type != ACPI_TYPE_INTEGER) {
> > +               ret = -EINVAL;
> > +               goto out;
> > +       }
> > +
> > +       phys_addr = (pss->package.elements[0].integer.value << 0) |
> > +                   (pss->package.elements[1].integer.value << 32);
> > +       state.next_id = acpi_os_map_memory(phys_addr, VMGENID_SIZE);
>
> No need to use acpi_os_map_memory() here, plain memremap() should be fine.

As we discussed online, I'll use dev_memremap(), and then get rid of
the `.remove = ` function all together.

> > +               acpi_os_unmap_memory(state.next_id, VMGENID_SIZE);
>
> memunmap() here

And then as discussed, this goes away too.

>
> > +       state.next_id = NULL;
> > +       return 0;
> > +}
> > +
> > +static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
> > +{
> > +       u8 old_id[VMGENID_SIZE];
> > +
> > +       if (!device || acpi_driver_data(device) != &state)
> > +               return;
> > +       memcpy(old_id, state.this_id, sizeof(old_id));
> > +       memcpy(state.this_id, state.next_id, sizeof(state.this_id));
> > +       if (!memcmp(old_id, state.this_id, sizeof(old_id)))
> > +               return;
>
> Is this little dance really necessary? I.e., can we just do
>
> add_vmfork_randomness(state.next_id, VMGENID_SIZE)
>
> and be done with it?

Yes it is. vmfork induces a "premature-next" which we really should
not do unless it's really necessary. It torches the whole entropy
pool. In the even that this notifier fires but the ID hasn't changed,
we shouldn't touch anything.

Thanks for the review. v+1 coming up shortly.

