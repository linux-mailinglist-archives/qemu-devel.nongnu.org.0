Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E653F42080A
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:13:18 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXK29-0007dc-Vk
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXJwz-0000VE-8i
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:07:57 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:41793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXJwu-0001aI-9G
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 05:07:57 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.124])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 93750C209725;
 Mon,  4 Oct 2021 11:07:48 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 11:07:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059a49ebfd-d287-4bdf-9cf1-603c69014d32,
 6052322A053A64D32F912485F446DEADD4740C2E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <c1d2a714-1073-310b-e75c-2f6b5b5a025f@kaod.org>
Date: Mon, 4 Oct 2021 11:07:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/1] hw: aspeed_gpio: Fix GPIO array indexing
Content-Language: en-US
To: <pdel@fb.com>
References: <20210928034356.3280959-1-pdel@fb.com>
 <20210928034356.3280959-2-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20210928034356.3280959-2-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fa4b4662-d651-425f-b928-3392d482c144
X-Ovh-Tracer-Id: 14151435931626867494
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhhfelgeeukedtteffvdffueeiuefgkeekleehleetfedtgfetffefheeugeelheenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: patrick@stwcx.xyz, rashmica.g@gmail.com, f4bug@amsat.org, joel@jms.id.au,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/28/21 05:43, pdel@fb.com wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> The gpio array is declared as a dense array:
> 
>    qemu_irq gpios[ASPEED_GPIO_NR_PINS];
> 
> (AST2500 has 228, AST2400 has 216, AST2600 has 208)
> 
> However, this array is used like a matrix of GPIO sets
> (e.g. gpio[NR_SETS][NR_PINS_PER_SET] = gpio[8][32])
> 
>    size_t offset = set * GPIOS_PER_SET + gpio;
>    qemu_set_irq(s->gpios[offset], !!(new & mask));
> 
> This can result in an out-of-bounds access to "s->gpios" because the
> gpio sets do _not_ have the same length. Some of the groups (e.g.
> GPIOAB) only have 4 pins. 228 != 8 * 32 == 256.
> 
> To fix this, I converted the gpio array from dense to sparse, to match
> both the hardware layout and this existing indexing code.
> 
> Fixes: 4b7f956862dc2db4c5c ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


This patch is raising an error in qtest-arm/qom-test when compiled
with clang :

Running test qtest-arm/qom-test
Unexpected error in object_property_try_add() at ../qom/object.c:1224:
qemu-system-arm: attempt to add duplicate property 'gpio0' to object (type 'aspeed.gpio-ast2600-1_8v')
Broken pipe
ERROR qtest-arm/qom-test - too few tests run (expected 78, got 0)
make: *** [Makefile.mtest:24: run-test-1] Error 1

Thanks,

C.


