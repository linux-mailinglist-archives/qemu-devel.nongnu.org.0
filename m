Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC0C5EDCB7
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 14:31:42 +0200 (CEST)
Received: from localhost ([::1]:46548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odWE0-00051N-Ml
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 08:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odSi7-0004ps-1l; Wed, 28 Sep 2022 04:46:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:13700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odSi5-0004gY-3O; Wed, 28 Sep 2022 04:46:30 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S7QFPw032258;
 Wed, 28 Sep 2022 08:46:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WGNIwXkK2yM7/onef03POh86QKLbUZpc9KOrZvulm64=;
 b=enLIYpHRQ03C7pKvNBwcUX7Zak2JHSIIPU/PfdJgPxFrPD+9PYAvUMQJ0ChZWvpn05X2
 7V4iQhkYwWtc/OH5q4aZKdlkqTkpsc4o45/+UhxU28/j3Ee+jSjxJenz8tAF2FLrdoSA
 WK3u4rpkkddPmHNV3LA+16VEXhmSXQeZVo3wGXNUMh5X43/lmuHzrQ6o2PGZ8W16+t7Z
 HWSiS9Z5D3D6gDy2cQ9bGzAqq7CgyEvihVE2sUXkxrlLY2CwV6m5OzII6mVWMpPcj0gc
 8kFgFHUZFxNE9QglmxiBDmrBAfdzzjxAacmyYDtIHN3FRGNpRqkkr8I51vD7UvxLoS6f kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvf8reck9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:46:27 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S8igf3023204;
 Wed, 28 Sep 2022 08:46:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvf8recj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:46:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S8Zq01014915;
 Wed, 28 Sep 2022 08:46:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3jssh9cxt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 08:46:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28S8kLNo39453196
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 08:46:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 527644C044;
 Wed, 28 Sep 2022 08:46:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68EF44C040;
 Wed, 28 Sep 2022 08:46:20 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 08:46:20 +0000 (GMT)
Message-ID: <782f0fb8-0c2e-49cc-e347-7be1eb6c5721@linux.ibm.com>
Date: Wed, 28 Sep 2022 10:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 06/10] s390x/cpu_topology: resetting the
 Topology-Change-Report
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-7-pmorel@linux.ibm.com>
 <2ced62d89af99358d3d6d8d89e2faf8b115e8509.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <2ced62d89af99358d3d6d8d89e2faf8b115e8509.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rcqCKPMUFIqdEtfl9MUERlQsl64-AyR_
X-Proofpoint-GUID: M5zFlKve_t25Ohqnp0HwjprR1UEc7lSC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280051
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/8/22 09:57, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
>> During a subsystem reset the Topology-Change-Report is cleared
>> by the machine.
>> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>>   bit of the SCA in the case of a subsystem reset.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/cpu-topology.c      | 12 ++++++++++++
>>   hw/s390x/s390-virtio-ccw.c   |  1 +
>>   target/s390x/cpu-sysemu.c    |  7 +++++++
>>   target/s390x/cpu.h           |  1 +
>>   target/s390x/kvm/kvm.c       | 23 +++++++++++++++++++++++
>>   target/s390x/kvm/kvm_s390x.h |  1 +
>>   6 files changed, 45 insertions(+)
> 
> [...]
> 
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index f96630440b..9c994d27d5 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -2585,3 +2585,26 @@ int kvm_s390_get_zpci_op(void)
>>   {
>>       return cap_zpci_op;
>>   }
>> +
>> +int kvm_s390_topology_set_mtcr(uint64_t attr)
>> +{
>> +    struct kvm_device_attr attribute = {
>> +        .group = KVM_S390_VM_CPU_TOPOLOGY,
>> +        .attr  = attr,
>> +    };
>> +    int ret;
>> +
>> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
>> +        return -EFAULT;
> 
> Why EFAULT?
any proposition?

> The return value is just ignored when resetting, isn't it?

In migration the same function is used and we need to return an error there.
But if we would not use it, after the comments you did for migration, we 
may indeed not need it, then I guess using error_report and a void 
function may be better.

> I wonder if it would be better not to.
> Is it necessary because you're detecting the feature after you've
> already created the S390Topology instance?
> And you're doing that because that's just the order in which QEMU does
> things? So the machine class is inited before the cpu model?
> I wonder if there is a nice way to create the S390Topology only if the
> feature is selected.

I do not know if it is possible. I will look.

> 
> Anyway:
> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>

Thanks,
Pierre

> 
>> +    }
>> +    if (!kvm_vm_check_attr(kvm_state, KVM_S390_VM_CPU_TOPOLOGY, attr)) {
>> +        return -ENOENT;
>> +    }
>> +
>> +    ret = kvm_vm_ioctl(kvm_state, KVM_SET_DEVICE_ATTR, &attribute);
>> +    if (ret) {
>> +        error_report("Failed to set cpu topology attribute %lu: %s",
>> +                     attr, strerror(-ret));
>> +    }
>> +    return ret;
>> +}
>>
> [...]
> 

-- 
Pierre Morel
IBM Lab Boeblingen

