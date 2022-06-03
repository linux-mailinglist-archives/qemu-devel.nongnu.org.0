Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43F53C72C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 10:54:45 +0200 (CEST)
Received: from localhost ([::1]:43128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx34t-0006TF-HZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 04:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nx30F-0004wJ-7S
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 04:49:56 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:39221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nx30B-0001JQ-Id
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 04:49:54 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.179])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0F6E024319;
 Fri,  3 Jun 2022 08:49:46 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 3 Jun 2022
 10:49:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001b8a3bd6e-fcca-4b6e-ae83-02901fa4c6d1,
 2F375BC487B398842DD9155F09582B226C9A4747) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b1d77c5d-de4d-fbc5-e7c6-1dddbe3f7ab0@kaod.org>
Date: Fri, 3 Jun 2022 10:49:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/1] hw: m25p80: add W# pin and SRWD bit for write
 protection
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, Iris Chen
 <irischenlj@gmail.com>
References: <irischenlj@fb.com> <20220526021216.1031533-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220526021216.1031533-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3e9b1434-3352-4292-a052-84e8fd22cf95
X-Ovh-Tracer-Id: 14639232066535000964
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehirhhishgthhgvnhhljhesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
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

Hello Iris,

On 5/26/22 04:12, Iris Chen wrote:
> From: Iris Chen <irischenlj@gmail.com>
> 
> Add the W# pin and SRWD bit which control the status register write
> ability.

may be replace W# by WP# (for write protect)

> 
> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> ---
>   hw/block/m25p80.c             | 72 +++++++++++++++++++++++++++++++++++
>   tests/qtest/aspeed_smc-test.c | 62 ++++++++++++++++++++++++++++++
>   2 files changed, 134 insertions(+)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 81ba3da4df..c845fa08d4 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -27,12 +27,14 @@
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
>   #include "hw/ssi/ssi.h"
> +#include "hw/irq.h"
>   #include "migration/vmstate.h"
>   #include "qemu/bitops.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
>   #include "qapi/error.h"
> +#include "qapi/visitor.h"
>   #include "trace.h"
>   #include "qom/object.h"
>   
> @@ -472,11 +474,13 @@ struct Flash {
>       uint8_t spansion_cr2v;
>       uint8_t spansion_cr3v;
>       uint8_t spansion_cr4v;
> +    bool write_protect_pin;

I would call this attribute 'wp_level' since it is an assertion level
of the WP# pin.

>       bool write_enable;
>       bool four_bytes_address_mode;
>       bool reset_enable;
>       bool quad_enable;
>       bool aai_enable;
> +    bool status_register_write_disabled;
>       uint8_t ear;
>   
>       int64_t dirty_page;
> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
>           flash_erase(s, s->cur_addr, s->cmd_in_progress);
>           break;
>       case WRSR:
> +        /*
> +         * If W# is low and status_register_write_disabled is high,
> +         * status register writes are disabled.
> +         * This is also called "hardware protected mode" (HPM). All other
> +         * combinations of the two states are called "software protected mode"
> +         * (SPM), and status register writes are permitted.
> +         */
> +        if ((s->write_protect_pin == 0 && s->status_register_write_disabled)
> +            || !s->write_enable) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "M25P80: Status register write is disabled!\n");
> +            break;
> +        }
> +        s->status_register_write_disabled = extract32(s->data[0], 7, 1);
> +
>           switch (get_man(s)) {
>           case MAN_SPANSION:
>               s->quad_enable = !!(s->data[1] & 0x02);
> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t value)
>   
>       case RDSR:
>           s->data[0] = (!!s->write_enable) << 1;
> +        s->data[0] |= (!!s->status_register_write_disabled) << 7;
> +
>           if (get_man(s) == MAN_MACRONIX || get_man(s) == MAN_ISSI) {
>               s->data[0] |= (!!s->quad_enable) << 6;
>           }
> @@ -1484,6 +1505,15 @@ static uint32_t m25p80_transfer8(SSIPeripheral *ss, uint32_t tx)
>       return r;
>   }
>   
> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n, int level)
> +{
> +    Flash *s = M25P80(opaque);
> +    bool wp = !!level;

this extra variable looks superfluous. minor

> +    /* W# is just a single pin. */
> +    assert(n == 0);
> +    s->write_protect_pin = wp;
> +}
> +
>   static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>   {
>       Flash *s = M25P80(ss);
> @@ -1515,12 +1545,18 @@ static void m25p80_realize(SSIPeripheral *ss, Error **errp)
>           s->storage = blk_blockalign(NULL, s->size);
>           memset(s->storage, 0xFF, s->size);
>       }
> +
> +    qdev_init_gpio_in_named(DEVICE(s),
> +                            m25p80_write_protect_pin_irq_handler, "W#", 1);
>   }
>   
>   static void m25p80_reset(DeviceState *d)
>   {
>       Flash *s = M25P80(d);
>   
> +    s->write_protect_pin = true;
> +    s->status_register_write_disabled = false;

Are we ok with these defaults ? We wouldn't want to break existing
implementation.


>       reset_memory(s);
>   }
>   
> @@ -1601,6 +1637,7 @@ static const VMStateDescription vmstate_m25p80 = {
>           VMSTATE_UINT8(needed_bytes, Flash),
>           VMSTATE_UINT8(cmd_in_progress, Flash),
>           VMSTATE_UINT32(cur_addr, Flash),
> +        VMSTATE_BOOL(write_protect_pin, Flash),

and what about status_register_write_disabled ?

>           VMSTATE_BOOL(write_enable, Flash),
>           VMSTATE_BOOL(reset_enable, Flash),
>           VMSTATE_UINT8(ear, Flash),
> @@ -1622,6 +1659,38 @@ static const VMStateDescription vmstate_m25p80 = {
>       }
>   };
>   
> +static void m25p80_get_write_protect_pin(Object *obj,
> +                                       Visitor *v,
> +                                       const char *name,
> +                                       void *opaque,
> +                                       Error **errp)
> +{
> +    Flash *s = M25P80(obj);
> +    bool value;
> +
> +    value = s->write_protect_pin;
> +
> +    visit_type_bool(v, name, &value, errp);
> +}
> +
> +static void m25p80_set_write_protect_pin(Object *obj,
> +                                       Visitor *v,
> +                                       const char *name,
> +                                       void *opaque,
> +                                       Error **errp)
> +{
> +    Flash *s = M25P80(obj);
> +    bool value;
> +    qemu_irq w;
> +
> +    if (!visit_type_bool(v, name, &value, errp)) {
> +        return;
> +    }
> +
> +    w = qdev_get_gpio_in_named(DEVICE(s), "W#", 0);
> +    qemu_set_irq(w, value);
> +}
> +
>   static void m25p80_class_init(ObjectClass *klass, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(klass);
> @@ -1636,6 +1705,9 @@ static void m25p80_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, m25p80_properties);
>       dc->reset = m25p80_reset;
>       mc->pi = data;
> +
> +    object_class_property_add(klass, "W#", "bool", m25p80_get_write_protect_pin,
> +                              m25p80_set_write_protect_pin, NULL, NULL);


