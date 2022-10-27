Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FE960F35F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:12:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onyvL-0001rN-Af; Thu, 27 Oct 2022 05:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1onyvJ-0001aA-0a; Thu, 27 Oct 2022 05:11:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1onyv4-0004QM-Fa; Thu, 27 Oct 2022 05:11:35 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29R90tXo009318;
 Thu, 27 Oct 2022 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rAKUecHQEdrjwui7E1JnKA/Yfyl9COz5CxxYDX2rcV4=;
 b=ktJLnWp8zIgmuOXyBZiu7Se5rZc3k+jitsmA7yptzJ4foSHcZ1Dz1UgJN6c65yjOnvt4
 ye9usPwVlEk+k1g6WBSL2h8ko80FagpfE80XL+xJB2GwTsKprzJJQfh8Yxfy3E1zqN2h
 j/AGxyyJWrwIUxzC6p+rpgQWn8xOBdvEFbuYWsf/CoRu3sp6kq4tliMKwYkm2DwBhuC8
 vab40emo6XiaYCiAYYy3off8p5loPfnbzLhNDBzVWStbfmL53zihFlubfGjLO2FF8Ttg
 uRVQKyy+6buoLlbZ5mi0FE+cLgR5f9eQuINOjohH6kqjUXw7du1do71zGvDlROq3oAJP OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfq018dpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 09:11:11 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29R91CFM010631;
 Thu, 27 Oct 2022 09:11:11 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kfq018dns-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 09:11:11 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29R9650V024546;
 Thu, 27 Oct 2022 09:11:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3kfahd137m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Oct 2022 09:11:09 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29R9B6Cq4063844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Oct 2022 09:11:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F0C96A405C;
 Thu, 27 Oct 2022 09:11:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1A23A405B;
 Thu, 27 Oct 2022 09:11:04 +0000 (GMT)
Received: from [9.179.10.218] (unknown [9.179.10.218])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 27 Oct 2022 09:11:04 +0000 (GMT)
Message-ID: <77d52b82-aa44-ed79-2345-1b3c3a15fb7d@linux.ibm.com>
Date: Thu, 27 Oct 2022 11:11:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v10 3/9] s390x/cpu_topology: resetting the
 Topology-Change-Report
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-4-pmorel@linux.ibm.com>
 <450544bf-4ff0-9d72-f57c-4274692916a5@redhat.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <450544bf-4ff0-9d72-f57c-4274692916a5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SqwhlG6aOcjCG_Nro-FGrOtSDFyXA_5o
X-Proofpoint-ORIG-GUID: jpjxv0SKC5t0-xG9gkJKBj_2o4Hf_YQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_03,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210270051
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 10/27/22 10:14, Thomas Huth wrote:
> On 12/10/2022 18.21, Pierre Morel wrote:
>> During a subsystem reset the Topology-Change-Report is cleared
>> by the machine.
>> Let's ask KVM to clear the Modified Topology Change Report (MTCR)
>>   bit of the SCA in the case of a subsystem reset.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> Reviewed-by: Nico Boehr <nrb@linux.ibm.com>
>> Reviewed-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
>> ---
>>   target/s390x/cpu.h           |  1 +
>>   target/s390x/kvm/kvm_s390x.h |  1 +
>>   hw/s390x/cpu-topology.c      | 12 ++++++++++++
>>   hw/s390x/s390-virtio-ccw.c   |  1 +
>>   target/s390x/cpu-sysemu.c    |  7 +++++++
>>   target/s390x/kvm/kvm.c       | 23 +++++++++++++++++++++++
>>   6 files changed, 45 insertions(+)
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index d604aa9c78..9b35795ac8 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -825,6 +825,7 @@ void s390_enable_css_support(S390CPU *cpu);
>>   void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t 
>> sch_id,
>>                                   int vq, bool assign);
>> +void s390_cpu_topology_reset(void);
>>   #ifndef CONFIG_USER_ONLY
>>   unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
>>   #else
>> diff --git a/target/s390x/kvm/kvm_s390x.h b/target/s390x/kvm/kvm_s390x.h
>> index aaae8570de..a13c8fb9a3 100644
>> --- a/target/s390x/kvm/kvm_s390x.h
>> +++ b/target/s390x/kvm/kvm_s390x.h
>> @@ -46,5 +46,6 @@ void kvm_s390_crypto_reset(void);
>>   void kvm_s390_restart_interrupt(S390CPU *cpu);
>>   void kvm_s390_stop_interrupt(S390CPU *cpu);
>>   void kvm_s390_set_diag318(CPUState *cs, uint64_t diag318_info);
>> +int kvm_s390_topology_set_mtcr(uint64_t attr);
>>   #endif /* KVM_S390X_H */
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index c73cebfe6f..9f202621d0 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -107,6 +107,17 @@ static void s390_topology_realize(DeviceState 
>> *dev, Error **errp)
>>       qemu_mutex_init(&topo->topo_mutex);
>>   }
>> +/**
>> + * s390_topology_reset:
>> + * @dev: the device
>> + *
>> + * Calls the sysemu topology reset
>> + */
>> +static void s390_topology_reset(DeviceState *dev)
>> +{
>> +    s390_cpu_topology_reset();
>> +}
>> +
>>   /**
>>    * topology_class_init:
>>    * @oc: Object class
>> @@ -120,6 +131,7 @@ static void topology_class_init(ObjectClass *oc, 
>> void *data)
>>       dc->realize = s390_topology_realize;
>>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>> +    dc->reset = s390_topology_reset;
>>   }
>>   static const TypeInfo cpu_topology_info = {
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index aa99a62e42..362378454a 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -113,6 +113,7 @@ static const char *const reset_dev_types[] = {
>>       "s390-flic",
>>       "diag288",
>>       TYPE_S390_PCI_HOST_BRIDGE,
>> +    TYPE_S390_CPU_TOPOLOGY,
>>   };
>>   static void subsystem_reset(void)
>> diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
>> index 948e4bd3e0..707c0b658c 100644
>> --- a/target/s390x/cpu-sysemu.c
>> +++ b/target/s390x/cpu-sysemu.c
>> @@ -306,3 +306,10 @@ void s390_do_cpu_set_diag318(CPUState *cs, 
>> run_on_cpu_data arg)
>>           kvm_s390_set_diag318(cs, arg.host_ulong);
>>       }
>>   }
>> +
>> +void s390_cpu_topology_reset(void)
>> +{
>> +    if (kvm_enabled()) {
>> +        kvm_s390_topology_set_mtcr(0);
>> +    }
>> +}
>> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
>> index f96630440b..9c994d27d5 100644
>> --- a/target/s390x/kvm/kvm.c
>> +++ b/target/s390x/kvm/kvm.c
>> @@ -2585,3 +2585,26 @@ int kvm_s390_get_zpci_op(void)
>>   {
>>       return cap_zpci_op;
>>   }
>> +
>> +int kvm_s390_topology_set_mtcr(uint64_t attr)
>> +{
>> +    struct kvm_device_attr attribute = {
>> +        .group = KVM_S390_VM_CPU_TOPOLOGY,
>> +        .attr  = attr,
>> +    };
>> +    int ret;
>> +
>> +    if (!s390_has_feat(S390_FEAT_CONFIGURATION_TOPOLOGY)) {
>> +        return -EFAULT;
> 
> EFAULT is something that indicates a bad address (e.g. a segmentation 
> fault) ... so this definitely sounds like a bad choice for an error code 
> here.

Hum, yes, ENODEV seems besser no?

> 
>   Thomas
> 
> 

-- 
Pierre Morel
IBM Lab Boeblingen

