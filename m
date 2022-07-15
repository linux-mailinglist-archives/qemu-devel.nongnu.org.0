Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3115E576304
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:45:01 +0200 (CEST)
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLcp-000606-P3
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oCLbM-0004LN-4P; Fri, 15 Jul 2022 09:43:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:34928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oCLbJ-00062l-GV; Fri, 15 Jul 2022 09:43:27 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FDCEQT019745;
 Fri, 15 Jul 2022 13:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=+GERxWJrh7HyO7BMBTJNAB+n9Ot4wHaxzfvKCtjpGDI=;
 b=iKf3haJbdvlXMS/SmMQqWESdyHKyAbD0lY8F1BVOm631se0O7DPm1F4E3SBm0geCak0B
 LwXDkmcSZwh2t4ZS5+MtGICdW+1AwkB9YlnytwSmpp7jJYZOKARi7slIfiSIyvmX+LkP
 4a7JoN8FFvc6wC5qFrAbYo5lHoWg3joRChYD2YOAF8MdNsS+lOBNpPgjL8rHX7CBibrC
 zn252V7WCjHiQtrXGsCYUNLB9VmYVIGdIEJGc5luXaRDIUzlIuhFoX2ZtYjDlcAg8mZ2
 hgAnjgyZPxLHlOgR9alnagnwpnXrrZ2BT34FO3vN6vAl4eO+xgxIriy+H+kUgAfXkYP2 GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb8wj0qnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 13:43:20 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26FDhJko026363;
 Fri, 15 Jul 2022 13:43:19 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hb8wj0qmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 13:43:19 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26FDLi4A027139;
 Fri, 15 Jul 2022 13:43:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3h71a8pdqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 13:43:17 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26FDhEhV18612606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jul 2022 13:43:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31EDFAE051;
 Fri, 15 Jul 2022 13:43:14 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36CA4AE045;
 Fri, 15 Jul 2022 13:43:13 +0000 (GMT)
Received: from [9.171.83.230] (unknown [9.171.83.230])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jul 2022 13:43:13 +0000 (GMT)
Message-ID: <040c0a83-a987-0daa-531d-97e149e6e96a@linux.ibm.com>
Date: Fri, 15 Jul 2022 15:47:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 00/12] s390x: CPU Topology
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <6ad0e006-72ee-3e24-48ed-fc8dd49db130@linux.ibm.com>
 <9c554788-aa51-d0fb-193b-f01ad266b256@linux.ibm.com>
 <df9e6199-21e5-7044-8793-9b088c5ff29c@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <df9e6199-21e5-7044-8793-9b088c5ff29c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: NKVKetpBvdI9QSB7HmcLU9P3__J3FfSI
X-Proofpoint-GUID: 9xYRYcyMiveNJwsYMYWtjFpPyXPxJi6U
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150059
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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



On 7/15/22 11:31, Janis Schoetterl-Glausch wrote:
> On 7/14/22 22:05, Pierre Morel wrote:
>>
>>
>> On 7/14/22 20:43, Janis Schoetterl-Glausch wrote:
>>> On 6/20/22 16:03, Pierre Morel wrote:
>>>> Hi,
>>>>
>>>> This new spin is essentially for coherence with the last Linux CPU
>>>> Topology patch, function testing and coding style modifications.
>>>>
>>>> Forword
>>>> =======
>>>>
>>>> The goal of this series is to implement CPU topology for S390, it
>>>> improves the preceeding series with the implementation of books and
>>>> drawers, of non uniform CPU topology and with documentation.
>>>>
>>>> To use these patches, you will need the Linux series version 10.
>>>> You find it there:
>>>> https://lkml.org/lkml/2022/6/20/590
>>>>
>>>> Currently this code is for KVM only, I have no idea if it is interesting
>>>> to provide a TCG patch. If ever it will be done in another series.
>>>>
>>>> To have a better understanding of the S390x CPU Topology and its
>>>> implementation in QEMU you can have a look at the documentation in the
>>>> last patch or follow the introduction here under.
>>>>
>>>> A short introduction
>>>> ====================
>>>>
>>>> CPU Topology is described in the S390 POP with essentially the description
>>>> of two instructions:
>>>>
>>>> PTF Perform Topology function used to poll for topology change
>>>>       and used to set the polarization but this part is not part of this item.
>>>>
>>>> STSI Store System Information and the SYSIB 15.1.x providing the Topology
>>>>       configuration.
>>>>
>>>> S390 Topology is a 6 levels hierarchical topology with up to 5 level
>>>>       of containers. The last topology level, specifying the CPU cores.
>>>>
>>>>       This patch series only uses the two lower levels sockets and cores.
>>>>            To get the information on the topology, S390 provides the STSI
>>>>       instruction, which stores a structures providing the list of the
>>>>       containers used in the Machine topology: the SYSIB.
>>>>       A selector within the STSI instruction allow to chose how many topology
>>>>       levels will be provide in the SYSIB.
>>>>
>>>>       Using the Topology List Entries (TLE) provided inside the SYSIB we
>>>>       the Linux kernel is able to compute the information about the cache
>>>>       distance between two cores and can use this information to take
>>>>       scheduling decisions.
>>>
>>> Do the socket, book, ... metaphors and looking at STSI from the existing
>>> smp infrastructure even make sense?
>>
>> Sorry, I do not understand.
>> I admit the cover-letter is old and I did not rewrite it really good since the first patch series.
>>
>> What we do is:
>> Compute the STSI from the SMP + numa + device QEMU parameters .
>>
>>>
>>> STSI 15.1.x reports the topology to the guest and for a virtual machine,
>>> this topology can be very dynamic. So a CPU can move from from one topology
>>> container to another, but the socket of a cpu changing while it's running seems
>>> a bit strange. And this isn't supported by this patch series as far as I understand,
>>> the only topology changes are on hotplug.
>>
>> A CPU changing from a socket to another socket is the only case the PTF instruction reports a change in the topology with the case a new CPU is plug in.
> 
> Can a CPU actually change between sockets right now?

To be exact, what I understand is that a shared CPU can be scheduled to 
another real CPU exactly as a guest vCPU can be scheduled by the host to 
another host CPU.

> The socket-id is computed from the core-id, so it's fixed, is it not?

the virtual socket-id is computed from the virtual core-id

> 
>> It is not expected to appear often but it does appear.
>> The code has been removed from the kernel in spin 10 for 2 reasons:
>> 1) we decided to first support only dedicated and pinned CPU> 2) Christian fears it may happen too often due to Linux host scheduling and could be a performance problem
> 
> This seems sensible, but now it seems too static.
> For example after migration, you cannot tell the guest which CPUs are in the same socket, book, ...,
> unless I'm misunderstanding something.

No, to do this we would need to ask the kernel about it.

> And migration is rare, but something you'd want to be able to react to.
> And I could imaging that the vCPUs are pinned most of the time, but the pinning changes occasionally.

I think on migration we should just make a kvm_set_mtcr on post_load 
like Nico suggested everything else seems complicated for a questionable 
benefit.


-- 
Pierre Morel
IBM Lab Boeblingen

