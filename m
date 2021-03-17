Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4533F6BE
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:27:26 +0100 (CET)
Received: from localhost ([::1]:51448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMZx7-000518-Hh
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMZm0-0002o0-U8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:15:57 -0400
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:44766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lMZlx-0006U4-3r
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 13:15:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id A0F10274440;
 Wed, 17 Mar 2021 18:15:47 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 17 Mar
 2021 18:15:46 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003c8da9e17-da6d-41e7-a5c1-5b7bd1d2311e,
 10040688A1AB5364447EAD88D88247B833C1D39B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/5] hw/arm/aspeed: Do not directly map ram container onto
 main address bus
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210312182851.1922972-1-f4bug@amsat.org>
 <20210312182851.1922972-2-f4bug@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <0614fe51-102d-cb48-984c-c8f52eabfb56@kaod.org>
Date: Wed, 17 Mar 2021 18:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210312182851.1922972-2-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0631b608-4d0c-4794-945e-f6f0cc1bbc2f
X-Ovh-Tracer-Id: 4126141686554069947
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedguddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 7:28 PM, Philippe Mathieu-Daudé wrote:
> The RAM container is exposed as an AddressSpace.
> AddressSpaces root MemoryRegion must not be mapped into other
> MemoryRegion, therefore map the RAM container using an alias.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/aspeed.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a17b75f4940..daeef5b32a2 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -40,6 +40,7 @@ struct AspeedMachineState {
>  
>      AspeedSoCState soc;
>      MemoryRegion ram_container;
> +    MemoryRegion ram_container_alias;
>      MemoryRegion max_ram;
>      bool mmio_exec;
>      char *fmc_model;
> @@ -339,9 +340,12 @@ static void aspeed_machine_init(MachineState *machine)
>      }
>      qdev_realize(DEVICE(&bmc->soc), NULL, &error_abort);
>  
> +    memory_region_init_alias(&bmc->ram_container_alias, NULL,
> +                             "ram-container-alias", &bmc->ram_container, 0,
> +                             memory_region_size(&bmc->ram_container));
>      memory_region_add_subregion(get_system_memory(),
>                                  sc->memmap[ASPEED_DEV_SDRAM],
> -                                &bmc->ram_container);
> +                                &bmc->ram_container_alias);
>  
>      max_ram_size = object_property_get_uint(OBJECT(&bmc->soc), "max-ram-size",
>                                              &error_abort);
> 

RAM is now initialized before the SoC. So we should be able to use 
machine->ram instead of the bmc->ram_container MR and simplify the
Aspeed SMC model below the SoC.

Thanks,

C.

