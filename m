Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F1C6D9977
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 16:20:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkQSF-0004fm-Nm; Thu, 06 Apr 2023 10:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkQSC-0004fE-WC
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:19:09 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkQS8-0001nT-4M
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 10:19:08 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336EDHdW028314; Thu, 6 Apr 2023 14:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=uSiDzvKYy8Nv2ZbBEpQvFyXCAPoy/2DBiRh5GkyHJpA=;
 b=dgzpMbH/3ikvvOZjIOobUqxYGnYkOOO391dGjaXHYzhBd6kFRPEQfGIieCRhQtugEcSA
 5VE20dQ4VTwbDGSXa0xU00ejeLim/47IC3tLdNVQ+wlUFocFEzLUdSp0WrZWYFyD5QhP
 /SJre5cUW6NxYMgtdLn7gEelL5Sf5OjUhLcayi2NKVqQPlzYamkbRMiO8iuMZ3DPDFsK
 HCKdFVhGrtJHILSemk2diZboaorUlqkvcBOdIhgZYN4AsDPRbHxSkPE7ayH/RUgxYyCC
 g9EJ3rkV1+5U87iy+YyyIlw8LC2Cu+XA6+N2+/Cm4GrPCteubI8r5jzRtqQgJWTmG0NC Lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ps9bv0yna-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:19:00 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336E6EI4007559;
 Thu, 6 Apr 2023 14:19:00 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ps9bv0ym7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:18:59 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3367nZsT009506;
 Thu, 6 Apr 2023 14:18:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ppbvfu9qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 14:18:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336EItCw27656810
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 14:18:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 321B12004B;
 Thu,  6 Apr 2023 14:18:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DCC1C2004E;
 Thu,  6 Apr 2023 14:18:54 +0000 (GMT)
Received: from [9.171.86.230] (unknown [9.171.86.230])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 14:18:54 +0000 (GMT)
Message-ID: <242c0b57-214c-013e-e6f7-9dde77ad5942@linux.ibm.com>
Date: Thu, 6 Apr 2023 16:18:54 +0200
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
X-Proofpoint-GUID: CTypRymZ1fxFyZmMcRhfxTicOYGlMuSy
X-Proofpoint-ORIG-GUID: mVoTZIbBgg5WQQJBDDw1hD-DDN6FlVW6
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_07,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060124
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

Looks like the team is looking into some storage delays at the moment.
So it would be good to get some numbers for io wait and steal on the
next run to see if this is related to storage or CPU consumption.
Maybe collect /proc/stat before and after a run. Or login and use top.

