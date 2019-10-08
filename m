Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2FCFBAF
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 15:56:57 +0200 (CEST)
Received: from localhost ([::1]:55982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHpyy-0003LH-WC
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 09:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iHpxe-0002bK-S3
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:55:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iHpxd-0004AK-JA
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 09:55:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iHpxd-00049k-BF; Tue, 08 Oct 2019 09:55:33 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 70EABA2668E;
 Tue,  8 Oct 2019 13:55:32 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0C76012C;
 Tue,  8 Oct 2019 13:55:25 +0000 (UTC)
Date: Tue, 8 Oct 2019 15:55:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] sparc64: use memory_region_allocate_system_memory()
 only for '-m' specified RAM
Message-ID: <20191008155524.09ee0eb6@redhat.com>
In-Reply-To: <d1d15a4c-a8a3-2bd3-3421-088dd8fc8d2d@redhat.com>
References: <20191008113318.7012-1-imammedo@redhat.com>
 <20191008113318.7012-2-imammedo@redhat.com>
 <d1d15a4c-a8a3-2bd3-3421-088dd8fc8d2d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Tue, 08 Oct 2019 13:55:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Peter Maydell <peter.maydell@linaro.org>, deller@gmx.de,
 mark.cave-ayland@ilande.co.uk, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 hpoussin@reactos.org, rth@twiddle.net, atar4qemu@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Oct 2019 14:09:28 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 10/8/19 1:33 PM, Igor Mammedov wrote:
> > memory_region_allocate_system_memory() was designed to be called for
> > allocating inital RAM. Using it mutiple times within one board is not
> > supported and could fail if -mem-path with non hugepage path is used.
> >=20
> > Keep using memory_region_allocate_system_memory() only for initial
> > RAM and use memory_region_init_ram() for the rest fixed size regions.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >   hw/sparc64/niagara.c | 25 +++++++++++++------------
> >   1 file changed, 13 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> > index 167143bffe..5987693659 100644
> > --- a/hw/sparc64/niagara.c
> > +++ b/hw/sparc64/niagara.c
> > @@ -36,6 +36,7 @@
> >   #include "qemu/error-report.h"
> >   #include "sysemu/qtest.h"
> >   #include "sysemu/sysemu.h"
> > +#include "qapi/error.h"
> >  =20
> >   typedef struct NiagaraBoardState {
> >       MemoryRegion hv_ram;
> > @@ -106,8 +107,8 @@ static void niagara_init(MachineState *machine)
> >       /* init CPUs */
> >       sparc64_cpu_devinit(machine->cpu_type, NIAGARA_PROM_BASE);
> >       /* set up devices */
> > -    memory_region_allocate_system_memory(&s->hv_ram, NULL, "sun4v-hv.r=
am",
> > -                                         NIAGARA_HV_RAM_SIZE);
> > +    memory_region_init_ram(&s->hv_ram, NULL, "sun4v-hv.ram",
> > +                           NIAGARA_HV_RAM_SIZE, &error_fatal);
> >       memory_region_add_subregion(sysmem, NIAGARA_HV_RAM_BASE, &s->hv_r=
am);
> >  =20
> >       memory_region_allocate_system_memory(&s->partition_ram, NULL, =20
>=20
> Did we have an issue calling memory_region_allocate_system_memory()=20
> *after* memory_region_init_ram() by the past?

I don't recall any, memory_region_init_ram() is essentially the same
as memory_region_allocate_system_memory() for most of emulated machines
(i.e. non-numa, no mem-path cases)

> Maybe not, or it is fixed, and your patch is fine:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Thanks!

>=20
> > @@ -116,17 +117,17 @@ static void niagara_init(MachineState *machine)
> >       memory_region_add_subregion(sysmem, NIAGARA_PARTITION_RAM_BASE,
> >                                   &s->partition_ram);
> >  =20
> > -    memory_region_allocate_system_memory(&s->nvram, NULL,
> > -                                         "sun4v.nvram", NIAGARA_NVRAM_=
SIZE);
> > +    memory_region_init_ram(&s->nvram, NULL, "sun4v.nvram", NIAGARA_NVR=
AM_SIZE,
> > +                           &error_fatal);
> >       memory_region_add_subregion(sysmem, NIAGARA_NVRAM_BASE, &s->nvram=
);
> > -    memory_region_allocate_system_memory(&s->md_rom, NULL,
> > -                                         "sun4v-md.rom", NIAGARA_MD_RO=
M_SIZE);
> > +    memory_region_init_ram(&s->md_rom, NULL, "sun4v-md.rom",
> > +                           NIAGARA_MD_ROM_SIZE, &error_fatal);
> >       memory_region_add_subregion(sysmem, NIAGARA_MD_ROM_BASE, &s->md_r=
om);
> > -    memory_region_allocate_system_memory(&s->hv_rom, NULL,
> > -                                         "sun4v-hv.rom", NIAGARA_HV_RO=
M_SIZE);
> > +    memory_region_init_ram(&s->hv_rom, NULL, "sun4v-hv.rom",
> > +                           NIAGARA_HV_ROM_SIZE, &error_fatal);
> >       memory_region_add_subregion(sysmem, NIAGARA_HV_ROM_BASE, &s->hv_r=
om);
> > -    memory_region_allocate_system_memory(&s->prom, NULL,
> > -                                         "sun4v.prom", PROM_SIZE_MAX);
> > +    memory_region_init_ram(&s->prom, NULL, "sun4v.prom", PROM_SIZE_MAX,
> > +                           &error_fatal);
> >       memory_region_add_subregion(sysmem, NIAGARA_PROM_BASE, &s->prom);
> >  =20
> >       add_rom_or_fail("nvram1", NIAGARA_NVRAM_BASE);
> > @@ -143,8 +144,8 @@ static void niagara_init(MachineState *machine)
> >           BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
> >           int size =3D blk_getlength(blk);
> >           if (size > 0) {
> > -            memory_region_allocate_system_memory(&s->vdisk_ram, NULL,
> > -                                                 "sun4v_vdisk.ram", si=
ze);
> > +            memory_region_init_ram(&s->vdisk_ram, NULL, "sun4v_vdisk.r=
am", size,
> > +                                   &error_fatal);
> >               memory_region_add_subregion(get_system_memory(),
> >                                           NIAGARA_VDISK_BASE, &s->vdisk=
_ram);
> >               dinfo->is_default =3D 1;
> >  =20
>=20


