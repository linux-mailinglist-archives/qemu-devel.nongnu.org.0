Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC8D67573B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 15:33:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIsRr-0007sQ-I9; Fri, 20 Jan 2023 09:32:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIsRp-0007rz-OS; Fri, 20 Jan 2023 09:32:53 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIsRn-0008QT-RS; Fri, 20 Jan 2023 09:32:53 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30KERHTl024732; Fri, 20 Jan 2023 14:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BKCmYyxYT5vlZloWhzfEN/t/Asrw3C213JA+AY7lEHY=;
 b=M4TeWpwdD0EgJSuHpDNOG4gBONBL8bLgBsFSfDlukGp4g6RSr409YJll10g3NVxP2rq1
 rsJEPYHOUMWpja7nBpfSdNKZ2R9Iq0YRQOyUX9+HXZ9ZAoT5qnAjB14HINFtekI5Voo4
 cvoLfN76w0QjY/0Q6oxT1Ccry/286xI21ub/2si4Zocjxog5Do0x3T4qyuq9TUKqMllD
 J+vxt3o0ghb/ce24op/KWSt7LH3KbC7UCgDefDJWvOPUYW4J7369uXNCZ8CQkot4Dh+D
 fIgypVXfIzlUVCwAn1i1svB2T70hnYwLEx3cnPltuarsUeDVcR0Wgmti+OE1eZ1STDfC bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7td4c1an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 14:32:41 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30KClkav008481;
 Fri, 20 Jan 2023 14:32:41 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7td4c19j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 14:32:41 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30KCsFM3023703;
 Fri, 20 Jan 2023 14:32:39 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16r363-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 Jan 2023 14:32:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30KEWZSU38863124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Jan 2023 14:32:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75DAD20040;
 Fri, 20 Jan 2023 14:32:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4AB3C20043;
 Fri, 20 Jan 2023 14:32:34 +0000 (GMT)
Received: from [9.171.50.198] (unknown [9.171.50.198])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 20 Jan 2023 14:32:34 +0000 (GMT)
Message-ID: <afdd5bf1-11a0-3d46-a219-ee8b94da4dc9@linux.ibm.com>
Date: Fri, 20 Jan 2023 15:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v14 06/11] s390x/cpu topology: interception of PTF
 instruction
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-7-pmorel@linux.ibm.com>
 <e27e12b2535736dcadd08a3b14caf70566487214.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <e27e12b2535736dcadd08a3b14caf70566487214.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Nt_baqTC4YT3Qv6a75pIwFuye2oWeMqp
X-Proofpoint-GUID: 1EBgb0W2XLIQ84d6Zg7i21hx3ktRoyX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_08,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 1/16/23 19:24, Nina Schoetterl-Glausch wrote:
> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>> When the host supports the CPU topology facility, the PTF
>> instruction with function code 2 is interpreted by the SIE,
>> provided that the userland hypervizor activates the interpretation
>> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>
>> The PTF instructions with function code 0 and 1 are intercepted
>> and must be emulated by the userland hypervizor.
>>
>> During RESET all CPU of the configuration are placed in
>> horizontal polarity.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h    |  3 +
>>   include/hw/s390x/s390-virtio-ccw.h |  6 ++
>>   target/s390x/cpu.h                 |  1 +
>>   hw/s390x/cpu-topology.c            | 92 ++++++++++++++++++++++++++++++
>>   target/s390x/cpu-sysemu.c          | 16 ++++++
>>   target/s390x/kvm/kvm.c             | 11 ++++
>>   6 files changed, 129 insertions(+)
>>
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> index 9571aa70e5..33e23d78b9 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -55,11 +55,13 @@ typedef struct S390Topology {
>>       QTAILQ_HEAD(, S390TopologyEntry) list;
>>       uint8_t *sockets;
>>       CpuTopology *smp;
>> +    int polarity;
>>   } S390Topology;
>>   
>>   #ifdef CONFIG_KVM
>>   bool s390_has_topology(void);
>>   void s390_topology_set_cpu(MachineState *ms, S390CPU *cpu, Error **errp);
>> +void s390_topology_set_polarity(int polarity);
>>   #else
>>   static inline bool s390_has_topology(void)
>>   {
>> @@ -68,6 +70,7 @@ static inline bool s390_has_topology(void)
>>   static inline void s390_topology_set_cpu(MachineState *ms,
>>                                            S390CPU *cpu,
>>                                            Error **errp) {}
>> +static inline void s390_topology_set_polarity(int polarity) {}
>>   #endif
>>   extern S390Topology s390_topology;
>>   
>> diff --git a/include/hw/s390x/s390-virtio-ccw.h b/include/hw/s390x/s390-virtio-ccw.h
>> index 9bba21a916..c1d46e78af 100644
>> --- a/include/hw/s390x/s390-virtio-ccw.h
>> +++ b/include/hw/s390x/s390-virtio-ccw.h
>> @@ -30,6 +30,12 @@ struct S390CcwMachineState {
>>       uint8_t loadparm[8];
>>   };
>>   
>> +#define S390_PTF_REASON_NONE (0x00 << 8)
>> +#define S390_PTF_REASON_DONE (0x01 << 8)
>> +#define S390_PTF_REASON_BUSY (0x02 << 8)
>> +#define S390_TOPO_FC_MASK 0xffUL
>> +void s390_handle_ptf(S390CPU *cpu, uint8_t r1, uintptr_t ra);
>> +
>>   struct S390CcwMachineClass {
>>       /*< private >*/
>>       MachineClass parent_class;
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 01ade07009..5da4041576 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -864,6 +864,7 @@ void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg);
>>   int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
>>                                   int vq, bool assign);
>>   void s390_cpu_topology_reset(void);
>> +void s390_cpu_topology_set(void);
> 
> I don't like this name much, it's nondescript.
> s390_cpu_topology_set_modified ?
> 
>>   #ifndef CONFIG_USER_ONLY
>>   unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu);
>>   #else
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index 438055c612..e6b4692581 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -97,6 +97,98 @@ static s390_topology_id s390_topology_from_cpu(S390CPU *cpu)
>>   }
>>   
>>   /**
>> + * s390_topology_set_polarity
>> + * @polarity: horizontal or vertical
>> + *
>> + * Changes the polarity of all the CPU in the configuration.
>> + *
>> + * If the dedicated CPU modifier attribute is set a vertical
>> + * polarization is always high (Architecture).
>> + * Otherwise we decide to set it as medium.
>> + *
>> + * Once done, advertise a topology change.
>> + */
>> +void s390_topology_set_polarity(int polarity)
> 
> I don't like that this function ignores what kind of vertical polarization is passed,
> it's confusing.
> That seems like a further reason to split horizontal/vertical from the entitlement.
> 

Yes.
I will also make the ordering of the TLE at the last moment instead of 
doing it during hotplug or QAPI command.
This is something Cedric proposed some time ago and I think it is right, 
it will be easier to do it once in STSI than on every change of topology,
hotplug, QAPI and polarization change with PTF.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

