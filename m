Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4B66DA50
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 10:50:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHibT-0004RE-OC; Tue, 17 Jan 2023 04:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pHibM-0004Py-Pf; Tue, 17 Jan 2023 04:49:57 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pHibK-0006sY-6S; Tue, 17 Jan 2023 04:49:56 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30H7TD7K002127; Tue, 17 Jan 2023 09:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lMPgxZYQvXvtH8QE5H4XkI5kq19R8TshyMJlwh5+SLY=;
 b=dtezC351GdfMKWl06ybP5g7U5ZGpBRPKd7awd5lXkJB4NcNcpAc3ea+rLlAgGcUdVvjR
 6WjGH0U8w+lsGNJgAuLSAKYU0IyZsPjouA29uN/cKRnXxA19u6j60gxPfed3xKtSQ4zB
 F68vN2MHEX8HU5+u18rW3p4s2lsjuJtEKj7SFNfId2deJoje6YwTajqn/Ghw2XqPxerV
 jwCkI7Vp5g2KLiBJseKG+p6F4d6ui00CdBYXtAVGoQbjEVnvZOKydmxixUq/xNGxvZ6E
 askg7xHMNfTuZHOIJpfhIMOFuS/yjyIFvB727w0IycMGOC3xmfzM7bleZvYYtRuIlObV pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5hky1w7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 09:49:45 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30H8ftQS001523;
 Tue, 17 Jan 2023 09:49:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5hky1w6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 09:49:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30H6sXRR017303;
 Tue, 17 Jan 2023 09:49:42 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n3m16amk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jan 2023 09:49:42 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30H9ncqO46924176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jan 2023 09:49:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDE9720049;
 Tue, 17 Jan 2023 09:49:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AD7B20043;
 Tue, 17 Jan 2023 09:49:37 +0000 (GMT)
Received: from [9.171.42.216] (unknown [9.171.42.216])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 17 Jan 2023 09:49:37 +0000 (GMT)
Message-ID: <e6d42967-4a17-da97-2f6d-c55d8d47067e@linux.ibm.com>
Date: Tue, 17 Jan 2023 10:49:36 +0100
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
 <31bc88bc-d0c2-f172-939a-c7a42adb466d@linux.ibm.com>
 <10ddaef9e2e8cdd19b86c42096a7296ece137dc0.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <10ddaef9e2e8cdd19b86c42096a7296ece137dc0.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XCZaoEe3exNSkE36yb4Z3AJD4ly48w9Q
X-Proofpoint-GUID: JG0VUqCHWOIXqkgE-NyBQ3F9vE2vhakl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_04,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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



On 1/16/23 21:34, Nina Schoetterl-Glausch wrote:
> On Mon, 2023-01-16 at 18:28 +0100, Pierre Morel wrote:
>>
>> On 1/13/23 17:58, Nina Schoetterl-Glausch wrote:
>>> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>>>> S390 adds two new SMP levels, drawers and books to the CPU
>>>> topology.
>>>> The S390 CPU have specific toplogy features like dedication
>>>> and polarity to give to the guest indications on the host
>>>> vCPUs scheduling and help the guest take the best decisions
>>>> on the scheduling of threads on the vCPUs.
>>>>
>>>> Let us provide the SMP properties with books and drawers levels
>>>> and S390 CPU with dedication and polarity,
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>    qapi/machine.json               | 14 ++++++++--
>>>>    include/hw/boards.h             | 10 ++++++-
>>>>    include/hw/s390x/cpu-topology.h | 23 ++++++++++++++++
>>>>    target/s390x/cpu.h              |  6 +++++
>>>>    hw/core/machine-smp.c           | 48 ++++++++++++++++++++++++++++-----
>>>>    hw/core/machine.c               |  4 +++
>>>>    hw/s390x/s390-virtio-ccw.c      |  2 ++
>>>>    softmmu/vl.c                    |  6 +++++
>>>>    target/s390x/cpu.c              | 10 +++++++
>>>>    qemu-options.hx                 |  6 +++--
>>>>    10 files changed, 117 insertions(+), 12 deletions(-)
>>>>    create mode 100644 include/hw/s390x/cpu-topology.h
>>>>
>>> [...]
>>>
>>>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>>>> index 7d6d01325b..39ea63a416 100644
>>>> --- a/target/s390x/cpu.h
>>>> +++ b/target/s390x/cpu.h
>>>> @@ -131,6 +131,12 @@ struct CPUArchState {
>>>>    
>>>>    #if !defined(CONFIG_USER_ONLY)
>>>>        uint32_t core_id; /* PoP "CPU address", same as cpu_index */
>>>> +    int32_t socket_id;
>>>> +    int32_t book_id;
>>>> +    int32_t drawer_id;
>>>> +    int32_t dedicated;
>>>> +    int32_t polarity;
>>>
>>> If I understood the architecture correctly, the polarity is a property of the configuration,
>>> not the cpus. So this should be vertical_entitlement, and there should be a machine (?) property
>>> specifying if the polarity is horizontal or vertical.
>>
>> You are right, considering PTF only, the documentation says PTF([01])
>> does the following:
>>
>> "... a process is initiated to place all CPUs in the configuration into
>> the polarization specified by the function code, ..."
>>
>> So on one side the polarization property is explicitly set on the CPU,
>> and on the other side all CPU are supposed to be in the same
>> polarization state.
> 
> I'm worried about STSI showing both horizontal and vertical CPUs at the same time.
> I don't know if this is allowed.
> If it is not, you need a way to switch between those atomically, which is harder
> if every CPU has this property.

The documentation explicitly provides the order in which to show the TLE 
when both vertical and horizontal TLE are display inside the SYSIB.
So it seems expected by the architecture.
I understand that it is because the documentation says that the 
instruction finished before all the CPU did change polarity.

But I think you are right on the point that:
- It is only transitional
- it does not make sense for my point of view to have both at the same time.

In QEMU, as these are two interceptions we will always finish the PTF 
interception before we start the STSI interception, so we will never see 
this happen.

Question are:

1) Should we do better than the architecture?

2) If yes, are we sure it is better?

Regards,
Pierre



-- 
Pierre Morel
IBM Lab Boeblingen

