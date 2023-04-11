Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A666DD0B7
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 06:16:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm5Pq-00051V-Pf; Tue, 11 Apr 2023 00:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pm5Pn-000512-K9; Tue, 11 Apr 2023 00:15:31 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pm5Ph-0000Ra-Rb; Tue, 11 Apr 2023 00:15:27 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B296k6031794; Tue, 11 Apr 2023 04:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ScJMg4vbpStvHpEjGPpD7sdU2vkv2D2AMnUY+uKgT/U=;
 b=sOB6cCt7Mmzs/xTDkeKDH6KHLhO45rfXXnY3v5ST1o8PH0yYqhUq9Zhveq5/yacXVSgA
 K4UjMyWrzz7gy1ef4A3mVR2DEFxt/w1XI2/9ftU8mErTGIQFGxJZSiQ3NYCghRO6EPMC
 SgjkxtOhks4bL2ugesTzvklCCqMC8Bix29/Tg2woJfyXURIBYFTyL8hMB+G/e/4XxHQ+
 +z6UWHeZt8MWS7NYg8VKo1aQgGISeUe10eG2uDfjTclYkxlDAA7Dv0gTBkQo23mHskNl
 5AYR0EjjsRscknpKsjCtJX0//xuDlAU8dEGMLB6Qu3fhg9qGf+HngaGkpae/i0xR+XkR vw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3puj1fwj3g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 04:15:14 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33B4F3iS002502;
 Tue, 11 Apr 2023 04:15:13 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3puj1fwj35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 04:15:13 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33B1Ab7A029810;
 Tue, 11 Apr 2023 04:15:13 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3pu0fqa1wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 04:15:12 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33B4FB9031130150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Apr 2023 04:15:11 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 454905805D;
 Tue, 11 Apr 2023 04:15:11 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 03BB558043;
 Tue, 11 Apr 2023 04:15:09 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 11 Apr 2023 04:15:08 +0000 (GMT)
Message-ID: <5faab28d-0abb-ed0f-929e-f6f1268d0886@linux.ibm.com>
Date: Tue, 11 Apr 2023 09:45:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <3492b914-4b11-0fe2-2e9e-a67820dac9c5@kaod.org>
 <111fdf2e-32bf-9466-d679-dc84e18c862f@gmail.com>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <111fdf2e-32bf-9466-d679-dc84e18c862f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Va-mJpH6meHDj3v2L5RN-yLPdJkSZ0CI
X-Proofpoint-GUID: I65_YCZF32c7ALx9ACTVzk5M-bl9CzY1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-10_18,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxlogscore=478 phishscore=0 clxscore=1011 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110032
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.246, SPF_HELO_NONE=0.001,
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

Hi Nick, Fabiano,

Any review comments, please?

regards,
Harsh

On 3/31/23 16:36, Daniel Henrique Barboza wrote:
> 
> 
> On 3/31/23 07:39, Cédric Le Goater wrote:
>> On 3/31/23 08:53, Harsh Prateek Bora wrote:
>>> This patchset introduces helper routines to enable (and does) cleaning
>>> up of h_enter_nested() and spapr_exit_nested() routines in existing api
>>> for nested virtualization on Power/SPAPR for better code readability /
>>> maintenance. No functional changes intended with this patchset.
>>
>> Adding Nick since he did most of this work.
> 
> 
> And also Fabiano.
> 
> 
> Daniel
> 
>>
>> C.
>>
>>
>>>
>>> Harsh Prateek Bora (5):
>>>    ppc: spapr: cleanup cr get/store with helper routines.
>>>    ppc: spapr: cleanup h_enter_nested() with helper routines.
>>>    ppc: spapr: assert early rather late in h_enter_nested()
>>>    ppc: spapr: cleanup spapr_exit_nested() with helper routines.
>>>    MAINTAINERS: Adding myself in the list for ppc/spapr
>>>
>>>   MAINTAINERS          |   1 +
>>>   hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++-------------------
>>>   target/ppc/cpu.c     |  17 +++
>>>   target/ppc/cpu.h     |   2 +
>>>   4 files changed, 161 insertions(+), 110 deletions(-)
>>>
>>

