Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3836B327
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:36:37 +0200 (CEST)
Received: from localhost ([::1]:52018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb0Tc-000820-3R
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:36:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lb0RD-0006b7-KB; Mon, 26 Apr 2021 08:34:07 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:31236
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1lb0R6-0008JW-Ab; Mon, 26 Apr 2021 08:34:07 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QCXC9m119361; Mon, 26 Apr 2021 08:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hzMJvi8jQyIGy+kMK+mfKuQOeHtmZcm0IOn5MYVNWj0=;
 b=Jx5ebKw1sXkpohnxLhjNcEJzUtsPjx52tF6VgRpNcVWgEzkpmrUcnNeoNl2UqkO9Q7ga
 8m0CpugdL6nsuvphQ2hw6LT3R4TyzR6xgPVRKklHxBkOce5KXb5uaHWg3sbtpgbHDjAi
 c0u+UXf72ioZI1Mlna4WVcIa1xIU3w+sukzHLydjy/9aQ8xaScIQua10eqbmUd+bAbC3
 zi38N2FLi1VBXFpEoI0HdrSlcMgs62kCUpkwyTreUswobQEVqF+BV1XCFUFdkK+5gj53
 6UEKA+dAI5FBhMWAJIyKdBYGzEIef7oSSmRcy9xzofr5JI+N4my6NRKcoNK+jE3X9OaJ AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 385u60d4ju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 08:33:42 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13QCXFFd119691;
 Mon, 26 Apr 2021 08:33:42 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 385u60d4j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 08:33:42 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13QCXe7P004500;
 Mon, 26 Apr 2021 12:33:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 384ay8gekk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Apr 2021 12:33:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13QCXbLW33751380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Apr 2021 12:33:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0516B5204E;
 Mon, 26 Apr 2021 12:33:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.12.8])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9B7B85204F;
 Mon, 26 Apr 2021 12:33:36 +0000 (GMT)
Subject: Re: [PATCH v2] pc-bios/s390-ccw: Use reset_psw pointer instead of
 hard-coded null pointer
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20210423142440.582188-1-thuth@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Message-ID: <0dcba8f7-6203-84b0-98fd-dc9e85cb7f05@linux.ibm.com>
Date: Mon, 26 Apr 2021 14:33:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423142440.582188-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eyMDRN_tMXlLf7TwtI2-HStrzpzww36u
X-Proofpoint-GUID: mXWO-4DLtcax7L4dA15W3Km3rED8eCAi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-26_05:2021-04-26,
 2021-04-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260096
Received-SPF: pass client-ip=148.163.158.5; envelope-from=frankja@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 4:24 PM, Thomas Huth wrote:
> When compiling the s390-ccw bios with clang, it emits a warning like this:
> 
>  pc-bios/s390-ccw/jump2ipl.c:86:9: warning: indirection of non-volatile null
>   pointer will be deleted, not trap [-Wnull-dereference]
>      if (*((uint64_t *)0) & RESET_PSW_MASK) {
>          ^~~~~~~~~~~~~~~~
>  pc-bios/s390-ccw/jump2ipl.c:86:9: note: consider using __builtin_trap() or
>   qualifying pointer with 'volatile'
> 
> We could add a "volatile" here to shut it up, but on the other hand,
> we also have a pointer variable called "reset_psw" in this file already
> that points to the PSW at address 0, so we can simply use that pointer
> variable instead.

LGTM, I'm just wondering why I didn't clean that up when I last changed
the file.

Reviewed-by: Janosch Frank <frankja@linux.ibm.com>

> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Extend comment as suggested by Cornelia
> 
>  pc-bios/s390-ccw/jump2ipl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
> index b9c70d64a5..73e4367e09 100644
> --- a/pc-bios/s390-ccw/jump2ipl.c
> +++ b/pc-bios/s390-ccw/jump2ipl.c
> @@ -82,8 +82,8 @@ void jump_to_low_kernel(void)
>          jump_to_IPL_code(KERN_IMAGE_START);
>      }
>  
> -    /* Trying to get PSW at zero address */
> -    if (*((uint64_t *)0) & RESET_PSW_MASK) {
> +    /* Trying to get PSW at zero address (pointed to by reset_psw) */
> +    if (*reset_psw & RESET_PSW_MASK) {
>          /*
>           * Surely nobody will try running directly from lowcore, so
>           * let's use 0 as an indication that we want to load the reset
> 


