Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB9265AFA4
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:35:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCI9J-0002wZ-SM; Mon, 02 Jan 2023 05:34:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCI9I-0002wA-1k
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:34:32 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCI9F-00086B-V3
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:34:31 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.55])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id E33412ABDD;
 Mon,  2 Jan 2023 10:34:24 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 11:34:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004a026ae99-87a7-4cc3-864a-c4509f776d68,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <573321b6-7083-0996-675d-73245fcb178c@kaod.org>
Date: Mon, 2 Jan 2023 11:34:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/9] hw/watchdog/wdt_aspeed: Map the whole MMIO range
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, Peter
 Delevoryas <peter@pjd.dev>
CC: <qemu-devel@nongnu.org>, Steven Lee <steven_lee@aspeedtech.com>, Peter
 Delevoryas <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal
 <bleal@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Troy
 Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-2-philmd@linaro.org>
 <Y637mlYosU4ULh9b@pdel-mbp.dhcp.thefacebook.com>
 <fcb05260-8723-690a-52c8-db72c7372f65@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <fcb05260-8723-690a-52c8-db72c7372f65@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7615b261-fee9-41f8-a8a5-06cb1ec02b21
X-Ovh-Tracer-Id: 12911820135396510596
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgkeetkeegleehueejgefhteekteelieduueffkeetgfekheeuffehveevkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpphgvthgvrhesphhjugdruggvvhdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpsghlvggrlhesrh
 gvughhrghtrdgtohhmpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpphguvghlsehfsgdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdgthhhinhdqthhinhhgpghkuhhosegrshhpvggvughtvggthhdrtghomhdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
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

