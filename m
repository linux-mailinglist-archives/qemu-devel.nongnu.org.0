Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE6449803
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 16:18:54 +0100 (CET)
Received: from localhost ([::1]:38740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk6Q9-0007m7-57
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 10:18:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mk6Jm-0008BP-Cg; Mon, 08 Nov 2021 10:12:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mk6Jj-0002Kk-NV; Mon, 08 Nov 2021 10:12:18 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8DjX7U034895; 
 Mon, 8 Nov 2021 15:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6lxbp1Ci58wP3f7jScgEzOrt1l3flGvXZiAMENqL7OE=;
 b=QfH8e4zTGXHw1OkYQlh+v15KWJahqChjL5cLUYbE3VVZflZIWbfERyZd4zaZUhrlDKOz
 Q32rcJ2YtTQoxr+r8YKY1IW2liMIRT8ZVKllO3RuuG3GJT75l1xsDgR/HMXND9ced4P5
 85J3ljnTgGt15IU7ErO1yJy6fNNl5LrLRQJdH4p16fO/8BVJYLHYo//TQN7tUC8WeIyH
 sg1XkM/TzUNQggsx4WPkjhZqAlNb4Dt58/Il6yr8gIzMmCCFTibbwXjreKC8KbEMkYaq
 FDjkSeYVOSrsLuKON29ythmh10bKfw78i7ZFZrX31RMg2eBD7TFuH1ha9Jh3ooxvyDUa 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c66rq2s2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 15:12:09 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A8CxM26040715;
 Mon, 8 Nov 2021 15:12:09 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c66rq2s21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 15:12:08 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A8F8awu005493;
 Mon, 8 Nov 2021 15:12:07 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3c5hbawh1c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Nov 2021 15:12:07 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1A8FC5JX19661198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Nov 2021 15:12:05 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F6476E052;
 Mon,  8 Nov 2021 15:12:05 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A04236E064;
 Mon,  8 Nov 2021 15:12:04 +0000 (GMT)
Received: from [9.160.104.209] (unknown [9.160.104.209])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Nov 2021 15:12:04 +0000 (GMT)
Message-ID: <f248cd25-ee7e-7d02-2952-8690b42ea595@linux.ibm.com>
Date: Mon, 8 Nov 2021 10:12:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] s390x: kvm: adjust diag318 resets to retain data
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211105224646.803661-1-walling@linux.ibm.com>
 <d552f5df-2a1f-21d2-2a02-5df512a0d77d@de.ibm.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <d552f5df-2a1f-21d2-2a02-5df512a0d77d@de.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 50Rc8hMJPyvcLY78ZAMU8hjkB1AlKGxK
X-Proofpoint-GUID: CCUsFDnA2m0ZJh_CTlOrhWUFLnmCksuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-08_05,2021-11-08_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.06,
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
Cc: thuth@redhat.com, cohuck@redhat.com, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 03:07, Christian Borntraeger wrote:
> 
> 
> Am 05.11.21 um 23:46 schrieb Collin Walling:
>> The CPNC portion of the diag 318 data is erroneously reset during an
>> initial CPU reset caused by SIGP. Let's go ahead and relocate the
>> diag318_info field within the CPUS390XState struct such that it is
>> only zeroed during a clear reset. This way, the CPNC will be retained
>> for each VCPU in the configuration after the diag 318 instruction
>> has been invoked by the kernel.
>>
>> Additionally, the diag 318 data reset is handled via the CPU reset
>> code. The set_diag318 code can be merged into the handler function
>> and the helper functions can consequently be removed.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>

[...]

>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 5b1fdb55c4..ed9c477b6f 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -1576,18 +1576,6 @@ static int handle_sw_breakpoint(S390CPU *cpu,
>> struct kvm_run *run)
>>       return -ENOENT;
>>   }
>>   -void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info)
>> -{
>> -    CPUS390XState *env = &S390_CPU(cs)->env;
>> -
>> -    /* Feat bit is set only if KVM supports sync for diag318 */
>> -    if (s390_has_feat(S390_FEAT_DIAG_318)) {
>> -        env->diag318_info = diag318_info;
>> -        cs->kvm_run->s.regs.diag318 = diag318_info;
>> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>> -    }
>> -}
>> -
>>   static void handle_diag_318(S390CPU *cpu, struct kvm_run *run)
>>   {
>>       uint64_t reg = (run->s390_sieic.ipa & 0x00f0) >> 4;
>> @@ -1604,8 +1592,11 @@ static void handle_diag_318(S390CPU *cpu,
>> struct kvm_run *run)
>>       }
>>         CPU_FOREACH(t) {
>> -        run_on_cpu(t, s390_do_cpu_set_diag318,
>> -                   RUN_ON_CPU_HOST_ULONG(diag318_info));
>> +        CPUS390XState *env = &S390_CPU(t)->env;
>> +
>> +        env->diag318_info = diag318_info;
>> +        t->kvm_run->s.regs.diag318 = diag318_info;
>> +        t->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
> 
> I am not sure if this part works fine. What happens if
> another CPU is currently in SIE (not stopped).
> Then this change will be not visible in that CPU and in
> fact this change will be overwritten when the CPU exits to QEMU.
> 

Ah, I should've paid more attention to what run_on_cpu does. I now see
that it makes CPU changes atomic. I'll reintroduce the helper as a
static function and use the run_on_cpu again.


-- 
Regards,
Collin

Stay safe and stay healthy

