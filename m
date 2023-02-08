Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AB068EAAF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:12:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgUm-0001l1-35; Wed, 08 Feb 2023 04:12:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pPgUS-0001im-NQ; Wed, 08 Feb 2023 04:11:44 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pPgUQ-0007LS-Jn; Wed, 08 Feb 2023 04:11:44 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31890e5D002210; Wed, 8 Feb 2023 09:11:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RbCGstQko5UnARpdo7FY0O9kFxj/15ou8qnisEudruw=;
 b=WFwj6IpDvC24+M3iIgM7iO3X4ELJLatAxDEU/54GcyGLQdX965Vo/mxRvpZe/LKppyek
 65zcbJz45AZvTHSRJfqwKUxb9DkZj7ZErhjTiiRIrAzgoVJe5F38cjhr3t0byiBe6PMi
 v7kggL+UJIBmo+qpr+5Skc1JxeuPOu7xPWYZ1nsisS3o9M9a6Wu8zEjjs9SnPV++XASI
 IU9g0EIvz9vFY6uUAHZAmPLfhVBN6MtPkW8w3K9ZSeQpOOwm9W+riCOR3lS1xpdoYKir
 h0+7q/o+GR371FAwqI1r/JCGQZXZHG1agrs1wYKgzHH3O+UCPfgWuTo7lsdXqVeSiD1P Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm8qwgebr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 09:11:29 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31892Bxk007411;
 Wed, 8 Feb 2023 09:11:28 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm8qwgeax-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 09:11:28 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317Lk5Xn011173;
 Wed, 8 Feb 2023 09:11:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3nhf06u98h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Feb 2023 09:11:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3189BMek49152440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Feb 2023 09:11:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53B9B2004E;
 Wed,  8 Feb 2023 09:11:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D77AF20043;
 Wed,  8 Feb 2023 09:11:21 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  8 Feb 2023 09:11:21 +0000 (GMT)
Message-ID: <048defd7-f472-4249-10b7-bf05ed2f5e95@linux.ibm.com>
Date: Wed, 8 Feb 2023 10:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v15 09/11] machine: adding s390 topology to query-cpu-fast
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-10-pmorel@linux.ibm.com>
 <4cbe99ff13f1f8e917481e6d85daf2957dad8247.camel@linux.ibm.com>
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <4cbe99ff13f1f8e917481e6d85daf2957dad8247.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H-qjDO_NP9Ytq_YyTNZQaDA-BQTUUnOX
X-Proofpoint-ORIG-GUID: dnkJKBzPuh6Xh_sSZ7j_1FDLCmIZXnjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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



On 2/7/23 19:26, Nina Schoetterl-Glausch wrote:
> On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
>> S390x provides two more topology containers above the sockets,
>> books and drawers.
>>
>> Let's add these CPU attributes to the QAPI command query-cpu-fast.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   qapi/machine.json          | 13 ++++++++++---
>>   hw/core/machine-qmp-cmds.c |  2 ++
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 3036117059..e36c39e258 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -53,11 +53,18 @@
>>   #
>>   # Additional information about a virtual S390 CPU
>>   #
>> -# @cpu-state: the virtual CPU's state
>> +# @cpu-state: the virtual CPU's state (since 2.12)
>> +# @dedicated: the virtual CPU's dedication (since 8.0)
>> +# @polarity: the virtual CPU's polarity (since 8.0)
>>   #
>>   # Since: 2.12
>>   ##
>> -{ 'struct': 'CpuInfoS390', 'data': { 'cpu-state': 'CpuS390State' } }
>> +{ 'struct': 'CpuInfoS390',
>> +    'data': { 'cpu-state': 'CpuS390State',
>> +              'dedicated': 'bool',
>> +              'polarity': 'int'
>> +    }
>> +}
>>   
>>   ##
>>   # @CpuInfoFast:
>> @@ -70,7 +77,7 @@
>>   #
>>   # @thread-id: ID of the underlying host thread
>>   #
>> -# @props: properties describing to which node/socket/core/thread
>> +# @props: properties describing to which node/drawer/book/socket/core/thread
>>   #         virtual CPU belongs to, provided if supported by board
>>   #
>>   # @target: the QEMU system emulation target, which determines which
>> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
>> index 80d5e59651..e6d93cf2a0 100644
>> --- a/hw/core/machine-qmp-cmds.c
>> +++ b/hw/core/machine-qmp-cmds.c
>> @@ -30,6 +30,8 @@ static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
>>       CPUS390XState *env = &s390_cpu->env;
>>   
>>       info->cpu_state = env->cpu_state;
>> +    info->dedicated = env->dedicated;
>> +    info->polarity = env->entitlement;
> 
> Might want to do s/polarity/entitlement on the whole patch to make this more coherent.
> Reviewed-by: Nina Schoetterl-Glausch if you fix the issues in Thomas' first reply.
> 

OK, substitution done and Thomas changes already done.
Thanks.

Regards,
Pierre



-- 
Pierre Morel
IBM Lab Boeblingen

