Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 804BD30FA37
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:53:08 +0100 (CET)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ioV-0000Re-G9
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7hzW-0007Zh-BR; Thu, 04 Feb 2021 12:00:26 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1l7hzT-00051K-A5; Thu, 04 Feb 2021 12:00:26 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114Gh4E8074759; Thu, 4 Feb 2021 12:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fPfiVUjrlVKGwzFG6nrCPeFcEdBPy8sajRCmqU91TOw=;
 b=d7P13QgyXHnA8noqcfLhKPzhmhjVdlHYXNbS7hHRFlAO5iRsHPs/gCsXEMnq4KyoPFKM
 yWPpnlNUhUNySkaGf/+T6xfz+H/bSb2dfGBNB2jrshvqklHP0qp1CNswjNWJe8a0SJaK
 pwxKqD/fXXlzrCvRiogt/Lzh5wIYzwMqTe89C0rV6bArITUyD6Hoalohr/4ZpxDeI/du
 fHgNHy/jHqua070KOlaxvOeX7fU4GV1SXaB9ISn1ZCLnPJFKlg/rvgDU5efvdSzsT1pv
 ZLrHlibquIL2E12ESjzlMGmRv05SnAHYKR7+9n6+sR2cB4pTgztxsDx6+5VqsbbgI9Us OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gmpmgdct-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 12:00:16 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114GhPKJ075490;
 Thu, 4 Feb 2021 12:00:16 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gmpmgdaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 12:00:16 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114GqhhW024405;
 Thu, 4 Feb 2021 17:00:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 36evvf2rw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 17:00:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114H0BsM48627978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 17:00:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C52342042;
 Thu,  4 Feb 2021 17:00:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE8D54204C;
 Thu,  4 Feb 2021 17:00:10 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.171.45.97])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 17:00:10 +0000 (GMT)
Subject: Re: [PATCH v2] target/s390x/arch_dump: Fixes for the name field in
 the PT_NOTE section
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>
References: <20210204164117.721110-1-thuth@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <8674a570-93f7-24dc-10b8-0c3577c0841f@de.ibm.com>
Date: Thu, 4 Feb 2021 18:00:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204164117.721110-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_08:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040100
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
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

On 04.02.21 17:41, Thomas Huth wrote:
> According to the "ELF-64 Object File Format" specification:
> 
> "The first word in the entry, namesz, identifies the length, in
>  bytes, of a name identifying the entry’s owner or originator. The name field
>  contains a null-terminated string, with padding as necessary to ensure 8-
>  byte alignment for the descriptor field. The length does not include the
>  terminating null or the padding."
> 
> So we should not include the terminating NUL in the length field here.
> 
> Also there is a compiler warning with GCC 9.3 when compiling with
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
> ---
>  v2: Use g_strlcpy instead of strncpy


With this patch I do get

WARNING: possibly corrupt Elf64_Nhdr: n_namesz: 0 n_descsz: 4 n_type: 88

when running crash on the elf file created by dump-guest-memory. Without the
patch everything is fine. 

> 
>  target/s390x/arch_dump.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index 50fa0ae4b6..f205123834 100644
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
> -        note.hdr.n_namesz = cpu_to_be32(strlen(note_name) + 1);
> +        note.hdr.n_namesz = cpu_to_be32(strlen(note_name));
>          note.hdr.n_descsz = cpu_to_be32(nf->contents_size);
> -        strncpy(note.name, note_name, sizeof(note.name));
> +        g_strlcpy(note.name, note_name, sizeof(note.name));
>          (*nf->note_contents_func)(&note, cpu, id);
>  
>          note_size = sizeof(note) - sizeof(note.contents) + nf->contents_size;
> 

