Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435E55BB05
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 18:14:11 +0200 (CEST)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5rNK-0004gy-E3
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 12:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rCv-0001Ay-Bm
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:03:26 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o5rCp-0007nS-RX
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 12:03:25 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BD9E62390F;
 Mon, 27 Jun 2022 16:03:17 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 18:03:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00282c229b8-4ae4-4bed-8e30-06b68dbc0cbe,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bc095c7f-9720-92b8-1e04-b210f0532e4b@kaod.org>
Date: Mon, 27 Jun 2022 18:03:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 6/7] hw/arm/aspeed: firework: Add Thermal Diodes
Content-Language: en-US
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Peter Maydell
 <peter.maydell@linaro.org>, Titus Rwantare <titusr@google.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, Hao Wu <wuhaotsh@google.com>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220627154703.148943-1-quic_jaehyoo@quicinc.com>
 <20220627154703.148943-7-quic_jaehyoo@quicinc.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627154703.148943-7-quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8839c2e8-bbde-4179-9475-12bbcd0baddf
X-Ovh-Tracer-Id: 15331660508110883829
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 6/27/22 17:47, Jae Hyun Yoo wrote:
> From: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> 
> Add Thermal Diodes for Firework machine.
> 
> Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>




Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
> Changes in v2:
> * Refined code to avoid retouching by the next patch. (Joel)
> 
>   hw/arm/aspeed.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9c07db70f2fc..cfc322ee30e9 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1002,12 +1002,22 @@ static void qcom_dc_scm_bmc_i2c_init(AspeedMachineState *bmc)
>   static void qcom_dc_scm_firework_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> +    I2CSlave *therm_mux;
>   
>       /* Create the generic DC-SCM hardware */
>       qcom_dc_scm_bmc_i2c_init(bmc);
>   
>       /* Now create the Firework specific hardware */
>   
> +    /* I2C8 Thermal Diodes*/
> +    therm_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
> +                                        "pca9548", 0x70);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 0), TYPE_LM75, 0x4C);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 1), TYPE_LM75, 0x4C);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 2), TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 3), TYPE_LM75, 0x48);
> +    i2c_slave_create_simple(pca954x_i2c_get_bus(therm_mux, 4), TYPE_LM75, 0x48);
> +
>       /* I2C9 Fan Controller (MAX31785) */
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x52);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "max31785", 0x54);


