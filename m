Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A8F66C41C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:40:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRaD-0003Fq-0E; Mon, 16 Jan 2023 10:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pHRa9-0003Ex-Vd; Mon, 16 Jan 2023 10:39:33 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pHRa7-0001Tt-8g; Mon, 16 Jan 2023 10:39:33 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30GFPW07032467; Mon, 16 Jan 2023 15:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=usAkRdnnKHJ6F/g9VPCoDhd0ZuYvopU6+VXWs1ypRuo=;
 b=Bs1xCx6mVYRrIcfMfhNqEQ5vuyEJSb4SPsgc/qsh5v0/0RG1dKuQEwdavULJ7DRYscuh
 8j1c3z/VBB0ef+PCIl1Poi6LTuiiT0MvsAglijdEhUh9xSEEDmSN10cWUbPT65BcRTuj
 HFo0L/t/WErwHDgqiPvoI3MQ+PxZoQnnAo1l3LZhOwc9PHGOWIzjK1ygUb/WC3Uf58xn
 M9j+8nenQpCDjdt9XkVE+1X9LY643Ui2YBAHkGNj+be6F9SjRufiureVyCslxRJPMvBr
 pYTawAnTstlvcvd5eokLIgNREyq1AITf8r5br9lHw4xjzBodPCkd64IO5rAIs9AaQV64 VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5971rar7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jan 2023 15:39:26 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30GFQo1U003171;
 Mon, 16 Jan 2023 15:39:26 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n5971raqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jan 2023 15:39:26 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30GD0lRB004825;
 Mon, 16 Jan 2023 15:39:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3n3m169w56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jan 2023 15:39:24 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30GFdKrm47972688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jan 2023 15:39:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57F7920049;
 Mon, 16 Jan 2023 15:39:20 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 127C320043;
 Mon, 16 Jan 2023 15:39:19 +0000 (GMT)
Received: from [9.179.28.129] (unknown [9.179.28.129])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 16 Jan 2023 15:39:18 +0000 (GMT)
Message-ID: <34cd8a0c-963f-1480-9d31-4e8df84da932@linux.ibm.com>
Date: Mon, 16 Jan 2023 16:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v14 03/11] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-4-pmorel@linux.ibm.com>
 <270af9ebb128c7fe576895b2e204d901dae77c5e.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <270af9ebb128c7fe576895b2e204d901dae77c5e.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7AnvtUePJSj-JuIsyUUQlhAnMR_qQwLX
X-Proofpoint-ORIG-GUID: KAqqvSrAaVll11upmN4zbTc-85YK5JTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_13,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160116
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
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



