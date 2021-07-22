Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB93D1F55
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 09:52:59 +0200 (CEST)
Received: from localhost ([::1]:36474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6TVq-0008EF-VB
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 03:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6TUz-0007Ye-VQ
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:52:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6TUx-0008MU-OB
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 03:52:05 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16M7XW8T075124; Thu, 22 Jul 2021 03:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=lVqLDTK6Doi3GcZHgGu2xWLFbFifTfKjlMJEHFuQ4uE=;
 b=fm8ydXPQnRzgBSVaD6Kb2tCHodHlqG7J4Cz+PkWE4zhfqami3R7P9yG09n12v+0q0dhr
 w0X7i+sDb5NJG6VQ9m9MKU8ZAiliuLY/aNXpVa1eUq1yVswFe6YbrqVp4c5bzaTLcxOx
 d9NJNj4c0hfSTgtc781X6Q6RhnxcO8Hd41hpYLGRg8v28VqHLwInQDqyTjUffeARm8nB
 eP/MtEMNhY8aMUBWgA+qPb8jvmfiqkBBNXatDuBlfsGjATd9RcpcEOT3hmAsj6S3BIsr
 2/+J5K4Tfz9gBqcH6xux4VRpntv/Fv9JazHlgo27/m7+ar7KDvfewdsK7/FcJeGbMC6I 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y4ca8edp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 03:51:44 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16M7XpV9075978;
 Thu, 22 Jul 2021 03:51:44 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39y4ca8ed4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 03:51:44 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16M7hhGa010284;
 Thu, 22 Jul 2021 07:51:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 39upfh9dm6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 07:51:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16M7nEad24183076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 07:49:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 362CA11C05B;
 Thu, 22 Jul 2021 07:51:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A51811C05C;
 Thu, 22 Jul 2021 07:51:38 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.18.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 07:51:38 +0000 (GMT)
Subject: Re: [PATCH for-6.2 v2 00/11] machine: smp parsing fixes and
 improvement
To: "wangyanan (Y)" <wangyanan55@huawei.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
References: <20210719032043.25416-1-wangyanan55@huawei.com>
 <875yx69r7h.fsf@redhat.com> <a8dbec45-6d87-70ee-1b58-0592145e8160@huawei.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <c9fc3a9b-e34e-a6a8-86cc-5e12b84b46b3@linux.ibm.com>
Date: Thu, 22 Jul 2021 09:51:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <a8dbec45-6d87-70ee-1b58-0592145e8160@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yZITXRkPp-A8WMjjp-jGnyQEqb-fwu1-
X-Proofpoint-GUID: _IfXRV-rJ8z3S1VvBMs6EokTlqb1FDDh
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_03:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220047
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 7/21/21 2:38 PM, wangyanan (Y) wrote:
> On 2021/7/20 0:57, Cornelia Huck wrote:
>> On Mon, Jul 19 2021, Yanan Wang <wangyanan55@huawei.com> wrote:
>>
>>> Hi,
>>>
>>> This is v2 of the series [1] that I have posted to introduce some smp 
>>> parsing
>>> fixes and improvement, much more work has been processed compared to 
>>> RFC v1.
>>>
>>> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-07/msg00259.html
>>>
>>> The purpose of this series is to improve/fix the parsing logic. 
>>> Explicitly
>>> specifying a CPU topology parameter as zero is not allowed any more, and
>>> maxcpus is now uniformly used to calculate the omitted parameters. 
>>> It's also
>>> suggested that we should start to prefer cores over sockets over 
>>> threads on
>>> the newer machine types, which will make the computed virtual 
>>> topology more
>>> reflective of the real hardware.
>>>
>>> In order to reduce code duplication and ease the code maintenance, 
>>> smp_parse
>>> in now converted into a parser generic enough for all arches, so that 
>>> the PC
>>> specific one can be removed. It's also convenient to introduce more 
>>> topology
>>> members (e.g. cluster) to the generic parser in the future.
>> Cc:ing Pierre, as he also had been looking at the smp parsing code (for
>> s390x) recently.
>>
>> Also, please keep me on cc: for patches that touch s390x.
> Sure, I will. Sorry about the missing. :)
> 
> Thanks,
> Yanan
> .
And me too please.
Thanks
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

