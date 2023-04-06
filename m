Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD036D944A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:41:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkN2z-0003We-8w; Thu, 06 Apr 2023 06:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkN2w-0003Vz-C9
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:40:50 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkN2u-0005jt-0e
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:40:50 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33696iQ2028232; Thu, 6 Apr 2023 10:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=oyFTiBHupcXAOyoz2uQRDScuG86QNvaKbBscPyj5Erc=;
 b=VrantqLvIfIQgEMPv4uaaE9LLh5QVadUB6mSx1jK2Pfwm8smDKgFHJFlnZ9Q61Ptio4U
 2VxoKv8y/DKuY1WagISVWE0H0Z/eJznAalaMizzOG0lEczp5fD9A/A2k6ueldb6GOLZi
 aBLJ6IziOPUZFDkATX2P5oG6UJVXYaQNAlycjKQ/zWNPGHuU6UN/EagtuoGTo1J0r4N7
 gZLsV+Xcv9yxHzW1aiYBmvGNdLCUIzA4R+snI/TIm6JwOHRYNspMhrIlLIugkzN1LM1/
 OsM1mgktpYsND3lF8nfReZq3+lJj4WZ0EKQDdEP7NcjEfSNWfZpztinpnhkmB79cZREI 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psaang2wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 10:40:43 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3369umlU012455;
 Thu, 6 Apr 2023 10:40:43 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psaang2vq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 10:40:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33629rHf015468;
 Thu, 6 Apr 2023 10:40:40 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ppc8747gt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 10:40:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336AebZv41812256
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 10:40:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8D022004B;
 Thu,  6 Apr 2023 10:40:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B92F20040;
 Thu,  6 Apr 2023 10:40:37 +0000 (GMT)
Received: from [9.171.86.230] (unknown [9.171.86.230])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 10:40:37 +0000 (GMT)
Message-ID: <3b5cc225-50e8-e56d-3fa8-da052a515beb@linux.ibm.com>
Date: Thu, 6 Apr 2023 12:40:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: s390 private runner CI job timing out
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <CAFEAcA_7+5tK+rM6dBgozNJmMmL7fU3MHLuvzJtb7-zWK4rMTQ@mail.gmail.com>
 <4521ce29-1d11-f253-7a7d-342f6bd9e6b0@redhat.com>
 <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <CAFEAcA_HVpYajJ5yP7+eYKNhKggtNjgFyQ_V3WqSPf4dGL=zKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rkn6Uu634dkY9yveroRMLeVK5KWocFUj
X-Proofpoint-ORIG-GUID: EmKsn-TQhbPZbeXdWXLnJnXThYgcd2xW
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_04,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060091
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.355, SPF_HELO_NONE=0.001,
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



Am 06.04.23 um 11:21 schrieb Peter Maydell:
> On Thu, 6 Apr 2023 at 07:57, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 05/04/2023 17.15, Peter Maydell wrote:
>>> The s390 private runner CI job ubuntu-20.04-s390x-all seems to have
>>> started timing out a lot recently. Here's an example where it passed,
>>> but with only 53 seconds left on the clock before it would have been
>>> killed:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/jobs/4066136770
>>>
>>> It looks like 'make check' was about 30 minutes of the 75 minutes
>>> total, and compilation was 45 minutes.
>>>
>>> Any suggestions for how we can trim this down? (Presumably we
>>> could also raise the time limit given that this is a private
>>> runner job...)
>>
>> I don't have access to that system, so I can only guess: Did you check
>> whether there are any other processes still running (leftovers from earlier
>> test runs)?
> 
> I did check for that, as it's been a problem in the past, but
> no, in this case no other jobs are running in the VM.
> 
>> If not, it's maybe because it is a VM that is running with other
>> VMs in parallel that hog the CPU? In that case, you could contact the owner
>> of the machine and ask whether there  is anything that could be done about
>> it. Or simply increase the timeout a little bit more... (our highest timeout
>> in another job is 90 minutes, so I think that would still be OK?).
> 
> Christian, does our S390X machine get a guaranteed amount of CPU,
> or does it depend on what else is running on the hardware?

I think its a shared system with shared CPUs. Can you check the steal
time in top or proc? If this is far too high we could ask to give you
more weight for that VM.

