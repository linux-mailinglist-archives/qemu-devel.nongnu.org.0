Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86644466B40
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:57:46 +0100 (CET)
Received: from localhost ([::1]:57036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst9F-00078v-Jq
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:57:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mst6e-0004GV-Ot; Thu, 02 Dec 2021 15:55:05 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43048
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <walling@linux.ibm.com>)
 id 1mst6c-0006h0-Dc; Thu, 02 Dec 2021 15:55:04 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2JEVFh024078; 
 Thu, 2 Dec 2021 20:54:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LPDVm4gSbLWiyRi+jeLwcclBtT0u4d0eEqbNCaZiD/k=;
 b=WpLpCE80ISjvo5QZT74HXygYBsoKoUYGpZjsrMP5h+UMho9q++xBdtxsc++kl14qDD+G
 hkAvN1TqgSUMqOioBkqGuXkhP2A86G5C7bfbH5T69nFsxFFRC3mRzcZhN83rHv1wn3rs
 E+iPbhc8vEVo2kx+WNcjv1e5jMyrdPuQ1gizm8mKlFZxUk2TgoNQGvzyIsXJgqtoyjR/
 JLr9KpDXp/xa3NkQTog5/RXhm9QHf7/q/I8xht7aY4eHhED8IAR31+ufj9xv4R/F1JNZ
 lvyNI6xAyhvzIO6Qeojd8cQnCFf3LJimB8FbQBN4yIhW73CEEMkG7A/6U6kDHVuLosxM 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq3ccjq27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 20:54:58 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2Kr3C0030171;
 Thu, 2 Dec 2021 20:54:57 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq3ccjq21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 20:54:57 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2KrAaH023128;
 Thu, 2 Dec 2021 20:54:57 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3ckcadkxae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 20:54:57 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2KstK431719912
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 20:54:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DE7AC6063;
 Thu,  2 Dec 2021 20:54:55 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8BD6C6055;
 Thu,  2 Dec 2021 20:54:54 +0000 (GMT)
Received: from [9.65.67.243] (unknown [9.65.67.243])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 20:54:54 +0000 (GMT)
Message-ID: <f3b76f4b-3aff-9dfa-13a3-1a1405c920ee@linux.ibm.com>
Date: Thu, 2 Dec 2021 15:54:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH] s390: kvm: reduce frequency of CPU syncs of diag318
 info
Content-Language: en-US
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211122223307.101790-1-walling@linux.ibm.com>
 <aefbdcd0-f65d-7c33-330f-141b1b57395b@de.ibm.com>
From: Collin Walling <walling@linux.ibm.com>
In-Reply-To: <aefbdcd0-f65d-7c33-330f-141b1b57395b@de.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S0Qm2heKsMFIIXXtxPAvJxO0wbIHOKNn
X-Proofpoint-GUID: A8s-9fl-_cAtgYqRCN8gfcb0h7F27iRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_14,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112020131
Received-SPF: pass client-ip=148.163.158.5; envelope-from=walling@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.3,
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
Cc: thuth@redhat.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 01:14, Christian Borntraeger wrote:
> 
> Am 22.11.21 um 23:33 schrieb Collin Walling:
>> DIAGNOSE 0318 is invoked only once during IPL. As such, the
>> diag318 info will only change once initially and during resets.
>> Let's only sync the register to convey the info to KVM if and
>> only if the diag318 info has changed. Only set the dirty bit
>> flag for diag318 whenever it must be updated.
> 
> Is this really necessary? In my logs the sync only happens for larger
> changes (like reset) operations and then yes we log again.
> But I think it is ok to see such a log entry in these rare events.

Albeit a micro-optimization, I don't see why the diag318 dirtied bit
must to be set during /every/ sync. It makes more sense to set the flag
after the register was actually modified.

>>
>> The migration handler will invoke the set_diag318 helper on
>> post_load to ensure the info is set on the destination machine.
>>
>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>> ---
>>   target/s390x/kvm/kvm.c |  5 -----
>>   target/s390x/machine.c | 14 ++++++++++++++
>>   2 files changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 6acf14d5ec..6a141399f7 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -599,11 +599,6 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>>           cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
>>       }
>>   -    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
>> -        cs->kvm_run->s.regs.diag318 = env->diag318_info;
>> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>> -    }
>> -
>>       /* Finally the prefix */
>>       if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
>>           cs->kvm_run->s.regs.prefix = env->psa;
>> diff --git a/target/s390x/machine.c b/target/s390x/machine.c
>> index 37a076858c..a5d113ce3a 100644
>> --- a/target/s390x/machine.c
>> +++ b/target/s390x/machine.c
>> @@ -234,6 +234,19 @@ const VMStateDescription vmstate_etoken = {
>>       }
>>   };
>>   +static int diag318_post_load(void *opaque, int version_id)
>> +{
>> +    S390CPU *cpu = opaque;
>> +    CPUState *cs = CPU(cpu);
>> +    CPUS390XState *env = &S390_CPU(cs)->env;
>> +
>> +    if (kvm_enabled()) {
>> +        kvm_s390_set_diag318(cs, env->diag318_info);
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static bool diag318_needed(void *opaque)
>>   {
>>       return s390_has_feat(S390_FEAT_DIAG_318);
>> @@ -243,6 +256,7 @@ const VMStateDescription vmstate_diag318 = {
>>       .name = "cpu/diag318",
>>       .version_id = 1,
>>       .minimum_version_id = 1,
>> +    .post_load = diag318_post_load,
>>       .needed = diag318_needed,
>>       .fields = (VMStateField[]) {
>>           VMSTATE_UINT64(env.diag318_info, S390CPU),
>>
> 


-- 
Regards,
Collin

Stay safe and stay healthy

