Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458A62C34A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:00:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovKoo-0001yE-9d; Wed, 16 Nov 2022 10:59:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovKom-0001x4-64; Wed, 16 Nov 2022 10:59:16 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ovKoi-0005FQ-8B; Wed, 16 Nov 2022 10:59:15 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.162])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 9245013F7D6C9;
 Wed, 16 Nov 2022 16:58:57 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Wed, 16 Nov
 2022 16:58:56 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059ddd4271-9002-4a00-8c95-c3c9d6cb56fb,
 02E7B4D3E773D69B5537C3086E449D6A4A510449) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8dd9ed34-93c3-0638-e152-f619f9e097e6@kaod.org>
Date: Wed, 16 Nov 2022 16:58:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH maybe-7.2 1/3] hw/i2c: only schedule pending master when
 bus is idle
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, <qemu-devel@nongnu.org>
CC: Andrew Jeffery <andrew@aj.id.au>, Keith Busch <kbusch@kernel.org>, Corey
 Minyard <cminyard@mvista.com>, Peter Delevoryas <peter@pjd.dev>,
 <qemu-arm@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 <qemu-block@nongnu.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley
 <joel@jms.id.au>, Klaus Jensen <k.jensen@samsung.com>
References: <20221116084312.35808-1-its@irrelevant.dk>
 <20221116084312.35808-2-its@irrelevant.dk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221116084312.35808-2-its@irrelevant.dk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 852acac2-f7a8-4d34-b566-aff0b8989f7d
X-Ovh-Tracer-Id: 630785426529815544
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeigdekvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehithhssehirhhrvghlvghvrghnthdrughkpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhksghushgthheskhgvrhhnvghlrdhorhhgpdgtmhhinhihrghrugesmhhvihhsthgrrdgtohhmpdhpvghtvghrsehpjhgurdguvghvpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdpjhhksegtohguvg
 gtohhnshhtrhhutghtrdgtohhmrdgruhdpjhhovghlsehjmhhsrdhiugdrrghupdhkrdhjvghnshgvnhesshgrmhhsuhhnghdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 11/16/22 09:43, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> It is not given that the current master will release the bus after a
> transfer ends. Only schedule a pending master if the bus is idle.
> 
> Fixes: 37fa5ca42623 ("hw/i2c: support multiple masters")
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/i2c/aspeed_i2c.c  |  2 ++
>   hw/i2c/core.c        | 37 ++++++++++++++++++++++---------------
>   include/hw/i2c/i2c.h |  2 ++
>   3 files changed, 26 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index c166fd20fa11..1f071a3811f7 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -550,6 +550,8 @@ static void aspeed_i2c_bus_handle_cmd(AspeedI2CBus *bus, uint64_t value)
>           }
>           SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, M_STOP_CMD, 0);
>           aspeed_i2c_set_state(bus, I2CD_IDLE);
> +
> +        i2c_schedule_pending_master(bus->bus);

Shouldn't it be i2c_bus_release() ?

Thanks,

C.


>       }
>   
>       if (aspeed_i2c_bus_pkt_mode_en(bus)) {
> diff --git a/hw/i2c/core.c b/hw/i2c/core.c
> index d4ba8146bffb..bed594fe599b 100644
> --- a/hw/i2c/core.c
> +++ b/hw/i2c/core.c
> @@ -185,22 +185,39 @@ int i2c_start_transfer(I2CBus *bus, uint8_t address, bool is_recv)
>   
>   void i2c_bus_master(I2CBus *bus, QEMUBH *bh)
>   {
> +    I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
> +    node->bh = bh;
> +
> +    QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
> +}
> +
> +void i2c_schedule_pending_master(I2CBus *bus)
> +{
> +    I2CPendingMaster *node;
> +
>       if (i2c_bus_busy(bus)) {
> -        I2CPendingMaster *node = g_new(struct I2CPendingMaster, 1);
> -        node->bh = bh;
> -
> -        QSIMPLEQ_INSERT_TAIL(&bus->pending_masters, node, entry);
> +        /* someone is already controlling the bus; wait for it to release it */
> +        return;
> +    }
>   
> +    if (QSIMPLEQ_EMPTY(&bus->pending_masters)) {
>           return;
>       }
>   
> -    bus->bh = bh;
> +    node = QSIMPLEQ_FIRST(&bus->pending_masters);
> +    bus->bh = node->bh;
> +
> +    QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
> +    g_free(node);
> +
>       qemu_bh_schedule(bus->bh);
>   }
>   
>   void i2c_bus_release(I2CBus *bus)
>   {
>       bus->bh = NULL;
> +
> +    i2c_schedule_pending_master(bus);
>   }
>   
>   int i2c_start_recv(I2CBus *bus, uint8_t address)
> @@ -234,16 +251,6 @@ void i2c_end_transfer(I2CBus *bus)
>           g_free(node);
>       }
>       bus->broadcast = false;
> -
> -    if (!QSIMPLEQ_EMPTY(&bus->pending_masters)) {
> -        I2CPendingMaster *node = QSIMPLEQ_FIRST(&bus->pending_masters);
> -        bus->bh = node->bh;
> -
> -        QSIMPLEQ_REMOVE_HEAD(&bus->pending_masters, entry);
> -        g_free(node);
> -
> -        qemu_bh_schedule(bus->bh);
> -    }
>   }
>   
>   int i2c_send(I2CBus *bus, uint8_t data)
> diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
> index 9b9581d23097..2a3abacd1ba6 100644
> --- a/include/hw/i2c/i2c.h
> +++ b/include/hw/i2c/i2c.h
> @@ -141,6 +141,8 @@ int i2c_start_send(I2CBus *bus, uint8_t address);
>    */
>   int i2c_start_send_async(I2CBus *bus, uint8_t address);
>   
> +void i2c_schedule_pending_master(I2CBus *bus);
> +
>   void i2c_end_transfer(I2CBus *bus);
>   void i2c_nack(I2CBus *bus);
>   void i2c_ack(I2CBus *bus);


