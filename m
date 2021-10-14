Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE5242D8E6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:10:35 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mazZC-0000OH-AF
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:10:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mazTI-0001g3-Tj; Thu, 14 Oct 2021 08:04:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mazTF-0007QI-H0; Thu, 14 Oct 2021 08:04:28 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EC2uL9032995; 
 Thu, 14 Oct 2021 08:04:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lILWTGFBE4UsOGX2TXesX5ETDNsw8VpzJntxiavanlQ=;
 b=Sw14BN3GVU8GC2l5n6gIyXy8B7sHmyxnFGcqam1iMqJ2enAJgnMywGzoSQ1lhlR6fdAe
 8Dq/Dbrj6VCWTlODCoqJBcBamePBcUt2Hd7wLsNTI7TMfdBONEut/1YlYFv+yTE3QDLB
 IgGx3IsvXYtcmDyznxxFcCaGKdpcetw6t/uMjShf+UGnwLFGhFjlZZMPMSq6mTDOJGXm
 0wT0rAbNqg10xlmU2sPg6yPzj72Tep2tCk+3lQDqa+GBV6AWc/4t9mInZf27iGm9kQcK
 9vFShMZv+qkR5Z7wJK+O+Oi8T96twkrvZK5wrmkROIW6d2Tbb8qHAs8Dcz8eOQYelgSB yQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bpm7b81ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 08:04:20 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19EC41Yb036964;
 Thu, 14 Oct 2021 08:04:20 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bpm7b81jr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 08:04:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19EC1YUa025025;
 Thu, 14 Oct 2021 12:04:17 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3bk2qa4rqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 12:04:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19EC4Cgw40370686
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Oct 2021 12:04:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5016111C0BC;
 Thu, 14 Oct 2021 12:04:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB1D011C071;
 Thu, 14 Oct 2021 12:04:11 +0000 (GMT)
Received: from [9.171.15.64] (unknown [9.171.15.64])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Oct 2021 12:04:11 +0000 (GMT)
Message-ID: <ac8bf10f-0af9-5116-68ab-492f9d1397a3@linux.ibm.com>
Date: Thu, 14 Oct 2021 14:04:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 3/4] s390x: topology: CPU topology objects and
 structures
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-4-git-send-email-pmorel@linux.ibm.com>
 <184be580-113d-6661-f88e-84846615b2a1@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <184be580-113d-6661-f88e-84846615b2a1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dBPinBJvXvR0_DoaC9mBqHXHfJ7zzpV3
X-Proofpoint-ORIG-GUID: a6sWtvxEUefmeNcdVWgv0z3Teb59h7Ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_03,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110140073
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 10/14/21 09:16, Thomas Huth wrote:
> On 16/09/2021 15.50, Pierre Morel wrote:
>> We use new objects to have a dynamic administration of the CPU topology.
>> The highest level object in this implementation is the s390 book and
>> in this first implementation of CPU topology for S390 we have a single
>> book.
>> The book is built as a SYSBUS bridge during the CPU initialization.
>>
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
>>   hw/s390x/cpu-topology.c         | 353 ++++++++++++++++++++++++++++++++
>>   hw/s390x/meson.build            |   1 +
>>   hw/s390x/s390-virtio-ccw.c      |   4 +
>>   include/hw/s390x/cpu-topology.h |  67 ++++++
>>   target/s390x/cpu.h              |  47 +++++
>>   5 files changed, 472 insertions(+)
>>   create mode 100644 hw/s390x/cpu-topology.c
>>   create mode 100644 include/hw/s390x/cpu-topology.h
>>
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> new file mode 100644
>> index 0000000000..f0ffd86a4f
>> --- /dev/null
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -0,0 +1,353 @@
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
>> +/*
>> + * s390_get_cores:
>> + * @socket: the socket to search into
>> + * @origin: the origin specified for the S390TopologyCores
>> + *
>> + * returns a pointer to a S390TopologyCores structure within a socket 
>> having
>> + * the specified origin.
>> + * First search if the socket is already containing the 
>> S390TopologyCores
>> + * structure and if not create one with this origin.
>> + */
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
>> +
>> +/*
>> + * s390_get_socket:
>> + * @book: The book to search into
>> + * @socket_id: the identifier of the socket to search for
>> + *
>> + * returns a pointer to a S390TopologySocket structure within a book 
>> having
>> + * the specified socket_id.
>> + * First search if the book is already containing the S390TopologySocket
>> + * structure and if not create one with this socket_id.
>> + */
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
>> + * an entry in the topology, we just keep it empty.
>> + * We do not need to worry about not finding a topology level
>> + * entry this would have been caught during smp parsing.
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
>> +     * We assume that all CPU are identical IFL, shared and
>> +     * horizontal topology, the only reason to have several
>> +     * S390TopologyCores is to have more than 64 CPUs.
>> +     */
>> +    origin = 64 * (core_id / 64);
>> +
>> +    cores = s390_get_cores(socket, origin);
>> +
>> +    bit = 63 - (core_id - origin);
>> +    set_bit(bit, &cores->mask);
>> +    cores->origin = origin;
>> +}
> 
> Are these "64" an artificial limit by the hardware? Or is it just an 
> implementation detail in your code since you chose to use a uint64_t 
> variable for the mask? In the latter case, why not use a bitfield? ... 
> anyway, could you please add some more comments to the code why you are 
> using "64" here? (e.g. the sentences "Each CPU inside a socket will be 
> represented by a bit in a 64bit
>   unsigned long. Set on plug and clear on unplug of a CPU." should  go 
> into the cpu-topology.c file, too).
> 
>   Thomas
> 

The 64 bit is designed by hardware.
I will had more comments describing how the core topology entry is 
designed and used by hardware.

Thanks for your comments
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

