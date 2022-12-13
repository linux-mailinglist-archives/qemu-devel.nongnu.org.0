Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F1F64BBB5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 19:14:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p59mL-00056p-Te; Tue, 13 Dec 2022 13:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p59mJ-00056M-7w
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 13:13:19 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1p59mE-0004mk-6V
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 13:13:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.183])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5A79114B71320;
 Tue, 13 Dec 2022 19:13:08 +0100 (CET)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 13 Dec
 2022 19:13:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001fc3a151f-8a63-4019-a032-d238f3be949e,
 70F1EFD4CFA2BAC2768C5AFE190B601EEBA8C420) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <b270f7de-a0f1-3b1e-5540-550420acef26@kaod.org>
Date: Tue, 13 Dec 2022 19:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>, David
 Gibson <david@gibson.dropbear.id.au>, Jason Wang <jasowang@redhat.com>, Greg
 Kurz <groug@kaod.org>, <qemu-arm@nongnu.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, <qemu-ppc@nongnu.org>
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
 <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
 <a1f4b5a6-0a8a-5a04-8ab6-f3f08b9d36aa@linaro.org>
 <CAFEAcA_F3Z+UPW-wHs8xedYX3TiV8CRQAom0DhefKLFH_Ejgog@mail.gmail.com>
 <b46e4c40-257f-8a89-85b8-8c2806f395be@linaro.org>
 <10186d7a-2df0-2fcf-8eef-8e34bcc2d8cc@kaod.org>
 <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8WF6GXaPt6+=KbaLSP5w+r1dps6fcc21+Um3VFAPDp5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 8deadd3d-be25-4255-97ec-0eaf274b585f
X-Ovh-Tracer-Id: 13885723553303726910
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrfedugdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgfehhfekvdegtdevleekhfeludehgffhtddvieegvdehleffudfghfehheeltdehnecuffhomhgrihhnpegrrhgthhhivhgvrdhorhhgpdhpohifvghrrdhorhhgnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhphhhilhhmugeslhhinhgrrhhordhorhhgpdhqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdgurghnihgvlhhhsgegudefsehgmhgrihhlrdgtohhmpdgsrghlrghtohhnsegvihhkrdgsmhgvrdhhuhdprghlvgigrdgsvghnnhgvvgeslhhinhgrrh
 hordhorhhgpdgrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgdpuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruhdpjhgrshhofigrnhhgsehrvgguhhgrthdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpvggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmpdhqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgpdhgrhhouhhgsehkrghougdrohhrghdpoffvtefjohhsthepmhhohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 12/13/22 18:23, Peter Maydell wrote:
> On Tue, 13 Dec 2022 at 16:53, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 12/13/22 17:27, Richard Henderson wrote:
>>> On 12/13/22 10:21, Peter Maydell wrote:
>>>> It does seem odd, though. We have a value in host endianness
>>>> (the EPAPR_MAGIC constant, which is host-endian by virtue of
>>>> being a C constant). But we're storing it to env->gpr[], which
>>>> is to say the CPUPPCState general purpose register array. Isn't
>>>> that array *also* kept in host endianness order?
>>>
>>> Yes indeed.
>>>
>>>> If so, then the right thing here is "don't swap at all",
>>>
>>> So it would seem...
>>>
>>>> i.e. just "env->gpr[6] = EPAPR_MAGIC;". But that would imply
>>>> that the current code is setting the wrong value for the GPR
>>>> on little-endian hosts, which seems a bit unlikely...
>>>
>>> ... unless this board has only been tested on matching hosts.
>>
>> But these are register default values. Endianness doesn't apply
>> there. Doesn't it ?
> 
> Any time you have a value that's more than 1 byte wide,
> endianness applies in some sense :-) We choose for our
> emulated CPUs typically to keep register values in struct
> fields and variables in the C code in host endianness. This
> is the "obvious" choice given that you want to be able to
> do things like do a simple host add to emulate a guest CPU
> add, but in theory you could store the values the other
> way around if you wanted (then "store register into RAM"
> would be trivial, and "add 1 to register" would require
> extra effort; currently it's the other way round.)
> 
> Anyway, I think that in the virtex_ml507 and sam460ex code
> the use of tswap32() should be removed. In hw/ppc/e500.c
> we get this right:
>      env->gpr[6] = EPAPR_MAGIC;
> 
> We have a Linux kernel boot test in the avocado tests for
> virtex_ml507 -- we really do set up this magic value wrongly
> afaict, but it seems like the kernel doesn't check it (the
> test passes regardless of whether we swap the value or not).
> 
> I think what has happened here is that this bit of code is
> setting up CPU registers for an EPAPR style boot, but the
> test kernel at least doesn't expect that. It boots via the
> code in arch/powerpc/kernel/head_44x.S. That file claims
> in a comment that it expects
>   *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
>   *   r4 - Starting address of the init RAM disk
>   *   r5 - Ending address of the init RAM disk
>   *   r6 - Start of kernel command line string (e.g. "mem=128")
>   *   r7 - End of kernel command line string
> 
> but actually it only cares that r3 == device-tree-blob.
> 
> Documentation/powerpc/booting.rst says the expectation
> (for a non-OpenFirmware boot) is:
>                  r3 : physical pointer to the device-tree block
>                  (defined in chapter II) in RAM
> 
>                  r4 : physical pointer to the kernel itself. This is
>                  used by the assembly code to properly disable the MMU
>                  in case you are entering the kernel with MMU enabled
>                  and a non-1:1 mapping.
> 
>                  r5 : NULL (as to differentiate with method a)
> 
> which isn't the same as what the kernel code actually cares about
> or what the kernel's comment says it cares about...
> 
> So my guess about what's happening here is that the intention
> was that these boards should be able to boot both kernels built
> to be entered directly in the way booting.rst says, and also
> kernels and other guest programs built to assume boot by
> EPAPR firmware, but this bug means that we're only currently
> supporting the first of these two categories. The reason nobody's
> noticed before is presumably that in practice nobody's trying to
> boot the "built to boot from EPAPR firmware" type binary on
> these two boards.
> 
> TLDR: we should drop the "tswap32()" entirely from both files.
Yes. I think so too.

Here are the specs :

    https://web.archive.org/web/20120419173345/https://www.power.org/resources/downloads/Power_ePAPR_APPROVED_v1.1.pdf

See 5.4.1 Boot CPU Initial Register State

Register	Value

MSR		PR=0 supervisor state
		EE=0 interrupts disabled
		ME=0 machine check interrupt disabled
		IP=0 interrupt prefix-- low memory
		IR=0,DR=0 real mode (see note 1)
		IS=0,DS=0 address space 0 (see note 1)
		SF=0, CM=0, ICM=0 32-bit mode
		The state of any additional MSR bits is defined in the
		applicable processor supplement specification.
R3		Effective address of the device tree image.
		Note: This address shall be 8 bytes aligned in memory.
R4		0
R5		0
R6		ePAPR magic value—to distinguish from non-ePAPR-
		compliant firmware
		• For Book III-E CPUs shall be 0x45504150
		• For non-Book III-E CPUs shall be 0x65504150
R7		shall be the size of the boot IMA in bytes
R8		0
R9		0
TCR		WRC=0, no watchdog timer reset will occur (see note 2)
other registers implementation dependent


Thanks,

C.

