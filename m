Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C95756E40BE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 09:23:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poJAs-0007P2-Jx; Mon, 17 Apr 2023 03:21:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJAq-0007Of-Ly; Mon, 17 Apr 2023 03:21:16 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1poJAo-0006Aw-GT; Mon, 17 Apr 2023 03:21:15 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33H5VDNV001453; Mon, 17 Apr 2023 07:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bu5fwAnLewinJ808kDcKM9EqiaL3u2GndKNKJM5gTHk=;
 b=WiI0hxiOLlbq+Y08NCDaVnHH5rVjQ1LVPZZYAmeTbnTNBEgzvs97OuClBCbz9piDyai7
 Q83nJJHFg8ROSu0PnYbEz5VKE2jaRya3sjryMjpwblujOoq4ViWYdBdAzdbjfu0NY+Wf
 kDweAyV9x/OIdkDkW2JYPNrSpcxdtWn8z4uBOn++VCEuTKG4HhNOcY/UkSlhqvnViuXW
 MkNwAi2GC5NS+C21qwBOtWt8klQxx+94GV9XyC9FVTUrVmoztAFAN4dT4gGWHUgp7RBK
 vlVGNi/F/D12qWxdZMRqW0DMjWW/Au/Ug3Z5MAqOc6CL3DHtXAJ1bstjTBN/t0M+XJnW ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0df03xdq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:21:12 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33H7BbPI006838;
 Mon, 17 Apr 2023 07:21:11 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q0df03xdd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:21:11 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33H57Pqg003686;
 Mon, 17 Apr 2023 07:21:10 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
 by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pykj7m4ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Apr 2023 07:21:10 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33H7L9LP17367770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Apr 2023 07:21:09 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E999558043;
 Mon, 17 Apr 2023 07:21:08 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89D465805D;
 Mon, 17 Apr 2023 07:21:06 +0000 (GMT)
Received: from [9.109.242.129] (unknown [9.109.242.129])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 17 Apr 2023 07:21:06 +0000 (GMT)
Message-ID: <a8219d9f-a212-b29e-7e83-2415f20e3144@linux.ibm.com>
Date: Mon, 17 Apr 2023 12:51:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] Cleanup [h_enter|spapr_exit]_nested routines
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, danielhb413@gmail.com
References: <20230331065344.112341-1-harshpb@linux.ibm.com>
 <87mt3aisaz.fsf@suse.de>
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
In-Reply-To: <87mt3aisaz.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hBOtBaNEgVsApfexIu2DMXojLG8Tiu70
X-Proofpoint-GUID: 0z2T3naUouUdWGQyR6cAEU4v0QyxvZ4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_04,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=601 adultscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.976, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 4/14/23 17:34, Fabiano Rosas wrote:
> Harsh Prateek Bora <harshpb@linux.ibm.com> writes:
> 
>> This patchset introduces helper routines to enable (and does) cleaning
>> up of h_enter_nested() and spapr_exit_nested() routines in existing api
>> for nested virtualization on Power/SPAPR for better code readability /
>> maintenance. No functional changes intended with this patchset.
> 
> Do we have tests for this nested virtual hypervisor code? It would be
> good to have at least a smoke test. I remember someone started adding
> support to qemu-ppc-boot, probably Murilo. I suggest you take a look
> around and maybe see what it takes to add it.
> 
> Just a L0 TCG with a small-ish qemu inside of it and a script to start
> an L2.
> 

This is something I already have in my to-do list, taking a note of your 
suggestions.

Thanks
Harsh

>>
>> Harsh Prateek Bora (5):
>>    ppc: spapr: cleanup cr get/store with helper routines.
>>    ppc: spapr: cleanup h_enter_nested() with helper routines.
>>    ppc: spapr: assert early rather late in h_enter_nested()
>>    ppc: spapr: cleanup spapr_exit_nested() with helper routines.
>>    MAINTAINERS: Adding myself in the list for ppc/spapr
>>
>>   MAINTAINERS          |   1 +
>>   hw/ppc/spapr_hcall.c | 251 ++++++++++++++++++++++++-------------------
>>   target/ppc/cpu.c     |  17 +++
>>   target/ppc/cpu.h     |   2 +
>>   4 files changed, 161 insertions(+), 110 deletions(-)

