Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F2065B022
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Jan 2023 11:57:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCITl-000879-Pf; Mon, 02 Jan 2023 05:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCITg-00086t-EL
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:55:36 -0500
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pCITb-00031Q-D0
 for qemu-devel@nongnu.org; Mon, 02 Jan 2023 05:55:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2936A226A4;
 Mon,  2 Jan 2023 10:55:25 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 2 Jan
 2023 11:55:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001321a1e2b-7ee1-4754-b4b9-dbed5726f8e6,
 EB6D15DD045C308F841A27F8E66F545441276E15) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <8407bb7d-2297-058f-4ef3-d490ba85f985@kaod.org>
Date: Mon, 2 Jan 2023 11:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/9] hw/arm/aspeed_ast10x0: Map more peripherals & few
 more fixes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
CC: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>, 
 Peter Delevoryas <pdel@meta.com>, <qemu-arm@nongnu.org>, Cleber Rosa
 <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal
 <bleal@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Troy
 Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Peter Delevoryas <pdel@fb.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>
References: <20221229152325.32041-1-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 83c2233d-2ca0-48d9-ba57-f60e5705adda
X-Ovh-Tracer-Id: 13266760081395911553
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepleehhfdufeeuveejteduleeitdegvdekfedtffegkeekkedvteegudehtdejgfdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhhihhlmhgusehlihhnrghrohdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpshhtvghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdpphgvthgvrhesphhjugdruggvvhdpphguvghlsehmvghtrgdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdptghrohhsrgesrhgvughhrghtrdgtohhmpdhpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdroh
 hrghdpsghlvggrlhesrhgvughhrghtrdgtohhmpdifrghinhgvrhhsmhesrhgvughhrghtrdgtohhmpdhtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdpphguvghlsehfsgdrtghomhdpjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehgeekpdhmohguvgepshhmthhpohhuth
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.802,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/29/22 16:23, Philippe Mathieu-Daudé wrote:
> Trying to fix some bugs triggered running Zephyr.
> 
> Still 2 bugs:
> 
> 1/
> uart:~$ sensor get SYSCLK
> [00:00:23.592,000] <err> os: ***** USAGE FAULT *****
> [00:00:23.593,000] <err> os:   Illegal use of the EPSR
> [00:00:23.593,000] <err> os: r0/a1:  0x00033448  r1/a2:  0x00000000  r2/a3:  0x00047f50
> [00:00:23.593,000] <err> os: r3/a4:  0x00000000 r12/ip:  0x00000000 r14/lr:  0x00000fbd
> [00:00:23.593,000] <err> os:  xpsr:  0x60000000
> [00:00:23.593,000] <err> os: Faulting instruction address (r15/pc): 0x00000000
> [00:00:23.593,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
> [00:00:23.594,000] <err> os: Current thread: 0x38248 (shell_uart)
> [00:00:23.601,000] <err> os: Halting system
> 
> 2/
> uart:~$ mcuboot
> [00:01:04.990,000] <err> os: ***** BUS FAULT *****
> [00:01:04.990,000] <err> os:   Instruction bus error
> [00:01:04.991,000] <err> os: r0/a1:  0x00000000  r1/a2:  0x000ffff0  r2/a3:  0x00047ef0
> [00:01:04.991,000] <err> os: r3/a4:  0x00000010 r12/ip:  0x6df7ecb5 r14/lr:  0x000188ed
> [00:01:04.991,000] <err> os:  xpsr:  0x61000000
> [00:01:04.991,000] <err> os: Faulting instruction address (r15/pc): 0x6df7ecb4
> [00:01:04.991,000] <err> os: >>> ZEPHYR FATAL ERROR 0: CPU exception on CPU 0
> [00:01:04.991,000] <err> os: Current thread: 0x38248 (shell_uart)
> [00:01:04.994,000] <err> os: Halting system
> 
> ----------------
> IN:
> PMSA MPU lookup for reading at 0x0001d400 mmu_idx 65 -> Hit (prot rwx)
> 0x0001d5a2:  6869       ldr      r1, [r5, #4]
> 0x0001d5a4:  4421       add      r1, r4
> 0x0001d5a6:  6883       ldr      r3, [r0, #8]
> 0x0001d5a8:  681c       ldr      r4, [r3]
> 0x0001d5aa:  463a       mov      r2, r7
> 0x0001d5ac:  4633       mov      r3, r6
> 0x0001d5ae:  46a4       mov      ip, r4
> 0x0001d5b0:  e8bd 41f0  pop.w    {r4, r5, r6, r7, r8, lr}
> 0x0001d5b4:  4760       bx       ip
> 
> PMSA MPU lookup for reading at 0x00000008 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for execute at 0x6df7ecb4 mmu_idx 65 -> Hit (prot rwx)
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...at fault address 0x6df7ecb4
> ...with CFSR.IBUSERR
> PMSA MPU lookup for writing at 0x00047ec8 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ecc mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ed0 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ed4 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ed8 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047edc mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ee0 mmu_idx 65 -> Hit (prot rwx)
> PMSA MPU lookup for writing at 0x00047ee4 mmu_idx 65 -> Hit (prot rwx)
> ...taking pending nonsecure exception 5
> ...loading from element 5 of non-secure vector table at 0x14
> ...loaded new PC 0xa0cd
> ----------------
> 
> HACE isn't really functional there. I probably screwed smth while wiring
> the peripheral. Not obvious without access to the datasheet.

The HACE logic is quite complex and the model might be a bit fragile for some
modes. I think accumulation still has some problems.

Here are drivers for it :

   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/crypto/aspeed
   https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/crypto/aspeed_hace_v1.c
   https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/crypto/aspeed_hace.c

Thanks,

C.

> 
> Philippe Mathieu-Daudé (9):
>    hw/watchdog/wdt_aspeed: Map the whole MMIO range
>    hw/arm/aspeed: Use the IEC binary prefix definitions
>    hw/arm/aspeed_ast10x0: Add various unimplemented peripherals
>    hw/arm/aspeed_ast10x0: Map I3C peripheral
>    hw/arm/aspeed_ast10x0: Map the secure SRAM
>    hw/arm/aspeed_ast10x0: Map HACE peripheral
>    hw/misc/aspeed_hace: Do not crash if address_space_map() failed
>    hw/arm/aspeed_ast10x0: Add TODO comment to use Cortex-M4F
>    tests/avocado: Test Aspeed Zephyr SDK v00.01.08 on AST1030 board
> 
>   hw/arm/aspeed_ast10x0.c          | 84 ++++++++++++++++++++++++++++++--
>   hw/arm/aspeed_ast2600.c          |  5 +-
>   hw/arm/aspeed_soc.c              |  6 +--
>   hw/misc/aspeed_hace.c            | 21 +++++---
>   hw/watchdog/wdt_aspeed.c         | 12 +++--
>   include/hw/arm/aspeed_soc.h      | 14 ++++++
>   include/hw/watchdog/wdt_aspeed.h |  2 +-
>   tests/avocado/machine_aspeed.py  | 41 +++++++++++++++-
>   8 files changed, 163 insertions(+), 22 deletions(-)
> 


