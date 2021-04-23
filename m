Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD97368D63
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 08:54:03 +0200 (CEST)
Received: from localhost ([::1]:57772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZphS-0000Vc-IH
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 02:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZpg9-0008M7-K5; Fri, 23 Apr 2021 02:52:41 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54922
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZpg7-00074r-N1; Fri, 23 Apr 2021 02:52:41 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13N6XiBa000737; Fri, 23 Apr 2021 02:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5yFFN8XrRoCiTM1Mj5mLTDTaA0kFFGAxMXdjiX+njM4=;
 b=OXsVKhzxboZJGaf4j6v6yiJi+iXP7lLuBF3OEUicC0M0MWrNCyNr68oM1uHtwc2C5vgB
 loYu5Gs7Ft+k5jKdF3s1Va2VCzr5GRoGBj3p9FW28hpe1Qtxpty+2mpouvgGHnrfygLC
 5gbRN8N/KPfIqgIW2j9fxzQ85VAwqge4+0SmeuBu4kB0EY+RIHjnaAeo2z5wkhpq1yF4
 HGgh56BTOvyujnEIWnbSScYz1pLxwTdcsDmf0Ysl8CW+y/QBQNTxq2B2dNPZ+tpnWNer
 p/qNpC4CEhVYY4BnUtSthX4aI3w5XyVibKHCEQUUJdwFP+ZMsrCkygOP99UqENz/p7sF FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 383d4sj060-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 02:52:35 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13N6qZXg071592;
 Fri, 23 Apr 2021 02:52:35 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 383d4sj05f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 02:52:34 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13N6Zxdc009825;
 Fri, 23 Apr 2021 06:52:33 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 37yqa89sr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Apr 2021 06:52:33 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13N6q7Ra33882390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Apr 2021 06:52:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7C4E4204C;
 Fri, 23 Apr 2021 06:52:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09A4F42045;
 Fri, 23 Apr 2021 06:52:30 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.57.182])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 23 Apr 2021 06:52:29 +0000 (GMT)
Subject: Re: s390-ccw: warning: writing 1 byte into a region of size 0
 [-Wstringop-overflow=]
To: Stefano Garzarella <sgarzare@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <YIFMt+xg+xH+M4rd@redhat.com>
 <CAFEAcA8r2k9f=XG6T_hYk542-dDJnR7Lr8DZnyc=SFgnzNYxxQ@mail.gmail.com>
 <089df242-8788-a162-4a75-4c9c9e04a64e@redhat.com>
 <8afd0f34-7e75-2661-9ea5-3ebadff3b85d@redhat.com>
 <2ec6e995-6833-1ebd-03c8-a3fede7fddb8@de.ibm.com>
 <e4116908-7172-fd9c-1837-82c489b61620@redhat.com>
 <c95369e4-ffc9-d01d-45c1-4daad0ead6a5@redhat.com>
 <20210422155238.kak7tl3xnup5vod7@steredhat>
 <da8f7353-8e2a-82f9-c324-18321649ccb5@redhat.com>
 <fb127bc3-aa4a-dc04-484a-d747c3aa503e@redhat.com>
 <20210423064001.fjouibdcwadtgijy@steredhat>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <b167616b-1908-1a76-a2af-35b87c05d570@de.ibm.com>