> ---
>   hw/gpio/aspeed_gpio.c         | 72 ++++++++++++++---------------------
>   include/hw/gpio/aspeed_gpio.h |  5 +--
>   2 files changed, 31 insertions(+), 46 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index dfa6d6cb40..f04d4a454c 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -16,11 +16,7 @@
>   #include "hw/irq.h"
>   #include "migration/vmstate.h"
>   
> -#define GPIOS_PER_REG 32
> -#define GPIOS_PER_SET GPIOS_PER_REG
> -#define GPIO_PIN_GAP_SIZE 4
>   #define GPIOS_PER_GROUP 8
> -#define GPIO_GROUP_SHIFT 3
>   
>   /* GPIO Source Types */
>   #define ASPEED_CMD_SRC_MASK         0x01010101
> @@ -259,7 +255,7 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>   
>       diff = old ^ new;
>       if (diff) {
> -        for (gpio = 0; gpio < GPIOS_PER_REG; gpio++) {
> +        for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
>               uint32_t mask = 1 << gpio;
>   
>               /* If the gpio needs to be updated... */
> @@ -283,8 +279,7 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>               if (direction & mask) {
>                   /* ...trigger the line-state IRQ */
>                   ptrdiff_t set = aspeed_gpio_set_idx(s, regs);
> -                size_t offset = set * GPIOS_PER_SET + gpio;
> -                qemu_set_irq(s->gpios[offset], !!(new & mask));
> +                qemu_set_irq(s->gpios[set][gpio], !!(new & mask));
>               } else {
>                   /* ...otherwise if we meet the line's current IRQ policy... */
>                   if (aspeed_evaluate_irq(regs, old & mask, gpio)) {
> @@ -297,21 +292,6 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
>       qemu_set_irq(s->irq, !!(s->pending));
>   }
>   
> -static uint32_t aspeed_adjust_pin(AspeedGPIOState *s, uint32_t pin)
> -{
> -    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
> -    /*
> -     * The 2500 has a 4 pin gap in group AB and the 2400 has a 4 pin
> -     * gap in group Y (and only four pins in AB but this is the last group so
> -     * it doesn't matter).
> -     */
> -    if (agc->gap && pin >= agc->gap) {
> -        pin += GPIO_PIN_GAP_SIZE;
> -    }
> -
> -    return pin;
> -}
> -
>   static bool aspeed_gpio_get_pin_level(AspeedGPIOState *s, uint32_t set_idx,
>                                         uint32_t pin)
>   {
> @@ -367,7 +347,7 @@ static uint32_t update_value_control_source(GPIOSets *regs, uint32_t old_value,
>       uint32_t new_value = 0;
>   
>       /* for each group in set */
> -    for (i = 0; i < GPIOS_PER_REG; i += GPIOS_PER_GROUP) {
> +    for (i = 0; i < ASPEED_GPIOS_PER_SET; i += GPIOS_PER_GROUP) {
>           cmd_source = extract32(regs->cmd_source_0, i, 1)
>                   | (extract32(regs->cmd_source_1, i, 1) << 1);
>   
> @@ -637,7 +617,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>            *   bidirectional  |   1       |   1        |  data
>            *   input only     |   1       |   0        |   0
>            *   output only    |   0       |   1        |   1
> -         *   no pin / gap   |   0       |   0        |   0
> +         *   no pin         |   0       |   0        |   0
>            *
>            *  which is captured by:
>            *  data = ( data | ~input) & output;
> @@ -836,14 +816,20 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
>       AspeedGPIOState *s = ASPEED_GPIO(dev);
>       SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>       AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
> -    int pin;
>   
>       /* Interrupt parent line */
>       sysbus_init_irq(sbd, &s->irq);
>   
>       /* Individual GPIOs */
> -    for (pin = 0; pin < agc->nr_gpio_pins; pin++) {
> -        sysbus_init_irq(sbd, &s->gpios[pin]);
> +    for (int i = 0; i < ASPEED_GPIO_MAX_NR_SETS; i++) {
> +        const GPIOSetProperties *props = &agc->props[i];
> +        uint32_t skip = ~(props->input | props->output);
> +        for (int j = 0; j < ASPEED_GPIOS_PER_SET; j++) {
> +            if (skip >> j & 1) {
> +                continue;
> +            }
> +            sysbus_init_irq(sbd, &s->gpios[i][j]);
> +        }
>       }
>   
>       memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
> @@ -856,20 +842,22 @@ static void aspeed_gpio_init(Object *obj)
>   {
>       AspeedGPIOState *s = ASPEED_GPIO(obj);
>       AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
> -    int pin;
> -
> -    for (pin = 0; pin < agc->nr_gpio_pins; pin++) {
> -        char *name;
> -        int set_idx = pin / GPIOS_PER_SET;
> -        int pin_idx = aspeed_adjust_pin(s, pin) - (set_idx * GPIOS_PER_SET);
> -        int group_idx = pin_idx >> GPIO_GROUP_SHIFT;
> -        const GPIOSetProperties *props = &agc->props[set_idx];
> -
> -        name = g_strdup_printf("gpio%s%d", props->group_label[group_idx],
> -                               pin_idx % GPIOS_PER_GROUP);
> -        object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
> -                            aspeed_gpio_set_pin, NULL, NULL);
> -        g_free(name);
> +
> +    for (int i = 0; i < ASPEED_GPIO_MAX_NR_SETS; i++) {
> +        const GPIOSetProperties *props = &agc->props[i];
> +        uint32_t skip = ~(props->input | props->output);
> +        for (int j = 0; j < ASPEED_GPIOS_PER_SET; j++) {
> +            if (skip >> j & 1) {
> +                continue;
> +            }
> +            int group_idx = j / GPIOS_PER_GROUP;
> +            int pin_idx = j % GPIOS_PER_GROUP;
> +            const char *group = &props->group_label[group_idx][0];
> +            char *name = g_strdup_printf("gpio%s%d", group, pin_idx);
> +            object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
> +                                aspeed_gpio_set_pin, NULL, NULL);
> +            g_free(name);
> +        }
>       }
>   }
>   
> @@ -926,7 +914,6 @@ static void aspeed_gpio_ast2400_class_init(ObjectClass *klass, void *data)
>       agc->props = ast2400_set_props;
>       agc->nr_gpio_pins = 216;
>       agc->nr_gpio_sets = 7;
> -    agc->gap = 196;
>       agc->reg_table = aspeed_3_3v_gpios;
>   }
>   
> @@ -937,7 +924,6 @@ static void aspeed_gpio_2500_class_init(ObjectClass *klass, void *data)
>       agc->props = ast2500_set_props;
>       agc->nr_gpio_pins = 228;
>       agc->nr_gpio_sets = 8;
> -    agc->gap = 220;
>       agc->reg_table = aspeed_3_3v_gpios;
>   }
>   
> diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
> index e1636ce7fe..801846befb 100644
> --- a/include/hw/gpio/aspeed_gpio.h
> +++ b/include/hw/gpio/aspeed_gpio.h
> @@ -17,9 +17,9 @@
>   OBJECT_DECLARE_TYPE(AspeedGPIOState, AspeedGPIOClass, ASPEED_GPIO)
>   
>   #define ASPEED_GPIO_MAX_NR_SETS 8
> +#define ASPEED_GPIOS_PER_SET 32
>   #define ASPEED_REGS_PER_BANK 14
>   #define ASPEED_GPIO_MAX_NR_REGS (ASPEED_REGS_PER_BANK * ASPEED_GPIO_MAX_NR_SETS)
> -#define ASPEED_GPIO_NR_PINS 228
>   #define ASPEED_GROUPS_PER_SET 4
>   #define ASPEED_GPIO_NR_DEBOUNCE_REGS 3
>   #define ASPEED_CHARS_PER_GROUP_LABEL 4
> @@ -60,7 +60,6 @@ struct AspeedGPIOClass {
>       const GPIOSetProperties *props;
>       uint32_t nr_gpio_pins;
>       uint32_t nr_gpio_sets;
> -    uint32_t gap;
>       const AspeedGPIOReg *reg_table;
>   };
>   
> @@ -72,7 +71,7 @@ struct AspeedGPIOState {
>       MemoryRegion iomem;
>       int pending;
>       qemu_irq irq;
> -    qemu_irq gpios[ASPEED_GPIO_NR_PINS];
> +    qemu_irq gpios[ASPEED_GPIO_MAX_NR_SETS][ASPEED_GPIOS_PER_SET];
>   
>   /* Parallel GPIO Registers */
>       uint32_t debounce_regs[ASPEED_GPIO_NR_DEBOUNCE_REGS];
> 


