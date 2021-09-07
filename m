Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67119402619
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:19:19 +0200 (CEST)
Received: from localhost ([::1]:44944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXG9-00004t-Vb
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:19:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXF8-0007nV-L4; Tue, 07 Sep 2021 05:18:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:17242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXF6-000879-2V; Tue, 07 Sep 2021 05:18:14 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1879484C169641; Tue, 7 Sep 2021 05:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ocKW9XXXBSKw9j6ltrI87psRlLABnAsgHIQqSWG99rE=;
 b=pDgpb0geY1r4eD6CQXcXiNZ1xA8tsGmGXqbfSKlQ0DDh1S1JGqQiyz0JmnPmMhZlEbEC
 Qmz3PSQoNdMt7NlMbPGgivL9BkV3NBbTThtEsSquo4l0dGDUkoyTg/ufHwIK0QR52a5u
 V2F0ldpuV6Yv3+IpPeWFWXD/soClngG9xZ6c6vERffLeK423GrjtEg/dCjGXQgrwtJ/n
 JkSBFqCr16wGpYMuMOJQlXq1vP8tkZY0d5Lc7rW1I6VPGjuh5W+GmDTJyw/a/GKt0Qhy
 U+l9ve2XL6RZfYHbyLjB8ZDl0I2H0Wwv3zp09oldQ+S5zU6P+oUbNEKr7irOkZ7mqUXZ cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax2v2c2ct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:18:08 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18794BlV170074;
 Tue, 7 Sep 2021 05:18:08 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax2v2c2c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:18:08 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1879DrEI009620;
 Tue, 7 Sep 2021 09:18:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3av0e9ktdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:18:05 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1879I2xG50987292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 09:18:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16860AE056;
 Tue,  7 Sep 2021 09:18:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B65CBAE05F;
 Tue,  7 Sep 2021 09:18:01 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.9.165])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 09:18:01 +0000 (GMT)
Subject: Re: [PATCH v2 3/5] s390x: topology: CPU topology objects and
 structures
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-4-git-send-email-pmorel@linux.ibm.com>
 <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <babd02a6-7e7a-e0d7-9a27-b22581b1068e@linux.ibm.com>
Date: Tue, 7 Sep 2021 11:18:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M59E3g7QL65hDQcriL_dO0EWswOHdbp3
X-Proofpoint-ORIG-GUID: w30FaYj89o8sYhCA3wGzrtEo1uZOg1oo
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2108310000 definitions=main-2109070056
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 9:32 AM, Thomas Huth wrote:
> On 22/07/2021 19.42, Pierre Morel wrote:
>> We use new objects to have a dynamic administration of the CPU topology.
>> The highier level object is the S390 book. In a first implementation
> 
> s/highier/higher/ ... or highest ?

thx I chose highest

And I modify to
"
The highest level object in this implementation is the s390 book and in 
this first implementation of CPU topology for S390 we have a single book.
"

