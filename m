Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E68146916D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 09:29:08 +0100 (CET)
Received: from localhost ([::1]:43158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mu9Mx-0003yT-9G
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 03:29:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mu9Lj-00039k-L2; Mon, 06 Dec 2021 03:27:51 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:51090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1mu9Lh-0005PJ-5e; Mon, 06 Dec 2021 03:27:51 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B67r53g000456; 
 Mon, 6 Dec 2021 08:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qwMu0Lkl2jTwFpMXolr+r0OVTf2GBpKHT8R2OAtHXnY=;
 b=HBFrQTixSHILNmUBpLhPT3QzAptbTXZjpLrCgEnBt1w24qYtTZ4Od4qf0bDc69m8Q8X1
 r0uufEry/nwOY1OwZUV5b0hLCJ/B+ZsM8IIUIG/H0U90kmHhKktJ3mLy0+WOHk/CSjkH
 AzipgOTSPU5LWh+vCMlC7H7bEWSV9Z8Jyqk4eZmiPp14NXAdMtosbq5YE1MrZcDyh7Lu
 qV6fCFSwNDF+vzSg365CGfoYansqXrmuFnKlnop6OHumGYPWB+L+VeDWliw+sxTXKseY
 3MpB5dvBool2QfcJB6XDeglmSgHQJIj3EwKbLqAVeYp9PGBs2VKHJyyTBu7VQHX9KGp/ Tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3csegwgk5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 08:27:44 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B67r5Dq000448;
 Mon, 6 Dec 2021 08:27:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3csegwgk4t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 08:27:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B68MPtq000828;
 Mon, 6 Dec 2021 08:27:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3cqyy917gh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Dec 2021 08:27:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B68RboU21102916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Dec 2021 08:27:37 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 813BA11C092;
 Mon,  6 Dec 2021 08:27:37 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3609911C05B;
 Mon,  6 Dec 2021 08:27:37 +0000 (GMT)
Received: from [9.171.28.129] (unknown [9.171.28.129])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Dec 2021 08:27:37 +0000 (GMT)
Message-ID: <8eb39d08-4439-8abb-7a41-d7a1a43c1d55@de.ibm.com>
Date: Mon, 6 Dec 2021 09:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] s390: kvm: reduce frequency of CPU syncs of diag318
 info
Content-Language: en-US
To: Collin Walling <walling@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20211122223307.101790-1-walling@linux.ibm.com>
 <aefbdcd0-f65d-7c33-330f-141b1b57395b@de.ibm.com>
 <f3b76f4b-3aff-9dfa-13a3-1a1405c920ee@linux.ibm.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
In-Reply-To: <f3b76f4b-3aff-9dfa-13a3-1a1405c920ee@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VwyvBOp7DfYtQJt2PECaDiTnezLLD02O
X-Proofpoint-GUID: TacH5iU9id8zOOjT04uIXBN24LCc94ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-06_03,2021-12-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112060047
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.076,
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
Cc: thuth@redhat.com, cohuck@redhat.com, frankja@linux.ibm.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 02.12.21 um 21:54 schrieb Collin Walling:
> On 11/23/21 01:14, Christian Borntraeger wrote:
>>
>> Am 22.11.21 um 23:33 schrieb Collin Walling:
>>> DIAGNOSE 0318 is invoked only once during IPL. As such, the
>>> diag318 info will only change once initially and during resets.
>>> Let's only sync the register to convey the info to KVM if and
>>> only if the diag318 info has changed. Only set the dirty bit
>>> flag for diag318 whenever it must be updated.
>>
>> Is this really necessary? In my logs the sync only happens for larger
>> changes (like reset) operations and then yes we log again.
>> But I think it is ok to see such a log entry in these rare events.
> 
> Albeit a micro-optimization, I don't see why the diag318 dirtied bit
> must to be set during /every/ sync. It makes more sense to set the flag
> after the register was actually modified.

My point is that it is NOT set during /every/ sync.
We only set it when level != KVM_PUT_RUNTIME_STATE (see kvm_arch_put_registers)
And this basically never happens during normal runtime, only for major events
like reset.

> 
>>>
>>> The migration handler will invoke the set_diag318 helper on
>>> post_load to ensure the info is set on the destination machine.
>>>
>>> Signed-off-by: Collin Walling <walling@linux.ibm.com>
>>> ---
>>>    target/s390x/kvm/kvm.c |  5 -----
>>>    target/s390x/machine.c | 14 ++++++++++++++
>>>    2 files changed, 14 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>> index 6acf14d5ec..6a141399f7 100644
>>> --- a/target/s390x/kvm/kvm.c
>>> +++ b/target/s390x/kvm/kvm.c
>>> @@ -599,11 +599,6 @@ int kvm_arch_put_registers(CPUState *cs, int level)
>>>            cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_ETOKEN;
>>>        }
>>>    -    if (can_sync_regs(cs, KVM_SYNC_DIAG318)) {
>>> -        cs->kvm_run->s.regs.diag318 = env->diag318_info;
>>> -        cs->kvm_run->kvm_dirty_regs |= KVM_SYNC_DIAG318;
>>> -    }
>>> -
>>>        /* Finally the prefix */
>>>        if (can_sync_regs(cs, KVM_SYNC_PREFIX)) {
>>>            cs->kvm_run->s.regs.prefix = env->psa;
>>> diff --git a/target/s390x/machine.c b/target/s390x/machine.c
>>> index 37a076858c..a5d113ce3a 100644
>>> --- a/target/s390x/machine.c
>>> +++ b/target/s390x/machine.c
>>> @@ -234,6 +234,19 @@ const VMStateDescription vmstate_etoken = {
>>>        }
>>>    };
>>>    +static int diag318_post_load(void *opaque, int version_id)
>>> +{
>>> +    S390CPU *cpu = opaque;
>>> +    CPUState *cs = CPU(cpu);
>>> +    CPUS390XState *env = &S390_CPU(cs)->env;
>>> +
>>> +    if (kvm_enabled()) {
>>> +        kvm_s390_set_diag318(cs, env->diag318_info);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>    static bool diag318_needed(void *opaque)
>>>    {
>>>        return s390_has_feat(S390_FEAT_DIAG_318);
>>> @@ -243,6 +256,7 @@ const VMStateDescription vmstate_diag318 = {
>>>        .name = "cpu/diag318",
>>>        .version_id = 1,
>>>        .minimum_version_id = 1,
>>> +    .post_load = diag318_post_load,
>>>        .needed = diag318_needed,
>>>        .fields = (VMStateField[]) {
>>>            VMSTATE_UINT64(env.diag318_info, S390CPU),
>>>
>>
> 
> 

