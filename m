Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F56399F9
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 11:51:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozFFj-0005Qa-A7; Sun, 27 Nov 2022 05:51:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ozFFe-0005Oj-1q; Sun, 27 Nov 2022 05:51:10 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1ozFFb-0004CY-9H; Sun, 27 Nov 2022 05:51:08 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AR6WHXN025681; Sun, 27 Nov 2022 10:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=w9IIrYH3RxiWV3AeGphmBZdyDjeY4EK3twKzorL6qK0=;
 b=Ik6CW8IZ1V0qNo8S4Omb2BG8mDxwc2JiLXHg/WvUAnhEWw0ua+u40LOtaQSTKi8qC1BG
 2bXxuJghThy+zOvghKOeRLFGNGLmaBJgPqrLsCd+rQmvpgDjCPdss+1qbYiD31M68B0R
 IIkQqpN42gMQWSHfwy0K45WZ9CmgaIbJIjqiTauLGeyLz8YJEXIAvyu4YijvEOeZoAoC
 3SapCyEKT3nxrAAUvwDH8Qn4IUP/fW44hPTcm8m7zVIigxcdEXeFGkatPcr01T4ROvkZ
 3JkMc3QXsRMBoVn67HwJ89iWgCKvCwNCTbR5A2UWeoxQmclnI4Q+7T9TjrJHy9Xjesnd yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vcr80a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Nov 2022 10:51:05 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ARAp4Rx023795;
 Sun, 27 Nov 2022 10:51:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vcr809h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Nov 2022 10:51:04 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ARAoNSX016354;
 Sun, 27 Nov 2022 10:51:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hs7p4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 27 Nov 2022 10:51:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2ARApfd91245826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 27 Nov 2022 10:51:41 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A3094C044;
 Sun, 27 Nov 2022 10:50:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D9344C040;
 Sun, 27 Nov 2022 10:50:58 +0000 (GMT)
Received: from [9.171.55.247] (unknown [9.171.55.247])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 27 Nov 2022 10:50:58 +0000 (GMT)
Message-ID: <bb9f8b8e-6acc-845a-e7a8-ba532644f83a@linux.ibm.com>
Date: Sun, 27 Nov 2022 11:50:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v9 00/10] s390x: CPU Topology
Content-Language: en-US
From: Pierre Morel <pmorel@linux.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, pasic@linux.ibm.com, richard.henderson@linaro.org, 
 david@redhat.com, thuth@redhat.com, cohuck@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, kvm@vger.kernel.org, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 seiden@linux.ibm.com, nrb@linux.ibm.com, frankja@linux.ibm.com,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>
References: <20220902075531.188916-1-pmorel@linux.ibm.com>
 <a2ddbba2-9e52-8ed8-fdbc-a587b8286576@de.ibm.com>
 <1fe0b036-19e7-a8a4-63aa-9bbcaed48187@linux.ibm.com>
 <9e8d4c74-7405-5e1f-6c95-3c0c99c43eb9@linux.ibm.com>
 <ccb73052-43e5-e072-b201-e983df876e6a@linux.ibm.com>
In-Reply-To: <ccb73052-43e5-e072-b201-e983df876e6a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2tqucUzsuLom9z_I6iKGj13VGcvDc4HE
X-Proofpoint-ORIG-GUID: Kj33jca8ET0Crakx_epjr3sLcFcouG9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211270087
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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



On 11/24/22 10:25, Pierre Morel wrote:
> 
> Gentle ping.
> 
> Did I understand the problem or am I wrong?
> 

I guess I was wrong, so I send a new series next week.

Regards,
Pierre

