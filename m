Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A950F60B893
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 21:51:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on350-0002aw-IC; Mon, 24 Oct 2022 15:25:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1on34y-0002a9-3n; Mon, 24 Oct 2022 15:25:44 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1on34v-0008Uv-Jn; Mon, 24 Oct 2022 15:25:43 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29OJK01d006740;
 Mon, 24 Oct 2022 19:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=oj4Xpi3y/sF3NwpyWc7gM1sVU1+h/ni/w2Fu+loJQoY=;
 b=DomFDbpFVd22jZMm6qqgd2TdwPCrbZ9ueFN3Ck38dY0/MVgYHKR11vTCCJSZHkSE1leW
 Lyrma/p42IwHA2M2aSEaNs20/wA9OlgUMI432qCgf37eOlrp17UCfvPsLVtUAa00d1AM
 mTBnoaivPt4rzKjg6Zd2H84yIm2HT6MMp3OienAGlYwih04TVPZS2f5oQBw1r4Roaser
 dT7E/rJaAm2J5hJCu7EB0x7vVwz5tcbT8PjWWQIfmjZH+caZ7IU2g83r/Th82U7uGKdx
 cU88XiFtQZiI3qW4tUcBBJMHoYlfeTM+GzxGNvW9AFryX7nlRzhQs81CSfuTrohh8OIl 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke0s7g4ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 19:25:30 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29OJKecC010025;
 Mon, 24 Oct 2022 19:25:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ke0s7g4br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 19:25:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29OJLsRh016078;
 Mon, 24 Oct 2022 19:25:28 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3kc859bt70-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Oct 2022 19:25:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29OJPOOM48038384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Oct 2022 19:25:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C46434C040;
 Mon, 24 Oct 2022 19:25:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E76864C044;
 Mon, 24 Oct 2022 19:25:23 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.27.135])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Oct 2022 19:25:23 +0000 (GMT)
Message-ID: <65c3bfd263b03ca524444cdf5f96d937f582f2d7.camel@linux.ibm.com>
Subject: Re: [PATCH v10 1/9] s390x/cpu topology: core_id sets s390x CPU
 topology
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Date: Mon, 24 Oct 2022 21:25:23 +0200
In-Reply-To: <20221012162107.91734-2-pmorel@linux.ibm.com>
References: <20221012162107.91734-1-pmorel@linux.ibm.com>
 <20221012162107.91734-2-pmorel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5tBexhp7Fh5ZvXxLe_nLQvgUZ7Nb_E1_
X-Proofpoint-GUID: O5OQ_8LJ7V4QgM32HhiSVpbKFGeZV3rg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-24_06,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 bulkscore=0 phishscore=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210240114
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 2022-10-12 at 18:20 +0200, Pierre Morel wrote:
> In the S390x CPU topology the core_id specifies the CPU address
> and the position of the core withing the topology.
> 
> Let's build the topology based on the core_id.
> s390x/cpu topology: core_id sets s390x CPU topology
> 
> In the S390x CPU topology the core_id specifies the CPU address
> and the position of the cpu withing the topology.
> 
> Let's build the topology based on the core_id.
> 
> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
> ---
>  include/hw/s390x/cpu-topology.h |  45 +++++++++++
>  hw/s390x/cpu-topology.c         | 132 ++++++++++++++++++++++++++++++++
>  hw/s390x/s390-virtio-ccw.c      |  21 +++++
>  hw/s390x/meson.build            |   1 +
>  4 files changed, 199 insertions(+)
>  create mode 100644 include/hw/s390x/cpu-topology.h
>  create mode 100644 hw/s390x/cpu-topology.c
> 
> diff --git a/include/hw/s390x/cpu-topology.h b/include/hw/s390x/cpu-topology.h
> new file mode 100644
> index 0000000000..66c171d0bc
> --- /dev/null
> +++ b/include/hw/s390x/cpu-topology.h
> @@ -0,0 +1,45 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright 2022 IBM Corp.
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
> +#ifndef HW_S390X_CPU_TOPOLOGY_H
> +#define HW_S390X_CPU_TOPOLOGY_H
> +
> +#include "hw/qdev-core.h"
> +#include "qom/object.h"
> +
> +typedef struct S390TopoContainer {
> +    int active_count;
> +} S390TopoContainer;
> +
> +#define S390_TOPOLOGY_CPU_IFL 0x03
> +#define S390_TOPOLOGY_MAX_ORIGIN ((63 + S390_MAX_CPUS) / 64)
> +typedef struct S390TopoTLE {
> +    uint64_t mask[S390_TOPOLOGY_MAX_ORIGIN];
> +} S390TopoTLE;

Since this actually represents multiple TLEs, you might want to change the
name of the struct to reflect this. S390TopoTLEList maybe?

