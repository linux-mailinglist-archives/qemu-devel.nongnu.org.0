Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF9057BEB2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 21:38:03 +0200 (CEST)
Received: from localhost ([::1]:53360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEFWD-0001j3-T0
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 15:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oEFSn-0005k6-Lz; Wed, 20 Jul 2022 15:34:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oEFSj-0004xk-UO; Wed, 20 Jul 2022 15:34:28 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KJDlip028404;
 Wed, 20 Jul 2022 19:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lx6L2dzg0qc3FATPU4CKpnSNgkzwFBG97tceDHmmfZQ=;
 b=iLc6khkJyZmJAuFm70qBxpGXXTFspTVI8PO6fRtTLmszXJ9C4Ds0NMB3NLLYO5FpugzS
 JiM9V8Y4DNdZALz08MikroQxvl/IcbKYxSEzZa/26vupmrp+8SWs2cWOYJpNXw4FU5og
 Cr86vvGMA/mWXWJo72p49VaUXpI0N/Gkzno2swY9a+a1/mnS0dFUrx2uNwOtopllADTf
 HbQfyrPIka7wlow4Eufl85uMcKbaSGV4bqr7BbEgQVWyQRT5H1MVbnCk101ty7isDZux
 uIMA+iYxrL75es4Bvtp04DmdQmjQKWCx/JYBmVBDY6a6QtfuTOQJR+EL+1SyFUySY+oP Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3heqp9gk6w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jul 2022 19:34:17 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26KJFxqK009481;
 Wed, 20 Jul 2022 19:34:16 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3heqp9gk5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jul 2022 19:34:16 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26KJK6I4002938;
 Wed, 20 Jul 2022 19:34:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3hbmy8mj1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jul 2022 19:34:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26KJYAng20840796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jul 2022 19:34:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADB7911C04A;
 Wed, 20 Jul 2022 19:34:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BFCD11C050;
 Wed, 20 Jul 2022 19:34:05 +0000 (GMT)
Received: from [9.171.85.19] (unknown [9.171.85.19])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 20 Jul 2022 19:34:05 +0000 (GMT)
Message-ID: <13764041-7eb5-258f-1eac-f7b6d86597e9@linux.ibm.com>
Date: Wed, 20 Jul 2022 21:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v8 03/12] s390x/cpu_topology: implementating Store
 Topology System Information
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-4-pmorel@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220620140352.39398-4-pmorel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LRJMl3iRrkFAHN9VNnNQ6kNMQTY0sq0f
X-Proofpoint-ORIG-GUID: 4t51Tfuom2tIEbnmlICWm5HWN0uJBxmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200078
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

On 6/20/22 16:03, Pierre Morel wrote:
> The handling of STSI is enhanced with the interception of the
> function code 15 for storing CPU topology.
> 
> Using the objects built during the plugging of CPU, we build the
> SYSIB 15_1_x structures.
> 
> With this patch the maximum MNEST level is 2, this is also
> the only level allowed and only SYSIB 15_1_2 will be built.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  target/s390x/cpu.h          |   2 +
>  target/s390x/cpu_topology.c | 112 ++++++++++++++++++++++++++++++++++++
>  target/s390x/kvm/kvm.c      |   5 ++
>  target/s390x/meson.build    |   1 +
>  4 files changed, 120 insertions(+)
>  create mode 100644 target/s390x/cpu_topology.c
> 
> diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
> index 216adfde26..9d48087b71 100644
> --- a/target/s390x/cpu.h
> +++ b/target/s390x/cpu.h
> @@ -890,4 +890,6 @@ S390CPU *s390_cpu_addr2state(uint16_t cpu_addr);
>  
>  #include "exec/cpu-all.h"
>  
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar);
> +
>  #endif
> diff --git a/target/s390x/cpu_topology.c b/target/s390x/cpu_topology.c
> new file mode 100644
> index 0000000000..9f656d7e51
> --- /dev/null
> +++ b/target/s390x/cpu_topology.c
> @@ -0,0 +1,112 @@
> +/*
> + * QEMU S390x CPU Topology
> + *
> + * Copyright IBM Corp. 2022
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "hw/s390x/pv.h"
> +#include "hw/sysbus.h"
> +#include "hw/s390x/cpu-topology.h"
> +
> +static int stsi_15_container(void *p, int nl, int id)
> +{
> +    SysIBTl_container *tle = (SysIBTl_container *)p;
> +
> +    tle->nl = nl;
> +    tle->id = id;
> +
> +    return sizeof(*tle);
> +}
> +
> +static int stsi_15_cpus(void *p, S390TopologyCores *cd)
> +{
> +    SysIBTl_cpu *tle = (SysIBTl_cpu *)p;
> +
> +    tle->nl = 0;
> +    tle->dedicated = cd->dedicated;
> +    tle->polarity = cd->polarity;
> +    tle->type = cd->cputype;
> +    tle->origin = be16_to_cpu(cd->origin);
> +    tle->mask = be64_to_cpu(cd->mask);
> +
> +    return sizeof(*tle);
> +}
> +
> +static int set_socket(const MachineState *ms, void *p,
> +                      S390TopologySocket *socket)
> +{
> +    BusChild *kid;
> +    int l, len = 0;
> +
> +    len += stsi_15_container(p, 1, socket->socket_id);
> +    p += len;
> +

You could put a comment here, TODO: different cpu types, polarizations not supported,
or similar, since those require a specific order.
 
> +    QTAILQ_FOREACH_REVERSE(kid, &socket->bus->children, sibling) {

Is there no synchronization/RCU read section necessary to guard against a concurrent hotplug?
Since the children are ordered by creation, not core_id, the order of the entries is incorrect.
Ditto for the other equivalent loops.

> +        l = stsi_15_cpus(p, S390_TOPOLOGY_CORES(kid->child));
> +        p += l;
> +        len += l;
> +    }
> +    return len;
> +}
> +
> +static void setup_stsi(const MachineState *ms, void *p, int level)

I don't love the name of this function, it's not very descriptive. fill_sysib_15_1_x ?
Why don't you pass a SysIB_151x* instead of a void*?

> +{
> +    S390TopologyBook *book;
> +    SysIB_151x *sysib;
> +    BusChild *kid;
> +    int len, l;
> +
> +    sysib = (SysIB_151x *)p;
> +    sysib->mnest = level;
> +    sysib->mag[TOPOLOGY_NR_MAG2] = ms->smp.sockets;
> +    sysib->mag[TOPOLOGY_NR_MAG1] = ms->smp.cores * ms->smp.threads;

If I understood STSI right, it doesn't care about threads, so there should not be a multiplication here.
> +
> +    book = s390_get_topology();
> +    len = sizeof(SysIB_151x);
> +    p += len;
> +
> +    QTAILQ_FOREACH_REVERSE(kid, &book->bus->children, sibling) {
> +        l = set_socket(ms, p, S390_TOPOLOGY_SOCKET(kid->child));
> +        p += l;

I'm uncomfortable with advancing the pointer without a check if the page is being overflowed.
With lots of cpus in lots of sockets and a deep hierarchy the topology list can get quite long.

> +        len += l;> +    }
> +
> +    sysib->length = be16_to_cpu(len);
> +}
> +
> +void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
> +{
> +    const MachineState *machine = MACHINE(qdev_get_machine());
> +    void *p;
> +    int ret;
> +
> +    /*
> +     * Until the SCLP STSI Facility reporting the MNEST value is used,
> +     * a sel2 value of 2 is the only value allowed in STSI 15.1.x.
> +     */

