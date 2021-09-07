Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E556402647
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:40:49 +0200 (CEST)
Received: from localhost ([::1]:60124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXax-0002fy-0n
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:40:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXZc-0001n1-9b; Tue, 07 Sep 2021 05:39:24 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1mNXZZ-0000Mu-HA; Tue, 07 Sep 2021 05:39:23 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1879Ydni126449; Tue, 7 Sep 2021 05:39:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MIu9CunbPurpPwBLMkxCYVykGoJ81knm68Nr1UoMMZo=;
 b=djcntEDfy3zXvUyCm0aDC426Stc2gMM5+L+sb0rlnebeYs4ubR/NafoqRp9fBM4YwPhJ
 alPz3fanfk551w+Sv2+X4ZfnF7fai33VpOlcQoA1ZrXlb3XY0QWuj/LB85fFkw4qf2fq
 DYRwxD1edJCxDJ9JVwQ3CmzPX15VQQ9qppbrkWR/UgwtZYpi6E263srTAKwzcNHqmZdY
 cz92VsOwkk+t03WlA6V9Rqpfo8nfC051YcYWX0PkBrS+5udnQ9IGrpoiF3QilnlZgQM3
 vcZHF0mIHlZ0Fguk28Ex0GpPrGcIjrAQD/kiuf43V0v/qzdzHyTkGknP1HMnqkJLHNaE 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax2drvxbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:39:18 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1879Ygd8126684;
 Tue, 7 Sep 2021 05:39:17 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ax2drvxap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 05:39:17 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1879c4Cj013280;
 Tue, 7 Sep 2021 09:39:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3av0e9d5nk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Sep 2021 09:39:15 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1879YxJI41091458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Sep 2021 09:34:59 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6BD7AE045;
 Tue,  7 Sep 2021 09:39:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2D06AE056;
 Tue,  7 Sep 2021 09:39:11 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.9.165])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Sep 2021 09:39:11 +0000 (GMT)
Subject: Re: [PATCH v2 4/5] s390x: topology: Topology list entries and SYSIB
 15.x.x
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
 <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
 <ecf79a25-c5c4-a39c-5f77-56af17f26728@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Message-ID: <21787fcd-a665-d415-1a31-99f135b2557e@linux.ibm.com>
Date: Tue, 7 Sep 2021 11:39:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ecf79a25-c5c4-a39c-5f77-56af17f26728@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gxFcGeuw9Noywg8gtilMYh-kXRHigkeX
X-Proofpoint-ORIG-GUID: VsNCFpDiBwQYscAu7l1uMXG9HewBgL15
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_03:2021-09-03,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070063
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/7/21 9:46 AM, Thomas Huth wrote:
> On 22/07/2021 19.42, Pierre Morel wrote:
>> We define the CPU type Topology List Entry and the
>> Container type Topology List Entry to implement SYSIB 15.1.x
>>
>> This patch will be squatched with the next patch.
> 
> s/squatched/squashed/
> 
> ... anyway, why did you sent it separately?
> 

I thought it would be easier to review.
I will squash it next.

thanks,
Pierre

-- 
Pierre Morel
IBM Lab Boeblingen

