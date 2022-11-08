Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87946620D42
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 11:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osLqW-00080g-La; Tue, 08 Nov 2022 05:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1osLqU-0007zx-AK; Tue, 08 Nov 2022 05:28:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1osLqS-0003BE-0d; Tue, 08 Nov 2022 05:28:42 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A89bbfe004955;
 Tue, 8 Nov 2022 10:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NQgGHMUu3E/7M/S0JfSXKxnlS5eEQY6yEmMwDgaSggQ=;
 b=eY5y2hDoFzwmrkCUuvty+oSbh512vJ69AiUqvMc4ZyeOpYjWv/8orOWBMCFRr9aGAAja
 MlQpWNuztQbr6wQsxkExJWGCV6juDE5W0h1KrHH33d8i/SL4NeIGBB4cbFaB9h6ZZF7d
 l6WekPl5DcHQFcCM0deBDcPCywXXXAFV5cMF5vRENJwwB3QksbUdpGHVXEpz5ZDTCbvD
 aip2LpOqdaoCAa/LV13g6O8l7dXP5G/bXEfEITJyYU1n+OfzigBJ3e9F5IfnY2FkB2Tu
 B+cbG+qZjZF54QrDHIQBLYFStTmczxeB0WH08F+4pbZxWWocEk9go/NM+0vATqQya2q5 iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqmn6sc94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 10:28:30 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A89dOVD013501;
 Tue, 8 Nov 2022 10:28:29 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqmn6sc8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 10:28:29 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A8ANJSw028011;
 Tue, 8 Nov 2022 10:28:27 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3kngq8juuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Nov 2022 10:28:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A8ASOdc63177158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Nov 2022 10:28:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3CC64C052;
 Tue,  8 Nov 2022 10:28:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCBCD4C044;
 Tue,  8 Nov 2022 10:28:22 +0000 (GMT)
Received: from [9.171.67.69] (unknown [9.171.67.69])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Nov 2022 10:28:22 +0000 (GMT)
Message-ID: <bfbed606-d2dd-1b53-87f0-00a7fc0c7a2f@linux.ibm.com>
Date: Tue, 8 Nov 2022 11:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 1/9] s390x/cpu topology: core_id sets s390x CPU
 topology
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-2-pmorel@linux.ibm.com>
 <ad2a9892184cd5dc7597d411f42e330558146acf.camel@linux.ibm.com>
 <15b829ca-14d0-dc77-5e1e-1b4455784ed6@linux.ibm.com>
 <c1c2a492596c3f853ca260e22ba2c9f8afb9a0ae.camel@linux.ibm.com>
 <2657bf9e-add2-1f48-18c9-9f9e5b561c80@linux.ibm.com>
 <4b2dcb313e3409697b702308d94078d16c6cd955.camel@linux.ibm.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <4b2dcb313e3409697b702308d94078d16c6cd955.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dZ2kW1seKpOIovDP_Aifown-Ynoh-Rsv
X-Proofpoint-ORIG-GUID: wEIPNO0UyQRDZzq-gGVn8OqiiAjz_7X7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080054
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



