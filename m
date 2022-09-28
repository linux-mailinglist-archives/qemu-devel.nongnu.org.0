Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E545EDDBA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 15:32:56 +0200 (CEST)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odXBD-0000jC-Ns
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 09:32:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odTsi-0007Zx-CS; Wed, 28 Sep 2022 06:01:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:50876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1odTsf-0006sG-QP; Wed, 28 Sep 2022 06:01:32 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S9vskR039483;
 Wed, 28 Sep 2022 10:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=m/wK4JxOPBqDEkrzTHWZeDUZEUjQCR812nP2toUkHvQ=;
 b=Umpk/dpnPX1UJZEA0I1/uK+Rygrj9TiTUYyDtqxkdczG7uRllafcOurAI4DrwxznhPoP
 QUHZK1dDuAqQrCR0LTS+kCgORYCX9EcrvExPHW9fwpoWgcPQ/axtoJSUjv89VN173nXB
 P3qZ6MtnheLSupOpd0xZDL1P237xzvjjcVuxn4AZIbu/N2Kxy5/o4b8KT061pMlzr8KE
 2oXWtJVMIXvsLAdmagjxF9m0FAgYOF0EoICoH5mF+SdKfQRZrsPvQFs1rkKoYxabKixA
 QyYHLUhP8h9hP+45lw6aGT0fksc0kILqWWIiT+Tt5m+65rLrgyXu9O2BiqVRuNk6aQ/c lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvm3qg3y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:01:26 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28S9wf1M001844;
 Wed, 28 Sep 2022 10:01:26 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jvm3qg3we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:01:26 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28S9pnWW011490;
 Wed, 28 Sep 2022 10:01:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3jssh93t2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:01:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28SA1Kd72949758
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Sep 2022 10:01:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29E4E4C046;
 Wed, 28 Sep 2022 10:01:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37D8C4C040;
 Wed, 28 Sep 2022 10:01:19 +0000 (GMT)
Received: from [9.171.31.212] (unknown [9.171.31.212])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Sep 2022 10:01:19 +0000 (GMT)
Message-ID: <c8021a8e-1d58-e755-0ac2-8f8f7c5feb31@linux.ibm.com>
Date: Wed, 28 Sep 2022 12:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v9 03/10] s390x/cpu topology: reporting the CPU topology
 to the guest
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <20220902075531.188916-4-pmorel@linux.ibm.com>
 <e2e5e8dc27ee12981c6df4e5f6b208362bd3671a.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <e2e5e8dc27ee12981c6df4e5f6b208362bd3671a.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: msnwiT6v7sS2LNPPvNh8n4yNJMM0U64G
X-Proofpoint-GUID: 9BB5e78K4FYbAfhlnuQKnsYjxbq238sa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209280061
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 9/6/22 13:49, Janis Schoetterl-Glausch wrote:
> On Fri, 2022-09-02 at 09:55 +0200, Pierre Morel wrote:
>> The guest can use the STSI instruction to get a buffer filled
>> with the CPU topology description.
>>
>> Let us implement the STSI instruction for the basis CPU topology
>> level, level 2.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/cpu-topology.c         |   4 ++
>>   include/hw/s390x/cpu-topology.h |   5 ++
>>   target/s390x/cpu.h              |  49 +++++++++++++++
>>   target/s390x/cpu_topology.c     | 108 ++++++++++++++++++++++++++++++++
>>   target/s390x/kvm/kvm.c          |   6 +-
>>   target/s390x/meson.build        |   1 +
>>   6 files changed, 172 insertions(+), 1 deletion(-)
>>   create mode 100644 target/s390x/cpu_topology.c
>>
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index a6ca006ec5..e2fd5c7e44 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -76,9 +76,11 @@ void s390_topology_new_cpu(int core_id)
>>        * in the CPU container allows to represent up to the maximal number of
>>        * CPU inside several CPU containers inside the socket container.
>>        */
>> +    qemu_mutex_lock(&topo->topo_mutex);
> 
> You could use a reader writer lock for this, if qemu has that (I didn't
> find any tho).

I can use RCU but we could also consider that the write path is very short.

