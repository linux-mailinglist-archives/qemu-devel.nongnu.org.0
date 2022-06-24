Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ACA5599C0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 14:42:21 +0200 (CEST)
Received: from localhost ([::1]:52802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4idf-0002wh-9Y
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 08:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4iav-0001D4-6y; Fri, 24 Jun 2022 08:39:29 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1o4iar-0001yb-MJ; Fri, 24 Jun 2022 08:39:28 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LTxRB50T4z67Kvx;
 Fri, 24 Jun 2022 20:35:18 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 24 Jun 2022 14:39:13 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 13:39:12 +0100
Date: Fri, 24 Jun 2022 13:39:09 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
 <linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
 <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
Message-ID: <20220624133909.00005f6e@Huawei.com>
In-Reply-To: <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
 <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>

On Fri, 24 Jun 2022 11:48:47 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Code based on i386/pc enablement.
> > The memory layout places space for 16 host bridge register regions after
> > the GIC_REDIST2 in the extended memmap.
> > The CFMWs are placed above the extended memmap.
> >
> > Only create the CEDT table if cxl=3Don set for the machine.
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com> =20

Hi Peter,

Thanks for the review,

>=20
> This seems to be missing code to advertise the new devices in the
> device tree.

Intentionally. I am not aware of any current interest
in defining DT support CXL or supporting it in operating systems.
Easy enough to add if anyone does the leg work to figure out the
bindings, but that needs to come from someone who cares and
would need to be driven by OS support and a usecase. The ACPI
stuff here is defined as part of the main CXL spec because the
target class of machines simply doesn't generally use DT.

>=20
> Somebody else had better review the ACPI changes :-)
>=20
> >  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
> > @@ -178,6 +181,7 @@ static const MemMapEntry base_memmap[] =3D {
> >  static MemMapEntry extended_memmap[] =3D {
> >      /* Additional 64 MB redist region (can contain up to 512 redistrib=
utors) */
> >      [VIRT_HIGH_GIC_REDIST2] =3D   { 0x0, 64 * MiB },
> > +    [VIRT_CXL_HOST] =3D           { 0x0, 64 * KiB * 16 }, /* 16 UID */=
 =20
>=20
> Does this reshuffle the memory layout so that all the stuff after it
> moves up ? If so, that's an incompatible change and would need
> versioning somehow.

I slotted it into a hole in the existing memory map so unless I
have a bug, it shouldn't move any pre existing memory windows.
The comment just above extended_mmap states that the floating area
starts at 256GiB and the entries after that will be naturally aligned.

Hence existing map will be
256GiB Start of redist2
256GiB + 64MiB Start of gap -  we slot in a 16 * 64KiB region at start of t=
his gap.
256GiB + 256MiB Start of PCIE_ECAM
256GiB + 512MiB Start of gap 2
512GiB Start of PCIE_MMIO

>=20
> More generally, should this new addition to the machine be
> versioned? What did we do for the pc machine types?

So far not versioned and concern wasn't raised. I didn't think it was an
issue because there should be no effect on older machines where cxl=3Don
can't be set. Given the user has to explicitly request more hardware
for anything to change, I don't see a need for versioning (yet).

Not sure it's relevant but note the emulation here is not suitable for
anything other than testing code against (it's very slow and provides
nothing you'd actually want in a VM) so migrating a VM with this support
seems unlikely to ever happen.

>=20
> >      [VIRT_HIGH_PCIE_ECAM] =3D     { 0x0, 256 * MiB },
> >      /* Second PCIe window */
> >      [VIRT_HIGH_PCIE_MMIO] =3D     { 0x0, 512 * GiB },
> > @@ -1525,6 +1529,16 @@ static void create_pcie(VirtMachineState *vms)
> >      }
> >  }
> >
> > +static void create_cxl_host_reg_region(VirtMachineState *vms)
> > +{
> > +    MemoryRegion *sysmem =3D get_system_memory();
> > +    MemoryRegion *mr =3D &vms->cxl_devices_state.host_mr;
> > +
> > +    memory_region_init(mr, OBJECT(vms), "cxl_host_reg",
> > +                       vms->memmap[VIRT_CXL_HOST].size);
> > +    memory_region_add_subregion(sysmem, vms->memmap[VIRT_CXL_HOST].bas=
e, mr);
> > +} =20
>=20
> > @@ -1779,6 +1799,20 @@ static void virt_set_memmap(VirtMachineState *vm=
s, int pa_bits)
> >          memory_region_init(&ms->device_memory->mr, OBJECT(vms),
> >                             "device-memory", device_memory_size);
> >      }
> > +
> > +    if (vms->cxl_devices_state.fixed_windows) {
> > +        GList *it;
> > +
> > +        base =3D ROUND_UP(base, 256 * MiB);
> > +        for (it =3D vms->cxl_devices_state.fixed_windows; it; it =3D i=
t->next) {
> > +            CXLFixedWindow *fw =3D it->data;
> > +
> > +            fw->base =3D base;
> > +            memory_region_init_io(&fw->mr, OBJECT(vms), &cfmws_ops, fw,
> > +                                  "cxl-fixed-memory-region", fw->size)=
; =20
>=20
> Why is board model code having to init memory regions for this
> device? Shouldn't the device be creating the memory regions itself
> and then exposing them for the board code to map them ?

=46rom a device point of view CFMWs are weird. They are is a region of Host PA
space that has fixed routing to devices (CXL host bridges). On a real system
they are a characteristic of the interconnect routing and if programmable it
is done well before any standard software (so might as well be hard coded).
Making them a device would be a little bit like saying the base_memmap shou=
ld be
a device - all they are doing is saying this address here should route to t=
his
particular device. The flexibility here is to allow testing of different se=
tups
without having to know the actual PA range which is safe to use.

They are very like the device memory or secure memory initialization.
The ops are there to do the interleave decoding. Interleave decoding
can't sensibly use a tree of memory windows because there would need to
be an infeasible number of them hence the memops work out the routing at
access time. If we ever optimize/specialize the non interleaved direct
connected CXL device case, or implement more general memory interleaving
support, it will just be a memory_region_init_ram() call like any other ram.

This went through various approaches but in the end the sequence of what we
need to set up for CXL fixed memory windows made representing them as a dev=
ice
hard so we didn't. Perhaps it could be done, but the device part would
be very slim and we'd have a bunch of code having to search for the devices
to stitch together all the information the need once it's available as
the rest of the system is built (e.g. after the host bridges are created).

>=20
> > +            base +=3D fw->size;
> > +        }
> > +    }
> >  }
> >
> >  /*
> > @@ -2215,6 +2249,14 @@ static void machvirt_init(MachineState *machine)
> >          memory_region_add_subregion(sysmem, machine->device_memory->ba=
se,
> >                                      &machine->device_memory->mr);
> >      }
> > +    if (vms->cxl_devices_state.fixed_windows) {
> > +        GList *it;
> > +        for (it =3D vms->cxl_devices_state.fixed_windows; it; it =3D i=
t->next) {
> > +            CXLFixedWindow *fw =3D it->data;
> > +
> > +            memory_region_add_subregion(sysmem, fw->base, &fw->mr);
> > +        }
> > +    }
> >
> >      virt_flash_fdt(vms, sysmem, secure_sysmem ?: sysmem);
> >
> > @@ -2241,6 +2283,7 @@ static void machvirt_init(MachineState *machine)
> >      create_rtc(vms);
> >
> >      create_pcie(vms);
> > +    create_cxl_host_reg_region(vms);
> >
> >      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(=
vms)) {
> >          vms->acpi_dev =3D create_acpi_ged(vms);
> > @@ -3070,6 +3113,7 @@ static void virt_instance_init(Object *obj)
> >
> >      vms->oem_id =3D g_strndup(ACPI_BUILD_APPNAME6, 6);
> >      vms->oem_table_id =3D g_strndup(ACPI_BUILD_APPNAME8, 8);
> > +    cxl_machine_init(obj, &vms->cxl_devices_state);
> >  }
> >
> >  static const TypeInfo virt_machine_info =3D {
> > diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> > index 15feabac63..403c9107e5 100644
> > --- a/include/hw/arm/virt.h
> > +++ b/include/hw/arm/virt.h
> > @@ -35,6 +35,7 @@
> >  #include "hw/boards.h"
> >  #include "hw/arm/boot.h"
> >  #include "hw/block/flash.h"
> > +#include "hw/cxl/cxl.h"
> >  #include "sysemu/kvm.h"
> >  #include "hw/intc/arm_gicv3_common.h"
> >  #include "qom/object.h"
> > @@ -92,6 +93,7 @@ enum {
> >  /* indices of IO regions located after the RAM */
> >  enum {
> >      VIRT_HIGH_GIC_REDIST2 =3D  VIRT_LOWMEMMAP_LAST,
> > +    VIRT_CXL_HOST,
> >      VIRT_HIGH_PCIE_ECAM,
> >      VIRT_HIGH_PCIE_MMIO,
> >  };
> > @@ -176,6 +178,7 @@ struct VirtMachineState {
> >      PCIBus *bus;
> >      char *oem_id;
> >      char *oem_table_id;
> > +    CXLState cxl_devices_state;
> >  }; =20
>=20
> I just looked at the CXLState struct. Why isn't this a device object ?

