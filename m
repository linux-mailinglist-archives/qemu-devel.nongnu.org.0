Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251C70075F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:58:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxROL-0000ao-GG; Fri, 12 May 2023 07:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pxROH-0000aP-Oh; Fri, 12 May 2023 07:56:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pxROF-0001eR-NU; Fri, 12 May 2023 07:56:53 -0400
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34CBdf83016991; Fri, 12 May 2023 11:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TIu4W2JADrOOBltS0BTTn7tPlDY4abInPcWT8inBHFE=;
 b=VxVKKXrNEWG9qw0NB9kvUw7TzdJEfJYuL7pNhDv6GiFGLBlK+BS6GS4KNHmliHSMOGwH
 iuBJQTzTorzttSoMvezbZWVORXrZrim04rsM8fvc//12aSSjkNX5MW1P/OZzkFjtO4Ji
 S7NYM7qmzYciWkpeHmIFZkyhCVTxeE0FjR3RYN9V1c+n65uTHjAlmajZtr93WH+UutFY
 zHn0PXx8llDwpLGscr9gA7vvIgWtK4aXoKEAcXtR6rO7XdztM5Hsa/3YPQyNQ2J3R8vY
 fb3HRffAFruMzZB65rXOe/DSoWvwvekYQ2Wsfxos7ReqBwhvRThGPvFjOZguGzK4rD25 zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qhk82ucup-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 11:56:40 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34CBeAtG023910;
 Fri, 12 May 2023 11:56:38 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qhk82uctq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 11:56:38 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34CBahv2002931;
 Fri, 12 May 2023 11:56:36 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3qf7e0swde-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 May 2023 11:56:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34CBuUKE34472598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 May 2023 11:56:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D653A2004B;
 Fri, 12 May 2023 11:56:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7937520040;
 Fri, 12 May 2023 11:56:29 +0000 (GMT)
Received: from [9.171.54.237] (unknown [9.171.54.237])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 12 May 2023 11:56:29 +0000 (GMT)
Message-ID: <635572ce-44ae-c9f5-6b80-d48770cdffbe@linux.ibm.com>
Date: Fri, 12 May 2023 13:56:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v20 12/21] qapi/s390x/cpu topology: query-cpu-polarization
 qmp command
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-13-pmorel@linux.ibm.com>
 <2fa507c7894c6085d6306b1bda23c392d151a680.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <2fa507c7894c6085d6306b1bda23c392d151a680.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AFU2XzCAtMUyMJv6b4VduiRtefJMuM0X
X-Proofpoint-GUID: iMPHJGwcWSj2ri_gWOQ4tPC9t22KQaT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_08,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.845,
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


On 5/10/23 14:04, Nina Schoetterl-Glausch wrote:
> On Tue, 2023-04-25 at 18:14 +0200, Pierre Morel wrote:
>> The query-cpu-polarization qmp command returns the current
>> CPU polarization of the machine.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   qapi/machine-target.json | 30 ++++++++++++++++++++++++++++++
>>   hw/s390x/cpu-topology.c  | 14 ++++++++++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index ffde2e9cbd..8eb05755cd 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -4,6 +4,7 @@
>>   # This work is licensed under the terms of the GNU GPL, version 2 or later.
>>   # See the COPYING file in the top-level directory.
>>   
>> +{ 'include': 'common.json' }
> Why do you need this?

exact, I do not need it.


>
>>   { 'include': 'machine-common.json' }
>>   
>>   ##
>> @@ -424,3 +425,32 @@
>>     'features': [ 'unstable' ],
>>     'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
>>   }
>> +
>> +##
>> +# @CpuPolarizationInfo:
>> +#
>> +# The result of a cpu polarization
>> +#
>> +# @polarization: the CPU polarization
>> +#
>> +# Since: 2.8
> 2.8?

yes, 8.1


>
>> +##
>> +{ 'struct': 'CpuPolarizationInfo',
>> +  'data': { 'polarization': 'CpuS390Polarization' },
>> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
>> +}
>> +
>> +##
>> +# @query-cpu-polarization:
>> +#
>> +# Features:
>> +# @unstable: This command may still be modified.
>> +#
>> +# Returns: the machine polarization
>> +#
>> +# Since: 8.1
>> +##
>> +{ 'command': 'query-cpu-polarization', 'returns': 'CpuPolarizationInfo',
> Do you need the struct or could you use CpuS390Polarization directly here?
> The struct allows for more flexibility in the future, I can't imagine a reason
> why it'd be necessary, but I'm not opposed.

That is what I thought, keeping flexibility.



>
>
>> +  'features': [ 'unstable' ],
>> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
>> +}
>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>> index e8b140d623..d440e8a3c6 100644
>> --- a/hw/s390x/cpu-topology.c
>> +++ b/hw/s390x/cpu-topology.c
>> @@ -18,6 +18,7 @@
>>   #include "hw/s390x/cpu-topology.h"
>>   #include "qapi/qapi-commands-machine-target.h"
>>   #include "qapi/qapi-events-machine-target.h"
>> +#include "qapi/type-helpers.h"
> What do you need this include for?

I do not need it.


>
>>   
>>   /*
>>    * s390_topology is used to keep the topology information.
>> @@ -468,3 +469,16 @@ void qmp_set_cpu_topology(uint16_t core,
>>                            has_drawer, drawer, has_entitlement, entitlement,
>>                            has_dedicated, dedicated, errp);
>>   }
>> +
>> +CpuPolarizationInfo *qmp_query_cpu_polarization(Error **errp)
>> +{
>> +    CpuPolarizationInfo *info = g_new0(CpuPolarizationInfo, 1);
>> +
>> +    if (s390_topology.vertical_polarization) {
>> +        info->polarization = S390_CPU_POLARIZATION_VERTICAL;
>> +    } else {
>> +        info->polarization = S390_CPU_POLARIZATION_HORIZONTAL;
>> +    }
>> +
>> +    return info;
>> +}

Thanks,

I will clean this leftovers from the first draw.

Regards

Pierre


