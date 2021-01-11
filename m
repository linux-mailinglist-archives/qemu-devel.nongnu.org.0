Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B51C2F1376
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:09:48 +0100 (CET)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywx9-0000aN-FY
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kywv2-0007yI-34; Mon, 11 Jan 2021 08:07:37 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kywuy-0003IQ-OQ; Mon, 11 Jan 2021 08:07:35 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BD35Fb104922; Mon, 11 Jan 2021 08:07:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=25RW4T1bHYjsVXO94AuRFa0kSurh9c/A26wn5JK09vw=;
 b=bWIn37Lvi2BaR9c9eBfpyrI59hsFD2qaXrabtVQzevgDVVeSJ8HMoWQxtK0l2LWTW2dx
 duDbFHi/apGiuZLEbbGpcGzyIC+xEqH0wy8AkGb40Bl/Sh8YmOPr9WeOcOSmolkAEzeA
 XLQjZXunDrc9QA6wRiGFVhW8amrVO5wAT6L3Rs4pFVDMTjTWI6ABusQ3LLKyS1/H6CjA
 9GQ6rkF4YMdT83sSaxRm3GHW0TGebag+G621SIk1Hcyze1/7Z9/duXhFHM7ju4e8Qemd
 sor7hygd0PQGOfryALcxFPYljXYhVZmaavL1ySmjjnBFFnAhvTnwu5ILqABBP7CHatIL WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360px6rm42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 08:07:30 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10BD3MDi105629;
 Mon, 11 Jan 2021 08:07:30 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360px6rm2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 08:07:30 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BD79P8024805;
 Mon, 11 Jan 2021 13:07:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 35y3rh968y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 13:07:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BD7OZw29426038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 13:07:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39A2B4C050;
 Mon, 11 Jan 2021 13:07:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E123E4C05A;
 Mon, 11 Jan 2021 13:07:23 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.58.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 13:07:23 +0000 (GMT)
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
 <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
 <88c2eb01-f8f5-18d5-6513-57322930cc77@redhat.com>
 <115622555.32388560.1610368920610.JavaMail.zimbra@redhat.com>
 <f4c3ce8c-7688-461b-8ed2-2c8befc561a3@redhat.com>
 <7631e12a-5422-3167-51fd-1e853a119f8f@de.ibm.com>
Message-ID: <fc326042-fd2b-9b27-36ae-47522e877ed4@de.ibm.com>
Date: Mon, 11 Jan 2021 14:07:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <7631e12a-5422-3167-51fd-1e853a119f8f@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_23:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110077
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11.01.21 14:02, Christian Borntraeger wrote:
> 
> 
> On 11.01.21 13:54, Thomas Huth wrote:
>> On 11/01/2021 13.42, Miroslav Rezanina wrote:
>>>
>>>
>>> ----- Original Message -----
>>>> From: "Thomas Huth" <thuth@redhat.com>
>>>> To: "Philippe Mathieu-Daudé" <philmd@redhat.com>, mrezanin@redhat.com, qemu-devel@nongnu.org, "qemu-s390x"
>>>> <qemu-s390x@nongnu.org>
>>>> Sent: Monday, January 11, 2021 1:24:57 PM
>>>> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
>>>>
>>>> On 11/01/2021 13.10, Philippe Mathieu-Daudé wrote:
>>>>> Hi Miroslav,
>>>>>
>>>>> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
>>>>>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>>>>>
>>>>>> There are two cases when vm name is copied but closing \0 can be lost
>>>>>> in case name is too long (>=256 characters).
>>>>>>
>>>>>> Updating length to copy so there is space for closing \0.
>>>>>>
>>>>>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>>>>>> ---
>>>>>>    target/s390x/kvm.c         | 2 +-
>>>>>>    target/s390x/misc_helper.c | 4 +++-
>>>>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>>>>>> index b8385e6b95..2313b5727e 100644
>>>>>> --- a/target/s390x/kvm.c
>>>>>> +++ b/target/s390x/kvm.c
>>>>>> @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64
>>>>>> addr, uint8_t ar)
>>>>>>         */
>>>>>>        if (qemu_name) {
>>>>>>            strncpy((char *)sysib.ext_names[0], qemu_name,
>>>>>> -                sizeof(sysib.ext_names[0]));
>>>>>> +                sizeof(sysib.ext_names[0]) - 1);
>>>>>>        } else {
>>>>>>            strcpy((char *)sysib.ext_names[0], "KVMguest");
>>>>>>        }
>>>>>
>>>>> What about using strpadcpy() instead?
>>>>
>>>> Yes, strpadcpy is the better way here - this field has to be padded with
>>>> zeroes, so doing "- 1" is wrong here.
>>>
>>> Hi Thomas,
>>>
>>> as I wrote in reply to Phillipe - the array is memset to zeroes before the if so we
>>> are sure it's padded with zeroes (in this occurrence, not true for second one).
>>
>> Ok, but dropping the last character is still wrong here. The ext_names do not need to be terminated with a \0 if they have the full length.
> The current code is actually correct. We are perfectly fine without the final \n if the string is really 256 bytes.
> 
> Replacing memset + strncpy with strpadcpy is certainly a good cleanup. Is it necessary? No.

And yes, Thomas is right. The -1 is wrong. 