It can't be a pluggable device (e.g. added by -device ...)
because we need to know about it early enough to set up the underlying
PA regions (I tried that a long time back, and couldn't find a way to
make it work).

Possibly we could have machine parameters as today to specify
everything necessary to create a set of fixed memory window associated
devices. I'm not sure what the benefit would be however. When I originally
look at this it seemed much closer to NumaState, NVDimmstate etc and
that's what it was modeled on (those are in MachineState but Paolo asked
we move CXLState down into the machine specific state structures because it
wasn't relevant to the majority of boards).

I guess the simple answer to this is that as it's not a 'device' in the
sense we would normally expect to be called device on a physical system
it never occurred to me to consider making it one.  If there are
benefits to doing so (and we can avoid breaking x86 support, then sure
I can look at doing so).

struct CXLState {
	/*
	 * Used to gate creation of ACPI tables etc. You could use presence
	 * or absence of a device but boolean seems much simpler and similar
	 * too all the bools in Virt MachineState.
	 */
	bool is_enabled;=20
=09
	/*
	 * At time of PA init we don't know what device are present
	 * so need a trivial allocator that can be used later to
	 * poke the addresses at the devices that have been created
	 * via -device=20
	 * Could make it a device, but seems overkill and would complicate
	 * the acpi table building by making us do multiple levels of
	 * address decoding to get to the actual PA of unrelated devices.
	 * This could be avoided if we hard coded the PXBs in the machine
	 * file, but that's a non starter because of how they work today.
	 */
	MemoryRegion host_mr;
   	MemoryRegion next_mr_index;

	/* State for the parameter parser of machine parameters.
	 * CXLState was in MachineState where there are lots of
	 * similar items (NumaState etc) but Paolo asked we move it into
	 * the state of individual machines that we have added
	 * CXL support to.
	 * The split of PA map building and setup of devices means
	 * we need to read this multiple times.
	 */
	GList *fixed_windows;
	CXLFixedMemoryWindowOptionsList *cfmw_list;
};

I just noticed we have a left over cfmw_list in MachineState that
should have gone in the rework set that moved this stuff into the
individual board states.  I'll send a patch to clear that stray
pointer out separately.

Thanks,

Jonathan
>=20
> thanks
> -- PMM


