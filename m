Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B81358559C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 21:37:11 +0200 (CEST)
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHVnD-00080q-LY
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 15:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHVlh-0006Xd-AL; Fri, 29 Jul 2022 15:35:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oHVlf-0008CR-85; Fri, 29 Jul 2022 15:35:29 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26TJQgDo007383;
 Fri, 29 Jul 2022 19:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RM3jLLmPUrTaTiZR+I/lTeNLiCFrZ3CUHP6Fxbwqb/s=;
 b=Nr/nDLq4gR4n2UL0vqSt33I0rFlmxFiO6tGKqMwz1zcq1IFnkFWU1ehW0x41bBptDvkn
 Az+BVL/L45ZPqJgN++2KDU6sbWIsw/NusQHIe4dYs+1fxkPLZch4Ql4hN7vz8s316CI+
 tnmjbBOG9VzYw/u7t/zdi5xUKsvEDN6zXuSWiXyIy44W4tjGjgSTXXH9DAtS3M9bDvnB
 p10+E9+vfFRS0yHUkiLxxIGboD6ztbtJUv+8PBpxvIIhkFiWbH5SnWFx5lMOnmS7D72R
 2JJPtzLBZXhYWbJ+1HuyPRkquJiwFw6uiiqDsZrCByO4HU8N8lClwyyDxtYJ3k7AAiXf lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmnq386c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 19:35:25 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26TJSaXb012838;
 Fri, 29 Jul 2022 19:35:25 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hmnq386b7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 19:35:25 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26TJZNle004749;
 Fri, 29 Jul 2022 19:35:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3hg945p0un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jul 2022 19:35:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26TJZKrK31982038
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jul 2022 19:35:20 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EDFA4A4040;
 Fri, 29 Jul 2022 19:35:19 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6861DA4051;
 Fri, 29 Jul 2022 19:35:19 +0000 (GMT)
Received: from [9.171.5.81] (unknown [9.171.5.81])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jul 2022 19:35:19 +0000 (GMT)
Message-ID: <971a659e-97cb-ec53-ea7c-cb4b3e022f76@linux.ibm.com>
Date: Fri, 29 Jul 2022 21:35:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
In-Reply-To: <20220726092248.128336-12-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mXUIZlKAGQqySTOl-ehczKwFFAL-tnht
X-Proofpoint-GUID: h_h-wckhxdBxJiy8AnxHJtaIDibzBcLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-29_19,2022-07-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207290080
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
> As sections don't have a type like the notes do we need another way to

Having a string table seems like a good idea to me, as we don't know
the requirements any architecture might have, but sections do have sh_type.
Could we use one of those, e.g. one of the processor specific ones?
Is
	SHT_PROGBITS
    		The section holds information defined by the program,
		whose format and meaning are determined solely by the program.
appropriate for us? It seems to me that our program is the guest and
it doesn't determine the meta information on how to decrypt the dump.

> determine their contents. The string table allows us to assign each
> section an identification string which architectures can then use to
> tag their sections with.
> 
> There will be no string table if the architecture doesn't add custom
> sections which are introduced in a following patch.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 81 ++++++++++++++++++++++++++++++++++++++++++-
>  include/sysemu/dump.h |  1 +
>  2 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 3cf846d0a0..298a1e923f 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c

[...]

>  static void prepare_elf_section_hdrs(DumpState *s)
>  {
>      size_t len, sizeof_shdr;
> +    Elf64_Ehdr *hdr64 = s->elf_header;
> +    Elf32_Ehdr *hdr32 = s->elf_header;
> +    void *buff_hdr;
>  
>      /*
>       * Section ordering:
>       * - HDR zero (if needed)
> +     * - String table hdr
>       */
>      sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>      len = sizeof_shdr * s->shdr_num;
>      s->elf_section_hdrs = g_malloc0(len);
> +    buff_hdr = s->elf_section_hdrs;
>  
>      /* Write special section first */
>      if (s->phdr_num == PN_XNUM) {
>          prepare_elf_section_hdr_zero(s);
> +        buff_hdr += sizeof_shdr;
> +    }
> +
> +    if (s->shdr_num < 2) {
> +        return;
> +    }
> +
> +    /*
> +     * String table needs to be last section since strings are added
> +     * via arch_sections_write_hdr().
> +     */
> +    write_elf_section_hdr_string(s, buff_hdr);
> +    if (dump_is_64bit(s)) {
> +        hdr64->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
> +    } else {
> +        hdr32->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
>      }

Might want to assert e_shstrndx < SHN_LORESERVE (0xff00) or handle that case correctly.

>  }
>  
> @@ -401,11 +453,18 @@ static void write_elf_sections(DumpState *s, Error **errp)
>  {
>      int ret;
>  
> -    /* Write section zero */
> +    /* Write section zero and arch sections */

Since that doesn't concern the string section it seems wrong to change this in this patch.

>      ret = fd_write_vmcore(s->elf_section_data, s->elf_section_data_size, s);
>      if (ret < 0) {
>          error_setg_errno(errp, -ret, "dump: failed to write section data");
>      }
> +
> +    /* Write string table data */
> +    ret = fd_write_vmcore(s->string_table_buf->data,
> +                          s->string_table_buf->len, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write string table data");
> +    }
>  }
>  
>  static void write_data(DumpState *s, void *buf, int length, Error **errp)
> @@ -713,6 +772,7 @@ static void create_vmcore(DumpState *s, Error **errp)
>          return;
>      }
>  
> +    /* Iterate over memory and dump it to file */

This should be going into the patch introducing dump_end.

>      dump_iterate(s, errp);
>      if (*errp) {
>          return;
> @@ -1695,6 +1755,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>      s->has_filter = has_filter;
>      s->begin = begin;
>      s->length = length;
> +    /* First index is 0, it's the special null name */
> +    s->string_table_buf = g_array_new(FALSE, TRUE, 1);
> +    /*
> +     * Allocate the null name, due to the clearing option set to true
> +     * it will be 0.
> +     */
> +    g_array_set_size(s->string_table_buf, 1);
>  
>      memory_mapping_list_init(&s->list);
>  
> @@ -1855,6 +1922,18 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          }
>      }
>  
> +    /*
> +     * calculate shdr_num and elf_section_data_size so we know the offsets and
> +     * sizes of all parts.
> +     *
> +     * If phdr_num overflowed we have at least one section header
> +     * More sections/hdrs can be added by the architectures
> +     */

This needs to be adjusted like we talked about, i.e. adding the special 0 section unless
it already exists.

> +    if (s->shdr_num > 1) {
> +        /* Reserve the string table */
> +        s->shdr_num += 1;
> +    }
> +
>      tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;
>      if (dump_is_64bit(s)) {
>          s->shdr_offset = sizeof(Elf64_Ehdr);
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 696e6c67d6..299b611180 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -178,6 +178,7 @@ typedef struct DumpState {
>      void *elf_section_hdrs;
>      uint64_t elf_section_data_size;
>      void *elf_section_data;
> +    GArray *string_table_buf;  /* String table section */
>  
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */


