Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE357649A78
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:53:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4eYH-0001Fm-8J; Mon, 12 Dec 2022 03:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4eYE-0001FG-8q; Mon, 12 Dec 2022 03:52:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1p4eYB-0003A7-Bk; Mon, 12 Dec 2022 03:52:41 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BC8Xemd015486; Mon, 12 Dec 2022 08:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JIW1UOv9PTAtbrreF6XgFeoV5ZJbetlM980Ww8PhpJQ=;
 b=UHEe/CiGLoCPSIkSohrlzn+58iCiBbNZ25Q6CRGnnaow+jcPoS21brDXh3DgCa5a/5KM
 e1d4IquCFoW/7NgTFXrGHKJQ1jeMjBzYIkdQFwtj2vrZD1r+jVW1hJkV9V0d6xUs6nbR
 lohxh1p1uBZkwefzk6n3LaPlTjzf+Vm0JKunsSA6vQ/l1FliSFEC6LKHFdS5Z0FZ2BDm
 tyEbzUoy/u+ibTQ3KBztNA5elAyqc9WQj7GwWDmoCE7EOyhK0OahTgONh4ZmJWyygnmF
 Bfk3qC53ETnS8aaaKBrSvMLF51W5rIWXEiKtcWi4CabB7SBUp7pRSUXzyZmBjIqqvFfH oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3sjkcag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 08:52:29 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BC8pl3S011518;
 Mon, 12 Dec 2022 08:52:29 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3md3sjkc9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 08:52:29 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BBNRN1B007817;
 Mon, 12 Dec 2022 08:52:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3mchcf2c2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Dec 2022 08:52:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2BC8qNKO23593416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Dec 2022 08:52:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24FE520043;
 Mon, 12 Dec 2022 08:52:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14BD620040;
 Mon, 12 Dec 2022 08:52:21 +0000 (GMT)
Received: from [9.171.10.222] (unknown [9.171.10.222])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 12 Dec 2022 08:52:20 +0000 (GMT)
Message-ID: <ff8d4db0-a01c-a833-e861-8525b2a71738@linux.ibm.com>
Date: Mon, 12 Dec 2022 09:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v13 1/7] s390x/cpu topology: Creating CPU topology device
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
References: <20221208094432.9732-1-pmorel@linux.ibm.com>
 <20221208094432.9732-2-pmorel@linux.ibm.com>
 <be4571a6-edaa-3291-1b31-6f309c00a9f9@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <be4571a6-edaa-3291-1b31-6f309c00a9f9@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: thbLjlvDSdMv3XVqhq1YHsWlg6YWrIr3
X-Proofpoint-ORIG-GUID: QDmlJKfEFxpvmxj0c62e1ZhRr_r_1sxb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-12_01,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212120080
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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



On 12/9/22 14:50, Thomas Huth wrote:
> On 08/12/2022 10.44, Pierre Morel wrote:
>> We will need a Topology device to transfer the topology
>> during migration and to implement machine reset.
>>
>> The device creation is fenced by s390_has_topology().
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> [...]
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> new file mode 100644
>> index 0000000000..b3e59873f6
>> --- /dev/null
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -0,0 +1,149 @@
>> +/*
>> + * CPU Topology
>> + *
>> + * Copyright IBM Corp. 2022
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
>> +#include "hw/qdev-properties.h"
>> +#include "hw/boards.h"
>> +#include "qemu/typedefs.h"
>> +#include "target/s390x/cpu.h"
>> +#include "hw/s390x/s390-virtio-ccw.h"
>> +#include "hw/s390x/cpu-topology.h"
>> +
>> +/**
>> + * s390_has_topology
>> + *
>> + * Return false until the commit activating the topology is
>> + * commited.
>> + */
>> +bool s390_has_topology(void)
>> +{
>> +    return false;
>> +}
>> +
>> +/**
>> + * s390_get_topology
>> + *
>> + * Returns a pointer to the topology.
>> + *
>> + * This function is called when we know the topology exist.
>> + * Testing if the topology exist is done with s390_has_topology()
>> + */
>> +S390Topology *s390_get_topology(void)
>> +{
>> +    static S390Topology *s390Topology;
>> +
>> +    if (!s390Topology) {
>> +        s390Topology = S390_CPU_TOPOLOGY(
>> +            object_resolve_path(TYPE_S390_CPU_TOPOLOGY, NULL));
>> +    }
>> +
>> +    assert(s390Topology);
> 
> I think you can move the assert() into the body of the if-statement.

Yes, clearly.

> 
>> +    return s390Topology;
>> +}
>> +
>> +/**
>> + * s390_init_topology
>> + * @machine: The Machine state, used to retrieve the SMP parameters
>> + * @errp: the error pointer in case of problem
>> + *
>> + * This function creates and initialize the S390Topology with
>> + * the QEMU -smp parameters we will use during adding cores to the
>> + * topology.
>> + */
>> +void s390_init_topology(MachineState *machine, Error **errp)
>> +{
>> +    DeviceState *dev;
>> +
>> +    if (machine->smp.threads > 1) {
>> +        error_setg(errp, "CPU Topology do not support multithreading");
> 
> s/CPU Toplogy do/CPU topology does/

Yes, thanks.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

