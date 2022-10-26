Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B794560DD25
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 10:37:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onbsP-0001ML-RF; Wed, 26 Oct 2022 04:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1onbsL-000122-Ct; Wed, 26 Oct 2022 04:35:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1onbsI-0004zI-Mu; Wed, 26 Oct 2022 04:35:01 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q8FI4W020239;
 Wed, 26 Oct 2022 08:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=F0SfA9T2LZzCJCEztZXjD5LW4NhvethQEov4KTQbLSI=;
 b=Ln463q3Pr0H6JFeQWrtXMBt5tnTf4MeTgo36X1lMpg35gIY6lmTmJPg+ybdZA548EPYH
 jOyVuLb/AJVVZlx/2E1BmEWq399e/w6jiTt730QcOlJzHDlw/99KuxeAapeCVMfnLyOL
 hMnrl3PPxRhLrgnJyql1OVbK86qIWesGpIFMN+LcsfQbUyyakkC3M8Cz+O4xBJilcidX
 bfdiYPS6VbZNVcvr3hQCbFgPFwbOnV96DI/8om7yWwfOQzVV2y/0khOaRAo5p7yn3IfK
 13qPFyJNVMIx3/+q3GcJ2w7YYVtlUhu55TWiUjXKOxSjecgUK87qfWedkYgM9TnPY3Vt AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kevysys5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:34:46 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29Q69OGk023241;
 Wed, 26 Oct 2022 08:34:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kevysys4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:34:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29Q8Lf2v010269;
 Wed, 26 Oct 2022 08:34:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3kc859f39e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Oct 2022 08:34:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29Q8Ye0K4457056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 08:34:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6C34AE051;
 Wed, 26 Oct 2022 08:34:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEE03AE04D;
 Wed, 26 Oct 2022 08:34:39 +0000 (GMT)
Received: from [9.171.85.254] (unknown [9.171.85.254])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Oct 2022 08:34:39 +0000 (GMT)
Message-ID: <15b829ca-14d0-dc77-5e1e-1b4455784ed6@linux.ibm.com>
Date: Wed, 26 Oct 2022 10:34:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 1/9] s390x/cpu topology: core_id sets s390x CPU
 topology
Content-Language: en-US
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
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <ad2a9892184cd5dc7597d411f42e330558146acf.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _AzGhgOmEm0xo-MoR0Y22bJE5KsVckVK
X-Proofpoint-GUID: xTUk4zfkFKm3-PlEVatTyc76Zy3jwXq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_04,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260047
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/25/22 21:58, Janis Schoetterl-Glausch wrote:
> On Wed, 2022-10-12 at 18:20 +0200, Pierre Morel wrote:
>> In the S390x CPU topology the core_id specifies the CPU address
>> and the position of the core withing the topology.
>>
>> Let's build the topology based on the core_id.
>> s390x/cpu topology: core_id sets s390x CPU topology
>>
>> In the S390x CPU topology the core_id specifies the CPU address
>> and the position of the cpu withing the topology.
>>
>> Let's build the topology based on the core_id.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h |  45 +++++++++++
>>   hw/s390x/cpu-topology.c         | 132 ++++++++++++++++++++++++++++++++
>>   hw/s390x/s390-virtio-ccw.c      |  21 +++++
>>   hw/s390x/meson.build            |   1 +
>>   4 files changed, 199 insertions(+)
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>   create mode 100644 hw/s390x/cpu-topology.c
>>
> [...]
> 
>> +/**
>> + * s390_topology_realize:
>> + * @dev: the device state
>> + * @errp: the error pointer (not used)
>> + *
>> + * During realize the machine CPU topology is initialized with the
>> + * QEMU -smp parameters.
>> + * The maximum count of CPU TLE in the all Topology can not be greater
>> + * than the maximum CPUs.
>> + */
>> +static void s390_topology_realize(DeviceState *dev, Error **errp)
>> +{
>> +    MachineState *ms = MACHINE(qdev_get_machine());
>> +    S390Topology *topo = S390_CPU_TOPOLOGY(dev);
>> +
>> +    topo->cpus = ms->smp.cores * ms->smp.threads;
> 
> Currently threads are not supported, effectively increasing the number of cpus,
> so this is currently correct. Once the machine version limits the threads to 1,
> it is also correct. However, once we support multiple threads, this becomes incorrect.
> I wonder if it's ok from a backward compatibility point of view to modify the smp values
> by doing cores *= threads, threads = 1 for old machines.

Right, this will become incorrect with thread support.
What about having a dedicated function:

	topo->cpus = s390_get_cpus(ms);

This function will use the S390CcwMachineClass->max_thread introduced 
later to report the correct number of CPUs.


> Then you can just use the cores value and it is always correct.
> In any case, if you keep it as is, I'd like to see a comment here saying that this
> is correct only so long as we don't support threads.
>> +
>> +    topo->socket = g_new0(S390TopoContainer, ms->smp.sockets);
>> +    topo->tle = g_new0(S390TopoTLE, ms->smp.max_cpus);
>> +
>> +    topo->ms = ms;
>> +}
>> +
> [...]

-- 
Pierre Morel
IBM Lab Boeblingen

