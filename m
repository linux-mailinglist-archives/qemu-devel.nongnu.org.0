Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9144D28C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 08:35:56 +0100 (CET)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml4cl-0002vP-1g
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 02:35:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1ml4b2-0002E1-PR; Thu, 11 Nov 2021 02:34:08 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48654
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1ml4b0-0006ym-Sw; Thu, 11 Nov 2021 02:34:08 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AB7CfYe015392; 
 Thu, 11 Nov 2021 07:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=M+Ssjuzz0WBVtAHPMf8YEThDopjuxEjdjvtiFbOExQY=;
 b=TXbCI8i2/Zbm4DaSt8rxxyx6RQISEkJMzo4pCbR7fdd7RG7kqSyS8ZCgC0RchYd9+BHI
 T8OOkN/VK08HsVmxM+aYPIeHmkEpMzxOeGAFgCKLVulJMD1RC2S6T+ntWhY90Qr4TU5G
 XqeyxODhr3tkBy2X+ufrcW0L6mQlB/CTkzk0VktMVH/HKCFVj7r5YFU/msOVvWlL41x7
 F4c6ZQ7QO24VsGI/SIC5/3vFAtvQzraEHKUOwgT2AHcROcxOehll8Ml99Uro+rqTnegV
 4qYgqskw2GdgjBZOOu9sacJoycvlSlrWnWVxgG5cIA/WaWYXTuDYp/dnof5G4P7fJllB KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8xk80bs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 07:34:04 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AB7SlPn007563;
 Thu, 11 Nov 2021 07:34:03 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8xk80bs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 07:34:03 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AB7XjPY011196;
 Thu, 11 Nov 2021 07:34:03 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3c5hbcmpny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Nov 2021 07:34:02 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AB7Y0bm52887952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Nov 2021 07:34:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D409FB2080;
 Thu, 11 Nov 2021 07:34:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 573FCB2077;
 Thu, 11 Nov 2021 07:34:00 +0000 (GMT)
Received: from [9.160.104.209] (unknown [9.160.104.209])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 11 Nov 2021 07:34:00 +0000 (GMT)
Message-ID: <8913ddf9-118a-bbc4-366b-d4455514c6c6@linux.ibm.com>
Date: Thu, 11 Nov 2021 02:33:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3] s390: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211109205602.99732-1-walling@linux.ibm.com>
 <695c3358-54e1-e7ea-76fc-14a2ca91eee1@linux.ibm.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <695c3358-54e1-e7ea-76fc-14a2ca91eee1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6OquIqCQ1cr44Y9BwDPwF1v-jTt_ELEF
X-Proofpoint-ORIG-GUID: lbsn0k6kdEHtW5V2mAOtSC5iJKkEkKet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-11_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111110044
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: borntraeger@de.ibm.com, thuth@redhat.com, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 07:42, Janosch Frank wrote:
> On 11/9/21 21:56, Collin Walling wrote:
>> The CPNC portion of the diag 318 data is erroneously reset during an
>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>> diag318_info field within the CPUS390XState struct such that it is
>> only zeroed during a clear reset. This way, the CPNC will be retained
>> for each VCPU in the configuration after the diag 318 instruction
>> has been invoked.
> 
> I'd add something like:
> The s390 machine reset code takes care of zeroing the diag318 data on VM
> resets which also cover resets caused by diag308.
> 
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
> 
> Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

The CPNC portion of the diag318 data is erroneously reset during an
initial CPU reset caused by SIGP. Let's go ahead and relocate the
diag318_info field within the CPUS390XState struct such that it is
only zeroed during a clear reset. This way, the CPNC will be retained
for each VCPU in the configuration after the diag318 instruction
has been invoked.

The s390_machine_reset code already takes care of zeroing the diag318
data on VM resets, which also cover resets caused by diag308.

Signed-off-by: Collin Walling <walling@linux.ibm.com>
Fixes: fabdada9357b ("s390: guest support for diagnose 0x318")
Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

> 
>>
>> Changelog:
>>
>>      v2
>>      - handler uses run_on_cpu again
>>      - reworded commit message slightly
>>      - added fixes and reported-by tags
>>
>>      v3
>>      - nixed code reduction changes
>>      - added a comment to diag318 handler to briefly describe
>>          when relevent data is zeroed
>>
>> ---
>>   target/s390x/cpu.h     | 4 ++--
>>   target/s390x/kvm/kvm.c | 4 ++++
>>   2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 3153d053e9..88aace36ff 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -63,6 +63,8 @@ struct CPUS390XState {
>>       uint64_t etoken;       /* etoken */
>>       uint64_t etoken_extension; /* etoken extension */
>>   +    uint64_t diag318_info;
>> +
>>       /* Fields up to this point are not cleared by initial CPU reset */
>>       struct {} start_initial_reset_fields;
>>   @@ -118,8 +120,6 @@ struct CPUS390XState {
>>       uint16_t external_call_addr;
>>       DECLARE_BITMAP(emergency_signals, S390_MAX_CPUS);
>>   -    uint64_t diag318_info;
>> -
>>   #if !defined(CONFIG_USER_ONLY)
>>       uint64_t tlb_fill_tec;   /* translation exception code during
>> tlb_fill */
>>       int tlb_fill_exc;        /* exception number seen during
>> tlb_fill */
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 5b1fdb55c4..6acf14d5ec 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -1585,6 +1585,10 @@ void kvm_s390_set_diag318(CPUState *cs,
>> uint64_t diag318_info)
>>           env->diag318_info = diag318_info;
>>           cs->kvm_run->s.regs.diag318 = diag318_info;
>>           cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>> +        /*
>> +         * diag 318 info is zeroed during a clear reset and
>> +         * diag 308 IPL subcodes.
>> +         */
>>       }
>>   }
>>  
> 
> 


-- 
Regards,
Collin

Stay safe and stay healthy

