Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CA6589FF0
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:37:03 +0200 (CEST)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJemM-0007I9-Bw
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJejk-00051N-HY
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:34:20 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:46737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJejh-0002yk-9G
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 13:34:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.141])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0E6D623F95;
 Thu,  4 Aug 2022 17:33:58 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 19:33:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00155d82933-f9b1-40bd-bf05-b9e45be28877,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e11c4476-3b16-3fe8-7c43-a201e59e827d@kaod.org>
Date: Thu, 4 Aug 2022 19:33:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] cputlb and ssi: cache class to avoid expensive
 object_dynamic_cast_assert (HACK!!!)
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis
 <alistair@alistair23.me>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Yanan Wang
 <wangyanan55@huawei.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20220804092044.2101093-1-alex.bennee@linaro.org>
 <f83417f2-e7b6-d8da-e33d-7e06efaa21b7@kaod.org> <87fsicne53.fsf@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <87fsicne53.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 3e186eb5-0064-4b98-abae-4a92a8cc0f4e
X-Ovh-Tracer-Id: 217580157174844338
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfduudevheeijefftdejffefffelhedvvdefkeduueehheeggeekveejtedutdeknecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgrohgurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggvrhhrrghnghgvsehrvgguhhgrthdrtghomhdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
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

On 8/4/22 18:51, Alex Bennée wrote:
> 
> Cédric Le Goater <clg@kaod.org> writes:
> 
>> Hello Alex,
>>
>> Thanks for putting some time into this problem,
>>
>> On 8/4/22 11:20, Alex Bennée wrote:
>>> Investigating why some BMC models are so slow compared to a plain ARM
>>> virt machines I did some profiling of:
>>>     ./qemu-system-arm -M romulus-bmc -nic user \
>>>       -drive
>>>       file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
>>>       -nographic -serial mon:stdio
>>> And saw that object_dynamic_cast was dominating the profile times.
>>> We
>>> have a number of cases in the CPU hot path and more importantly for
>>> this model in the SSI bus. As the class is static once the object is
>>> created we just cache it and use it instead of the dynamic case
>>> macros.
>>> [AJB: I suspect a proper fix for this is for QOM to support a cached
>>> class lookup, abortive macro attempt #if 0'd in this patch].
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Cc: Cédric Le Goater <clg@kaod.org>
>>
>>
>> Here are some results,
>>
>> * romulus-bmc, OpenBmc login prompt
>>
>>    without : 82s
>>    with    : 56s
> 
> Looks like I lucked out picking the lowest hanging fruit.

That's a huge improvement. I tend to use buildroot mostly for FW and
kernel dev but OpenBMC has become as complex as a common server distro.
The above result is probably faster than real HW, for the AST2400 and
AST2500 at least.


>>
>> * ast2500-evb,execute-in-place=true, U-boot 2019.04 prompt
>>
>>    without : 30s
>>    with    : 22s
>>
>> * witherspoon-bmc,execute-in-place=true, U-boot 2016.07 prompt
>>
>>    without : 5.5s
>>    with    : 4.1s
>>
>> There is definitely an improvement in all scenarios.
>>
>> Applying a similar technique on AspeedSMCClass, I could gain
>> another ~10% and boot the ast2500-evb,execute-in-place=true
>> machine, up to the U-boot 2019.04 prompt, in less then 20s.
> 
> There are some fundamentals to XIP which means they will be slower if
> each instruction is being sucked through io_readx/device emulation

Yes. But when using XIP, there is a huge time difference between two
U-boot versions. See above. It takes 4s to reach the U-boot prompt of
the older 2016.07 and 22s on the newer U-boot 2019.04.

> although I'm not sure what the exact mechanism is because surely a ROM
> can just be mapped into the address space and run from there?

It can and that's the default QEMU mode for the Aspeed machines. The flash
contents is copied in a ROM at 0x0. See commit 1a15311a12fa ("hw/arm/aspeed:
add a 'execute-in-place' property to boot directly from CE0")


That's not exactly how the HW works and there are still some FW (like uboot
on the AST2600 BMC of some Meta boards) which will fetch instructions to
execute from the flash contents region at 0x20000000 and not use the ROM
region copied at 0x0.

>> However, newer u-boot are still quite slow to boot when executing
>> from the flash device.
> 
> For any of those machines? 

Yes. It gets worse with the AST2600, which has 2 CPUs

> Whats the next command line for me to dig into?

Here are images to reproduce.

* U-Boot 2016.07:

   wget https://github.com/openbmc/openbmc/releases/download/2.9.0/obmc-phosphor-image-romulus.static.mtd

   qemu-system-arm -M romulus-bmc -drive file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd -nographic
   qemu-system-arm -M romulus-bmc,execute-in-place=true -drive file=./obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd -nographic

* U-Boot 2019.04:

   wget https://www.kaod.org/qemu/aspeed/romulus/flash-romulus-bmc

   same commands

Thanks,

C.


