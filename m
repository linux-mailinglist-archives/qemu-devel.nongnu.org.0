Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424830F3ED
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:34:08 +0100 (CET)
Received: from localhost ([::1]:37088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7elr-0001Bq-GV
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7ekU-0000hU-EB; Thu, 04 Feb 2021 08:32:42 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:25896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7ekS-0003x8-BV; Thu, 04 Feb 2021 08:32:42 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114DW7dk133819; Thu, 4 Feb 2021 08:32:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=RRfOb6Owj5wouq4MO3LtxsVoSRu3kjSZgDl8aXJNRCs=;
 b=Znh9R63bXQJXVJE0+8G2LbXan5JCQlzuP9whQ2hlNbcUCDQQlzeSNL+AoNpJ8ukOxRT+
 oXaE21hZcYotqze5uXBPJqKd3ISZUggkbwVbCEiySfEL+4RT7qp+EHsJZeYbFNmuU7QG
 NTfdxhEXx9y/F01cV5zbb1kkYwQLEIxvg1AGEMUZ2IR4WKpBrxMqklzR2s686ppF8yU6
 wCauqy+sj0wUbXUvbLK7d6yW6TpXnssXMZgkQCsBfvev83Hmvwp2JjmKKvJ7MW6UEs63
 hrgOxNxry5tumtJcjASZdovMoiv+1dZAvwLsgyBFyKdOIAtQQpif/pqEWxpVOOo6syHV tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ghucr2tp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:32:37 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114DWb15135936;
 Thu, 4 Feb 2021 08:32:37 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36ghucr2sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:32:36 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114DQkZ9012044;
 Thu, 4 Feb 2021 13:32:34 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf2kcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 13:32:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114DWW0L43188708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 13:32:32 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 986B1AE04D;
 Thu,  4 Feb 2021 13:32:32 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BDABAE051;
 Thu,  4 Feb 2021 13:32:31 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.45.97])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 13:32:31 +0000 (GMT)
Subject: Re: [PATCH] target/s390x/arch_dump: Fixes for the name field in the
 PT_NOTE section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210203094454.260583-1-thuth@redhat.com>
 <1edf8bcd-3001-d459-3283-20e8ae2a3862@de.ibm.com>
 <74e6c0a6-b08f-be1a-2e66-954982806576@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <0e8b33f5-2535-31cd-131a-16eefdd2f17d@de.ibm.com>
Date: Thu, 4 Feb 2021 14:32:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <74e6c0a6-b08f-be1a-2e66-954982806576@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_07:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040082
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 04.02.21 14:09, Thomas Huth wrote:
> On 04/02/2021 14.01, Christian Borntraeger wrote:
>>
>>
>> On 03.02.21 10:44, Thomas Huth wrote:
>>> According to the "ELF-64 Object File Format" specification:
>>>
>>> "The first word in the entry, namesz, identifies the length, in
>>>   bytes, of a name identifying the entry’s owner or originator. The name field
>>>   contains a null-terminated string, with padding as necessary to ensure 8-
>>>   byte alignment for the descriptor field. The length does not include the
>>>   terminating null or the padding."
>>>
>>> So we should not include the terminating NUL in the length field here.
>>>
>>> Also there is a compiler warning with GCC 9.3 when compiling with
>>> the -fsanitize=thread compiler flag:
>>>
>>>   In function 'strncpy',
>>>      inlined from 's390x_write_elf64_notes' at ../target/s390x/arch_dump.c:219:9:
>>>   /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
>>>    '__builtin_strncpy' specified bound 8 equals destination size
>>>    [-Werror=stringop-truncation]
>>>
>>> Since the name should always be NUL-terminated, we can simply decrease
>>> the size of the strncpy by one here to silence this warning. And while
>>> we're at it, also add an assert() to make sure that the provided names
>>> always fit the size field (which is fine for the current callers, the
>>> function is called once with "CORE" and once with "LINUX" as a name).
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   The ELF-64 spec can be found here, for example:
>>>   https://uclibc.org/docs/elf-64-gen.pdf
>>>
>>>   Here's a CI run with the compiler warning:
>>>   https://gitlab.com/huth/qemu/-/jobs/1003508341#L1248
>>>
>>>   target/s390x/arch_dump.c | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
>>> index 50fa0ae4b6..20c3a09707 100644
>>> --- a/target/s390x/arch_dump.c
>>> +++ b/target/s390x/arch_dump.c
>>> @@ -212,11 +212,13 @@ static int s390x_write_elf64_notes(const char *note_name,
>>>       int note_size;
>>>       int ret = -1;
>>>   +    assert(strlen(note_name) < sizeof(note.name));
>>> +
>>>       for (nf = funcs; nf->note_contents_func; nf++) {
>>>           memset(&note, 0, sizeof(note));
>>> -        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
>>> +        note.hdr.n_namesz = cpu_to_be32(strlen(note_name));
>>>           note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
>>> -        strncpy(note.name, note_name, sizeof(note.name));
>>> +        strncpy(note.name, note_name, sizeof(note.name) - 1);
>>
>> This kind of feels wrong. With 8 bytes of note.name, we should be able to store "Test123" + the final \0.
>> Now we tell strncpy to stop at 7. Which means that for Test123 we would NOT copy the final \0.
> 
> Yes, but there is a memset(&note, 0, sizeof(note)) at the beginning of the for-loop, so the 8th byte should always be set to 0 anyway. But if you prefer, I can also simply use g_strlcpy() instead...?

This might be better as gcc also warns for the "it fits perfectly case" when we do not copy the \0.
While the following case should not trigger with todays QEMU code it shows the issue.


$ gcc -W -Wall test.c 
test.c: In function ‘main’:
test.c:7:2: warning: ‘strncpy’ output truncated before terminating nul copying 7 bytes from a string of the same length [-Wstringop-truncation]
    7 |  strncpy(buf, "Test123", 7);
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
$ cat test.c
#include <string.h>

int main()
{

	char buf[8];
	strncpy(buf, "Test123", 7);
}




