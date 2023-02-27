Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D566A4493
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFR-0002Db-39; Mon, 27 Feb 2023 09:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pWeF2-0000Xr-DK; Mon, 27 Feb 2023 09:12:36 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pWeEY-0001If-IU; Mon, 27 Feb 2023 09:12:09 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31RCwGmc026762; Mon, 27 Feb 2023 14:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XltuIMq36m0ajhKQ7upmU3Dd3wV1feKXreEaVrIQNTg=;
 b=JOD9JMuh9OY7L1n2rsKP6eqnbCcB1kDQv2CjdJmNnHFOFH8TsKuI0PaXEFrz1cKiRRQC
 6YKXkjSqQIDd55BIZ/f8al7Sq6TcVEV/MVXyOrnOyPvnlSAvpImAzuPIfKQnjhG26H8T
 BNc8B6dSw9XlGigf/iene8u6qmwz8DFiu0YI4eOjM8O6uTw8dU3sGnYN7jcj1ifQ9voF
 MXwAch5qHUMDkxgJ7biCIoIcQZf0iE+bO3i60ey0Q4u1I8rvdDBNGO98yYT6xIDsrhhS
 llznt9EPDVwGIccFNUUKAdfUwaCI+tbccLqLqH/vyWGhiUq6j/KBrWIcVeSlJLstsJfZ 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p0u1r5cwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 14:11:55 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31RDQprc003376;
 Mon, 27 Feb 2023 14:11:55 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p0u1r5cvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 14:11:55 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31R83bSC026638;
 Mon, 27 Feb 2023 14:11:52 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3nybb4j2wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Feb 2023 14:11:52 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com
 [10.20.54.104])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 31REBnYN21365390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Feb 2023 14:11:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25E222004B;
 Mon, 27 Feb 2023 14:11:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4EF9A20049;
 Mon, 27 Feb 2023 14:11:47 +0000 (GMT)
Received: from [9.171.14.212] (unknown [9.171.14.212])
 by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon, 27 Feb 2023 14:11:47 +0000 (GMT)
Message-ID: <9d80a9d9-e640-2fe7-6e66-4b3277a3ba5e@linux.ibm.com>
Date: Mon, 27 Feb 2023 15:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v16 08/11] qapi/s390x/cpu topology: set-cpu-topology
 monitor command
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230222142105.84700-1-pmorel@linux.ibm.com>
 <20230222142105.84700-9-pmorel@linux.ibm.com>
 <aaf4aa7b7350e88f65fc03f148146e38fe4f7fdb.camel@linux.ibm.com>
 <4335eac8-ba5d-5b6c-b19f-4b10a793ba0c@linux.ibm.com>
 <7504a2a236c314bcb5a2030c65b95b32d8b896bf.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <7504a2a236c314bcb5a2030c65b95b32d8b896bf.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7jZPJoJl782ix4mCwmW1033rZFLpKo-G
X-Proofpoint-ORIG-GUID: 22PfbI7GgoBa_1NqCqBt0jzjTXbTnnVD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_10,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270109
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089, SPF_HELO_NONE=0.001,
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


On 2/27/23 13:15, Nina Schoetterl-Glausch wrote:
> On Mon, 2023-02-27 at 11:57 +0100, Pierre Morel wrote:
>> On 2/24/23 18:15, Nina Schoetterl-Glausch wrote:
>>> On Wed, 2023-02-22 at 15:21 +0100, Pierre Morel wrote:
>>>> The modification of the CPU attributes are done through a monitor
>>>> command.
>>>>
>>>> It allows to move the core inside the topology tree to optimize
>>>> the cache usage in the case the host's hypervisor previously
>>>> moved the CPU.
>>>>
>>>> The same command allows to modify the CPU attributes modifiers
>>>> like polarization entitlement and the dedicated attribute to notify
>>>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>>>
>>>> With this knowledge the guest has the possibility to optimize the
>>>> usage of the vCPUs.
>>>>
>>>> The command has a feature unstable for the moment.
>>>>
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>    qapi/machine-target.json |  35 +++++++++
>>>>    include/monitor/hmp.h    |   1 +
>>>>    hw/s390x/cpu-topology.c  | 154 +++++++++++++++++++++++++++++++++++++++
>>>>    hmp-commands.hx          |  17 +++++
>>>>    4 files changed, 207 insertions(+)
>>>>
> [...]
>>>> diff --git a/hw/s390x/cpu-topology.c b/hw/s390x/cpu-topology.c
>>>> index ed5fc75381..3a7eb441a3 100644
>>>> --- a/hw/s390x/cpu-topology.c
>>>> +++ b/hw/s390x/cpu-topology.c
>>>> @@ -19,6 +19,12 @@
>>>>
> [...]
>>>> +
>>>> +void qmp_set_cpu_topology(uint16_t core,
>>>> +                         bool has_socket, uint16_t socket,
>>>> +                         bool has_book, uint16_t book,
>>>> +                         bool has_drawer, uint16_t drawer,
>>>> +                         const char *entitlement_str,
>>>> +                         bool has_dedicated, bool dedicated,
>>>> +                         Error **errp)
>>>> +{
>>>> +    bool has_entitlement = false;
>>>> +    int entitlement;
>>>> +    ERRP_GUARD();
>>>> +
>>>> +    if (!s390_has_topology()) {
>>>> +        error_setg(errp, "This machine doesn't support topology");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    entitlement = qapi_enum_parse(&CpuS390Entitlement_lookup, entitlement_str,
>>>> +                                  -1, errp);
>>>> +    if (*errp) {
>>>> +        return;
>>>> +    }
>>>> +    has_entitlement = entitlement >= 0;
>>> Doesn't this allow setting horizontal entitlement? Which shouldn't be possible,
>>> only the guest can do it.
>>
>> IMHO it does not, the polarization is set by the guest through the PTF
>> instruction, but entitlement is set by the host.
> Yes, so when the guests requests vertical polarization, all cpus have a
> (vertical) entitlement assigned and will show up as vertical in STSI.
> But now, by using the qmp command, the polarization can be reset to horizontal,
> even though the guest didn't ask for it.


Right, I will change this


Regards,

Pierre


