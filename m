Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51613559302
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:07:05 +0200 (CEST)
Received: from localhost ([::1]:50380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4cT9-0005fv-Sh
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4cRD-0004Lk-0V
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:05:03 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:48733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o4cRA-00065I-FH
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:05:02 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5EBBC26D57;
 Fri, 24 Jun 2022 06:04:49 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 24 Jun
 2022 08:04:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a81a772c-1082-49f1-b034-139259178498,
 5EF2319963E9DB1A14486A5EC8730A2EE4B20F29) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <68036e04-37a5-dee8-030f-ad2340d6406e@kaod.org>
Date: Fri, 24 Jun 2022 08:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/2] hw: m25p80: add tests for write protect (WP# and
 SRWD bit)
Content-Language: en-US
To: Iris Chen <irischenlj@fb.com>
CC: <pdel@fb.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
 <patrick@stwcx.xyz>, <alistair@alistair23.me>, <kwolf@redhat.com>,
 <hreitz@redhat.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <pbonzini@redhat.com>, <qemu-block@nongnu.org>, <dz4list@gmail.com>
References: <20220617220642.2301951-1-irischenlj@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220617220642.2301951-1-irischenlj@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2ab3124f-8e7a-48dc-8a50-20ebcb6a720b
X-Ovh-Tracer-Id: 6053119377840180100
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudefkedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepugiigehlihhsthesghhmrghilhdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Could please resend with a Sob tag ?

Thanks,

C.


On 6/18/22 00:06, Iris Chen wrote:
> ---
> Fixing suggestions to move testing related code to a different commit.
> 
>   tests/qtest/aspeed_smc-test.c | 62 +++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index ec233315e6..7786addfb8 100644
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
> +    /* default case: WP# is high and SRWD is low -> status register writable */
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
> +    /* WP# high and SRWD high -> status register writable */
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
> +    /* WP# low and SRWD low -> status register writable */
> +    qtest_set_irq_in(global_qtest,
> +                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 0);
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
> +    /* WP# low and SRWD high -> status register NOT writable */
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
> +    qtest_set_irq_in(global_qtest,
> +                     "/machine/soc/fmc/ssi.0/child[0]", "WP#", 0, 1);
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


