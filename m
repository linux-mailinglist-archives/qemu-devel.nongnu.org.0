Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E532E45D239
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 01:47:23 +0100 (CET)
Received: from localhost ([::1]:49940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq2v4-0000p5-Kp
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 19:47:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mq2sy-0007zc-AZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 19:45:12 -0500
Received: from [2001:738:2001:2001::2001] (port=52805 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mq2st-0005lj-Kn
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 19:45:12 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B74F5748F53;
 Thu, 25 Nov 2021 01:45:00 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 28C1C746353; Thu, 25 Nov 2021 01:45:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 27A807462D3;
 Thu, 25 Nov 2021 01:45:00 +0100 (CET)
Date: Thu, 25 Nov 2021 01:45:00 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the
 G4 family
In-Reply-To: <87pmqpqknn.fsf@linux.ibm.com>
Message-ID: <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, openbios@openbios.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Nov 2021, Fabiano Rosas wrote:
> Fabiano Rosas <farosas@linux.ibm.com> writes:
>
>> Hi all,
>>
>> We have this bug in QEMU which indicates that we haven't been able to
>> run openbios on a 7450 cpu for quite a long time:
>>
>> https://gitlab.com/qemu-project/qemu/-/issues/86
>>
>> OK:
>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>>
>>  >> =============================================================
>>  >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>   ...
>>
>> NOK:
>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int

This CPU appears in PowerMac G4 so maybe better use -machine mac99,via=pmu 
with it as it's strange to put it in a g3beige but that may not matter for 
reproducing the problem.

As for guests, those running on the said PowerMac G4 should have support 
for these CPUs so maybe you can try some Mac OS X versions (or maybe 
MorphOS but that is not the best for debugging as there's no source 
available nor any help from its owners but just to see if it boots it may 
be sufficient, it should work on real PowerMac G4). According to 
<https://en.wikipedia.org/wiki/PowerPC_G4#PowerPC_7450> this CPU was used 
in <https://en.wikipedia.org/wiki/Power_Mac_G4#Digital_Audio/Quicksilver> 
and it runs up to Mac OS 10.4.11. (Although OpenBIOS sets the device tree 
according to a PowerMac3,1 so not sure it's entirely correct for the 
PowerMac3,5 that has a 7450 CPU and if it matters for Mac OS X.)

I asked about this before but got no reply back then:
https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00292.html

This was because pegasos2 should have 7447 but it did not work so 
currently I've set it to 7400 which also works. The original board 
firmware had some problem detecting it but I think that only results in 
wrong CPU speed shown which is only a cosmetic problem, otherwise it seems 
to work. Since pegasos2 does not use OpenBIOS but either VOF or the 
board's original firmware it may be an alternative way to test at least 
7447 which the firmware and guests running on that board should work with. 
At least Debian 8.11 powerpc version had support for pegasos2 and should 
boot, I'm not sure newer versions still work. More info on pegasos2 can be 
found at:
http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos 
and
https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

I don't remember what problem I had with 7447 but if it does not work with 
pegasos2 then maybe there's some other problem with it too. I think it was 
maybe related to TLBs but I don't know and had no time to try again so I 
could be entirely wrong about this.

Regards,
BALATON Zoltan

>>   Raise exception at fff08cc4 => 0000004e (00)
>>   QEMU: Terminated
>>
>> The actual issue is straightforward. There is a non-architected
>> feature that QEMU has enabled by default that openbios doesn't know
>> about. From the user manual:
>>
>> "The MPC7540 has a set of implementation-specific registers,
>> exceptions, and instructions that facilitate very efficient software
>> searching of the page tables in memory for when software table
>> searching is enabled (HID0[STEN] = 1). This section describes those
>> resources and provides three example code sequences that can be used
>> in a MPC7540 system for an efficient search of the translation tables
>> in software. These three code sequences can be used as handlers for
>> the three exceptions requiring access to the PTEs in the page tables
>> in memory in this case-instruction TLB miss, data TLB miss on load,
>> and data TLB miss on store exceptions."
>>
>> The current state:
>>
>> 1) QEMU does not check HID0[STEN] and makes the feature always enabled
>> by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
>> instead of the generic POWERPC_MMU_32B.
>>
>> 2) openbios does not recognize the PVRs for those cpus and also does
>> not have any handlers for the software TLB exceptions (vectors 0x1000,
>> 0x1100, 0x1200).
>>
>> Some assumptions (correct me if I'm wrong please):
>>
>> - openbios is the only firmware we use for the following cpus: 7441,
>> 7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
>> - without openbios, we cannot have a guest running on these cpus.
>>
>> So to bring 7450 back to life we would need to either:
>>
>> a) find another firmware/guest OS code that supports the feature;
>>
>> b) implement the switching of the feature in QEMU and have the guest
>> code enable it only when supported. That would take some fiddling with
>> the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
>> check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
>> SW TLB miss on demand, block access to the TLBMISS register (and
>> others) when the feature is off, and so on;
>>
>> c) leave the feature enabled in QEMU and implement the software TLB
>> miss handlers in openbios. The UM provides sample code, so this is
>> easy;
>>
>> d) remove support for software TLB search for the 7450 family and
>> switch the cpus to the POWERPC_MMU_32B model. This is by far the
>> easiest solution, but could cause problems for any (which?) guest OS
>> code that actually uses the feature. All of the existing code for the
>> POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
>> would be dead code then;
>>
>> Option (c) seemed to me like a good compromise so this is a patch
>> series for openbios doing that and also adding the necessary PVRs so
>> we can get a working guest with these cpus without too much effort.
>>
>> I have also a patch for QEMU adding basic sanity check tests for the
>> 7400 and 7450 families. I'll send that separately to the QEMU ml.
>>
>> Fabiano Rosas (2):
>>   ppc: Add support for MPC7450 software TLB miss interrupts
>>   ppc: Add PVRs for the MPC7450 family
>>
>>  arch/ppc/qemu/init.c  |  52 ++++++++++
>>  arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
>>  2 files changed, 285 insertions(+), 3 deletions(-)
>
> (Adding Mark because his email got somehow dropped from the original
> message)
>
> So with these patches in OpenBIOS we could get a bit further and call
> into the Linux kernel using the same image as the one used for the
> 7400. However there seems to be no support for the 7450 software TLB in
> the kernel. There are only handlers for the 4xx, 8xx and 603 which are
> different code altogether. There's no mention of the TLBMISS and
> PTEHI/LO registers in the code as well.
>
> Do we know of any guest OS that implements the 7450 software TLB at
> vectors 0x1000, 0x1100 and 0x1200? Otherwise replacing the
> POWERPC_MMU_SOFT_74xx model with POWERPC_MMU_32B might be the only way
> of getting an OS to run in the 7450 family.
>
>

