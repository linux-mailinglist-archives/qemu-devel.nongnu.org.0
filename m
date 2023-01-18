Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8987867129E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 05:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI02d-0002Z4-71; Tue, 17 Jan 2023 23:27:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pI02a-0002Yh-7C
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 23:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pI02X-0004gR-Gb
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 23:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674016026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwIVV2GdMWA9O7WvFo6puxVSK0p8BVpY4+LbrHl3vXw=;
 b=hbys4IgvBVIOwGEr65HLnHVzZxNMevkCXmUOx6Wf2utuAue/uWBJk8Bp8IYLoQRpjBpHYC
 zJFdMjNVclv4vCo1D2S7wXH39oTewsoe6zJ9vLAkSnFLcuadGWMjeGEQxjF9g/2rroLBtu
 hhkwhuzNdKjzRKYB0X8Y53fPZL+oEI8=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-341-QnVTVrUkNTemEMpLHZAnQA-1; Tue, 17 Jan 2023 23:27:05 -0500
X-MC-Unique: QnVTVrUkNTemEMpLHZAnQA-1
Received: by mail-il1-f199.google.com with SMTP id
 c11-20020a056e020bcb00b0030be9d07d63so24156511ilu.0
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 20:27:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WwIVV2GdMWA9O7WvFo6puxVSK0p8BVpY4+LbrHl3vXw=;
 b=4rEmN6PZCNf7qDJoPZ9IF+2s9uf+Pjz5QbCwmA0ajnMeb2uBgNoz5hD7yMqpVy1VV+
 plh8IUbd8gGHcXaeQto/pqix5mXD7y9b7JAWqs7XoI2qhB1n4POTz/yt45ItRxHP19Ng
 VcsbdA3YFKKnCpa266oazV3LL6k5MnylMN/sCQSLFosFlZTOrqwI3YeanCG0558Y4fuv
 GztDLLV95SYXXGCceLv40FVDqv6SQBlLKQ1l85CvQ6oqYPn3SG3u+cEZlq+XyzJM2skJ
 0DNCugee1c8rj4mdnFP9oFi8xNWbAbTVU+YmU3S6N6fUKAsgSf5UDzEwB31A9M0abJo+
 MbbA==
X-Gm-Message-State: AFqh2kpN5CMbaFSkWmXFDvp6keXEWJBikK4c2vbF8mH4x+qpYf3XYQ8W
 q++Zmq9qwnNtvf62mx0K/dCch9GGk9PhsFnfODKGATf5TCoDc7a7cSAIpCIgp4WSGknXGnLg7Qy
 A2id4/WSRcJoZRuc=
X-Received: by 2002:a92:d5d2:0:b0:303:3163:cb0a with SMTP id
 d18-20020a92d5d2000000b003033163cb0amr5009495ilq.17.1674016024120; 
 Tue, 17 Jan 2023 20:27:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuN/9vLnwuT4teyQ30VRbVSmD5N3uTBIPLHpuDYCgF16ZXgBQKahZL0LE1OWApEgPX8NNEJcw==
X-Received: by 2002:a92:d5d2:0:b0:303:3163:cb0a with SMTP id
 d18-20020a92d5d2000000b003033163cb0amr5009468ilq.17.1674016023574; 
 Tue, 17 Jan 2023 20:27:03 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 u125-20020a022383000000b003a60488c1fcsm74998jau.118.2023.01.17.20.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 20:27:02 -0800 (PST)
Date: Tue, 17 Jan 2023 21:27:00 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: Igor Mammedov <imammedo@redhat.com>, Chuck Zmudzinski
 <brchuckz@netscape.net>, "Michael S. Tsirkin" <mst@redhat.com>, Bernhard
 Beschow <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230117212700.35b3af18.alex.williamson@redhat.com>
In-Reply-To: <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
 <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
 <20230110030331-mutt-send-email-mst@kernel.org>
 <a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
 <D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
 <9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
 <7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
 <20230112180314-mutt-send-email-mst@kernel.org>
 <128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
 <20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
 <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
 <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
 <fce262ea-e0d5-d670-787c-62d91b040739@netscape.net>
 <20230117120416.0aa041d6@imammedo.users.ipa.redhat.com>
 <b6f7d6dd-3b9b-2cc7-32ab-8521802e1fed@aol.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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

