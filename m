Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CE9671F80
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 15:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI9Lv-0004eP-Hz; Wed, 18 Jan 2023 09:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pI9Lt-0004dr-9Z; Wed, 18 Jan 2023 09:23:45 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pI9Lr-0000jR-8R; Wed, 18 Jan 2023 09:23:45 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IDa7oI014063; Wed, 18 Jan 2023 14:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6GJQ2A6inUJb3jVI1iUgFoUZ7sWyNtzkTMaU8Z4sfF8=;
 b=LK5u3uTXYJOuYLNokAt3eRJjTmkYm0kGEZEKqHF+PmXNVIhIVNdGutKS7U4ipg0RyvE9
 bRfig77xB76Vmfne25XiwK/VwBJmdwNOAzvI74GpVho/C9RdOJN9n6UEu5Yp/BQ5N3qK
 I66EqPyvM3/puvr0a0vYsk1F/jJSvrkWEq3DFdrfB36GaKkSnjxUh68E41G0HywBRM0N
 iwAntcNqoiiq9LkIsYa5fuDWItJMW5k259OU/EKbXdLpUNYbq5R+Fyv3Q9zXBn228awz
 ToDSk2dX8PI6PLfJnqBFqPk0vlZzE68OgfDbwmh51g/NIPLWEsoYuRJR214E5pO0r6M/ og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6fp6mm2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 14:23:31 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30IBNhoE026749;
 Wed, 18 Jan 2023 14:23:31 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6fp6mm1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 14:23:31 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30IATgWk014427;
 Wed, 18 Jan 2023 14:23:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3n3m16bxe9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 14:23:28 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30IENOQS38273314
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Jan 2023 14:23:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F20820040;
 Wed, 18 Jan 2023 14:23:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A69E820049;
 Wed, 18 Jan 2023 14:23:23 +0000 (GMT)
Received: from [9.171.39.117] (unknown [9.171.39.117])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 18 Jan 2023 14:23:23 +0000 (GMT)
Message-ID: <b8d577c5-04eb-f696-6b23-8d941ace5657@linux.ibm.com>
Date: Wed, 18 Jan 2023 15:23:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com,
 clg@kaod.org
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
 <999a31e0-56f4-6d14-f264-320f51f259af@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <999a31e0-56f4-6d14-f264-320f51f259af@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4zOlDYHGg03NMbm7-F86sn00d_hRIAL-
X-Proofpoint-ORIG-GUID: VFpRroAezalVyBKsM287wqltocRW1wvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301180121
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



On 1/11/23 11:09, Thomas Huth wrote:
> On 05/01/2023 15.53, Pierre Morel wrote:
>> The modification of the CPU attributes are done through a monitor
>> commands.
> 
> s/commands/command/

thx

> 
>> It allows to move the core inside the topology tree to optimise
>> the cache usage in the case the host's hypervizor previously
> 
> s/hypervizor/hypervisor/

yes, thx

> 
>> moved the CPU.
>>
>> The same command allows to modifiy the CPU attributes modifiers
> 
> s/modifiy/modify/

thx

> 
>> like polarization entitlement and the dedicated attribute to notify
>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>
>> With this knowledge the guest has the possibility to optimize the
>> usage of the vCPUs.
> 
> Hmm, who is supposed to call this QMP command in the future? Will there 
> be a new daemon monitoring the CPU changes in the host? Or will there be 
> a libvirt addition for this? ... Seems like I still miss the big picture 
> here...
> 
>   Thomas
> 

The first idea is to provide a daemon that could get the information on 
real CPU from the host sysfs and to specify the vCPU topology according 
to the real CPU.

There could be a libvirt command for this too.

The big picture is to provide the guest OS with the real topology so 
that the guest OS can make decisions on the scheduling.

I think that a daemon is perfect I can not imagine anything else than 
the alternative:

1) Do not specify anything and let things go more or less random as 
today by setting the cores in socket,book,drawer in an incremental way.

2) specifying the exact topology

So I do not see the point to let the user or even libvirt specify a 
random topology if it is specified it must be exact.

Regards,
Pierre



-- 
Pierre Morel
IBM Lab Boeblingen

