Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 890115852B8
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 17:34:38 +0200 (CEST)
Received: from localhost ([::1]:41234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHS0b-0004zi-3t
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHRyF-00038S-EN; Fri, 29 Jul 2022 11:32:11 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHRyC-00050q-UO; Fri, 29 Jul 2022 11:32:11 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26TF3HqF011679;
 Fri, 29 Jul 2022 15:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TMPDGf31nVCqzMV3N+0rq1xVEydnMfYpACnQ2gnin4U=;
 b=qlcPryijikawpH4shu0hUrdjhpRZealTtW6e69rR4cnmtKeIYfTwIGIGE5/c7l73wmRs
 1yMGGf1EdtMO3lOWUYPFeYOe1GKxZnUnDAYhFVGBYjJlYswElM8ZnxEef759DfCSmGK4
 flKoLZzxbHsTzB45Gv1MtyMjT0sTKRmvGaHnR1b8UkgVolomc+GxpGnGzbcc645e1G9z
 Tx/tfmLwZrhbBMZLJ37Jg24T2L6xzudd+NJP6lA3r9ohZXcTptr9Afehhk3uF0BXsvOp
 PDpAmRX/KCqnTKvLcoa6zVlwnvCi7LWVEJgFlm9fg9BAH2PpmrqPLCu5CotYLbvgNmlo iA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmhutgy0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 15:32:04 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26TF501t025563;
 Fri, 29 Jul 2022 15:32:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmhutgxyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 15:32:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26TFNQ88018812;
 Fri, 29 Jul 2022 15:32:02 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3hg97tfs6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 15:32:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 26TFWCKh30474676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 15:32:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63D5B11C04A;
 Fri, 29 Jul 2022 15:31:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D93E811C04C;
 Fri, 29 Jul 2022 15:31:57 +0000 (GMT)
Received: from [9.171.3.27] (unknown [9.171.3.27])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 15:31:57 +0000 (GMT)
Message-ID: <b75c4839-f9d3-ace8-7dbf-ef3fe840fa54@linux.ibm.com>
Date: Fri, 29 Jul 2022 17:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 08/17] dump: Split write of section headers and data
 and add a prepare step
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-9-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-9-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ij8gZCwTlxYjgduJF_rjeo4H--eyoRjP
X-Proofpoint-GUID: BsbXmuy85pewV9L3xvtJPSO-0FNkRTa1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_16,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290066
Received-SPF: pass client-ip=148.163.158.5; envelope-from=scgl@linux.ibm.com;
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

On 7/26/22 11:22, Janosch Frank wrote:
> By splitting the writing of the section headers and (future) section
> data we prepare for the addition of a string table section and
> architecture sections.
> 
> At the same time we move the writing of the section to the end of the
> dump process. This allows the upcoming architecture section code to
> add data after all of the common dump data has been written.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 112 ++++++++++++++++++++++++++++++++----------
>  include/sysemu/dump.h |   4 ++
>  2 files changed, 90 insertions(+), 26 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 8a7ce95610..a6bb7bfa21 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -342,30 +342,69 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
>      }
>  }
>  
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static size_t prepare_elf_section_hdr_zero(DumpState *s)

You don't use the return value and it is well known, the length of a section
header entry.

>  {
> -    Elf32_Shdr shdr32;
> -    Elf64_Shdr shdr64;
> -    int shdr_size;
> -    void *shdr;
> -    int ret;
> +    if (dump_is_64bit(s)) {
> +        Elf64_Shdr *shdr64 = s->elf_section_hdrs;
>  
> -    if (type == 0) {
> -        shdr_size = sizeof(Elf32_Shdr);
> -        memset(&shdr32, 0, shdr_size);
> -        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr32;
> +        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
>      } else {
> -        shdr_size = sizeof(Elf64_Shdr);
> -        memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr64;
> +        Elf32_Shdr *shdr32 = s->elf_section_hdrs;
> +
> +        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
>      }
>  
> -    ret = fd_write_vmcore(shdr, shdr_size, s);
> +    return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +}
> +
[...]
> +
> +static void write_elf_sections(DumpState *s, Error **errp)
> +{
> +    int ret;
> +
> +    /* Write section zero */
> +    ret = fd_write_vmcore(s->elf_section_data, s->elf_section_data_size, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write section data");
>      }
>  }
>  
> @@ -557,12 +596,22 @@ static void dump_begin(DumpState *s, Error **errp)
>      /* Write elf header to buffer */
>      prepare_elf_header(s);
>  
> +    prepare_elf_sections(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* Start to write stuff into file descriptor */
>      write_elf_header(s, errp);
>      if (*errp) {
>          return;
>      }
>  
> +    write_elf_section_headers(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* write PT_NOTE to vmcore */
>      write_elf_phdr_note(s, errp);
>      if (*errp) {
> @@ -575,14 +624,6 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>  
> -    /* write section to vmcore */
> -    if (s->shdr_num) {
> -        write_elf_section(s, 1, errp);
> -        if (*errp) {
> -            return;
> -        }
> -    }
> -
>      /* write notes to vmcore */
>      write_elf_notes(s, errp);
>  }
> @@ -647,6 +688,19 @@ static void dump_iterate(DumpState *s, Error **errp)
>      }
>  }
>  
> +static void dump_end(DumpState *s, Error **errp)
> +{

This function doesn't do anything yet, does it?
Not sure if I like splitting the patches like that, but squashing them will blow up the patch size.
Maybe you should just mention in the patch description which functionality remains
dormant and under what circumstances it will become active.

> +    ERRP_GUARD();
> +
> +    if (!s->elf_section_data_size) {
> +        return;
> +    }
> +    s->elf_section_data = g_malloc0(s->elf_section_data_size);
> +
> +    /* write sections to vmcore */
> +    write_elf_sections(s, errp);
> +}
> +
>  static void create_vmcore(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -657,6 +711,12 @@ static void create_vmcore(DumpState *s, Error **errp)
>      }
>  
>      dump_iterate(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    /* Write section data after memory has been dumped */
> +    dump_end(s, errp);
>  }
>  
>  static int write_start_flat_header(int fd)
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 7f9a848573..686555f908 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -172,6 +172,10 @@ typedef struct DumpState {
>      int64_t length;            /* Length of the dump we want to dump */
>  
>      void *elf_header;
> +    void *elf_section_hdrs;
> +    uint64_t elf_section_data_size;
> +    void *elf_section_data;
> +
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
>      uint32_t nr_cpus;           /* number of guest's cpu */


