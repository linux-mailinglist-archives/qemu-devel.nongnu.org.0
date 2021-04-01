Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953573511F0
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 11:23:29 +0200 (CEST)
Received: from localhost ([::1]:37472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRtXz-0006Ri-2x
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 05:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lRtVr-0005jr-A9
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:21:15 -0400
Received: from 6.mo52.mail-out.ovh.net ([188.165.49.222]:41224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lRtVk-0005q4-Py
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 05:21:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id B5F7F256511;
 Thu,  1 Apr 2021 11:21:03 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 1 Apr 2021
 11:21:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005794a95e5-4728-461a-93de-6597a2600b9d,
 CB1DFE2733DABF7F0B1A836A5F31017E824F9DC1) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 86.210.153.104
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
 <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
 <YGPI5vgoI8JDO1HN@yekko.fritz.box>
 <1e16fe5e-f20a-f882-d18a-113cf48c934c@kaod.org>
 <YGU3BPTJK5qE+iNG@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <2b5c0cf0-e269-c3bd-a537-6962e316ef32@kaod.org>
Date: Thu, 1 Apr 2021 11:21:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGU3BPTJK5qE+iNG@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cfc8d5c9-dd9e-4edf-a703-b925b0bfe805
X-Ovh-Tracer-Id: 10412040863915477938
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeigedguddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgeelgfejveehieefffduueehvdevfedtleeiudekjeegveeigfeifefhtdfffedtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehgrhhouhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/21 4:59 AM, David Gibson wrote:
> On Wed, Mar 31, 2021 at 05:18:45PM +0200, Cédric Le Goater wrote:
>> On 3/31/21 2:57 AM, David Gibson wrote:
>>> On Mon, Mar 29, 2021 at 03:32:37PM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 3/29/21 12:32 PM, Cédric Le Goater wrote:
>>>>> On 3/29/21 6:20 AM, David Gibson wrote:
>>>>>> On Thu, Mar 25, 2021 at 09:56:04AM +0100, Cédric Le Goater wrote:
>>>>>>> On 3/25/21 3:10 AM, David Gibson wrote:
>>>>>>>> On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 3/22/21 10:03 PM, David Gibson wrote:
>>>>>>>>>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
>>>>>>>>>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
>>>>>>>>>>> topology_core_cpumask") cause a regression in the pseries machine when
>>>>>>>>>>> defining certain SMP topologies [1]. The reasoning behind the change is
>>>>>>>>>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
>>>>>>>>>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
>>>>>>>>>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
>>>>>>>>>>> far as the kernel understanding of SMP topologies goes, both masks are
>>>>>>>>>>> equivalent.
>>>>>>>>>>>
>>>>>>>>>>> Further discussions in the kernel mailing list [2] shown that the
>>>>>>>>>>> powerpc kernel always considered that the number of sockets were equal
>>>>>>>>>>> to the number of NUMA nodes. The claim is that it doesn't make sense,
>>>>>>>>>>> for Power hardware at least, 2+ sockets being in the same NUMA node. The
>>>>>>>>>>> immediate conclusion is that all SMP topologies the pseries machine were
>>>>>>>>>>> supplying to the kernel, with more than one socket in the same NUMA node
>>>>>>>>>>> as in [1], happened to be correctly represented in the kernel by
>>>>>>>>>>> accident during all these years.
>>>>>>>>>>>
>>>>>>>>>>> There's a case to be made for virtual topologies being detached from
>>>>>>>>>>> hardware constraints, allowing maximum flexibility to users. At the same
>>>>>>>>>>> time, this freedom can't result in unrealistic hardware representations
>>>>>>>>>>> being emulated. If the real hardware and the pseries kernel don't
>>>>>>>>>>> support multiple chips/sockets in the same NUMA node, neither should we.
>>>>>>>>>>>
>>>>>>>>>>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
>>>>>>>>>>> pseries machine. qtest changes were made to adapt to this new
>>>>>>>>>>> condition.
>>>>>>>>>>
>>>>>>>>>> Oof.  I really don't like this idea.  It means a bunch of fiddly work
>>>>>>>>>> for users to match these up, for no real gain.  I'm also concerned
>>>>>>>>>> that this will require follow on changes in libvirt to not make this a
>>>>>>>>>> really cryptic and irritating point of failure.
>>>>>>>>>
>>>>>>>>> Haven't though about required Libvirt changes, although I can say that there
>>>>>>>>> will be some amount to be mande and it will probably annoy existing users
>>>>>>>>> (everyone that has a multiple socket per NUMA node topology).
>>>>>>>>>
>>>>>>>>> There is not much we can do from the QEMU layer aside from what I've proposed
>>>>>>>>> here. The other alternative is to keep interacting with the kernel folks to
>>>>>>>>> see if there is a way to keep our use case untouched.
>>>>>>>>
>>>>>>>> Right.  Well.. not necessarily untouched, but I'm hoping for more
>>>>>>>> replies from Cédric to my objections and mpe's.  Even with sockets
>>>>>>>> being a kinda meaningless concept in PAPR, I don't think tying it to
>>>>>>>> NUMA nodes makes sense.
>>>>>>>
>>>>>>> I did a couple of replies in different email threads but maybe not
>>>>>>> to all. I felt it was going nowhere :/ Couple of thoughts,
>>>>>>
>>>>>> I think I saw some of those, but maybe not all.
>>>>>>
>>>>>>> Shouldn't we get rid of the socket concept, die also, under pseries
>>>>>>> since they don't exist under PAPR ? We only have numa nodes, cores,
>>>>>>> threads AFAICT.
>>>>>>
>>>>>> Theoretically, yes.  I'm not sure it's really practical, though, since
>>>>>> AFAICT, both qemu and the kernel have the notion of sockets (though
>>>>>> not dies) built into generic code.
>>>>>
>>>>> Yes. But, AFAICT, these topology notions have not reached "arch/powerpc"
>>>>> and PPC Linux only has a NUMA node id, on pseries and powernv.
>>>>>
>>>>>> It does mean that one possible approach here - maybe the best one - is
>>>>>> to simply declare that sockets are meaningless under, so we simply
>>>>>> don't expect what the guest kernel reports to match what's given to
>>>>>> qemu.
>>>>>>
>>>>>> It'd be nice to avoid that if we can: in a sense it's just cosmetic,
>>>>>> but it is likely to surprise and confuse people.
>>>>>>
>>>>>>> Should we diverged from PAPR and add extra DT properties "qemu,..." ?
>>>>>>> There are a couple of places where Linux checks for the underlying
>>>>>>> hypervisor already.
>>>>>>>
>>>>>>>>> This also means that
>>>>>>>>> 'ibm,chip-id' will probably remain in use since it's the only place where
>>>>>>>>> we inform cores per socket information to the kernel.
>>>>>>>>
>>>>>>>> Well.. unless we can find some other sensible way to convey that
>>>>>>>> information.  I haven't given up hope for that yet.
>>>>>>>
>>>>>>> Well, we could start by fixing the value in QEMU. It is broken
>>>>>>> today.
>>>>>>
>>>>>> Fixing what value, exactly?
>>>>>
>>>>> The value of the "ibm,chip-id" since we are keeping the property under
>>>>> QEMU.
>>>>
>>>> David, I believe this has to do with the discussing we had last Friday.
>>>>
>>>> I mentioned that the ibm,chip-id property is being calculated in a way that
>>>> promotes the same ibm,chip-id in CPUs that belongs to different NUMA nodes,
>>>> e.g.:
>>>>
>>>> -smp 4,cores=4,maxcpus=8,threads=1 \
>>>> -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 \
>>>> -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1
>>>>
>>>>
>>>> $ dtc -I dtb -O dts fdt.dtb | grep -B2 ibm,chip-id
>>>> 			ibm,associativity = <0x05 0x00 0x00 0x00 0x00 0x00>;
>>>> 			ibm,pft-size = <0x00 0x19>;
>>>> 			ibm,chip-id = <0x00>;
>>>
>>>> We assign ibm,chip-id=0x0 to CPUs 0-3, but CPUs 2-3 are located in a
>>>> different NUMA node than 0-1. This would mean that the same socket
>>>> would belong to different NUMA nodes at the same time.
>>>
>>> Right... and I'm still not seeing why that's a problem.  AFAICT that's
>>> a possible, if unexpected, situation under real hardware - though
>>> maybe not for POWER9 specifically.
>> The ibm,chip-id property does not exist under PAPR. PAPR only has
>> NUMA nodes, no sockets nor chips. 
>>
>> And the property value is simply broken under QEMU. Try this  :
>>
>>    -smp 4,cores=1,maxcpus=8 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1
>>
>> # dmesg | grep numa
>> [    0.013106] numa: Node 0 CPUs: 0-1
>> [    0.013136] numa: Node 1 CPUs: 2-3
>>
>> # dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
>> 		ibm,chip-id = <0x01>;
>> 		ibm,chip-id = <0x02>;
>> 		ibm,chip-id = <0x00>;
>> 		ibm,chip-id = <0x03>;
> 
> Not seeing the problem here.  You've specified 8 (possible) cpus, 1
> core-per-socket, therefore there are 4 sockets, hence 4 chip-ids.
> Again, I don't see where this assumption that the chip-id is somehow
> related to the NUMA topology is coming from.
> 
>>>> I believe this is what Cedric wants to be addressed. Given that the
>>>> property is called after the OPAL property ibm,chip-id, the kernel
>>>> expects that the property will have the same semantics as in OPAL.>
>>> Even on powernv, I'm not clear why chip-id is tied into the NUMA
>>> configuration, rather than getting all the NUMA info from
>>> associativity properties.
>>
>> It is the case. 
> 
> What exactly is the case?

sorry. That was badly phrased. I meant ; powernv gets the NUMA info from
"ibm,associativity" property.

C.

>> The associativity properties are built from chip-id in OPAL though.
> 
> Ok, so?  Why do we care how OPAL builds the associativity properties
> once we *have* the associativity properties its built?
> 
>> The chip-id property is only used in low level PowerNV drivers, VAS,
>> XSCOM, LPC, etc.
> 
> Which AFAIK, really *do* need to know which chip they're on, not the
> NUMA toplogy.
> 
>> It's also badly used in the common part of the XIVE driver, what I am
>> trying to fix to introduce an IPI per node on all platforms.   
> 
> See comments on other thread.
> 


