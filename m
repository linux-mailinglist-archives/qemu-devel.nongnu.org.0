Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EE6F187B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 14:52:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psNZm-000680-N5; Fri, 28 Apr 2023 08:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1psNZZ-000653-U9; Fri, 28 Apr 2023 08:51:40 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1psNZW-0003jd-1v; Fri, 28 Apr 2023 08:51:35 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33SCgeYJ032323; Fri, 28 Apr 2023 12:51:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hB/YeMuZ+C9LTr6KvS7XlZVAY82RPLksiIyw1zViUac=;
 b=Hlh2q0Sk7usvVZy1l+IdX8536X80vE6MJfGKPwmS597813CHnhkRym9hqO0+zH9Up7uc
 Gkz3uLZGW5H2Gzb6QZ7HpJiTMZtfd5QNcPLud/OHa44eYLg1op40Gx/9GIIvQ00KH2EL
 KEk3r4tv5PoHG1eCJehXKE1nTZeRlhXSnv0p/aolxS4YL/htCml3PbW8gpLstm+oZfy5
 7/mz3wEZpZOwYXXeAMTi0RWpZdQi6flA6OaVTPe3yTwSUWReI9m2Odt+Yc+UfVlqMOpr
 ix+dTXp2dAjqYWr0EYIf0yOOfcJ0miqSqZIXbhEInMC37BTBpYHpMEIDXKAp4ycBxWzC Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q8e670nhj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 12:51:27 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33SCgkPK000349;
 Fri, 28 Apr 2023 12:51:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q8e670nb9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 12:51:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33RNYAaF030958;
 Fri, 28 Apr 2023 12:35:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug3j2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Apr 2023 12:35:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33SCZONV28836558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Apr 2023 12:35:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2958520063;
 Fri, 28 Apr 2023 12:35:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03DC02006C;
 Fri, 28 Apr 2023 12:35:23 +0000 (GMT)
Received: from [9.171.23.33] (unknown [9.171.23.33])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 28 Apr 2023 12:35:22 +0000 (GMT)
Message-ID: <e233756c-52f6-547c-4c06-708459a98075@linux.ibm.com>
Date: Fri, 28 Apr 2023 14:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v20 02/21] s390x/cpu topology: add topology entries on CPU
 hotplug
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 nsg@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-3-pmorel@linux.ibm.com>
 <1a919123-f07b-572e-8a33-0e5f9a6ed75c@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <1a919123-f07b-572e-8a33-0e5f9a6ed75c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3XSfIqpq0zytwly5SFiJ9E7NfjP7DEhH
X-Proofpoint-ORIG-GUID: 8HGVGFqCN1XglR3TI8tfLsWNp4flu1Ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-28_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304280102
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/27/23 15:38, Thomas Huth wrote:
> On 25/04/2023 18.14, Pierre Morel wrote:
>> The topology information are attributes of the CPU and are
>> specified during the CPU device creation.
>>
>> On hot plug we:
>> - calculate the default values for the topology for drawers,
>>    books and sockets in the case they are not specified.
>> - verify the CPU attributes
>> - check that we have still room on the desired socket
>>
>> The possibility to insert a CPU in a mask is dependent on the
>> number of cores allowed in a socket, a book or a drawer, the
>> checking is done during the hot plug of the CPU to have an
>> immediate answer.
>>
>> If the complete topology is not specified, the core is added
>> in the physical topology based on its core ID and it gets
>> defaults values for the modifier attributes.
>>
>> This way, starting QEMU without specifying the topology can
>> still get some advantage of the CPU topology.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> new file mode 100644
>> index 0000000000..471e0e7292
>> --- /dev/null
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -0,0 +1,259 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * CPU Topology
>
> Since you later introduce a file with almost the same name in the 
> target/s390x/ folder, it would be fine to have some more explanation 
> here what this file is all about (especially with regards to the other 
> file in target/s390x/).


I first did put the interceptions in target/s390/ then moved them in 
target/s390x/kvm because it is KVM related then again only let STSI 
interception.

But to be honest I do not see any reason why not put everything in 
hw/s390x/ if CPU topology is implemented for TCG I think the code will 
call insert_stsi_15_1_x() too.

no?


>
>> + *
>> + * Copyright IBM Corp. 2022,2023
>> + * Author(s): Pierre Morel <pmorel@linux.ibm.com>
>> + *
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qapi/error.h"
>> +#include "qemu/error-report.h"
>> +#include "hw/qdev-properties.h"
>> +#include "hw/boards.h"
>> +#include "qemu/typedefs.h"
>
> qemu/typedefs.h is already included by osdep.h by default, no need to 
> re-include it here.


OK , I remove it

>
>> +#include "target/s390x/cpu.h"
>> +#include "hw/s390x/s390-virtio-ccw.h"
>> +#include "hw/s390x/cpu-topology.h"
> ...> +
>> +/**
>> + * s390_topology_setup_cpu:
>> + * @ms: MachineState used to initialize the topology structure on
>> + *      first call.
>> + * @cpu: the new S390CPU to insert in the topology structure
>> + * @errp: the error pointer
>> + *
>> + * Called from CPU Hotplug to check and setup the CPU attributes
>
> s/Hotplug/hotplug/

yes


>
>> + * before the CPU is inserted in the topology.
>> + * There is no need to update the MTCR explicitely here because it
>
> s/explicitely/explicitly/

thanx


>
>> + * will be updated by KVM on creation of the new CPU.
>> + */
>> +void s390_topology_setup_cpu(MachineState *ms, S390CPU *cpu, Error 
>> **errp)
> ...
>
>  Thomas
>
>

Regards,

Pierre


