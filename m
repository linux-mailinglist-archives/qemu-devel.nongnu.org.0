Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F3BEC50
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Sep 2019 09:07:34 +0200 (CEST)
Received: from localhost ([::1]:59860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iDNsD-0002G4-LS
	for lists+qemu-devel@lfdr.de; Thu, 26 Sep 2019 03:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iDNqx-0001dH-R4
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:06:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iDNqw-00030p-Hz
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:06:15 -0400
Received: from 2.mo2.mail-out.ovh.net ([188.165.53.149]:47737)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iDNqw-0002y4-8h
 for qemu-devel@nongnu.org; Thu, 26 Sep 2019 03:06:14 -0400
Received: from player714.ha.ovh.net (unknown [10.108.35.119])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 32A521ADCBF
 for <qemu-devel@nongnu.org>; Thu, 26 Sep 2019 09:06:10 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id B129DA2E4BC9;
 Thu, 26 Sep 2019 07:05:57 +0000 (UTC)
Subject: Re: [PATCH 20/20] spapr: Eliminate SpaprIrq::init hook
To: David Gibson <david@gibson.dropbear.id.au>
References: <20190925064534.19155-1-david@gibson.dropbear.id.au>
 <20190925064534.19155-21-david@gibson.dropbear.id.au>
 <1b74c0fc-b318-df5a-d66d-fe59ae562d70@kaod.org>
 <20190926011336.GS17405@umbus>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <92ce15dd-f7f9-3d2b-4226-9693bd9cfd65@kaod.org>
Date: Thu, 26 Sep 2019 09:05:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190926011336.GS17405@umbus>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7161004883741346776
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 188.165.53.149
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
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@redhat.com,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>>> +    if (spapr->irq->xive) {
>>> +        uint32_t nr_servers = spapr_max_server_number(spapr);
>>> +        DeviceState *dev;
>>> +        int i;
>>> +
>>> +        dev = qdev_create(NULL, TYPE_SPAPR_XIVE);
>>> +        qdev_prop_set_uint32(dev, "nr-irqs",
>>> +                             spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE);
>>> +        /*
>>> +         * 8 XIVE END structures per CPU. One for each available
>>> +         * priority
>>> +         */
>>> +        qdev_prop_set_uint32(dev, "nr-ends", nr_servers << 3);
>>> +        qdev_init_nofail(dev);
>>> +
>>> +        spapr->xive = SPAPR_XIVE(dev);
>>> +
>>> +        /* Enable the CPU IPIs */
>>> +        for (i = 0; i < nr_servers; ++i) {
>>> +            Error *local_err = NULL;
>>> +
>>> +            spapr_xive_irq_claim(spapr->xive, SPAPR_IRQ_IPI + i, false, &local_err);
>>> +            if (local_err) {
>>> +                goto out;
>>> +            }
>>> +        }
>>
>> We could move the IPI claim part in the realize routine of SPAPR_XIVE.
> 
> Yeah, I know.  I thought about this, but there's a slight complication
> in that the XIVE part doesn't know nr_servers directly.  There's
> several possible ways to handle that, but I wasn't 100% happy with any
> that I came up with yet.

The "nr-ends" property was inappropriate, "nr-servers" would have been
better and we would have hidden the calculation of ENDs 'nr_servers << 3'
in the realize routine of SpaprXive. 

I don't think we can change that without breaking migration though :/

C.

>>
>>> +        spapr_xive_hcall_init(spapr);
>>
>> This also.
> 
> Right.
> 
>> It can be done later one.
> 
> That's my intention.
> 
>>
>> C.
>>
>>> +    }
>>>  
>>>      spapr->qirqs = qemu_allocate_irqs(spapr->irq->set_irq, spapr,
>>>                                        spapr->irq->nr_xirqs + SPAPR_XIRQ_BASE);
>>> +
>>> +out:
>>> +    error_propagate(errp, local_err);
>>>  }
>>>  
>>>  void spapr_irq_claim(SpaprMachineState *spapr, int irq, bool lsi, Error **errp)
>>> @@ -757,7 +744,6 @@ SpaprIrq spapr_irq_xics_legacy = {
>>>      .xics        = true,
>>>      .xive        = false,
>>>  
>>> -    .init        = spapr_irq_init_xics,
>>>      .claim       = spapr_irq_claim_xics,
>>>      .free        = spapr_irq_free_xics,
>>>      .print_info  = spapr_irq_print_info_xics,
>>> diff --git a/include/hw/ppc/spapr_irq.h b/include/hw/ppc/spapr_irq.h
>>> index 6816cb0500..fa862c665b 100644
>>> --- a/include/hw/ppc/spapr_irq.h
>>> +++ b/include/hw/ppc/spapr_irq.h
>>> @@ -42,7 +42,6 @@ typedef struct SpaprIrq {
>>>      bool        xics;
>>>      bool        xive;
>>>  
>>> -    void (*init)(SpaprMachineState *spapr, Error **errp);
>>>      void (*claim)(SpaprMachineState *spapr, int irq, bool lsi, Error **errp);
>>>      void (*free)(SpaprMachineState *spapr, int irq);
>>>      void (*print_info)(SpaprMachineState *spapr, Monitor *mon);
>>> diff --git a/include/hw/ppc/xics_spapr.h b/include/hw/ppc/xics_spapr.h
>>> index 691a6d00f7..267984a97b 100644
>>> --- a/include/hw/ppc/xics_spapr.h
>>> +++ b/include/hw/ppc/xics_spapr.h
>>> @@ -34,6 +34,7 @@
>>>  #define TYPE_ICS_SPAPR "ics-spapr"
>>>  #define ICS_SPAPR(obj) OBJECT_CHECK(ICSState, (obj), TYPE_ICS_SPAPR)
>>>  
>>> +void ics_spapr_create(SpaprMachineState *spapr, int nr_xirqs, Error **errp);
>>>  void spapr_dt_xics(SpaprMachineState *spapr, uint32_t nr_servers, void *fdt,
>>>                     uint32_t phandle);
>>>  int xics_kvm_connect(SpaprMachineState *spapr, Error **errp);
>>>
>>
> 


