Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FDF57C9AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 13:21:09 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEUEs-0003G7-LV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 07:21:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oEUCy-0001oQ-78; Thu, 21 Jul 2022 07:19:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27894
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oEUCm-0000Tv-N9; Thu, 21 Jul 2022 07:19:07 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26LAqMEl028991;
 Thu, 21 Jul 2022 11:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HIrH9CAXox3d6v0b9lWHEevdv4tKTdZlnHOT6mfXOe8=;
 b=D0JdL8Rm2VEWUHItMB6P0hXHpODngpaRzj9PrU+MUFmIq2g9d+rrvfUvgZYol9FjZB9v
 ptZSkuB4PkDAt+QM4bzUdqu8IjLWDxnvRRvHgoo0eunOZ58AxYBISCEHclAcNauzr23m
 ANYcwoex6ufmBfd29XDg4QuoT6sXoRdh6ITg3ZvPRBB72yhVcTl57IOyd/zrL0BmGJ1U
 /0LcZlgSe2X7qz0LyDL3U2D5KezxXzYaZJEx7dcbiGmIv7Mh6HHosBm9WGRfBRRCimlg
 FAYqwcnnQxDIJS6xPbDT9wx6j9eas7dcRgVmd3EUPggtg79gKHZjgpeyNyE5fE6u21QA OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf42x379e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 11:18:53 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26LAYaEu011159;
 Thu, 21 Jul 2022 11:18:53 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hf42x378d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 11:18:53 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26LB9evB011998;
 Thu, 21 Jul 2022 11:18:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 3hbmkhswuw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jul 2022 11:18:51 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26LBImjl15663466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jul 2022 11:18:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 250F5A4054;
 Thu, 21 Jul 2022 11:18:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AD54A405B;
 Thu, 21 Jul 2022 11:18:47 +0000 (GMT)
Received: from [9.171.89.164] (unknown [9.171.89.164])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 21 Jul 2022 11:18:47 +0000 (GMT)
Message-ID: <433c22af-bf4f-7c9e-0f6c-5922753691b2@linux.ibm.com>
Date: Thu, 21 Jul 2022 13:23:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 03/12] s390x/cpu_topology: implementating Store
 Topology System Information
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-4-pmorel@linux.ibm.com>
 <13764041-7eb5-258f-1eac-f7b6d86597e9@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <13764041-7eb5-258f-1eac-f7b6d86597e9@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jYPnKczoX6e8BMO0pdDEvg10d5Ef8yuT
X-Proofpoint-ORIG-GUID: X5hEXXC-efGQNrsfEY7yZHWl4hxgND5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_14,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210044
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
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



On 7/20/22 21:34, Janis Schoetterl-Glausch wrote:
> On 6/20/22 16:03, Pierre Morel wrote:
>> The handling of STSI is enhanced with the interception of the
>> function code 15 for storing CPU topology.
>>
>> Using the objects built during the plugging of CPU, we build the
>> SYSIB 15_1_x structures.
>>
>> With this patch the maximum MNEST level is 2, this is also
>> the only level allowed and only SYSIB 15_1_2 will be built.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   target/s390x/cpu.h          |   2 +
>>   target/s390x/cpu_topology.c | 112 ++++++++++++++++++++++++++++++++++++
>>   target/s390x/kvm/kvm.c      |   5 ++
>>   target/s390x/meson.build    |   1 +
>>   4 files changed, 120 insertions(+)
>>   create mode 100644 target/s390x/cpu_topology.c
>>
>> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
>> index 216adfde26..9d48087b71 100644
>> --- a/target/s390x/cpu.h
>> +++ b/target/s390x/cpu.h
>> @@ -890,4 +890,6 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>>   
>>   #include "exec/cpu-all.h"
>>   
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
>> +
>>   #endif
>> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
>> new file mode 100644
>> index 0000000000..9f656d7e51
>> --- /dev/null
>> +++ b/target/s390x/cpu_topology.c
>> @@ -0,0 +1,112 @@
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
>> +
>> +#include "qemu/osdep.h"
>> +#include "cpu.h"
>> +#include "hw/s390x/pv.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/s390x/cpu-topology.h"
>> +
>> +static int stsi_15_container(void *p, int nl, int id)
>> +{
>> +    SysIBTl_container *tle = (SysIBTl_container *)p;
>> +
>> +    tle->nl = nl;
>> +    tle->id = id;
>> +
>> +    return sizeof(*tle);
>> +}
>> +
>> +static int stsi_15_cpus(void *p, S390TopologyCores *cd)
>> +{
>> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
>> +
>> +    tle->nl = 0;
>> +    tle->dedicated = cd->dedicated;
>> +    tle->polarity = cd->polarity;
>> +    tle->type = cd->cputype;
>> +    tle->origin = be16_to_cpu(cd->origin);
>> +    tle->mask = be64_to_cpu(cd->mask);
>> +
>> +    return sizeof(*tle);
>> +}
>> +
>> +static int set_socket(const MachineState *ms, void *p,
>> +                      S390TopologySocket *socket)
>> +{
>> +    BusChild *kid;
>> +    int l, len = 0;
>> +
>> +    len += stsi_15_container(p, 1, socket->socket_id);
>> +    p += len;
>> +
> 
> You could put a comment here, TODO: different cpu types, polarizations not supported,
> or similar, since those require a specific order.

I prefer to put that during the creation process as here there is no 
control but just fill the SysIB with the data.
>   
>> +    QTAILQ_FOREACH_REVERSE(kid, &socket->bus->children, sibling) {
> 
> Is there no synchronization/RCU read section necessary to guard against a concurrent hotplug?

definitively.
I think there must be a synchronization point around the all topology 
creation and the all SysIB creation

> Since the children are ordered by creation, not core_id, the order of the entries is incorrect.
> Ditto for the other equivalent loops.

right will change this during creation

> 
>> +        l = stsi_15_cpus(p, S390_TOPOLOGY_CORES(kid->child));
>> +        p += l;
>> +        len += l;
>> +    }
>> +    return len;
>> +}
>> +
>> +static void setup_stsi(const MachineState *ms, void *p, int level)
> 
> I don't love the name of this function, it's not very descriptive. fill_sysib_15_1_x ?

