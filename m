Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9DC589750
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 07:25:31 +0200 (CEST)
Received: from localhost ([::1]:33692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJTMQ-0004ny-VV
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 01:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTKz-000395-Dg
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:24:01 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:48083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTKv-000264-GZ
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:24:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 7E972220B4;
 Thu,  4 Aug 2022 05:23:53 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 07:23:52 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005a3c8e420-c0bc-49c5-b25e-855b6571d49c,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <829cc309-38b3-4093-32eb-7363a7d645f3@kaod.org>
Date: Thu, 4 Aug 2022 07:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, BALATON
 Zoltan <balaton@eik.bme.hu>
References: <20220803233204.2724202-1-danielhb413@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220803233204.2724202-1-danielhb413@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: b0e57469-0060-4007-babc-2f2824a99247
X-Ovh-Tracer-Id: 6334594352293579683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefgiedvieegfeetgeffkefhjeefkefhgfeihfegtdehheeuieeuffetveeigfelhfenucffohhmrghinhepghhnuhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/4/22 01:32, Daniel Henrique Barboza wrote:
> We're not storing all GPIO lines we're retrieving with
> qdev_get_gpio_in() in mal_irqs[]. We're storing just the last one in the
> first index:
> 
>      for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
>          mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
>      }
>      ppc4xx_mal_init(env, 4, 16, mal_irqs);
> 
> mal_irqs is used in ppc4xx_mal_init() to assign the IRQs to MAL:
> 
>      for (i = 0; i < 4; i++) {
>          mal->irqs[i] = irqs[i];
>      }
> 
> Since only irqs[0] has been initialized, mal->irqs[1,2,3] are being
> zeroed.
> 
> This doesn´t seem to trigger any apparent issues at this moment, but
> Cedric's QOMification of the MAL device [1] is executing a
> sysbus_connect_irq() that will fail if we do not store all GPIO lines
> properly.
> 
> [1] https://lists.gnu.org/archive/html/qemu-devel/2022-08/msg00497.html
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: BALATON Zoltan <balaton@eik.bme.hu>
> Fixes: 706e944206d7 ("hw/ppc/sam460ex: Drop use of ppcuic_init()")
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Yes, I found the same issue when fixing ppc4xx_mal_init().

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.
> ---
>   hw/ppc/sam460ex.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 7e8da657c2..0357ee077f 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -384,7 +384,7 @@ static void sam460ex_init(MachineState *machine)
>   
>       /* MAL */
>       for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
> -        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
> +        mal_irqs[i] = qdev_get_gpio_in(uic[2], 3 + i);
>       }
>       ppc4xx_mal_init(env, 4, 16, mal_irqs);
>   