> 
> On 11/17/22 17:38, Pierre Morel wrote:
>>
>>
>> On 11/17/22 10:31, Pierre Morel wrote:
>>>
>>>
>>> On 11/16/22 17:51, Christian Borntraeger wrote:
>>>> Am 02.09.22 um 09:55 schrieb Pierre Morel:
>>>>> Hi,
>>>>>
>>>>> The implementation of the CPU Topology in QEMU has been drastically
>>>>> modified since the last patch series and the number of LOCs has been
>>>>> greatly reduced.
>>>>>
>>>>> Unnecessary objects have been removed, only a single S390Topology 
>>>>> object
>>>>> is created to support migration and reset.
>>>>>
>>>>> Also a documentation has been added to the series.
>>>>>
>>>>>
>>>>> To use these patches, you will need Linux V6-rc1 or newer.
>>>>>
>>>>> Mainline patches needed are:
>>>>>
>>>>> f5ecfee94493 2022-07-20 KVM: s390: resetting the 
>>>>> Topology-Change-Report
>>>>> 24fe0195bc19 2022-07-20 KVM: s390: guest support for topology function
>>>>> 0130337ec45b 2022-07-20 KVM: s390: Cleanup ipte lock access and 
>>>>> SIIF fac..
>>>>>
>>>>> Currently this code is for KVM only, I have no idea if it is 
>>>>> interesting
>>>>> to provide a TCG patch. If ever it will be done in another series.
>>>>>
>>>>> To have a better understanding of the S390x CPU Topology and its
>>>>> implementation in QEMU you can have a look at the documentation in the
>>>>> last patch.
>>>>>
>>>>> New in this series
>>>>> ==================
>>>>>
>>>>>    s390x/cpus: Make absence of multithreading clear
>>>>>
>>>>> This patch makes clear that CPU-multithreading is not supported in
>>>>> the guest.
>>>>>
>>>>>    s390x/cpu topology: core_id sets s390x CPU topology
>>>>>
>>>>> This patch uses the core_id to build the container topology
>>>>> and the placement of the CPU inside the container.
>>>>>
>>>>>    s390x/cpu topology: reporting the CPU topology to the guest
>>>>>
>>>>> This patch is based on the fact that the CPU type for guests
>>>>> is always IFL, CPUs are always dedicated and the polarity is
>>>>> always horizontal.
>>>>> This may change in the future.
>>>>>
>>>>>    hw/core: introducing drawer and books for s390x
>>>>>    s390x/cpu: reporting drawers and books topology to the guest
>>>>>
>>>>> These two patches extend the topology handling to add two
>>>>> new containers levels above sockets: books and drawers.
>>>>>
>>>>> The subject of the last patches is clear enough (I hope).
>>>>>
>>>>> Regards,
>>>>> Pierre
>>>>>
>>>>> Pierre Morel (10):
>>>>>    s390x/cpus: Make absence of multithreading clear
>>>>>    s390x/cpu topology: core_id sets s390x CPU topology
>>>>>    s390x/cpu topology: reporting the CPU topology to the guest
>>>>>    hw/core: introducing drawer and books for s390x
>>>>>    s390x/cpu: reporting drawers and books topology to the guest
>>>>>    s390x/cpu_topology: resetting the Topology-Change-Report
>>>>>    s390x/cpu_topology: CPU topology migration
>>>>>    target/s390x: interception of PTF instruction
>>>>>    s390x/cpu_topology: activating CPU topology
>>>>
>>>>
>>>> Do we really need a machine property? As far as I can see, old QEMU
>>>> cannot  activate the ctop facility with old and new kernel unless it
>>>> enables CAP_S390_CPU_TOPOLOGY. I do get
>>>> oldqemu .... -cpu z14,ctop=on
>>>> qemu-system-s390x: Some features requested in the CPU model are not 
>>>> available in the configuration: ctop
>>>>
>>>> With the newer QEMU we can. So maybe we can simply have a topology (and
>>>> then a cpu model feature) in new QEMUs and non in old. the cpu model
>>>> would then also fence migration from enabled to disabled.
>>>
>>> OK, I can check this.
>>> In this case migration with topology will be if I understand correctly:
>>>
>>> NEW_QEMU/old_machine <-> NEW_QEMU/old_machine OK
>>> While
>>> OLD_QEMU/old_machine <-> NEW_QEMU/old_machine KO
>>> NEW_QEMU/old_machine <-> OLD_QEMU/old_machine KO
>>
>> I forgot to say that I mean in the examples above without using a flag.
>>
>> Of course using a flag like -ctop=off in NEW_QEMU/new_machine allows
>> to migrate from and to old_machines in an old QEMU.
>>
>> Also I had the same behavior already in V9 by having a VMState without 
>> the creation of a machine property, a new cpu feature and a new cpu flag.
>>
>>
>>
>>
>>
>>
>>>
>>> Is this something we can accept?
>>>
>>> regards,
>>> Pierre
>>>
>>
> 

-- 
Pierre Morel
IBM Lab Boeblingen

