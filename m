Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06B526357
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 15:57:56 +0200 (CEST)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npVnn-0004RS-64
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 09:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npVlA-0001ma-BV
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:55:15 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:53383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1npVl6-0006pO-Ab
 for qemu-devel@nongnu.org; Fri, 13 May 2022 09:55:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.191])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 88F84FF75E1F;
 Fri, 13 May 2022 15:54:56 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 13 May
 2022 15:54:55 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0069ce17b4a-e135-4c10-8ff2-d1498eb6a20c,
 97912ADCF8BE5A44427C4FE81E404CB8FAC57E21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bfbffeef-e7d1-8003-24ca-4cafc90e60a4@kaod.org>
Date: Fri, 13 May 2022 15:54:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] hw: m25p80: allow write_enable latch get/set
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>
References: <irischenlj@gmail.com> <20220513055022.951759-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220513055022.951759-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 456d6b73-f672-4261-9611-62b7d7c272ee
X-Ovh-Tracer-Id: 7147212611889957761
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrgeelgdeilecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqsghlohgtkhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Thomas, and others,

Are you ok with the qtest extension proposed by Iris ?

If so, I can take them through an aspeed PR.

Thanks,

C.

On 5/13/22 07:50, Iris Chen via wrote:
> The write_enable latch property is not currently exposed.
> This commit makes it a modifiable property.
> 
> Signed-off-by: Iris Chen <irischenlj@fb.com>
> ---
> v3: Addressed comments by Peter and Cedric.
> v2: Ran ./scripts/checkpatch.pl on the patch and added a description. Fixed comments regarding DEFINE_PROP_BOOL.
> 
>   hw/block/m25p80.c              |  1 +
>   tests/qtest/aspeed_gpio-test.c | 40 +++++++------------------------
>   tests/qtest/aspeed_smc-test.c  | 43 ++++++++++++++++++++++++++++++++++
>   tests/qtest/libqtest.c         | 24 +++++++++++++++++++
>   tests/qtest/libqtest.h         | 22 +++++++++++++++++
>   5 files changed, 98 insertions(+), 32 deletions(-)
> 
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index 430d1298a8..4283b990af 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -1558,6 +1558,7 @@ static int m25p80_pre_save(void *opaque)
>   
>   static Property m25p80_properties[] = {
>       /* This is default value for Micron flash */
> +    DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false),
>       DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF),
>       DEFINE_PROP_UINT8("spansion-cr1nv", Flash, spansion_cr1nv, 0x0),
>       DEFINE_PROP_UINT8("spansion-cr2nv", Flash, spansion_cr2nv, 0x8),
> diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
> index c1003f2d1b..bac63e8742 100644
> --- a/tests/qtest/aspeed_gpio-test.c
> +++ b/tests/qtest/aspeed_gpio-test.c
> @@ -28,30 +28,6 @@
>   #include "qapi/qmp/qdict.h"
>   #include "libqtest-single.h"
>   
> -static bool qom_get_bool(QTestState *s, const char *path, const char *property)
> -{
> -    QDict *r;
> -    bool b;
> -
> -    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
> -                     "{ 'path': %s, 'property': %s } }", path, property);
> -    b = qdict_get_bool(r, "return");
> -    qobject_unref(r);
> -
> -    return b;
> -}
> -
> -static void qom_set_bool(QTestState *s, const char *path, const char *property,
> -                         bool value)
> -{
> -    QDict *r;
> -
> -    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
> -                     "{ 'path': %s, 'property': %s, 'value': %i } }",
> -                     path, property, value);
> -    qobject_unref(r);
> -}
> -
>   static void test_set_colocated_pins(const void *data)
>   {
>       QTestState *s = (QTestState *)data;
> @@ -60,14 +36,14 @@ static void test_set_colocated_pins(const void *data)
>        * gpioV4-7 occupy bits within a single 32-bit value, so we want to make
>        * sure that modifying one doesn't affect the other.
>        */
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
> -    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
> -    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
> -    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
> -    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
> -    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
> +    qtest_qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
> +    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
> +    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
> +    g_assert(qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
> +    g_assert(!qtest_qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
>   }
>   
>   int main(int argc, char **argv)
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 87b40a0ef1..ec233315e6 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -26,6 +26,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/bswap.h"
>   #include "libqtest-single.h"
> +#include "qemu/bitops.h"
>   
>   /*
>    * ASPEED SPI Controller registers
> @@ -40,6 +41,7 @@
>   #define   CTRL_FREADMODE       0x1
>   #define   CTRL_WRITEMODE       0x2
>   #define   CTRL_USERMODE        0x3
> +#define SR_WEL BIT(1)
>   
>   #define ASPEED_FMC_BASE    0x1E620000
>   #define ASPEED_FLASH_BASE  0x20000000
> @@ -49,6 +51,8 @@
>    */
>   enum {
>       JEDEC_READ = 0x9f,
> +    RDSR = 0x5,
> +    WRDI = 0x4,
>       BULK_ERASE = 0xc7,
>       READ = 0x03,
>       PP = 0x02,
> @@ -348,6 +352,44 @@ static void test_write_page_mem(void)
>       flash_reset();
>   }
>   
> +static void test_read_status_reg(void)
> +{
> +    uint8_t r;
> +
> +    spi_conf(CONF_ENABLE_W0);
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, 0);
> +    g_assert(!qtest_qom_get_bool
> +            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WREN);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, SR_WEL);
> +    g_assert(qtest_qom_get_bool
> +            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
> +
> +    spi_ctrl_start_user();
> +    writeb(ASPEED_FLASH_BASE, WRDI);
> +    writeb(ASPEED_FLASH_BASE, RDSR);
> +    r = readb(ASPEED_FLASH_BASE);
> +    spi_ctrl_stop_user();
> +
> +    g_assert_cmphex(r & SR_WEL, ==, 0);
> +    g_assert(!qtest_qom_get_bool
> +            (global_qtest, "/machine/soc/fmc/ssi.0/child[0]", "write-enable"));
> +
> +    flash_reset();
> +}
> +
>   static char tmp_path[] = "/tmp/qtest.m25p80.XXXXXX";
>   
>   int main(int argc, char **argv)
> @@ -373,6 +415,7 @@ int main(int argc, char **argv)
>       qtest_add_func("/ast2400/smc/write_page", test_write_page);
>       qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
>       qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
> +    qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg);
>   
>       ret = g_test_run();
>   
> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
> index 228357f1ea..a9904eba82 100644
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -1423,3 +1423,27 @@ void qtest_client_inproc_recv(void *opaque, const char *str)
>       g_string_append(qts->rx, str);
>       return;
>   }
> +
> +void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
> +                         bool value)
> +{
> +    QDict *r;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
> +                     "{ 'path': %s, 'property': %s, 'value': %i } }",
> +                     path, property, value);
> +    qobject_unref(r);
> +}
> +
> +bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property)
> +{
> +    QDict *r;
> +    bool b;
> +
> +    r = qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
> +                     "{ 'path': %s, 'property': %s } }", path, property);
> +    b = qdict_get_bool(r, "return");
> +    qobject_unref(r);
> +
> +    return b;
> +}
> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
> index 4ab0cad326..94b187837d 100644
> --- a/tests/qtest/libqtest.h
> +++ b/tests/qtest/libqtest.h
> @@ -783,4 +783,26 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
>                       void (*send)(void*, const char*));
>   
>   void qtest_client_inproc_recv(void *opaque, const char *str);
> +
> +/**
> + * qtest_qom_set_bool:
> + * @s: QTestState instance to operate on.
> + * @path: Path to the property being set.
> + * @property: Property being set.
> + * @value: Value to set the property.
> + *
> + * Set the property with passed in value.
> + */
> +void qtest_qom_set_bool(QTestState *s, const char *path, const char *property,
> +                         bool value);
> +
> +/**
> + * qtest_qom_get_bool:
> + * @s: QTestState instance to operate on.
> + * @path: Path to the property being retrieved.
> + * @property: Property from where the value is being retrieved.
> + *
> + * Returns: Value retrieved from property.
> + */
> +bool qtest_qom_get_bool(QTestState *s, const char *path, const char *property);
>   #endif


