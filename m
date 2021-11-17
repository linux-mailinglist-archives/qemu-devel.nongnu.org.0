Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0EE4546EC
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 14:08:01 +0100 (CET)
Received: from localhost ([::1]:55830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnKfQ-000468-CG
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 08:08:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mnKda-0002u4-RT; Wed, 17 Nov 2021 08:06:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:61492
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mnKdX-0000hh-Ic; Wed, 17 Nov 2021 08:06:06 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHClUNA017314; 
 Wed, 17 Nov 2021 13:06:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Cp5uHnUGvsUfuIGCAsuFs/4XncuOovLVHp2wm/dto8k=;
 b=fgehtUZA/FQSsgB6uvTlos/mIW0oXTYmehKHWFumDPUsm7ogAGvQURibO3lcaIJSuOUb
 QhaXD6e7U0AEI7Na4qoqHK42Zlp4K54QNYRLwS3t7yRyc2ah39YF+zliCYthUr/L4brY
 UZoqmG2ZM4bVyULpZZ6GDkVIlmWQGLaXAlX1miJ/m7ZBocj1We67eIP6YQ7xLHvA/D7K
 Ivjq+X7SV7NtUB5epQsjjmQ9x2/ne2f6IBoaEGK/oVCrs1VqYoVNZItb1ZjspdUIqYXp
 iFXHvEjzaKD5hrX06zaYfVhY4PPOHAcgqK39N8YtORyECjhMUNh4U9NAzaqbDWprYgZ3 tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cd2278b7e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 13:05:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHD5xDm017125;
 Wed, 17 Nov 2021 13:05:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cd2278b6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 13:05:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHCwreC005594;
 Wed, 17 Nov 2021 13:05:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3ca4mk27ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 13:05:57 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AHCwxpA64160198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 12:58:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C8D352063;
 Wed, 17 Nov 2021 13:05:54 +0000 (GMT)
Received: from [9.171.38.237] (unknown [9.171.38.237])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D42775204F;
 Wed, 17 Nov 2021 13:05:53 +0000 (GMT)
Message-ID: <c5ecaf42-3eac-85a3-b6c1-66bfab9f6f3e@linux.ibm.com>
Date: Wed, 17 Nov 2021 14:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/4] s390x: kvm: topology: interception of PTF
 instruction
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1631800254-25762-1-git-send-email-pmorel@linux.ibm.com>
 <1631800254-25762-3-git-send-email-pmorel@linux.ibm.com>
 <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
In-Reply-To: <ae0cf5c1-b0b8-0758-7c38-35c1845201ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BxET_qsiXYVrlhSTC5U3jXkNKfyDaoT4
X-Proofpoint-ORIG-GUID: CelkQoujUTF-5O8r8cHlnoy9L5z0jdF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170067
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.009,
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
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/13/21 09:25, Thomas Huth wrote:
> On 16/09/2021 15.50, Pierre Morel wrote:
>> When the host supports the CPU topology facility, the PTF
>> instruction with function code 2 is interpreted by the SIE,
>> provided that the userland hypervizor activates the interpretation
>> by using the KVM_CAP_S390_CPU_TOPOLOGY KVM extension.
>>
>> The PTF instructions with function code 0 and 1 are intercepted
>> and must be emulated by the userland hypervizor.
>>
>> Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
>> ---
>>   hw/s390x/s390-virtio-ccw.c         | 36 ++++++++++++++++++++++++++++++
>>   include/hw/s390x/s390-virtio-ccw.h |  6 +++++
>>   target/s390x/kvm/kvm.c             | 15 +++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
>> index 61aeccb163..894f013139 100644
>> --- a/hw/s390x/s390-virtio-ccw.c
>> +++ b/hw/s390x/s390-virtio-ccw.c
>> @@ -404,6 +404,42 @@ static void 
>> s390_pv_prepare_reset(S390CcwMachineState *ms)
>>       s390_pv_prep_reset();
>>   }
> 
> Could you please add a comment in front of this function, with some 
> explanations? If I've got that right, it's currently rather only a 
> "dummy" function, rejecting FC 0 and 1, and FC 2 is always handled by 
> the SIE, right?

I just saw I did not answer this question.

Yes function code 2 is handled by the SIE but it is not really a dummy 
function as without it PTF 0 or 1 would trigger a program check.

I will add a comment basically:

"We assume horizontal topology, the only one supported currently by 
Linux consequently we answer to function code 0 requesting horizontal 
polarization that it is already the current polarization and reject 
vertical polarization request without further explanation."


regards,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

