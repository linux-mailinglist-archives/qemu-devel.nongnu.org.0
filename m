Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CE16198A9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 15:00:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqxDr-0003PI-70; Fri, 04 Nov 2022 09:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oqxDp-0003Oy-HG; Fri, 04 Nov 2022 09:59:01 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1oqxDm-0006DK-GS; Fri, 04 Nov 2022 09:59:01 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4C8iXd007843;
 Fri, 4 Nov 2022 13:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=oxqzXZJNZZUrJ6Gen6mCqqKLdtXAv9PEgVaayua/+qU=;
 b=Z6F3Xi2aB6HcF+OTFIO4J0ERDeJsexLv6vkGjIdY4g4JcIIM9bByxhtrkRtYc1ie1vpA
 UwOhRqRG1Q/9QSHai0D05q87kAUBaz1cjdXFbJqLFme/Xoc0Mj9vENQwTDFCObcKWq4G
 G1TZ4DGGMHAGjtM5AJz+e2WBNXCgtGUEmOpSaNvxImLJjWFToaUVC6FPkwiHur8L1Wyc
 bIlqyB+FlIvR4l/X+ntpBYmlVkdECrCx6sdGMosHbMq8cOV1ohkWY+swnN/yQEOashAU
 HQNObGPnJdJk9OpnKLjdS42O97Vx2uemDpxjYwqpJ7lGaQY9/09Hfv1jypOdsnj58HDX pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmq07ynqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 13:58:49 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4CAQPr006216;
 Fri, 4 Nov 2022 13:58:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmq07ynpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 13:58:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4Dq5Zf010636;
 Fri, 4 Nov 2022 13:58:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3kgut92gdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 13:58:46 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A4Dr9DR38076862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 13:53:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C33C0AE045;
 Fri,  4 Nov 2022 13:58:43 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF908AE04D;
 Fri,  4 Nov 2022 13:58:42 +0000 (GMT)
Received: from [9.171.69.218] (unknown [9.171.69.218])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Nov 2022 13:58:42 +0000 (GMT)
Message-ID: <15af77a0-adba-9801-c9ef-db110233197d@linux.ibm.com>
Date: Fri, 4 Nov 2022 14:58:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v11 01/11] s390x: Register TYPE_S390_CCW_MACHINE
 properties as class properties
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, cohuck@redhat.com,
 mst@redhat.com, pbonzini@redhat.com, kvm@vger.kernel.org,
 ehabkost@redhat.com, marcel.apfelbaum@gmail.com, eblake@redhat.com,
 armbru@redhat.com, seiden@linux.ibm.com, nrb@linux.ibm.com,
 scgl@linux.ibm.com, frankja@linux.ibm.com, berrange@redhat.com
References: <20221103170150.20789-1-pmorel@linux.ibm.com>
 <20221103170150.20789-2-pmorel@linux.ibm.com>
 <3f913a58-e7d0-539e-3bc0-6cbd5608db8e@redhat.com>
 <7d809617-67e0-d233-97b2-8534e2a4610f@linux.ibm.com>
 <6415cf08-e6a1-c72a-1c56-907d3a446a8c@kaod.org>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <6415cf08-e6a1-c72a-1c56-907d3a446a8c@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6IZN23bgQYLA5X6fYCu14iKrRa7ao3Tl
X-Proofpoint-ORIG-GUID: D5mrQGLF8qIyXIi7GO6zitXJS-N83vsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040089
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/4/22 11:53, Cédric Le Goater wrote:
> On 11/4/22 11:16, Pierre Morel wrote:
>>
>>
>> On 11/4/22 07:32, Thomas Huth wrote:
>>> On 03/11/2022 18.01, Pierre Morel wrote:
>>>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>>>> ---
>>>>   hw/s390x/s390-virtio-ccw.c | 127 
>>>> +++++++++++++++++++++----------------
>>>>   1 file changed, 72 insertions(+), 55 deletions(-)
>>>
>>> -EMISSINGPATCHDESCRIPTION
>>>
>>> ... please add some words *why* this is a good idea / necessary.
>>
>> I saw that the i386 patch had no description for the same patch so...
>>
>> To be honest I do not know why it is necessary.
>> The only reason I see is to be in sync with the PC implementation.
>>
>> So what about:
>> "
>> Register TYPE_S390_CCW_MACHINE properties as class properties
>> to be conform with the X architectures
>> "
>> ?
>>
>> @Cédric , any official recommendation for doing that?
> 
> There was a bunch of commits related to QOM in this series :
> 
>    91def7b83 arm/virt: Register most properties as class properties
>    f5730c69f0 i386: Register feature bit properties as class properties
> 
> which moved property definitions at the class level.
> 
> Then,
> 
>    commit d8fb7d0969 ("vl: switch -M parsing to keyval")
> 
> changed machine_help_func() to use a machine class and not machine
> instance anymore.
> 
> I would use the same kind of commit log and add a Fixes tag to get it
> merged in 7.2
> 
> With that,
> 
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Thanks,
> 
> C.
> 
> 

OK,
Thanks,

Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

