Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B056A0C51
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCza-0004hA-FX; Thu, 23 Feb 2023 09:54:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@imap.linux.ibm.com>)
 id 1pVCLV-00066l-Iv; Thu, 23 Feb 2023 09:13:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@imap.linux.ibm.com>)
 id 1pVCLS-0001l2-2J; Thu, 23 Feb 2023 09:13:16 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NE5npV029852; Thu, 23 Feb 2023 14:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=Jw0udZeGiM5XNwlNUlCl+RQrq26nNuRgcPB0l3mQFx4=;
 b=G0/HWV7OHI7lbY2E7laYAf9Oc/vaYk8Hg9ZDHVV/KCTRU1uvC/V3EnTi+/7YkXiSUxbq
 9embhZFQ609U5rjHrAHo/yen+E2TTt6wedFl6huYso2LF4gmSxhUM65I+EYhP0g2HJYc
 jOMlX/YZMaJU4Q1fWBvE+8b+IkWYBF5V39AA0+J5vrDXHRt5IvM3OEvpO++Sbi4VuELk
 UmXgDUTJpst7KnoW1yLAtcUA+1Y7BHKBmQI6qzVv8HxKO2ZpOTphDU3JpX6MxPStqZ1w
 VxDLuJpQ14ppMx+2UtBOz0eTcMu6drUMurYg8DNw1njY6zWaONXG0eq71TifFKdnj9hA rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx7k9khxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 14:06:34 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31NCVcHJ007267;
 Thu, 23 Feb 2023 14:06:33 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx7k9khx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 14:06:33 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31NCntop005324;
 Thu, 23 Feb 2023 14:06:32 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3ntpa7e2fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 14:06:32 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NE6VPL1049200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 14:06:31 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CAD258070;
 Thu, 23 Feb 2023 14:06:31 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 945015805C;
 Thu, 23 Feb 2023 14:06:29 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 14:06:29 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 23 Feb 2023 15:06:29 +0100
From: pierre <pierre@imap.linux.ibm.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Pierre Morel <pmorel@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Subject: Re: [PATCH v16 02/11] s390x/cpu topology: add topology entries on CPU
 hotplug
In-Reply-To: <4bd16293-62e8-d7ea-dab4-9e5cb0208812@redhat.com>
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-3-pmorel@linux.ibm.com>
 <4bd16293-62e8-d7ea-dab4-9e5cb0208812@redhat.com>
Message-ID: <a19eb89ab4841e389e72b50ec017ae01@imap.linux.ibm.com>
X-Sender: pierre@imap.linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BBBRFoJx4c_y6a0_xBcNg7xRuouGI4El
X-Proofpoint-GUID: iAr-ykhNVNl4sEansmqLqNjItgcUVEWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1034
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302230115
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=pierre@imap.linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_NXDOMAIN=0.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NO_DNS_FOR_FROM=0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Feb 2023 09:54:40 -0500
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

