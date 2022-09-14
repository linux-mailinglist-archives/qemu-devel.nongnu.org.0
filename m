Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8585C5B8200
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 09:26:04 +0200 (CEST)
Received: from localhost ([::1]:43322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYMmY-0007SN-W1
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 03:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMbT-0007iT-0n
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:14:37 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:50529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMbQ-00035A-8A
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:14:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5C6DF2064E;
 Wed, 14 Sep 2022 07:14:28 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 14 Sep
 2022 09:14:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005067caa15-4ba7-4850-93b7-b86aed19c0dd,
 6464241036B73DE4A97B8AD469DDB011F00B0909) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <06bed718-ab49-27d5-ba92-1a2892b86334@kaod.org>
Date: Wed, 14 Sep 2022 09:14:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 09/20] ppc440_sdram: Split off map/unmap of sdram banks
 for later reuse
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <4229345309c2320430c0649be5b02c8194d207f6.1663097286.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4229345309c2320430c0649be5b02c8194d207f6.1663097286.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: af8e3335-0060-4615-b774-93ffbabe76c2
X-Ovh-Tracer-Id: 9174958341998611363
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleelieeigfekfeeitddvieegteeuteekffekleehuefgteetgedvkefghefggfeknecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/22 21:52, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 5db59d1190..01184e717b 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -561,26 +561,33 @@ static uint64_t sdram_size(uint32_t bcr)
>       return size;
>   }
>   
> +static void sdram_bank_map(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);

This init belongs to the realize routine.

It is a oneliner. I think you can do it now without risks.

Thanks,

C.

> +    memory_region_add_subregion(&bank->container, 0, &bank->ram);
> +    memory_region_add_subregion(get_system_memory(), bank->base,
> +                                &bank->container);
> +}
> +
> +static void sdram_bank_unmap(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_del_subregion(get_system_memory(), &bank->container);
> +    memory_region_del_subregion(&bank->container, &bank->ram);
> +    object_unparent(OBJECT(&bank->container));
> +}
> +
>   static void sdram_set_bcr(ppc440_sdram_t *sdram, int i,
>                             uint32_t bcr, int enabled)
>   {
>       if (sdram->bank[i].bcr & 1) {
>           /* First unmap RAM if enabled */
> -        memory_region_del_subregion(get_system_memory(),
> -                                    &sdram->bank[i].container);
> -        memory_region_del_subregion(&sdram->bank[i].container,
> -                                    &sdram->bank[i].ram);
> -        object_unparent(OBJECT(&sdram->bank[i].container));
> +        sdram_bank_unmap(&sdram->bank[i]);
>       }
>       sdram->bank[i].bcr = bcr & 0xffe0ffc1;
> +    sdram->bank[i].base = sdram_base(bcr);
> +    sdram->bank[i].size = sdram_size(bcr);
>       if (enabled && (bcr & 1)) {
> -        memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
> -                           sdram_size(bcr));
> -        memory_region_add_subregion(&sdram->bank[i].container, 0,
> -                                    &sdram->bank[i].ram);
> -        memory_region_add_subregion(get_system_memory(),
> -                                    sdram_base(bcr),
> -                                    &sdram->bank[i].container);
> +        sdram_bank_map(&sdram->bank[i]);
>       }
>   }
>   


