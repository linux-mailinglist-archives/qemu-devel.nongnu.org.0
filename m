Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D4F33A013
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 19:51:23 +0100 (CET)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL9MA-0005fv-Hp
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 13:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lL9LD-0005AG-Rd; Sat, 13 Mar 2021 13:50:23 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:38718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lL9LB-000053-Tn; Sat, 13 Mar 2021 13:50:23 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12DIY5wK116035; Sat, 13 Mar 2021 13:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gTj1KzChISs3MWqEjAnhESCrXoLCz/IvMFtk7NkINzw=;
 b=rHi5QD3VRQljroNColOxeIBROmXZE248wswJ0u4ZKH46aM6Iz+HHPwYg+xBs5GoTDb4q
 35PQjT58F/7gABfCbgJZUVxsj9CWn+xb5uq1PKXYiynpuQyo+tg01Iyy6nzMgPhkfxcS
 J/ivtswa8osEltl0JaO+SpwD/uzPPAV5wUvEJ5kS1lmepKo9G92H4ALRG6SWCsivY9/N
 5K714A8baHd2HkbEavu1Wq2q5wTAuciJvkQtaXnInIEvm3PPes7oJWKI3WJVvEmlKv0E
 CxQunaUHRZLKLQFnRukF/ZlOiS6IOy+ErT5RiSjlDvbS98/A4MJZrxTvebYDHhfIgTbZ lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 378q5qc0kq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Mar 2021 13:50:17 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12DIoCv2021569;
 Sat, 13 Mar 2021 13:50:16 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 378q5qc0k5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Mar 2021 13:50:16 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12DIlhf9009587;
 Sat, 13 Mar 2021 18:50:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 378n18gfaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 13 Mar 2021 18:50:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12DIoCCO40763690
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 13 Mar 2021 18:50:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 411A8AE045;
 Sat, 13 Mar 2021 18:50:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F9EFAE04D;
 Sat, 13 Mar 2021 18:50:11 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.14.195])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 13 Mar 2021 18:50:11 +0000 (GMT)
Subject: Re: [PATCH 4/9] pc-bios/s390-ccw/netmain.c: Changed a malloc/free to
 GLib's variants
To: Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-devel@nongnu.org
References: <20210313163653.37089-1-ma.mandourr@gmail.com>
 <20210313163653.37089-5-ma.mandourr@gmail.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <04476a7d-5c6f-3f17-834c-cc0cebfc5c18@de.ibm.com>
Date: Sat, 13 Mar 2021 19:50:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210313163653.37089-5-ma.mandourr@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-13_06:2021-03-12,
 2021-03-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103130145
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 "open list:S390-ccw boot" <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.03.21 17:36, Mahmoud Mandour wrote:
> Changed a call to malloc() and its respective calls free() with
> GLib's allocation and deallocation functions.
> 
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>

Nack.

This is BIOS code and it does not have glib.


> ---
>   pc-bios/s390-ccw/netmain.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c
> index 056e93a818..7f78150144 100644
> --- a/pc-bios/s390-ccw/netmain.c
> +++ b/pc-bios/s390-ccw/netmain.c
> @@ -243,7 +243,7 @@ static const char *get_uuid(void)
>       int i, cc, chk = 0;
>       static char uuid_str[37];
>   
> -    mem = malloc(2 * PAGE_SIZE);
> +    mem = g_try_malloc(2 * PAGE_SIZE);
>       if (!mem) {
>           puts("Out of memory ... can not get UUID.");
>           return NULL;
> @@ -261,7 +261,7 @@ static const char *get_uuid(void)
>                    : "d" (r0), "d" (r1), [addr] "a" (buf)
>                    : "cc", "memory");
>       if (cc) {
> -        free(mem);
> +        g_free(mem);
>           return NULL;
>       }
>   
> @@ -269,7 +269,7 @@ static const char *get_uuid(void)
>           uuid[i] = buf[STSI322_VMDB_UUID_OFFSET + i];
>           chk |= uuid[i];
>       }
> -    free(mem);
> +    g_free(mem);
>       if (!chk) {
>           return NULL;
>       }
> 