OK and I will add some s390_ prefix too to make the function easier to find.

> Why don't you pass a SysIB_151x* instead of a void*?

OK

> 
>> +{
>> +    S390TopologyBook *book;
>> +    SysIB_151x *sysib;
>> +    BusChild *kid;
>> +    int len, l;
>> +
>> +    sysib = (SysIB_151x *)p;
>> +    sysib->mnest = level;
>> +    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
>> +    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores * ms->smp.threads;
> 
> If I understood STSI right, it doesn't care about threads, so there should not be a multiplication here.

Right now that we have threads == 1 being forced

>> +
>> +    book = s390_get_topology();
>> +    len = sizeof(SysIB_151x);
>> +    p += len;
>> +
>> +    QTAILQ_FOREACH_REVERSE(kid, &book->bus->children, sibling) {
>> +        l = set_socket(ms, p, S390_TOPOLOGY_SOCKET(kid->child));
>> +        p += l;
> 
> I'm uncomfortable with advancing the pointer without a check if the page is being overflowed.
> With lots of cpus in lots of sockets and a deep hierarchy the topology list can get quite long.

right but I better check on creation I guess, because here I have no way 
to tell that the topology is not available.

> 
>> +        len += l;> +    }
>> +
>> +    sysib->length = be16_to_cpu(len);
>> +}
>> +
>> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
>> +{
>> +    const MachineState *machine = MACHINE(qdev_get_machine());
>> +    void *p;
>> +    int ret;
>> +
>> +    /*
>> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
>> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
>> +     */
> 
> Do you actually implement the SCLP functionality in this series? You're changing
> this check in subsequent patches, but I only see the definition of a new constant,
> not that you're presenting it to the guest.

!!! exact I lost the
s390x-SCLP-reporting-the-maximum-nested-topology-.patch
during transition from v6 to v7 !!

strange, must be a rebase error.

> 
>> +    if (sel2 != 2) {
>> +        setcc(cpu, 3);
>> +        return;
>> +    }
>> +
>> +    p = g_malloc0(TARGET_PAGE_SIZE);
> 
> Any reason not to stack allocate the sysib?

No this can be done

>> +
>> +    setup_stsi(machine, p, 2);
>> +
>> +    if (s390_is_pv()) {
>> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, TARGET_PAGE_SIZE);

This goes away for now, STSI(15,x,x) is not supported by PV


>> +    } else {
>> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, TARGET_PAGE_SIZE);
>> +    }
> 
> Since we're allowed to not store the reserved space after the sysib, it seems more natural
> to do so. I don't know if it makes any difference performance wise, but it doesn't harm.

right

>> +
>> +    setcc(cpu, ret ? 3 : 0);
> 
> Shouldn't this result in an exception instead? Not sure if you should call

right,

> s390_cpu_virt_mem_handle_exc thereafter.

I think it is for TCG only but it should not arm.

Thanks,

regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

