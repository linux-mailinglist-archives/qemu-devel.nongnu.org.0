Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D096D96B4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:04:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkNcw-0003NF-Sx; Thu, 06 Apr 2023 07:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkNcr-0003MM-1t
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:17:58 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1pkNcp-0005vz-2k
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 07:17:56 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336B22Bh023397; Thu, 6 Apr 2023 11:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cIWmYya6neEBmOKChhQ2FelfK4rk/R5f9ZHTODpYxb0=;
 b=X/k37cNoSvoTZ2FzkM5+FeUkcgi3xsozcJIi2x3CcBiRTtv4U3PldgUTWz4U2OpVtOzp
 t28EKnuHjrNrkMQpH3wnn5SqQ5UPwstqnWJpJeFQPDp9AwZYfwJgWgGBVIqDhgXiryuL
 EvgxUH2CzWSVktsnxk+hM2VgwArT4bcQh1bDzRfN5jLg26aVeGlhALq3UXQu+FCnZQaP
 7dB/2CngRq3p+ILDcS9YN8ak3LvXAhPZkJ7u2bAFIHrMzIJjh8wUXFVQZN24gQXAorNs
 lAWahrDzPBYFX4nuTBDiHwmp125uw6vNMGUmMU7iKfZ0M1rmCumSmf+aBMaGco+rCv6q sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3taht2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 11:17:51 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 336BC8Hi027041;
 Thu, 6 Apr 2023 11:17:51 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3tahrv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 11:17:51 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33681rWP031340;
 Thu, 6 Apr 2023 11:17:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
 by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3ppc86u6mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 11:17:48 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 336BHkoH20316772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Apr 2023 11:17:46 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5070F2004E;
 Thu,  6 Apr 2023 11:17:46 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECED620040;
 Thu,  6 Apr 2023 11:17:45 +0000 (GMT)
Received: from [9.171.86.230] (unknown [9.171.86.230])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  6 Apr 2023 11:17:45 +0000 (GMT)
Message-ID: <149e9342-b48b-0871-ee4d-96c6f1d3f198@linux.ibm.com>
Date: Thu, 6 Apr 2023 13:17:45 +0200
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
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <CAFEAcA_Uh+20w1gnCBXe6Go9WqkUu+SUeRtsrrbwEO4j48OjGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pP3WXAYalYwcpuDBQX3SbmyhiBsUqeUJ
X-Proofpoint-GUID: lGF1tqh9o6AhmZ46SfCt8QGqI8uIiI7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_05,2023-04-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=894 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060096
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

Am 06.04.23 um 12:44 schrieb Peter Maydell:
> On Thu, 6 Apr 2023 at 11:40, Christian Borntraeger
> <borntraeger@linux.ibm.com> wrote:
>> Am 06.04.23 um 11:21 schrieb Peter Maydell:
>>> Christian, does our S390X machine get a guaranteed amount of CPU,
>>> or does it depend on what else is running on the hardware?
>>
>> I think its a shared system with shared CPUs. Can you check the steal
>> time in top or proc? If this is far too high we could ask to give you
>> more weight for that VM.
> 
> It's idle at the moment and steal time seems to be low (0.0 .. 0.3);
> I'll try to remember to check next time it's running a job.
> 

Do you have /proc/stat ?