On 1/16/23 14:11, Nina Schoetterl-Glausch wrote:
> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>> On interception of STSI(15.1.x) the System Information Block
>> (SYSIB) is built from the list of pre-ordered topology entries.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h |   3 +
>>   include/hw/s390x/sclp.h         |   1 +
>>   target/s390x/cpu.h              |  78 ++++++++++++++++++
>>   target/s390x/kvm/cpu_topology.c | 136 ++++++++++++++++++++++++++++++++
>>   target/s390x/kvm/kvm.c          |   5 +-
>>   target/s390x/kvm/meson.build    |   3 +-
>>   6 files changed, 224 insertions(+), 2 deletions(-)
>>   create mode 100644 target/s390x/kvm/cpu_topology.c
>>
>> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
>> index b3fd752d8d..9571aa70e5 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -41,6 +41,9 @@ typedef union s390_topology_id {
>>       };
>>   } s390_topology_id;
>>   #define TOPO_CPU_MASK       0x000000000000003fUL
>> +#define TOPO_SOCKET_MASK    0x0000ffffff000000UL
>> +#define TOPO_BOOK_MASK      0x0000ffff00000000UL
>> +#define TOPO_DRAWER_MASK    0x0000ff0000000000UL
>>   
>>   typedef struct S390TopologyEntry {
>>       s390_topology_id id;
>> diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
>> index d3ade40a5a..712fd68123 100644
>> --- a/include/hw/s390x/sclp.h
>> +++ b/include/hw/s390x/sclp.h
>> @@ -112,6 +112,7 @@ typedef struct CPUEntry {
>>   } QEMU_PACKED CPUEntry;
>>   
>>   #define SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET     128
>> +#define SCLP_READ_SCP_INFO_MNEST                2
>>   typedef struct ReadInfo {
>>       SCCBHeader h;
>>       uint16_t rnmax;
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 39ea63a416..78988048dd 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -561,6 +561,25 @@ typedef struct SysIB_322 {
>>   } SysIB_322;
>>   QEMU_BUILD_BUG_ON(sizeof(SysIB_322) != 4096);
>>   
>> +#define S390_TOPOLOGY_MAG  6
>> +#define S390_TOPOLOGY_MAG6 0
>> +#define S390_TOPOLOGY_MAG5 1
>> +#define S390_TOPOLOGY_MAG4 2
>> +#define S390_TOPOLOGY_MAG3 3
>> +#define S390_TOPOLOGY_MAG2 4
>> +#define S390_TOPOLOGY_MAG1 5
>> +/* Configuration topology */
>> +typedef struct SysIB_151x {
>> +    uint8_t  reserved0[2];
>> +    uint16_t length;
>> +    uint8_t  mag[S390_TOPOLOGY_MAG];
>> +    uint8_t  reserved1;
>> +    uint8_t  mnest;
>> +    uint32_t reserved2;
>> +    char tle[];
>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIB_151x;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIB_151x) != 16);
>> +
>>   typedef union SysIB {
>>       SysIB_111 sysib_111;
>>       SysIB_121 sysib_121;
>> @@ -568,9 +587,68 @@ typedef union SysIB {
>>       SysIB_221 sysib_221;
>>       SysIB_222 sysib_222;
>>       SysIB_322 sysib_322;
>> +    SysIB_151x sysib_151x;
>>   } SysIB;
>>   QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
>>   
>> +/*
>> + * CPU Topology List provided by STSI with fc=15 provides a list
>> + * of two different Topology List Entries (TLE) types to specify
>> + * the topology hierarchy.
>> + *
>> + * - Container Topology List Entry
>> + *   Defines a container to contain other Topology List Entries
>> + *   of any type, nested containers or CPU.
>> + * - CPU Topology List Entry
>> + *   Specifies the CPUs position, type, entitlement and polarization
>> + *   of the CPUs contained in the last Container TLE.
>> + *
>> + * There can be theoretically up to five levels of containers, QEMU
>> + * uses only one level, the socket level.
>> + *
>> + * A container of with a nesting level (NL) greater than 1 can only
>> + * contain another container of nesting level NL-1.
>> + *
>> + * A container of nesting level 1 (socket), contains as many CPU TLE
>> + * as needed to describe the position and qualities of all CPUs inside
>> + * the container.
>> + * The qualities of a CPU are polarization, entitlement and type.
>> + *
>> + * The CPU TLE defines the position of the CPUs of identical qualities
>> + * using a 64bits mask which first bit has its offset defined by
>> + * the CPU address orgin field of the CPU TLE like in:
>> + * CPU address = origin * 64 + bit position within the mask
>> + *
>> + */
>> +/* Container type Topology List Entry */
>> +/* Container type Topology List Entry */
>> +typedef struct SysIBTl_container {
>> +        uint8_t nl;
>> +        uint8_t reserved[6];
>> +        uint8_t id;
>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_container;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_container) != 8);
>> +
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
>> +} QEMU_PACKED QEMU_ALIGNED(8) SysIBTl_cpu;
>> +QEMU_BUILD_BUG_ON(sizeof(SysIBTl_cpu) != 16);
>> +
>> +/* Max size of a SYSIB structure is when all CPU are alone in a container */
>> +#define S390_TOPOLOGY_SYSIB_SIZE (sizeof(SysIB_151x) +                         \
>> +                                  S390_MAX_CPUS * (sizeof(SysIBTl_container) + \
>> +                                                   sizeof(SysIBTl_cpu)))
> 
> I don't think this is accurate anymore, if you have drawers and books.
> In that case you could have 3 containers per 1 cpu.
> You could also use the maxcpus number at runtime instead of S390_MAX_CPUS.
> I also think you could do sizeof(SysIB) + sizeof(SysIBTl_cpu) if you check
> if the sysib overflows 4k while building it.

Right.
And I think your other proposal here under is better


