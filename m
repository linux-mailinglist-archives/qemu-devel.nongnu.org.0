Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3452D52F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 15:54:45 +0200 (CEST)
Received: from localhost ([::1]:58364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrgc0-0005qC-Hm
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 09:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nrgay-0005Ak-A9; Thu, 19 May 2022 09:53:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1nrgaw-0000oI-A0; Thu, 19 May 2022 09:53:40 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JDHTvN005967;
 Thu, 19 May 2022 13:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ol55uRCvYWgWyBl/03RigGLhvv0+9Dp3mqx4dOkYdqQ=;
 b=AzbVeVfiH1aCfxZAhCLkwVC/e+fZqRSmORMLpfrYw4btBjuv0l+ArmZdJ/Yw/yZskKwZ
 5lZSSWXS60MoBqbwv9QiktSRcv0o1wTFHBJTFBBEMnCtwpTAK8xE62Y4/Gc9Wf7p0ddO
 NguHDPTNp56+SH+59m5t+rSK5r6lvSELBUAGC3AtFsisBJSpPtd/xzKTP1T0oCzLBnnd
 AqBWzvKwjLOkoGXOGekh8HHPCi6XfWCErSGlef9Q1k2vcXyYdkHmqYp6Gcwlv1efQB6/
 D75ZwY9dOWeDxqk6kFJc3ioYRTW8rFZgZbLs6PGP8+dhY6iHCOeZIpJEpUClq4rH7p3y 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5pn08vnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 13:53:33 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24JDrWMk010381;
 Thu, 19 May 2022 13:53:32 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g5pn08vmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 13:53:32 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24JDpAwR021419;
 Thu, 19 May 2022 13:53:30 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3g2428x2us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 13:53:30 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24JDrQQN46072118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 13:53:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8DAAAE045;
 Thu, 19 May 2022 13:53:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1271AE051;
 Thu, 19 May 2022 13:53:25 +0000 (GMT)
Received: from [9.171.37.72] (unknown [9.171.37.72])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 May 2022 13:53:25 +0000 (GMT)
Message-ID: <384df8c6-4309-17a5-464e-46b23507f362@linux.ibm.com>
Date: Thu, 19 May 2022 15:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/2] target/s390x: kvm: Honor storage keys during emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20220506153956.2217601-1-scgl@linux.ibm.com>
 <20220506153956.2217601-3-scgl@linux.ibm.com>
 <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <21468730-e57f-a54a-bde4-6bb927d6b651@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w43M2DY85xa053HGTy6E1PABTRj1Oh2X
X-Proofpoint-ORIG-GUID: 68TDDuV0nj-oSeMZuhquhK1RIsgj38k5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_03,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190078
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
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

On 5/19/22 12:05, Thomas Huth wrote:
> On 06/05/2022 17.39, Janis Schoetterl-Glausch wrote:
>> Storage key controlled protection is currently not honored when
>> emulating instructions.
>> If available, enable key protection for the MEM_OP ioctl, thereby
>> enabling it for the s390_cpu_virt_mem_* functions, when using kvm.
>> As a result, the emulation of the following instructions honors storage
>> keys:
>>
>> * CLP
>>        The Synch I/O CLP command would need special handling in order
>>        to support storage keys, but is currently not supported.
>> * CHSC
>>     Performing commands asynchronously would require special
>>     handling, but commands are currently always synchronous.
>> * STSI
>> * TSCH
>>     Must (and does) not change channel if terminated due to
>>     protection.
>> * MSCH
>>     Suppressed on protection, works because fetching instruction.
>> * SSCH
>>     Suppressed on protection, works because fetching instruction.
>> * STSCH
>> * STCRW
>>     Suppressed on protection, this works because no partial store is
>>     possible, because the operand cannot span multiple pages.
>> * PCISTB
>> * MPCIFC
>> * STPCIFC
>>
>> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>> ---
>>   target/s390x/kvm/kvm.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index 53098bf541..7bd8db0e7b 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -151,12 +151,15 @@ const KVMCapabilityInfo kvm_arch_required_capabilities[] = {
>>   static int cap_sync_regs;
>>   static int cap_async_pf;
>>   static int cap_mem_op;
>> +static int cap_mem_op_extension;
>>   static int cap_s390_irq;
>>   static int cap_ri;
>>   static int cap_hpage_1m;
>>   static int cap_vcpu_resets;
>>   static int cap_protected;
>>   +static bool mem_op_storage_key_support;
>> +
>>   static int active_cmma;
>>     static int kvm_s390_query_mem_limit(uint64_t *memory_limit)
>> @@ -354,6 +357,8 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>       cap_sync_regs = kvm_check_extension(s, KVM_CAP_SYNC_REGS);
>>       cap_async_pf = kvm_check_extension(s, KVM_CAP_ASYNC_PF);
>>       cap_mem_op = kvm_check_extension(s, KVM_CAP_S390_MEM_OP);
>> +    cap_mem_op_extension = kvm_check_extension(s, KVM_CAP_S390_MEM_OP_EXTENSION);
>> +    mem_op_storage_key_support = cap_mem_op_extension > 0;
> 
> Ah, so KVM_CAP_S390_MEM_OP_EXTENSION is a "version number", not a boolean flag? ... ok, now I've finally understood that ... ;-)

Yeah, potentially having a bunch of memop capabilities didn't seem nice to me.
We can remove extensions if, when introducing an extension, we define that version x supports functionality y, z...,
but for the storage keys I've written in api.rst that it's supported if the cap > 0.
So we'd need a new cap if we want to get rid of the skey extension and still support some other extension, 
but that doesn't seem particularly likely.
> 
> (would it be better to treat it as a flag field, so that certain extensions could go away again in the future? In that case, it would be better to check with "& 1" instead of "> 0" here)
> 
>  Thomas
> 


