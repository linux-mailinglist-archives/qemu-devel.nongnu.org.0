Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200286F6455
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 07:22:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puRPs-00054M-1M; Thu, 04 May 2023 01:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRPo-00053A-I1
 for qemu-devel@nongnu.org; Thu, 04 May 2023 01:22:04 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbhat@linux.ibm.com>)
 id 1puRPm-00085Z-SB
 for qemu-devel@nongnu.org; Thu, 04 May 2023 01:22:04 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3445IeNk009395; Thu, 4 May 2023 05:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dQ8uuDeuHH5wbM0j2yf1Iitr7qeGeKRy3FJFv/jX/2I=;
 b=gIFvf88ntDMxtTlEpqx9Gi7+JjSnXLGde4H/aoNPagWa+PxCu5UtBfATH2wjpHbdrcaY
 fcShNhNqU1rpgfzOTZtc65E2W88E38bPbOn5t4e8/Qj8sdfg+62lT5xSBuCcI0g1A1/c
 T+ATKWc/OQvbFLMuEKtQen2s2uP4bnDPsCJaz8zcidqqGeSDvqJ+5sJ+UCcXAa6mYrVi
 vcZLbXWcmSlTEY8PbBB0Qe6lV83PX+2VxYhfNwwvok90Ea2BU82iUV8NWE8hFPYmJhAi
 lTF88bRB7SYSK9SssefL0lIjscGtiNqwwZ5s0NtXGFtvp5cXAuLFEC4ymO7CnSRi94eT Yw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qc6eu012d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:21:43 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3442Hlbl009852;
 Thu, 4 May 2023 05:21:41 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3q8tv6j68y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 05:21:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 3445Lcw530212782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 May 2023 05:21:38 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5586720049;
 Thu,  4 May 2023 05:21:38 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F07AD20040;
 Thu,  4 May 2023 05:21:36 +0000 (GMT)
Received: from [9.43.55.38] (unknown [9.43.55.38])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  4 May 2023 05:21:36 +0000 (GMT)
Message-ID: <7cdaacd3-8672-5895-08d4-39c6732b44b0@linux.ibm.com>
Date: Thu, 4 May 2023 10:51:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] softfloat: Fix the incorrect computation in float32_exp2()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, aurelien@aurel32.net,
 peter.maydell@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org, vaibhav@linux.ibm.com
References: <168304110865.537992.13059030916325018670.stgit@localhost.localdomain>
 <670af6f3-003f-bbc8-4a88-4622a17b485b@linaro.org>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <670af6f3-003f-bbc8-4a88-4622a17b485b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qEBVCgcbcrsp7RxRk80PzldbQYhxKCew
X-Proofpoint-GUID: qEBVCgcbcrsp7RxRk80PzldbQYhxKCew
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_02,2023-05-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040042
Received-SPF: pass client-ip=148.163.156.1; envelope-from=sbhat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -62
X-Spam_score: -6.3
X-Spam_bar: ------
X-Spam_report: (-6.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
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

Hi Richard,


On 5/3/23 01:11, Richard Henderson wrote:
> On 5/2/23 16:25, Shivaprasad G Bhat wrote:
>> The float32_exp2() is computing wrong exponent of 2.
>> For example, with the following set of values {0.1, 2.0, 2.0, -1.0},
>> the expected output would be {1.071773, 4.000000, 4.000000, 0.500000}.
>> Instead, the function is computing {1.119102, 3.382044, 3.382044, 
>> -0.191022}
>>
<snip>
>> his is because instead of the xnp which holds the numerator,
>> parts_muladd is using the xp which is just 'x'. The commit 
>> '572c4d862ff2'
>> refactored this function, and it seems mistakenly using xp instead of 
>> xnp.
>>
>> The patches fixes this possible typo.
>>
>> Fixes: 572c4d862ff2 "softfloat: Convert float32_exp2 to FloatParts"
>> Partially-Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1623
>> Reported-By: Luca Barbato (https://gitlab.com/lu-zero)
>> Signed-off-by: Shivaprasad G Bhat<sbhat@linux.ibm.com>
>> Signed-off-by: Vaibhav Jain<vaibhat@linux.ibm.com>
>> ---
>>   fpu/softfloat.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Whoops.  Good catch.
>

If you are fine with the patch, could you fix the mail id for Vaibhav 
Jain as

  <vaibhav@linux.ibm.com> while pulling ?

If you have other comments, I will fix it in the next version otherwise.


Thanks,

Shivaprasad


H

> r~

