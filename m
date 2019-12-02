Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F310E643
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Dec 2019 08:07:43 +0100 (CET)
Received: from localhost ([::1]:59748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ibfo6-0003lU-BD
	for lists+qemu-devel@lfdr.de; Mon, 02 Dec 2019 02:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1ibfkk-00029R-2G
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 02:04:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1ibfki-0000Xs-Fv
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 02:04:13 -0500
Received: from 19.mo5.mail-out.ovh.net ([46.105.35.78]:38930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1ibfki-0000R1-6W
 for qemu-devel@nongnu.org; Mon, 02 Dec 2019 02:04:12 -0500
Received: from player697.ha.ovh.net (unknown [10.108.16.63])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id F340A25CC13
 for <qemu-devel@nongnu.org>; Mon,  2 Dec 2019 08:04:02 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id DFC23CC8B98F;
 Mon,  2 Dec 2019 07:03:53 +0000 (UTC)
Subject: Re: [for-5.0 1/4] spapr: Don't trigger a CAS reboot for XICS/XIVE
 mode changeover
To: David Gibson <david@gibson.dropbear.id.au>, groug@kaod.org
References: <20191129053356.232413-1-david@gibson.dropbear.id.au>
 <20191129053356.232413-2-david@gibson.dropbear.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5a1c5f4a-c4b9-1673-6378-778fc9ab92e7@kaod.org>
Date: Mon, 2 Dec 2019 08:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191129053356.232413-2-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13214124257490733888
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudejgedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.35.78
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
> PAPR allows the interrupt controller used on a POWER9 machine (XICS or
> XIVE) to be selected by the guest operating system, by using the
> ibm,client-architecture-support (CAS) feature negotiation call.
> 
> Currently, if the guest selects an interrupt controller different from the
> one selected at initial boot, this causes the system to be reset with the
> new model and the boot starts again.  This means we run through the SLOF
> boot process twice, as well as any other bootloader (e.g. grub) in use
> before the OS calls CAS.  This can be confusing and/or inconvenient for
> users.
> 
> Thanks to two fairly recent changes, we no longer need this reboot.  1) we
> now completely regenerate the device tree when CAS is called (meaning we
> don't need special case updates for all the device tree changes caused by
> the interrupt controller mode change),  2) we now have explicit code paths
> to activate and deactivate the different interrupt controllers, rather than
> just implicitly calling those at machine reset time.
> 
> We can therefore eliminate the reboot for changing irq mode, simply by
> putting a called to spapr_irq_update_active_intc() before we call
> spapr_h_cas_compose_response() (which gives the updated device tree to the
> guest firmware and OS).
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>


Reviewed-by: Cedric Le Goater <clg@fr.ibm.com>

> ---
>  hw/ppc/spapr_hcall.c | 33 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 140f05c1c6..05a7ca275b 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -1767,21 +1767,10 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>      }
>      spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
>      spapr_ovec_cleanup(ov1_guest);
> -    if (!spapr->cas_reboot) {
> -        /* If spapr_machine_reset() did not set up a HPT but one is necessary
> -         * (because the guest isn't going to use radix) then set it up here. */
> -        if ((spapr->patb_entry & PATE1_GR) && !guest_radix) {
> -            /* legacy hash or new hash: */
> -            spapr_setup_hpt_and_vrma(spapr);
> -        }
> -        spapr->cas_reboot =
> -            (spapr_h_cas_compose_response(spapr, args[1], args[2],
> -                                          ov5_updates) != 0);
> -    }
>  
>      /*
> -     * Ensure the guest asks for an interrupt mode we support; otherwise
> -     * terminate the boot.
> +     * Ensure the guest asks for an interrupt mode we support;
> +     * otherwise terminate the boot.
>       */
>      if (guest_xive) {
>          if (!spapr->irq->xive) {
> @@ -1797,14 +1786,18 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>          }
>      }
>  
> -    /*
> -     * Generate a machine reset when we have an update of the
> -     * interrupt mode. Only required when the machine supports both
> -     * modes.
> -     */
> +    spapr_irq_update_active_intc(spapr);
> +
>      if (!spapr->cas_reboot) {
> -        spapr->cas_reboot = spapr_ovec_test(ov5_updates, OV5_XIVE_EXPLOIT)
> -            && spapr->irq->xics && spapr->irq->xive;
> +        /* If spapr_machine_reset() did not set up a HPT but one is necessary
> +         * (because the guest isn't going to use radix) then set it up here. */
> +        if ((spapr->patb_entry & PATE1_GR) && !guest_radix) {
> +            /* legacy hash or new hash: */
> +            spapr_setup_hpt_and_vrma(spapr);
> +        }
> +        spapr->cas_reboot =
> +            (spapr_h_cas_compose_response(spapr, args[1], args[2],
> +                                          ov5_updates) != 0);
>      }
>  
>      spapr_ovec_cleanup(ov5_updates);
> 


