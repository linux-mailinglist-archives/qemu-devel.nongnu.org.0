Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C096A0C4F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:55:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCzc-0004jD-B2; Thu, 23 Feb 2023 09:54:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@imap.linux.ibm.com>)
 id 1pVChE-0001d3-QC; Thu, 23 Feb 2023 09:35:44 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierre@imap.linux.ibm.com>)
 id 1pVChC-0007Cn-Bt; Thu, 23 Feb 2023 09:35:44 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31NE948U023945; Thu, 23 Feb 2023 14:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=amhM/uS7Yd7n9K3qRLH+MxChbb06ibXMqBRuKieb9jE=;
 b=lh8ZLS49GUNg/eaQDIKxP8BqqP7Iyfgm9YxrJ2MRA1GK3stwZGt+6RCEKAa2Fdwn16px
 WSrKqaKViBhrnlP+yRBzr8ZWHl9tbImjioLBZIE8BAJIfpF8DLc8YDTPid3JF3X2D/cN
 ZhoJ8G2mUX6ZziOepWo2aFGtzjTMW0SgsL7t7fqWK5sd+ZyRi//OO61mlJevjnawu12L
 sBSwzWPG1XKn6/ucZOtD7ljuxVJvL0VBeX5NdAGI/o+ECODxrwk/ka4XQp0OACriYQXH
 NwzE1Z756B/CmDKZzGxwp7ZWoMF9MLLPPEFNAifIIGPMvazwz+3f2XJR26rLM4FoQZ0j cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx7gdmr9f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 14:35:18 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31NDnSmS008898;
 Thu, 23 Feb 2023 14:35:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nx7gdmr8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 14:35:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31NE6hSE023041;
 Thu, 23 Feb 2023 14:35:16 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
 by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3ntpa76n0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Feb 2023 14:35:16 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31NEZFde5964512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Feb 2023 14:35:15 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 354CE58062;
 Thu, 23 Feb 2023 14:35:15 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B6C58056;
 Thu, 23 Feb 2023 14:35:13 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 23 Feb 2023 14:35:13 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 23 Feb 2023 15:35:12 +0100
From: pierre <pierre@imap.linux.ibm.com>
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pasic@linux.ibm.com, richard.henderson@linaro.org, david@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
Subject: Re: [PATCH v16 02/11] s390x/cpu topology: add topology entries on CPU
 hotplug
In-Reply-To: <969c9ec842174876d514d082afe1c383baf58b99.camel@linux.ibm.com>
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-3-pmorel@linux.ibm.com>
 <4bd16293-62e8-d7ea-dab4-9e5cb0208812@redhat.com>
 <a19eb89ab4841e389e72b50ec017ae01@imap.linux.ibm.com>
 <969c9ec842174876d514d082afe1c383baf58b99.camel@linux.ibm.com>
Message-ID: <813e19dfbe961d9c376e86a7d0faee61@imap.linux.ibm.com>
X-Sender: pierre@imap.linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: x1BR1TwOV4tV5cWhVVgXwnbW5-q-ksbN
X-Proofpoint-GUID: DX4RypuY6Id25x5XBZRmCKiajk1Lj-YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302230118
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=pierre@imap.linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_NXDOMAIN=0.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NO_DNS_FOR_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

On 2023-02-23 15:13, Nina Schoetterl-Glausch wrote:
> On Thu, 2023-02-23 at 15:06 +0100, pierre wrote:
>> On 2023-02-23 13:53, Thomas Huth wrote:
>> > On 22/02/2023 15.20, Pierre Morel wrote:
>> > > The topology information are attributes of the CPU and are
>> > > specified during the CPU device creation.
>> > ...
>> > > diff --git a/include/hw/s390x/cpu-topology.h
>> > > b/include/hw/s390x/cpu-topology.h
>> > > index 83f31604cc..fa7f885a9f 100644
>> > > --- a/include/hw/s390x/cpu-topology.h
>> > > +++ b/include/hw/s390x/cpu-topology.h
>> > > @@ -10,6 +10,47 @@
>> > >   #ifndef HW_S390X_CPU_TOPOLOGY_H
>> > >   #define HW_S390X_CPU_TOPOLOGY_H
>> > >   +#include "qemu/queue.h"
>> > > +#include "hw/boards.h"
>> > > +#include "qapi/qapi-types-machine-target.h"
>> > > +
>> > >   #define S390_TOPOLOGY_CPU_IFL   0x03
>> > >   +typedef struct S390Topology {
>> > > +    uint8_t *cores_per_socket;
>> > > +    CpuTopology *smp;
>> > > +    CpuS390Polarization polarization;
>> > > +} S390Topology;
>> > > +
>> > > +#ifdef CONFIG_KVM
>> > > +bool s390_has_topology(void);
>> > > +void s390_topology_setup_cpu(MachineState *ms, S390CPU *cpu, Error
>> > > **errp);
>> > > +#else
>> > > +static inline bool s390_has_topology(void)
>> > > +{
>> > > +       return false;
>> > > +}
>> > > +static inline void s390_topology_setup_cpu(MachineState *ms,
>> > > +                                           S390CPU *cpu,
>> > > +                                           Error **errp) {}
>> > > +#endif
>> > > +
>> > > +extern S390Topology s390_topology;
>> > > +int s390_socket_nb(S390CPU *cpu);
>> > > +
>> > > +static inline int s390_std_socket(int n, CpuTopology *smp)
>> > > +{
>> > > +    return (n / smp->cores) % smp->sockets;
>> > > +}
>> > > +
>> > > +static inline int s390_std_book(int n, CpuTopology *smp)
>> > > +{
>> > > +    return (n / (smp->cores * smp->sockets)) % smp->books;
>> > > +}
>> > > +
>> > > +static inline int s390_std_drawer(int n, CpuTopology *smp)
>> > > +{
>> > > +    return (n / (smp->cores * smp->sockets * smp->books)) %
>> > > smp->books;
>> >
>> > Shouldn't that be " % smp->drawers" instead?
>> 
>> /o\  Yes it is of course.
>> thanks.
> 
> You can also just drop the modulo, since
> n < core * sockets * books * drawers. Not that % drawers does any harm 
> ofc.
>> 
> [...]

Yes right, thanks. May be I keep it in case there is another level one 
of these days.

Regards,
Pierre

