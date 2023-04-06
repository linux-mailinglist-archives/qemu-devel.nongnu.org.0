Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6C96D9727
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:43:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOwn-0003z2-TO; Thu, 06 Apr 2023 08:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkOwm-0003yt-8z
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:42:36 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkOwk-0008Re-64
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:42:36 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336B2xgu017902; Thu, 6 Apr 2023 12:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=CHXALpir2vk2n6+zGshv/+yP2mFMFCrVsGWZYET5UdM=;
 b=NPLEvKugQSrSDZ2l5ewQV9g3wVDVDaSf2zzV041xlpaP/XELw36rBL1MmTSB8ALHwabs
 elWNHyD2s2x2za3pIPEYaAuIDx76058OTNHhHR8vFRp4wuEBs7YOq4d5xvOg5jxjg8zQ
 oTBXRYq6J5IRFsrmHGl4kskej2gU75OUZH/JmlJD0DnFFN8waoPX7lT6st4+lPelM6dL
 UlE8NBmdGIn0bK8Q8JzGG8gS336ckOOAqTORe8asEqbShlvsfiGhG/l6loH3q+dZprdf
 fA3HK/fP/6La58k6lMYrW3O8czg8VlfeU2ilCf/A5mPhWDV5lnzzZat9erB7WDApRfnU vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psayrtypt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:42:30 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336AhvwA005414;
 Thu, 6 Apr 2023 12:42:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psayrtynw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:42:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3362uPGP015677;
 Thu, 6 Apr 2023 12:42:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ppc87cb8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:42:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336CgPNM49414882
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 12:42:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C7E62004B;
 Thu,  6 Apr 2023 12:42:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2B9120040;
 Thu,  6 Apr 2023 12:42:24 +0000 (GMT)
Received: from [9.171.86.230] (unknown [9.171.86.230])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 12:42:24 +0000 (GMT)
Message-ID: <f8765cb0-1faf-9848-1d33-3d8fc348fa63@linux.ibm.com>
Date: Thu, 6 Apr 2023 14:42:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: s390 private runner CI job timing out
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
 <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
 <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
 <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
 <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
 <2e529c06-199f-6d5a-a75b-5b88aae44b2c@redhat.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <2e529c06-199f-6d5a-a75b-5b88aae44b2c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XpTd5TlXi4NzRWMbX_hzcSVUy-SrKSPF
X-Proofpoint-GUID: 3NgVQdzpFj9XDWPlId4ct5hY_hViu1we
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_06,2023-04-06_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060110
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 06.04.23 um 14:30 schrieb Thomas Huth:
> On 06/04/2023 14.13, Christian Borntraeger wrote:
>>
>>
>> Am 06.04.23 um 14:05 schrieb Peter Maydell:
>>> On Thu, 6 Apr 2023 at 12:17, Christian Borntraeger
>>> <borntraeger@linux.ibm.com> wrote:
>>>>
>>>> Am 06.04.23 um 12:44 schrieb Peter Maydell:
>>>>> On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
>>>>> <borntraeger@linux.ibm.com> wrote:
>>>>>> Am 06.04.23 um 11:21 schrieb Peter Maydell:
>>>>>>> Christian, does our S390X machine get a guaranteed amount of CPU,
>>>>>>> or does it depend on what else is running on the hardware?
>>>>>>
>>>>>> I think its a shared system with shared CPUs. Can you check the steal
>>>>>> time in top or proc? If this is far too high we could ask to give you
>>>>>> more weight for that VM.
>>>>>
>>>>> It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
>>>>> I'll try to remember to check next time it's running a job.
>>>>>
>>>>
>>>> Do you have /proc/stat ?
>>>
>>> Yes; hopefully it means more to you than it does to me :-)
>>>
>>> linux1@qemu01:~$ cat /proc/stat
>>> cpu  60904459 604975 15052194 1435958176 17128179 351949 758578 22218760 0 0
>>> cpu0 15022535 146734 3786909 358774818 4283172 98313 237156 5894809 0 0
>>> cpu1 15306890 151164 3746024 358968957 4378864 85629 172492 5434255 0 0
>>> cpu2 15307709 157180 3762691 359141276 4138714 85736 176367 5474594 0 0
>>> cpu3 15267324 149895 3756569 359073124 4327428 82269 172562 5415101 0 0
>>
>> This is
>> user,nice,system,idle,iowait,irq,softirq,steal,guest,guest_nice
>> So overall there is some (20-30% since the last reboot) steal going on.
>> Not sure if this is the real problem since it is only Ubuntu 20.04.
>> Does a higher timeout make the problem go away?
> 
> The thing is: it shouldn't take that long to build QEMU and run the tests here, theoretically. Some days ago, the job was finishing in 39 minutes:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/3973481571
> 
> The recent run took 74 minutes:
> 
>   https://gitlab.com/qemu-project/qemu/-/jobs/4066136770
> 
> That's almost a factor of two! So there is definitely something strange going on.

But this has 786 instead of 659 tests, no?

