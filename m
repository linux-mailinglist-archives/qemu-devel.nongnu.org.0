Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 250ED6F5239
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 09:50:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu6oA-0004cf-IO; Wed, 03 May 2023 03:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pu6o1-0004SA-6c; Wed, 03 May 2023 03:21:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pu6nz-00075u-Dw; Wed, 03 May 2023 03:21:40 -0400
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3437AYck008498; Wed, 3 May 2023 07:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=KicJbVmbJ8ewX6kRY7wabsR8Esn8XErVu5CUOm+ghMc=;
 b=nB+LbqPBxFAOtSyl/gVXR0zcHsoWXeqxAy/wjsxPG82IPDOOmL9NJT9IGL+65ucTuDqN
 dM/UwGgb07jfTDzRffuaamjrXP9vr23yX0iIKEeLBzscP7cTQWcNVlYU+vcYFkXMr8DS
 VJM613FQ2zIOWal2ekaBY0KGnJD9dJVyatssiSrv7nPw9kH+RIA9chK5Z8yfkyGu/GRI
 aWTzaxpaqqzHPr1jC+B5+irhMB6qmyDrat/0ZmXsnRyZFWdNygOAKIO8CRMPndRBeLnD
 snsnLVZxEEH+NRd3E8B4nqSGzeQlsGVNti5CNkHASBc24izDaqkNRtXUtUSOqPMrqQca sA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbhjbaba2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 07:21:28 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3437KOpK025105;
 Wed, 3 May 2023 07:21:27 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qbhjbab9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 07:21:27 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3434TIoq014099;
 Wed, 3 May 2023 07:21:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3q8tv6speg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 May 2023 07:21:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com
 [10.20.54.102])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3437LJY860555632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 May 2023 07:21:19 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E70B20040;
 Wed,  3 May 2023 07:21:19 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E694220043;
 Wed,  3 May 2023 07:21:18 +0000 (GMT)
Received: from [9.152.222.242] (unknown [9.152.222.242])
 by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  3 May 2023 07:21:18 +0000 (GMT)
Message-ID: <76ae6b1c-9195-b63a-ba90-6a0ce3718990@linux.ibm.com>
Date: Wed, 3 May 2023 09:21:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v20 02/21] s390x/cpu topology: add topology entries on CPU
 hotplug
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com
References: <20230425161456.21031-1-pmorel@linux.ibm.com>
 <20230425161456.21031-3-pmorel@linux.ibm.com>
 <7940b2d6-8b72-18e8-83a6-de3f122e416e@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <7940b2d6-8b72-18e8-83a6-de3f122e416e@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PyWMHuKIsbQvyunKGywJYTFsdksYiFSY
X-Proofpoint-GUID: dktC1ih92ocnmchZYJs5S00A5hjNmbYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-03_04,2023-04-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 adultscore=0 mlxlogscore=929 suspectscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305030057
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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


On 5/2/23 14:30, Cédric Le Goater wrote:
> On 4/25/23 18:14, Pierre Morel wrote:
>> The topology information are attributes of the CPU and are
>> specified during the CPU device creation.
>>
>>
[...]
>> +
>> +/**
>> + * s390_topology_init:
>> + * @ms: the machine state where the machine topology is defined
>> + *
>> + * Keep track of the machine topology.
>> + *
>> + * Allocate an array to keep the count of cores per socket.
>> + * The index of the array starts at socket 0 from book 0 and
>> + * drawer 0 up to the maximum allowed by the machine topology.
>> + */
>> +static void s390_topology_init(MachineState *ms)
>> +{
>> +    CpuTopology *smp = &ms->smp;
>> +
>> +    s390_topology.smp = smp;
>
> I am not sure the 'smp' shortcut is necessary. 'MachineState *ms' is
> always available where 'CpuTopology *smp' is used. so it could be
> computed from a local variable AFAICT. It would reduce the risk of
> 'smp' being NULL in some (future) code path.
>
> Thanks,
>
> C.


So I will use directly current_machine->smp

You are right it is more homogeneous, there is no need to keep a pointer 
here.

Thanks

Pierre


[...]


