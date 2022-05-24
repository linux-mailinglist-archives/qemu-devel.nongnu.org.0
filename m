Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E8532A70
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 14:35:10 +0200 (CEST)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTkj-0002y4-Sz
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 08:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1ntT5n-0001Au-IW; Tue, 24 May 2022 07:52:54 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5796
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1ntT5l-0004LP-9H; Tue, 24 May 2022 07:52:51 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OBlJ8Y022270;
 Tue, 24 May 2022 11:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rcA7GnnPINbQogkhqqcdg5eWfe4Hs357gnhfBYGQAo8=;
 b=l1NdXVU3z2QksBl8cWpKW18J2thqUQ+mqIX98BnWLqkthXDAg0WJ5DL0/HMw1jOYj/MD
 NVRc2rKylZhE/Hlr6TbpS8fiS9Mt4wOXdKVP4lH2/VPh/6pBwwDHPWL3eavIhpH1r5aD
 hh++d67SiWf06d/BZUC8zX+jovqKO/DBCdVEtHwEYhBjgj27+EThYuqxN7OFesI8UnPH
 IXeiWwYhXuV9ka0UHZOvFVYsM13zRWh+4ZU60Jrwyr12hL5UXMj6GiJu6TgK5qimnEfI
 6DetEaxICwwdjZ5kMbwu/yaOcOZfdkfgEH0WYvSC4L3xNF/Yu2UVo1v9XHHIkD+2Je/2 Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8xt0g2pt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:52:46 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24OBmKnm024927;
 Tue, 24 May 2022 11:52:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8xt0g2pf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:52:45 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OBmVCR013063;
 Tue, 24 May 2022 11:52:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3g6qq9ccrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:52:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OBqfrH43909488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 11:52:41 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F29965204F;
 Tue, 24 May 2022 11:52:40 +0000 (GMT)
Received: from [9.155.196.57] (unknown [9.155.196.57])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9EC3C52050;
 Tue, 24 May 2022 11:52:40 +0000 (GMT)
Message-ID: <562d9424-67a6-add4-70dc-94d05c112875@linux.ibm.com>
Date: Tue, 24 May 2022 13:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <20220506153956.2217601-3-scgl@linux.ibm.com>
 <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
 <384df8c6-4309-17a5-464e-46b23507f362@linux.ibm.com>
 <17934f59-4425-cdae-80b2-cfeb9bd97f7d@redhat.com>
 <e948f801-c3bf-7f85-3afd-b336146398a9@linux.ibm.com>
 <489c9e03-417d-e201-26b9-bf2835127734@redhat.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <489c9e03-417d-e201-26b9-bf2835127734@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zPeOSi8ZIRGrTmEyBjfU0oiJk-CIsQPD
X-Proofpoint-ORIG-GUID: prxFVfpibOYm7EqO8C9PMh4_h7eQppBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240059
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

On 5/24/22 13:21, Thomas Huth wrote:
> On 24/05/2022 13.10, Christian Borntraeger wrote:
>>
>>
>> Am 24.05.22 um 12:43 schrieb Thomas Huth:
>>> On 19/05/2022 15.53, Janis Schoetterl-Glausch wrote:
>>>> On 5/19/22 12:05, Thomas Huth wrote:
>>>>> On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
>>>>>> Storage key controlled protection is currently not honored when
>>>>>> emulating instructions.
>>>>>> If available, enable key protection for the MEM_OP ioctl, thereby
>>>>>> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
>>>>>> As a result, the emulation of the following instructions honors storage
>>>>>> keys:
>>>>>>
>>>>>> * CLP
>>>>>>         The Synch I/O CLP command would need special handling in order
>>>>>>         to support storage keys, but is currently not supported.
>>>>>> * CHSC
>>>>>>      Performing commands asynchronously would require special
>>>>>>      handling, but commands are currently always synchronous.
>>>>>> * STSI
>>>>>> * TSCH
>>>>>>      Must (and does) not change channel if terminated due to
>>>>>>      protection.
>>>>>> * MSCH
>>>>>>      Suppressed on protection, works because fetching instruction.
>>>>>> * SSCH
>>>>>>      Suppressed on protection, works because fetching instruction.
>>>>>> * STSCH
>>>>>> * STCRW
>>>>>>      Suppressed on protection, this works because no partial store is
>>>>>>      possible, because the operand cannot span multiple pages.
>>>>>> * PCISTB
>>>>>> * MPCIFC
>>>>>> * STPCIFC
>>>>>>
>>>>>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>>>>>> ---
>>>>>>    target/s390x/kvm/kvm.c | 9 +++++++++
>>>>>>    1 file changed, 9 insertions(+)
>>>>>>
>>>>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>>>>> index 53098bf541..7bd8db0e7b 100644
>>>>>> --- a/target/s390x/kvm/kvm.c
>>>>>> +++ b/target/s390x/kvm/kvm.c
>>>>>> @@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>>>>>    static int cap_sync_regs;
>>>>>>    static int cap_async_pf;
>>>>>>    static int cap_mem_op;
>>>>>> +static int cap_mem_op_extension;
>>>>>>    static int cap_s390_irq;
>>>>>>    static int cap_ri;
>>>>>>    static int cap_hpage_1m;
>>>>>>    static int cap_vcpu_resets;
>>>>>>    static int cap_protected;
>>>>>>    +static bool mem_op_storage_key_support;
>>>>>> +
>>>>>>    static int active_cmma;
>>>>>>      static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>>>>>> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>>>        cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>>>>>>        cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>>>>>>        cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>>>>>> +    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
>>>>>> +    mem_op_storage_key_support = cap_mem_op_extension > 0;
>>>>>
>>>>> Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a boolean flag? ... ok, now I've finally understood that ... ;-)
>>>>
>>>> Yeah, potentially having a bunch of memop capabilities didn't seem nice to me.
>>>> We can remove extensions if, when introducing an extension, we define that version x supports functionality y, z...,
>>>> but for the storage keys I've written in api.rst that it's supported if the cap > 0.
>>>> So we'd need a new cap if we want to get rid of the skey extension and still support some other extension,
>>>> but that doesn't seem particularly likely.
>>>
>>> Oh well, never say that ... we've seen it in the past, that sometimes we want to get rid of features again, and if they don't have a separate feature flag bit somewhere, it's getting very ugly to disable them again.
>>>
>>> So since we don't have merged this patch yet, and thus we don't have a public userspace program using this interface yet, this is our last chance to redefine this interface before we might regret it later.
>>>
>>> I'm in strong favor of treating the KVM_CAP_S390_MEM_OP_EXTENSION as a flag field instead of a version number. What do others think? Christian? Halil?
>>
>> Its too late for that. This is part of 5.18.
> 
> Is it? We don't have to change the source code of the kernel,
> it's just about rewording what we have in api.rst documentation
> (which should be OK as long as there is no userspace program
> using this yet), e.g.:
> 
api.rst says about KVM_CHECK_EXTENSION:
:Returns: 0 if unsupported; 1 (or some other positive integer) if supported

but if we can return a negative value, we can define flags for possible future extensions
and flip the sign bit if we want to get rid of the storage key extension.

A bit ugly, but doesn't require any changes now.

