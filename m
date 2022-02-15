Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83724B74AF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:28:29 +0100 (CET)
Received: from localhost ([::1]:38402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3Uy-0006Ny-Ub
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:28:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nK3MW-0006Ha-Bb; Tue, 15 Feb 2022 14:19:46 -0500
Received: from [2001:738:2001:2001::2001] (port=40070 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nK3MQ-00053p-3h; Tue, 15 Feb 2022 14:19:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 15BF5745712;
 Tue, 15 Feb 2022 20:19:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E03537456FE; Tue, 15 Feb 2022 20:19:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DE1417456E3;
 Tue, 15 Feb 2022 20:19:16 +0100 (CET)
Date: Tue, 15 Feb 2022 20:19:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH 8/9] target/ppc: Introduce a vhyp framework for nested
 HV support
In-Reply-To: <5892f53e-10df-2a69-63c6-5f5901384bb8@kaod.org>
Message-ID: <2f25a033-aaf8-ba88-1d9f-81745ffba392@eik.bme.hu>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-9-npiggin@gmail.com>
 <5892f53e-10df-2a69-63c6-5f5901384bb8@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1376983326-1644952756=:60188"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1376983326-1644952756=:60188
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 15 Feb 2022, Cédric Le Goater wrote:
> On 2/15/22 04:16, Nicholas Piggin wrote:
>> Introduce virtual hypervisor methods that can support a "Nested KVM HV"
>> implementation using the bare metal 2-level radix MMU, and using HV
>> exceptions to return from H_ENTER_NESTED (rather than cause interrupts).
>> 
>> HV exceptions can now be raised in the TCG spapr machine when running a
>> nested KVM HV guest. The main ones are the lev==1 syscall, the hdecr,
>> hdsi and hisi, hv fu, and hv emu, and h_virt external interrupts.
>> 
>> HV exceptions are intercepted in the exception handler code and instead
>> of causing interrupts in the guest and switching the machine to HV mode,
>> they go to the vhyp where it may exit the H_ENTER_NESTED hcall with the
>> interrupt vector numer as return value as required by the hcall API.
>> 
>> Address translation is provided by the 2-level page table walker that is
>> implemented for the bare metal radix MMU. The partition scope page table
>> is pointed to the L1's partition scope by the get_pate vhc method.
>> 
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   hw/ppc/pegasos2.c        |  6 ++++
>>   hw/ppc/spapr.c           |  6 ++++
>>   target/ppc/cpu.h         |  2 ++
>>   target/ppc/excp_helper.c | 76 ++++++++++++++++++++++++++++++++++------
>>   target/ppc/mmu-radix64.c | 15 ++++++--
>>   5 files changed, 92 insertions(+), 13 deletions(-)
>> 
>> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
>> index 298e6b93e2..d45008ac71 100644
>> --- a/hw/ppc/pegasos2.c
>> +++ b/hw/ppc/pegasos2.c
>> @@ -449,6 +449,11 @@ static target_ulong pegasos2_rtas(PowerPCCPU *cpu, 
>> Pegasos2MachineState *pm,
>>       }
>>   }
>>   +static bool pegasos2_cpu_in_nested(PowerPCCPU *cpu)
>> +{
>> +    return false;
>> +}
>> +
>>   static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU 
>> *cpu)
>>   {
>>       Pegasos2MachineState *pm = PEGASOS2_MACHINE(vhyp);
>> @@ -504,6 +509,7 @@ static void pegasos2_machine_class_init(ObjectClass 
>> *oc, void *data)
>>       mc->default_ram_id = "pegasos2.ram";
>>       mc->default_ram_size = 512 * MiB;
>>   +    vhc->cpu_in_nested = pegasos2_cpu_in_nested;
>>       vhc->hypercall = pegasos2_hypercall;
>>       vhc->cpu_exec_enter = vhyp_nop;
>>       vhc->cpu_exec_exit = vhyp_nop;
>
>
> I don't think you need to worry about the pegasos2 machine as it only
> implements a few of the PPCVirtualHypervisorClass handlers and it can
> not run any of these virtualization features. I would drop this part.

I don't know anything about HV and running it nested but I'm sure pegasos2 
does not run with it as the hardware does not have HV (or radix MMU which 
is mentioned in the commit message above) and I've only used vhyp here to 
avoid having to modify vof and be able to use the same vof.bin that we 
have. This was the simplest way but it probably does not work with KVM 
either so I agree that unless it's required to implement this method for 
all machines using vhyp then this should not be needed for pegasos2. We 
only really need hypercall to be able to use VOF which is needed for 
booting OSes as the board firmware is not redistributable.

If this gets in the way we could replace it with some other hypercall 
method (there was some discussion during the review of the series adding 
VOF support to pegasos2, we could support MOL OSI or some own solution 
instead) if VOF supported these, but I did not want to touch VOF so went 
with the simplest working solution.

Regards,
BALATON Zoltan
--3866299591-1376983326-1644952756=:60188--