> 
>> we will have only a single S390 book.
>> The book is built as a SYSBUS bridge during the CPU initialisation. > 
>> Every object under this single book will be build dynamically
>> immediately after a CPU has be realized if it is needed.
>> The CPU will fill the sockets once after the other, according to the
>> number of core per socket defined during the smp parsing.
>>
>> Each CPU inside a socket will be represented by a bit in a 64bit
>> unsigned long. Set on plug and clear on unplug of a CPU.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/cpu-topology.c         | 334 ++++++++++++++++++++++++++++++++
>>   hw/s390x/meson.build            |   1 +
>>   hw/s390x/s390-virtio-ccw.c      |   4 +
>>   include/hw/s390x/cpu-topology.h |  67 +++++++
>>   4 files changed, 406 insertions(+)
>>   create mode 100644 hw/s390x/cpu-topology.c
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> new file mode 100644
>> index 0000000000..73f91d5334
>> --- /dev/null
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -0,0 +1,334 @@
>> +/*
>> + * CPU Topology
>> + *
>> + * Copyright 2021 IBM Corp.
>> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
>> +
>> + * This work is licensed under the terms of the GNU GPL, version 2 or 
>> (at
>> + * your option) any later version. See the COPYING file in the top-level
>> + * directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/sysbus.h"
>> +#include "hw/s390x/cpu-topology.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/boards.h"
>> +#include "qemu/typedefs.h"
>> +#include "target/s390x/cpu.h"
>> +#include "hw/s390x/s390-virtio-ccw.h"
>> +
>> +static S390TopologyCores *s390_create_cores(S390TopologySocket *socket,
>> +                                            int origin)
>> +{
>> +    DeviceState *dev;
>> +    S390TopologyCores *cores;
>> +    const MachineState *ms = MACHINE(qdev_get_machine());
>> +
>> +    if (socket->bus->num_children >= ms->smp.cores) {
>> +        return NULL;
>> +    }
>> +
>> +    dev = qdev_new(TYPE_S390_TOPOLOGY_CORES);
>> +    qdev_realize_and_unref(dev, socket->bus, &error_fatal);
>> +
>> +    cores = S390_TOPOLOGY_CORES(dev);
>> +    cores->origin = origin;
>> +    socket->cnt += 1;
>> +
>> +    return cores;
>> +}
>> +
>> +static S390TopologySocket *s390_create_socket(S390TopologyBook *book, 
>> int id)
>> +{
>> +    DeviceState *dev;
>> +    S390TopologySocket *socket;
>> +    const MachineState *ms = MACHINE(qdev_get_machine());
>> +
>> +    if (book->bus->num_children >= ms->smp.sockets) {
>> +        return NULL;
>> +    }
>> +
>> +    dev = qdev_new(TYPE_S390_TOPOLOGY_SOCKET);
>> +    qdev_realize_and_unref(dev, book->bus, &error_fatal);
>> +
>> +    socket = S390_TOPOLOGY_SOCKET(dev);
>> +    socket->socket_id = id;
>> +    book->cnt++;
>> +
>> +    return socket;
>> +}
>> +
> 
> Could you add a short comment in front of s390_get_cores, describing 
> what it does? From the name, I would not expect that this function 
> creates something automatically, so a comment explaining this would be 
> nice.

Yes, I will do.


> 
>> +static S390TopologyCores *s390_get_cores(S390TopologySocket *socket, 
>> int origin)
>> +{
>> +    S390TopologyCores *cores;
>> +    BusChild *kid;
>> +
>> +    QTAILQ_FOREACH(kid, &socket->bus->children, sibling) {
>> +        cores = S390_TOPOLOGY_CORES(kid->child);
>> +        if (cores->origin == origin) {
>> +            return cores;
>> +        }
>> +    }
>> +    return s390_create_cores(socket, origin);
>> +}
> 
> dito.

too

> 
>> +static S390TopologySocket *s390_get_socket(S390TopologyBook *book,
>> +                                           int socket_id)
>> +{
>> +    S390TopologySocket *socket;
>> +    BusChild *kid;
>> +
>> +    QTAILQ_FOREACH(kid, &book->bus->children, sibling) {
>> +        socket = S390_TOPOLOGY_SOCKET(kid->child);
>> +        if (socket->socket_id == socket_id) {
>> +            return socket;
>> +        }
>> +    }
>> +    return s390_create_socket(book, socket_id);
>> +}
>> +
>> +/*
>> + * s390_topology_new_cpu:
>> + * @core_id: the core ID is machine wide
>> + *
>> + * We have a single book returned by s390_get_topology(),
>> + * then we build the hierarchy on demand.
>> + * Note that we do not destroy the hierarchy on error creating
>> + * an entry in the topology, we just keept it empty.
> 
> s/keept/keep/
yes.

> 
>> + * We do not need to worry about not finding a topology level
>> + * entry this would have been catched during smp parsing.
> 
> s/catched/caught/
hum, yes

> 
>> + */
>> +void s390_topology_new_cpu(int core_id)
>> +{
>> +    const MachineState *ms = MACHINE(qdev_get_machine());
>> +    S390TopologyBook *book;
>> +    S390TopologySocket *socket;
>> +    S390TopologyCores *cores;
>> +    int cores_per_socket, sock_idx;
>> +    int origin, bit;
>> +
>> +    book = s390_get_topology();
>> +
>> +    cores_per_socket = ms->smp.max_cpus / ms->smp.sockets;
>> +
>> +    sock_idx = (core_id / cores_per_socket);
>> +    socket = s390_get_socket(book, sock_idx);
>> +
>> +    /*
>> +     * We assert that all CPU are identical IFL, shared and
> 
> assert? Or did you mean assume? When reading something like "assert" I'd 
> expect some error checking here...?

no the right word is "assume"

> 
>> +     * horizontal topology, the only reason to have several
>> +     * S390TopologyCores is to have more than 64 CPUs.
>> +     */
>> +    origin = 64 * (core_id / 64);
>> +
>> +    cores = s390_get_cores(socket, origin);
>> +

...snip...

>> +static char *socket_bus_get_dev_path(DeviceState *dev)
>> +{
>> +    S390TopologySocket *socket = S390_TOPOLOGY_SOCKET(dev);
>> +    DeviceState *book = dev->parent_bus->parent;
>> +    char *id = qdev_get_dev_path(book);
>> +    char *ret;
>> +
>> +    if (id) {
>> +        ret = g_strdup_printf("%s:%02d", id, socket->socket_id);
>> +        g_free(id);
>> +    } else {
>> +        ret = g_malloc(6);
>> +        snprintf(ret, 6, "_:%02d", socket->socket_id);
> 
> Why don't you use g_strdup_printf() here?

I wonder too...


> 
>> +    }
>> +
>> +    return ret;
>> +}
...snip...
>> +    }
>> +};
> 
> I didn't spot any migration related code in here ... is this already 
> migration-safe?

You are right, I must think about this,
I think we must keep the same topology, even false, during the migration 
and set the topology_change_report_pending when the migration is done.

I will add this in the next round.

Thanks a lot for the reviewing
Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

