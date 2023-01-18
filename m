Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F13F672204
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 16:49:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAg3-00022w-5Q; Wed, 18 Jan 2023 10:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIAfu-000202-IH; Wed, 18 Jan 2023 10:48:30 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIAfr-0007Bl-PL; Wed, 18 Jan 2023 10:48:30 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IDrM1l026878; Wed, 18 Jan 2023 15:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=NchMlj1ckhjhtBOdPVQMHQV/zKaR+7ry2beCggPwhc4=;
 b=Ig2+KiHm3TWZM6/y/OmT1Sh1cCVAO7lT2gfBFcjysCZsla7bosi++nxHEwuoEzNe38bW
 NHaEfVHK5uuPRF4OxRGjYs+XuPoVfQn4Jd++JSi3PFLko7fsfDl1S/yb6unp4G5tPx61
 3nO/SYvKG6gknL5yBaOlCAdYuyf95IRDTkJ41SJlvihyyvxYS6T459iqsVU5t2HS/nu7
 ypZTfzgHYZU+hYksJMLPctisQCWiMqyE83N4ryzPFIRi1bHSnIjdDgvKUKX+4090RnsX
 U6eM8TF5xXz6tDWwDyE8pFCjzDN7TZrcPTk6uNHelDFLQIVNpsnv7+ROkoAgRCGtsgjv xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6j232ysv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 15:48:16 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30IErQNp009455;
 Wed, 18 Jan 2023 15:48:16 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6j232ysc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 15:48:16 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30I66Ldc006701;
 Wed, 18 Jan 2023 15:48:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n3m16m0r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 15:48:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30IFmAtR45351420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Jan 2023 15:48:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DD1620040;
 Wed, 18 Jan 2023 15:48:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D855920043;
 Wed, 18 Jan 2023 15:48:08 +0000 (GMT)
Received: from [9.179.13.15] (unknown [9.179.13.15])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 18 Jan 2023 15:48:08 +0000 (GMT)
Message-ID: <32cf9903-e1e6-ca38-a8f1-1e904d975cbe@linux.ibm.com>
Date: Wed, 18 Jan 2023 16:48:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v14 08/11] qapi/s390/cpu topology: change-topology monitor
 command
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 frankja@linux.ibm.com, berrange@redhat.com, clg@kaod.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, hreitz@redhat.com
References: <20230105145313.168489-1-pmorel@linux.ibm.com>
 <20230105145313.168489-9-pmorel@linux.ibm.com>
 <72baa5b42abe557cdf123889b33b845b405cc86c.camel@linux.ibm.com>
 <cd9e0c88-c2a8-1eca-d146-3fd6639af3e7@redhat.com>
 <5654d88fb7d000369c6cfdbe0213ca9d2bfe013b.camel@linux.ibm.com>
 <91566c93-a422-7969-1f7e-80c6f3d214f1@redhat.com>
 <Y8gNo74mLXwAxVqy@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <Y8gNo74mLXwAxVqy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vuyK-oLaDJG_pDNHBmyj1CPIpMnstyPd
X-Proofpoint-ORIG-GUID: OUesE0Iz423i756j9XK8ohWjy-_KVig_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301180130
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



On 1/18/23 16:17, Kevin Wolf wrote:
> Am 18.01.2023 um 11:53 hat Thomas Huth geschrieben:
>> On 17/01/2023 14.31, Nina Schoetterl-Glausch wrote:
>>> On Tue, 2023-01-17 at 08:30 +0100, Thomas Huth wrote:
>>>> On 16/01/2023 22.09, Nina Schoetterl-Glausch wrote:
>>>>> On Thu, 2023-01-05 at 15:53 +0100, Pierre Morel wrote:
>>>>>> The modification of the CPU attributes are done through a monitor
>>>>>> commands.
>>>>>>
>>>>>> It allows to move the core inside the topology tree to optimise
>>>>>> the cache usage in the case the host's hypervizor previously
>>>>>> moved the CPU.
>>>>>>
>>>>>> The same command allows to modifiy the CPU attributes modifiers
>>>>>> like polarization entitlement and the dedicated attribute to notify
>>>>>> the guest if the host admin modified scheduling or dedication of a vCPU.
>>>>>>
>>>>>> With this knowledge the guest has the possibility to optimize the
>>>>>> usage of the vCPUs.
>>>>>>
>>>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>>>> ---
>> ...
>>>>>> +    s390_topology.sockets[s390_socket_nb(id)]--;
>>>>>
>>>>> I suppose this function cannot run concurrently, so the same CPU doesn't get removed twice.
>>>>
>>>> QEMU has the so-called BQL - the Big Qemu Lock. Instructions handlers are
>>>> normally called with the lock taken, see qemu_mutex_lock_iothread() in
>>>> target/s390x/kvm/kvm.c.
>>>
>>> That is good to know, but is that the relevant lock here?
>>> We don't want to concurrent qmp commands. I looked at the code and it's pretty complicated.
>>
>> Not sure, but I believe that QMP commands are executed from the main
>> iothread, so I think this should be safe? ... CC:-ing some more people who
>> might know the correct answer.
> 
> In general yes, QMP commands are processed one after another in the main
> thread while holding the BQL. And I think this is the relevant case for
> you.
> 
> The exception is out-of-band commands, which I think run in the monitor
> thread while some other (normal) command could be processed. OOB
> commands are quite limited in what they are allowed to do, though, and
> there aren't many of them. They are mainly meant to fix situations where
> something (including other QMP commands) got stuck.
> 
> Kevin
> 

Thanks Kevin,

regards,
Pierre
-- 
Pierre Morel
IBM Lab Boeblingen

