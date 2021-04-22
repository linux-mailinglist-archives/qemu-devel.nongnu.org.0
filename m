Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 511953680BC
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:43:38 +0200 (CEST)
Received: from localhost ([::1]:44170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYgD-000112-ET
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZYee-0007zr-Ha; Thu, 22 Apr 2021 08:42:00 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59930
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZYeb-00030d-Nk; Thu, 22 Apr 2021 08:42:00 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13MCZke9108560; Thu, 22 Apr 2021 08:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=hT/8AyXbU239+HYSI3owBJMwFKWWP3v5AX9U0yO+Zm4=;
 b=hrBvdUeW3CfxxlXT3s/D3YR0oQkIXc8U55xsltFeaVCc0warL6u3dCyWATzPsud2bhZd
 n5vlT64+6j1IYhvsNH3b754ULCVbgEMerfLXp6/gdQAdLdjLdLsmxAy5JNMymb9pTGPR
 GHo6Lx3yvHacX15KLd7oc6jIi9vSctVNTx4aVXhMsr5qri263E1V8xoWf07LrqDMsS2a
 SY67s8dI1oRBzRYUFeo7xxdDUA9kia24MvRHq6VrEIqO092VQK0zo53S2E1CWtXr5/vz
 oKRz0/oOCeybzBPJAzl3aGS/1w0hoo/W+TbNYa1X0TbgCtfXYYFqhjulu3MPVsniVlri 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3834jys70m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 08:41:54 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13MCa7K2110639;
 Thu, 22 Apr 2021 08:41:54 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3834jys6yk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 08:41:53 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13MCSFe0029768;
 Thu, 22 Apr 2021 12:41:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 37yqa8jvgb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 12:41:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13MCfnrt30212508
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 12:41:49 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66B5FAE057;
 Thu, 22 Apr 2021 12:41:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C5CFAE045;
 Thu, 22 Apr 2021 12:41:48 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.31.146])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 12:41:48 +0000 (GMT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <4e327c80-8f5d-c848-b524-7f2c75255da4@redhat.com>
 <485773db-fca2-03ca-c6e8-90ef313fb8f1@redhat.com>
 <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
Date: Thu, 22 Apr 2021 14:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
In-Reply-To: <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mVENVGTqPprUDPsWz5iJhbxX2Co23VN8
X-Proofpoint-GUID: ovJuToUBoAOJeI3qJJ64F4GjAhaGWFl2
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_04:2021-04-21,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220104
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22.04.21 13:47, Thomas Huth wrote:
> On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>> On 4/22/21 12:30 PM, Peter Maydell wrote:
>>> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé <berrange@redhat.com> wrote:
>>>>
>>>> On Thu, Apr 22, 2021 at 06:47:30AM +0200, Thomas Huth wrote:
>>>>> On 22/04/2021 06.18, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Thomas, Daniel, Stefano,
>>>>>>
>>>>>> Regarding the following warning (GCC 11 on Fedora 34):
>>>>>>
>>>>>> In file included from pc-bios/s390-ccw/main.c:11:
>>>>>>
>>>>>> In function ‘memset’,
>>>>>>
>>>>>>       inlined from ‘boot_setup’ at pc-bios/s390-ccw/main.c:185:5,
>>>>>>
>>>>>>       inlined from ‘main’ at pc-bios/s390-ccw/main.c:288:5:
>>>>>>
>>>>>> pc-bios/s390-ccw/libc.h:28:14: warning: writing 1 byte into a region of
>>>>>> size 0 [-Wstringop-overflow=]
>>>>>>
>>>>>>      28 |         p[i] = c;
>>>>>>
>>>>>>         |         ~~~~~^~~
>>>>>>
>>>>>> Daniel were right on IRC:
>>>>>>
>>>>>> danpb: it is from a call  memset((char *)S390EP, 0, 6)     where  S390EP
>>>>>> is just a constant address 0x10008
>>>>>> danpb: the compiler doesn't now how big that is, so it seems to assume
>>>>>> it is zero length
>>>>>>
>>>>>> This is a known GCC issue:
>>>>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=99578
>>>>>> "gcc-11 -Warray-bounds or -Wstringop-overread warning when accessing a
>>>>>> pointer from integer literal"
>>>>>
>>>>>   Hi Philippe,
>>>>>
>>>>> thanks for following up with the gcc bugzilla!
>>>>>
>>>>> ... so the problem is that GCC thinks we're in fact dereferencing a NULL
>>>>> pointer at offset 0x10008 here? Wow, that's ... crazy.
>>>>>
>>>>> Not sure what to do now - wait for the bug to get resolved? Compile the
>>>>> s390-ccw bios with -Wno-stringop-overread ? Add "volatiles" here and there
>>>>> to hope that these silence the compiler warnings? ... I tend to wait for the
>>>>> bug ticket to see whether the GCC folks change the behavior of the compiler
>>>>> again, but I'm open for other suggestions.
>>>>
>>>> Assuming it is just this one place in the code ,then we should just
>>>> use "pragma" to temporarily disable/re-enable that single warning flag
>>>> either side of the problem.
>>>
>>> The gcc bug report suggests that use of 'volatile' also sidesteps
>>> the warning. Is that a sensible approach here ?
>>
>> I'm not sure I got it right... I tried:
>>
>> -    memset((char *)S390EP, 0, 6);
>> +    memset((char *)(volatile char *)S390EP, 0, 6);
>>
>> But no change (still -Wstringop-overflow=).
>>
>> If I use:
>>
>> -    memset((char *)S390EP, 0, 6);
>> +    memset((volatile char *)S390EP, 0, 6);
>>
>> I still have -Wstringop-overflow=, but also:
>>
>> pc-bios/s390-ccw/main.c:185:12: warning: passing argument 1 of ‘memset’
>> discards ‘volatile’ qualifier from pointer target type
>> [-Wdiscarded-qualifiers]
>> pc-bios/s390-ccw/libc.h:22:34: note: expected ‘void *’ but argument is
>> of type ‘volatile char *’
> 
> Yeah, the warning happens in the memset(), so it likely doesn't help to change the parameter here.
> 
>> This silents the warning however:
>>
>> -- >8 --
>> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>> index bcdc45732d..2dea399904 100644
>> --- a/pc-bios/s390-ccw/libc.h
>> +++ b/pc-bios/s390-ccw/libc.h
>> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>   typedef unsigned int       uint32_t;
>>   typedef unsigned long long uint64_t;
>>
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>   static inline void *memset(void *s, int c, size_t n)
>>   {
>>       size_t i;
>> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c, size_t n)
>>
>>       return s;
>>   }
>> +#pragma GCC diagnostic pop
> 
> Honestly, that compiler "bug" sounds like it could trigger at any other spot in the bios code, too, since we are doing lots of direct accesses to low memory there. I think it's likely best if we shut it off with -Wno-stringop-overflow in the pc-bios/s390-ccw/Makefile ... could you please try to add it there?

Ack. This warning does more harm than good in here.

