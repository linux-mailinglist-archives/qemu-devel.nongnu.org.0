Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9A5A93FF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:14:25 +0200 (CEST)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oThDM-0007t1-V3
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:14:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgSu-0005ht-I0; Thu, 01 Sep 2022 05:26:26 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oTgSr-00015P-Fd; Thu, 01 Sep 2022 05:26:24 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2818oShi007686;
 Thu, 1 Sep 2022 09:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=+0k08IJBCaO1LxvKfM4yVywecug7/wcF5Uf5q5YKnlU=;
 b=sxnAxb2pn8TeRwKyBx/WeT3zUNdRPeGmqRFwNn2GMYQpV6xskxx2WgIyhzVxdpFQC7+2
 HbWpyoUZqzo87NDcv80GETOE11xLS2XyCYx4G4rXahAbA1Hu6MykU5weRd3xht0SF0M2
 4d5E+u6yS4RqTlQDBprIEsMvi8aR/3RBWxxZXy6cRIwbXEo7KQbFZUJmIUuFWI+RG2Jj
 7qAF2Ta9wHlNOD1nLVR2j1HlplsLMSgiHKaeFfANS0eawvsTG49qTZM+zYwIbqI4asGG
 f8iwp1DWh81IOZm+M67OVR/30VrCC59elEcgvFsdlCeY9pSgipg/WSavCbtLr1lxcSgy /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jask19819-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:26:19 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2819KQ6n003758;
 Thu, 1 Sep 2022 09:26:19 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jask1980g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:26:19 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2819LmbY028824;
 Thu, 1 Sep 2022 09:26:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3j7aw96gyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Sep 2022 09:26:16 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2819QDuK35389700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Sep 2022 09:26:14 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D88DCAE045;
 Thu,  1 Sep 2022 09:26:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CB67AE051;
 Thu,  1 Sep 2022 09:26:13 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.6.152]) by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Sep 2022 09:26:13 +0000 (GMT)
