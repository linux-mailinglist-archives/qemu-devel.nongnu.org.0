Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39499671D93
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 14:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI8LQ-0000Cq-Ui; Wed, 18 Jan 2023 08:19:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pI8LN-00009L-Aw; Wed, 18 Jan 2023 08:19:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pI8LK-0006ZI-7V; Wed, 18 Jan 2023 08:19:08 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IDA4a4026579; Wed, 18 Jan 2023 13:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NYbbonmwmTKG18jwPn2PoTy0UGH6KHhJCyK8/m2jhmA=;
 b=lX+YErun+tZP1qW5s9eE8ylKRY4TFXCwKfmN+5/0NFedE541oycH1pEA/cOeiWScGNS9
 J3loaY/Ygcum5ccis9V4J3RfrZaVvYusnaEt9o9Lq/ff7DytFwq5+xqdDPBYgYmOKhZZ
 EjBg8nSEoMIBaxg+P04P0Shx4u0oeK4hT7LVDP6HJtFZzVgZU+mkODyO7ukYCYC/9pQO
 B4bqmimZ5lRvoXWXhKJZp4zX6WbQYMX/kvRxGRMl959k+kjtnXPG5w4oSGj56K8i312B
 t2+IihLfBSM659nMrkzOcQjDwgVXrxBCBIhkx7k7+1mi3MlP/OTxq1suqqVSIKa9fFSo Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6f91ucjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 13:18:06 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30ICsRQY021892;
 Wed, 18 Jan 2023 13:18:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6f91ucj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 13:18:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ICtbA3006229;
 Wed, 18 Jan 2023 13:18:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfnam3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 13:18:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30IDHxC145613382
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Jan 2023 13:18:00 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D09A120040;
 Wed, 18 Jan 2023 13:17:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA0A820043;
 Wed, 18 Jan 2023 13:17:58 +0000 (GMT)
Received: from [9.171.39.117] (unknown [9.171.39.117])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 18 Jan 2023 13:17:58 +0000 (GMT)
Message-ID: <2242c485-1f34-bf58-30a8-4f6443dc672d@linux.ibm.com>
Date: Wed, 18 Jan 2023 14:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org, borntraeger@de.ibm.com,
 pasic@linux.ibm.com, richard.henderson@linaro.org, david@redhat.com,
 thuth@redhat.com, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, scgl@linux.ibm.com,
 frankja@linux.ibm.com, clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com> <Y7/29cONlVoKukIP@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <Y7/29cONlVoKukIP@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ix2_0e-Bg8kkADjNgXQhKSQUG7rE5awk
X-Proofpoint-ORIG-GUID: sohAw0zDgTpzfYC4E6caP3uNw52okJuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301180113
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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



On 1/12/23 13:03, Daniel P. Berrangé wrote:
> On Thu, Jan 05, 2023 at 03:53:10PM +0100, Pierre Morel wrote:
>> The modification of the CPU attributes are done through a monitor
>> commands.
>>
>> It allows to move the core inside the topology tree to optimise
>> the cache usage in the case the host's hypervizor previously
>> moved the CPU.
>>
>> The same command allows to modifiy the CPU attributes modifiers
>> like polarization entitlement and the dedicated attribute to notify
>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>
>> With this knowledge the guest has the possibility to optimize the
>> usage of the vCPUs.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   qapi/machine-target.json |  29 ++++++++
>>   include/monitor/hmp.h    |   1 +
>>   hw/s390x/cpu-topology.c  | 141 +++++++++++++++++++++++++++++++++++++++
>>   hmp-commands.hx          |  16 +++++
>>   4 files changed, 187 insertions(+)
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index 2e267fa458..75b0aa254d 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -342,3 +342,32 @@
>>                      'TARGET_S390X',
>>                      'TARGET_MIPS',
>>                      'TARGET_LOONGARCH64' ] } }
>> +
>> +##
>> +# @change-topology:
>> +#
>> +# @core: the vCPU ID to be moved
>> +# @socket: the destination socket where to move the vCPU
>> +# @book: the destination book where to move the vCPU
>> +# @drawer: the destination drawer where to move the vCPU
> 
> This movement can be done while the guest OS is running ?
> What happens to guest OS apps ? Every I know will read
> topology once and assume it never changes at runtime.

Yes this can change while the guest is running.

The S390 Logical PARtition, where the Linux runs is already a first 
level of virtualization and the lpar CPU are already virtual CPU which 
can be moved from one real CPU to another, the guest is at a second 
level of virtualization.

On the LPAR host an admin can check the topology.
A lpar CPU can be moved to another real CPU because of multiple reasons: 
maintenance, failure, other decision from the first level hypervisor 
that I do not know, may be scheduling balancing.

There is a mechanism for the OS in which is running in LPAR to set a 
flag for the guest on a topology change.
The guest use a specific instruction to get this flag.
This instruction PTF(2) is interpreted by the firmware and does not 
appear in this patch series but in Linux patch series.

So we have, real CPU <-> lpar CPU <-> vCPU

> 
> What's the use case for wanting to re-arrange topology in
> this manner ? It feels like its going to be a recipe for
> hard to diagnose problems, as much code in libvirt and apps
> above will assuming the vCPU IDs are assigned sequentially
> starting from node=0,book=0,drawer=0,socket=0,core=0,
> incrementing core, then incrementing socket, then
> incrementing drawer, etc.

The goal to rearrange the vCPU is to give the guest the knowledge of the 
topology so it can takes benefit of it.
If a lpar CPU moved to another real CPU in another drawer we must move 
the guest vCPU to another drawer so the guest OS can take the best 
scheduling decisions.

Per default, if nothing is specified on the creation of a vCPU, the 
creation is done exactly like you said, starting from (0,0,0,0) and 
incrementing.

There are two possibility to set a vCPU at its place:

1) on creation by specifying the drawer,book,socket for a specific core-id

2) with this QAPI command to move the CPU while it is running.
Note that the core-id and the CPU address do not change when moving the 
CPU so that there is no problem with scheduling, all we do is to provide 
the topology up to the guest when it asks.

The period of checking by the Linux kernel if there is a change and if 
there is a need to ask the topology is one minute.

The migration of CPU is not supposed to happen very often, (not every day).

> 
>> +# @polarity: optional polarity, default is last polarity set by the guest
>> +# @dedicated: optional, if the vCPU is dedicated to a real CPU
>> +#
>> +# Modifies the topology by moving the CPU inside the topology
>> +# tree or by changing a modifier attribute of a CPU.
>> +#
>> +# Returns: Nothing on success, the reason on failure.
>> +#
>> +# Since: <next qemu stable release, eg. 1.0>
>> +##
>> +{ 'command': 'change-topology',
> 
> 'set-cpu-topology'

OK, yes looks better.

> 
>> +  'data': {
>> +      'core': 'int',
>> +      'socket': 'int',
>> +      'book': 'int',
>> +      'drawer': 'int',
>> +      '*polarity': 'int',
>> +      '*dedicated': 'bool'
>> +  },
>> +  'if': { 'all': [ 'TARGET_S390X', 'CONFIG_KVM' ] }
>> +}
> 
> 
> With regards,
> Daniel

Thanks,

Regards,
Pierre


-- 
Pierre Morel
IBM Lab Boeblingen

