Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0483B86C7
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:07:32 +0200 (CEST)
Received: from localhost ([::1]:46628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyckN-0000L3-9U
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lycaN-0005I0-PW; Wed, 30 Jun 2021 11:57:12 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:57872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lycaE-0003QR-Fq; Wed, 30 Jun 2021 11:57:11 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UFYECs028753; Wed, 30 Jun 2021 11:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=c2NDw/FVBNdLtH9gj29r0/Rnkhhd5bMgPQB5Swz2Ayo=;
 b=eON7JTHNq6Vwf0OKaU2PSp0vfkviy/YxEW1E6Pt/ZTWD8Qoera9V8DG+UfQb1RcNDUuG
 4TFBwT1cjV7nIo6t5C29d+mtI0U7seWG+9Cb3s9I8vDDVkjp7lKa8AgpQ/gt54LWFRGi
 PuaTc26g3rQhW4AGE2YDsARg/pjcldcSBuTS0nWSNAwEmLiIQEGsBqDb4AwmqQTsO6YF
 X23lN4feWrC2nXLnFw2/dA3kw9+4CSXXOECaNhGqyFTVa+8rndQrsgOhAmpuOo2VGUK7
 9BGjrCPJW82Aw6KeqCiDC6Tpp8S8ml7Hw6dnkGUyJtCRxAI9VKPcDIvbBYDiCSqbky48 lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gtfstr3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:56:59 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15UFYenq030840;
 Wed, 30 Jun 2021 11:56:59 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39gtfstr2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 11:56:59 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15UFsNKP016386;
 Wed, 30 Jun 2021 15:56:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 39duv8gyt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Jun 2021 15:56:57 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15UFtF6G25362718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 15:55:15 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B285A4078;
 Wed, 30 Jun 2021 15:56:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C570DA4040;
 Wed, 30 Jun 2021 15:56:53 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.84.59])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Jun 2021 15:56:53 +0000 (GMT)
Subject: Re: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
To: Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210622201923.150205-2-borntraeger@de.ibm.com>
 <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
 <7cd6fb75-521b-e970-4f25-b23722765bf9@de.ibm.com> <8735szl66j.fsf@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <e448f4ee-76cf-c380-2a23-7e746a728a9d@de.ibm.com>
Date: Wed, 30 Jun 2021 17:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8735szl66j.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kFhRJN4uZRtCtmlpYmrxJHTCIA3L41j-
X-Proofpoint-GUID: 8gvR9NVj2Qihr2zdLzqm8EDQfoIChbQ9
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-30_06:2021-06-29,
 2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300092
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



On 30.06.21 17:32, Cornelia Huck wrote:
> On Wed, Jun 30 2021, Christian Borntraeger <borntraeger@de.ibm.com> wrote:
> 
>> On 30.06.21 15:32, David Hildenbrand wrote:
>>> On 22.06.21 22:19, Christian Borntraeger wrote:
>>>> This defines 5 new facilities and the new 3931 and 3932 machines.
>>>> As before the name is not yet known and we do use gen16a and gen16b.
>>>> The new features are part of the full model.
>>>>
>>>> The default model is still empty (same as z15) and will be added
>>>> in a separate patch at a later point in time.
>>>>
>>>> Also add the dependencies of new facilities and as a fix for z15 add
>>>> a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
>>>> S390_VECTOR_PACKED_DECIMAL.
>>>>
>>>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>>> ---
>>>>    target/s390x/cpu_features_def.h.inc |  5 +++++
>>>>    target/s390x/cpu_models.c           |  6 ++++++
>>>>    target/s390x/gen-features.c         | 14 ++++++++++++++
>>>>    3 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
>>>> index 7db3449e0434..c71caee74411 100644
>>>> --- a/target/s390x/cpu_features_def.h.inc
>>>> +++ b/target/s390x/cpu_features_def.h.inc
>>>> @@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", STFL, 152, "Vector-Packed-Decimal-
>>>>    DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)")
>>>>    DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>>>>    DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
>>>> +DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
>>>> +DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, "Vector-Packed-Decimal-Enhancement facility 2")
>>>> +DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")
>>>
>>> Usually we use "eh" for enhancement. Which would result in "beareh" or alternatively "beh". But maybe the "enhancement" part is not actually an enhancement, but instead this facility is more like the etoken or unpack facility ...
>>
>> There was no bear facility (I think it was part of PER3).
>> beareh or beh would be fine with me.
>>
>>>
>>>> +DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>>>> +DEF_FEAT(ACTIVITY, "activity", STFL, 196, "Processor-Activity-Instrumentation facility")
>>>
>>> Would "pai" be a more appropriate feature name?
>>
>> pai would be ok for me as well.
>>
>> Conny, do you want to replace "activity" with "pai" and "bear" with "beareh" in your tree?
> 
> I can certainly edit this to a naming everyone agrees with (no strong
> opinions from my side).

Lets pick "pai" and the choose among "beareh" and "beh"

