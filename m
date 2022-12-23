Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79DA654CD9
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Dec 2022 08:26:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8cQU-0008Km-2y; Fri, 23 Dec 2022 02:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p8cQS-0008Jb-E6
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 02:25:04 -0500
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p8cQQ-0000Tp-71
 for qemu-devel@nongnu.org; Fri, 23 Dec 2022 02:25:03 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.214])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3EA3014E721FB;
 Fri, 23 Dec 2022 08:24:51 +0100 (CET)
Received: from kaod.org (37.59.142.108) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Fri, 23 Dec
 2022 08:24:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S00236c3d1f7-6acd-4512-808c-ddd8db8277b6,
 6165A14F53111BEC995F5AE1DDC318EC39F544DF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <5a647fb8-7e07-eb08-964c-667ba3ffeb0c@kaod.org>
Date: Fri, 23 Dec 2022 08:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/6] hw/arm/aspeed: Fix smpboot[] on big-endian hosts
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Andrew Jeffery <andrew@aj.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Peter Maydell <peter.maydell@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>,
 <qemu-arm@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
 <20221222215549.86872-2-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221222215549.86872-2-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7fbef8e8-796d-4597-b46a-939fdc901a03
X-Ovh-Tracer-Id: 6323898304329190389
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrhedugdduuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdpihdrmhhithhshigrnhhkohesghhmrghilhdrtghomhdpjhhovghlsehjmhhsrdhiugdrrghupdhhshhkihhnnhgvmhhovghnsehgohhoghhlvgdrtghomhdpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprghlihhsthgrihhrsegrlhhishhtrg
 hirhdvfedrmhgvpdhqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhkfhhtihhnghesnhhuvhhothhonhdrtghomhdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/22/22 22:55, Philippe Mathieu-Daudé wrote:
> ARM CPUs fetch instructions in little-endian.
> 
> smpboot[] encoded instructions are written in little-endian.
> This is fine on little-endian host, but on big-endian ones
> the smpboot[] array ends swapped. Use the const_le32()
> macro so the instructions are always in little-endian in the
> smpboot[] array.
> 
> Fixes: 9bb6d14081 ("aspeed: Add boot stub for smp booting")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


>   hw/arm/aspeed.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 55f114ef72..adff9a0d73 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -194,22 +194,22 @@ static void aspeed_write_smpboot(ARMCPU *cpu,
>            * r1 = AST_SMP_MBOX_FIELD_ENTRY
>            * r0 = AST_SMP_MBOX_FIELD_GOSIGN
>            */
> -        0xee100fb0,  /* mrc     p15, 0, r0, c0, c0, 5 */
> -        0xe21000ff,  /* ands    r0, r0, #255          */
> -        0xe59f201c,  /* ldr     r2, [pc, #28]         */
> -        0xe1822000,  /* orr     r2, r2, r0            */
> +        const_le32(0xee100fb0),     /* mrc     p15, 0, r0, c0, c0, 5 */
> +        const_le32(0xe21000ff),     /* ands    r0, r0, #255          */
> +        const_le32(0xe59f201c),     /* ldr     r2, [pc, #28]         */
> +        const_le32(0xe1822000),     /* orr     r2, r2, r0            */
>   
> -        0xe59f1018,  /* ldr     r1, [pc, #24]         */
> -        0xe59f0018,  /* ldr     r0, [pc, #24]         */
> +        const_le32(0xe59f1018),     /* ldr     r1, [pc, #24]         */
> +        const_le32(0xe59f0018),     /* ldr     r0, [pc, #24]         */
>   
> -        0xe320f002,  /* wfe                           */
> -        0xe5904000,  /* ldr     r4, [r0]              */
> -        0xe1520004,  /* cmp     r2, r4                */
> -        0x1afffffb,  /* bne     <wfe>                 */
> -        0xe591f000,  /* ldr     pc, [r1]              */
> -        AST_SMP_MBOX_GOSIGN,
> -        AST_SMP_MBOX_FIELD_ENTRY,
> -        AST_SMP_MBOX_FIELD_GOSIGN,
> +        const_le32(0xe320f002),     /* wfe                           */
> +        const_le32(0xe5904000),     /* ldr     r4, [r0]              */
> +        const_le32(0xe1520004),     /* cmp     r2, r4                */
> +        const_le32(0x1afffffb),     /* bne     <wfe>                 */
> +        const_le32(0xe591f000),     /* ldr     pc, [r1]              */
> +        const_le32(AST_SMP_MBOX_GOSIGN),
> +        const_le32(AST_SMP_MBOX_FIELD_ENTRY),
> +        const_le32(AST_SMP_MBOX_FIELD_GOSIGN)
>       };
>   
>       rom_add_blob_fixed("aspeed.smpboot", poll_mailbox_ready,


