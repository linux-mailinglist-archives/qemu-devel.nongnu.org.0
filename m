Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5004655FA9D
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:33:54 +0200 (CEST)
Received: from localhost ([::1]:47016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6T8z-0004LQ-8t
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o6T6U-0002El-4l; Wed, 29 Jun 2022 04:31:18 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:42317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o6T6S-000475-96; Wed, 29 Jun 2022 04:31:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D023C275F6;
 Wed, 29 Jun 2022 08:31:13 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 10:31:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b24c70d4-91be-4dae-904a-1144adfb4376,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ff12e1ef-5352-a97a-d7dd-94837ab8cd0d@kaod.org>
Date: Wed, 29 Jun 2022 10:31:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 02/13] hw/i2c/aspeed: Fix DMA len write-enable bit
 handling
Content-Language: en-US
To: Peter Delevoryas <peterdelevoryas@gmail.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-3-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220629033634.3850922-3-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6ede1b23-da7a-437b-8d13-d97c4c2366bf
X-Ovh-Tracer-Id: 995576994929150898
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejgefggffgheejgfdufeeiueffveehteejgfelueekgfegtefgffejhedtgfejgfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphguvghlsehfsgdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
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

On 6/29/22 05:36, Peter Delevoryas wrote:
> I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
> seems to be because the Zephyr i2c driver sets the RX DMA len with the
> RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]
> 
> /* 0x1C : I2CM Master DMA Transfer Length Register   */
> 
> I think we should be checking the write-enable bits on the incoming
> value, not checking the register array. I'm not sure we're even writing
> the write-enable bits to the register array, actually.
> 
> [1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148
> 
> Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   hw/i2c/aspeed_i2c.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index ff33571954..cbaa7c96fc 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>                                                        RX_BUF_LEN) + 1;
>           break;
>       case A_I2CM_DMA_LEN:
> -        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
> -                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
> +        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
> +              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
>           /* If none of the w1t bits are set, just write to the reg as normal. */
>           if (!w1t) {
>               bus->regs[R_I2CM_DMA_LEN] = value;
>               break;
>           }
> -        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
> +        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
>               ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
>                                FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
>           }
> -        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
> +        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
>               ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
>                                FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
>           }


