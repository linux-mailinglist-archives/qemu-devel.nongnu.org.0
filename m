Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D364E6381
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 13:43:38 +0100 (CET)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXMoT-0001zk-5s
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 08:43:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nXMm6-0001IT-SL
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 08:41:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nXMlz-00011F-1D
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 08:41:07 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22OA9f1W027713; 
 Thu, 24 Mar 2022 12:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hC8guCLXHtlvET1F6MdmvzVbdS9IHpmX5NCYiorTjrc=;
 b=QS7Ij+EmKD2FoOr+kEpVsAIiYP+reFxYpvaGJIVFHeqIvfQTyg5ulAQaKd0boVfwi50b
 kuX3/+M42//OKsIHqjheySuOs2Z+yfBYnTzSRZ9I1vCudVQya/0kodqM4LZ78irIrsAq
 3UWd8+uzSNZWdgCUAqu8rFHWf3ulVoN3XzJLZGlI/d5ecPs8riDRO2dx9GtN33U4xkv0
 YbPucKIMMHnOzo0XGsIQPM3OCmDYgI89q5IimuIG8NUaaQlAU2/gDSLbBHYpc1Zt4v/W
 Emz8d1o/a+9ZaqezRFJdRQUWwEylctHkc3tmWxmb8vrlCp2gScYqxgPclhaLYPO404QA bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0c6y6hff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 12:40:54 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22OBcSqB014987;
 Thu, 24 Mar 2022 12:40:54 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0c6y6hen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 12:40:54 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22OCbj5n014228;
 Thu, 24 Mar 2022 12:40:53 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3ew6taamqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 12:40:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22OCepAB13959548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Mar 2022 12:40:51 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFC18BE056;
 Thu, 24 Mar 2022 12:40:51 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B39B9BE05A;
 Thu, 24 Mar 2022 12:40:50 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Mar 2022 12:40:50 +0000 (GMT)
Message-ID: <7a6e50a6-8bb7-0dd1-4429-0e9217d4a547@linux.ibm.com>
Date: Thu, 24 Mar 2022 08:40:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v3 for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, alex.williamson@redhat.com
References: <20220323203119.360894-1-eric.auger@redhat.com>
 <87tubn602y.fsf@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <87tubn602y.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZtoZpHmxqB969qDjzMMyjDboYrpDNsoJ
X-Proofpoint-ORIG-GUID: AKBoxcevrPtQ-IDKTeOuYvLlacIBb5--
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_03,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240071
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/24/22 07:50, Cornelia Huck wrote:
> On Wed, Mar 23 2022, Eric Auger <eric.auger@redhat.com> wrote:
> 
>> The CRB command buffer currently is a RAM MemoryRegion and given
>> its base address alignment, it causes an error report on
>> vfio_listener_region_add(). This region could have been a RAM device
>> region, easing the detection of such safe situation but this option
>> was not well received. So let's add a helper function that uses the
>> memory region owner type to detect the situation is safe wrt
>> the assignment. Other device types can be checked here if such kind
>> of problem occurs again.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> ---
>>
>> v2 -> v3:
>> - Use TPM_IS_CRB()
>>
>> v1 -> v2:
>> - do not check the MR name but rather the owner type
>> ---
>>   hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>>   hw/vfio/trace-events |  1 +
>>   2 files changed, 27 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
Acked-by: Stefan Berger <stefanb@linux.ibm.com>