On 12/30/22 08:32, Philippe Mathieu-Daudé wrote:
> On 29/12/22 21:42, Peter Delevoryas wrote:
>> On Thu, Dec 29, 2022 at 04:23:17PM +0100, Philippe Mathieu-Daudé wrote:
>>> Avoid confusing two different things:
>>> - the WDT I/O region size ('iosize')
>>> - at which offset the SoC map the WDT ('offset')
>>> While it is often the same, we can map smaller region sizes at
>>> larger offsets.
>>>
>>> Here we are interested in the I/O region size. Rename as 'iosize'
>>> and map the whole range, not only the first implemented registers.
>>> Unimplemented registers accesses are already logged as guest-errors.
>>>
>>> Otherwise when booting the demo in [*] we get:
>>>
>>>    aspeed.io: unimplemented device write (size 4, offset 0x1851a8, value 0x030f1ff1)
>>>    aspeed.io: unimplemented device write (size 4, offset 0x1851ac, value 0x03fffff1)
>>>    aspeed.io: unimplemented device write (size 4, offset 0x185128, value 0x030f1ff1)
>>>    aspeed.io: unimplemented device write (size 4, offset 0x18512c, value 0x03fffff1)
>>>
>>> [*] https://github.com/AspeedTech-BMC/zephyr/releases/tag/v00.01.07
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   hw/arm/aspeed_ast10x0.c          |  2 +-
>>>   hw/arm/aspeed_ast2600.c          |  2 +-
>>>   hw/arm/aspeed_soc.c              |  2 +-
>>>   hw/watchdog/wdt_aspeed.c         | 12 +++++++-----
>>>   include/hw/watchdog/wdt_aspeed.h |  2 +-
>>>   5 files changed, 11 insertions(+), 9 deletions(-)
> 
> 
>>> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
>>> index d753693a2e..c1311ce74c 100644
>>> --- a/hw/watchdog/wdt_aspeed.c
>>> +++ b/hw/watchdog/wdt_aspeed.c
>>> @@ -260,6 +260,7 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>>   {
>>>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>>       AspeedWDTState *s = ASPEED_WDT(dev);
>>> +    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(dev);
>>>       assert(s->scu);
>>> @@ -270,8 +271,9 @@ static void aspeed_wdt_realize(DeviceState *dev, Error **errp)
>>>        */
>>>       s->pclk_freq = PCLK_HZ;
>>> +    assert(awc->iosize >= ASPEED_WDT_REGS_MAX * 4);
>>>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_wdt_ops, s,
>>> -                          TYPE_ASPEED_WDT, ASPEED_WDT_REGS_MAX * 4);
>>> +                          TYPE_ASPEED_WDT, awc->iosize);
>>
>> Does this fix the unimplemented thing you referred to in the commit message?
> 
> Yes, I'll reword the description to be clearer.
> 
>> I'm not sure which part of this diff actually removes the unimplemented traces.
> 
> Having:
> 
>    #define ASPEED_WDT_REGS_MAX        (0x20 / 4)
> 
> Before this patch, we map regions of 0x20 ...
> 
>>> @@ -392,7 +394,7 @@ static void aspeed_1030_wdt_class_init(ObjectClass *klass, void *data)
>>>       AspeedWDTClass *awc = ASPEED_WDT_CLASS(klass);
>>>       dc->desc = "ASPEED 1030 Watchdog Controller";
>>> -    awc->offset = 0x80;
>>> +    awc->iosize = 0x80;
> 
> ... every span of 0x80, so there is a gap of 0x60, apparently accessed
> by the Zephyr WDT driver (address 0x28 - register #10 - is accessed in
> the traces).
> 
>  From the driver source we can see [1] added in [2]:
> 
>      #define WDT_RELOAD_VAL_REG          0x0004
>      #define WDT_RESTART_REG             0x0008
>      #define WDT_CTRL_REG                0x000C
>      #define WDT_TIMEOUT_STATUS_REG      0x0010
>      #define WDT_TIMEOUT_STATUS_CLR_REG  0x0014
>      #define WDT_RESET_MASK1_REG         0x001C
>      #define WDT_RESET_MASK2_REG         0x0020
>      #define WDT_SW_RESET_MASK1_REG      0x0028   <------
>      #define WDT_SW_RESET_MASK2_REG      0x002C
>      #define WDT_SW_RESET_CTRL_REG       0x0024
> 
> So the traces likely correspond to this code:
> 
>    static int aspeed_wdt_init(const struct device *dev)
>    {
>      const struct aspeed_wdt_config *config = dev->config;
>      struct aspeed_wdt_data *const data = dev->data;
>      uint32_t reg_val;
> 
>      /* disable WDT by default */
>      reg_val = sys_read32(config->ctrl_base + WDT_CTRL_REG);
>      reg_val &= ~WDT_CTRL_ENABLE;
>      sys_write32(reg_val, config->ctrl_base + WDT_CTRL_REG);
> 
>      sys_write32(data->rst_mask1,
>                  config->ctrl_base + WDT_SW_RESET_MASK1_REG);
>      sys_write32(data->rst_mask2,
>                  config->ctrl_base + WDT_SW_RESET_MASK2_REG);
> 
>      return 0;
>    }

Yes. These registers have been on the TODO list for 3/4 years :/

> After this patch, we map (in this case) a MMIO region of 0x80.
> Accesses to address 0x28 hits this device model but is handled
> as 'WDT register not covered'.

If we are to change things, adding the definitions of the software mode
reset regs in the WDT model would be cleaner. All accesses to these regs
could generate an UNIMP log saying that "support for software mode reset"
is not implemented.

Thanks,

C.
  
> 
> Better would be to extend the Aspeed WDT model in QEMU, or at
> least report the valid-but-unimplemented registers as UNIMP instead
> of GUEST_ERRORS.
> 
> [1] https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/drivers/watchdog/wdt_aspeed.c#L31
> [2] https://github.com/AspeedTech-BMC/zephyr/commit/2e99f10ac27b
> 
>>> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
>>> index dfa5dfa424..db91ee6b51 100644
>>> --- a/include/hw/watchdog/wdt_aspeed.h
>>> +++ b/include/hw/watchdog/wdt_aspeed.h
>>> @@ -40,7 +40,7 @@ struct AspeedWDTState {
>>>   struct AspeedWDTClass {
>>>       SysBusDeviceClass parent_class;
>>> -    uint32_t offset;
>>> +    uint32_t iosize;
>>
>> Oh yeah, iosize is a way better name for this. +1. But to be honest, I don't
>> understand how this is changing the unimplemented traces?
>>
>> Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> 
> Thanks!
> 
> Phil.
> 


