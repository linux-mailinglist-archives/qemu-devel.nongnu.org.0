Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F796500DDB
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 14:43:47 +0200 (CEST)
Received: from localhost ([::1]:39496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neyp7-0005Fy-W0
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 08:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1neymz-0003KO-RJ
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:41:33 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:55809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1neymx-0000Hj-AR
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 08:41:32 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 54CDDF66C15B;
 Thu, 14 Apr 2022 14:41:28 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 14 Apr
 2022 14:41:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0019ef5c68b-4b91-4514-95c6-136d1a22d27d,
 7BAFBB9105945E47A73D0E0D6263BD86E6E855E6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e25296b3-b1ec-a90a-ee72-ed15fe5130f6@kaod.org>
Date: Thu, 14 Apr 2022 14:41:26 +0200
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
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <560c8c1a-a87e-71f9-cfea-0a034933070b@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ba339889-dbea-4e9e-8a7c-f9f75d81a253
X-Ovh-Tracer-Id: 1619044069964876652
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudelfedgheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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


>> After re-reading what I just wrote, I am leaning towards disabling use of KVM_CAP_IRQFD_RESAMPLE as it seems last worked on POWER8 and never since :)
>>
>> Did I miss something in the picture (hey Cedric)?
> 
> How about disabling it like this?
> 
> =====
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 5bfd4aa9e5aa..c999f7b1ab1b 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -732,7 +732,7 @@ static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
>       PCIINTxRoute route;
> 
> -    route.mode = PCI_INTX_ENABLED;
> +    route.mode = PCI_INTX_DISABLED;
> 
> =====

I like it.


You now know how to test all the combinations :) Prepare your matrix,
variables are :

  * Host OS		POWER8, POWER9+
  * KVM device		XICS (P8), XICS-on-XIVE (P9), XIVE-on-XIVE (P9)
  * kernel_irqchip	off, on
  * ic-mode		xics, xive
  * Guest OS		msi or nomsi

Ideally you should check TCG, but that's like kernel_irqchip=off.

Cheers,

C.
  
> 
> (btw what the heck is PCI_INTX_INVERTED for?)
> 
> 
> -- 
> Alexey


