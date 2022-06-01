Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA0C539DF1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 09:16:13 +0200 (CEST)
Received: from localhost ([::1]:58760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwIaS-0002yV-3t
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 03:16:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwIUx-0001nG-IZ
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:10:31 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:43941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nwIUv-0003Ia-Bo
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 03:10:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.147])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DC1F827C20;
 Wed,  1 Jun 2022 07:10:21 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 1 Jun 2022
 09:10:21 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033362c8d4-2b5f-4d26-b275-f84bed73a068,
 A963F33A9D1A618F9A1E828761F10BD73193B711) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <983fc0e3-6166-74d4-1164-161c277e4a96@kaod.org>
Date: Wed, 1 Jun 2022 09:10:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RFC 0/1] i2c/aspeed: Add slave device handling in new register
 mode
Content-Language: en-US
To: Peter Delevoryas <pdel@fb.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <zhdaniel@fb.com>,
 <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
 <steven_lee@aspeedtech.com>, <k.jensen@samsung.com>, Joe Komlodi
 <komlodi@google.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>
References: <20220525205024.1158075-1-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220525205024.1158075-1-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fe5d5f81-22b4-463b-9fdc-867078678a5a
X-Ovh-Tracer-Id: 1215127476620987381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeelgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeutdeltdeggeeludehteeuvddtjeefudeglefhffdttddvudetkefgleetvdfffeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprghnughrvgifsegrjhdrihgurdgruh
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

[ Adding Joe ]

On 5/25/22 22:50, Peter Delevoryas wrote:
> The AST2600/AST1030 new register mode patches[1] and the I2C slave device
> patches[2] will be really useful, but we still need DMA slave device
> handling in the new register mode too for the use-cases I'm thinking of
> (OpenBIC Zephyr kernel using Aspeed SDK drivers[3]).
> 
> My test images are on Github[4]. They can be used with the ast1030-evb, or
> the oby35-cl and oby35-bb machines in the fb qemu branch[5].
> 
> I'm submitting this as an RFC cause I just want to see how other people
> expect these changes to be made based on the previously submitted "new
> register mode" and "old register mode slave device" patches.


Currently, my preferred approach would be to start with Joe's patchset
because the registerfields conversion is a huge effort and it's adding
new mode support which should cover the needs for the AST1030 SoC [1].

Troy, could you please confirm this is OK with you ? I have pushed
the patches on :

   https://github.com/legoater/qemu/commits/aspeed-7.1

Then, adding slave support for old [2] and new mode (this patch)
shouldn't be too much of a problem since they are small.

we lack a test case for this controller and writing a I2C Aspeed bus
driver for qtest is not an easy task.

It might be easier to start an ast2600-evb machine with a lightweight
userspace (buildroot, I can host that somewhere on GH) and run some I2C
get/set/detect commands from a python/expect framework, like avocado.
I2C devices can be added on the command line for the purpose.


Thanks,

C.

  
> Thanks,
> Peter
> 
> [1] https://patchwork.kernel.org/project/qemu-devel/list/?series=626028&archive=both
> [2] https://patchwork.kernel.org/project/qemu-devel/list/?series=627914&archive=both
> [3] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L1362-L1368
> [4] https://github.com/peterdelevoryas/OpenBIC/releases/tag/oby35-cl-2022.13.01
> [5] https://github.com/facebook/openbmc-qemu
> 
> Peter Delevoryas (1):
>    i2c/aspeed: Add slave device handling in new register mode
> 
>   hw/i2c/aspeed_i2c.c         | 118 ++++++++++++++++++++++++++++++++++--
>   include/hw/i2c/aspeed_i2c.h |  14 +++--
>   2 files changed, 124 insertions(+), 8 deletions(-)
> 