I think you can simply use qtest_set_irq_in() from the test to raise the
interrupt and avoid adding a property to do the same.


>   }
>   
>   static const TypeInfo m25p80_info = {
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c


I would include the test in a second patch.

Thanks,

C.

> index ec233315e6..45c0d812c7 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -56,7 +56,9 @@ enum {
>       BULK_ERASE = 0xc7,
>       READ = 0x03,
>       PP = 0x02,
> +    WRSR = 0x1,
>       WREN = 0x6,
> +    SRWD = 0x80,
>       RESET_ENABLE = 0x66,
>       RESET_MEMORY = 0x99,
>       EN_4BYTE_ADDR = 0xB7,
> @@ -390,6 +392,64 @@ static void test_read_status_reg(void)
>       flash_reset();
>   }
>   
> +static void test_status_reg_write_protection(void)
> +{
> +    uint8_t r;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    /* default case: W# is high and SRWD is low -> status register writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, SRWD);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    /* W# high and SRWD high -> status register writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, 0);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, 0);
> +
> +    /* W# low and SRWD low -> status register writable */
> +    qtest_qom_set_bool(global_qtest,
> +                       "/machine/soc/fmc/ssi.0/child[0]", "W#", false);
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, SRWD);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    /* W# low and SRWD high -> status register NOT writable */
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    /* test ability to write SRWD */
> +    writeb(ASPEED_FLASH_BASE, WRSR);
> +    writeb(ASPEED_FLASH_BASE, 0);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +    /* write is not successful */
> +    g_assert_cmphex(r & SRWD, ==, SRWD);
> +
> +    qtest_qom_set_bool(global_qtest,
> +                       "/machine/soc/fmc/ssi.0/child[0]", "W#", true);
> +    flash_reset();
> +}
> +
>   static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>   
>   int main(int argc, char **argv)
> @@ -416,6 +476,8 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
>       qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
>       qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
> +    qtest_add_func("/ast2400/smc/status_reg_write_protection",
> +                   test_status_reg_write_protection);
>   
>       ret = g_test_run();
>   


