Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D9A2DFA25
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 09:51:30 +0100 (CET)
Received: from localhost ([::1]:51200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krGud-0003RS-HB
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 03:51:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1krGtp-00031k-Ke; Mon, 21 Dec 2020 03:50:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1krGtn-0001dA-Md; Mon, 21 Dec 2020 03:50:37 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL8WcOA083598; Mon, 21 Dec 2020 03:50:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=a/vb/MGdYzn9sOvcsG9mVd5+YA+RZR4SmjvqtjVgYHA=;
 b=MZMwcRHnfAmygbHojP988dXtqf1eUR0DKUuk5AZzw5jsV9J8bGAxQJLUYTR3F12XPtyI
 Ha508O7HLeYDBDuDvEz9qy/YlMPuEsmYNnSj6hXAPfgpGIX3Cv3LRn/yCi7fm+c2In7o
 0odKhCUjBgWnZL3bF1GuEihdFlEfYOi+QGbS8qEqLDi/W8rcaseyFzEI6NeXIPGxPYJz
 HNKWtuY4/rJFrix6mAk7hmJn8TYB2AN7wPhP/4TOa1UaZHwFyqmZxQqCojNJNnhyvuQh
 YDDxlt9cGmdqasBakKG2tgX+p5U9Cee8Xn6EQ9JGQc8KkvutWU4UYI9pnSZOdWlYz5CL 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35jjqafw6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 03:50:30 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BL8WvCp084612;
 Mon, 21 Dec 2020 03:50:30 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35jjqafw5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 03:50:30 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL8kvIG027345;
 Mon, 21 Dec 2020 08:50:27 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 35h8sh1uhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 08:50:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BL8oOxJ50200954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 08:50:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B8E94C04E;
 Mon, 21 Dec 2020 08:50:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F0314C058;
 Mon, 21 Dec 2020 08:50:24 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.60.78])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Dec 2020 08:50:24 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] s390x/pci: Fix memory_region_access_valid call
From: Pierre Morel <pmorel@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
References: <1608243397-29428-1-git-send-email-mjrosato@linux.ibm.com>
 <1608243397-29428-3-git-send-email-mjrosato@linux.ibm.com>
 <72f4e03f-7208-6af0-4cd2-9715d9f9ec77@linux.ibm.com>
 <20201218120440.36b56e80.cohuck@redhat.com>
 <2c5a2ccb-dbe1-f355-3980-462be1d93942@linux.ibm.com>
 <20201218163206.7b8efa2a.cohuck@redhat.com>
 <52c93c12-b9a4-99ba-186c-4db2e6267b9f@linux.ibm.com>
 <20201218175119.5f43b378.cohuck@redhat.com>
 <608f9aff-965f-62ee-6034-c61f98213200@linux.ibm.com>
Message-ID: <79611b57-f88d-00d0-a13b-a9acc1100781@linux.ibm.com>
Date: Mon, 21 Dec 2020 09:50:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <608f9aff-965f-62ee-6034-c61f98213200@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxscore=0 mlxlogscore=892 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210057
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.299,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, Matthew Rosato <mjrosato@linux.ibm.com>, david@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/18/20 6:05 PM, Pierre Morel wrote:
> 
> 
> On 12/18/20 5:51 PM, Cornelia Huck wrote:
>> On Fri, 18 Dec 2020 17:40:50 +0100
>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>
>>> On 12/18/20 4:32 PM, Cornelia Huck wrote:
>>>> On Fri, 18 Dec 2020 15:32:08 +0100
>>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>>>> On 12/18/20 12:04 PM, Cornelia Huck wrote:
>>>>>> On Fri, 18 Dec 2020 10:37:38 +0100
>>>>>> Pierre Morel <pmorel@linux.ibm.com> wrote:
>>>>>>> On 12/17/20 11:16 PM, Matthew Rosato wrote:
>>>>>>>> In pcistb_service_handler, a call is made to validate that the 
>>>>>>>> memory
>>>>>>>> region can be accessed.  However, the call is made using the 
>>>>>>>> entire length
>>>>>>>> of the pcistb operation, which can be larger than the allowed 
>>>>>>>> memory
>>>>>>>> access size (8).  Since we already know that the provided buffer 
>>>>>>>> is a
>>>>>>>> multiple of 8, fix the call to memory_region_access_valid to 
>>>>>>>> iterate
>>>>>>>> over the memory region in the same way as the subsequent call to
>>>>>>>> memory_region_dispatch_write.
>>>>>>>>
>>>>>>>> Fixes: 863f6f52b7 ("s390: implement pci instructions")
>>>>>>>> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
>>>>>>>> ---

...snip...

>>>>
>>>
>>> The ops already exist, I thought adding a dedicated callback for s390 on
>>> every regions used by vfio_pci instead of the default.
>>> But it does not add a lot, just looks cleaner to me.
>>
>> But we end up here for every pci device, not just for vfio devices,
>> don't we?
>>
>>
> 
> Yes, but isn't what is done here?
> 

It was not my intention to slow the integration process.
We can start with this fix and eventually move the code to the callback 
in another series when/if we all agree.

Acked-by: Pierre Morel <pmorel@linux.ibm.com>



-- 
Pierre Morel
IBM Lab Boeblingen