On Tue, 17 Jan 2023 19:15:57 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/17/2023 6:04 AM, Igor Mammedov wrote:
> > On Mon, 16 Jan 2023 13:00:53 -0500
> > Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> > =20
> > > On 1/16/23 10:33, Igor Mammedov wrote: =20
> > > > On Fri, 13 Jan 2023 16:31:26 -0500
> > > > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >    =20
> > > >> On 1/13/23 4:33=E2=80=AFAM, Igor Mammedov wrote:   =20
> > > >> > On Thu, 12 Jan 2023 23:14:26 -0500
> > > >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >> >      =20
> > > >> >> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote:     =20
> > > >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wr=
ote:       =20
> > > >> >> >> I think the change Michael suggests is very minimalistic: Mo=
ve the if
> > > >> >> >> condition around xen_igd_reserve_slot() into the function it=
self and
> > > >> >> >> always call it there unconditionally -- basically turning th=
ree lines
> > > >> >> >> into one. Since xen_igd_reserve_slot() seems very problem sp=
ecific,
> > > >> >> >> Michael further suggests to rename it to something more gene=
ral. All
> > > >> >> >> in all no big changes required.       =20
> > > >> >> >=20
> > > >> >> > yes, exactly.
> > > >> >> >        =20
> > > >> >>=20
> > > >> >> OK, got it. I can do that along with the other suggestions.    =
 =20
> > > >> >=20
> > > >> > have you considered instead of reservation, putting a slot check=
 in device model
> > > >> > and if it's intel igd being passed through, fail at realize time=
  if it can't take
> > > >> > required slot (with a error directing user to fix command line)?=
     =20
> > > >>=20
> > > >> Yes, but the core pci code currently already fails at realize time
> > > >> with a useful error message if the user tries to use slot 2 for the
> > > >> igd, because of the xen platform device which has slot 2. The user
> > > >> can fix this without patching qemu, but having the user fix it on
> > > >> the command line is not the best way to solve the problem, primari=
ly
> > > >> because the user would need to hotplug the xen platform device via=
 a
> > > >> command line option instead of having the xen platform device adde=
d by
> > > >> pc_xen_hvm_init functions almost immediately after creating the pci
> > > >> bus, and that delay in adding the xen platform device degrades
> > > >> startup performance of the guest.
> > > >>    =20
> > > >> > That could be less complicated than dealing with slot reservatio=
ns at the cost of
> > > >> > being less convenient.     =20
> > > >>=20
> > > >> And also a cost of reduced startup performance   =20
> > > >=20
> > > > Could you clarify how it affects performance (and how much).
> > > > (as I see, setup done at board_init time is roughly the same
> > > > as with '-device foo' CLI options, modulo time needed to parse
> > > > options which should be negligible. and both ways are done before
> > > > guest runs)   =20
> > >=20
> > > I preface my answer by saying there is a v9, but you don't
> > > need to look at that. I will answer all your questions here.
> > >=20
> > > I am going by what I observe on the main HDMI display with the
> > > different approaches. With the approach of not patching Qemu
> > > to fix this, which requires adding the Xen platform device a
> > > little later, the length of time it takes to fully load the
> > > guest is increased. I also noticed with Linux guests that use
> > > the grub bootoader, the grub vga driver cannot display the
> > > grub boot menu at the native resolution of the display, which
> > > in the tested case is 1920x1080, when the Xen platform device
> > > is added via a command line option instead of by the
> > > pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> > > to Qemu, the grub menu is displayed at the full, 1920x1080
> > > native resolution of the display. Once the guest fully loads,
> > > there is no noticeable difference in performance. It is mainly
> > > a degradation in startup performance, not performance once
> > > the guest OS is fully loaded. =20
> >
> > Looking at igd-assign.txt, it recommends to add IGD using '-device' CLI
> > option, and actually drop at least graphics defaults explicitly.
> > So it is expected to work fine even when IGD is constructed with
> > '-device'.
> >
> > Could you provide full CLI current xen starts QEMU with and then
> > a CLI you used (with explicit -device for IGD) that leads
> > to reduced performance?
> >
> > CCing vfio folks who might have an idea what could be wrong based
> > on vfio experience. =20
>=20
> Actually, the igd is not added with an explicit -device option using Xen:
>=20
> =C2=A0=C2=A0 1573 ?=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ssl=C2=A0=
=C2=A0=C2=A0 0:42 /usr/bin/qemu-system-i386 -xen-domid 1 -no-shutdown -char=
dev socket,id=3Dlibxl-cmd,path=3D/var/run/xen/qmp-libxl-1,server,nowait -mo=
n chardev=3Dlibxl-cmd,mode=3Dcontrol -chardev socket,id=3Dlibxenstat-cmd,pa=
th=3D/var/run/xen/qmp-libxenstat-1,server,nowait -mon chardev=3Dlibxenstat-=
cmd,mode=3Dcontrol -nodefaults -no-user-config -name windows -vnc none -dis=
play none -serial pty -boot order=3Dc -smp 4,maxcpus=3D4 -net none -machine=
 xenfv,max-ram-below-4g=3D3758096384,igd-passthru=3Don -m 6144 -drive file=
