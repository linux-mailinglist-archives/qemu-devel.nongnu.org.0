Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D5A435D4A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:48:21 +0200 (CEST)
Received: from localhost ([::1]:45798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdTkK-00030b-FX
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mdTgg-0006KL-H7; Thu, 21 Oct 2021 04:44:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mdTgd-0008Sg-Nz; Thu, 21 Oct 2021 04:44:34 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19L8VBQ2029738; 
 Thu, 21 Oct 2021 04:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sb6B6c+ptMqjN+vb+zrjXtXpNBBbCpG96N2KvR2/EQA=;
 b=hT6nhe/ldC+NNyAoHOdHrG5V4JD7lmsLPFKA0w2O1v6Yyy1BesgbkdBW8vCnFQ91DoME
 g+5m7LKCcwX78wVRGezQ4S98pL8w9AO6cXqSlKXSOUxfGllz3r4YTTzkHHoFFxrG03kc
 exL7Xw2dxdqohfWAk6bGl7CQFPZb9DnS6uO/RWk2tTh6MGL6RXFjXc+3mzLaXLVqAaPt
 H6YBbiqMIlO7GzelSbMPhdpEC63YCKj7rEvSB0SwluDx4xJFfnFxeElYhFrUNW3L1O/p
 ZehrCJdNb2clZ8y4ahypU50kqpQYUh4lRkYPi8Htutw4ifRNV41GsNe0fo0BH+0zzafX TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bty9ef10n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 04:44:26 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19L7ukpW002322;
 Thu, 21 Oct 2021 04:44:26 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bty9ef0yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 04:44:26 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19L8i0Dj001476;
 Thu, 21 Oct 2021 08:44:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpcacmm7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 08:44:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 19L8cKli63635792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 08:38:20 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8CFD11C069;
 Thu, 21 Oct 2021 08:44:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CAD411C054;
 Thu, 21 Oct 2021 08:44:15 +0000 (GMT)
Received: from [9.171.84.111] (unknown [9.171.84.111])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 08:44:15 +0000 (GMT)
Message-ID: <5be20072-a052-e4a1-9dd1-b8c6fe383778@linux.ibm.com>
Date: Thu, 21 Oct 2021 10:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 2/4] s390x: kvm: topology: interception of PTF
 instruction
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
 <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
 <80eeffd4-25cf-c2ac-e74b-c8d5301fa98a@linux.ibm.com>
 <803cd1be-0b06-694c-82ae-d5015a34879f@redhat.com>
 <a5d5fbdb-fe81-d8f0-a510-3f94e63fbf98@linux.ibm.com>
In-Reply-To: <a5d5fbdb-fe81-d8f0-a510-3f94e63fbf98@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7ZrRFTbmQtA2DdfGmNyeO3k_OH4fTBxv
X-Proofpoint-GUID: yV9uNHlg-Mp7FeoExDtsPZZSrRi8Zi5_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_02,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110210041
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/14/21 10:09, Pierre Morel wrote:
> 
> 
> On 10/13/21 11:11, Thomas Huth wrote:
>> On 13/10/2021 09.55, Pierre Morel wrote:
>>>
>>>
>>> On 10/13/21 09:25, Thomas Huth wrote:
>>>> On 16/09/2021 15.50, Pierre Morel wrote:
>>>>> When the host supports the CPU topology facility, the PTF
>>>>> instruction with function code 2 is interpreted by the SIE,
>>>>> provided that the userland hypervizor activates the interpretation
>>>>> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>>>>
>>>>> The PTF instructions with function code 0 and 1 are intercepted
>>>>> and must be emulated by the userland hypervizor.
>>>>>
>>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>>> ---
>> ...
>>>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>>>> index 5b1fdb55c4..dd036961fe 100644
>>>>> --- a/target/s390x/kvm/kvm.c
>>>>> +++ b/target/s390x/kvm/kvm.c
>>>>> @@ -97,6 +97,7 @@
>>>>>   #define PRIV_B9_EQBS                    0x9c
>>>>>   #define PRIV_B9_CLP                     0xa0
>>>>> +#define PRIV_B9_PTF                     0xa2
>>>>>   #define PRIV_B9_PCISTG                  0xd0
>>>>>   #define PRIV_B9_PCILG                   0xd2
>>>>>   #define PRIV_B9_RPCIT                   0xd3
>>>>> @@ -362,6 +363,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_SIGP, 0);
>>>>>       kvm_vm_enable_cap(s, KVM_CAP_S390_VECTOR_REGISTERS, 0);
>>>>>       kvm_vm_enable_cap(s, KVM_CAP_S390_USER_STSI, 0);
>>>>> +    kvm_vm_enable_cap(s, KVM_CAP_S390_CPU_TOPOLOGY, 0);
>>>>
>>>> Should this maybe rather be done in the last patch, to avoid a state 
>>>> where PTF is available, but STSI 15 is not implemented yet (when 
>>>> bisecting through these commits later)?
>>>>
>>>>   Thomas
>>>>
>>>
>>> Yes you are right, thanks.
>>
>> I'm also still a little bit surprised that there is really no 
>> migration code involved here yet. What if a guest gets started on a 
>> system with KVM_CAP_S390_CPU_TOPOLOGY support and later migrated to a 
>> system without KVM_CAP_S390_CPU_TOPOLOGY support? Is there already 
>> some magic in place that rejects such a migration? If not, the guest 
>> might first learn that it could use the PTF instruction, but suddenly 
>> it is then not available anymore? Does Linux cope right with PTF 
>> becoming unavailable during runtime? But even if it does, I think it's 
>> likely not in the sense of the architecture if certain instructions 
>> might disappear during runtime? Or do I miss something?
>>
>>   Thomas
>>
> 
> 
> I check on this and take the consequences.
> 
> Pierre
> 

I can use a solution using pre_save/postload migration entries to verify 
that both side of the migration use PTF and STSI_15 the same way.

Seems this direction OK ?

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

