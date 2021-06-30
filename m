Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8497D3B847D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 15:55:16 +0200 (CEST)
Received: from localhost ([::1]:52068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyagN-000188-2Q
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 09:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lyafH-0000PG-3T; Wed, 30 Jun 2021 09:54:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lyafE-0008Lu-UI; Wed, 30 Jun 2021 09:54:06 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UDX82u033688; Wed, 30 Jun 2021 09:53:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+NgzZ2fqw/10aVaSDBRwQpnARQzUIGHiZePj0My0fIs=;
 b=Dl+A/+3ixRa2xP371eoYPge3Edof4Kz4c7DxKYYzoB1V/D7Ks0DyhNqbBPe3Xln8kF7y
 lfW5UjRb95guhi8PRpua1oqwdrhz95XAvH/wh6l6ApgjoEweuB3Yb3vYsZ7mzCKCoTdl
 pzeJwA9Bk2dZesCKSb2oVEk0G5O6jRazrHxcRhtwEOCnBK8mGL+qCnXneFAXTMb5rU/a
 OLew8XtDUXoerExXY9BN2m4Cr6Z8cMZEzxlmO7zLX8BJd2FxJWE8AeYVttHab4Tf9MGr
 FoqT8ruvdKc9++pDpVWrI5Vh2+nRCcS9VToTNErYlXYGWD5h3lHG/2SodJ0Hk8EJN6ff AA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gntrr02e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 09:53:58 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UDXWXj035367;
 Wed, 30 Jun 2021 09:53:57 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gntrr01c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 09:53:57 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UDlWCY030913;
 Wed, 30 Jun 2021 13:53:55 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 39fv59rck3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 13:53:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15UDrp0i26214872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 13:53:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89A7542066;
 Wed, 30 Jun 2021 13:53:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2850242061;
 Wed, 30 Jun 2021 13:53:51 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.84.59])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 13:53:51 +0000 (GMT)
Subject: Re: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210622201923.150205-2-borntraeger@de.ibm.com>
 <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <7cd6fb75-521b-e970-4f25-b23722765bf9@de.ibm.com>
Date: Wed, 30 Jun 2021 15:53:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: srPDHmHRLSfZgH6kMDowkCM9KieSlv88
X-Proofpoint-ORIG-GUID: 7tfwxmXH8694fd6AInszpFsNezb6J_fd
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_05:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300080
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 30.06.21 15:32, David Hildenbrand wrote:
> On 22.06.21 22:19, Christian Borntraeger wrote:
>> This defines 5 new facilities and the new 3931 and 3932 machines.
>> As before the name is not yet known and we do use gen16a and gen16b.
>> The new features are part of the full model.
>>
>> The default model is still empty (same as z15) and will be added
>> in a separate patch at a later point in time.
>>
>> Also add the dependencies of new facilities and as a fix for z15 add
>> a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
>> S390_VECTOR_PACKED_DECIMAL.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>>   target/s390x/cpu_features_def.h.inc |  5 +++++
>>   target/s390x/cpu_models.c           |  6 ++++++
>>   target/s390x/gen-features.c         | 14 ++++++++++++++
>>   3 files changed, 25 insertions(+)
>>
>> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
>> index 7db3449e0434..c71caee74411 100644
>> --- a/target/s390x/cpu_features_def.h.inc
>> +++ b/target/s390x/cpu_features_def.h.inc
>> @@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-
>>   DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
>>   DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>>   DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
>> +DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
>> +DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
>> +DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")
> 
> Usually we use "eh" for enhancement. Which would result in "beareh" or alternatively "beh". But maybe the "enhancement" part is not actually an enhancement, but instead this facility is more like the etoken or unpack facility ...

There was no bear facility (I think it was part of PER3).
beareh or beh would be fine with me.

> 
>> +DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>> +DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility")
> 
> Would "pai" be a more appropriate feature name?

pai would be ok for me as well.

Conny, do you want to replace "activity" with "pai" and "bear" with "beareh" in your tree?