=3D/dev/loop0,if=3Dide,index=3D0,media=3Ddisk,format=3Draw,cache=3Dwritebac=
k -drive file=3D/dev/disk/by-uuid/A44AA4984AA468AE,if=3Dide,index=3D1,media=
=3Ddisk,format=3Draw,cache=3Dwriteback
>=20
> I think it is added by xl (libxl management tool) when the guest is creat=
ed
> using the qmp-libxl socket that appears on the command line, but I am not=
 100
> percent sure. So, with libxl, the command line alone does not tell the wh=
ole
> story. The xl.cfg file has a line like this to define the pci devices pas=
sed through,
> and in qemu they are type XEN_PT devices, not VFIO devices:
>=20
> pci =3D [ '00:1b.0','00:14.0','00:02.0@02' ]
>=20
> This means three host pci devices are passed through, the ones on the
> host at slot 1b.0, 14.0, and 02.0. Of course the device at 02 is the igd.
> The @02 means libxl is requesting slot 2 in the guest for the igd, the
> other 2 devices are just auto assigned a slot by Qemu. Qemu cannot
> assign the igd to slot 2 for xenfv machines without a patch that prevents
> the Xen platform device from grabbing slot 2. That is what this patch
> accomplishes. The workaround involves using the Qemu pc machine
> instead of the Qemu xenfv machine, in which case the code in Qemu
> that adds the Xen platform device at slot 2 is avoided, and in that case
> the Xen platform device is added via a command line option instead
> at slot 3 instead of slot 2.
>=20
> The differences between vfio and the Xen pci passthrough device
> might make a difference in Xen vs. kvm for igd-pasthru.
>=20
> Also, kvm does not use the Xen platform device, and it seems the
> Xen guests behave better at startup when the Xen platform device
> is added very early, during the initialization of the emulated devices
> of the machine, which is based on the i440fx piix3 machine, instead
> of being added using a command line option. Perhaps the performance
> at startup could be improved by adding the igd via a command line
> option using vfio instead of the canonical way that libxl does pci
> passthrough on Xen, but I have no idea if vfio works on Xen the way it
> works on kvm. I am willing to investigate and experiment with it, though.
>=20
> So if any vfio people can shed some light on this, that would help.

ISTR some rumors of Xen thinking about vfio, but AFAIK there is no
combination of vfio with Xen, nor is there any sharing of device quirks
to assign IGD.  IGD assignment has various VM platform dependencies, of
which the bus address is just one.  Vfio support for IGD assignment
takes a much different approach, the user or management tool is
responsible for configuring the VM correctly for IGD assignment,
including assigning the device to the correct bus address and using the
right VM chipset, with the correct slot free for the LPC controller.  If
all the user configuration of the VM aligns correctly, we'll activate
"legacy mode" by inserting the opregion and instantiate the LPC bridge
with the correct fields to make the BIOS and drivers happy.  Otherwise,
maybe the user is trying to use the mythical UPT mode, but given
Intel's lack of follow-through, it probably just won't work.  Or maybe
it's a vGPU and we don't need the legacy features anyway.

Working with an expectation that QEMU needs to do the heavy lifting to
make it all work automatically, with no support from the management
tool for putting devices in the right place, I'm afraid there might not
be much to leverage from the vfio vesion.  Thanks,

Alex