> 
>>       topo->socket[socket_id].active_count++;
>>       topo->tle[socket_id].active_count++;
>>       set_bit(bit, &topo->tle[socket_id].mask[origin]);
>> +    qemu_mutex_unlock(&topo->topo_mutex);
>>   }
>>   
>>   /**
>> @@ -104,6 +106,8 @@ static void s390_topology_realize(DeviceState *dev, Error **errp)
>>       n = topo->sockets;
>>       topo->socket = g_malloc0(n * sizeof(S390TopoContainer));
>>       topo->tle = g_malloc0(topo->tles * sizeof(S390TopoTLE));
>> +
>> +    qemu_mutex_init(&topo->topo_mutex);
>>   }
>>   
>>   /**
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> index 6911f975f4..0b7f3d10b2 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -10,6 +10,10 @@
>>   #ifndef HW_S390X_CPU_TOPOLOGY_H
>>   #define HW_S390X_CPU_TOPOLOGY_H
>>   
>> +#define S390_TOPOLOGY_CPU_TYPE    0x03
> 
> IMO you should add the name of cpu type 0x03 to the name of the
> constant, even if there is only one right now.
> You did the same for the polarity after all.

OK right
#define S390_TOPOLOGY_CPU_IFL 0x03

> 
>> +
>> +#define S390_TOPOLOGY_POLARITY_H  0x00
>> +
>>   typedef struct S390TopoContainer {
>>       int active_count;
>>   } S390TopoContainer;
>> @@ -30,6 +34,7 @@ struct S390Topology {
>>       int tles;
>>       S390TopoContainer *socket;
>>       S390TopoTLE *tle;
>> +    QemuMutex topo_mutex;
>>   };
>>   typedef struct S390Topology S390Topology;
>>   
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 7d6d01325b..c61fe9b563 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -565,6 +565,53 @@ typedef union SysIB {
>>   } SysIB;
>>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>>   
>> +/* CPU type Topology List Entry */
>> +typedef struct SysIBTl_cpu {
>> +        uint8_t nl;
>> +        uint8_t reserved0[3];
>> +        uint8_t reserved1:5;
>> +        uint8_t dedicated:1;
>> +        uint8_t polarity:2;
>> +        uint8_t type;
>> +        uint16_t origin;
>> +        uint64_t mask;
>> +} SysIBTl_cpu;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
>> +
>> +/* Container type Topology List Entry */
>> +typedef struct SysIBTl_container {
>> +        uint8_t nl;
>> +        uint8_t reserved[6];
>> +        uint8_t id;
>> +} QEMU_PACKED SysIBTl_container;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
>> +
>> +/* Generic Topology List Entry */
>> +typedef union SysIBTl_entry {
>> +        uint8_t nl;
>> +        SysIBTl_container container;
>> +        SysIBTl_cpu cpu;
>> +} SysIBTl_entry;
> 
> This isn't used for anything but the declaration in SysIB_151x, is it?

right.

