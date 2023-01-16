Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEA866CCB4
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 18:29:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHTHY-0002Kt-Em; Mon, 16 Jan 2023 12:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pHTHS-0002Js-Lw; Mon, 16 Jan 2023 12:28:24 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pHTHQ-0003r9-Hd; Mon, 16 Jan 2023 12:28:22 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30GF7j5x011982; Mon, 16 Jan 2023 17:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BXsiR46RezQbdgvDHoxnHJadI8F2TYhCrVj0OMr+Jbw=;
 b=eDxrSr4Nw0PdXteivw5JmLtimXsM+BZyGtPmb+2VN4q2dM5TuMxYjQ3uB3eefxyLJG3j
 g3ScLEiA4ECPEaWPU8N+wD5E/tZb5paT/uGz6o2IPpEH89mG15e+/eMgmn4LJzF9IQDj
 2qoUxr639kjY/+kTM7ylxax2TWDQGCdABoCVz/UrOMWHuEaA3kvMIjW+ntbjav+8GGeZ
 OfJBqol0v+ZxwbTWiR1BJn+GOfofbs/Vc+u1dHLXgZwTDtODzTyJohnXttWhz8Ha2OvW
 Dq2jtwY7Tza1/+JrAiywCGkuwdMyrzaMDiokRP4pysG6JYrjg5psDIK4QkmWn5xfiD/A 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n584n4c41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jan 2023 17:28:15 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30GHHU2V011439;
 Mon, 16 Jan 2023 17:28:14 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n584n4c3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jan 2023 17:28:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30GGVkTH004723;
 Mon, 16 Jan 2023 17:28:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16jqx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jan 2023 17:28:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30GHS8XY24117742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jan 2023 17:28:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16CCD20043;
 Mon, 16 Jan 2023 17:28:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9CF920040;
 Mon, 16 Jan 2023 17:28:06 +0000 (GMT)
Received: from [9.179.28.129] (unknown [9.179.28.129])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 16 Jan 2023 17:28:06 +0000 (GMT)
Message-ID: <31bc88bc-d0c2-f172-939a-c7a42adb466d@linux.ibm.com>
Date: Mon, 16 Jan 2023 18:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v14 01/11] s390x/cpu topology: adding s390 specificities
 to CPU topology
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-2-pmorel@linux.ibm.com>
 <87039aeec020afbd28be77ad5f8d022126aba7bf.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <87039aeec020afbd28be77ad5f8d022126aba7bf.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nS6bnC8lZ9O6Q6NphawOukC51OOxCpY9
X-Proofpoint-GUID: CSA1M9GW0TnXMDfn4nO6ld5GE4zbtk4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_15,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160127
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097, SPF_HELO_NONE=0.001,
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



On 1/13/23 17:58, Nina Schoetterl-Glausch wrote:
> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>> S390 adds two new SMP levels, drawers and books to the CPU
>> topology.
>> The S390 CPU have specific toplogy features like dedication
>> and polarity to give to the guest indications on the host
>> vCPUs scheduling and help the guest take the best decisions
>> on the scheduling of threads on the vCPUs.
>>
>> Let us provide the SMP properties with books and drawers levels
>> and S390 CPU with dedication and polarity,
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   qapi/machine.json               | 14 ++++++++--
>>   include/hw/boards.h             | 10 ++++++-
>>   include/hw/s390x/cpu-topology.h | 23 ++++++++++++++++
>>   target/s390x/cpu.h              |  6 +++++
>>   hw/core/machine-smp.c           | 48 ++++++++++++++++++++++++++++-----
>>   hw/core/machine.c               |  4 +++
>>   hw/s390x/s390-virtio-ccw.c      |  2 ++
>>   softmmu/vl.c                    |  6 +++++
>>   target/s390x/cpu.c              | 10 +++++++
>>   qemu-options.hx                 |  6 +++--
>>   10 files changed, 117 insertions(+), 12 deletions(-)
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>
> [...]
> 
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 7d6d01325b..39ea63a416 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -131,6 +131,12 @@ struct CPUArchState {
>>   
>>   #if !defined(CONFIG_USER_ONLY)
>>       uint32_t core_id; /* PoP "CPU address", same as cpu_index */
>> +    int32_t socket_id;
>> +    int32_t book_id;
>> +    int32_t drawer_id;
>> +    int32_t dedicated;
>> +    int32_t polarity;
> 
> If I understood the architecture correctly, the polarity is a property of the configuration,
> not the cpus. So this should be vertical_entitlement, and there should be a machine (?) property
> specifying if the polarity is horizontal or vertical.

You are right, considering PTF only, the documentation says PTF([01]) 
does the following:

"... a process is initiated to place all CPUs in the configuration into 
the polarization specified by the function code, ..."

So on one side the polarization property is explicitly set on the CPU, 
and on the other side all CPU are supposed to be in the same 
polarization state.

So yes we can make the horizontal/vertical a machine property.
However, we do not need to set this tunable as the documentation says 
that the machine always start with horizontal polarization.

On the other hand the documentation mixes a lot vertical with different 
entitlement and horizontal polarization, for TLE order and slacks so I 
prefer to keep the complete description of the polarization as CPU 
properties in case we miss something.

PTF([01]) are no performance bottle neck and the number of CPU is likely 
to be small, even a maximum of 248 is possible KVM warns above 16 CPU so 
the loop for setting all CPU inside PTF interception is not very 
problematic I think.

Doing like you say should simplify PTF interception (no loop) but 
complicates (some more if/else) TLE handling and QMP information display 
on CPU.
So I will have a look at the implications and answer again on this.

Thanks,

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