> 
>> +
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>> +
>>   /* MMU defines */
>>   #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
>>   #define ASCE_SUBSPACE         0x200       /* subspace group control           */
>> diff --git a/target/s390x/kvm/cpu_topology.c b/target/s390x/kvm/cpu_topology.c
>> new file mode 100644
>> index 0000000000..3831a3264c
>> --- /dev/null
>> +++ b/target/s390x/kvm/cpu_topology.c
>> @@ -0,0 +1,136 @@
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
>> +#include "hw/s390x/sclp.h"
>> +#include "hw/s390x/cpu-topology.h"
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
>> +static char *fill_tle_cpu(char *p, S390TopologyEntry *entry)
>> +{
>> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
>> +    s390_topology_id topology_id = entry->id;
>> +
>> +    tle->nl = 0;
>> +    tle->dedicated = topology_id.d;
>> +    tle->polarity = topology_id.p;
>> +    tle->type = topology_id.type;
>> +    tle->origin = topology_id.origin;
> 
> You need to multiply that value by 64, no?
> And convert it to BE.

Yes right, I already had this error, I must have lost it in a rebase.


> 
>> +    tle->mask = cpu_to_be64(entry->mask);
>> +    return p + sizeof(*tle);
>> +}
>> +
>> +static char *s390_top_set_level(char *p, int level)
>> +{
>> +    S390TopologyEntry *entry;
>> +    uint64_t last_socket = -1UL;
>> +    uint64_t last_book = -1UL;
>> +    uint64_t last_drawer = -1UL;
> 
> -1UL looks funny to me, but there is nothing wrong with it.
> But I don't see a reason not to use int and initialize it with -1.
> 
>> +    int drawer_cnt = 0;
>> +    int book_cnt = 0;
>> +    int socket_cnt = 0;
>> +
>> +    QTAILQ_FOREACH(entry, &s390_topology.list, next) {
>> +
>> +        if (level > 3 && (last_drawer != entry->id.drawer)) {
>> +            book_cnt = 0;
>> +            socket_cnt = 0;
>> +            p = fill_container(p, 3, drawer_cnt++);
>> +            last_drawer = entry->id.id & TOPO_DRAWER_MASK;
>> +            p = fill_container(p, 2, book_cnt++);
>> +            last_book = entry->id.id & TOPO_BOOK_MASK;
>> +            p = fill_container(p, 1, socket_cnt++);
>> +            last_socket = entry->id.id & TOPO_SOCKET_MASK;
>> +            p = fill_tle_cpu(p, entry);
>> +        } else if (level > 2 && (last_book !=
>> +                                 (entry->id.id & TOPO_BOOK_MASK))) {
>> +            socket_cnt = 0;
>> +            p = fill_container(p, 2, book_cnt++);
>> +            last_book = entry->id.id & TOPO_BOOK_MASK;
>> +            p = fill_container(p, 1, socket_cnt++);
>> +            last_socket = entry->id.id & TOPO_SOCKET_MASK;
>> +            p = fill_tle_cpu(p, entry);
>> +        } else if (last_socket != (entry->id.id & TOPO_SOCKET_MASK)) {
>> +            p = fill_container(p, 1, socket_cnt++);
>> +            last_socket = entry->id.id & TOPO_SOCKET_MASK;
>> +            p = fill_tle_cpu(p, entry);
>> +        } else {
>> +            p = fill_tle_cpu(p, entry);
>> +        }
>> +    }
>> +
>> +    return p;
>> +}
> 
> I think you can do this a bit more readable and reduce redundancy.
> Pseudo code:
> 
> foreach entry:
> 	bool drawer_change = last_drawer != current_drawer
> 	bool book_change = drawer_change || last_book != current_book
> 	bool socket_change = book_change || last_socket != current_socket
> 
> 	if (level > 3 && drawer_change)
> 		reset book id
> 		fill drawer container
> 		drawer id++
> 	if (level > 2 && book_change)
> 		reset socket id
> 		fill book container
> 		book id++
> 	if (socket_change)
> 		fill socket container
> 		socket id++
> 	fill cpu entry
> 
> 	update last_drawer, _book, _socket
> 
> You can also check after after every fill if the buffer has been overflowed,
> that is if the function wrote more than sizeof(SysIB) - sizeof(SysIB_151x) bytes.
> Or you check it once at the end if you increase the size of the buffer a bit.
> Then you don't need to allocate the absolute maximum.
> 
> I think you could also use global ids for the containers.
> So directly use the drawer id from the entry,
> use (drawer id * smp.books) + book id, and so on.
> If you update last_* after setting *_changed you don't need to maintain ids,
> you can just use last_*.

OK, seems better to me
Thanks

Regards,
Pierre


> 
> 
> [...]

-- 
Pierre Morel
IBM Lab Boeblingen

