Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07E367064
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 18:43:28 +0200 (CEST)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZFwl-00048d-J3
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 12:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZFra-0001Se-C8; Wed, 21 Apr 2021 12:38:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24940
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lZFrX-0008N8-Rf; Wed, 21 Apr 2021 12:38:06 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LGY0cg083360; Wed, 21 Apr 2021 12:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ApxOjLRm1Xc9pCH9fgZqdi6sUlReINCRc0sjnUbGgnU=;
 b=ovb+qdaBxy7Sjgb0zDGrMePOA+HQus2vqZ17VJWx81s7laBjR+ITBccYjrUREFGVkKPx
 Cv7dYK5xq4/XvVtMfEcn4koJOVj85JdD9yYEA2GoQOQB2f+q+Z3JduTl0u+JNsoCQCKx
 ovI6go08lquEIaxcbsx/rZIcHPXgUOssTCCw5tvDiO5y0S7xP9LaiQmKxKiry55R+PVq
 tOY2lSEY7avqBnteniV+SQlQV/cOfsOeHk4hXHPdpzXlBU/w3fDCglr/Y1w2voYReORp
 gWTOuZdQYuaNj4Zlq+Zxz4ybv275d/TcSE289A/yWmhewMTC9lwjossssTOtX9HddpWp mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 382gt8x6gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 12:37:59 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LGYq4t087043;
 Wed, 21 Apr 2021 12:37:58 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 382gt8x6fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 12:37:58 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LGWEvN008844;
 Wed, 21 Apr 2021 16:37:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37yqa8jdf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 16:37:56 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13LGbsPI26738980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 16:37:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C65254203F;
 Wed, 21 Apr 2021 16:37:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FBAB42042;
 Wed, 21 Apr 2021 16:37:54 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.22.74])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Apr 2021 16:37:54 +0000 (GMT)
Subject: Re: [PATCH] pc-bios/s390-ccw/bootmap: Silence compiler warning from
 Clang
To: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210421163331.358178-1-thuth@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <ea08454b-8eff-0f07-850b-1d0650bf47f8@de.ibm.com>
Date: Wed, 21 Apr 2021 18:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421163331.358178-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2rXA9Ta4f-tZJIOGimW1QNULWvqgw1sp
X-Proofpoint-GUID: IK38w7VgeIeXjmwsc8NVVL2ryx2YvPAA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_05:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104210120
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 21.04.21 18:33, Thomas Huth wrote:
> When compiling the s390-ccw bios with Clang, the compiler complains:
> 
>   pc-bios/s390-ccw/bootmap.c:302:9: warning: logical not is only applied
>    to the left hand side of this comparison [-Wlogical-not-parentheses]
>      if (!mbr->dev_type == DEV_TYPE_ECKD) {
>          ^              ~~
> 
> The code works (more or less by accident), since dev_type can only be
> 0 or 1, but it's better of course to use the intended != operator here
> instead.
> 
> Fixes: 5dc739f343 ("Allow booting in case the first virtio-blk disk is bad")
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>   pc-bios/s390-ccw/bootmap.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/s390-ccw/bootmap.c b/pc-bios/s390-ccw/bootmap.c
> index 44df7d16af..e4b2e5a1b0 100644
> --- a/pc-bios/s390-ccw/bootmap.c
> +++ b/pc-bios/s390-ccw/bootmap.c
> @@ -299,7 +299,7 @@ static void ipl_eckd_cdl(void)
>           sclp_print("Bad block size in zIPL section of IPL2 record.\n");
>           return;
>       }
> -    if (!mbr->dev_type == DEV_TYPE_ECKD) {
> +    if (mbr->dev_type != DEV_TYPE_ECKD) {
>           sclp_print("Non-ECKD device type in zIPL section of IPL2 record.\n");
>           return;
>       }
> 