On 2023-02-23 13:53, Thomas Huth wrote:
> On 22/02/2023 15.20, Pierre Morel wrote:
>> The topology information are attributes of the CPU and are
>> specified during the CPU device creation.
> ...
>> diff --git a/include/hw/s390x/cpu-topology.h 
>> b/include/hw/s390x/cpu-topology.h
>> index 83f31604cc..fa7f885a9f 100644
>> --- a/include/hw/s390x/cpu-topology.h
>> +++ b/include/hw/s390x/cpu-topology.h
>> @@ -10,6 +10,47 @@
>>   #ifndef HW_S390X_CPU_TOPOLOGY_H
>>   #define HW_S390X_CPU_TOPOLOGY_H
>>   +#include "qemu/queue.h"
>> +#include "hw/boards.h"
>> +#include "qapi/qapi-types-machine-target.h"
>> +
>>   #define S390_TOPOLOGY_CPU_IFL   0x03
>>   +typedef struct S390Topology {
>> +    uint8_t *cores_per_socket;
>> +    CpuTopology *smp;
>> +    CpuS390Polarization polarization;
>> +} S390Topology;
>> +
>> +#ifdef CONFIG_KVM
>> +bool s390_has_topology(void);
>> +void s390_topology_setup_cpu(MachineState *ms, S390CPU *cpu, Error 
>> **errp);
>> +#else
>> +static inline bool s390_has_topology(void)
>> +{
>> +       return false;
>> +}
>> +static inline void s390_topology_setup_cpu(MachineState *ms,
>> +                                           S390CPU *cpu,
>> +                                           Error **errp) {}
>> +#endif
>> +
>> +extern S390Topology s390_topology;
>> +int s390_socket_nb(S390CPU *cpu);
>> +
>> +static inline int s390_std_socket(int n, CpuTopology *smp)
>> +{
>> +    return (n / smp->cores) % smp->sockets;
>> +}
>> +
>> +static inline int s390_std_book(int n, CpuTopology *smp)
>> +{
>> +    return (n / (smp->cores * smp->sockets)) % smp->books;
>> +}
>> +
>> +static inline int s390_std_drawer(int n, CpuTopology *smp)
>> +{
>> +    return (n / (smp->cores * smp->sockets * smp->books)) % 
>> smp->books;
> 
> Shouldn't that be " % smp->drawers" instead?

/o\  Yes it is of course.
thanks.

> 
>> +}
>> +
>>   #endif
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> new file mode 100644
>> index 0000000000..59f2cc15c7
>> --- /dev/null
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -0,0 +1,270 @@
>> +/*
>> + * CPU Topology
>> + *
>> + * Copyright IBM Corp. 2022
>> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
>> +
>> + * This work is licensed under the terms of the GNU GPL, version 2 or 
>> (at
>> + * your option) any later version. See the COPYING file in the 
>> top-level
>> + * directory.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/boards.h"
>> +#include "qemu/typedefs.h"
>> +#include "target/s390x/cpu.h"
>> +#include "hw/s390x/s390-virtio-ccw.h"
>> +#include "hw/s390x/cpu-topology.h"
>> +
>> +/*
>> + * s390_topology is used to keep the topology information.
>> + * .cores_per_socket: tracks information on the count of cores
>> + *                    per socket.
>> + * .smp: keeps track of the machine topology.
>> + *
>> + */
>> +S390Topology s390_topology = {
>> +    /* will be initialized after the cpu model is realized */
>> +    .cores_per_socket = NULL,
>> +    .smp = NULL,
>> +    .polarization = S390_CPU_POLARIZATION_HORIZONTAL,
>> +};
>> +
>> +/**
>> + * s390_socket_nb:
>> + * @cpu: s390x CPU
>> + *
>> + * Returns the socket number used inside the cores_per_socket array
>> + * for a cpu.
>> + */
>> +int s390_socket_nb(S390CPU *cpu)
>> +{
>> +    return (cpu->env.drawer_id * s390_topology.smp->books + 
>> cpu->env.book_id) *
>> +           s390_topology.smp->sockets + cpu->env.socket_id;
>> +}
>> +
>> +/**
>> + * s390_has_topology:
>> + *
>> + * Return value: if the topology is supported by the machine.
>> + */
>> +bool s390_has_topology(void)
>> +{
>> +    return false;
>> +}
>> +
>> +/**
>> + * s390_topology_init:
>> + * @ms: the machine state where the machine topology is defined
>> + *
>> + * Keep track of the machine topology.
>> + *
>> + * Allocate an array to keep the count of cores per socket.
>> + * The index of the array starts at socket 0 from book 0 and
>> + * drawer 0 up to the maximum allowed by the machine topology.
>> + */
>> +static void s390_topology_init(MachineState *ms)
>> +{
>> +    CpuTopology *smp = &ms->smp;
>> +
>> +    s390_topology.smp = smp;
>> +    s390_topology.cores_per_socket = g_new0(uint8_t, smp->sockets *
>> +                                            smp->books * 
>> smp->drawers);
>> +}
>> +
>> +/**
>> + * s390_topology_cpu_default:
>> + * @cpu: pointer to a S390CPU
>> + * @errp: Error pointer
>> + *
>> + * Setup the default topology if no attributes are already set.
>> + * Passing a CPU with some, but not all, attributes set is considered
>> + * an error.
>> + *
>> + * The function calculates the (drawer_id, book_id, socket_id)
>> + * topology by filling the cores starting from the first socket
>> + * (0, 0, 0) up to the last (smp->drawers, smp->books, smp->sockets).
>> + *
>> + * CPU type, entitlement and dedication have defaults values set in 
>> the
>> + * s390x_cpu_properties, however entitlement is forced to 0 'none' 
>> when
>> + * the polarization is horizontale.
>> + */
>> +static void s390_topology_cpu_default(S390CPU *cpu, Error **errp)
>> +{
>> +    CpuTopology *smp = s390_topology.smp;
>> +    CPUS390XState *env = &cpu->env;
>> +
>> +    /* All geometry topology attributes must be set or all unset */
>> +    if ((env->socket_id < 0 || env->book_id < 0 || env->drawer_id < 
>> 0) &&
>> +        (env->socket_id >= 0 || env->book_id >= 0 || env->drawer_id 
>> >= 0)) {
>> +        error_setg(errp,
>> +                   "Please define all or none of the topology 
>> geometry attributes");
>> +        return;
>> +    }
>> +
>> +    /* Check if one of the geometry topology is unset */
>> +    if (env->socket_id < 0) {
>> +        /* Calculate default geometry topology attributes */
>> +        env->socket_id = s390_std_socket(env->core_id, smp);
>> +        env->book_id = s390_std_book(env->core_id, smp);
>> +        env->drawer_id = s390_std_drawer(env->core_id, smp);
>> +    }
>> +
>> +    if (s390_topology.polarization == 
>> S390_CPU_POLARIZATION_HORIZONTAL) {
>> +        env->entitlement = 0;
> 
> Should this be S390_CPU_ENTITLEMENT_HORIZONTAL instead of 0 ?

Yes it is better thanks.

Regards,
Pierre


