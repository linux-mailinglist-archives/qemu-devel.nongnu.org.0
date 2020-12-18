Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2587D2DDF45
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 08:54:00 +0100 (CET)
Received: from localhost ([::1]:54836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqAaM-0008QJ-ND
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 02:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqAWI-0006oX-4j
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 02:49:46 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33606
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqAWD-0003Xq-DS
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 02:49:45 -0500
Received: from host86-191-183-22.range86-191.btcentralplus.com
 ([86.191.183.22] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kqAWG-0002Rs-G4; Fri, 18 Dec 2020 07:49:44 +0000
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
 <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <e3932dd6-545b-f329-f88f-e8c9694fc35e@ilande.co.uk>
Date: Fri, 18 Dec 2020 07:49:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.191.183.22
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: QOM address space handling
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2020 11:40, Paolo Bonzini wrote:

> On 10/11/20 12:14, Mark Cave-Ayland wrote:
>> There are 2 possible solutions here: 1) ensure QOM objects that add address spaces 
>> during instance init have a corresponding instance finalize function to remove them 
>> or 2) move the creation of address spaces from instance init to realize.
>>
>> Does anyone have any arguments for which solution is preferred?
> 
> I slightly prefer (1) because there could be cases where you also create subdevices 
> using that address space, and in order to set properties of subdevices before 
> realize, you would have to create the subdevices in instance_init as well.

As discussed on IRC, I've been testing this approach but curiously found that if a 
device init function contains address_space_init() then the corresponding finalize 
function is never called during device-introspect-test.

Following on from Markus' comment about there being a refcounting issue, I spent a 
few hours yesterday poking this and indeed that seems to be the problem here: the 
generation of the flatview leaks references to the address space MemoryRegion.

Adding a bit of debugging to object.c's init and finalize paths in this particular 
case shows that the call to address_space_init() in sun4u_iommu.c's iommu_init() 
generates 3 references between the IOMMUMemoryRegion (iommu-sun4u) and its device 
owner (sun4u-iommu) during flatview construction:

#0  memory_region_ref (mr=0x5555565f43b0) at ../softmmu/memory.c:1792
#1  0x0000555555a7050d in flatview_new (mr_root=0x5555565f43b0) at 
../softmmu/memory.c:264
#2  0x0000555555a71d7d in generate_memory_topology (mr=0x5555565f43b0) at 
../softmmu/memory.c:729
#3  0x0000555555a73290 in address_space_update_topology (as=0x5555565f4358) at 
../softmmu/memory.c:1078
#4  0x0000555555a77f01 in address_space_init (as=0x5555565f4358, root=0x5555565f43b0, 
name=0x555555e05eb1 "iommu-as") at ../softmmu/memory.c:2848

#0  memory_region_ref (mr=0x55555664ffb0) at ../softmmu/memory.c:1792
#1  0x0000555555a7063d in flatview_insert (view=0x555556609350, pos=0, 
range=0x7fffffffe0d0) at ../softmmu/memory.c:283
#2  0x0000555555a71aad in render_memory_region (view=0x555556609350, 
mr=0x55555664ffb0, base=0, clip=..., readonly=false, nonvolatile=false) at 
../softmmu/memory.c:662
#3  0x0000555555a71e02 in generate_memory_topology (mr=0x55555664ffb0) at 
../softmmu/memory.c:732
#4  0x0000555555a73284 in address_space_update_topology (as=0x55555664ff58) at 
../softmmu/memory.c:1078
#5  0x0000555555a77ef5 in address_space_init (as=0x55555664ff58, root=0x55555664ffb0, 
name=0x555555e05eb1 "iommu-as") at ../softmmu/memory.c:284

#0  memory_region_ref (mr=0x55555664ffb0) at ../softmmu/memory.c:1792
#1  0x0000555555b2479b in phys_section_add (map=0x5555565f6bd0, 
section=0x7fffffffe100) at ../softmmu/physmem.c:1095
#2  0x0000555555b24b21 in register_multipage (fv=0x555556609350, 
section=0x7fffffffe100) at ../softmmu/physmem.c:1158
#3  0x0000555555b24eea in flatview_add_to_dispatch (fv=0x555556609350, 
section=0x7fffffffe1c0) at ../softmmu/physmem.c:1198
#4  0x0000555555a71e86 in generate_memory_topology (mr=0x55555664ffb0) at 
../softmmu/memory.c:742
#5  0x0000555555a73284 in address_space_update_topology (as=0x55555664ff58) at 
../softmmu/memory.c:1078
#6  0x0000555555a77ef5 in address_space_init (as=0x55555664ff58, root=0x55555664ffb0, 
name=0x555555e05eb1 "iommu-as") at ../softmmu/memory.c:2848

Seemingly it is these references that prevent sun4u-iommu's finalize function from 
being called by the final object_unref() once device-introspect-test for the 
sun4u-iommu device is finished.

Any thoughts as to the best way to resolve this? Certainly one solution is to simply 
move address_space_init()/address_space_destroy() from init/finalize to 
realize/unrealize if Paolo's comment about needing to set up address spaces is no 
longer valid, but then in this case is it possible to add an assert() to prevent 
developers calling address_space_init() from an init function accidentally?


ATB,

Mark.


