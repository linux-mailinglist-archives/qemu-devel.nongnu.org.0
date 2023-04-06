Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F56D96DD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:14:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOUi-0003xL-69; Thu, 06 Apr 2023 08:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkOUg-0003xC-Es
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:13:34 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkOUe-0001ae-EQ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:13:34 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336C1vK6015416; Thu, 6 Apr 2023 12:13:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Q0FAgoWMyzpoLzKFXME+uR0hLG11eOQTKkp3Vwm/p8U=;
 b=sV5Ad+RcfOmuFU7cck8xx+XWUtsqvz4ITC1zyxIf+JzDYXwlRhXRbScuWmjuIM8Imb2b
 2HetOBL60wA0Py9Mu6D2Mn6ESdQWbtYqIZYD8cMOZsL65PXXEJfanwB5EizIHRtGUeUf
 3tZrfe5AX5owzMf5OhtbMyjTH6aRea/aRGfDXN+teD5vP7ilCEgsfJv9yeJpUfxblrwU
 HKjcgd0DVKNcpgpZOQGNBg2ggLvBoCB7Lgq6SrcfhVUZoa/aT6/YYfkCag6lydiE/yGX
 a/pyzH0Lx358l8Sbjm12c5vuFx0GPqwMVP94xLJ755wiInDZLylpde/TFb/yClIj5YHo UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3tbhck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:13:29 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336CA9oP007831;
 Thu, 6 Apr 2023 12:13:29 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3tbhc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:13:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33600Bao032282;
 Thu, 6 Apr 2023 12:13:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ppc874a5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:13:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336CDO8F49086826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 12:13:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 193D02004F;
 Thu,  6 Apr 2023 12:13:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE55620040;
 Thu,  6 Apr 2023 12:13:23 +0000 (GMT)
Received: from [9.171.86.230] (unknown [9.171.86.230])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 12:13:23 +0000 (GMT)
Message-ID: <c974308f-42a1-9163-5c4f-54bda7050ee8@linux.ibm.com>
Date: Thu, 6 Apr 2023 14:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: s390 private runner CI job timing out
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
 <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
 <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
 <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
 <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <CAFEAcA_SgAZmv8YpaR0v7iU1oMdNTAMcrcYWaqGPzHDxjSP=wQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zZR3Dc5rX3VSKndqpDPpvZm4ACjCmdUo
X-Proofpoint-GUID: KxQmyOG1OyPgEdJO8CKZR6Dl5d_mtEmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_06,2023-04-06_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060101
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



Am 06.04.23 um 14:05 schrieb Peter Maydell:
> On Thu, 6 Apr 2023 at 12:17, Christian Borntraeger
> <borntraeger@linux.ibm.com> wrote:
>>
>> Am 06.04.23 um 12:44 schrieb Peter Maydell:
>>> On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
>>> <borntraeger@linux.ibm.com> wrote:
>>>> Am 06.04.23 um 11:21 schrieb Peter Maydell:
>>>>> Christian, does our S390X machine get a guaranteed amount of CPU,
>>>>> or does it depend on what else is running on the hardware?
>>>>
>>>> I think its a shared system with shared CPUs. Can you check the steal
>>>> time in top or proc? If this is far too high we could ask to give you
>>>> more weight for that VM.
>>>
>>> It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
>>> I'll try to remember to check next time it's running a job.
>>>
>>
>> Do you have /proc/stat ?
> 
> Yes; hopefully it means more to you than it does to me :-)
> 
> linux1@qemu01:~$ cat /proc/stat
> cpu  60904459 604975 15052194 1435958176 17128179 351949 758578 22218760 0 0
> cpu0 15022535 146734 3786909 358774818 4283172 98313 237156 5894809 0 0
> cpu1 15306890 151164 3746024 358968957 4378864 85629 172492 5434255 0 0
> cpu2 15307709 157180 3762691 359141276 4138714 85736 176367 5474594 0 0
> cpu3 15267324 149895 3756569 359073124 4327428 82269 172562 5415101 0 0

This is
user,nice,system,idle,iowait,irq,softirq,steal,guest,guest_nice
So overall there is some (20-30% since the last reboot) steal going on.
Not sure if this is the real problem since it is only Ubuntu 20.04.
Does a higher timeout make the problem go away?

