Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A70DA59F5A5
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:48:59 +0200 (CEST)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQm4F-00027t-5G
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oQly0-0007Ml-VB; Wed, 24 Aug 2022 04:42:28 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oQlxy-0001E4-GX; Wed, 24 Aug 2022 04:42:28 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O8Lfqq016772;
 Wed, 24 Aug 2022 08:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JnzBh7dUKODaA3t1w8s7g9z5Y3OIRflHZ+k6Yqyc8UE=;
 b=Unb8V0pY1n5rHUos6Wyx50ydyoN3fCpFMr7SQiQ9pGT28kBbD2pYNgMUjDVhLyB/C0nv
 CT/icZDI3F5h4pu4Of8JllvB2DJSnVT6H8cuSgiMSrpsk+944x2l+pYUhhp8+iZgRfe3
 ywx6xMWQTFKU0v5oBqPYo/hd4YdGfHVPvOpy+bfmQNUetAajKub2hRSnuwIndCUyiBLJ
 NrbMjWJVyTeDSuI1yQy89vXcuJPQ3BE3l6jaCK6QwstgbEMH1NWOAa0v+oLoE3Gr24Y7
 HhY6EIUKjlWACVQyS8s4tbmbkLP6JI/iUHyES/A0u4wsj4kJQtyALFYIlWH8WpAqub6S 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5g9ks1j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 08:42:24 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27O8canB024446;
 Wed, 24 Aug 2022 08:42:24 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5g9ks1h7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 08:42:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O8Zdtc009914;
 Wed, 24 Aug 2022 08:42:22 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3j2q89bj1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Aug 2022 08:42:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27O8gINu30802242
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Aug 2022 08:42:18 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D39075204F;
 Wed, 24 Aug 2022 08:42:18 +0000 (GMT)
Received: from [9.171.80.120] (unknown [9.171.80.120])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 73E055204E;
 Wed, 24 Aug 2022 08:42:12 +0000 (GMT)
Message-ID: <b93d2a9b-5ddd-bccd-0324-8b33472b5966@linux.ibm.com>
Date: Wed, 24 Aug 2022 10:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 02/12] s390x/cpu_topology: CPU topology objects and
 structures
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-3-pmorel@linux.ibm.com>
 <b6c981e0-56f5-25c3-3422-ed72c8561712@redhat.com>
 <ca410180-1699-7a04-6417-b59540edc87d@linux.ibm.com>
 <be11a5fd-1955-2d26-38d9-3a8b9ffaf42f@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <be11a5fd-1955-2d26-38d9-3a8b9ffaf42f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6yxjtioqTtue_GC_9Q5YgnMJJe_0Zsrx
X-Proofpoint-ORIG-GUID: vdNsGLJRinNUdil2jJecrJhiZSB9Nn8l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-24_04,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240033
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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



