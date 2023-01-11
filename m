Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B4A665C0D
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 14:02:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFajT-0004yE-JU; Wed, 11 Jan 2023 08:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFaiW-0004ta-1I
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:00:34 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1pFaiT-00068a-CX
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 08:00:31 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BC8WAl029031; Wed, 11 Jan 2023 13:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vWs1YgZX8YFTrP/af8qC2x27GLw3NpP5OnBSNfIiggo=;
 b=AxHMRBhosiSxXXCOz2XXatbhkT5JTLgL1/dQQt5mxA3IbFrGIA+e93ffWP+VKR1uJU9m
 sjnMmtIxj8xCU7jUPuynpZNBrZInfSuHo8gV9iknJKVRg6147lfPXvaeiGXoVzL5vQM3
 Dq34T9Uwstn2b2Em1uoKxSRrvGiM3XVf2RaEGGVK4sN1FrQbCNdyz2DkyI6PYaoaI6fW
 Nral4G7mOcbHYwAH7heIJo4drLBRtlO/nYsSEA0O0AYpIrFubvJTN4azA7kFAolqV0qW
 8g0zelBfF7ieksarHAEoJBqF42q3taUHcvVbUq9AljsJQtkYtHmhNJ4l3/k7n29JG8G6 Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1tsa3r9h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:00:25 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30BCOMXu032492;
 Wed, 11 Jan 2023 13:00:25 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n1tsa3r8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:00:25 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30BAr7Km029122;
 Wed, 11 Jan 2023 13:00:23 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
 by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3n1m0339tx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 13:00:23 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 30BD0Mkx31326504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Jan 2023 13:00:22 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20E5C58043;
 Wed, 11 Jan 2023 13:00:22 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49C6458063;
 Wed, 11 Jan 2023 13:00:21 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Wed, 11 Jan 2023 13:00:21 +0000 (GMT)
Message-ID: <0b5e0b81-653a-9d89-a79a-278f1cc1e5c4@linux.ibm.com>
Date: Wed, 11 Jan 2023 08:00:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
 <f1da5e4a-82ef-6da5-8669-634664c5d1e0@linux.ibm.com>
 <Y728JSBMRtdl1VUK@redhat.com>
 <410f90dd-4ad1-2294-f1b3-9c7f9aeba113@linux.ibm.com>
 <6a0957eb-6108-82ac-675a-fc20de94a2e0@linux.ibm.com>
 <Y7576DXofEJC24q6@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <Y7576DXofEJC24q6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R8wEI1NyPIzncAHJMzOEJ3bCLl4NkiPp
X-Proofpoint-GUID: aa-33J3THwrniNAfDSUe0TX175sU2JqQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_05,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 suspectscore=0 mlxlogscore=744 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301110092
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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



On 1/11/23 04:05, Daniel P. Berrangé wrote:
> On Tue, Jan 10, 2023 at 05:02:58PM -0500, Stefan Berger wrote:
>>
>>

>>>
>>> Yes, my ppc64 machine is also little endian. If the issue  was not an intermittent but a permanent
>>> failure I would look for something like that. I would think it's more some sort of initialization
>>> issue, like a value on the stack that occasionally set to an undesirable value -- maybe even in a
>>> dependency.
>>
>> I found I still had access to an s390x machine. ~2700 loops on this test case
>> so far but nothing... it would be good to be able to recreate the issue and
>> apply the fix but we'll have to do it without testing then I guess.

I just stopped the tests after looping for ~37000 times. No hang here.

    Stefan

