Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6866BC9B
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:15:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNRo-0004rS-Oi; Mon, 16 Jan 2023 06:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRm-0004qi-Bf; Mon, 16 Jan 2023 06:14:38 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRk-0005YV-8c; Mon, 16 Jan 2023 06:14:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.237])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BBFD725B53;
 Mon, 16 Jan 2023 11:14:31 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 16 Jan
 2023 12:14:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003ac7ef23e-17ba-4674-8120-d3c2c0c234aa,
 9562F276D9C9043C19838F7BDA7B87DE9C964FD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9490c535-9060-4d6f-2dc9-ee6f7cf852de@kaod.org>
Date: Mon, 16 Jan 2023 12:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/6] hw/arm/aspeed: Replace aspeed_eeprom_init with
 at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <patrick@stwcx.xyz>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <hskinnemoen@google.com>, <kfting@nuvoton.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-4-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230114170151.87833-4-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a7ec20cd-8630-4f34-826e-a96ca7767642
X-Ovh-Tracer-Id: 3573324830131129135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrsehpjhgurdguvghvpdhprghtrhhitghksehsthiftgigrdighiiipdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpkhhfthhinhhgsehnuhhvohhtohhnrdgtohhmpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmoh
 ehhedvpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/14/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 95 ++++++++++++++++++++++---------------------------
>   1 file changed, 43 insertions(+), 52 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1f9799d4321e..c929c61d582a 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -660,15 +660,6 @@ static void g220a_bmc_i2c_init(AspeedMachineState *bmc)
>                             eeprom_buf);
>   }
>   
> -static void aspeed_eeprom_init(I2CBus *bus, uint8_t addr, uint32_t rsize)
> -{
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, bus, &error_abort);
> -}
> -
>   static void fp5280g2_bmc_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -701,7 +692,7 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>       AspeedSoCState *soc = &bmc->soc;
>       I2CSlave *i2c_mux;
>   
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 0), 0x51, 32 * KiB);
>   
>       create_pca9552(soc, 3, 0x61);
>   
> @@ -714,9 +705,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                        0x4a);
>       i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4),
>                                         "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x52, 64 * KiB);
>       create_pca9552(soc, 4, 0x60);
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), TYPE_TMP105,
> @@ -727,8 +718,8 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>       create_pca9552(soc, 5, 0x61);
>       i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5),
>                                         "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
>                        0x48);
> @@ -738,10 +729,10 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                        0x4b);
>       i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6),
>                                         "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 2), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 3), 0x51, 64 * KiB);
>   
>       create_pca9552(soc, 7, 0x30);
>       create_pca9552(soc, 7, 0x31);
> @@ -754,15 +745,15 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
>                        0x48);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785", 0x52);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                        0x48);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8), TYPE_TMP105,
>                        0x4a);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 8), 0x51, 64 * KiB);
>       create_pca9552(soc, 8, 0x60);
>       create_pca9552(soc, 8, 0x61);
>       /* Bus 8: ucd90320@11 */
> @@ -771,11 +762,11 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4c);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), "tmp423", 0x4d);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 9), 0x50, 128 * KiB);
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4c);
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 10), "tmp423", 0x4d);
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 10), 0x50, 128 * KiB);
>   
>       i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), TYPE_TMP105,
>                        0x48);
> @@ -783,18 +774,18 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>                        0x49);
>       i2c_mux = i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11),
>                                         "pca9546", 0x70);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> -    aspeed_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 0), 0x50, 64 * KiB);
> +    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x51, 64 * KiB);
>       create_pca9552(soc, 11, 0x60);
>   
>   
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 13), 0x50, 64 * KiB);
>       create_pca9552(soc, 13, 0x60);
>   
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 14), 0x50, 64 * KiB);
>       create_pca9552(soc, 14, 0x60);
>   
> -    aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
> +    at24c_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 15), 0x50, 64 * KiB);
>       create_pca9552(soc, 15, 0x60);
>   }
>   
> @@ -838,45 +829,45 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);
>   
> -    aspeed_eeprom_init(i2c[19], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[20], 0x50, 2 * KiB);
> -    aspeed_eeprom_init(i2c[22], 0x52, 2 * KiB);
> +    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
>   
>       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
>       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
>       i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
>       i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);
>   
> -    aspeed_eeprom_init(i2c[8], 0x51, 64 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
>       i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);
>   
>       i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
> -    aspeed_eeprom_init(i2c[50], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
>       i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
>       i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);
>   
>       i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
>       i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);
>   
> -    aspeed_eeprom_init(i2c[65], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
>       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
>       i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[68], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[69], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[70], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[71], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
>   
> -    aspeed_eeprom_init(i2c[73], 0x53, 64 * KiB);
> +    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
>       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
>       i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
> -    aspeed_eeprom_init(i2c[76], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[77], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[78], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[79], 0x52, 64 * KiB);
> -    aspeed_eeprom_init(i2c[28], 0x50, 2 * KiB);
> +    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
> +    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
>   
>       for (int i = 0; i < 8; i++) {
> -        aspeed_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
> +        at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
>           i2c_slave_create_simple(i2c[82 + i * 8], TYPE_TMP75, 0x48);
>           i2c_slave_create_simple(i2c[83 + i * 8], TYPE_TMP75, 0x4b);
>           i2c_slave_create_simple(i2c[84 + i * 8], TYPE_TMP75, 0x4a);
> @@ -947,11 +938,11 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4e);
>       i2c_slave_create_simple(i2c[12], TYPE_LM75, 0x4f);
>   
> -    aspeed_eeprom_init(i2c[4], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[6], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[8], 0x50, 32 * KiB);
> -    aspeed_eeprom_init(i2c[11], 0x51, 128 * KiB);
> -    aspeed_eeprom_init(i2c[11], 0x54, 128 * KiB);
> +    at24c_eeprom_init(i2c[4], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
> +    at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
> +    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
>   
>       /*
>        * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on


