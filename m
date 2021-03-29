Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691FE34D75D
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 20:35:51 +0200 (CEST)
Received: from localhost ([::1]:39232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQwjt-0005zT-SK
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 14:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lQwgu-0004r8-TV; Mon, 29 Mar 2021 14:32:46 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:46752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lQwgs-0007zT-V3; Mon, 29 Mar 2021 14:32:44 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id j17so6911323qvo.13;
 Mon, 29 Mar 2021 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wp1d28WlMuLqpSD3/lBYdNazIJhF+b2dFoRs3YVjsQc=;
 b=dAn3fIMDO76Va4IJwJE3HL3xqJyIyNBpd6K0K6l/57KOQ0N8UeNPlBWcYQuAfXIWjF
 tGzm/kOlkIx0f70jS456xSvOm+TI4vmoIVBOsnmCuymE19ZflSy0GyliwwM0q3JZdjhh
 /7sxUSmLc1rzJfjZewm3Sz33p1vq1kvq+8we2WCaE6A8lv0D129RUQBwDT7DFdUuEpa4
 NkUyH2MbMRD+FgyPZdp/ZEgoMzO2IHZLiuwRDH0l3puTBox84bvAAYDTUBCOLy62reZ+
 DTyXlRL0wpFcxSECHtXOXN9IqrknS8xoObEqe2/UTXwulEAs1u/WFMmMU4FlyTTiB6vo
 ODXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wp1d28WlMuLqpSD3/lBYdNazIJhF+b2dFoRs3YVjsQc=;
 b=hgXP/eW+fOF59p3rCX+f39he+29YDoLrYZ+W/0wT5s6717+gnJ50B7HHykXDFosajT
 WwNemxz8ENmt8Oe1Z/SgbtA85a7dqyZNToZjZrDHu4iAr2PYfb5L5iLfz0wlb5m7D9PT
 Q6m54J/pQDtGgeYG/tb4PQH+OywM+UFejHDGkWk90awMfoMfu9wSQOUdtNTHEHMHe1z1
 W8CmaHKh1GxY1EI7AiJApomDathpVhOqUEiO74631iqxPNxK8xneZzjS4XgcjdvKsNb7
 Q44wt3SEQCSvG8qa/wVkNPjuyh6GI3GAY7O9DI7So8D+JmbsL7L32snDDcZbPf5y37Yo
 Rh6Q==
X-Gm-Message-State: AOAM5305ZUJEENBZxw+7/x/X9Eji1pwFZyQLg5uWkwv2+JEIIpBZOxlT
 F3PSbJMX463lMprhFVBBaC4=
X-Google-Smtp-Source: ABdhPJw6zNUxPjFh6LJV1Fs5t7ekf4HMVqjkLjgvPchThpxRikhNRAyHsnNFgHNSRShGZ15illtNAg==
X-Received: by 2002:a0c:f092:: with SMTP id g18mr27021477qvk.11.1617042761094; 
 Mon, 29 Mar 2021 11:32:41 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:6b49:9e31:c2b4:54cb:eeb6?
 ([2804:431:c7c6:6b49:9e31:c2b4:54cb:eeb6])
 by smtp.gmail.com with ESMTPSA id y14sm11261238qtw.70.2021.03.29.11.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 11:32:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
 <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <91e406bf-c9c6-0734-1f69-081d3633332b@gmail.com>
Date: Mon, 29 Mar 2021 15:32:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Michael Ellerman <mpe@ellerman.id.au>, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/29/21 12:32 PM, Cédric Le Goater wrote:
> On 3/29/21 6:20 AM, David Gibson wrote:
>> On Thu, Mar 25, 2021 at 09:56:04AM +0100, Cédric Le Goater wrote:
>>> On 3/25/21 3:10 AM, David Gibson wrote:
>>>> On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wrote:
>>>>>
>>>>>
>>>>> On 3/22/21 10:03 PM, David Gibson wrote:
>>>>>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
>>>>>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
>>>>>>> topology_core_cpumask") cause a regression in the pseries machine when
>>>>>>> defining certain SMP topologies [1]. The reasoning behind the change is
>>>>>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
>>>>>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
>>>>>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
>>>>>>> far as the kernel understanding of SMP topologies goes, both masks are
>>>>>>> equivalent.
>>>>>>>
>>>>>>> Further discussions in the kernel mailing list [2] shown that the
>>>>>>> powerpc kernel always considered that the number of sockets were equal
>>>>>>> to the number of NUMA nodes. The claim is that it doesn't make sense,
>>>>>>> for Power hardware at least, 2+ sockets being in the same NUMA node. The
>>>>>>> immediate conclusion is that all SMP topologies the pseries machine were
>>>>>>> supplying to the kernel, with more than one socket in the same NUMA node
>>>>>>> as in [1], happened to be correctly represented in the kernel by
>>>>>>> accident during all these years.
>>>>>>>
>>>>>>> There's a case to be made for virtual topologies being detached from
>>>>>>> hardware constraints, allowing maximum flexibility to users. At the same
>>>>>>> time, this freedom can't result in unrealistic hardware representations
>>>>>>> being emulated. If the real hardware and the pseries kernel don't
>>>>>>> support multiple chips/sockets in the same NUMA node, neither should we.
>>>>>>>
>>>>>>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
>>>>>>> pseries machine. qtest changes were made to adapt to this new
>>>>>>> condition.
>>>>>>
>>>>>> Oof.  I really don't like this idea.  It means a bunch of fiddly work
>>>>>> for users to match these up, for no real gain.  I'm also concerned
>>>>>> that this will require follow on changes in libvirt to not make this a
>>>>>> really cryptic and irritating point of failure.
>>>>>
>>>>> Haven't though about required Libvirt changes, although I can say that there
>>>>> will be some amount to be mande and it will probably annoy existing users
>>>>> (everyone that has a multiple socket per NUMA node topology).
>>>>>
>>>>> There is not much we can do from the QEMU layer aside from what I've proposed
>>>>> here. The other alternative is to keep interacting with the kernel folks to
>>>>> see if there is a way to keep our use case untouched.
>>>>
>>>> Right.  Well.. not necessarily untouched, but I'm hoping for more
>>>> replies from Cédric to my objections and mpe's.  Even with sockets
>>>> being a kinda meaningless concept in PAPR, I don't think tying it to
>>>> NUMA nodes makes sense.
>>>
>>> I did a couple of replies in different email threads but maybe not
>>> to all. I felt it was going nowhere :/ Couple of thoughts,
>>
>> I think I saw some of those, but maybe not all.
>>
>>> Shouldn't we get rid of the socket concept, die also, under pseries
>>> since they don't exist under PAPR ? We only have numa nodes, cores,
>>> threads AFAICT.
>>
>> Theoretically, yes.  I'm not sure it's really practical, though, since
>> AFAICT, both qemu and the kernel have the notion of sockets (though
>> not dies) built into generic code.
> 
> Yes. But, AFAICT, these topology notions have not reached "arch/powerpc"
> and PPC Linux only has a NUMA node id, on pseries and powernv.
> 
>> It does mean that one possible approach here - maybe the best one - is
>> to simply declare that sockets are meaningless under, so we simply
>> don't expect what the guest kernel reports to match what's given to
>> qemu.
>>
>> It'd be nice to avoid that if we can: in a sense it's just cosmetic,
>> but it is likely to surprise and confuse people.
>>
>>> Should we diverged from PAPR and add extra DT properties "qemu,..." ?
>>> There are a couple of places where Linux checks for the underlying
>>> hypervisor already.
>>>
>>>>> This also means that
>>>>> 'ibm,chip-id' will probably remain in use since it's the only place where
>>>>> we inform cores per socket information to the kernel.
>>>>
>>>> Well.. unless we can find some other sensible way to convey that
>>>> information.  I haven't given up hope for that yet.
>>>
>>> Well, we could start by fixing the value in QEMU. It is broken
>>> today.
>>
>> Fixing what value, exactly?
> 
> The value of the "ibm,chip-id" since we are keeping the property under
> QEMU.

David, I believe this has to do with the discussing we had last Friday.

I mentioned that the ibm,chip-id property is being calculated in a way that
promotes the same ibm,chip-id in CPUs that belongs to different NUMA nodes,
e.g.:

-smp 4,cores=4,maxcpus=8,threads=1 \
-numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 \
-numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1


$ dtc -I dtb -O dts fdt.dtb | grep -B2 ibm,chip-id
			ibm,associativity = <0x05 0x00 0x00 0x00 0x00 0x00>;
			ibm,pft-size = <0x00 0x19>;
			ibm,chip-id = <0x00>;
--
			ibm,associativity = <0x05 0x00 0x00 0x00 0x00 0x01>;
			ibm,pft-size = <0x00 0x19>;
			ibm,chip-id = <0x00>;
--
			ibm,associativity = <0x05 0x01 0x01 0x01 0x01 0x02>;
			ibm,pft-size = <0x00 0x19>;
			ibm,chip-id = <0x00>;
--
			ibm,associativity = <0x05 0x01 0x01 0x01 0x01 0x03>;
			ibm,pft-size = <0x00 0x19>;
			ibm,chip-id = <0x00>;

We assign ibm,chip-id=0x0 to CPUs 0-3, but CPUs 2-3 are located in a different
NUMA node than 0-1. This would mean that the same socket would belong to
different NUMA nodes at the same time.

I believe this is what Cedric wants to be addressed. Given that the property is
called after the OPAL property ibm,chip-id, the kernel expects that the property
will have the same semantics as in OPAL.



Thanks,


DHB




> 
>>> This is all coming from some work we did last year to evaluate our HW
>>> (mostly for XIVE) on 2s, 4s, 16s systems on baremetal, KVM and PowerVM.
>>> We saw some real problems because Linux did not have a clear view of the
>>> topology. See the figures here :
>>>
>>> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210303174857.1760393-9-clg@kaod.org/
>>>
>>> The node id is a key parameter for system resource management, memory
>>> allocation, interrupt affinity, etc. Linux scales much better if used
>>> correctly.
>>
>> Well, sure.  And we have all the ibm,associativity stuff to convey the
>> node ids to the guest (which has its own problems, but not that are
>> relevant here).  What's throwing me is why getting node IDs correct
>> has anything to do with socket numbers.
> 
> 

