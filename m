Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0092F1438
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:22:28 +0100 (CET)
Received: from localhost ([::1]:56608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyx9P-0000s3-DY
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kyx73-0007my-NU; Mon, 11 Jan 2021 08:20:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kyx71-0004yp-KS; Mon, 11 Jan 2021 08:20:01 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BD5eSZ060011; Mon, 11 Jan 2021 08:19:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=tgZFn8p+HQz61KiYktsJuzVtp5GQQmtA8sC7jzf3X4Q=;
 b=tQ1b4UwvIr+D73mOZ1wcZGWsno7AgWtDpdg0lk0ILdJ65CrhkrY4BOewLI6tVhRaz8V+
 I++8RGaMz1XK7ikfQws7yOpUcM0R+Sl2LpWyym0y5VB92btoONjgpw3xpJUkYycCBVTi
 EaAKPejdv9G/KRfMbOKqXC3hOs1xOv63uidSPU0nL3cmpS3tgfACvMxeOO6TQau2/rLM
 jKXHmzuI8e7GhYkrPvdwZETH2zPjWhnNvTXqPfg5WvuXZjJdGoZTFtc6jKtiSF9N7MNf
 FIP7N19v6Q6bD3NgKGu+d8rWrPtnoDghhuHLyn018k3W86U30k+J2W3l5tQntfkz1Sr0 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360pfy9nt7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 08:19:57 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10BCWiFe060064;
 Mon, 11 Jan 2021 08:19:56 -0500
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360pfy9nsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 08:19:56 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BDJsfV016543;
 Mon, 11 Jan 2021 13:19:54 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 35y44895xv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 13:19:54 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BDJqh115270178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 13:19:52 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BF6852052;
 Mon, 11 Jan 2021 13:19:52 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.58.41])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F0F5D52054;
 Mon, 11 Jan 2021 13:19:51 +0000 (GMT)
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
To: Miroslav Rezanina <mrezanin@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
 <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
 <88c2eb01-f8f5-18d5-6513-57322930cc77@redhat.com>
 <115622555.32388560.1610368920610.JavaMail.zimbra@redhat.com>
 <f4c3ce8c-7688-461b-8ed2-2c8befc561a3@redhat.com>
 <7631e12a-5422-3167-51fd-1e853a119f8f@de.ibm.com>
 <187831554.32408075.1610371044488.JavaMail.zimbra@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <6be00402-052d-cfe9-eb3d-8acf535dc813@de.ibm.com>
Date: Mon, 11 Jan 2021 14:19:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <187831554.32408075.1610371044488.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_23:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110075
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11.01.21 14:17, Miroslav Rezanina wrote:
> 
> 
> ----- Original Message -----
>> From: "Christian Borntraeger" <borntraeger@de.ibm.com>
>> To: "Thomas Huth" <thuth@redhat.com>, "Miroslav Rezanina" <mrezanin@redhat.com>
>> Cc: "qemu-s390x" <qemu-s390x@nongnu.org>, "Philippe Mathieu-Daudé" <philmd@redhat.com>, qemu-devel@nongnu.org
>> Sent: Monday, January 11, 2021 2:02:32 PM
>> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
>>
>>
>>
>> On 11.01.21 13:54, Thomas Huth wrote:
>>> On 11/01/2021 13.42, Miroslav Rezanina wrote:
>>>>
>>>>
>>>> ----- Original Message -----
>>>>> From: "Thomas Huth" <thuth@redhat.com>
>>>>> To: "Philippe Mathieu-Daudé" <philmd@redhat.com>, mrezanin@redhat.com,
>>>>> qemu-devel@nongnu.org, "qemu-s390x"
>>>>> <qemu-s390x@nongnu.org>
>>>>> Sent: Monday, January 11, 2021 1:24:57 PM
>>>>> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
>>>>>
>>>>> On 11/01/2021 13.10, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Miroslav,
>>>>>>
>>>>>> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
>>>>>>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>>>>>>
>>>>>>> There are two cases when vm name is copied but closing \0 can be lost
>>>>>>> in case name is too long (>=256 characters).
>>>>>>>
>>>>>>> Updating length to copy so there is space for closing \0.
>>>>>>>
>>>>>>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>>>>>>> ---
>>>>>>>    target/s390x/kvm.c         | 2 +-
>>>>>>>    target/s390x/misc_helper.c | 4 +++-
>>>>>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>>>>>>> index b8385e6b95..2313b5727e 100644
>>>>>>> --- a/target/s390x/kvm.c
>>>>>>> +++ b/target/s390x/kvm.c
>>>>>>> @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64
>>>>>>> addr, uint8_t ar)
>>>>>>>         */
>>>>>>>        if (qemu_name) {
>>>>>>>            strncpy((char *)sysib.ext_names[0], qemu_name,
>>>>>>> -                sizeof(sysib.ext_names[0]));
>>>>>>> +                sizeof(sysib.ext_names[0]) - 1);
>>>>>>>        } else {
>>>>>>>            strcpy((char *)sysib.ext_names[0], "KVMguest");
>>>>>>>        }
>>>>>>
>>>>>> What about using strpadcpy() instead?
>>>>>
>>>>> Yes, strpadcpy is the better way here - this field has to be padded with
>>>>> zeroes, so doing "- 1" is wrong here.
>>>>
>>>> Hi Thomas,
>>>>
>>>> as I wrote in reply to Phillipe - the array is memset to zeroes before the
>>>> if so we
>>>> are sure it's padded with zeroes (in this occurrence, not true for second
>>>> one).
>>>
>>> Ok, but dropping the last character is still wrong here. The ext_names do
>>> not need to be terminated with a \0 if they have the full length.
>> The current code is actually correct. We are perfectly fine without the final
>> \n if the string is really 256 bytes.
>>
>> Replacing memset + strncpy with strpadcpy is certainly a good cleanup. Is it
>> necessary? No.
> 
> Yes, it is necessary because otherwise compiler (GCC 11) produce warning and so
> build fail when --enable-werror is used.

Fair enough. But that actually means that the compiler warning is wrong, because
we use strncpy exactly in the way as described (allowing for the final \n to be
missing). But let us use strpadcpy then.

