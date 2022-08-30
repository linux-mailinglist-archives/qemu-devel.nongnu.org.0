Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B625A6223
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 13:39:32 +0200 (CEST)
Received: from localhost ([::1]:55920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSzaa-0004Uo-RS
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 07:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oSzXM-0002Tu-UH; Tue, 30 Aug 2022 07:36:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <seiden@linux.ibm.com>)
 id 1oSzXI-0008My-Fj; Tue, 30 Aug 2022 07:36:08 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27UBXXUZ037013;
 Tue, 30 Aug 2022 11:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YQOv79ziGLCd9MIgcfhiht/7vytlHD+5DeTeNtiaiGw=;
 b=c+BLGRLYJOi+q2GNXLLfPI3M1tJbpTXKMewDib9afwYq7U9p/HAR5RHnIjMdV2BEn+mE
 wwa0osmcVRRgQkKt8nowJo7Gxf0ZSpiie2jZRIJdK0oDG12UbnRtBUBAUMy/d5pZPvXR
 PrYG31p1veIGUY8FUT+eMQP/6uY/wQ+map92grd/wXV+tCx2Ha/KeDLYlmUbu8BaQFr0
 3VOJcNg25WT/61B/7z1KDbJotD8+a731NmcLEqBt8f6Om/T1rbcBJxibNe+2zzoyF+mK
 bCak8VMH2Wm3NDroEyvPrWjvsJlo4VY5o+DLPNOBtyi3Y0YK65IvD2ou+n0fh6FrDCGg WA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9hsj82s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 11:35:59 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27UBYRjW040764;
 Tue, 30 Aug 2022 11:35:59 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j9hsj82r1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 11:35:59 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27UBZjpO027695;
 Tue, 30 Aug 2022 11:35:57 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3j7aw93naa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 11:35:57 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27UBaGFj30474526
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Aug 2022 11:36:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C49D4A4051;
 Tue, 30 Aug 2022 11:35:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26051A4053;
 Tue, 30 Aug 2022 11:35:54 +0000 (GMT)
Received: from [9.145.186.253] (unknown [9.145.186.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Aug 2022 11:35:54 +0000 (GMT)
Message-ID: <67ed362f-2e25-0ee9-baae-5e2a0ac52749@linux.ibm.com>
Date: Tue, 30 Aug 2022 13:35:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 12/18] dump/dump: Add section string table support
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 scgl@linux.ibm.com
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-13-frankja@linux.ibm.com>
From: Steffen Eiden <seiden@linux.ibm.com>
Organization: IBM
In-Reply-To: <20220811121111.9878-13-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qo0vfozbmS2ObyTtRebLpTAQW8xEWD1X
X-Proofpoint-GUID: n3ZwxeoI5Cb-hlSgUiX-urbpduJGB5qy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208300057
Received-SPF: pass client-ip=148.163.158.5; envelope-from=seiden@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Janosch,

On 8/11/22 14:11, Janosch Frank wrote:
> As sections don't have a type like the notes do we need another way to
> determine their contents. The string table allows us to assign each
> section an identification string which architectures can then use to
> tag their sections with.
> 
> There will be no string table if the architecture doesn't add custom
> sections which are introduced in a following patch.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   dump/dump.c           | 71 +++++++++++++++++++++++++++++++++++++++++++
>   include/sysemu/dump.h |  4 +++
>   2 files changed, 75 insertions(+)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 31eb20108c..0d6dbf453a 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
[ snip ]
>   }
>   
> +static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
> +{
> +    Elf32_Shdr shdr32;
> +    Elf64_Shdr shdr64;
> +    int shdr_size;
> +    void *shdr;
> +
> +    if (dump_is_64bit(s)) {
> +        shdr_size = sizeof(Elf64_Shdr);
> +        memset(&shdr64, 0, shdr_size);
> +        shdr64.sh_type = SHT_STRTAB;
> +        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
> +        shdr64.sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
I think you mixed up .strtab and .shstrtab here.
'.shstrtab' should be used here.

The ELF specs define bots as follows (from man 5 elf) :

        .shstrtab
               This section holds section names.  This section is of type
               SHT_STRTAB.  No attribute types are used.

        .strtab
               This section holds strings, most commonly the strings that
               represent the names associated with symbol table entries.
               If the file has a loadable segment that includes the
               symbol string table, the section's attributes will include
               the SHF_ALLOC bit.  Otherwise, the bit will be off.  This
               section is of type SHT_STRTAB.

However, the name lookup works, as you correctly specified that this 
section holds the section header names via the 'e_shstrndx' field in the 
elf header.

> +        shdr64.sh_size = s->string_table_buf->len;
> +        shdr = &shdr64;
> +    } else {
> +        shdr_size = sizeof(Elf32_Shdr);
> +        memset(&shdr32, 0, shdr_size);
> +        shdr32.sh_type = SHT_STRTAB;
> +        shdr32.sh_offset = s->section_offset + s->elf_section_data_size;
> +        shdr32.sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
> +        shdr32.sh_size = s->string_table_buf->len;
> +        shdr = &shdr32;
> +    }
> +
> +    memcpy(buff, shdr, shdr_size);
> +
[snip]
Also, with your patches the dump output places the headers in this ordering:
[elf hdr]
[section hdrs]
[program hdrs]

**normally** program hdrs are placed before section hdrs,
but this is just a convention IIRC.


Steffen


