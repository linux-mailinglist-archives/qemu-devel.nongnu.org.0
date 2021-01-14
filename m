Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B7C2F6563
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:06:54 +0100 (CET)
Received: from localhost ([::1]:39726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l059B-0004CI-OJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l052k-00026l-Ey
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:00:14 -0500
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:58569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1l052h-00018H-T0
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:00:14 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 4C695231676;
 Thu, 14 Jan 2021 16:59:59 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 14 Jan
 2021 16:59:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00388bc89b7-cbe8-4be9-8d74-fcfb2ec391f6,
 7B7BC4A7E5590C2C5C4BA269602926DB4F481435) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 0/9] hw/block: m25p80: Fix the mess of dummy bytes needed
 for fast read commands
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>, Francisco
 Iglesias <frasse.iglesias@gmail.com>
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <78a12882-1303-dd6d-6619-96c5e2cbf531@kaod.org>
Date: Thu, 14 Jan 2021 16:59:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114150902.11515-1-bmeng.cn@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 267b0d79-ded8-4c90-968c-87e917200ef6
X-Ovh-Tracer-Id: 7673570815610620743
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddujedmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgefgueeflefgfefgjeeffffhgeeufeduiedtkeekheduveeffeeuhedutdeglefhnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpqhgvmhhurdhorhhgpdhophgvnhhpohifvghrrdighiiipdhoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepsghmvghnghdrtghnsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.237,
 PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Marcin Krzeminski <marcin.krzeminski@nokia.com>,
 Andrew Jeffery <andrew@aj.id.au>, Bin Meng <bin.meng@windriver.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Max Reitz <mreitz@redhat.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 4:08 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> The m25p80 model uses s->needed_bytes to indicate how many follow-up
> bytes are expected to be received after it receives a command. For
> example, depending on the address mode, either 3-byte address or
> 4-byte address is needed.
> 
> For fast read family commands, some dummy cycles are required after
> sending the address bytes, and the dummy cycles need to be counted
> in s->needed_bytes. This is where the mess began.
> 
> As the variable name (needed_bytes) indicates, the unit is in byte.
> It is not in bit, or cycle. However for some reason the model has
> been using the number of dummy cycles for s->needed_bytes. The right
> approach is to convert the number of dummy cycles to bytes based on
> the SPI protocol, for example, 6 dummy cycles for the Fast Read Quad
> I/O (EBh) should be converted to 3 bytes per the formula (6 * 4 / 8).
> 
> Things get complicated when interacting with different SPI or QSPI
> flash controllers. There are major two cases:
> 
> - Dummy bytes prepared by drivers, and wrote to the controller fifo.
>   For such case, driver will calculate the correct number of dummy
>   bytes and write them into the tx fifo. Fixing the m25p80 model will
>   fix flashes working with such controllers.
> - Dummy bytes not prepared by drivers. Drivers just tell the hardware
>   the dummy cycle configuration via some registers, and hardware will
>   automatically generate dummy cycles for us. Fixing the m25p80 model
>   is not enough, and we will need to fix the SPI/QSPI models for such
>   controllers.
> 
> This series fixes the mess in the m25p80 from the flash side first,
> followed by fixes to 3 known SPI controller models that fall into
> the 2nd case above.
> 
> Please note, I have no way to verify patch 7/8/9 because:
> 
> * There is no public datasheet available for the SoC / SPI controller
> * There is no QEMU docs, or details that tell people how to boot either
>   U-Boot or Linux kernel to verify the functionality

The Linux drivers are available in mainline but these branches are more 
up to date since not everything is merged :

  https://github.com/openbmc/linux

u-boot : 

  https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc (ast2400/ast2500)
  https://github.com/openbmc/u-boot/tree/v2019.04-aspeed-openbmc (ast2600)

A quick intro : 

  https://www.qemu.org/docs/master/system/arm/aspeed.html

> 
> These 3 patches are very likely to be wrong. Hence I would like to ask
> help from the original author who wrote these SPI controller models
> to help testing, or completely rewrite these 3 patches to fix things.
> Thanks!

A quick test shows that all Aspeed machines are broken with this patchset.

Please try these command lines : 

  wget https://openpower.xyz/job/openbmc-build/lastSuccessfulBuild/distro=ubuntu,label=builder,target=palmetto/artifact/deploy/images/palmetto/flash-palmetto
  wget https://openpower.xyz/job/openbmc-build/lastSuccessfulBuild/distro=ubuntu,label=builder,target=romulus/artifact/deploy/images/romulus/flash-romulus
  wget https://openpower.xyz/job/openbmc-build/lastSuccessfulBuild/distro=ubuntu,label=builder,target=witherspoon/artifact/deploy/images/witherspoon/obmc-phosphor-image-witherspoon.ubi.mtd

  qemu-system-arm -M witherspoon-bmc -nic user -drive file=obmc-phosphor-image-witherspoon.ubi.mtd,format=raw,if=mtd -nographic
  qemu-system-arm -M romulus-bmc -nic user -drive file=flash-romulus,format=raw,if=mtd -nographic
  qemu-system-arm -M palmetto-bmc -nic user -drive file=flash-palmetto,format=raw,if=mtd -nographic

The Aspeed SMC model has traces to help you in the task.

