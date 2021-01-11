Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FC22F139F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:12:22 +0100 (CET)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kywzd-0002ZD-7G
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:12:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kywv7-00083G-N3; Mon, 11 Jan 2021 08:07:41 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1kywv5-0003JV-UQ; Mon, 11 Jan 2021 08:07:41 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BD2K6c069656; Mon, 11 Jan 2021 08:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iTgi2uwgC2CqgYtFrqz69Llwz2xEUqxKh6gHNLSeg9o=;
 b=nifMzeueauwKWH9j7HdlICsj+P9dX6Bnqi4lG9Gufksi80UEek/3iTrkm8P0yfvyGN+p
 AFH/ndM/ZGP618aVD5cxHjENhRuf5uqZFheL+OcwsMPuudrrwhpNtU8yAnmTFH9GskLo
 PvePsxXAclkudIBcl1pYt0SQuCZoKjMeVxvWQ3G3h5Hi2XQ5h273fLT7p4fQhrZeT+xM
 +c7bBWvJkhDZI6ThENAAKlGXzL7C3ehgCBF8xicXxTgRqPcEQ7PBkiy52eXkTDqK0YLH
 roNSJVji07pfa75cigdPRdtLM8s8EpE3aBSCQN8TpRT3a/eADL/NrQrzICihj132WdUk 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360p1qtda8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 08:07:38 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10BD2RZj070456;
 Mon, 11 Jan 2021 08:07:37 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360p1qtd8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 08:07:37 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BCxAg2000397;
 Mon, 11 Jan 2021 13:02:35 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 3604h98fjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 13:02:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BD2X8V37290442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 13:02:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB5A74C059;
 Mon, 11 Jan 2021 13:02:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A55454C040;
 Mon, 11 Jan 2021 13:02:32 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.58.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 13:02:32 +0000 (GMT)
Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
To: Thomas Huth <thuth@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
References: <cover.1610364304.git.mrezanin@redhat.com>
 <e1ad733af7b23929456d05aacae693ce6462d4b3.1610364304.git.mrezanin@redhat.com>
 <5acb5521-fdd2-e511-9cc3-176086183dd5@redhat.com>
 <88c2eb01-f8f5-18d5-6513-57322930cc77@redhat.com>
 <115622555.32388560.1610368920610.JavaMail.zimbra@redhat.com>
 <f4c3ce8c-7688-461b-8ed2-2c8befc561a3@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <7631e12a-5422-3167-51fd-1e853a119f8f@de.ibm.com>
Date: Mon, 11 Jan 2021 14:02:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <f4c3ce8c-7688-461b-8ed2-2c8befc561a3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_23:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101110075
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



On 11.01.21 13:54, Thomas Huth wrote:
> On 11/01/2021 13.42, Miroslav Rezanina wrote:
>>
>>
>> ----- Original Message -----
>>> From: "Thomas Huth" <thuth@redhat.com>
>>> To: "Philippe Mathieu-Daudé" <philmd@redhat.com>, mrezanin@redhat.com, qemu-devel@nongnu.org, "qemu-s390x"
>>> <qemu-s390x@nongnu.org>
>>> Sent: Monday, January 11, 2021 1:24:57 PM
>>> Subject: Re: [RHEL7 qemu-kvm PATCH 2/3] s390x: Fix vm name copy length
>>>
>>> On 11/01/2021 13.10, Philippe Mathieu-Daudé wrote:
>>>> Hi Miroslav,
>>>>
>>>> On 1/11/21 12:30 PM, mrezanin@redhat.com wrote:
>>>>> From: Miroslav Rezanina <mrezanin@redhat.com>
>>>>>
>>>>> There are two cases when vm name is copied but closing \0 can be lost
>>>>> in case name is too long (>=256 characters).
>>>>>
>>>>> Updating length to copy so there is space for closing \0.
>>>>>
>>>>> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
>>>>> ---
>>>>>    target/s390x/kvm.c         | 2 +-
>>>>>    target/s390x/misc_helper.c | 4 +++-
>>>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
>>>>> index b8385e6b95..2313b5727e 100644
>>>>> --- a/target/s390x/kvm.c
>>>>> +++ b/target/s390x/kvm.c
>>>>> @@ -1918,7 +1918,7 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64
>>>>> addr, uint8_t ar)
>>>>>         */
>>>>>        if (qemu_name) {
>>>>>            strncpy((char *)sysib.ext_names[0], qemu_name,
>>>>> -                sizeof(sysib.ext_names[0]));
>>>>> +                sizeof(sysib.ext_names[0]) - 1);
>>>>>        } else {
>>>>>            strcpy((char *)sysib.ext_names[0], "KVMguest");
>>>>>        }
>>>>
>>>> What about using strpadcpy() instead?
>>>
>>> Yes, strpadcpy is the better way here - this field has to be padded with
>>> zeroes, so doing "- 1" is wrong here.
>>
>> Hi Thomas,
>>
>> as I wrote in reply to Phillipe - the array is memset to zeroes before the if so we
>> are sure it's padded with zeroes (in this occurrence, not true for second one).
> 
> Ok, but dropping the last character is still wrong here. The ext_names do not need to be terminated with a \0 if they have the full length.
The current code is actually correct. We are perfectly fine without the final \n if the string is really 256 bytes.

Replacing memset + strncpy with strpadcpy is certainly a good cleanup. Is it necessary? No.

