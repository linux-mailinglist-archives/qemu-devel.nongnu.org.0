Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4D5097D2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:42:46 +0200 (CEST)
Received: from localhost ([::1]:38976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQWY-0007Bz-7E
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQQ2-000435-Hg
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:36:05 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:46423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nhQPz-0007l7-5x
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:35:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.59])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id BD52220B36;
 Thu, 21 Apr 2022 06:35:51 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 21 Apr
 2022 08:35:50 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c8684a1e-f7ed-485a-bf5a-9a3e8eda5317,
 FFC778467988C6DD564F10F4CBD504D71298CE84) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3e188eb4-40dd-952c-9764-4cc8cb255f01@kaod.org>
Date: Thu, 21 Apr 2022 08:35:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: XIVE VFIO kernel resample failure in INTx mode under heavy load
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Alex Williamson
 <alex.williamson@redhat.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
References: <1891893257.448156.1647023745384.JavaMail.zimbra@raptorengineeringinc.com>
 <20220314160952.46d5313a.alex.williamson@redhat.com>
 <9638ec8f-2edf-97df-0c14-95ae2344dc70@kaod.org>
 <6f0a92ca-9f53-b8b8-e85d-43f4da36200d@kaod.org>
 <edfa8ca4-8e8a-335a-2e7e-c69661ec73da@ozlabs.ru>
 <560c8c1a-a87e-71f9-cfea-0a034933070b@ozlabs.ru>
 <e25296b3-b1ec-a90a-ee72-ed15fe5130f6@kaod.org>
 <5308af13-a943-efeb-d819-e39cfc2f2907@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <5308af13-a943-efeb-d819-e39cfc2f2907@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c6b0390a-b55a-417b-9d2e-8a24ed20ed7b
X-Ovh-Tracer-Id: 18106440830489758572
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrtddugdduudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/21/22 05:07, Alexey Kardashevskiy wrote:
> 
> 
> On 14/04/2022 22:41, Cédric Le Goater wrote:
>>
>>>> After re-reading what I just wrote, I am leaning towards disabling use of KVM_CAP_IRQFD_RESAMPLE as it seems last worked on POWER8 and never since :)
>>>>
>>>> Did I miss something in the picture (hey Cedric)?
>>>
>>> How about disabling it like this?
>>>
>>> =====
>>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>>> index 5bfd4aa9e5aa..c999f7b1ab1b 100644
>>> --- a/hw/ppc/spapr_pci.c
>>> +++ b/hw/ppc/spapr_pci.c
>>> @@ -732,7 +732,7 @@ static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
>>>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
>>>       PCIINTxRoute route;
>>>
>>> -    route.mode = PCI_INTX_ENABLED;
>>> +    route.mode = PCI_INTX_DISABLED;
>>>
>>> =====
>>
>> I like it.
> 
> 
> The only thing is that this resampling works on POWER8/XICS and 
> removing it there is not great. So far sPAPR PHB was unaware of 
> underlying interrupt controller, or was not it?

It is. The dynamic change of the underlying irqchip in QEMU and
in KVM required that for CAS. Of course, plenty is done in the
back of the devices when this happens, see spapr_irq.

There are some quirks related to LPM with VIO devices in Linux.
This is the only case I know about.

Thanks,

C.

