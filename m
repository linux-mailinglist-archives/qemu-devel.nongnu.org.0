Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B556AF8B3
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 11:17:41 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7yks-0000D6-1U
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 05:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1i7yHJ-0006x2-RX
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1i7yHI-0003V1-9N
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:47:05 -0400
Received: from 16.mo7.mail-out.ovh.net ([46.105.72.216]:33221)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1i7yHI-0003Te-4F
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 04:47:04 -0400
Received: from player693.ha.ovh.net (unknown [10.109.159.159])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 84D34132209
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 10:47:00 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 1BD869A7FAE3;
 Wed, 11 Sep 2019 08:46:52 +0000 (UTC)
Date: Wed, 11 Sep 2019 10:46:50 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20190911104650.7c64009f@bahia.lan>
In-Reply-To: <20190911040452.8341-6-david@gibson.dropbear.id.au>
References: <20190911040452.8341-1-david@gibson.dropbear.id.au>
 <20190911040452.8341-6-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 13007521626308844006
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrtddvgddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.72.216
Subject: Re: [Qemu-devel] [PATCH 5/7] spapr: Do not put empty properties for
 -kernel/-initrd/-append
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
Cc: lvivier@redhat.com, aik@ozlabs.ru, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, clg@kaod.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Sep 2019 14:04:50 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> From: Alexey Kardashevskiy <aik@ozlabs.ru>
>=20
> We are going to use spapr_build_fdt() for the boot time FDT and as an
> update for SLOF during handling of H_CAS. SLOF will apply all properties
> from the QEMU's FDT which is usually ok unless there are properties
> changed by grub or guest kernel. The properties are:
> bootargs, linux,initrd-start, linux,initrd-end, linux,stdout-path,
> linux,rtas-base, linux,rtas-entry. Resetting those during CAS will most
> likely cause grub failure.
>=20

s/Resetting/Clearing ? They still get reset to the initial setup if "-kerne=
l"
and "-initrd" were passed, but it is okay since neither grub, nor the guest
kernel is supposed to change them in this case, correct ?

> This only creates such properties if we are booting with "-kernel" and
> "-initrd" so they won't get included into the DT update blob and

so they won't get included {if we're not booting with "-kernel" ...}

> therefore the guest is more likely to boot successfully.
>=20

Maybe rephrase like:

Don't create such properties if we're booting without "-kernel" and
"-initrd" ...

> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/ppc/spapr.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d072c2aa3d..d18744268f 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -1177,11 +1177,16 @@ static void spapr_dt_chosen(SpaprMachineState *sp=
apr, void *fdt)
> =20
>      _FDT(chosen =3D fdt_add_subnode(fdt, 0, "chosen"));
> =20
> -    _FDT(fdt_setprop_string(fdt, chosen, "bootargs", machine->kernel_cmd=
line));
> -    _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-start",
> -                          spapr->initrd_base));
> -    _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-end",
> -                          spapr->initrd_base + spapr->initrd_size));
> +    if (machine->kernel_cmdline && machine->kernel_cmdline[0]) {

machine->kernel_cmdline cannot be NULL.

=46rom vl.c:

    if (!kernel_cmdline) {
        kernel_cmdline =3D "";
        current_machine->kernel_cmdline =3D (char *)kernel_cmdline;
    }

Also this doesn't check if we're booting with -kernel but rather
that we're booting with -append ${some_not_empty_string}... what
about checking spapr->kernel_size, pretty much like you do for
the initrd ?

> +        _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
> +                                machine->kernel_cmdline));
> +    }
> +    if (spapr->initrd_size) {
> +        _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-start",
> +                              spapr->initrd_base));
> +        _FDT(fdt_setprop_cell(fdt, chosen, "linux,initrd-end",
> +                              spapr->initrd_base + spapr->initrd_size));
> +    }
> =20
>      if (spapr->kernel_size) {
>          uint64_t kprop[2] =3D { cpu_to_be64(KERNEL_LOAD_ADDR),


