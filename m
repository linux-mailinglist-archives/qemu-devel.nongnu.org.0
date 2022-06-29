Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A95DC55FAD8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:43:23 +0200 (CEST)
Received: from localhost ([::1]:59892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TIA-0005te-Ow
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6TAJ-0006UY-82
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:35:16 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:50143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6TAH-0007FA-9k
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:35:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.54])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 97284214F3;
 Wed, 29 Jun 2022 08:35:10 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 10:35:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004542524e1-6b52-49d4-a479-6b6c829acba8,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <193a9752-91dc-89fe-4507-056590b91b85@kaod.org>
Date: Wed, 29 Jun 2022 10:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 04/13] hw/i2c: support multiple masters
Content-Language: en-US
To: Peter Delevoryas <peterdelevoryas@gmail.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>, Corey Minyard
 <cminyard@mvista.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-5-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220629033634.3850922-5-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d90787fd-39f8-4776-8160-777e7628729f
X-Ovh-Tracer-Id: 1062286562410269618
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

Corey,

On 6/29/22 05:36, Peter Delevoryas wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Allow slaves to master the bus by registering a bottom halve. If the bus
> is busy, the bottom half is queued up. When a slave has succesfully
> mastered the bus, the bottom half is scheduled.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> [ clg : - fixed typos in commit log ]
> Message-Id: <20220601210831.67259-4-its@irrelevant.dk>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

If it is OK with you, I plan to include this I2C extension in the
next Aspeed PR.

Thanks,

C.

>   hw/i2c/core.c        | 34 +++++++++++++++++++++++++++++++++-
>   include/hw/i2c/i2c.h | 14 ++++++++++++++
>   2 files changed, 47 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index d0cb2d32fa..145dce6078 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -13,6 +13,7 @@
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qemu/module.h"
> +#include "qemu/main-loop.h"
>   #include "trace.h"
>   
>   #define I2C_BROADCAST 0x00
> @@ -62,6 +63,7 @@ I2CBus *i2c_init_bus(DeviceState *parent, const char *name)
>   
>       bus = I2C_BUS(qbus_new(TYPE_I2C_BUS, parent, name));
>       QLIST_INIT(&bus->current_devs);
> +    QSIMPLEQ_INIT(&bus->pending_masters);
>       vmstate_register(NULL, VMSTATE_INSTANCE_ID_ANY, &vmstate_i2c_bus, bus);
>       return bus;
>   }
> @@ -74,7 +76,7 @@ void i2c_slave_set_address(I2CSlave *dev, uint8_t address)
>   /* Return nonzero if bus is busy.  */
>   int i2c_bus_busy(I2CBus *bus)
>   {
> -    return !QLIST_EMPTY(&bus->current_devs);
> +    return !QLIST_EMPTY(&bus->current_devs) || bus->bh;
>   }
>   
>   bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,
> @@ -180,6 +182,26 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>                                                  : I2C_START_SEND);
>   }
>   
> +void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
> +{
> +    if (i2c_bus_busy(bus)) {
> +        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
> +        node->bh = bh;
> +
> +        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
> +
> +        return;
> +    }
> +
> +    bus->bh = bh;
> +    qemu_bh_schedule(bus->bh);
> +}
> +
> +void i2c_bus_release(I2CBus *bus)
> +{
> +    bus->bh = NULL;
> +}
> +
>   int i2c_start_recv(I2CBus *bus, uint8_t address)
>   {
>       return i2c_do_start_transfer(bus, address, I2C_START_RECV);
> @@ -206,6 +228,16 @@ void i2c_end_transfer(I2CBus *bus)
>           g_free(node);
>       }
>       bus->broadcast = false;
> +
> +    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
> +        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
> +        bus->bh = node->bh;
> +
> +        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
> +        g_free(node);
> +
> +        qemu_bh_schedule(bus->bh);
> +    }
>   }
>   
>   int i2c_send(I2CBus *bus, uint8_t data)
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 5ca3b708c0..be8bb8b78a 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -69,13 +69,25 @@ struct I2CNode {
>       QLIST_ENTRY(I2CNode) next;
>   };
>   
> +typedef struct I2CPendingMaster I2CPendingMaster;
> +
> +struct I2CPendingMaster {
> +    QEMUBH *bh;
> +    QSIMPLEQ_ENTRY(I2CPendingMaster) entry;
> +};
> +
>   typedef QLIST_HEAD(I2CNodeList, I2CNode) I2CNodeList;
> +typedef QSIMPLEQ_HEAD(I2CPendingMasters, I2CPendingMaster) I2CPendingMasters;
>   
>   struct I2CBus {
>       BusState qbus;
>       I2CNodeList current_devs;
> +    I2CPendingMasters pending_masters;
>       uint8_t saved_address;
>       bool broadcast;
> +
> +    /* Set from slave currently mastering the bus. */
> +    QEMUBH *bh;
>   };
>   
>   I2CBus *i2c_init_bus(DeviceState *parent, const char *name);
> @@ -117,6 +129,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
>   
>   void i2c_end_transfer(I2CBus *bus);
>   void i2c_nack(I2CBus *bus);
> +void i2c_bus_master(I2CBus *bus, QEMUBH *bh);
> +void i2c_bus_release(I2CBus *bus);
>   int i2c_send(I2CBus *bus, uint8_t data);
>   uint8_t i2c_recv(I2CBus *bus);
>   bool i2c_scan_bus(I2CBus *bus, uint8_t address, bool broadcast,