On 8/24/22 09:30, Thomas Huth wrote:
> On 23/08/2022 19.41, Pierre Morel wrote:
>>
>>
>> On 8/23/22 15:30, Thomas Huth wrote:
>>> On 20/06/2022 16.03, Pierre Morel wrote:
>>>> We use new objects to have a dynamic administration of the CPU 
>>>> topology.
>>>> The highest level object in this implementation is the s390 book and
>>>> in this first implementation of CPU topology for S390 we have a single
>>>> book.
>>>> The book is built as a SYSBUS bridge during the CPU initialization.
>>>> Other objects, sockets and core will be built after the parsing
>>>> of the QEMU -smp argument.
>>>>
>>>> Every object under this single book will be build dynamically
>>>> immediately after a CPU has be realized if it is needed.
>>>> The CPU will fill the sockets once after the other, according to the
>>>> number of core per socket defined during the smp parsing.
>>>>
>>>> Each CPU inside a socket will be represented by a bit in a 64bit
>>>> unsigned long. Set on plug and clear on unplug of a CPU.
>>>>
>>>> For the S390 CPU topology, thread and cores are merged into
>>>> topology cores and the number of topology cores is the multiplication
>>>> of cores by the numbers of threads.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>   hw/s390x/cpu-topology.c         | 391 
>>>> ++++++++++++++++++++++++++++++++
>>>>   hw/s390x/meson.build            |   1 +
>>>>   hw/s390x/s390-virtio-ccw.c      |   6 +
>>>>   include/hw/s390x/cpu-topology.h |  74 ++++++
>>>>   target/s390x/cpu.h              |  47 ++++
>>>>   5 files changed, 519 insertions(+)
>>>>   create mode 100644 hw/s390x/cpu-topology.c
>>>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>> ...
>>>> +bool s390_topology_new_cpu(MachineState *ms, int core_id, Error 
>>>> **errp)
>>>> +{
>>>> +    S390TopologyBook *book;
>>>> +    S390TopologySocket *socket;
>>>> +    S390TopologyCores *cores;
>>>> +    int nb_cores_per_socket;
>>>> +    int origin, bit;
>>>> +
>>>> +    book = s390_get_topology();
>>>> +
>>>> +    nb_cores_per_socket = ms->smp.cores * ms->smp.threads;
>>>> +
>>>> +    socket = s390_get_socket(ms, book, core_id / 
>>>> nb_cores_per_socket, errp);
>>>> +    if (!socket) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * At the core level, each CPU is represented by a bit in a 64bit
>>>> +     * unsigned long. Set on plug and clear on unplug of a CPU.
>>>> +     * The firmware assume that all CPU in the core description 
>>>> have the same
>>>> +     * type, polarization and are all dedicated or shared.
>>>> +     * In the case a socket contains CPU with different type, 
>>>> polarization
>>>> +     * or dedication then they will be defined in different CPU 
>>>> containers.
>>>> +     * Currently we assume all CPU are identical and the only 
>>>> reason to have
>>>> +     * several S390TopologyCores inside a socket is to have more 
>>>> than 64 CPUs
>>>> +     * in that case the origin field, representing the offset of 
>>>> the first CPU
>>>> +     * in the CPU container allows to represent up to the maximal 
>>>> number of
>>>> +     * CPU inside several CPU containers inside the socket container.
>>>> +     */
>>>> +    origin = 64 * (core_id / 64);
>>>
>>> Maybe faster:
>>>
>>>      origin = core_id & ~63;
>>>
>>> By the way, where is this limitation to 64 coming from? Just because 
>>> we're using a "unsigned long" for now? Or is this a limitation from 
>>> the architecture?
>>>
>>>> +    cores = s390_get_cores(ms, socket, origin, errp);
>>>> +    if (!cores) {
>>>> +        return false;
>>>> +    }
>>>> +
>>>> +    bit = 63 - (core_id - origin);
>>>> +    set_bit(bit, &cores->mask);
>>>> +    cores->origin = origin;
>>>> +
>>>> +    return true;
>>>> +}
>>> ...
>>>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>>>> index cc3097bfee..a586875b24 100644
>>>> --- a/hw/s390x/s390-virtio-ccw.c
>>>> +++ b/hw/s390x/s390-virtio-ccw.c
>>>> @@ -43,6 +43,7 @@
>>>>   #include "sysemu/sysemu.h"
>>>>   #include "hw/s390x/pv.h"
>>>>   #include "migration/blocker.h"
>>>> +#include "hw/s390x/cpu-topology.h"
>>>>   static Error *pv_mig_blocker;
>>>> @@ -89,6 +90,7 @@ static void s390_init_cpus(MachineState *machine)
>>>>       /* initialize possible_cpus */
>>>>       mc->possible_cpu_arch_ids(machine);
>>>> +    s390_topology_setup(machine);
>>>
>>> Is this safe with regards to migration? Did you tried a ping-pong 
>>> migration from an older QEMU to a QEMU with your modifications and 
>>> back to the older one? If it does not work, we might need to wire 
>>> this setup to the machine types...
>>
>> I checked with the follow-up series :
>> OLD-> NEW -> OLD -> NEW
>>
>> It is working fine, of course we need to fence the CPU topology 
>> facility with ctop=off on the new QEMU to avoid authorizing the new 
>> instructions, PTF and STSI(15).
> 
> When using an older machine type, the facility should be disabled by 
> default, so the user does not have to know that ctop=off has to be set 
> ... so I think you should only do the s390_topology_setup() by default 
> if using the 7.2 machine type (or newer).
> 
>   Thomas
> 

Oh OK, thanks.
I add this for the next series of course.

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

