Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5E55EBD95
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:39:38 +0200 (CEST)
Received: from localhost ([::1]:52390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od67t-0006Xm-O6
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:39:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1od5VG-0002Ys-H5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:59:42 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:47783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1od5VD-00060C-UE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 03:59:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.44])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0B3522287A;
 Tue, 27 Sep 2022 07:59:35 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Tue, 27 Sep
 2022 09:59:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003209ff6a8-693c-4e54-b996-f18c93373fec,
 12A65CACE92C1DACCE6E97948814F03D28E096F2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <70ae04a8-aa84-584d-206c-ed9692536ab0@kaod.org>
Date: Tue, 27 Sep 2022 09:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH] ast2600: Fix CPU features
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, 
 Andrew Jeffery <andrew@aj.id.au>
References: <20220926062608.3930789-1-clg@kaod.org>
 <44c772eb-cf7a-c6ac-8eed-8cc35501e46a@kaod.org>
 <CACPK8XduDO=ORw1rj5E2bdzCigv3+_UR5SNF3FA8oJPnBr=S8w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XduDO=ORw1rj5E2bdzCigv3+_UR5SNF3FA8oJPnBr=S8w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9732928f-a99b-4ff9-b792-b0768d060826
X-Ovh-Tracer-Id: 12494955692652399398
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegfedguddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueeludejieffuddvfeegffettdegtdefudeikefftdetuddtkeetueevtdefheeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegrnhgurhgvfiesrghjrdhiugdrrghupdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/22 03:49, Joel Stanley wrote:
> On Mon, 26 Sept 2022 at 07:05, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 9/26/22 08:26, Cédric Le Goater wrote:
>>> Currently, the CPU features exposed to the AST2600 QEMU machines are :
>>>
>>>     half thumb fastmult vfp edsp neon vfpv3 tls vfpv4 idiva idivt
>>>     vfpd32 lpae evtstrm
>>>
>>> But, the features of the Cortex A7 CPU on the Aspeed AST2600 A3 SoC
>>> are :
>>>
>>>     half thumb fastmult vfp edsp vfpv3 vfpv3d16 tls vfpv4 idiva idivt
>>>     lpae evtstrm
>>>
>>> The vfpv3d16 feature bit is common to both vfpv3 and vfpv4, and for
>>> this SoC, QEMU should advertise a VFPv4 unit with 16 double-precision
>>> registers, and not 32 registers.
>>>
>>> Drop neon support and hack the default mvfr0 register value of the
>>> cortex A7 to advertise 16 registers.
>>>
>>> How can that be done cleanly ? Should we :
>>>
>>>    * introduce a new A7 CPU with its own _initfn routine ?
>>>    * introduce a new CPU property to set the number of "Advanced SIMD
>>>      and floating-point" registers in arm_cpu_realizefn() ?
>>
>> This is a note in the Cortex A7 MPCore Technical reference saying :
>>
>> "When FPU option is selected without NEON, the FPU is VFPv4-D16 and uses 16
>> double-precision registers. When the FPU is implemented with NEON, the FPU is
>> VFPv4-D32 and uses 32 double-precision registers. This register bank is shared
>> with NEON."
> 
> The datasheet only has this to say:
> 
> "1.2GHz dual-core ARM Cortex A7 (r0p5) 32-bit CPU with FPU"
> 
> With no details about the FPU. The hardware is a golden reference though:
> 
>   fpsid: 41023075
>   mvfr0: 10110221
>   mvfr1: 11000011
> 
> $ bitfield mvfr0 0x10110221
> decoding as Media and VFP Feature Register 0
> 0x10110221 [269550113]
>        A_SIMD registers: 0x1 [16 x 64-bit registers]
>        Single precision: 0x2 [Supported, VFPv4 or VFPv3]
>        Double precision: 0x2 [Supported, VFPv4 or VFPv3]
> VFP exception trapping: 0x0 [Not supported]
>                  Divide: 0x1 [Hardware divide is supported]
>             Square Root: 0x1 [Hardware square root supported]
>           Short vectors: 0x0 [Not supported]
>      VFP Rounding Modes: 0x1 [All modes supported]
> 
> $ bitfield mvfr1 0x11000011
> decoding as Media and VFP Feature Register 1
> 0x11000011 [285212689]
>                 FZ: 0x1
>         D_NaN mode: 0x1
> A_SIMD load/store: 0x0
>     A_SIMD integer: 0x0
>        A_SIMD SPFP: 0x0
>        A_SIMD HPFP: 0x0
>           VFP HPFP: 0x2
>        A_SIMD FMAC: 0x1
> 
> As you say, no NEON  and 16 64-bit registers.
> 
>>
>> Could we deduce the number of registers from the availability of the NEON
>> feature, on A7 only ?
> 
> We certainly should make the NEON property match the mvfr1 value.
> Linux tests for NEON with this:
> 
>     (fmrx(MVFR1) & 0x000fff00) == 0x00011100)
> 
> https://elixir.bootlin.com/linux/v5.19/source/arch/arm/vfp/vfpmodule.c#L812


ok. I will resend with 2 patches. An obvious first one removing NEON
from the AsT2600 SoC and a second decreasing the number of registers
to 16 when NEON is off.


Thanks,

C.

> Cheers,
> 
> Joel
> 
>>>
>>> This problem was raised by a buildroot rootfs compiled with vfpv4.
>>> Boot went fine under QEMU but on real HW, user space binaries had
>>> issues with output. Compiling buildroot with vfpv4d16 fixed it and
>>> I didn't dig further. Nevertheless, it would be nice to catch such
>>> issues with QEMU.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>    hw/arm/aspeed_ast2600.c | 2 ++
>>>    target/arm/cpu_tcg.c    | 2 +-
>>>    2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
>>> index dcdc9bc54456..af987fd418ec 100644
>>> --- a/hw/arm/aspeed_ast2600.c
>>> +++ b/hw/arm/aspeed_ast2600.c
>>> @@ -330,6 +330,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>>>
>>>            object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>>>                                    &error_abort);
>>> +        object_property_set_bool(OBJECT(&s->cpu[i]), "neon", false,
>>> +                                &error_abort);
>>>            object_property_set_link(OBJECT(&s->cpu[i]), "memory",
>>>                                     OBJECT(s->memory), &error_abort);
>>>
>>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>>> index 98b5ba216041..b3f93783a061 100644
>>> --- a/target/arm/cpu_tcg.c
>>> +++ b/target/arm/cpu_tcg.c
>>> @@ -545,7 +545,7 @@ static void cortex_a7_initfn(Object *obj)
>>>        cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A7;
>>>        cpu->midr = 0x410fc075;
>>>        cpu->reset_fpsid = 0x41023075;
>>> -    cpu->isar.mvfr0 = 0x10110222;
>>> +    cpu->isar.mvfr0 = 0x10110221; /* SIMDREG == 0x1 -> 16 registers */
>>>        cpu->isar.mvfr1 = 0x11111111;
>>>        cpu->ctr = 0x84448003;
>>>        cpu->reset_sctlr = 0x00c50078;
>>


