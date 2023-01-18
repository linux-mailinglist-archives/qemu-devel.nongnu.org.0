Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87414672249
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 17:00:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIAqe-0006Tp-KI; Wed, 18 Jan 2023 10:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIAqa-0006S6-DU; Wed, 18 Jan 2023 10:59:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1pIAqY-0000gM-Sx; Wed, 18 Jan 2023 10:59:32 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30IFVRap026657; Wed, 18 Jan 2023 15:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Mgq/e1oJj8BQ1YPwC+oAOG+izgrUrBtQvmYoPRWcsfQ=;
 b=nheZmhYPS04ZGvb0p7oQSK+vsId2fP8sQRJeRKemYI+0IwfAjgthcL36n5UPDckD4W0h
 XWiHyQez7d7KzkFyOHwwfC2oMc+3fw2qEsAWytG0iJIaSBtyB9wKhdJ+2uu4xHxJbPap
 OpedeWB40B7Uo4D3y8ixyoBBOImAz09Kw4FhG/zzcq8mAaikksL5O3kY88PmDVG+cko+
 JMVuLWqoUKr28zCEmfNZQyrMeukb2/YQKFgOXkxRUXzkmfIPM0T8NQS+t2J+V5CML5xI
 15qDQ0lvQ5i8dR3YjBRbrfEGmJZJHyZi7gIuhbUEF5puhYsHAJDGB+hw07Fu1Rmnw3Cm DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6f91ygs9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 15:59:27 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30IFbhNj004033;
 Wed, 18 Jan 2023 15:59:27 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n6f91ygra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 15:59:27 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30ICC7nl006282;
 Wed, 18 Jan 2023 15:59:25 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfngtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Jan 2023 15:59:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30IFxLON44958152
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Jan 2023 15:59:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6259120043;
 Wed, 18 Jan 2023 15:59:21 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 138EB2004B;
 Wed, 18 Jan 2023 15:59:20 +0000 (GMT)
Received: from [9.179.13.15] (unknown [9.179.13.15])
 by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 18 Jan 2023 15:59:19 +0000 (GMT)
Message-ID: <2c1681b2-05ef-6245-38ea-d2c363eb432e@linux.ibm.com>
Date: Wed, 18 Jan 2023 16:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v14 09/11] qapi/s390/cpu topology: monitor query topology
 information
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
 <20230105145313.168489-10-pmorel@linux.ibm.com>
 <114b34b1-303b-154b-6ac1-91e1718de49b@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <114b34b1-303b-154b-6ac1-91e1718de49b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w2rwQ_x6G8Rb0f2y6_zdNIdcli0SYTDG
X-Proofpoint-ORIG-GUID: 6-UShI331C0jbb3f9k1oLrDRMO5k0FTw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
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



On 1/12/23 12:48, Thomas Huth wrote:
> On 05/01/2023 15.53, Pierre Morel wrote:
>> Reporting the current topology informations to the admin through
>> the QEMU monitor.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
> ...
>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>> index 754b1e8408..5730a47f71 100644
>> --- a/hmp-commands-info.hx
>> +++ b/hmp-commands-info.hx
>> @@ -993,3 +993,19 @@ SRST
>>     ``info virtio-queue-element`` *path* *queue* [*index*]
>>       Display element of a given virtio queue
>>   ERST
>> +
>> +#if defined(TARGET_S390X) && defined(CONFIG_KVM)
>> +    {
>> +        .name       = "query-topology",
>> +        .args_type  = "",
>> +        .params     = "",
>> +        .help       = "Show information about CPU topology",
>> +        .cmd        = hmp_query_topology,
>> +        .flags      = "p",
>> +    },
>> +
>> +SRST
>> +  ``info query-topology``
> 
> "info query-topology" sounds weird ... I'd maybe rather call it only 
> "info topology" or "info cpu-topology" here.

info cpu-topology looks good for me.

thanks.

Regards,
Pierre

> 
>   Thomas
> 
> 
>> +    Show information about CPU topology
>> +ERST
>> +#endif
> 

-- 
Pierre Morel
IBM Lab Boeblingen

