Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F3A589511
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 01:58:38 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJOG3-0001eh-R8
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 19:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJOEC-00083t-H0; Wed, 03 Aug 2022 19:56:40 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJOE9-0004qu-VQ; Wed, 03 Aug 2022 19:56:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DE6D27462D3;
 Thu,  4 Aug 2022 01:56:30 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A55487461AE; Thu,  4 Aug 2022 01:56:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A3D8E745702;
 Thu,  4 Aug 2022 01:56:30 +0200 (CEST)
Date: Thu, 4 Aug 2022 01:56:30 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, clg@kaod.org, 
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/ppc: sam460ex.c: store all GPIO lines in mal_irqs[]
In-Reply-To: <20220803233204.2724202-1-danielhb413@gmail.com>
Message-ID: <92e46367-e98c-e58-6865-fb9d035679@eik.bme.hu>
References: <20220803233204.2724202-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-553710521-1659570990=:13819"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-553710521-1659570990=:13819
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Aug 2022, Daniel Henrique Barboza wrote:
> We're not storing all GPIO lines we're retrieving with
> qdev_get_gpio_in() in mal_irqs[]. We're storing just the last one in the
> first index:
>
>    for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
>        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
>    }
>    ppc4xx_mal_init(env, 4, 16, mal_irqs);

Indeed, this used to be ppc4xx_mal_init(env, 4, 16, &uic[2][3]); before 
706e944206d7 and this typo slipped thorugh unnoticed, likely because the 
MAL is only there for the firmware to be happy. I think it would be used 
by the EMAC Ethernet port or maybe SATA which are not emulated so probably 
nothing really uses the MAL.

Acked-by: BALATON Zoltan <balaton@eik.bme.hu>

>
> mal_irqs is used in ppc4xx_mal_init() to assign the IRQs to MAL:
>
>    for (i = 0; i < 4; i++) {
>        mal->irqs[i] = irqs[i];
>    }
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
> ---
> hw/ppc/sam460ex.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 7e8da657c2..0357ee077f 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -384,7 +384,7 @@ static void sam460ex_init(MachineState *machine)
>
>     /* MAL */
>     for (i = 0; i < ARRAY_SIZE(mal_irqs); i++) {
> -        mal_irqs[0] = qdev_get_gpio_in(uic[2], 3 + i);
> +        mal_irqs[i] = qdev_get_gpio_in(uic[2], 3 + i);
>     }
>     ppc4xx_mal_init(env, 4, 16, mal_irqs);
>
>
--3866299591-553710521-1659570990=:13819--