>> +
>> +#define TOPOLOGY_NR_MAG  6
>> +#define TOPOLOGY_NR_MAG6 0
>> +#define TOPOLOGY_NR_MAG5 1
>> +#define TOPOLOGY_NR_MAG4 2
>> +#define TOPOLOGY_NR_MAG3 3
>> +#define TOPOLOGY_NR_MAG2 4
>> +#define TOPOLOGY_NR_MAG1 5
>> +/* Configuration topology */
>> +typedef struct SysIB_151x {
>> +    uint8_t  reserved0[2];
>> +    uint16_t length;
>> +    uint8_t  mag[TOPOLOGY_NR_MAG];
>> +    uint8_t  reserved1;
>> +    uint8_t  mnest;
>> +    uint32_t reserved2;
>> +    SysIBTl_entry tle[0];
> 
> I would just use uint64_t[0] as type or uint64_t[] whichever is qemu
> style.

OK



> 
>> +} SysIB_151x;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
>> +
>>   /* MMU defines */
>>   #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
>>   #define ASCE_SUBSPACE         0x200       /* subspace group control           */
>> @@ -843,4 +890,6 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>>   
>>   #include "exec/cpu-all.h"
>>   
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>> +
>>   #endif
>> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
>> new file mode 100644
>> index 0000000000..56865dafc6
>> --- /dev/null
>> +++ b/target/s390x/cpu_topology.c
>> @@ -0,0 +1,108 @@
>> +/*
>> + * QEMU S390x CPU Topology
>> + *
>> + * Copyright IBM Corp. 2022
>> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
>> + * your option) any later version. See the COPYING file in the top-level
>> + * directory.
>> + */
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "hw/s390x/pv.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/s390x/cpu-topology.h"
>> +#include "hw/s390x/sclp.h"
>> +
>> +static char *fill_container(char *p, int level, int id)
>> +{
>> +    SysIBTl_container *tle = (SysIBTl_container *)p;
>> +
>> +    tle->nl = level;
>> +    tle->id = id;
>> +    return p + sizeof(*tle);
>> +}
>> +
>> +static char *fill_tle_cpu(char *p, uint64_t mask, int origin)
>> +{
>> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
>> +
>> +    tle->nl = 0;
>> +    tle->dedicated = 1;
>> +    tle->polarity = S390_TOPOLOGY_POLARITY_H;
>> +    tle->type = S390_TOPOLOGY_CPU_TYPE;
>> +    tle->origin = origin * 64;
>> +    tle->mask = be64_to_cpu(mask);
> 
> You convert endianess for mask here...
> 
>> +    return p + sizeof(*tle);
>> +}
>> +
>> +static char *s390_top_set_level2(S390Topology *topo, char *p)
>> +{
>> +    int i, origin;
>> +
>> +    for (i = 0; i < topo->sockets; i++) {
>> +        if (!topo->socket[i].active_count) {
>> +            continue;
>> +        }
>> +        p = fill_container(p, 1, i);
>> +        for (origin = 0; origin < S390_TOPOLOGY_MAX_ORIGIN; origin++) {
>> +            uint64_t mask = 0L;
>> +
>> +            mask = be64_to_cpu(topo->tle[i].mask[origin]);
> 
> ...and here. So one has to go, I guess this one.
> Also using cpu_to_be64 seems more intuitive to me.

cpu_to_be64 is the right thing to do.
Also yes, I suppress this one.

> 
>> +            if (mask) {
>> +                p = fill_tle_cpu(p, mask, origin);
>> +            }
>> +        }
>> +    }
>> +    return p;
>> +}
>> +
>> +static int setup_stsi(SysIB_151x *sysib, int level)
>> +{
>> +    S390Topology *topo = s390_get_topology();
>> +    char *p = (char *)sysib->tle;
>> +
>> +    qemu_mutex_lock(&topo->topo_mutex);
>> +
>> +    sysib->mnest = level;
>> +    switch (level) {
>> +    case 2:
>> +        sysib->mag[TOPOLOGY_NR_MAG2] = topo->sockets;
>> +        sysib->mag[TOPOLOGY_NR_MAG1] = topo->cores;
>> +        p = s390_top_set_level2(topo, p);
>> +        break;
>> +    }
>> +
>> +    qemu_mutex_unlock(&topo->topo_mutex);
>> +
>> +    return p - (char *)sysib->tle;
>> +}
>> +
>> +#define S390_TOPOLOGY_MAX_MNEST 2
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    SysIB_151x *sysib;
>> +    int len = sizeof(*sysib);
>> +
>> +    if (s390_is_pv() || sel2 < 2 || sel2 > S390_TOPOLOGY_MAX_MNEST) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    sysib = g_malloc0(TARGET_PAGE_SIZE);
> 
> What made you decide against stack allocating this?

I just did not think about it.
I will change it.

> 
>> +
>> +    len += setup_stsi(sysib, sel2);
>> +    if (len > TARGET_PAGE_SIZE) {
> 
> If you do the check here it's too late.

yes.

> 
>> +        setcc(cpu, 3);
>> +        goto out_free;
>> +    }
>> +
>> +    sysib->length = be16_to_cpu(len);
>> +    s390_cpu_virt_mem_write(cpu, addr, ar, sysib, len);
> 
> If the return value of this is <0 it's an error condition.
> If you ignore the value we'll keep running.

I understood that exceptions are handled inside 
s390_cpu_virt_mem_write() and we have no CC to report.

> 
>> +    setcc(cpu, 0);
> 
> Is it correct to set the cc value even if s390_cpu_virt_mem_write
> causes an exception?

I guess that if it caused an exception we do not get so far.
Am I wrong?

Thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

