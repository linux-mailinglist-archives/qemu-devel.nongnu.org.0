Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FB15755CC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 21:23:38 +0200 (CEST)
Received: from localhost ([::1]:45058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC4Qz-0006r9-FS
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 15:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oC4PW-0005DQ-6B; Thu, 14 Jul 2022 15:22:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oC4PT-0005Ug-E0; Thu, 14 Jul 2022 15:22:05 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EJ63Wr010465;
 Thu, 14 Jul 2022 19:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MG7O88yiW2GOcl6J8Wymi5f93H9cXEeMeux3fKnqwZ0=;
 b=l6BBicIiGldGpYooJ29if9zDySsgr82970/scr6TpXkf2o9FIXMEbyRX4ehxDEvgPBur
 xIM49WhA+sYgzDfeFjVKDLYqO45kpvztvr4cOsui8AufIGEfOhSjby0EiawcwWkS35Da
 xMA5MJiCOGjeJxOP533ExDVP3GHPVTWpU/fzv3tmUYhqZivRw0kUzH745pVZjpEPV8PR
 QFjzUIKOUfW+ly5eFus2QPNrwld7Hm/ThniO5ZnEQDP0b0i2bY8D3cYQun2nXATXT44P
 bC2DF4qUPycfLSrZGomg3eFjWoABoB5V+d0r0Z7yx8MGnZRtZbFME/tDn95Scl4WDLPY uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3has0nr9hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 19:21:59 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26EJLwWX010585;
 Thu, 14 Jul 2022 19:21:58 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3has0nr9gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 19:21:58 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26EJKMZw008204;
 Thu, 14 Jul 2022 19:21:56 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3h70xhyfp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jul 2022 19:21:56 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26EJLr9016974288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 19:21:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10BA4AE04D;
 Thu, 14 Jul 2022 19:21:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9D68AE045;
 Thu, 14 Jul 2022 19:21:51 +0000 (GMT)
Received: from [9.171.80.107] (unknown [9.171.80.107])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 14 Jul 2022 19:21:51 +0000 (GMT)
Message-ID: <14a44966-474e-17f5-4e9e-01a94c02c289@linux.ibm.com>
Date: Thu, 14 Jul 2022 21:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v8 02/12] s390x/cpu_topology: CPU topology objects and
 structures
Content-Language: en-US
To: Janis Schoetterl-Glausch <scgl@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com
References: <20220620140352.39398-1-pmorel@linux.ibm.com>
 <20220620140352.39398-3-pmorel@linux.ibm.com>
 <de92ef17-3a17-df44-97aa-19e67d1d5b3d@linux.ibm.com>
 <5215ca74-e71c-73df-69c9-d2522e082706@linux.ibm.com>
 <53698be8-0eab-8dc2-2d54-df2a89e1092f@linux.ibm.com>
 <4fef46f1-f43f-665f-47dc-89107385572e@linux.ibm.com>
 <0a4ab4e8-e628-0865-0198-384b4fcc88de@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <0a4ab4e8-e628-0865-0198-384b4fcc88de@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lXhazBK6dldPjYMzqEOObmgaJdL3x51s
X-Proofpoint-GUID: xpcLAIX0w7LAsWmNY6QIdPcEH_BM-sd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_17,2022-07-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140083
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/14/22 14:50, Janis Schoetterl-Glausch wrote:
> On 7/14/22 13:25, Pierre Morel wrote:
> 
> [...]
> 
>>
>> That is sure.
>> I thought about put a fatal error report during the initialization in the s390_topology_setup()
>>
>>> And you can set thread > 1 today, so we'd need to handle that. (increase the number of cpus instead and print a warning?)
>>>
>>> [...]
>>
>> this would introduce arch dependencies in the hw/core/
>> I think that the error report for Z is enough.
>>
>> So once we support Multithreading in the guest we can adjust it easier without involving the common code.
>>
>> Or we can introduce a thread_supported in SMPCompatProps, which would be good.
>> I would prefer to propose this outside of the series and suppress the fatal error once it is adopted.
>>
> 
> Yeah, could be a separate series, but then the question remains what you in this one, that is
> if you change the code so it would be correct if multithreading were supported.

I would like to first not support multi-thread and do a fatal error if 
threads are defined or implicitly defined as different of 1.

I prefer to keep multithreading for later, I did not have a look at all 
the implications for the moment.

>>>
>>>>>> +
>>>>>> +/*
>>>>>> + * Setting the first topology: 1 book, 1 socket
>>>>>> + * This is enough for 64 cores if the topology is flat (single socket)
>>>>>> + */
>>>>>> +void s390_topology_setup(MachineState *ms)
>>>>>> +{
>>>>>> +    DeviceState *dev;
>>>>>> +
>>>>>> +    /* Create BOOK bridge device */
>>>>>> +    dev = qdev_new(TYPE_S390_TOPOLOGY_BOOK);
>>>>>> +    object_property_add_child(qdev_get_machine(),
>>>>>> +                              TYPE_S390_TOPOLOGY_BOOK, OBJECT(dev));
>>>>>
>>>>> Why add it to the machine instead of directly using a static?
>>>>
>>>> For my opinion it is a characteristic of the machine.
>>>>
>>>>> So it's visible to the user via info qtree or something?
>>>>
>>>> It is already visible to the user on info qtree.
>>>>
>>>>> Would that even be the appropriate location to show that?
>>>>
>>>> That is a very good question and I really appreciate if we discuss on the design before diving into details.
>>>>
>>>> The idea is to have the architecture details being on qtree as object so we can plug new drawers/books/socket/cores and in the future when the infrastructure allows it unplug them.
>>>
>>> Would it not be more accurate to say that we plug in new cpus only?
>>> Since you need to specify the topology up front with -smp and it cannot change after.
>>
>> smp specify the maximum we can have.
>> I thought we can add dynamically elements inside this maximum set.
>>
>>> So that all is static, books/sockets might be completely unpopulated, but they still exist in a way.
>>> As far as I understand, STSI only allows for cpus to change, nothing above it.
>>
>> I thought we want to plug new books or drawers but I may be wrong.
> 
> So you want to be able to plug in, for example, a socket without any cpus in it?
> I'm not seeing anything in the description of STSI that forbids having empty containers
> or containers with a cpu entry without any cpus. But I don't know why that would be useful.
> And if you don't want empty containers, then the container will just show up when plugging in the cpu.

You already convinced me, it is a non sense and, anyway, building every 
container when a cpu is added is how it works with the current 
implementation.


-- 
Pierre Morel
IBM Lab Boeblingen

