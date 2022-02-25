Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC74C4851
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 16:08:26 +0100 (CET)
Received: from localhost ([::1]:59608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNcCm-00079V-V5
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 10:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNc85-00048E-Rk
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:03:44 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1nNc83-00041e-62
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 10:03:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 238B461534
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 15:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A015C340F3
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645801407;
 bh=8tgY1YkBbYTWTXyYR4O+XbrJwoQVpT2+sYNnsPtqvH0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dw9ap3JVLMMql71K82hI4mKsP/7YHWQoyfv72bwQlBiAVWxaiwD1wRw3F+VZXEvvx
 WQ875mGxuzYNn9YOGvOVhfM48/vJmXWbVWzJawe9/qtylmFhRFKzi/WIlticaLs2cM
 AIsKthZYoQsa2oyxoCpZ4YjBqEKyMb9wcdQRk1xHNA53poMUthPP4xAVhwDjyRsWdQ
 zUiWsfTNGn4gtWhCXAbO3yoH2GxxQrng0fLO7xpjNZyfrFAeZaNLFEQf/aFqJSVq2Q
 N6ip6YngC/8NKzFuprepndLFjNKU7KXIMlZ5Hj7GkAhONkklJjut0MRGVV52yDZV2+
 8foGTd4vToHxA==
Received: by mail-yb1-f176.google.com with SMTP id j2so6511025ybu.0
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 07:03:27 -0800 (PST)
X-Gm-Message-State: AOAM530Q5e+m6BEd5zLiPw8TDnpZoyNoAbVHD6JH9mRekj9RoTxE8xI9
 eFbB7KNmHoucoa22s1y1W+KIiUtyXrATpcygrGs=
X-Google-Smtp-Source: ABdhPJwozR+tvIwdArnwynmJXvOgvPU8UZYk0FrDkdJKmQOdPasCTGp0ANalFhRoBVSWGK5vHEFvk0JS4lVatY3R8aA=
X-Received: by 2002:a25:24ce:0:b0:61e:1276:bfcf with SMTP id
 k197-20020a2524ce000000b0061e1276bfcfmr7488253ybk.299.1645801406586; Fri, 25
 Feb 2022 07:03:26 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pJ3wb=EbUErJrCRC=VYGhFZqj2ar_AkVPsUvAnqGtwwg@mail.gmail.com>
 <20220225124848.909093-1-Jason@zx2c4.com>
 <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
In-Reply-To: <05c9f2a9-accb-e0de-aac7-b212adac7eb2@amazon.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Feb 2022 16:03:15 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGbP+NGjqLndPS7EO_sazyoN7ot5siCR5hPTJfNYU2SaQ@mail.gmail.com>
Message-ID: <CAMj1kXGbP+NGjqLndPS7EO_sazyoN7ot5siCR5hPTJfNYU2SaQ@mail.gmail.com>
Subject: Re: [PATCH v4] virt: vmgenid: introduce driver for reinitializing RNG
 on VM fork
To: Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=ardb@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, KVM list <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Weiss, Radu" <raduweis@amazon.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 KY Srinivasan <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, ben@skyportsystems.com,
 Dexuan Cui <decui@microsoft.com>, Eric Biggers <ebiggers@kernel.org>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 adrian@parity.io, Jann Horn <jannh@google.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Colm MacCarthaigh <colmmacc@amazon.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-hyperv@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Igor Mammedov <imammedo@redhat.com>, "Woodhouse, David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 25 Feb 2022 at 14:58, Alexander Graf <graf@amazon.com> wrote:
>
>
> On 25.02.22 13:48, Jason A. Donenfeld wrote:
> >
> > VM Generation ID is a feature from Microsoft, described at
> > <https://go.microsoft.com/fwlink/?LinkId=3D260709>, and supported by
> > Hyper-V and QEMU. Its usage is described in Microsoft's RNG whitepaper,
> > <https://aka.ms/win10rng>, as:
> >
> >      If the OS is running in a VM, there is a problem that most
> >      hypervisors can snapshot the state of the machine and later rewind
> >      the VM state to the saved state. This results in the machine runni=
ng
> >      a second time with the exact same RNG state, which leads to seriou=
s
> >      security problems.  To reduce the window of vulnerability, Windows
> >      10 on a Hyper-V VM will detect when the VM state is reset, retriev=
e
> >      a unique (not random) value from the hypervisor, and reseed the ro=
ot
> >      RNG with that unique value.  This does not eliminate the
> >      vulnerability, but it greatly reduces the time during which the RN=
G
> >      system will produce the same outputs as it did during a previous
> >      instantiation of the same VM state.
> >
> > Linux has the same issue, and given that vmgenid is supported already b=
y
> > multiple hypervisors, we can implement more or less the same solution.
> > So this commit wires up the vmgenid ACPI notification to the RNG's newl=
y
> > added add_vmfork_randomness() function.
> >
> > It can be used from qemu via the `-device vmgenid,guid=3Dauto` paramete=
r.
> > After setting that, use `savevm` in the monitor to save the VM state,
> > then quit QEMU, start it again, and use `loadvm`. That will trigger thi=
s
> > driver's notify function, which hands the new UUID to the RNG. This is
> > described in <https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Ddocs/spec=
s/vmgenid.txt>.
> > And there are hooks for this in libvirt as well, described in
> > <https://libvirt.org/formatdomain.html#general-metadata>.
> >
> > Note, however, that the treatment of this as a UUID is considered to be
> > an accidental QEMU nuance, per
> > <https://github.com/libguestfs/virt-v2v/blob/master/docs/vm-generation-=
id-across-hypervisors.txt>,
> > so this driver simply treats these bytes as an opaque 128-bit binary
> > blob, as per the spec. This doesn't really make a difference anyway,
> > considering that's how it ends up when handed to the RNG in the end.
> >
> > Cc: Adrian Catangiu <adrian@parity.io>
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Dominik Brodowski <linux@dominikbrodowski.net>
> > Cc: Ard Biesheuvel <ardb@kernel.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
...
> > +
> > +       device->driver_data =3D state;
> > +
> > +out:
> > +       ACPI_FREE(parsed.pointer);
> > +       return ret;
> > +}
> > +
> > +static void vmgenid_acpi_notify(struct acpi_device *device, u32 event)
> > +{
> > +       struct vmgenid_state *state =3D acpi_driver_data(device);
> > +       u8 old_id[VMGENID_SIZE];
> > +
> > +       memcpy(old_id, state->this_id, sizeof(old_id));
> > +       memcpy(state->this_id, state->next_id, sizeof(state->this_id));
> > +       if (!memcmp(old_id, state->this_id, sizeof(old_id)))
> > +               return;
> > +       add_vmfork_randomness(state->this_id, sizeof(state->this_id));
> > +}
> > +
> > +static const struct acpi_device_id vmgenid_ids[] =3D {
> > +       { "VMGENID", 0 },
> > +       { "QEMUVGID", 0 },
>
>
> According to the VMGenID spec[1], you can only rely on _CID and _DDN for
> matching. They both contain "VM_Gen_Counter". The list above contains
> _HID values which are not an official identifier for the VMGenID device.
>
> IIRC the ACPI device match logic does match _CID in addition to _HID.
> However, it is limited to 8 characters. Let me paste an experimental
> hack I did back then to do the _CID matching instead.
>
> [1]
> https://download.microsoft.com/download/3/1/C/31CFC307-98CA-4CA5-914C-D97=
72691E214/VirtualMachineGenerationID.docx
>

I think matching on the HIDs of two known existing implementations is
fine, as opposed to matching on the (broken) CID of any implementation
that claims to be compatible with it. And dumping random strings into
the _CID property doesn't mesh well with the ACPI spec either, which
is why we don't currently support it.

We could still check _DDN if we wanted to, but I don't think this is
necessary. Other implementations that want to target his driver
explicitly can always put VMGENID or QEMUVGID into the _CID.