Thanks,

C. 
 
> Patch 6 is unvalidated with QEMU, mainly because there is no doc to
> tell people how to boot anything to test. But I have some confidence
> based on my read of the ZynqMP manual, as well as some experimental
> testing on a real ZCU102 board.
> 
> Other flash patches can be tested with the SiFive SPI series:
> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=222391
> 
> Cherry-pick patch 16 and 17 from the series above, and switch to
> different flash model to test with the following command:
> 
> $ qemu-system-riscv64 -nographic -M sifive_u -m 2G -smp 5 -kernel u-boot
> 
> I've picked up two for testing:
> 
> QEMU flash: "sst25vf032b"
> 
>   U-Boot 2020.10 (Jan 14 2021 - 21:55:59 +0800)
> 
>   CPU:   rv64imafdcsu
>   Model: SiFive HiFive Unleashed A00
>   DRAM:  2 GiB
>   MMC:
>   Loading Environment from SPIFlash... SF: Detected sst25vf032b with page size 256 Bytes, erase size 4 KiB, total 4 MiB
>   *** Warning - bad CRC, using default environment
> 
>   In:    serial@10010000
>   Out:   serial@10010000
>   Err:   serial@10010000
>   Net:   failed to get gemgxl_reset reset
> 
>   Warning: ethernet@10090000 MAC addresses don't match:
>   Address in DT is                52:54:00:12:34:56
>   Address in environment is       70:b3:d5:92:f0:01
>   eth0: ethernet@10090000
>   Hit any key to stop autoboot:  0
>   => sf probe
>   SF: Detected sst25vf032b with page size 256 Bytes, erase size 4 KiB,
>   total 4 MiB
>   => sf test 1ff000 1000
>   SPI flash test:
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 10 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 170 ticks, 23 KiB/s 0.184 Mbps
>   3 read: 9 ticks, 444 KiB/s 3.552 Mbps
>   Test passed
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 10 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 170 ticks, 23 KiB/s 0.184 Mbps
>   3 read: 9 ticks, 444 KiB/s 3.552 Mbps
> 
> QEMU flash: "mx66u51235f"
> 
>   U-Boot 2020.10 (Jan 14 2021 - 21:55:59 +0800)
> 
>   CPU:   rv64imafdcsu
>   Model: SiFive HiFive Unleashed A00
>   DRAM:  2 GiB
>   MMC:
>   Loading Environment from SPIFlash... SF: Detected mx66u51235f with page size 256 Bytes, erase size 4 KiB, total 64 MiB
>   *** Warning - bad CRC, using default environment
> 
>   In:    serial@10010000
>   Out:   serial@10010000
>   Err:   serial@10010000
>   Net:   failed to get gemgxl_reset reset
> 
>   Warning: ethernet@10090000 MAC addresses don't match:
>   Address in DT is                52:54:00:12:34:56
>   Address in environment is       70:b3:d5:92:f0:01
>   eth0: ethernet@10090000
>   Hit any key to stop autoboot:  0
>   => sf probe
>   SF: Detected mx66u51235f with page size 256 Bytes, erase size 4 KiB, total 64 MiB
>   => sf test 0 8000
>   SPI flash test:
>   0 erase: 1 ticks, 32000 KiB/s 256.000 Mbps
>   1 check: 80 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 83 ticks, 385 KiB/s 3.080 Mbps
>   3 read: 79 ticks, 405 KiB/s 3.240 Mbps
>   Test passed
>   0 erase: 1 ticks, 32000 KiB/s 256.000 Mbps
>   1 check: 80 ticks, 400 KiB/s 3.200 Mbps
>   2 write: 83 ticks, 385 KiB/s 3.080 Mbps
>   3 read: 79 ticks, 405 KiB/s 3.240 Mbps
> 
> I am sure there will be bugs, and I have not tested all flashes affected.
> But I want to send out this series for an early discussion and comments.
> I will continue my testing.
> 
> 
> Bin Meng (9):
>   hw/block: m25p80: Fix the number of dummy bytes needed for Windbond
>     flashes
>   hw/block: m25p80: Fix the number of dummy bytes needed for
>     Numonyx/Micron flashes
>   hw/block: m25p80: Fix the number of dummy bytes needed for Macronix
>     flashes
>   hw/block: m25p80: Fix the number of dummy bytes needed for Spansion
>     flashes
>   hw/block: m25p80: Support fast read for SST flashes
>   hw/ssi: xilinx_spips: Fix generic fifo dummy cycle handling
>   Revert "aspeed/smc: Fix number of dummy cycles for FAST_READ_4
>     command"
>   Revert "aspeed/smc: snoop SPI transfers to fake dummy cycles"
>   hw/ssi: npcm7xx_fiu: Correct the dummy cycle emulation logic
> 
>  include/hw/ssi/aspeed_smc.h |   3 -
>  hw/block/m25p80.c           | 153 ++++++++++++++++++++++++++++--------
>  hw/ssi/aspeed_smc.c         | 116 +--------------------------
>  hw/ssi/npcm7xx_fiu.c        |   8 +-
>  hw/ssi/xilinx_spips.c       |  29 ++++++-
>  5 files changed, 153 insertions(+), 156 deletions(-)
> 


