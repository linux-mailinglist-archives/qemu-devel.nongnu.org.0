Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819E574E65
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 14:53:09 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oByL6-0004yQ-23
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 08:53:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oByJE-0003KJ-Rd; Thu, 14 Jul 2022 08:51:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oByJC-0004Yw-HV; Thu, 14 Jul 2022 08:51:12 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26ECaqtI020793;
 Thu, 14 Jul 2022 12:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=zFb0XXHOFcw8M5lCwp6VFSkyK2WKPJeqwCEhhbtBYU8=;
 b=EVD3sGoH+CIinZ+fcBX6bfF3pyXPNfXzTZfYkSeDjXUm+9oRkkRp7iEEyZFeCSqlL+zD
 NE1zWBshkKsmAghHPHIMwXEZjSqVGVKuMmx1FYoJpEb7K0HGPZluvNfuM8Ggzsr2RiNn
 mVDZ7xf9/HkLwIsi62uNw27NwWcKcBNzvGOyvdGiy/iy/5GTMMNplt6zqTKDC8wxj8ry
 VMjBj9F7UUTbXtuJEPX1uItvDpH2h0HOMF02aWsk/niIKHeclyDYoIpFFNQal5eyQ9b+
 r4JzynPpW3bNEd+XMUDdZt0qQN4NPN3vNDJVsH5EmXt4AAoLn3u3djBOfthmrDC1KRKz Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hak018pvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 12:51:07 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26ECawY0021631;
 Thu, 14 Jul 2022 12:51:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hak018puc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 12:51:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26ECo4nI010970;
 Thu, 14 Jul 2022 12:51:04 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn41a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 12:51:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26ECnRPw24052124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 12:49:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA8D7A4053;
 Thu, 14 Jul 2022 12:51:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E4B6A404D;
 Thu, 14 Jul 2022 12:50:57 +0000 (GMT)
Received: from [9.171.84.216] (unknown [9.171.84.216])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jul 2022 12:50:57 +0000 (GMT)
Message-ID: <0a4ab4e8-e628-0865-0198-384b4fcc88de@linux.ibm.com>
Date: Thu, 14 Jul 2022 14:50:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 02/12] s390x/cpu_topology: CPU topology objects and
 structures
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-3-pmorel@linux.ibm.com>
 <de92ef17-3a17-df44-97aa-19e67d1d5b3d@linux.ibm.com>
 <5215ca74-e71c-73df-69c9-d2522e082706@linux.ibm.com>
 <53698be8-0eab-8dc2-2d54-df2a89e1092f@linux.ibm.com>
 <4fef46f1-f43f-665f-47dc-89107385572e@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <4fef46f1-f43f-665f-47dc-89107385572e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V464wc8d6gwCNgNup1NijY6QwIItVmTF
X-Proofpoint-ORIG-GUID: QgGgRl1FANEzzKxW6hEWyW1JFlpbgcKH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_10,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140053
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/14/22 13:25, Pierre Morel wrote:

[...]

> 
> That is sure.
> I thought about put a fatal error report during the initialization in the s390_topology_setup()
> 
>> And you can set thread > 1 today, so we'd need to handle that. (increase the number of cpus instead and print a warning?)
>>
>> [...]
> 
> this would introduce arch dependencies in the hw/core/
> I think that the error report for Z is enough.
> 
> So once we support Multithreading in the guest we can adjust it easier without involving the common code.
> 
> Or we can introduce a thread_supported in SMPCompatProps, which would be good.
> I would prefer to propose this outside of the series and suppress the fatal error once it is adopted.
> 

Yeah, could be a separate series, but then the question remains what you in this one, that is
if you change the code so it would be correct if multithreading were supported.
>>
>>>>> +
>>>>> +/*
>>>>> + * Setting the first topology: 1 book, 1 socket
>>>>> + * This is enough for 64 cores if the topology is flat (single socket)
>>>>> + */
>>>>> +void s390_topology_setup(MachineState *ms)
>>>>> +{
>>>>> +    DeviceState *dev;
>>>>> +
>>>>> +    /* Create BOOK bridge device */
>>>>> +    dev = qdev_new(TYPE_S390_TOPOLOGY_BOOK);
>>>>> +    object_property_add_child(qdev_get_machine(),
>>>>> +                              TYPE_S390_TOPOLOGY_BOOK, OBJECT(dev));
>>>>
>>>> Why add it to the machine instead of directly using a static?
>>>
>>> For my opinion it is a characteristic of the machine.
>>>
>>>> So it's visible to the user via info qtree or something?
>>>
>>> It is already visible to the user on info qtree.
>>>
>>>> Would that even be the appropriate location to show that?
>>>
>>> That is a very good question and I really appreciate if we discuss on the design before diving into details.
>>>
>>> The idea is to have the architecture details being on qtree as object so we can plug new drawers/books/socket/cores and in the future when the infrastructure allows it unplug them.
>>
>> Would it not be more accurate to say that we plug in new cpus only?
>> Since you need to specify the topology up front with -smp and it cannot change after.
> 
> smp specify the maximum we can have.
> I thought we can add dynamically elements inside this maximum set.
> 
>> So that all is static, books/sockets might be completely unpopulated, but they still exist in a way.
>> As far as I understand, STSI only allows for cpus to change, nothing above it.
> 
> I thought we want to plug new books or drawers but I may be wrong.

So you want to be able to plug in, for example, a socket without any cpus in it?
I'm not seeing anything in the description of STSI that forbids having empty containers
or containers with a cpu entry without any cpus. But I don't know why that would be useful.
And if you don't want empty containers, then the container will just show up when plugging in the cpu.
> 
>>>
>>> There is a info numa (info cpus does not give a lot info) to give information on nodes but AFAIU, a node is more a theoritical that can be used above the virtual architecture, sockets/cores, to specify characteristics like distance and associated memory.
>>
>> https://qemu.readthedocs.io/en/latest/interop/qemu-qmp-ref.html#qapidoc-2391
>> shows that the relevant information can be queried via qmp.
>> When I tried it on s390x it only showed the core_id, but we should be able to add the rest.
> 
> yes, sure.> 
>>
>>
>> Am I correct in my understanding, that there are two reasons to have the hierarchy objects:
>> 1. Caching the topology instead of computing it when STSI is called
>> 2. So they show up in info qtree
>>
>> ?
> 
> and have the possibility to add the objects dynamically. yes
> 
[...]

