Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973366FC200
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:51:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwJ3N-0007Pe-Ev; Tue, 09 May 2023 04:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pwJ3G-0007NT-V3; Tue, 09 May 2023 04:50:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pwJ3B-0002T3-D4; Tue, 09 May 2023 04:50:30 -0400
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3498afIi010762; Tue, 9 May 2023 08:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=79B0v5FvWelzcBfU7I16hTzj+BylCliLtpkm/vAUy94=;
 b=oxZuaMbpFf3WkHNigweMia1C8uC8rL3uR76ccOQldXXl7T2U1qvjP4jJgHBlJDHJZruc
 gTG515MfPpSkDO9b1O7zNzt2trFcNG1h4T01+RRN42MPxgn1X6XYmx1Q+PM9uYQwMHgK
 a3N3II3szqXw84UYCb9IMtzvHV02jpSHR3LYjkmzY6Qi71ekMRCdT/7yzlnbyjWFzJHo
 5r7UR2mzQqtWwXgUWrzBW22w7Zr+gE3QGuogY6iK0dCrZjAVFxRWmrtsDNEhXAlt/diy
 PDlpJpyfH7V2ZxkdCbOZWvjVqdc1NTPFwMh64zklXj3f95SdyDuGXsqH7O4lBi+uH/Jy 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfgpxw1ev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 08:50:14 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3498i5t5008911;
 Tue, 9 May 2023 08:50:14 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfgpxw1d0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 08:50:14 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3491Yfx6007361;
 Tue, 9 May 2023 08:50:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qf7dg08db-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 May 2023 08:50:11 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3498o5Jh262660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 May 2023 08:50:05 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9623B20040;
 Tue,  9 May 2023 08:50:05 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29C3C20043;
 Tue,  9 May 2023 08:50:05 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue,  9 May 2023 08:50:05 +0000 (GMT)
Message-ID: <9447bf7b-6dc0-4197-1134-266a257d06de@linux.ibm.com>
Date: Tue, 9 May 2023 10:50:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v20 08/21] qapi/s390x/cpu topology: set-cpu-topology qmp
 command
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-9-pmorel@linux.ibm.com>
 <e1301b4f488df0d84617685a6ee29c4c916c8068.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <e1301b4f488df0d84617685a6ee29c4c916c8068.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -RVJWipYyAgO7CDLPaXNWQ-V7OEDEb_y
