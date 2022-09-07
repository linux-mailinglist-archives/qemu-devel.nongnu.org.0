Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7FC5B054F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:37:59 +0200 (CEST)
Received: from localhost ([::1]:43208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvFe-0000oK-Ry
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oVvCD-0004dB-1V; Wed, 07 Sep 2022 09:34:25 -0400
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:37839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oVvCB-0006UW-8N; Wed, 07 Sep 2022 09:34:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 04507125D792E;
 Wed,  7 Sep 2022 15:34:20 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:34:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0045056ab73-c943-49e7-aa9e-f9e1c8ffe8c8,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <2fd70fa7-3620-2206-0d9a-2287e94e4a90@kaod.org>
Date: Wed, 7 Sep 2022 15:34:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 09/20] ppc440_sdram: Split off map/unmap of sdram banks
 for later reuse
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <fdce3e916e0020fbc084ba270d3c6d93e5f9a28f.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fdce3e916e0020fbc084ba270d3c6d93e5f9a28f.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 47200e0a-a5df-4c7c-8f73-c83c6c297b28
X-Ovh-Tracer-Id: 11374685287859653539
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 RCVD_IN_BL_SPAMCOP_NET=1.347, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/19/22 18:55, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc440_uc.c | 31 +++++++++++++++++++------------
>   1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 3507c35b63..c33f91e134 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -561,26 +561,33 @@ static uint64_t sdram_size(uint32_t bcr)
>       return size;
>   }
>   
> +static void sdram_bank_map(Ppc4xxSdramBank *bank)
> +{
> +    memory_region_init(&bank->container, NULL, "sdram-container", bank->size);

I don't think we need to init the ->container memory region each time.
This could be done once and for all in the realize handler.

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

object_unparent could be dropped if the memory_region_init was called in
realize.

Also, memory_region_set_enabled() might be a better alternative.

Thanks,

C.


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


