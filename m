Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BFE5A55BC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 22:45:19 +0200 (CEST)
Received: from localhost ([::1]:58446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSldF-0002Gn-Mk
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 16:45:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oSlbR-0000mq-Nq; Mon, 29 Aug 2022 16:43:25 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scgl@linux.ibm.com>)
 id 1oSlbP-0002cK-Ks; Mon, 29 Aug 2022 16:43:25 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TKg0g2011484;
 Mon, 29 Aug 2022 20:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ttScy/zu2bO4H1Jl+navNoWspMtb/bM2AKBlr/r1q6U=;
 b=LOHr+KiwZhrhOrXk/NZWXGB6dDr0UIaepIpzwr1O3kNKp0jPL8jGPMcQ2HCe6YltqA/G
 edYop69wSRwuTGgvfGzFFClI7EKGzItUGjNAydhczvBmU/ORrv+MbN82cd+QJrH1NJqs
 la3+/SOXiaZYmjOHFG4J+pcJGYY5vVWEC7qndf5Xz/S0F1d+qxZcbM6vd5PdiJAQrfeQ
 8keOqYVls2ofKMQi+/3/a7xRWAfnH9VRWv208X7rlKV03HBiWhUJlTbeD2o4XcgqgANY
 X29phVo8H3JOLRFM28MboIUQQGsVqmb0hCbdPNHwVK8RumFm6FKs0RLfdqWKPLJ0t4Ih 4g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j94qf80vj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 20:43:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TKhBde017497;
 Mon, 29 Aug 2022 20:43:20 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j94qf80ud-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 20:43:20 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27TKZbum014766;
 Mon, 29 Aug 2022 20:43:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3j7aw92rpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Aug 2022 20:43:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 27TKhaM021430700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Aug 2022 20:43:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8108B4C044;
 Mon, 29 Aug 2022 20:43:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06C9C4C040;
 Mon, 29 Aug 2022 20:43:14 +0000 (GMT)
Received: from li-7e0de7cc-2d9d-11b2-a85c-de26c016e5ad.ibm.com (unknown
 [9.171.52.104])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 29 Aug 2022 20:43:13 +0000 (GMT)
Message-ID: <dc56340d45adbdbdc5cc2793bab222f8a4e8bab7.camel@linux.ibm.com>
Subject: Re: [PATCH v5 09/18] dump: Use a buffer for ELF section data and
 headers
From: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com
Date: Mon, 29 Aug 2022 22:43:13 +0200
In-Reply-To: <20220811121111.9878-10-frankja@linux.ibm.com>
References: <20220811121111.9878-1-frankja@linux.ibm.com>
 <20220811121111.9878-10-frankja@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JfQgPNEuqvmiWx8DfILpJJ5pSvljTbJD
X-Proofpoint-GUID: U2u5H9NZXt1ciRproTsbjFu0A_S-MU3e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_09,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290093
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
> Currently we're writing the NULL section header if we overflow the
> physical header number in the ELF header. But in the future we'll add
> custom section headers AND section data.
> 
> To facilitate this we need to rearange section handling a bit. As with
> the other ELF headers we split the code into a prepare and a write
> step.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 83 +++++++++++++++++++++++++++++--------------
>  include/sysemu/dump.h |  2 ++
>  2 files changed, 58 insertions(+), 27 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index a905316fe5..0051c71d08 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -380,30 +380,57 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
>      }
>  }
>  
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static void prepare_elf_section_hdr_zero(DumpState *s)
>  {
> -    Elf32_Shdr shdr32;
> -    Elf64_Shdr shdr64;
> -    int shdr_size;
> -    void *shdr;
> +    if (dump_is_64bit(s)) {
> +        Elf64_Shdr *shdr64 = s->elf_section_hdrs;
> +
> +        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
> +    } else {
> +        Elf32_Shdr *shdr32 = s->elf_section_hdrs;
> +
> +        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
> +    }
> +}
> +
> +static void prepare_elf_section_hdrs(DumpState *s)
> +{
> +    size_t len, sizeof_shdr;
> +
> +    /*
> +     * Section ordering:
> +     * - HDR zero
> +     */
> +    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +    len = sizeof_shdr * s->shdr_num;
> +    s->elf_section_hdrs = g_malloc0(len);

I'm not seeing this being freed.
> +
> +    /*
> +     * The first section header is ALWAYS a special initial section
> +     * header.
> +     *
> +     * The header should be 0 with one exception being that if
> +     * phdr_num is PN_XNUM then the sh_info field contains the real
> +     * number of segment entries.
> +     *
> +     * As we zero allocate the buffer we will only need to modify
> +     * sh_info for the PN_XNUM case.
> +     */
> +    if (s->phdr_num >= PN_XNUM) {
> +        prepare_elf_section_hdr_zero(s);
> +    }
> +}
> +
> +static void write_elf_section_headers(DumpState *s, Error **errp)

[...]

> @@ -579,6 +606,12 @@ static void dump_begin(DumpState *s, Error **errp)
>          return;
>      }
>  
> +    /* write section headers to vmcore */
> +    write_elf_section_headers(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* write PT_NOTE to vmcore */
>      write_elf_phdr_note(s, errp);
>      if (*errp) {
> @@ -591,14 +624,6 @@ static void dump_begin(DumpState *s, Error **errp)
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

Here you change the order of the headers, but the elf header is only
fixed in patch 11.
I agree that this should be a separate patch, with an explanation on
why it's necessary. 
So basically squashed into patch 11, except I think the comment change
in that one should go into another patch.

>      /* write notes to vmcore */
>      write_elf_notes(s, errp);
>  }
> @@ -674,7 +699,11 @@ static void create_vmcore(DumpState *s, Error **errp)
>          return;
>      }
>  
> +    /* Iterate over memory and dump it to file */
>      dump_iterate(s, errp);
> +    if (*errp) {
> +        return;
> +    }
>  }
>  
>  static int write_start_flat_header(int fd)
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index b62513d87d..9995f65dc8 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -177,6 +177,8 @@ typedef struct DumpState {
>      int64_t filter_area_begin;  /* Start address of partial guest memory area */
>      int64_t filter_area_length; /* Length of partial guest memory area */
>  
> +    void *elf_section_hdrs;     /* Pointer to section header buffer */
> +
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
>      uint32_t nr_cpus;           /* number of guest's cpu */


