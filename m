Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E053C45E9BC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 09:57:33 +0100 (CET)
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqX2y-0004sD-L9
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 03:57:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mqX22-000406-L8; Fri, 26 Nov 2021 03:56:34 -0500
Received: from [2001:41c9:1:41f::167] (port=53556
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mqX1z-0000vr-Sy; Fri, 26 Nov 2021 03:56:33 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mqX1m-00038Y-Hr; Fri, 26 Nov 2021 08:56:19 +0000
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
 <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <c60ce410-d9d2-c245-ab19-1af638babd63@ilande.co.uk>
Date: Fri, 26 Nov 2021 08:56:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: danielhb413@gmail.com, openbios@openbios.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/2021 08:40, Cédric Le Goater wrote:

> On 11/26/21 09:01, Mark Cave-Ayland wrote:
>> On 24/11/2021 22:00, Fabiano Rosas wrote:
>>
>>> Fabiano Rosas <farosas@linux.ibm.com> writes:
>>>
>>>> Hi all,
>>>>
>>>> We have this bug in QEMU which indicates that we haven't been able to
>>>> run openbios on a 7450 cpu for quite a long time:
>>>>
>>>> https://gitlab.com/qemu-project/qemu/-/issues/86
>>>>
>>>> OK:
>>>>    $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>>>>
>>>>    >> =============================================================
>>>>    >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>>>    ...
>>>>
>>>> NOK:
>>>>    $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
>>>>    Raise exception at fff08cc4 => 0000004e (00)
>>>>    QEMU: Terminated
>>>>
>>>> The actual issue is straightforward. There is a non-architected
>>>> feature that QEMU has enabled by default that openbios doesn't know
>>>> about. From the user manual:
>>>>
>>>> "The MPC7540 has a set of implementation-specific registers,
>>>> exceptions, and instructions that facilitate very efficient software
>>>> searching of the page tables in memory for when software table
>>>> searching is enabled (HID0[STEN] = 1). This section describes those
>>>> resources and provides three example code sequences that can be used
>>>> in a MPC7540 system for an efficient search of the translation tables
>>>> in software. These three code sequences can be used as handlers for
>>>> the three exceptions requiring access to the PTEs in the page tables
>>>> in memory in this case-instruction TLB miss, data TLB miss on load,
>>>> and data TLB miss on store exceptions."
>>>>
>>>> The current state:
>>>>
>>>> 1) QEMU does not check HID0[STEN] and makes the feature always enabled
>>>> by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
>>>> instead of the generic POWERPC_MMU_32B.
>>>>
>>>> 2) openbios does not recognize the PVRs for those cpus and also does
>>>> not have any handlers for the software TLB exceptions (vectors 0x1000,
>>>> 0x1100, 0x1200).
>>>>
>>>> Some assumptions (correct me if I'm wrong please):
>>>>
>>>> - openbios is the only firmware we use for the following cpus: 7441,
>>>> 7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
>>>> - without openbios, we cannot have a guest running on these cpus.
>>>>
>>>> So to bring 7450 back to life we would need to either:
>>>>
>>>> a) find another firmware/guest OS code that supports the feature;
>>>>
>>>> b) implement the switching of the feature in QEMU and have the guest
>>>> code enable it only when supported. That would take some fiddling with
>>>> the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
>>>> check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
>>>> SW TLB miss on demand, block access to the TLBMISS register (and
>>>> others) when the feature is off, and so on;
>>>>
>>>> c) leave the feature enabled in QEMU and implement the software TLB
>>>> miss handlers in openbios. The UM provides sample code, so this is
>>>> easy;
>>>>
>>>> d) remove support for software TLB search for the 7450 family and
>>>> switch the cpus to the POWERPC_MMU_32B model. This is by far the
>>>> easiest solution, but could cause problems for any (which?) guest OS
>>>> code that actually uses the feature. All of the existing code for the
>>>> POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
>>>> would be dead code then;
>>>>
>>>> Option (c) seemed to me like a good compromise so this is a patch
>>>> series for openbios doing that and also adding the necessary PVRs so
>>>> we can get a working guest with these cpus without too much effort.
>>>>
>>>> I have also a patch for QEMU adding basic sanity check tests for the
>>>> 7400 and 7450 families. I'll send that separately to the QEMU ml.
>>>>
>>>> Fabiano Rosas (2):
>>>>    ppc: Add support for MPC7450 software TLB miss interrupts
>>>>    ppc: Add PVRs for the MPC7450 family
>>>>
>>>>   arch/ppc/qemu/init.c  |  52 ++++++++++
>>>>   arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
>>>>   2 files changed, 285 insertions(+), 3 deletions(-)
>>>
>>> (Adding Mark because his email got somehow dropped from the original
>>> message)
>>
>>> So with these patches in OpenBIOS we could get a bit further and call
>>> into the Linux kernel using the same image as the one used for the
>>> 7400. However there seems to be no support for the 7450 software TLB in
>>> the kernel. There are only handlers for the 4xx, 8xx and 603 which are
>>> different code altogether. There's no mention of the TLBMISS and
>>> PTEHI/LO registers in the code as well.
>>>
>>> Do we know of any guest OS that implements the 7450 software TLB at
>>> vectors 0x1000, 0x1100 and 0x1200? Otherwise replacing the
>>> POWERPC_MMU_SOFT_74xx model with POWERPC_MMU_32B might be the only way
>>> of getting an OS to run in the 7450 family.
>>
>> My experience of anything other than the default CPUs used on the PPC Mac machines 
>> is basically zero, so you're certainly in new territory :)
>>
>> I could live with your proposed solution c) although it would be nice to guard the 
>> extra vectors so that they remain uninitialised for the non-7450 CPUs. My main 
>> question is if the kernel itself doesn't support software TLBs then does adding the 
>> new code help at all? 
> 
> yes, it helps to boot Linux and MacOS (9 and 10) on those CPUs but you still
> need to replace the mmu model to POWERPC_MMU_32B in QEMU.
> 
>> Or are you eventually planning for solution b) to improve QEMU's 7450 CPU emulation 
>> for developers without real hardware?
> 
> b) would be nice to have but since we don't have any images using it, may
> be it's time to drop support from QEMU.

Right. If we're doing this to say "I can boot a kernel with a 7450 cpu in QEMU" but 
the implementation is different from real hardware, then I'm not sure what the real 
value is. That effectively leaves option b) if someone is willing to do the work, or 
as you say to simply remove the code from QEMU.


ATB,

Mark.

