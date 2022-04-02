Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E584F05EF
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 21:43:10 +0200 (CEST)
Received: from localhost ([::1]:38782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1najeP-0002uV-EB
	for lists+qemu-devel@lfdr.de; Sat, 02 Apr 2022 15:43:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1najb7-0001Cv-Sl; Sat, 02 Apr 2022 15:39:45 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:43551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1najb2-0006NZ-AR; Sat, 02 Apr 2022 15:39:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2EC3920441;
 Sat,  2 Apr 2022 19:39:29 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Sat, 2 Apr
 2022 21:39:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0054695bc1b-c739-456d-bda4-85b1a819c671,
 A74503F7E5587F569FD34A1240EFF25B47FA7F20) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <40dd9b96-3345-739b-fbd4-9b6a988407dc@kaod.org>
Date: Sat, 2 Apr 2022 21:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] hw/arm/aspeed: fix AST2500/AST2600 EVB fmc model
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
References: <20220402184427.4010304-1-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220402184427.4010304-1-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a8668346-6a16-4d6f-90d5-61ab72d1d024
X-Ovh-Tracer-Id: 11993367284129237868
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeikedgudegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Graeme Gregory <quic_ggregory@quicinc.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/22 20:44, Jae Hyun Yoo wrote:
> Current fmc model of AST2500 EVB and AST2600 EVB can't emulate quad
> mode properly so fix them using equivalent mx25l25635e and mx66u51235f
> respectively.
> 
> These default settings still can be overridden using the 'fmc-model'
> command line option.
> 
> Reported-by: Graeme Gregory <quic_ggregory@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


>   hw/arm/aspeed.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index d205384d986f..b94a56e10093 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1092,7 +1092,7 @@ static void aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>       mc->desc       = "Aspeed AST2500 EVB (ARM1176)";
>       amc->soc_name  = "ast2500-a1";
>       amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
> -    amc->fmc_model = "w25q256";
> +    amc->fmc_model = "mx25l25635e";
>       amc->spi_model = "mx25l25635e";
>       amc->num_cs    = 1;
>       amc->i2c_init  = ast2500_evb_i2c_init;
> @@ -1161,7 +1161,7 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
>       amc->soc_name  = "ast2600-a3";
>       amc->hw_strap1 = AST2600_EVB_HW_STRAP1;
>       amc->hw_strap2 = AST2600_EVB_HW_STRAP2;
> -    amc->fmc_model = "w25q512jv";
> +    amc->fmc_model = "mx66u51235f";
>       amc->spi_model = "mx66u51235f";
>       amc->num_cs    = 1;
>       amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |


