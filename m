Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F9646330
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 22:22:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p31qq-0000N6-94; Wed, 07 Dec 2022 16:21:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p31qk-0000Mu-E6
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 16:21:06 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@linux.ibm.com>)
 id 1p31qg-0001xf-45
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 16:21:06 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7KWowI031774; Wed, 7 Dec 2022 21:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=d9SKEyaLZ+th/vZgOR5qxHfbhL2Laz3TLZM9/WtvDG0=;
 b=o972Wfgj23+raI+jeS8kJ5PRp+HeBuHUw7a3JjIu+DMfG8OlGfIrQPKj81T3ySDOcwFY
 sK/aZZM7cyjmTWdwm7Cc4GEVoaXV3X0i4+gvXA3yavdhY7EwGisdlAN+sHieNeqGwqEL
 Zf7zoc5/da1FGL4ChRvmtKTwIPIcZ3xsFSAHT3CZF0QRPtMu4T7dMDAiU/4TtY2pp843
 3e6Q7RXtdC1GHBZFtJoO8xlow1TNxwnNR6HmircQIa1anTCJ9YxM/cv6lUprQSODj61X
 vXILvatYPWw8L5Ft3AiZdSKUi9rEx+Iqw1972l13JDVLUYpwVF8IHB+tV8Qt5NzTMGhy lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb1ya8xea-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 21:20:59 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7KbYYh013447;
 Wed, 7 Dec 2022 21:20:58 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mb1ya8xdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 21:20:58 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7HHUgG027312;
 Wed, 7 Dec 2022 21:20:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks43fsx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Dec 2022 21:20:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2B7LKsHx17498598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Dec 2022 21:20:54 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52E0820043;
 Wed,  7 Dec 2022 21:20:54 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AE7220040;
 Wed,  7 Dec 2022 21:20:54 +0000 (GMT)
Received: from [9.179.1.254] (unknown [9.179.1.254])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Wed,  7 Dec 2022 21:20:53 +0000 (GMT)
Message-ID: <487eca32-6d32-4f9e-a580-e528822d5e97@linux.ibm.com>
Date: Wed, 7 Dec 2022 22:20:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 02/13] tcg/s390x: Remove TCG_REG_TB
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20221202065200.224537-1-richard.henderson@linaro.org>
 <20221202065200.224537-3-richard.henderson@linaro.org>
 <20221206192947.fi6c3ftrueuiqmch@heavy>
 <8a3965f7-f830-6343-be15-4e16b20655fd@linaro.org>
 <f035fe38-44ed-6045-b948-d5fcd0dfafd7@redhat.com>
 <3ab2945a-c54b-d806-0316-efcf26c91814@linaro.org>
 <1fdded318cbe47fb03b6b476b294afc75bf17d09.camel@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <1fdded318cbe47fb03b6b476b294afc75bf17d09.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6WCRuyuim6QloNXirMYHMVBVaNFqrcVJ
X-Proofpoint-ORIG-GUID: AUkkYcg7vtDf_hfWVvcZ5SYALMuZ67pZ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_10,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070177
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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



Am 07.12.22 um 21:40 schrieb Ilya Leoshkevich:
> On Wed, 2022-12-07 at 08:55 -0600, Richard Henderson wrote:
>> On 12/7/22 01:45, Thomas Huth wrote:
>>> On 06/12/2022 23.22, Richard Henderson wrote:
>>>> On 12/6/22 13:29, Ilya Leoshkevich wrote:
>>>>> This change doesn't seem to affect that, but what is the
>>>>> minimum
>>>>> supported s390x qemu host? z900?
>>>>
>>>> Possibly z990, if I'm reading the gcc processor_flags_table[]
>>>> correctly;
>>>> long-displacement-facility is definitely a minimum.
>>>>
>>>> We probably should revisit what the minimum for TCG should be,
>>>> assert those features at
>>>> startup, and drop the corresponding runtime tests.
>>>
>>> If we consider the official IBM support statement:
>>>
>>> https://www.ibm.com/support/pages/system/files/inline-files/IBM%20Mainframe%20Life%20Cycle%20History%20V2.10%20-%20Sept%2013%202022_1.pdf
>>>
>>> ... that would mean that the z10 and all older machines are not
>>> supported anymore.
>>
>> Thanks for the pointer.  It would appear that z114 exits support at
>> the end of this month,
>> which would leave z12 as minimum supported cpu.
>>
>> Even assuming z196 gets us extended-immediate, general-insn-
>> extension, load-on-condition,
>> and distinct-operands, which are all quite important to TCG, and
>> constitute almost all of
>> the current runtime checks.
>>
>> The other metric would be matching the set of supported cpus from the
>> set of supported os
>> distributions, but I would be ready to believe z196 is below the
>> minimum there too.
>>
>>
>> r~
> 
> I think it should be safe to raise the minimum required hardware for
> TCG to z196:

We recently raised the minimum hardware for the Linux kernel to be z10, so that would be super-safe, but z196 is certainly a sane minimum.
> 
> * The oldest supported RHEL is v7, it requires z196:
> 
> https://access.redhat.com/product-life-cycles/
> https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/chap-installation-planning-s390
> 
> * The oldest supported SLES is v12, it requires z196:
> 
> https://www.suse.com/de-de/lifecycle/
> https://documentation.suse.com/sles/12-SP5/html/SLES-all/cha-zseries.html
> 
> * The oldest supported Ubuntu is v16.04, it requires zEC12+:
> https://wiki.ubuntu.com/S390X
> 
> Best regards,
> Ilya

