Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0976AC5A9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:39:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCvv-0003PE-OK; Mon, 06 Mar 2023 10:39:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pZCvj-0002yU-54; Mon, 06 Mar 2023 10:39:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jrossi@linux.ibm.com>)
 id 1pZCvh-00035z-5E; Mon, 06 Mar 2023 10:39:14 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326EYDnR019563; Mon, 6 Mar 2023 15:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+aPtDNou6rnMXsW/afZM+S4fOWWmBDMLVgwZsKbN110=;
 b=Wx0Eid7tKY5owO0rjkZUIPrOekxjF77R7EL/+sVQjy78FRbK1lbfLQwv4bM9zNLACw0H
 WvuEjaUXBS8DZI9XOmaZ6fME4wlftPbEm5dfSglylzWprbgorv+jaUtvXr8bH7m5oKYM
 0JWOhoPFqfPaZHlr1IC7NWtnl1aw0VxeZ7psWuVTKHuXQdGxk8Nh+wTKCodQ71dUNpq+
 yG6iuK8frPfSzA3DSsMFi/AexbXFfX95HTmQ6EwMhHv9C8dgaHXjoc6NUnZivIubRAX5
 cqQ0um5z+BC5RVg3KPOil5BxYL8tb5PIN5sO272KL+v3s7VOBynd4N/4nxqj/1OimnvH pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p513epyq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 15:39:08 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326EDtBk017119;
 Mon, 6 Mar 2023 15:39:08 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p513epypq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 15:39:08 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326DZOSf015411;
 Mon, 6 Mar 2023 15:39:07 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
 by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3p4199hccx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 15:39:07 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com
 [10.39.53.231])
 by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 326Fd5ck56689052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Mar 2023 15:39:06 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9F3458060;
 Mon,  6 Mar 2023 15:39:05 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F73558050;
 Mon,  6 Mar 2023 15:39:05 +0000 (GMT)
Received: from [9.160.121.157] (unknown [9.160.121.157])
 by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  6 Mar 2023 15:39:04 +0000 (GMT)
Message-ID: <45624698-8dc9-f14c-ee0f-e338eb254dd0@linux.ibm.com>
Date: Mon, 6 Mar 2023 10:39:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [RESEND PATCH 1/1] pc-bios: Add support for List-Directed IPL
 from ECKD DASD
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Cc: frankja@linux.ibm.com, jjherne@linux.ibm.com
References: <20230221174548.1866861-1-jrossi@linux.ibm.com>
 <20230221174548.1866861-2-jrossi@linux.ibm.com>
 <bfd4dc1e-0472-483a-1195-37b6c2ca37b4@redhat.com>
From: Jared Rossi <jrossi@linux.ibm.com>
In-Reply-To: <bfd4dc1e-0472-483a-1195-37b6c2ca37b4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: CYu2ybMGgv9OqDj6hM4zXe4ssoT5OGXv
X-Proofpoint-GUID: -3vEtV4jY4CRCPz_xXm8ptBNUqwj1UrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1011
 suspectscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060137
Received-SPF: pass client-ip=148.163.158.5; envelope-from=jrossi@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Sounds good.  Thanks Thomas.

Regards,
Jared Rossi

On 3/6/23 7:12 AM, Thomas Huth wrote:
> On 21/02/2023 18.45, jrossi@linux.ibm.com wrote:
>> From: Jared Rossi <jrossi@linux.ibm.com>
>>
>> Check for a List Directed IPL Boot Record, which would supersede the 
>> CCW type
>> entries.  If the record is valid, proceed to use the new style pointers
>> and perform LD-IPL. Each block pointer is interpreted as either an 
>> LD-IPL
>> pointer or a legacy CCW pointer depending on the type of IPL initiated.
>>
>> In either case CCW- or LD-IPL is transparent to the user and will 
>> boot the same
>> image regardless of which set of pointers is used. Because the 
>> interactive boot
>> menu is only written with the old style pointers, the menu will be 
>> disabled for
>> List Directed IPL from ECKD DASD.
>>
>> If the LD-IPL fails, retry the IPL using the CCW type pointers.
>>
>> If no LD-IPL boot record is found, simply perform CCW type IPL as usual.
>>
>> Signed-off-by: Jared Rossi <jrossi@linux.ibm.com>
>>
>> ---
>>   pc-bios/s390-ccw/bootmap.c | 157 ++++++++++++++++++++++++++++---------
>>   pc-bios/s390-ccw/bootmap.h |  30 ++++++-
>>   2 files changed, 148 insertions(+), 39 deletions(-)
>
> Ok, the patch survived my local regression testing, and it also looks 
> good enough to me for inclusion, so I'll queue it for my
> final pull request before the QEMU 8.0 soft freeze tomorrow.
>
>  Thomas
>

