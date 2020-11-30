Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF782C8C2C
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 19:09:02 +0100 (CET)
Received: from localhost ([::1]:58170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjnbg-0005VV-69
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 13:09:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kjnaI-0004at-Rb; Mon, 30 Nov 2020 13:07:34 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:44475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kjnaG-0008DV-LW; Mon, 30 Nov 2020 13:07:34 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id D4F3676C13EB;
 Mon, 30 Nov 2020 19:07:28 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 30 Nov
 2020 19:07:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001f253feee-2716-475c-a34e-fbb669246840,
 54E7F54749740F6D21A4FFD7F03B08EA4E155DE3) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 v2 2/3] spapr/xive: Fix size of END table and
 number of claimed IPIs
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20201130165258.744611-1-groug@kaod.org>
 <20201130165258.744611-3-groug@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <ffc2ef57-e90f-7f07-650e-d85be0746c49@kaod.org>
Date: Mon, 30 Nov 2020 19:07:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201130165258.744611-3-groug@kaod.org>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8d574b2a-74b8-4e06-b663-d8ae3258fd4c
X-Ovh-Tracer-Id: 3810045284821404640
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudeitddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefheenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeetieffgeelvdeiueelleeuieetieduheekhfefgeeuvedtuefhtdfhvddttdeftdenucffohhmrghinheplhgruhhntghhphgrugdrnhgvthenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/30/20 5:52 PM, Greg Kurz wrote:
> The sPAPR XIVE device has an internal ENDT table the size of
> which is configurable by the machine. This table is supposed
> to contain END structures for all possible vCPUs that may
> enter the guest. The machine must also claim IPIs for all
> possible vCPUs since this is expected by the guest.
> 
> spapr_irq_init() takes care of that under the assumption that
> spapr_max_vcpu_ids() returns the number of possible vCPUs.
> This happens to be the case when the VSMT mode is set to match
> the number of threads per core in the guest (default behavior).
> With non-default VSMT settings, this limit is > to the number
> of vCPUs. In the worst case, we can end up allocating an 8 times
> bigger ENDT and claiming 8 times more IPIs than needed. But more
> importantly, this creates a confusion between number of vCPUs and
> vCPU ids, which can lead to subtle bugs like [1].
> 
> Use smp.max_cpus instead of spapr_max_vcpu_ids() in
> spapr_irq_init() for the latest machine type. Older machine
> types continue to use spapr_max_vcpu_ids() since the size of
> the ENDT is migration visible.
> 
> [1] https://bugs.launchpad.net/qemu/+bug/1900241
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  include/hw/ppc/spapr.h |  1 +
>  hw/ppc/spapr.c         |  3 +++
>  hw/ppc/spapr_irq.c     | 16 +++++++++++++---
>  3 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index dc99d45e2852..95bf210d0bf6 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -139,6 +139,7 @@ struct SpaprMachineClass {
>      hwaddr rma_limit;          /* clamp the RMA to this size */
>      bool pre_5_1_assoc_refpoints;
>      bool pre_5_2_numa_associativity;
> +    bool pre_6_0_xive_max_cpus;
>  
>      bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
>                            uint64_t *buid, hwaddr *pio, 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index ab59bfe941d0..227a926dfd48 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4530,8 +4530,11 @@ DEFINE_SPAPR_MACHINE(6_0, "6.0", true);
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> +    SpaprMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
> +
>      spapr_machine_6_0_class_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    smc->pre_6_0_xive_max_cpus = true;
>  }
>  
>  DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index 552e30e93036..4d9ecd5d0af8 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -324,17 +324,27 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>      }
>  
>      if (spapr->irq->xive) {
> -        uint32_t max_vcpu_ids = spapr_max_vcpu_ids(spapr);
> +        uint32_t max_cpus = MACHINE(spapr)->smp.max_cpus;
>          DeviceState *dev;
>          int i;
>  
> +        /*
> +         * Older machine types used to size the ENDT and IPI range
> +         * according to the upper limit of vCPU ids, which can be
> +         * higher than smp.max_cpus with custom VSMT settings. Keep
> +         * the previous behavior for compatibility with such setups.
> +         */
> +        if (smc->pre_6_0_xive_max_cpus) {
> +            max_cpus = spapr_max_vcpu_ids(spapr);
> +        }
> +
>          dev = qdev_new(TYPE_SPAPR_XIVE);
>          qdev_prop_set_uint32(dev, "nr-irqs", smc->nr_xirqs + SPAPR_XIRQ_BASE);
>          /*
>           * 8 XIVE END structures per CPU. One for each available
>           * priority
>           */
> -        qdev_prop_set_uint32(dev, "nr-ends", max_vcpu_ids << 3);
> +        qdev_prop_set_uint32(dev, "nr-ends", max_cpus << 3);
>          object_property_set_link(OBJECT(dev), "xive-fabric", OBJECT(spapr),
>                                   &error_abort);
>          sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> @@ -342,7 +352,7 @@ void spapr_irq_init(SpaprMachineState *spapr, Error **errp)
>          spapr->xive = SPAPR_XIVE(dev);
>  
>          /* Enable the CPU IPIs */
> -        for (i = 0; i < max_vcpu_ids; ++i) {
> +        for (i = 0; i < max_cpus; ++i) {
>              SpaprInterruptControllerClass *sicc
>                  = SPAPR_INTC_GET_CLASS(spapr->xive);
>  
> 


