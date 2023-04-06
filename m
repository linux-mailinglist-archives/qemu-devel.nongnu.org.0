Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5456D972A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:44:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOyZ-0004h4-Bk; Thu, 06 Apr 2023 08:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkOyW-0004f8-GY
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:44:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkOyT-0000fy-Vw
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:44:23 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336B22Ha023421; Thu, 6 Apr 2023 12:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZcRzqlJTZjVLiVQOAEpUoIQHbfvdk8DLNxrCSWZgo/Q=;
 b=PYK4ZmROB2edYeVsYn00rs4YPRsS6R4mq8AtPh+AawuuA/WxXhjm/Amml69ncNXm5zU/
 7AqxrNp3wtKZ/0MN7VL/pcniYtsmkOeXs3SbmUVLOy1Q27glUPFiItbeocH8GzdC/DaW
 qP4wDQf70qyueRN3z9zAoq6/6Sr/yVBorP0STjf37OgMN7N8OHtzuY1TRSOIz3VywH7P
 JUW9hZc5dy6Ct6IldKunHK+KKt7lWXlhgVsqDXZJeSzjNbCLDESEg45MF6t3aN5ggPXP
 6L13cFyovDPTyzz0l+E8R9ePqgvxSeFhsXLYpFvo9aGVSBA83uV1Nim8vtOXKXTQILYu dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3tc7xj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:44:19 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336CVtqP030762;
 Thu, 6 Apr 2023 12:44:18 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3tc7ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:44:18 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3363FYQK002267;
 Thu, 6 Apr 2023 12:44:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ppc87cb9c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 12:44:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336CiDkp19202618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 12:44:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4CD32004F;
 Thu,  6 Apr 2023 12:44:13 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B2C92004B;
 Thu,  6 Apr 2023 12:44:13 +0000 (GMT)
Received: from [9.171.86.230] (unknown [9.171.86.230])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 12:44:13 +0000 (GMT)
Message-ID: <38857c4f-8a3f-909e-2517-4f094513ce99@linux.ibm.com>
Date: Thu, 6 Apr 2023 14:44:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: s390 private runner CI job timing out
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
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
 <CAFEAcA_mUb+2gXDzMoD+rOvN9y5tvPyp4QXNtPGkk0bzg1t5vA@mail.gmail.com>
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <CAFEAcA_mUb+2gXDzMoD+rOvN9y5tvPyp4QXNtPGkk0bzg1t5vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cxPob6fgpJ6IqD8f35CrXvEkhz0D6OD3
X-Proofpoint-GUID: 9KdEkUMnwodzgxss1E8D05IrA3-se5yU
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_06,2023-04-06_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060110
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



Am 06.04.23 um 14:39 schrieb Peter Maydell:
> On Thu, 6 Apr 2023 at 13:30, Thomas Huth <thuth@redhat.com> wrote:
>> The thing is: it shouldn't take that long to build QEMU and run the tests
>> here, theoretically. Some days ago, the job was finishing in 39 minutes:
>>
>>    https://gitlab.com/qemu-project/qemu/-/jobs/3973481571
>>
>> The recent run took 74 minutes:
>>
>>    https://gitlab.com/qemu-project/qemu/-/jobs/4066136770
>>
>> That's almost a factor of two! So there is definitely something strange
>> going on.
> 
> So that 39 minute run was about 22 minutes compile, 17 minutes test.
> The 74 minute run was 45 minutes compile, 30 minutes test.
> The number of compile steps in meson was pretty much the same
> (10379 vs 10384) in each case. So the most plausible conclusion
> seems like "the VM mysteriously got slower by nearly a factor of 2",
> given that the slowdown seems to affect the compile and test
> stages about equally.
> 
> The VM has been up for 44 days, so we can rule out "rebooted into
> a new kernel with some kind of perf bug".

I will ask around if we can get a higher share of the system.

