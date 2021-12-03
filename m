Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BFB467700
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:04:55 +0100 (CET)
Received: from localhost ([::1]:42184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7J8-0002A9-3O
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:04:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt7Hm-0001G9-88; Fri, 03 Dec 2021 07:03:31 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt7Hj-0002f8-Rr; Fri, 03 Dec 2021 07:03:29 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3AkFX7025732; 
 Fri, 3 Dec 2021 12:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UfCt2s4miISBgNrkalAuARCN9sKTDTJXbySmtS2B8aU=;
 b=P9hyDAskXC5d+9vmKpTfdIlhOV/IJjHKvlRm5yrsbXAVmU/75eEVxHEJiGNE+aKyoUL2
 GYDOCnl6Z5I2kRrlhDFKmpAQEpuKJb3FsPnu4cvjRI4FQ9Bv40qb0DLjTNG7e9rZ9DXq
 7Mh4yG0jauV9ow82wNBBii0iSR5wmukqPXZLiMNZXbWCz/yn1RzwCjc20SIVdSQFlrEq
 Q/yLNozz2PTCLRevRl4yCZZF6DPmA/YJg+7hjx6Rs4a6E+9IOPRp5Kck1Qmo9ib/k1Sq
 mutGhOcyC/7MepgC311Uqas6ia25E1qo+GBL7ZC02Z1Up8loLcxBjVIh2/JkeZxC5v7m cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqhsdhb29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:03:24 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3C1dLF028938;
 Fri, 3 Dec 2021 12:03:24 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqhsdhb1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:03:24 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3Bxo4U028960;
 Fri, 3 Dec 2021 12:03:23 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 3ckcad2ynk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 12:03:23 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3C3Mr555640550
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 12:03:22 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F607806D;
 Fri,  3 Dec 2021 12:03:22 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FF1978068;
 Fri,  3 Dec 2021 12:03:21 +0000 (GMT)
Received: from [9.211.96.25] (unknown [9.211.96.25])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 12:03:20 +0000 (GMT)
Message-ID: <d1ae73fb-014d-3384-80ad-fa88218be541@linux.ibm.com>
Date: Fri, 3 Dec 2021 07:03:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] s390x/pci: add supported DT information to clp
 response
Content-Language: en-US
To: Pierre Morel <pmorel@linux.ibm.com>, thuth@redhat.com,
 qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
 <20211202164110.326947-5-mjrosato@linux.ibm.com>
 <b483e71b-1b53-248b-cad4-ad267c8bfdcd@linux.ibm.com>
From: Matthew Rosato <mjrosato@linux.ibm.com>
In-Reply-To: <b483e71b-1b53-248b-cad4-ad267c8bfdcd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yN1TdBlUZvLYHXIwoUZf9A0AqKGK_mR8
X-Proofpoint-ORIG-GUID: gwLe8gShMwBJo1uWpewz7ZLzRydf2hM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_06,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030076
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.938,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: farman@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/21 4:33 AM, Pierre Morel wrote:
> 
> 
> On 12/2/21 17:41, Matthew Rosato wrote:
>> The DTSM is a mask that specifies which I/O Address Translation 
>> designation
>> types are supported.  A linux guest today does not look at this field but
> 
> Even Linux is the most used guest it is not the only one so may be not 
> mention Linux here.
> 

OK

>> could in the future; let's advertise what QEMU actually supports.
>>
>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>> ---
>>   hw/s390x/s390-pci-bus.c         | 1 +
>>   hw/s390x/s390-pci-vfio.c        | 1 +
>>   include/hw/s390x/s390-pci-bus.h | 1 +
>>   include/hw/s390x/s390-pci-clp.h | 3 ++-
>>   4 files changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
>> index 1b51a72838..01b58ebc70 100644
>> --- a/hw/s390x/s390-pci-bus.c
>> +++ b/hw/s390x/s390-pci-bus.c
>> @@ -782,6 +782,7 @@ static void s390_pci_init_default_group(void)
>>       resgrp->i = 128;
>>       resgrp->maxstbl = 128;
>>       resgrp->version = 0;
>> +    resgrp->dtsm = ZPCI_DTSM;
> 
> OK
> 
>>   }
>>   static void set_pbdev_info(S390PCIBusDevice *pbdev)
>> diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
>> index 2a153fa8c9..6f80a47e29 100644
>> --- a/hw/s390x/s390-pci-vfio.c
>> +++ b/hw/s390x/s390-pci-vfio.c
>> @@ -160,6 +160,7 @@ static void s390_pci_read_group(S390PCIBusDevice 
>> *pbdev,
>>           resgrp->i = cap->noi;
>>           resgrp->maxstbl = cap->maxstbl;
>>           resgrp->version = cap->version;
>> +        resgrp->dtsm = ZPCI_DTSM;
> 
> Is it safe for VFIO whith interpretation?
> Shouldn't we extend the capability and use the host DTSM in this case?

We will do exactly this when there is an interpretation series.

For the current intercept-based code, QEMU only supports DT 1 for 
passthrough regardless of what the host is supporting and rejects all 
else (see check in reg_ioat)



