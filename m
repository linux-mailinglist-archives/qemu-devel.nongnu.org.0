Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940D10E645
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 08:08:25 +0100 (CET)
Received: from localhost ([::1]:59750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibfom-00057h-Gk
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 02:08:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ibfl0-0002HS-71
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 02:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ibfky-0000lq-7B
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 02:04:30 -0500
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:41542)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ibfkx-0000kV-VE
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 02:04:28 -0500
Received: from player728.ha.ovh.net (unknown [10.108.42.5])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 86F591B76FD
 for <qemu-devel@nongnu.org>; Mon,  2 Dec 2019 08:04:25 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player728.ha.ovh.net (Postfix) with ESMTPSA id 8583ECB02A25;
 Mon,  2 Dec 2019 07:04:17 +0000 (UTC)
Subject: Re: [for-5.0 2/4] spapr: Improve handling of fdt buffer size
To: David Gibson <david@gibson.dropbear.id.au>, groug@kaod.org
References: <20191129053356.232413-1-david@gibson.dropbear.id.au>
 <20191129053356.232413-3-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <246281b5-805f-b75d-b565-1c5b3793b2ac@kaod.org>
Date: Mon, 2 Dec 2019 08:04:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129053356.232413-3-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13220598184504232768
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedvkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgepge
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.52.147
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
Cc: lvivier@redhat.com, qemu-ppc@nongnu.org, mdroth@linux.vnet.ibm.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/11/2019 06:33, David Gibson wrote:
> Previously, spapr_build_fdt() constructed the device tree in a fixed
> buffer of size FDT_MAX_SIZE.  This is a bit inflexible, but more
> importantly it's awkward for the case where we use it during CAS.  In
> that case the guest firmware supplies a buffer and we have to
> awkwardly check that what we generated fits into it afterwards, after
> doing a lot of size checks during spapr_build_fdt().
> 
> Simplify this by having spapr_build_fdt() take a 'space' parameter.
> For the CAS case, we pass in the buffer size provided by SLOF, for the
> machine init case, we continue to pass FDT_MAX_SIZE.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Cedric Le Goater <clg@fr.ibm.com>


> ---
>  hw/ppc/spapr.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index d9c9a2bcee..d34e317f48 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -917,7 +917,8 @@ static bool spapr_hotplugged_dev_before_cas(void)
>      return false;
>  }
>  
> -static void *spapr_build_fdt(SpaprMachineState *spapr, bool reset);
> +static void *spapr_build_fdt(SpaprMachineState *spapr, bool reset,
> +                             size_t space);
>  
>  int spapr_h_cas_compose_response(SpaprMachineState *spapr,
>                                   target_ulong addr, target_ulong size,
> @@ -930,24 +931,17 @@ int spapr_h_cas_compose_response(SpaprMachineState *spapr,
>          return 1;
>      }
>  
> -    if (size < sizeof(hdr) || size > FW_MAX_SIZE) {
> -        error_report("SLOF provided an unexpected CAS buffer size "
> -                     TARGET_FMT_lu " (min: %zu, max: %u)",
> -                     size, sizeof(hdr), FW_MAX_SIZE);
> +    if (size < sizeof(hdr)) {
> +        error_report("SLOF provided insufficient CAS buffer "
> +                     TARGET_FMT_lu " (min: %zu)", size, sizeof(hdr));
>          exit(EXIT_FAILURE);
>      }
>  
>      size -= sizeof(hdr);
>  
> -    fdt = spapr_build_fdt(spapr, false);
> +    fdt = spapr_build_fdt(spapr, false, size);
>      _FDT((fdt_pack(fdt)));
>  
> -    if (fdt_totalsize(fdt) + sizeof(hdr) > size) {
> -        g_free(fdt);
> -        trace_spapr_cas_failed(size);
> -        return -1;
> -    }
> -
>      cpu_physical_memory_write(addr, &hdr, sizeof(hdr));
>      cpu_physical_memory_write(addr + sizeof(hdr), fdt, fdt_totalsize(fdt));
>      trace_spapr_cas_continue(fdt_totalsize(fdt) + sizeof(hdr));
> @@ -1197,7 +1191,8 @@ static void spapr_dt_hypervisor(SpaprMachineState *spapr, void *fdt)
>      }
>  }
>  
> -static void *spapr_build_fdt(SpaprMachineState *spapr, bool reset)
> +static void *spapr_build_fdt(SpaprMachineState *spapr, bool reset,
> +                             size_t space)
>  {
>      MachineState *machine = MACHINE(spapr);
>      MachineClass *mc = MACHINE_GET_CLASS(machine);
> @@ -1207,8 +1202,8 @@ static void *spapr_build_fdt(SpaprMachineState *spapr, bool reset)
>      SpaprPhbState *phb;
>      char *buf;
>  
> -    fdt = g_malloc0(FDT_MAX_SIZE);
> -    _FDT((fdt_create_empty_tree(fdt, FDT_MAX_SIZE)));
> +    fdt = g_malloc0(space);
> +    _FDT((fdt_create_empty_tree(fdt, space)));
>  
>      /* Root node */
>      _FDT(fdt_setprop_string(fdt, 0, "device_type", "chrp"));
> @@ -1723,19 +1718,13 @@ static void spapr_machine_reset(MachineState *machine)
>       */
>      fdt_addr = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
>  
> -    fdt = spapr_build_fdt(spapr, true);
> +    fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>  
>      rc = fdt_pack(fdt);
>  
>      /* Should only fail if we've built a corrupted tree */
>      assert(rc == 0);
>  
> -    if (fdt_totalsize(fdt) > FDT_MAX_SIZE) {
> -        error_report("FDT too big ! 0x%x bytes (max is 0x%x)",
> -                     fdt_totalsize(fdt), FDT_MAX_SIZE);
> -        exit(1);
> -    }
> -
>      /* Load the fdt */
>      qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
>      cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
> 