Do you actually implement the SCLP functionality in this series? You're changing
this check in subsequent patches, but I only see the definition of a new constant,
not that you're presenting it to the guest.

> +    if (sel2 != 2) {
> +        setcc(cpu, 3);
> +        return;
> +    }
> +
> +    p = g_malloc0(TARGET_PAGE_SIZE);

Any reason not to stack allocate the sysib?
> +
> +    setup_stsi(machine, p, 2);
> +
> +    if (s390_is_pv()) {
> +        ret = s390_cpu_pv_mem_write(cpu, 0, p, TARGET_PAGE_SIZE);
> +    } else {
> +        ret = s390_cpu_virt_mem_write(cpu, addr, ar, p, TARGET_PAGE_SIZE);
> +    }

Since we're allowed to not store the reserved space after the sysib, it seems more natural
to do so. I don't know if it makes any difference performance wise, but it doesn't harm.
> +
> +    setcc(cpu, ret ? 3 : 0);

Shouldn't this result in an exception instead? Not sure if you should call
s390_cpu_virt_mem_handle_exc thereafter.

> +    g_free(p);
> +}
> +
> diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
> index 7bd8db0e7b..563bf5ac60 100644
> --- a/target/s390x/kvm/kvm.c
> +++ b/target/s390x/kvm/kvm.c
> @@ -51,6 +51,7 @@
>  #include "hw/s390x/s390-virtio-ccw.h"
>  #include "hw/s390x/s390-virtio-hcall.h"
>  #include "hw/s390x/pv.h"
> +#include "hw/s390x/cpu-topology.h"
>  
>  #ifndef DEBUG_KVM
>  #define DEBUG_KVM  0
> @@ -1918,6 +1919,10 @@ static int handle_stsi(S390CPU *cpu)
>          /* Only sysib 3.2.2 needs post-handling for now. */
>          insert_stsi_3_2_2(cpu, run->s390_stsi.addr, run->s390_stsi.ar);
>          return 0;
> +    case 15:
> +        insert_stsi_15_1_x(cpu, run->s390_stsi.sel2, run->s390_stsi.addr,
> +                           run->s390_stsi.ar);
> +        return 0;
>      default:
>          return 0;
>      }
> diff --git a/target/s390x/meson.build b/target/s390x/meson.build
> index 84c1402a6a..890ccfa789 100644
> --- a/target/s390x/meson.build
> +++ b/target/s390x/meson.build
> @@ -29,6 +29,7 @@ s390x_softmmu_ss.add(files(
>    'sigp.c',
>    'cpu-sysemu.c',
>    'cpu_models_sysemu.c',
> +  'cpu_topology.c',
>  ))
>  
>  s390x_user_ss = ss.source_set()


