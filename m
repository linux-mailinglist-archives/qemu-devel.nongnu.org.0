Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF03CDFDE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 17:54:59 +0200 (CEST)
Received: from localhost ([::1]:60550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Vbe-0002e4-Na
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 11:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5VaY-0001JR-0I; Mon, 19 Jul 2021 11:53:50 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:53529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1m5VaV-0008Ay-N8; Mon, 19 Jul 2021 11:53:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 775F3B4DBB39;
 Mon, 19 Jul 2021 17:53:36 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 19 Jul
 2021 17:53:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001d6c4ab6b-63e3-4b4b-9a90-115da556d118,
 5C81DEF932CE68F5B4ADF8C6EB3FE0DC56E33E11) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH 1/2] watchdog: aspeed: Sanitize control register values
To: Andrew Jeffery <andrew@aj.id.au>, <qemu-devel@nongnu.org>
References: <20210709053107.1829304-1-andrew@aj.id.au>
 <20210709053107.1829304-2-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3359edb1-e2b1-7f2a-133d-f6923fc37524@kaod.org>
Date: Mon, 19 Jul 2021 17:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709053107.1829304-2-andrew@aj.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d1b41c1f-adbd-4a14-98cd-48fa2035d6f2
X-Ovh-Tracer-Id: 11529215049565440931
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrfedtgdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/9/21 7:31 AM, Andrew Jeffery wrote:
> While some of the critical fields remain the same, there is variation in
> the definition of the control register across the SoC generations.
> Reserved regions are adjusted, while in other cases the mutability or
> behaviour of fields change.
> 
> Introduce a callback to sanitize the value on writes to ensure model
> behaviour reflects the hardware.
> 
> Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>


> ---
>  hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++--
>  include/hw/watchdog/wdt_aspeed.h |  1 +
>  2 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 6352ba1b0e5b..faa3d35fdf21 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -118,13 +118,27 @@ static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
>      }
>  }
>  
> +static uint64_t aspeed_2400_sanitize_ctrl(uint64_t data)
> +{
> +    return data & 0xffff;
> +}
> +
> +static uint64_t aspeed_2500_sanitize_ctrl(uint64_t data)
> +{
> +    return (data & ~(0xfUL << 8)) | WDT_CTRL_1MHZ_CLK;
> +}
> +
> +static uint64_t aspeed_2600_sanitize_ctrl(uint64_t data)
> +{
> +    return data & ~(0x7UL << 7);
> +}
>  
>  static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>                               unsigned size)
>  {
>      AspeedWDTState *s = ASPEED_WDT(opaque);
>      AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
> -    bool enable = data & WDT_CTRL_ENABLE;
> +    bool enable;
>  
>      offset >>= 2;
>  
> @@ -144,6 +158,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
>          }
>          break;
>      case WDT_CTRL:
> +        data = awc->sanitize_ctrl(data);
> +        enable = data & WDT_CTRL_ENABLE;
>          if (enable && !aspeed_wdt_is_enabled(s)) {
>              s->regs[WDT_CTRL] = data;
>              awc->wdt_reload(s);
> @@ -207,11 +223,12 @@ static const MemoryRegionOps aspeed_wdt_ops = {
>  static void aspeed_wdt_reset(DeviceState *dev)
>  {
>      AspeedWDTState *s = ASPEED_WDT(dev);
> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
>  
>      s->regs[WDT_STATUS] = 0x3EF1480;
>      s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
>      s->regs[WDT_RESTART] = 0;
> -    s->regs[WDT_CTRL] = 0;
> +    s->regs[WDT_CTRL] = awc->sanitize_ctrl(0);
>      s->regs[WDT_RESET_WIDTH] = 0xFF;
>  
>      timer_del(s->timer);
> @@ -293,6 +310,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
>      awc->ext_pulse_width_mask = 0xff;
>      awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>      awc->wdt_reload = aspeed_wdt_reload;
> +    awc->sanitize_ctrl = aspeed_2400_sanitize_ctrl;
>  }
>  
>  static const TypeInfo aspeed_2400_wdt_info = {
> @@ -328,6 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>      awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
>      awc->wdt_reload = aspeed_wdt_reload_1mhz;
> +    awc->sanitize_ctrl = aspeed_2500_sanitize_ctrl;
>  }
>  
>  static const TypeInfo aspeed_2500_wdt_info = {
> @@ -348,6 +367,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>      awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
>      awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
>      awc->wdt_reload = aspeed_wdt_reload_1mhz;
> +    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
>  }
>  
>  static const TypeInfo aspeed_2600_wdt_info = {
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index 80b03661e303..f945cd6c5833 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -44,6 +44,7 @@ struct AspeedWDTClass {
>      uint32_t reset_ctrl_reg;
>      void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
>      void (*wdt_reload)(AspeedWDTState *s);
> +    uint64_t (*sanitize_ctrl)(uint64_t data);
>  };
>  
>  #endif /* WDT_ASPEED_H */
> 