> +
> +struct S390Topology {
> +    SysBusDevice parent_obj;
> +    int cpus;
> +    S390TopoContainer *socket;
> +    S390TopoTLE *tle;
> +    MachineState *ms;
> +};
> +
> +#define TYPE_S390_CPU_TOPOLOGY "s390-topology"
> +OBJECT_DECLARE_SIMPLE_TYPE(S390Topology, S390_CPU_TOPOLOGY)
> +
> +S390Topology *s390_get_topology(void);
> +void s390_topology_new_cpu(int core_id);
> +
> +static inline bool s390_has_topology(void)
> +{
> +    return false;
> +}
> +
> +#endif
> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
> new file mode 100644
> index 0000000000..42b22a1831
> --- /dev/null
> +++ b/hw/s390x/cpu-topology.c
> @@ -0,0 +1,132 @@
> +/*
> + * CPU Topology
> + *
> + * Copyright IBM Corp. 2022
> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
> +
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at
> + * your option) any later version. See the COPYING file in the top-level
> + * directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
> +#include "hw/sysbus.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/boards.h"
> +#include "qemu/typedefs.h"
> +#include "target/s390x/cpu.h"
> +#include "hw/s390x/s390-virtio-ccw.h"
> +#include "hw/s390x/cpu-topology.h"
> +
> +S390Topology *s390_get_topology(void)
> +{
> +    static S390Topology *s390Topology;
> +
> +    if (!s390Topology) {
> +        s390Topology = S390_CPU_TOPOLOGY(
> +            object_resolve_path(TYPE_S390_CPU_TOPOLOGY, NULL));
> +    }
> +
> +    return s390Topology;
> +}
> +
> +/*
> + * s390_topology_new_cpu:
> + * @core_id: the core ID is machine wide
> + *
> + * The topology returned by s390_get_topology(), gives us the CPU
> + * topology established by the -smp QEMU aruments.

s/aruments/arguments/

> + * The core-id gives:
> + *  - the Container TLE (Topology List Entry) containing the CPU TLE.
> + *  - in the CPU TLE the origin, or offset of the first bit in the core mask
> + *  - the bit in the CPU TLE core mask
> + */

Not sure if that comment helps if you don't already know how the topology list works.
> +void s390_topology_new_cpu(int core_id)
> +{
> +    S390Topology *topo = s390_get_topology();
> +    int socket_id;
> +    int bit, origin;
> +
> +    /* In the case no Topology is used nothing is to be done here */
> +    if (!topo) {
> +        return;
> +    }
> +
> +    socket_id = core_id / topo->cpus;
> +
> +    /*
> +     * At the core level, each CPU is represented by a bit in a 64bit
> +     * unsigned long which represent the presence of a CPU.
> +     * The firmware assume that all CPU in a CPU TLE have the same

s/firmware assume/architecture specifies/

> +     * type, polarization and are all dedicated or shared.
> +     * In that case the origin variable represents the offset of the first
> +     * CPU in the CPU container.

This sentence is repeated further down.

> +     * More than 64 CPUs per socket are represented in several CPU containers
> +     * inside the socket container.
> +     * The only reason to have several S390TopologyCores inside a socket is
> +     * to have more than 64 CPUs.
> +     * In that case the origin variable represents the offset of the first CPU
> +     * in the CPU container. More than 64 CPUs per socket are represented in
> +     * several CPU containers inside the socket container.
> +     */

In the last version you had:
+ /*
+ * At the core level, each CPU is represented by a bit in a 64bit
+ * unsigned long. Set on plug and clear on unplug of a CPU.
+ * The firmware assume that all CPU in a CPU TLE have the same
+ * type, polarization and are all dedicated or shared.
+ * In the case a socket contains CPU with different type, polarization
+ * or entitlement then they will be defined in different CPU containers.
+ * Currently we assume all CPU are identical IFL CPUs and that they are
+ * all dedicated CPUs.
+ * The only reason to have several S390TopologyCores inside a socket is
+ * to have more than 64 CPUs.
+ * In that case the origin field, representing the offset of the first CPU
+ * in the CPU container allows to represent up to the maximal number of
+ * CPU inside several CPU containers inside the socket container.
+ */

I would modify it thus (with better line wrapping):
+ /*
+ * At the core level, each CPU is represented by a bit in a 64bit
+ * unsigned long.
+ * The architecture specifies that all CPU in a CPU TLE have the same
+ * type, polarization and are all dedicated or shared.
+ * In the case that a socket contains CPUs with different type, polarization
+ * or entitlement then they will be defined in different CPU containers.
+ * Currently we assume all CPU are identical IFL CPUs and that they are
+ * all dedicated CPUs.
+ * Therefore, the only reason to have several S390TopologyCores inside a socket is
+ * to support CPU id differences > 64.
+ * In that case, the origin field in a container represents the offset of the first CPU
+ * in that CPU container, thereby allowing representation of all CPUs via multiple containers.
+ */

> +    bit = core_id;
> +    origin = bit / 64;
> +    bit %= 64;
> +    bit = 63 - bit;

I'm not convinced that that is more readable than just
 origin = core_id / 64;
 bit = 63 - (core_id % 64);

but that is for you to decide.
> +
> +    topo->socket[socket_id].active_count++;
> +    set_bit(bit, &topo->tle[socket_id].mask[origin]);
> +}
> +
> +/**
> + * s390_topology_realize:
> + * @dev: the device state
> + * @errp: the error pointer (not used)
> + *
> + * During realize the machine CPU topology is initialized with the
> + * QEMU -smp parameters.
> + * The maximum count of CPU TLE in the all Topology can not be greater
> + * than the maximum CPUs.
> + */
> +static void s390_topology_realize(DeviceState *dev, Error **errp)
> +{
> +    MachineState *ms = MACHINE(qdev_get_machine());
> +    S390Topology *topo = S390_CPU_TOPOLOGY(dev);
> +
> +    topo->cpus = ms->smp.cores * ms->smp.threads;
> +
> +    topo->socket = g_new0(S390TopoContainer, ms->smp.sockets);
> +    topo->tle = g_new0(S390TopoTLE, ms->smp.max_cpus);

As Cédric pointed out, the number of TLE(List)s should be the same as the
sockets.
> +
> +    topo->ms = ms;
> +}
[...]