Message-ID: <7bf8a01c3392807e376c178e027775b332cf2383.camel@linux.ibm.com>
Subject: Re: [PATCH v5 13/18] dump/dump: Add arch section support
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Thu, 01 Sep 2022 11:26:13 +0200
In-Reply-To: <20220811121111.9878-14-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-14-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zBeNTE4guaV0slBtNnyAb0N5367o32Cm
X-Proofpoint-GUID: Jy1jOuO0mXkj1GejLcYi6-kEkb3w7t6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_06,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010040
Received-SPF: pass client-ip=148.163.156.1; envelope-from=scgl@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, 2022-08-11 at 12:11 +0000, Janosch Frank wrote:
> Add hooks which architectures can use to add arbitrary data to custom
> sections.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c                | 120 ++++++++++++++++++++++++++++++-------
>  include/sysemu/dump-arch.h |   3 +
>  2 files changed, 100 insertions(+), 23 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 0d6dbf453a..65b18fc602 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -430,7 +430,7 @@ static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
>      memcpy(buff, shdr, shdr_size);
>  }
>  
> -static void prepare_elf_section_hdrs(DumpState *s)
> +static void prepare_elf_section_hdrs(DumpState *s, Error **errp)
>  {
>      size_t len, sizeof_shdr;
>      void *buff_hdr;
> @@ -438,6 +438,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
>      /*
>       * Section ordering:
>       * - HDR zero
> +     * - Arch section hdrs
>       * - String table hdr
>       */
>      sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> @@ -465,6 +466,16 @@ static void prepare_elf_section_hdrs(DumpState *s)
>          return;
>      }
>  
> +    /* Add architecture defined section headers */
> +    if (s->dump_info.arch_sections_write_hdr_fn) {
> +        buff_hdr += s->dump_info.arch_sections_write_hdr_fn(s, buff_hdr);
> +
> +        if (s->shdr_num >= SHN_LORESERVE) {

               /* TODO: raise limit by encoding via sh_link */

> +            error_setg_errno(errp, EINVAL, "dump: too many architecture defined sections");
> +            return;
> +        }
> +    }
> +
>      /*
>       * String table is the last section since strings are added via
>       * arch_sections_write_hdr().
> @@ -477,7 +488,10 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
>      size_t sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>      int ret;
>  
> -    prepare_elf_section_hdrs(s);
> +    prepare_elf_section_hdrs(s, errp);
> +    if (*errp) {

You're depending on errp not being NULL here, which it isn't, but it
doesn't seem like good style to me.
error.h recommends to also indicate success/failure via the return
value if possible. prepare_elf_section_hdrs returns void right now, so
it's easy so side step it this way.
(ERRP_GUARD would work too of course)

> +        return;
> +    }
>  
>      ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
>      if (ret < 0) {
> @@ -485,6 +499,30 @@ static void write_elf_section_headers(DumpState *s, Error **errp)
>      }
>  }
>  
> +static void write_elf_sections(DumpState *s, Error **errp)
> +{
> +    int ret;
> +
> +    if (!s->elf_section_data_size) {
> +        return;
> +    }
> +
> +    /* Write architecture section data */
> +    ret = fd_write_vmcore(s->elf_section_data,
> +                          s->elf_section_data_size, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write architecture section  data");

Looks like two spaces between section and data.

> +        return;
> +    }
> +
> +    /* Write string table */
> +    ret = fd_write_vmcore(s->string_table_buf->data,
> +                          s->string_table_buf->len, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write string table data");
> +    }
> +}
> +
>  static void write_data(DumpState *s, void *buf, int length, Error **errp)
>  {
>      int ret;
> @@ -744,6 +782,24 @@ static void dump_iterate(DumpState *s, Error **errp)
>      }
>  }
>  
> +static void dump_end(DumpState *s, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (!s->elf_section_data_size) {
> +        return;
> +    }
> +    s->elf_section_data = g_malloc0(s->elf_section_data_size);

Why zero initialize the memory, do you depend on that?

> +
> +    /* Adds the architecture defined section data to s->elf_section_data  */
> +    if (s->dump_info.arch_sections_write_fn) {
> +        s->dump_info.arch_sections_write_fn(s, s->elf_section_data);
> +    }
> +
> +    /* write sections to vmcore */
> +    write_elf_sections(s, errp);
> +}
> +
>  static void create_vmcore(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -758,6 +814,9 @@ static void create_vmcore(DumpState *s, Error **errp)
>      if (*errp) {
>          return;
>      }
> +
> +    /* Write the section data */
> +    dump_end(s, errp);
>  }
>  
>  static int write_start_flat_header(int fd)
> @@ -1883,38 +1942,53 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>      }
>  
>      /*
> -     * calculate phdr_num
> -     *
> -     * the type of ehdr->e_phnum is uint16_t, so we should avoid overflow
> +     * Adds the number of architecture sections to shdr_num, sets
> +     * string_table_usage and sets elf_section_data_size so we know
> +     * the offsets and sizes of all parts.
>       */
> -    s->phdr_num = 1; /* PT_NOTE */
> -    if (s->list.num < UINT16_MAX - 2) {
> -        s->shdr_num = 0;
> -        s->phdr_num += s->list.num;
> -    } else {
> -        /* sh_info of section 0 holds the real number of phdrs */
> -        s->shdr_num = 1;
> +    if (s->dump_info.arch_sections_add_fn) {
> +        s->dump_info.arch_sections_add_fn(s);
>  
> -        /* the type of shdr->sh_info is uint32_t, so we should avoid overflow */
> -        if (s->list.num <= UINT32_MAX - 1) {
> -            s->phdr_num += s->list.num;
> -        } else {
> -            s->phdr_num = UINT32_MAX;
> +        if (s->shdr_num) {
> +            s->string_table_usage = true;
>          }
>      }

I'm not convinced that this is the right patch for the stuff below.

>      /*
> -     * calculate shdr_num and elf_section_data_size so we know the offsets and
> -     * sizes of all parts.
> +     * Calculate phdr_num
>       *
> -     * If phdr_num overflowed we have at least one section header
> -     * More sections/hdrs can be added by the architectures
> +     * The absolute maximum amount of phdrs is UINT32_MAX - 1 as
> +     * sh_info is 32 bit. There's special handling once we go over
> +     * UINT16_MAX - 1 but that is handled in the ehdr and section
> +     * code.
>       */
> -    if (s->shdr_num > 1) {
> -        /* Reserve the string table */
> +    s->phdr_num = 1; /* Reserve PT_NOTE */
> +    if (s->list.num <= UINT32_MAX - 1) {
> +        s->phdr_num += s->list.num;
> +    } else {
> +        s->phdr_num = UINT32_MAX;
> +    }
> +
> +    /*
> +     * The first section header is always a special one in which most
> +     * fields are 0.
> +     *
> +     * We need it if we have custom sections and if phdr_num >=
> +     * PN_XNUM so we can write the real phdr_num into sh_info.
> +     */
> +    if (s->shdr_num || s->phdr_num >= PN_XNUM) {
>          s->shdr_num += 1;
>      }
>  
> +    /* Reserve the string table for the arch sections if needed */
> +    if (s->string_table_usage) {
> +        s->shdr_num += 1;
> +    }
> +
> +    /*
> +     * Now that the number of section and program headers is known we
> +     * can calculate the offsets of the headers and data.
> +     */
>      if (dump_is_64bit(s)) {
>          s->shdr_offset = sizeof(Elf64_Ehdr);
>          s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
> index e25b02e990..824c0c1152 100644
> --- a/include/sysemu/dump-arch.h
> +++ b/include/sysemu/dump-arch.h
> @@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
>      uint32_t page_size;      /* The target's page size. If it's variable and
>                                * unknown, then this should be the maximum. */
>      uint64_t phys_base;      /* The target's physmem base. */
> +    void (*arch_sections_add_fn)(DumpState *s);
> +    uint64_t (*arch_sections_write_hdr_fn)(DumpState *s, uint8_t *buff);
> +    void (*arch_sections_write_fn)(DumpState *s, uint8_t *buff);
>  } ArchDumpInfo;
>  
>  struct GuestPhysBlockList; /* memory_mapping.h */


