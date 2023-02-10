Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6CB6920A1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 15:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQUDB-0002Ec-TE; Fri, 10 Feb 2023 09:17:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pQUD8-0002Dj-Dc; Fri, 10 Feb 2023 09:17:10 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pQUD5-0006eL-Sd; Fri, 10 Feb 2023 09:17:09 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31AEBqGo011604; Fri, 10 Feb 2023 14:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tVDk1rEP0VaCBaus9lBDDgaSjt+TFN/TR8SbNhdk7wo=;
 b=tDuy+iDU0vkQO+agcaXvueIb5CwXcY3OUXAVpTjLkoCVd/Xmov7lPkbLMQ7GbUTXktaj
 T4lz4aEVDsT9yUY/QCjzWMm+jRkwXyuSqVzIl++1myjKZD+OFMIDHBvpGLe1iyVgY8xo
 HuolR1p0nyre4dno3AcAraCxBCuKcB+FM+Ix2X+FqEDmUtdofLGZ2PrKPi2mnK4NF+Kg
 690+AhVF/Nsq7zzyWC1JJZ1EUEOFD8x90mNKB1vtb5tfptgyS0fVkWn4zhRNmOUU0wa/
 R59/5W17GbWzp6/es4820Dw8mdCn0RYI72FNlxdSzjozWEUogVN1xDtvgX9C1YYFKNhT Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnqfrg4u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 14:17:01 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31AEDLTi020565;
 Fri, 10 Feb 2023 14:17:01 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnqfrg4t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 14:17:01 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31A5nqm8002355;
 Fri, 10 Feb 2023 14:16:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06qkdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Feb 2023 14:16:58 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31AEGsT050921906
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Feb 2023 14:16:55 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1CC72004B;
 Fri, 10 Feb 2023 14:16:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8007120040;
 Fri, 10 Feb 2023 14:16:53 +0000 (GMT)
Received: from [9.171.75.239] (unknown [9.171.75.239])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Fri, 10 Feb 2023 14:16:53 +0000 (GMT)
Message-ID: <fd2dbec5-d167-af22-b5c8-d65fc2a95c10@linux.ibm.com>
Date: Fri, 10 Feb 2023 15:16:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v15 03/11] target/s390x/cpu topology: handle STSI(15) and
 build the SYSIB
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230201132051.126868-1-pmorel@linux.ibm.com>
 <20230201132051.126868-4-pmorel@linux.ibm.com>
 <224677259469c69c61e120a24b7fd0754fd52956.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <224677259469c69c61e120a24b7fd0754fd52956.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BajB6IbkJeCuJdWLXah737a8S2FIUMoT
X-Proofpoint-ORIG-GUID: F9-N7fTfBaPkl5OnKOKjPf0DkurEJ0kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_08,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100115
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149, SPF_HELO_NONE=0.001,
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



On 2/9/23 17:39, Nina Schoetterl-Glausch wrote:
> On Wed, 2023-02-01 at 14:20 +0100, Pierre Morel wrote:
>> On interception of STSI(15.1.x) the System Information Block
>> (SYSIB) is built from the list of pre-ordered topology entries.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   include/hw/s390x/cpu-topology.h |  22 +++
>>   include/hw/s390x/sclp.h         |   1 +
>>   target/s390x/cpu.h              |  72 +++++++
>>   hw/s390x/cpu-topology.c         |  10 +
>>   target/s390x/kvm/cpu_topology.c | 335 ++++++++++++++++++++++++++++++++
>>   target/s390x/kvm/kvm.c          |   5 +-
>>   target/s390x/kvm/meson.build    |   3 +-
>>   7 files changed, 446 insertions(+), 2 deletions(-)
>>   create mode 100644 target/s390x/kvm/cpu_topology.c
>>
> [...]
>> +
>> +/**
>> + * s390_topology_from_cpu:
>> + * @cpu: The S390CPU
>> + *
>> + * Initialize the topology id from the CPU environment.
>> + */
>> +static s390_topology_id s390_topology_from_cpu(S390CPU *cpu)
>> +{
>> +    s390_topology_id topology_id = {0};
>> +
>> +    topology_id.drawer = cpu->env.drawer_id;
>> +    topology_id.book = cpu->env.book_id;
>> +    topology_id.socket = cpu->env.socket_id;
>> +    topology_id.origin = cpu->env.core_id / 64;
>> +    topology_id.type = S390_TOPOLOGY_CPU_IFL;
>> +    topology_id.dedicated = cpu->env.dedicated;
>> +
>> +    if (s390_topology.polarity == POLARITY_VERTICAL) {
>> +        /*
>> +         * Vertical polarity with dedicated CPU implies
>> +         * vertical high entitlement.
>> +         */
>> +        if (topology_id.dedicated) {
>> +            topology_id.polarity |= POLARITY_VERTICAL_HIGH;
>> +        } else {
>> +            topology_id.polarity |= cpu->env.entitlement;
>> +        }
> 
> Why |= instead of an assignment?
> Anyway, I think you can get rid of this in the next version.
> If you define the entitlement via qapi you can just put a little switch
> here and convert it to the hardware definition of polarization.
> (Or you just do +1, but I think the switch is easier to understand)

Oh! right thanks, it is a leftover from when dedication and polarity 
were in the same variable.

I change it with the QAPI enum.

Regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

