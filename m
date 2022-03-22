Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9D94E4532
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 18:34:04 +0100 (CET)
Received: from localhost ([::1]:40200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWiOR-0003tB-RX
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 13:34:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWiN9-0002vc-Ki
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:32:43 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:50843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWiN7-00077a-CF
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 13:32:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id EF78F2B42D;
 Tue, 22 Mar 2022 17:32:37 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 22 Mar
 2022 18:32:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033fdf3cc3-41e6-4278-8d23-5b5370c5aaef,
 469EFB141CFE40B2A85C1EB4DF33FF44F3CA3D4D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <fdbfd27a-4ed6-9cf9-ec49-da77d980ce3d@kaod.org>
Date: Tue, 22 Mar 2022 18:32:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 4/9] aspeed/wdt: Add AST1030 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 61a5f6a0-3472-4e15-b4e3-bd30a8bc4d63
X-Ovh-Tracer-Id: 591378928570174395
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeghedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 03:51, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> AST1030 wdt controller is similiar to AST2600's wdt, but it has extra
> registers.

yes. We don't implement all AST2600 registers either but, one day, we
should tune the mmio size better for each SoC and output an unimplemented
log.
  
That's ok for now.

> Introduce ast1030 object class and increse the number of regs(offset) of

                        I fixed the typo ^

> ast1030 model.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++++
>   include/hw/watchdog/wdt_aspeed.h |  1 +
>   2 files changed, 25 insertions(+)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 386928e9c0..31855afdf4 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -391,6 +391,29 @@ static const TypeInfo aspeed_2600_wdt_info = {
>       .class_init = aspeed_2600_wdt_class_init,
>   };
>   
> +static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
> +
> +    dc->desc = "ASPEED 1030 Watchdog Controller";
> +    awc->offset = 0x80;
> +    awc->ext_pulse_width_mask = 0xfffff; /* TODO */
> +    awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
> +    awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
> +    awc->wdt_reload = aspeed_wdt_reload_1mhz;
> +    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
> +    awc->default_status = 0x014FB180;
> +    awc->default_reload_value = 0x014FB180;
> +}
> +
> +static const TypeInfo aspeed_1030_wdt_info = {
> +    .name = TYPE_ASPEED_1030_WDT,
> +    .parent = TYPE_ASPEED_WDT,
> +    .instance_size = sizeof(AspeedWDTState),
> +    .class_init = aspeed_1030_wdt_class_init,
> +};
> +
>   static void wdt_aspeed_register_types(void)
>   {
>       watchdog_add_model(&model);
> @@ -398,6 +421,7 @@ static void wdt_aspeed_register_types(void)
>       type_register_static(&aspeed_2400_wdt_info);
>       type_register_static(&aspeed_2500_wdt_info);
>       type_register_static(&aspeed_2600_wdt_info);
> +    type_register_static(&aspeed_1030_wdt_info);
>   }
>   
>   type_init(wdt_aspeed_register_types)
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index 0e37f39f38..dfa5dfa424 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -19,6 +19,7 @@ OBJECT_DECLARE_TYPE(AspeedWDTState, AspeedWDTClass, ASPEED_WDT)
>   #define TYPE_ASPEED_2400_WDT TYPE_ASPEED_WDT "-ast2400"
>   #define TYPE_ASPEED_2500_WDT TYPE_ASPEED_WDT "-ast2500"
>   #define TYPE_ASPEED_2600_WDT TYPE_ASPEED_WDT "-ast2600"
> +#define TYPE_ASPEED_1030_WDT TYPE_ASPEED_WDT "-ast1030"
>   
>   #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
>   


