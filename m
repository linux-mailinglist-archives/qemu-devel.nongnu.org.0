Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2781E31089F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:03:14 +0100 (CET)
Received: from localhost ([::1]:42968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xxJ-0000B5-NQ
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:03:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7xvi-0007y7-OD; Fri, 05 Feb 2021 05:01:34 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7xvg-0001rF-5f; Fri, 05 Feb 2021 05:01:34 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1159aoFK151811; Fri, 5 Feb 2021 05:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dD6wGWTT+CQ0bOLkZRUfJIM34wSMN/b5CU6cp7yjheU=;
 b=RuT4Nr1ersi8YajNHkapaJyAB9D6qr/fBycDnbt4upkiKm5j4H42KPn+fQrRznV/YMpd
 zTmavJQAiAJpZ2guMoqbqhWQgMLl+aZqs4JLfU1MpHQEgY26jvrqEYzM4PgFDdgpYOIx
 AGAPa8VAyqbGwTjKTTxQ833FzVyjtxWkbr4XmRwPPtvaTR3c4JWwGuW+i8eXHtMKNEt6
 PT/lMSCc2UZbygPm1EeSqbcjvB6naXsGyGmngojL+Ikw8oHUNCJHzHG4EVgBT7cGvNfe
 AUsCOFg8EmzS2eGEr0Df/zu0u4yB0i4i1mfRkmMHdTGRYyKNT4lPI5DjepegIcqJ2w37 LA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36h1e4ktex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 05:01:29 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1159axvQ152388;
 Fri, 5 Feb 2021 05:01:29 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36h1e4kte7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 05:01:29 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1159l5ZR020319;
 Fri, 5 Feb 2021 10:01:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf3dny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 10:01:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115A1Pal34865444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 10:01:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E934A404D;
 Fri,  5 Feb 2021 10:01:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C79FCA405D;
 Fri,  5 Feb 2021 10:01:24 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.76.67])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 10:01:24 +0000 (GMT)
Subject: Re: [PATCH v3] target/s390x/arch_dump: Fix warning for the name field
 in the PT_NOTE section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210205093921.848260-1-thuth@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <01b929c2-4fc0-2d12-6bdb-77f43a8b6456@de.ibm.com>
Date: Fri, 5 Feb 2021 11:01:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210205093921.848260-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_06:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102050062
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.182,
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
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05.02.21 10:39, Thomas Huth wrote:
> There is a compiler warning with GCC 9.3 when compiling with
> the -fsanitize=thread compiler flag:
> 
>  In function 'strncpy',
>     inlined from 's390x_write_elf64_notes' at ../target/s390x/arch_dump.c:219:9:
>  /usr/include/x86_64-linux-gnu/bits/string_fortified.h:106:10: error:
>   '__builtin_strncpy' specified bound 8 equals destination size
>   [-Werror=stringop-truncation]
> 
> Since the name should always be NUL-terminated, let's use g_strlcpy() to
> silence this warning. And while we're at it, also add an assert() to make
> sure that the provided names always fit the size field (which is fine for
> the current callers, the function is called once with "CORE" and once with
> "LINUX" as a name).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

> ---
>  v3: Do not touch the namesz field
> 
>  target/s390x/arch_dump.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index 50fa0ae4b6..cc1330876b 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -212,11 +212,13 @@ static int s390x_write_elf64_notes(const char *note_name,
>      int note_size;
>      int ret = -1;
>  
> +    assert(strlen(note_name) < sizeof(note.name));
> +
>      for (nf = funcs; nf->note_contents_func; nf++) {
>          memset(&note, 0, sizeof(note));
>          note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
>          note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
> -        strncpy(note.name, note_name, sizeof(note.name));
> +        g_strlcpy(note.name, note_name, sizeof(note.name));
>          (*nf->note_contents_func)(&note, cpu, id);
>  
>          note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
> 

