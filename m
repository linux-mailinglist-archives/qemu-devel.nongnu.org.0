Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9029A41D562
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:27:44 +0200 (CEST)
Received: from localhost ([::1]:43184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrPr-0000eK-LU
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mVrOf-0008JW-Cw; Thu, 30 Sep 2021 04:26:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mVrOd-00040z-FJ; Thu, 30 Sep 2021 04:26:29 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18U8LXZE006744; 
 Thu, 30 Sep 2021 04:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=V1vrZ2TTTWP5Ohbii8GttcMfNJKQ3MpoAzO35dVWsUI=;
 b=Lj7IRfRrfXPQI+zMXtdYA7OA1srO1o45bg+CpUVSKE2LTn/UZdGVAdUKjk6WUHIVr5k2
 jjui81ndRT4Gpk1v66xTfyN/mfnXBfu+OFWop6MyMU3LOJesqnsDIpbVGMXLwXZYGw2m
 4WEZsL7lrQsrHdHq0n9TNa+FbGHNCnflsVcaEX3Dd+tRMYSE2L6/VaGHFjBK6MZO6wgL
 ivjWVOSD36zdYN8trm/pKEETwT9yvY9wod7Pp+9GlU8qmK3bFsWSIMO6Fo55TlkIo87t
 bEDdn0l7Y8J58Bb3CxHpntJP/3gElQQ0AWfgrxkei5QYlFaYdGDaBJVgOsDtSLvmL2ys 7A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bd758kujx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 04:26:22 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18U8FSgZ009490;
 Thu, 30 Sep 2021 04:26:22 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bd758kuj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 04:26:21 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18U8DFhV005096;
 Thu, 30 Sep 2021 08:26:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3b9uda8yfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Sep 2021 08:26:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18U8QEtt64356672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Sep 2021 08:26:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3360742052;
 Thu, 30 Sep 2021 08:26:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC33A42049;
 Thu, 30 Sep 2021 08:26:13 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.93.188])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 Sep 2021 08:26:13 +0000 (GMT)
Subject: Re: [PATCH v2 3/5] s390x: topology: CPU topology objects and
 structures
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-4-git-send-email-pmorel@linux.ibm.com>
 <aceb16ce-b944-b00b-0624-5b5dd41accf0@redhat.com>
 <c9193765-adae-d179-8a14-8bc88a288fe0@linux.ibm.com>
 <70fafbc6-b1f6-dfec-6e5c-9eb863cae0a0@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <6ebaf310-e067-e4de-9016-afa8b42ef5b1@linux.ibm.com>
Date: Thu, 30 Sep 2021 10:26:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <70fafbc6-b1f6-dfec-6e5c-9eb863cae0a0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V9kdRWijhqE8NgufmkRnEhQotf-TyNoK
X-Proofpoint-ORIG-GUID: jTIo8jrI2NMaJ6TPA1F82F48mIPlfWDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-30_02,2021-09-29_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109300049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.03,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/29/21 10:12 AM, Thomas Huth wrote:
> On 07/09/2021 14.45, Pierre Morel wrote:
>>
>>
>> On 9/7/21 9:32 AM, Thomas Huth wrote:
>>> On 22/07/2021 19.42, Pierre Morel wrote:
>>>> We use new objects to have a dynamic administration of the CPU 
>>>> topology.
>>>> The highier level object is the S390 book. In a first implementation
>>>
>>
>>>
>>> I didn't spot any migration related code in here ... is this already 
>>> migration-safe?
>>>
>>
>> Not sure at all.
>>
>> The topology may change at any moment and we interpret PTF, the 
>> instruction which tell us if the topology changed.
>> Obviously the topology on the target may not be the same as on the 
>> source.
>>
>> So what I propose is to disable topology change during the migration:
>> - on migration start, disable PTF interpretation and block the 
>> topology_change _report in the emulation.
>> - on migration end set back PTF interpretation and unblock the emulation
>>
>> In the case, in discussion with David on KVM, that we do not emulate 
>> PTF for hosts without the stfl(11) we can even make it simpler in QEMU 
>> by always reporting "no change" for PTF 2 in the emulation.
>>
>> Note that the Linux kernel, even if the topology can change at any 
>> moment use a polling every minute to check the topology changes, so I 
>> guess we can ignore the optimization during the migration.
>>
>> What do you think?
> 
> I don't have much clue, this topology stuff is still mostly a black box 
> to me - so there is no interrupt or something similar presented to the 
> guest when the topology changes? The guest really has to poll for 
> changes? ... that sounds like a weird design to me... if the guest polls 
> too frequently, it wastes cycles due to the polling - but if it polls 
> not often enough, it could run for a while with wrong topology information?

Yes, it is so.
There are no interrupt for topology change, no event or any other 
notification, I guess the overhead has been considered too high.

I guess that a change to the topology is done when (1) a CPU is not 
running, exists in the configuration and used to be running but then is 
being moved in the stopped state, so its environment can be safely 
migrated to another CPU for the next scheduling slice or (2) when the 
CPU is added to or removed from the configuration.

I also guess that what would be nice would be to get the information in 
the guest when it needs to get scheduling decisions.
I had a try on this but it was not done right and I must think a little 
bit more on this. Currently the Linux kernel does a poling every minute 
using PTF(2) which is speed up to 100ms in case the admin voluntary 
changes the topology.

Pierre

> 
>   Thomas
> 
> 

-- 
Pierre Morel
IBM Lab Boeblingen

