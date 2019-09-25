Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A21BDA53
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 10:58:27 +0200 (CEST)
Received: from localhost ([::1]:47278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD37z-0001Vu-01
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 04:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iD36B-0000Y4-DT
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 04:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iD36A-0002vS-8R
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 04:56:35 -0400
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:35740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iD36A-0002v4-0d
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 04:56:34 -0400
Received: from player699.ha.ovh.net (unknown [10.108.54.217])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 4FCDA1E2C83
 for <qemu-devel@nongnu.org>; Wed, 25 Sep 2019 10:56:32 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 98887A31FFE9;
 Wed, 25 Sep 2019 08:56:20 +0000 (UTC)
Date: Wed, 25 Sep 2019 10:56:19 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 07/20] spapr: Fold spapr_phb_lsi_qirq() into its single
 caller
Message-ID: <20190925105619.6c2a29a7@bahia.lan>
In-Reply-To: <20190925064534.19155-8-david@gibson.dropbear.id.au>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-8-david@gibson.dropbear.id.au>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3152238266982373862
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.59.196
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
Cc: Jason Wang <jasowang@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 clg@kaod.org,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Sep 2019 16:45:21 +1000
David Gibson <david@gibson.dropbear.id.au> wrote:

> No point having a two-line helper that's used exactly once, and not likely
> to be used anywhere else in future.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_pci.c          | 3 ++-
>  include/hw/pci-host/spapr.h | 7 -------
>  2 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 7b71ad7c74..6934d506a7 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -721,9 +721,10 @@ static void pci_spapr_set_irq(void *opaque, int irq_num, int level)
>       * corresponding qemu_irq.
>       */
>      SpaprPhbState *phb = opaque;
> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>  
>      trace_spapr_pci_lsi_set(phb->dtbusname, irq_num, phb->lsi_table[irq_num].irq);
> -    qemu_set_irq(spapr_phb_lsi_qirq(phb, irq_num), level);
> +    qemu_set_irq(spapr_qirq(spapr, phb->lsi_table[irq_num].irq), level);
>  }
>  
>  static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
> diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
> index abd87605b2..23506f05d9 100644
> --- a/include/hw/pci-host/spapr.h
> +++ b/include/hw/pci-host/spapr.h
> @@ -128,13 +128,6 @@ struct SpaprPhbState {
>  #define SPAPR_PCI_NV2ATSD_WIN_SIZE   (NVGPU_MAX_NUM * NVGPU_MAX_LINKS * \
>                                        64 * KiB)
>  
> -static inline qemu_irq spapr_phb_lsi_qirq(struct SpaprPhbState *phb, int pin)
> -{
> -    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
> -
> -    return spapr_qirq(spapr, phb->lsi_table[pin].irq);
> -}
> -
>  int spapr_dt_phb(SpaprPhbState *phb, uint32_t intc_phandle, void *fdt,
>                   uint32_t nr_msis, int *node_offset);
>  


