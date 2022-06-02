Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FCB53B3FF
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 09:03:33 +0200 (CEST)
Received: from localhost ([::1]:43762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwerh-0004FT-2r
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 03:03:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nweeu-0001ca-Df
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 02:50:16 -0400
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:59751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nweel-0006SU-IU
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 02:50:14 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.208])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C029F2475E;
 Thu,  2 Jun 2022 06:49:55 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 2 Jun 2022
 08:49:54 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003eec09f61-1463-49aa-a59d-fbc53723d645,
 123C0E545D135716686AEE7B3F9DB382F3F098BA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0eede847-749e-9051-9913-7eda005e265f@kaod.org>
Date: Thu, 2 Jun 2022 08:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC PATCH v2 1/6] hw/i2c/aspeed: rework raise interrupt trace
 event
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, <qemu-arm@nongnu.org>,
 Peter Delevoryas <pdel@fb.com>, Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>, Padmakar Kalghatgi
 <p.kalghatgi@samsung.com>, Damien Hedde <damien.hedde@greensocs.com>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Arun Kumar
 Kashinath Agasar <arun.kka@samsung.com>, Klaus Jensen <k.jensen@samsung.com>
References: <20220601210831.67259-1-its@irrelevant.dk>
 <20220601210831.67259-2-its@irrelevant.dk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220601210831.67259-2-its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7fd29533-59bf-4544-acdb-f3e5a15934b0
X-Ovh-Tracer-Id: 6742733069014502331
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrledugddutdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepkhdrjhgvnhhsvghnsehsrghmshhunhhgrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
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

On 6/1/22 23:08, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Build a single string instead of having several parameters on the trace
> event.
> 
> Suggested-by: Cédric Le Goater <clg@kaod.org>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/i2c/aspeed_i2c.c | 55 +++++++++++++++++++++++++++++++++++----------
>   hw/i2c/trace-events |  2 +-
>   2 files changed, 44 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index 5fce516517a5..576425898b09 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -21,6 +21,7 @@
>   #include "qemu/osdep.h"
>   #include "hw/sysbus.h"
>   #include "migration/vmstate.h"
> +#include "qemu/cutils.h"
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "qemu/error-report.h"
> @@ -31,6 +32,9 @@
>   #include "hw/registerfields.h"
>   #include "trace.h"
>   
> +#define ASPEED_I2C_TRACE_INTR_TEMPLATE \
> +    "pktdone|nak|ack|done|normal|abnormal|"
> +
>   static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>   {
>       AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
> @@ -38,23 +42,50 @@ static inline void aspeed_i2c_bus_raise_interrupt(AspeedI2CBus *bus)
>       uint32_t intr_ctrl_reg = aspeed_i2c_bus_intr_ctrl_offset(bus);
>       bool raise_irq;
>   
> -    trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts],
> -        aspeed_i2c_bus_pkt_mode_en(bus) &&
> -        ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ?
> -                                                               "pktdone|" : "",
> -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK) ? "nak|" : "",
> -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK) ? "ack|" : "",
> -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|"
> -                                                                  : "",
> -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP) ?
> -                                                                "normal|" : "",
> -        SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "abnormal"
> -                                                                   : "");
> +    if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRUPT)) {
> +        static const size_t BUF_SIZE = strlen(ASPEED_I2C_TRACE_INTR_TEMPLATE);
> +        g_autofree char *buf = g_malloc0(BUF_SIZE);
> +
> +        /*
> +         * Remember to update ASPEED_I2C_TRACE_INTR_TEMPLATE if you add a new
> +         * status string.
> +         */
> +
> +        if (aspeed_i2c_bus_pkt_mode_en(bus) &&
> +            ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE)) {
> +            pstrcat(buf, BUF_SIZE, "pktdone|");
> +        }
> +
> +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK)) {
> +            pstrcat(buf, BUF_SIZE, "nak|");
> +        }
> +
> +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK)) {
> +            pstrcat(buf, BUF_SIZE, "ack|");
> +        }
> +
> +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE)) {
> +            pstrcat(buf, BUF_SIZE, "done|");
> +        }
> +
> +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP)) {
> +            pstrcat(buf, BUF_SIZE, "normal|");
> +        }
> +
> +        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL)) {
> +            pstrcat(buf, BUF_SIZE, "abnormal|");
> +        }
> +
> +        trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf);
> +    }
> +

How about :

     if (trace_event_get_state_backends(TRACE_ASPEED_I2C_BUS_RAISE_INTERRUPT)) {
         g_autofree char *buf = g_strdup_printf("%s%s%s%s%s%s",
                aspeed_i2c_bus_pkt_mode_en(bus) &&
                ARRAY_FIELD_EX32(bus->regs, I2CM_INTR_STS, PKT_CMD_DONE) ? "pktdone|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_NAK)? "nak|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, TX_ACK), "ack|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, RX_DONE) ? "done|" : "",
                SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, NORMAL_STOP)? "normal|" : "",
	       SHARED_ARRAY_FIELD_EX32(bus->regs, reg_intr_sts, ABNORMAL) ? "abnormal"  : "");
	
	       trace_aspeed_i2c_bus_raise_interrupt(bus->regs[reg_intr_sts], buf);
     }


Thanks,

C.




>       raise_irq = bus->regs[reg_intr_sts] & bus->regs[intr_ctrl_reg];
> +
>       /* In packet mode we don't mask off INTR_STS */
>       if (!aspeed_i2c_bus_pkt_mode_en(bus)) {
>           bus->regs[reg_intr_sts] &= bus->regs[intr_ctrl_reg];
>       }
> +
>       if (raise_irq) {
>           bus->controller->intr_status |= 1 << bus->id;
>           qemu_irq_raise(aic->bus_get_irq(bus));
> diff --git a/hw/i2c/trace-events b/hw/i2c/trace-events
> index 85e4bddff936..209275ed2dc8 100644
> --- a/hw/i2c/trace-events
> +++ b/hw/i2c/trace-events
> @@ -9,7 +9,7 @@ i2c_recv(uint8_t address, uint8_t data) "recv(addr:0x%02x) data:0x%02x"
>   # aspeed_i2c.c
>   
>   aspeed_i2c_bus_cmd(uint32_t cmd, const char *cmd_flags, uint32_t count, uint32_t intr_status) "handling cmd=0x%x %s count=%d intr=0x%x"
> -aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *str1, const char *str2, const char *str3, const char *str4, const char *str5, const char *str6) "handled intr=0x%x %s%s%s%s%s%s"
> +aspeed_i2c_bus_raise_interrupt(uint32_t intr_status, const char *s) "handled intr=0x%x %s"
>   aspeed_i2c_bus_read(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
>   aspeed_i2c_bus_write(uint32_t busid, uint64_t offset, unsigned size, uint64_t value) "bus[%d]: To 0x%" PRIx64 " of size %u: 0x%" PRIx64
>   aspeed_i2c_bus_send(const char *mode, int i, int count, uint8_t byte) "%s send %d/%d 0x%02x"