On 11/7/22 19:04, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-10-28 at 11:30 +0200, Pierre Morel wrote:
>>
>> On 10/27/22 22:20, Janis Schoetterl-Glausch wrote:
>>> On Wed, 2022-10-26 at 10:34 +0200, Pierre Morel wrote:
>>>>
>>>> On 10/25/22 21:58, Janis Schoetterl-Glausch wrote:
>>>>> On Wed, 2022-10-12 at 18:20 +0200, Pierre Morel wrote:
>>>>>> In the S390x CPU topology the core_id specifies the CPU address
>>>>>> and the position of the core withing the topology.
>>>>>>
>>>>>> Let's build the topology based on the core_id.
>>>>>> s390x/cpu topology: core_id sets s390x CPU topology
>>>>>>
>>>>>> In the S390x CPU topology the core_id specifies the CPU address
>>>>>> and the position of the cpu withing the topology.
>>>>>>
>>>>>> Let's build the topology based on the core_id.
>>>>>>
>>>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>>>> ---
>>>>>>     include/hw/s390x/cpu-topology.h |  45 +++++++++++
>>>>>>     hw/s390x/cpu-topology.c         | 132 ++++++++++++++++++++++++++++++++
>>>>>>     hw/s390x/s390-virtio-ccw.c      |  21 +++++
>>>>>>     hw/s390x/meson.build            |   1 +
>>>>>>     4 files changed, 199 insertions(+)
>>>>>>     create mode 100644 include/hw/s390x/cpu-topology.h
>>>>>>     create mode 100644 hw/s390x/cpu-topology.c
>>>>>>
>>>>> [...]
>>>>>
>>>>>> +/**
>>>>>> + * s390_topology_realize:
>>>>>> + * @dev: the device state
>>>>>> + * @errp: the error pointer (not used)
>>>>>> + *
>>>>>> + * During realize the machine CPU topology is initialized with the
>>>>>> + * QEMU -smp parameters.
>>>>>> + * The maximum count of CPU TLE in the all Topology can not be greater
>>>>>> + * than the maximum CPUs.
>>>>>> + */
>>>>>> +static void s390_topology_realize(DeviceState *dev, Error **errp)
>>>>>> +{
>>>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>>>> +    S390Topology *topo = S390_CPU_TOPOLOGY(dev);
>>>>>> +
>>>>>> +    topo->cpus = ms->smp.cores * ms->smp.threads;
>>>>>
>>>>> Currently threads are not supported, effectively increasing the number of cpus,
>>>>> so this is currently correct. Once the machine version limits the threads to 1,
>>>>> it is also correct. However, once we support multiple threads, this becomes incorrect.
>>>>> I wonder if it's ok from a backward compatibility point of view to modify the smp values
>>>>> by doing cores *= threads, threads = 1 for old machines.
>>>>
>>>> Right, this will become incorrect with thread support.
>>>> What about having a dedicated function:
>>>>
>>>> 	topo->cpus = s390_get_cpus(ms);
>>>>
>>>> This function will use the S390CcwMachineClass->max_thread introduced
>>>> later to report the correct number of CPUs.
>>>
>>> I don't think max_threads is exactly what matters here, it's if
>>> threads are supported or not or, if max_threads == 1 it doesn't matter.
>>> The question is how best to do the check. You could check the machine version.
>>> I wonder if you could add a feature bit for the multithreading facility that is
>>> always false and use that.
>>>
>>> I don't know if using a function makes a difference, that is if it is obvious on
>>> introduction of multithreading support that the function needs to be updated.
>>> (If it is implemented in a way that requires updating, if you check the machine
>>> version it doesn't)
>>> In any case, the name you suggested isn't very descriptive.
>>
>> I think we care about this machine and olders.
>> Olders do not support topology so this, Multithreading (MT) does not mater.
>> This machine support topology, if I follow Cedric advise, the
>> "max_thread" will/may be introduce before the topology.
>>
>> This in fact is not an implementation for MT or does not allow the
>> implementation of MT it is only a way to get rid of the false
>> information given to the user that we accept MT.
>>
>> So I think that when we introduce MT we will take care of making things
>> right at this place as in other places of the code.
>>
>> What about we keep the original:
>>
>>       topo->cpus = ms->smp.cores * ms->smp.threads;
> 
> If topology is only supported for new machines and not the old machines
> for which you set max_threads to a compatibility value (max cpus), then
> you should just ignore the threads, cpus == cores.
> (There might not be any point in keeping a topo->cpus member in this case, I haven't checked)

Right but, I need the nr_cpus in the topology so I prefer to keep it.

However, smp.threads has nothing to do there anymore as you pointed.
I think that nr_cpus should may be named nr_cores and should be set to 
smp.cores.

Thanks,
Regards,

Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