Date: Fri, 23 Apr 2021 08:52:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210423064001.fjouibdcwadtgijy@steredhat>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bWjDll4-cwsXsowVyrAPfUNJt-morXvX
X-Proofpoint-ORIG-GUID: HkYORH5wLh96jpwqWXISJmR_BBOvGpC8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_15:2021-04-22,
 2021-04-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104230042
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 23.04.21 08:40, Stefano Garzarella wrote:
> On Thu, Apr 22, 2021 at 06:54:21PM +0200, Philippe Mathieu-Daudé wrote:
>> On 4/22/21 6:07 PM, Thomas Huth wrote:
>>> On 22/04/2021 17.52, Stefano Garzarella wrote:
>>>> On Thu, Apr 22, 2021 at 05:38:26PM +0200, Thomas Huth wrote:
>>>>> On 22/04/2021 16.31, Philippe Mathieu-Daudé wrote:
>>>>>> On 4/22/21 2:41 PM, Christian Borntraeger wrote:
>>>>>>> On 22.04.21 13:47, Thomas Huth wrote:
>>>>>>>> On 22/04/2021 13.24, Philippe Mathieu-Daudé wrote:
>>>>>>>>> On 4/22/21 12:30 PM, Peter Maydell wrote:
>>>>>>>>>> On Thu, 22 Apr 2021 at 11:18, Daniel P. Berrangé
>>>>>>>>>> <berrange@redhat.com> wrote:
>>>>>>
>>>>>>>>> This silents the warning however:
>>>>>>>>>
>>>>>>>>> -- >8 --
>>>>>>>>> diff --git a/pc-bios/s390-ccw/libc.h b/pc-bios/s390-ccw/libc.h
>>>>>>>>> index bcdc45732d..2dea399904 100644
>>>>>>>>> --- a/pc-bios/s390-ccw/libc.h
>>>>>>>>> +++ b/pc-bios/s390-ccw/libc.h
>>>>>>>>> @@ -19,6 +19,8 @@ typedef unsigned short     uint16_t;
>>>>>>>>>   typedef unsigned int       uint32_t;
>>>>>>>>>   typedef unsigned long long uint64_t;
>>>>>>>>>
>>>>>>>>> +#pragma GCC diagnostic push
>>>>>>>>> +#pragma GCC diagnostic ignored "-Wstringop-overflow"
>>>>>>>>>   static inline void *memset(void *s, int c, size_t n)
>>>>>>>>>   {
>>>>>>>>>       size_t i;
>>>>>>>>> @@ -30,6 +32,7 @@ static inline void *memset(void *s, int c,
>>>>>>>>> size_t n)
>>>>>>>>>
>>>>>>>>>       return s;
>>>>>>>>>   }
>>>>>>>>> +#pragma GCC diagnostic pop
>>>>>>>>
>>>>>>>> Honestly, that compiler "bug" sounds like it could trigger at any
>>>>>>>> other spot in the bios code, too, since we are doing lots of direct
>>>>>>>> accesses to low memory there. I think it's likely best if we shut it
>>>>>>>> off with -Wno-stringop-overflow in the pc-bios/s390-ccw/Makefile ...
>>>>>>>> could you please try to add it there?
>>>>>>>
>>>>>>
>>>>>> We are good with:
>>>>>>
>>>>>> -- >8 --
>>>>>> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
>>>>>> index 29fd9019b8..dcec09b6f9 100644
>>>>>> --- a/pc-bios/s390-ccw/Makefile
>>>>>> +++ b/pc-bios/s390-ccw/Makefile
>>>>>> @@ -8,6 +8,9 @@ CFLAGS = -O2 -g
>>>>>>  quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 &&
>>>>>> $1, @$1))
>>>>>>  cc-option = $(if $(shell $(CC) $1 -S -o /dev/null -xc /dev/null >
>>>>>> /dev/null \
>>>>>>               2>&1 && echo OK), $1, $2)
>>>>>> +cc-c-option = $(if $(shell $(CC) $1 $2 -c -o /dev/null -xc /dev/null \
>>>>>> +                >/dev/null 2>&1 && echo OK), $2, $3)
>>>>>>
>>>>>>  VPATH_SUFFIXES = %.c %.h %.S %.m %.mak %.sh %.rc Kconfig% %.json.in
>>>>>>  set-vpath = $(if $1,$(foreach PATTERN,$(VPATH_SUFFIXES),$(eval vpath
>>>>>> $(PATTERN) $1)))
>>>>>> @@ -30,6 +33,7 @@ OBJECTS = start.o main.o bootmap.o jump2ipl.o sclp.o
>>>>>> menu.o \
>>>>>>           virtio.o virtio-scsi.o virtio-blkdev.o libc.o cio.o
>>>>>> dasd-ipl.o
>>>>>>
>>>>>>  QEMU_CFLAGS := -Wall $(filter -W%, $(QEMU_CFLAGS))
>>>>>> +QEMU_CFLAGS += $(call cc-c-option, $(QEMU_CFLAGS),
>>>>>> -Wno-stringop-overflow)
>>>>>>  QEMU_CFLAGS += -ffreestanding -fno-delete-null-pointer-checks
>>>>>
>>>>> I think you don't need the "cc-c-option" magic here. Just add the
>>>>> -Wno-stringop-overflow. All supported versions of GCC and Clang
>>>>> simply silently ignore unknown -Wno-something options (try e.g. "gcc
>>>>> -Wno-yadayadayada" on the command line).
>>>>
>>>> Clang seems not to like it. It's always a mess to do anything for gcc
>>>> and clang :-(
>>
>> I didn't know we could build s390-ccw with clang.
>>
>> Not with clang-12:
>>
>> clang version 12.0.0 (Fedora 12.0.0-0.3.rc1.fc34)
>>
>> warning: unknown warning option '-Wold-style-declaration'; did you mean
>> '-Wout-of-line-declaration'? [-Wunknown-warning-option]
>> warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean
>> '-Wimplicit-fallthrough'? [-Wunknown-warning-option]
>> warning: unknown warning option '-Wno-stringop-overflow'; did you mean
>> '-Wno-shift-overflow'? [-Wunknown-warning-option]
>> warning: unknown warning option '-Wold-style-declaration'; did you mean
>> '-Wout-of-line-declaration'? [-Wunknown-warning-option]
>> warning: unknown warning option '-Wimplicit-fallthrough=2'; did you mean
>> '-Wimplicit-fallthrough'? [-Wunknown-warning-option]
>> warning: unknown warning option '-Wno-stringop-overflow'; did you mean
>> '-Wno-shift-overflow'? [-Wunknown-warning-option]
>> error: unknown target CPU 'z900'
>> note: valid target CPU values are: arch8, z10, arch9, z196, arch10,
>> zEC12, arch11, z13, arch12, z14, arch13, z15
> 
> Ah, I didn't know that, I just tried the unknown -Wno-yadayadayada :-)


We can of course discuss if we compile the BIOS for z10 instead of z900. TCG
in the mean time can handle up to z13 and z10 is now also 13 years old.