X-Proofpoint-ORIG-GUID: xLmsTiBFrnsq_Vv_C5VhFr4WKKBosP13
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_05,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305090065
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.802, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 5/8/23 21:42, Nina Schoetterl-Glausch wrote:
> On Tue, 2023-04-25 at 18:14 +0200, Pierre Morel wrote:
>> The modification of the CPU attributes are done through a monitor
>> command.
>>
>> It allows to move the core inside the topology tree to optimize
>> the cache usage in the case the host's hypervisor previously
>> moved the CPU.
>>
>> The same command allows to modify the CPU attributes modifiers
>> like polarization entitlement and the dedicated attribute to notify
>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>
>> With this knowledge the guest has the possibility to optimize the
>> usage of the vCPUs.
>>
>> The command has a feature unstable for the moment.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> Logic is sound, minor stuff below.
>
>> ---
>>   qapi/machine-target.json |  37 +++++++++++
>>   hw/s390x/cpu-topology.c  | 136 +++++++++++++++++++++++++++++++++++++++
>>   2 files changed, 173 insertions(+)
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index 42a6a40333..3b7a0b77f4 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -4,6 +4,8 @@
>>   # This work is licensed under the terms of the GNU GPL, version 2 or later.
>>   # See the COPYING file in the top-level directory.
>>   
>> +{ 'include': 'machine-common.json' }
>> +
>>   ##
>>   # @CpuModelInfo:
>>   #
>> @@ -354,3 +356,38 @@
>>   { 'enum': 'CpuS390Polarization',
>>     'prefix': 'S390_CPU_POLARIZATION',
>>     'data': [ 'horizontal', 'vertical' ] }
>> +
>> +##
>> +# @set-cpu-topology:
>> +#
>> +# @core-id: the vCPU ID to be moved
>> +# @socket-id: optional destination socket where to move the vCPU
>> +# @book-id: optional destination book where to move the vCPU
>> +# @drawer-id: optional destination drawer where to move the vCPU
>> +# @entitlement: optional entitlement
>> +# @dedicated: optional, if the vCPU is dedicated to a real CPU
>> +#
>> +# Features:
>> +# @unstable: This command may still be modified.
>> +#
>> +# Modifies the topology by moving the CPU inside the topology
>> +# tree or by changing a modifier attribute of a CPU.
>> +# Default value for optional parameter is the current value
>> +# used by the CPU.
>> +#
>> +# Returns: Nothing on success, the reason on failure.
>> +#
>> +# Since: 8.1
>> +##
>> +{ 'command': 'set-cpu-topology',
>> +  'data': {
>> +      'core-id': 'uint16',
>> +      '*socket-id': 'uint16',
>> +      '*book-id': 'uint16',
>> +      '*drawer-id': 'uint16',
>> +      '*entitlement': 'CpuS390Entitlement',
>> +      '*dedicated': 'bool'
>> +  },
>> +  'features': [ 'unstable' ],
>> +  'if': { 'all': [ 'TARGET_S390X' , 'CONFIG_KVM' ] }
>> +}
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index d9cd3dc3ce..e5fb976594 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -16,6 +16,7 @@
>>   #include "target/s390x/cpu.h"
>>   #include "hw/s390x/s390-virtio-ccw.h"
>>   #include "hw/s390x/cpu-topology.h"
>> +#include "qapi/qapi-commands-machine-target.h"
>>   
>>   /*
>>    * s390_topology is used to keep the topology information.
>> @@ -261,6 +262,27 @@ static bool s390_topology_check(uint16_t socket_id, uint16_t book_id,
>>       return true;
>>   }
>>   
>> +/**
>> + * s390_topology_need_report
>> + * @cpu: Current cpu
>> + * @drawer_id: future drawer ID
>> + * @book_id: future book ID
>> + * @socket_id: future socket ID
> Entitlement and dedicated are missing here.

Yes, thx


>
>> + *
>> + * A modified topology change report is needed if the topology
>> + * tree or the topology attributes change.
>> + */
>> +static int s390_topology_need_report(S390CPU *cpu, int drawer_id,
> I'd prefer a bool return type.

ok


>
>> +                                   int book_id, int socket_id,
>> +                                   uint16_t entitlement, bool dedicated)
>> +{
>> +    return cpu->env.drawer_id != drawer_id ||
>> +           cpu->env.book_id != book_id ||
>> +           cpu->env.socket_id != socket_id ||
>> +           cpu->env.entitlement != entitlement ||
>> +           cpu->env.dedicated != dedicated;
>> +}
>> +
>>   /**
>>    * s390_update_cpu_props:
>>    * @ms: the machine state
>> @@ -330,3 +352,117 @@ void s390_topology_setup_cpu(MachineState *ms, S390CPU *cpu, Error **errp)
>>       /* topology tree is reflected in props */
>>       s390_update_cpu_props(ms, cpu);
>>   }
>> +
>> +static void s390_change_topology(uint16_t core_id,
>> +                                 bool has_socket_id, uint16_t socket_id,
>> +                                 bool has_book_id, uint16_t book_id,
>> +                                 bool has_drawer_id, uint16_t drawer_id,
>> +                                 bool has_entitlement, uint16_t entitlement,
> I would keep the enum type for entitlement.

ok


>
>> +                                 bool has_dedicated, bool dedicated,
>> +                                 Error **errp)
>> +{
>> +    MachineState *ms = current_machine;
>> +    int old_socket_entry;
>> +    int new_socket_entry;
>> +    int report_needed;
>> +    S390CPU *cpu;
>> +    ERRP_GUARD();
>> +
>> +    if (core_id >= ms->smp.max_cpus) {
>> +        error_setg(errp, "Core-id %d out of range!", core_id);
>> +        return;
>> +    }
>> +
>> +    cpu = (S390CPU *)ms->possible_cpus->cpus[core_id].cpu;
> You can replace this with
>
>         cpu = s390_cpu_addr2state(core_id);
>
> and get rid of the if above that checks for out of range.


yes, ok


>
>> +    if (!cpu) {
>> +        error_setg(errp, "Core-id %d does not exist!", core_id);
>> +        return;
>> +    }
>> +
>> +    /* Get attributes not provided from cpu and verify the new topology */
>> +    if (!has_socket_id) {
>> +        socket_id = cpu->env.socket_id;
>> +    }
>> +    if (!has_book_id) {
>> +        book_id = cpu->env.book_id;
>> +    }
>> +    if (!has_drawer_id) {
>> +        drawer_id = cpu->env.drawer_id;
>> +    }
>> +    if (!has_dedicated) {
>> +        dedicated = cpu->env.dedicated;
>> +    }
>> +
>> +    /*
>> +     * When the user specifies the entitlement as 'auto' on the command line,
>> +     * qemu will set the entitlement as:
>> +     * Medium when the CPU is not dedicated.
>> +     * High when dedicated is true.
>> +     */
>> +    if (!has_entitlement || (entitlement == S390_CPU_ENTITLEMENT_AUTO)) {
>> +        if (dedicated) {
>> +            entitlement = S390_CPU_ENTITLEMENT_HIGH;
>> +        } else {
>> +            entitlement = S390_CPU_ENTITLEMENT_MEDIUM;
>> +        }
>> +    }
>> +
>> +    if (!s390_topology_check(socket_id, book_id, drawer_id,
>> +                             entitlement, dedicated, errp))
>> +        return;
>> +
>> +    /* Check for space on new socket */
>> +    old_socket_entry = s390_socket_nb(cpu);
>> +    new_socket_entry = __s390_socket_nb(drawer_id, book_id, socket_id);
>> +
>> +    if (new_socket_entry != old_socket_entry) {
>> +        if (s390_topology.cores_per_socket[new_socket_entry] >=
>> +            s390_topology.smp->cores) {
>> +            error_setg(errp, "No more space on this socket");
>> +            return;
>> +        }
>> +        /* Update the count of cores in sockets */
>> +        s390_topology.cores_per_socket[new_socket_entry] += 1;
>> +        s390_topology.cores_per_socket[old_socket_entry] -= 1;
>> +    }
>> +
>> +    /* Check if we will need to report the modified topology */
>> +    report_needed = s390_topology_need_report(cpu, drawer_id, book_id,
>> +                                              socket_id, entitlement,
>> +                                              dedicated);
>> +
>> +    /* All checks done, report new topology into the vCPU */
>> +    cpu->env.drawer_id = drawer_id;
>> +    cpu->env.book_id = book_id;
>> +    cpu->env.socket_id = socket_id;
>> +    cpu->env.dedicated = dedicated;
>> +    cpu->env.entitlement = entitlement;
>> +
>> +    /* topology tree is reflected in props */
>> +    s390_update_cpu_props(ms, cpu);
>> +
>> +    /* Advertise the topology change */
>> +    if (report_needed) {
>> +        s390_cpu_topology_set_changed(true);
>> +    }
>> +}
>> +
>> +void qmp_set_cpu_topology(uint16_t core,
>> +                         bool has_socket, uint16_t socket,
>> +                         bool has_book, uint16_t book,
>> +                         bool has_drawer, uint16_t drawer,
>> +                         bool has_entitlement, CpuS390Entitlement entitlement,
>> +                         bool has_dedicated, bool dedicated,
>> +                         Error **errp)
>> +{
>> +    ERRP_GUARD();
>> +
>> +    if (!s390_has_topology()) {
>> +        error_setg(errp, "This machine doesn't support topology");
>> +        return;
>> +    }
>> +
>> +    s390_change_topology(core, has_socket, socket, has_book, book,
>> +                         has_drawer, drawer, has_entitlement, entitlement,
>> +                         has_dedicated, dedicated, errp);
>> +}

Thanks I change this.

regards,

Pierre



