Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C665B6EE109
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 13:25:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prGmk-0005Vo-1U; Tue, 25 Apr 2023 07:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1prGmh-0005VT-Ga; Tue, 25 Apr 2023 07:24:35 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1prGme-0001oU-8u; Tue, 25 Apr 2023 07:24:34 -0400
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33PBKXV0003092; Tue, 25 Apr 2023 11:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wzuLf2csHVajN3WMaE+ur2Cf1ruDWNXEWDmGrEvcqeI=;
 b=CtEZHrf5W8UtM2RDbODhwlkkmzS6s1EgQP9kMY1llscu6uW7u8Fkw8QAmJZEwfP42brK
 IvYFC39ylM8OPeHaTf8sfRpBaFz73IXPh8W1SdZR0ygbmk4QzHAb8ycgFgIY3iYd5LTX
 7+AualEXZMDaYypjrcF8PUjcQTd33ZcNMqsxaJ68LlxpsZ2ajlhRimaebGjphK4WTtnN
 U1acv6+qYTH/6j6Aratne2VmjdfGjk1ylPGJ3txMDPX23XrIx1wmc8StT9h/aEDXckQR
 21zTTSucVb9HTH6JYMAc0T3apvUHkltdw+IDSKy7wCOCbjywX/oJK/d0YoinjlHH5fkW JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6dwer46u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 11:24:20 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33PBLMSj005905;
 Tue, 25 Apr 2023 11:24:20 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q6dwer45d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 11:24:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33P1QQ4S017384;
 Tue, 25 Apr 2023 11:24:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3q46ug1pwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Apr 2023 11:24:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33PBO9ZW11207300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Apr 2023 11:24:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 999CC20040;
 Tue, 25 Apr 2023 11:24:09 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1942E20043;
 Tue, 25 Apr 2023 11:24:09 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Tue, 25 Apr 2023 11:24:09 +0000 (GMT)
Message-ID: <cc9aa844-3782-8c2b-af9d-eebee47cf992@linux.ibm.com>
Date: Tue, 25 Apr 2023 13:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v19 02/21] s390x/cpu topology: add topology entries on CPU
 hotplug
Content-Language: en-US
To: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org
References: <20230403162905.17703-1-pmorel@linux.ibm.com>
 <20230403162905.17703-3-pmorel@linux.ibm.com>
 <66d9ba0e9904f035326aca609a767976b94547cf.camel@linux.ibm.com>
 <4ddd3177-58a8-c9f0-a9a8-ee71baf0511b@linux.ibm.com>
 <60aafc95dd0293ba8d5b4dbdc59fcda5e6c64f3e.camel@linux.ibm.com>
 <9c2cb730-d307-f344-35e8-82017681816a@linux.ibm.com>
 <92a76767620a8e4bb12b7164b271d7172545cd0b.camel@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <92a76767620a8e4bb12b7164b271d7172545cd0b.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uJp470MDt8G7bladvd73Mca5NN4RZtzW
X-Proofpoint-ORIG-GUID: -lK8DyiDfVMQiqFSSqreZLerxGIwIUV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_04,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxlogscore=999 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250099
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


On 4/25/23 11:27, Nina Schoetterl-Glausch wrote:
> On Tue, 2023-04-25 at 10:45 +0200, Pierre Morel wrote:
>> On 4/24/23 17:32, Nina Schoetterl-Glausch wrote:
>>> On Fri, 2023-04-21 at 12:20 +0200, Pierre Morel wrote:
>>>>> On 4/20/23 10:59, Nina Schoetterl-Glausch wrote:
>>>>>>> On Mon, 2023-04-03 at 18:28 +0200, Pierre Morel wrote:
[..]
>>>    #endif
>>>        DEFINE_PROP_END_OF_LIST()
>>>    };
>>>
>>> There are other ways to achieve the same, you could also
>>> implement get, set and set_default_value so that there is an additional
>>> "auto"/"uninitialized" value that is not in the enum.
>>> If you insist on having an additional state in the enum, name it "auto".
>> Yes, I think it is a better name.
> IMO using entitlement=auto doesn't make too much sense with the set-cpu-topology command,
> because you can just leave if off or specify the entitlement you want directly.
> So there is no actual need to have a user visible auto value and no need to have it in the enum.


This value is only usable but not required on input and is never 
displayed by the qapi.


> Then the only problem is adjusting the entitlement when doing dedicated=on on the command line.
> (If you want that)

Even the exact usage of dedication depends on the administration entity 
it will give the guest the
knowledge of something like: "A real CPU is dedicated to this vCPU".

The people using the qapi interface or using QEMU hotplug can easily 
understand
the concept without going deeper with entitlement which once implemented 
will be,
quite more complex to deal with.


> So with my proposal there are only the low, medium and high values in the enum.
> In order to set the entitlement automatically when using the command line I initialize
> the entitlement to -1, so we later know if it has been set via the command line or not.
> But you cannot set -1 via the property because qdev_propinfo_get_enum expects a string,
> which is why I do it in s390_cpu_initfn.
>
> I'm not sure if you can define entitlement as CpuS390Entitlement.
> I think I changed it to int when I was exploring different solutions
> and had to change it because of a type check. But what I proposed above doesn't cause the same issue.
> DEFINE_PROP_CPUS390ENTITLEMENT could then also use CpuS390Entitlement.


I did not have the problem by using CpuS390Entitlement.


>
> So there are three possible solutions now:
> 1. My proposal above, which as automatic adjustment, but only the three required values in the enum.
> 2. Don't do automatic adjustment, three enum values.
> 3. Automatic adjustment with auto value in the enum.
>
> I still favor 2. but the other ones aren't terrible.

Thank you to accept the solution 3, I understand your objections, but,
I really think that there is no need to bother the user with entitlement
while it will not get used in QEMU/KVM until the Linux scheduler is modified
for the host and for the guest to handle it.


Regards,

Pierre



