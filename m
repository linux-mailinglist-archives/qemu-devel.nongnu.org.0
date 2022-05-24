Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E70A5329DD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 13:58:57 +0200 (CEST)
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntTBg-0007Mn-7R
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 07:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ntSRb-0002P1-2B; Tue, 24 May 2022 07:11:20 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28608
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1ntSRN-0005BZ-VU; Tue, 24 May 2022 07:11:18 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OAio4N000397;
 Tue, 24 May 2022 11:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+q8KAPlY8Jqc+g59sULBFgDEZE1n0HeaCPvYWuEJSaA=;
 b=DF8q+4MHLCgOhUwQ2mWqMc11GJClEoUMv+9ohBY6wiFRfUgRM0IodaL8vh2m+ZmLwl2d
 zkQCK+96e5CHKtIADfTlmAYFdPSb+SaIRZrMpsf11pXgemD6HXuA72gEv8kPpaCUmfrq
 xuYsLZmSgwOMABg2t3oVCAlrAps3Rkzl1EoyZkOn17r2QZbjU07Mli5ENRizoUau495t
 F8ONR9pi5vi3F4H6jFNP2oQyJa4FXcDZePU+APZErJmcmkvOqHkbrYoimGKvioXahFns
 hkktXXgn81tsv+c6P9O05/aBcJZ6wXhgWDDoX75Dq3jPSdEoyYSRXMlGzj8H4OUrV0h0 TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8wvqrfsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:11:02 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24OAxmOk028003;
 Tue, 24 May 2022 11:11:02 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8wvqrfsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:11:01 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OB21Tu013165;
 Tue, 24 May 2022 11:10:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3g6qq9bhvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:10:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OBAu7l48759116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 11:10:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 681DB4C04A;
 Tue, 24 May 2022 11:10:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0A4F4C044;
 Tue, 24 May 2022 11:10:55 +0000 (GMT)
Received: from [9.171.38.128] (unknown [9.171.38.128])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 11:10:55 +0000 (GMT)
Message-ID: <e948f801-c3bf-7f85-3afd-b336146398a9@linux.ibm.com>
Date: Tue, 24 May 2022 13:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <20220506153956.2217601-3-scgl@linux.ibm.com>
 <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
 <384df8c6-4309-17a5-464e-46b23507f362@linux.ibm.com>
 <17934f59-4425-cdae-80b2-cfeb9bd97f7d@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <17934f59-4425-cdae-80b2-cfeb9bd97f7d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VEvxOSAOlQ46muPfgSq6k9dGV6gjSqA5
X-Proofpoint-GUID: zK0XHHmZod1m50Mlcod-RHdQr3b7iP7W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240057
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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



Am 24.05.22 um 12:43 schrieb Thomas Huth:
> On 19/05/2022 15.53, Janis Schoetterl-Glausch wrote:
>> On 5/19/22 12:05, Thomas Huth wrote:
>>> On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
>>>> Storage key controlled protection is currently not honored when
>>>> emulating instructions.
>>>> If available, enable key protection for the MEM_OP ioctl, thereby
>>>> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
>>>> As a result, the emulation of the following instructions honors storage
>>>> keys:
>>>>
>>>> * CLP
>>>>         The Synch I/O CLP command would need special handling in order
>>>>         to support storage keys, but is currently not supported.
>>>> * CHSC
>>>>      Performing commands asynchronously would require special
>>>>      handling, but commands are currently always synchronous.
>>>> * STSI
>>>> * TSCH
>>>>      Must (and does) not change channel if terminated due to
>>>>      protection.
>>>> * MSCH
>>>>      Suppressed on protection, works because fetching instruction.
>>>> * SSCH
>>>>      Suppressed on protection, works because fetching instruction.
>>>> * STSCH
>>>> * STCRW
>>>>      Suppressed on protection, this works because no partial store is
>>>>      possible, because the operand cannot span multiple pages.
>>>> * PCISTB
>>>> * MPCIFC
>>>> * STPCIFC
>>>>
>>>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>>>> ---
>>>>    target/s390x/kvm/kvm.c | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>>>> index 53098bf541..7bd8db0e7b 100644
>>>> --- a/target/s390x/kvm/kvm.c
>>>> +++ b/target/s390x/kvm/kvm.c
>>>> @@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>>>    static int cap_sync_regs;
>>>>    static int cap_async_pf;
>>>>    static int cap_mem_op;
>>>> +static int cap_mem_op_extension;
>>>>    static int cap_s390_irq;
>>>>    static int cap_ri;
>>>>    static int cap_hpage_1m;
>>>>    static int cap_vcpu_resets;
>>>>    static int cap_protected;
>>>>    +static bool mem_op_storage_key_support;
>>>> +
>>>>    static int active_cmma;
>>>>      static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>>>> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>        cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>>>>        cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>>>>        cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>>>> +    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
>>>> +    mem_op_storage_key_support = cap_mem_op_extension > 0;
>>>
>>> Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a boolean flag? ... ok, now I've finally understood that ... ;-)
>>
>> Yeah, potentially having a bunch of memop capabilities didn't seem nice to me.
>> We can remove extensions if, when introducing an extension, we define that version x supports functionality y, z...,
>> but for the storage keys I've written in api.rst that it's supported if the cap > 0.
>> So we'd need a new cap if we want to get rid of the skey extension and still support some other extension,
>> but that doesn't seem particularly likely.
> 
> Oh well, never say that ... we've seen it in the past, that sometimes we want to get rid of features again, and if they don't have a separate feature flag bit somewhere, it's getting very ugly to disable them again.
> 
> So since we don't have merged this patch yet, and thus we don't have a public userspace program using this interface yet, this is our last chance to redefine this interface before we might regret it later.
> 
> I'm in strong favor of treating the KVM_CAP_S390_MEM_OP_EXTENSION as a flag field instead of a version number. What do others think? Christian? Halil?

Its too late for that. This is part of 5.18.

