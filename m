Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2494600BB0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:57:30 +0200 (CEST)
Received: from localhost ([::1]:47032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMsA-0007yJ-Bb
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMhE-000212-6A
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1okMh6-00061C-96
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:46:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665999959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ndlx+pyY3gXOXQuoaSml0W1egVyVSN+wgTl737QY7oY=;
 b=VuyF/MG+5YPEWRKDBldB9wrP0fGcyEXiwwm1U4qT2S966J/yyjCJ4CY+n0wcGX32BZaakk
 g+RnzyiV0x5ekk3NfPBiWxULFjZKZCIdlkJH1s6/AYqAUyHY4wNLgvKB6BXIvA/VLEqRut
 4k/r6r941M1cRw92kdE3ypj7pVt7uxY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-Rc-hff32OmySAOKdXNaiew-1; Mon, 17 Oct 2022 05:45:57 -0400
X-MC-Unique: Rc-hff32OmySAOKdXNaiew-1
Received: by mail-oi1-f198.google.com with SMTP id
 w136-20020acaad8e000000b003552d4729d6so963342oie.2
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ndlx+pyY3gXOXQuoaSml0W1egVyVSN+wgTl737QY7oY=;
 b=ef80c1D2TxoyDE9clsw4at+5MFUeUS64r6bCX4cWFIVE1VmkeRdaLN2Yi6iAUd6ebh
 wpft2B/mq34ok0JZRGi874uv8OjY9JxwO0A7BJPLZzRhIF0UyyJ6kKAR0pxzcwu6AQIv
 NZzIe3Y78MBEOr3nzFE5QwnBlODC21D2u69aAMn6fSwQfLF6lpbWODlDc0zCLradZtLe
 GSiRsvHQKzVD/JuKwBS5KhSKg35+Q5FLGwJRx/WdRPA5IohAUG6FW71bQ5UuwwowNP/V
 87ner/T4DpzEnJyTwp6rk1s4Nr4rcGYJgmsE9hNNZMwDqhkPJdY8ph+E3e6ZeqWLQg9d
 rCgQ==
X-Gm-Message-State: ACrzQf3aUReLW3L2lZ8RaVHWwsFCianp5O2Y9myMRg2AhT/D4sM9dcct
 2iLictfNq/xOJidTq4LP0FGaw1ziqPfB3Jup+rJA/TZWnGPH70sG15YGdEKP/RZy6MYkPZvvbsN
 Yk6LzumGV/YakLAYTONuCYm1nRxKyJjo=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr5355956oao.53.1665999951569; 
 Mon, 17 Oct 2022 02:45:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cSXAcfy5cklQ+vsVphP7j6llZcKTqhVOgO+z2CwdB7blW5G2cbnu5Fxrrv78n5vukHewd4aOzYKHiYZRyStQ=
X-Received: by 2002:a05:6870:e98c:b0:131:8940:e7b with SMTP id
 r12-20020a056870e98c00b0013189400e7bmr5355939oao.53.1665999951319; Mon, 17
 Oct 2022 02:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221017083822.43118-1-frankja@linux.ibm.com>
 <20221017083822.43118-6-frankja@linux.ibm.com>
In-Reply-To: <20221017083822.43118-6-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Mon, 17 Oct 2022 13:45:39 +0400
Message-ID: <CAMxuvayFMpEF2hrfLixr_tdesRXtUS=h+MhNfSo8BJ18ZZUH+Q@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] dump: Add architecture section and section
 string table support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com, 
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org, 
 seiden@linux.ibm.com, scgl@linux.ibm.com
Content-Type: multipart/alternative; boundary="0000000000004b684f05eb37d78a"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000004b684f05eb37d78a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Oct 17, 2022 at 12:39 PM Janosch Frank <frankja@linux.ibm.com>
wrote:

> Add hooks which architectures can use to add arbitrary data to custom
> sections.
>
> Also add a section name string table in order to identify section
> contents
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c                | 190 +++++++++++++++++++++++++++++++------
>  include/sysemu/dump-arch.h |   3 +
>  include/sysemu/dump.h      |   3 +
>  3 files changed, 168 insertions(+), 28 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 626f7b2fd0..b5bc4f7119 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -103,6 +103,7 @@ static int dump_cleanup(DumpState *s)
>      memory_mapping_list_free(&s->list);
>      close(s->fd);
>      g_free(s->guest_note);
> +    g_array_unref(s->string_table_buf);
>      s->guest_note =3D NULL;
>      if (s->resume) {
>          if (s->detached) {
> @@ -152,11 +153,10 @@ static void prepare_elf64_header(DumpState *s,
> Elf64_Ehdr *elf_header)
>      elf_header->e_phoff =3D cpu_to_dump64(s, s->phdr_offset);
>      elf_header->e_phentsize =3D cpu_to_dump16(s, sizeof(Elf64_Phdr));
>      elf_header->e_phnum =3D cpu_to_dump16(s, phnum);
> -    if (s->shdr_num) {
> -        elf_header->e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
> -        elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr))=
;
> -        elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> -    }
> +    elf_header->e_shoff =3D cpu_to_dump64(s, s->shdr_offset);
> +    elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64_Shdr));
> +    elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> +    elf_header->e_shstrndx =3D cpu_to_dump16(s, s->shdr_num - 1);
>  }
>
>  static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header)
> @@ -180,11 +180,10 @@ static void prepare_elf32_header(DumpState *s,
> Elf32_Ehdr *elf_header)
>      elf_header->e_phoff =3D cpu_to_dump32(s, s->phdr_offset);
>      elf_header->e_phentsize =3D cpu_to_dump16(s, sizeof(Elf32_Phdr));
>      elf_header->e_phnum =3D cpu_to_dump16(s, phnum);
> -    if (s->shdr_num) {
> -        elf_header->e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
> -        elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr))=
;
> -        elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> -    }
> +    elf_header->e_shoff =3D cpu_to_dump32(s, s->shdr_offset);
> +    elf_header->e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32_Shdr));
> +    elf_header->e_shnum =3D cpu_to_dump16(s, s->shdr_num);
> +    elf_header->e_shstrndx =3D cpu_to_dump16(s, s->shdr_num - 1);
>  }
>
>  static void write_elf_header(DumpState *s, Error **errp)
> @@ -195,6 +194,8 @@ static void write_elf_header(DumpState *s, Error
> **errp)
>      void *header_ptr;
>      int ret;
>
> +    /* The NULL header and the shstrtab are always defined */
> +    assert(s->shdr_num >=3D 2);
>      if (dump_is_64bit(s)) {
>          prepare_elf64_header(s, &elf64_header);
>          header_size =3D sizeof(elf64_header);
> @@ -393,17 +394,49 @@ static void prepare_elf_section_hdr_zero(DumpState
> *s)
>      }
>  }
>
> -static void prepare_elf_section_hdrs(DumpState *s)
> +static void prepare_elf_section_hdr_string(DumpState *s, void *buff)
> +{
> +    uint64_t index =3D s->string_table_buf->len;
> +    const char strtab[] =3D ".shstrtab";
> +    Elf32_Shdr shdr32 =3D {};
> +    Elf64_Shdr shdr64 =3D {};
> +    int shdr_size;
> +    void *shdr;
> +
> +    g_array_append_vals(s->string_table_buf, strtab, sizeof(strtab));
> +    if (dump_is_64bit(s)) {
> +        shdr_size =3D sizeof(Elf64_Shdr);
> +        shdr64.sh_type =3D SHT_STRTAB;
> +        shdr64.sh_offset =3D s->section_offset + s->elf_section_data_siz=
e;
> +        shdr64.sh_name =3D index;
> +        shdr64.sh_size =3D s->string_table_buf->len;
> +        shdr =3D &shdr64;
> +    } else {
> +        shdr_size =3D sizeof(Elf32_Shdr);
> +        shdr32.sh_type =3D SHT_STRTAB;
> +        shdr32.sh_offset =3D s->section_offset + s->elf_section_data_siz=
e;
> +        shdr32.sh_name =3D index;
> +        shdr32.sh_size =3D s->string_table_buf->len;
> +        shdr =3D &shdr32;
> +    }
> +    memcpy(buff, shdr, shdr_size);
> +}
> +
> +static int prepare_elf_section_hdrs(DumpState *s, Error **errp)
>  {
>      size_t len, sizeof_shdr;
> +    void *buff_hdr;
>
>      /*
>       * Section ordering:
>       * - HDR zero
> +     * - Arch section hdrs
> +     * - String table hdr
>       */
>      sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
>      len =3D sizeof_shdr * s->shdr_num;
>      s->elf_section_hdrs =3D g_malloc0(len);
> +    buff_hdr =3D s->elf_section_hdrs;
>
>      /*
>       * The first section header is ALWAYS a special initial section
> @@ -419,6 +452,26 @@ static void prepare_elf_section_hdrs(DumpState *s)
>      if (s->phdr_num >=3D PN_XNUM) {
>          prepare_elf_section_hdr_zero(s);
>      }
> +    buff_hdr +=3D sizeof_shdr;
> +
> +    /* Add architecture defined section headers */
> +    if (s->dump_info.arch_sections_write_hdr_fn
> +        && s->shdr_num > 2) {
> +        buff_hdr +=3D s->dump_info.arch_sections_write_hdr_fn(s, buff_hd=
r);
> +
> +        if (s->shdr_num >=3D SHN_LORESERVE) {
> +            error_setg_errno(errp, EINVAL,
> +                             "dump: too many architecture defined
> sections");
> +            return -EINVAL;
> +        }
> +    }
> +
> +    /*
> +     * String table is the last section since strings are added via
> +     * arch_sections_write_hdr().
> +     */
> +    prepare_elf_section_hdr_string(s, buff_hdr);
> +    return 0;
>

According to our Error API documentation, functions should rather return a
bool true on success.


>  }
>
>  static void write_elf_section_headers(DumpState *s, Error **errp)
> @@ -426,7 +479,9 @@ static void write_elf_section_headers(DumpState *s,
> Error **errp)
>      size_t sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :
> sizeof(Elf32_Shdr);
>      int ret;
>
> -    prepare_elf_section_hdrs(s);
> +    if (prepare_elf_section_hdrs(s, errp)) {
> +        return;
> +    }
>
>      ret =3D fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_sh=
dr,
> s);
>      if (ret < 0) {
> @@ -436,6 +491,29 @@ static void write_elf_section_headers(DumpState *s,
> Error **errp)
>      g_free(s->elf_section_hdrs);
>  }
>
> +static void write_elf_sections(DumpState *s, Error **errp)
> +{
> +    int ret;
> +
> +    if (s->elf_section_data_size) {
> +        /* Write architecture section data */
> +        ret =3D fd_write_vmcore(s->elf_section_data,
> +                              s->elf_section_data_size, s);
> +        if (ret < 0) {
> +            error_setg_errno(errp, -ret,
> +                             "dump: failed to write architecture section
> data");
> +            return;
> +        }
> +    }
> +
> +    /* Write string table */
> +    ret =3D fd_write_vmcore(s->string_table_buf->data,
> +                          s->string_table_buf->len, s);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "dump: failed to write string table
> data");
> +    }
> +}
> +
>  static void write_data(DumpState *s, void *buf, int length, Error **errp=
)
>  {
>      int ret;
> @@ -692,6 +770,31 @@ static void dump_iterate(DumpState *s, Error **errp)
>      }
>  }
>
> +static void dump_end(DumpState *s, Error **errp)
> +{
> +    int rc;
> +    ERRP_GUARD();
> +
> +    if (s->elf_section_data_size) {
> +        s->elf_section_data =3D g_malloc0(s->elf_section_data_size);
> +    }
> +
> +    /* Adds the architecture defined section data to s->elf_section_data
> */
> +    if (s->dump_info.arch_sections_write_fn &&
> +        s->elf_section_data_size) {
> +        rc =3D s->dump_info.arch_sections_write_fn(s, s->elf_section_dat=
a);
> +        if (rc) {
> +            error_setg_errno(errp, rc,
> +                             "dump: failed to get arch section data");
> +            g_free(s->elf_section_data);
> +            return;
> +        }
> +    }
> +
> +    /* write sections to vmcore */
> +    write_elf_sections(s, errp);
> +}
> +
>  static void create_vmcore(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -701,7 +804,14 @@ static void create_vmcore(DumpState *s, Error **errp=
)
>          return;
>      }
>
> +    /* Iterate over memory and dump it to file */
>      dump_iterate(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
> +    /* Write the section data */
> +    dump_end(s, errp);
>  }
>
>  static int write_start_flat_header(int fd)
> @@ -1711,6 +1821,14 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      s->filter_area_begin =3D begin;
>      s->filter_area_length =3D length;
>
> +    /* First index is 0, it's the special null name */
> +    s->string_table_buf =3D g_array_new(FALSE, TRUE, 1);
> +    /*
> +     * Allocate the null name, due to the clearing option set to true
> +     * it will be 0.
> +     */
> +    g_array_set_size(s->string_table_buf, 1);
> +
>      memory_mapping_list_init(&s->list);
>
>      guest_phys_blocks_init(&s->guest_phys_blocks);
> @@ -1847,26 +1965,42 @@ static void dump_init(DumpState *s, int fd, bool
> has_format,
>      }
>
>      /*
> -     * calculate phdr_num
> -     *
> -     * the type of ehdr->e_phnum is uint16_t, so we should avoid overflo=
w
> +     * The first section header is always a special one in which most
> +     * fields are 0. The section header string table is also always
> +     * set.
>       */
> -    s->phdr_num =3D 1; /* PT_NOTE */
> -    if (s->list.num < UINT16_MAX - 2) {
> -        s->shdr_num =3D 0;
> -        s->phdr_num +=3D s->list.num;
> -    } else {
> -        /* sh_info of section 0 holds the real number of phdrs */
> -        s->shdr_num =3D 1;
> +    s->shdr_num =3D 2;
>
> -        /* the type of shdr->sh_info is uint32_t, so we should avoid
> overflow */
> -        if (s->list.num <=3D UINT32_MAX - 1) {
> -            s->phdr_num +=3D s->list.num;
> -        } else {
> -            s->phdr_num =3D UINT32_MAX;
> -        }
> +    /*
> +     * Adds the number of architecture sections to shdr_num and sets
> +     * elf_section_data_size so we know the offsets and sizes of all
> +     * parts.
> +     */
> +    if (s->dump_info.arch_sections_add_fn) {
> +        s->dump_info.arch_sections_add_fn(s);
>      }
>
> +    /*
> +     * calculate shdr_num so we know the offsets and sizes of all
> +     * parts.
> +     * Calculate phdr_num
> +     *
> +     * The absolute maximum amount of phdrs is UINT32_MAX - 1 as
> +     * sh_info is 32 bit. There's special handling once we go over
> +     * UINT16_MAX - 1 but that is handled in the ehdr and section
> +     * code.
> +     */
> +    s->phdr_num =3D 1; /* Reserve PT_NOTE */
> +    if (s->list.num <=3D UINT32_MAX - 1) {
> +        s->phdr_num +=3D s->list.num;
> +    } else {
> +        s->phdr_num =3D UINT32_MAX;
> +    }
> +
> +    /*
> +     * Now that the number of section and program headers is known we
> +     * can calculate the offsets of the headers and data.
> +     */
>      if (dump_is_64bit(s)) {
>          s->shdr_offset =3D sizeof(Elf64_Ehdr);
>          s->phdr_offset =3D s->shdr_offset + sizeof(Elf64_Shdr) *
> s->shdr_num;
> diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
> index e25b02e990..59bbc9be38 100644
> --- a/include/sysemu/dump-arch.h
> +++ b/include/sysemu/dump-arch.h
> @@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
>      uint32_t page_size;      /* The target's page size. If it's variable
> and
>                                * unknown, then this should be the maximum=
.
> */
>      uint64_t phys_base;      /* The target's physmem base. */
> +    void (*arch_sections_add_fn)(DumpState *s);
> +    uint64_t (*arch_sections_write_hdr_fn)(DumpState *s, uint8_t *buff);
> +    int (*arch_sections_write_fn)(DumpState *s, uint8_t *buff);
>  } ArchDumpInfo;
>
>  struct GuestPhysBlockList; /* memory_mapping.h */
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 9ed811b313..38ccac7190 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -180,6 +180,9 @@ typedef struct DumpState {
>      hwaddr note_offset;
>
>      void *elf_section_hdrs;     /* Pointer to section header buffer */
> +    void *elf_section_data;     /* Pointer to section data buffer */
> +    uint64_t elf_section_data_size; /* Size of section data */
> +    GArray *string_table_buf;   /* String table data buffer */
>
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
> --
> 2.34.1
>
>
otherwise lgtm
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--0000000000004b684f05eb37d78a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 17, 20=
22 at 12:39 PM Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com">f=
rankja@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Add hooks which architectures can use to add arbitrary =
data to custom<br>
sections.<br>
<br>
Also add a section name string table in order to identify section<br>
contents<br>
<br>
Signed-off-by: Janosch Frank &lt;<a href=3D"mailto:frankja@linux.ibm.com" t=
arget=3D"_blank">frankja@linux.ibm.com</a>&gt;<br>
---<br>
=C2=A0dump/dump.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
190 +++++++++++++++++++++++++++++++------<br>
=C2=A0include/sysemu/dump-arch.h |=C2=A0 =C2=A03 +<br>
=C2=A0include/sysemu/dump.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A03 files changed, 168 insertions(+), 28 deletions(-)<br>
<br>
diff --git a/dump/dump.c b/dump/dump.c<br>
index 626f7b2fd0..b5bc4f7119 100644<br>
--- a/dump/dump.c<br>
+++ b/dump/dump.c<br>
@@ -103,6 +103,7 @@ static int dump_cleanup(DumpState *s)<br>
=C2=A0 =C2=A0 =C2=A0memory_mapping_list_free(&amp;s-&gt;list);<br>
=C2=A0 =C2=A0 =C2=A0close(s-&gt;fd);<br>
=C2=A0 =C2=A0 =C2=A0g_free(s-&gt;guest_note);<br>
+=C2=A0 =C2=A0 g_array_unref(s-&gt;string_table_buf);<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;guest_note =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;resume) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;detached) {<br>
@@ -152,11 +153,10 @@ static void prepare_elf64_header(DumpState *s, Elf64_=
Ehdr *elf_header)<br>
=C2=A0 =C2=A0 =C2=A0elf_header-&gt;e_phoff =3D cpu_to_dump64(s, s-&gt;phdr_=
offset);<br>
=C2=A0 =C2=A0 =C2=A0elf_header-&gt;e_phentsize =3D cpu_to_dump16(s, sizeof(=
Elf64_Phdr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header-&gt;e_phnum =3D cpu_to_dump16(s, phnum);<br>
-=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shoff =3D cpu_to_dump64(s, s-=
&gt;shdr_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shentsize =3D cpu_to_dump16(s=
, sizeof(Elf64_Shdr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shnum =3D cpu_to_dump16(s, s-=
&gt;shdr_num);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shoff =3D cpu_to_dump64(s, s-&gt;shdr_offse=
t);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shentsize =3D cpu_to_dump16(s, sizeof(Elf64=
_Shdr));<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shnum =3D cpu_to_dump16(s, s-&gt;shdr_num);=
<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shstrndx =3D cpu_to_dump16(s, s-&gt;shdr_nu=
m - 1);<br>
=C2=A0}<br>
<br>
=C2=A0static void prepare_elf32_header(DumpState *s, Elf32_Ehdr *elf_header=
)<br>
@@ -180,11 +180,10 @@ static void prepare_elf32_header(DumpState *s, Elf32_=
Ehdr *elf_header)<br>
=C2=A0 =C2=A0 =C2=A0elf_header-&gt;e_phoff =3D cpu_to_dump32(s, s-&gt;phdr_=
offset);<br>
=C2=A0 =C2=A0 =C2=A0elf_header-&gt;e_phentsize =3D cpu_to_dump16(s, sizeof(=
Elf32_Phdr));<br>
=C2=A0 =C2=A0 =C2=A0elf_header-&gt;e_phnum =3D cpu_to_dump16(s, phnum);<br>
-=C2=A0 =C2=A0 if (s-&gt;shdr_num) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shoff =3D cpu_to_dump32(s, s-=
&gt;shdr_offset);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shentsize =3D cpu_to_dump16(s=
, sizeof(Elf32_Shdr));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_header-&gt;e_shnum =3D cpu_to_dump16(s, s-=
&gt;shdr_num);<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shoff =3D cpu_to_dump32(s, s-&gt;shdr_offse=
t);<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shentsize =3D cpu_to_dump16(s, sizeof(Elf32=
_Shdr));<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shnum =3D cpu_to_dump16(s, s-&gt;shdr_num);=
<br>
+=C2=A0 =C2=A0 elf_header-&gt;e_shstrndx =3D cpu_to_dump16(s, s-&gt;shdr_nu=
m - 1);<br>
=C2=A0}<br>
<br>
=C2=A0static void write_elf_header(DumpState *s, Error **errp)<br>
@@ -195,6 +194,8 @@ static void write_elf_header(DumpState *s, Error **errp=
)<br>
=C2=A0 =C2=A0 =C2=A0void *header_ptr;<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
+=C2=A0 =C2=A0 /* The NULL header and the shstrtab are always defined */<br=
>
+=C2=A0 =C2=A0 assert(s-&gt;shdr_num &gt;=3D 2);<br>
=C2=A0 =C2=A0 =C2=A0if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prepare_elf64_header(s, &amp;elf64_header=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0header_size =3D sizeof(elf64_header);<br>
@@ -393,17 +394,49 @@ static void prepare_elf_section_hdr_zero(DumpState *s=
)<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
-static void prepare_elf_section_hdrs(DumpState *s)<br>
+static void prepare_elf_section_hdr_string(DumpState *s, void *buff)<br>
+{<br>
+=C2=A0 =C2=A0 uint64_t index =3D s-&gt;string_table_buf-&gt;len;<br>
+=C2=A0 =C2=A0 const char strtab[] =3D &quot;.shstrtab&quot;;<br>
+=C2=A0 =C2=A0 Elf32_Shdr shdr32 =3D {};<br>
+=C2=A0 =C2=A0 Elf64_Shdr shdr64 =3D {};<br>
+=C2=A0 =C2=A0 int shdr_size;<br>
+=C2=A0 =C2=A0 void *shdr;<br>
+<br>
+=C2=A0 =C2=A0 g_array_append_vals(s-&gt;string_table_buf, strtab, sizeof(s=
trtab));<br>
+=C2=A0 =C2=A0 if (dump_is_64bit(s)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf64_Shdr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_type =3D SHT_STRTAB;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_offset =3D s-&gt;section_offset + s-=
&gt;elf_section_data_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_name =3D index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr64.sh_size =3D s-&gt;string_table_buf-&gt;=
len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr64;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr_size =3D sizeof(Elf32_Shdr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_type =3D SHT_STRTAB;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_offset =3D s-&gt;section_offset + s-=
&gt;elf_section_data_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_name =3D index;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr32.sh_size =3D s-&gt;string_table_buf-&gt;=
len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shdr =3D &amp;shdr32;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 memcpy(buff, shdr, shdr_size);<br>
+}<br>
+<br>
+static int prepare_elf_section_hdrs(DumpState *s, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0size_t len, sizeof_shdr;<br>
+=C2=A0 =C2=A0 void *buff_hdr;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * Section ordering:<br>
=C2=A0 =C2=A0 =C2=A0 * - HDR zero<br>
+=C2=A0 =C2=A0 =C2=A0* - Arch section hdrs<br>
+=C2=A0 =C2=A0 =C2=A0* - String table hdr<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 =C2=A0sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_Shdr) :=
 sizeof(Elf32_Shdr);<br>
=C2=A0 =C2=A0 =C2=A0len =3D sizeof_shdr * s-&gt;shdr_num;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;elf_section_hdrs =3D g_malloc0(len);<br>
+=C2=A0 =C2=A0 buff_hdr =3D s-&gt;elf_section_hdrs;<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
=C2=A0 =C2=A0 =C2=A0 * The first section header is ALWAYS a special initial=
 section<br>
@@ -419,6 +452,26 @@ static void prepare_elf_section_hdrs(DumpState *s)<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;phdr_num &gt;=3D PN_XNUM) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prepare_elf_section_hdr_zero(s);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 buff_hdr +=3D sizeof_shdr;<br>
+<br>
+=C2=A0 =C2=A0 /* Add architecture defined section headers */<br>
+=C2=A0 =C2=A0 if (s-&gt;dump_info.arch_sections_write_hdr_fn<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; s-&gt;shdr_num &gt; 2) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 buff_hdr +=3D s-&gt;dump_info.arch_sections_wr=
ite_hdr_fn(s, buff_hdr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;shdr_num &gt;=3D SHN_LORESERVE) {<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, EINVAL,<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dump: too many architecture defined se=
ctions&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* String table is the last section since strings are a=
dded via<br>
+=C2=A0 =C2=A0 =C2=A0* arch_sections_write_hdr().<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 prepare_elf_section_hdr_string(s, buff_hdr);<br>
+=C2=A0 =C2=A0 return 0;<br></blockquote><div><br></div><div>According to o=
ur Error API documentation, functions should rather return a bool true on s=
uccess.</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0}<br>
<br>
=C2=A0static void write_elf_section_headers(DumpState *s, Error **errp)<br>
@@ -426,7 +479,9 @@ static void write_elf_section_headers(DumpState *s, Err=
or **errp)<br>
=C2=A0 =C2=A0 =C2=A0size_t sizeof_shdr =3D dump_is_64bit(s) ? sizeof(Elf64_=
Shdr) : sizeof(Elf32_Shdr);<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
<br>
-=C2=A0 =C2=A0 prepare_elf_section_hdrs(s);<br>
+=C2=A0 =C2=A0 if (prepare_elf_section_hdrs(s, errp)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0ret =3D fd_write_vmcore(s-&gt;elf_section_hdrs, s-&gt;s=
hdr_num * sizeof_shdr, s);<br>
=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
@@ -436,6 +491,29 @@ static void write_elf_section_headers(DumpState *s, Er=
ror **errp)<br>
=C2=A0 =C2=A0 =C2=A0g_free(s-&gt;elf_section_hdrs);<br>
=C2=A0}<br>
<br>
+static void write_elf_sections(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int ret;<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;elf_section_data_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Write architecture section data */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fd_write_vmcore(s-&gt;elf_section_data=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;elf_section_data_size, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dump: failed to write architecture sec=
tion data&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Write string table */<br>
+=C2=A0 =C2=A0 ret =3D fd_write_vmcore(s-&gt;string_table_buf-&gt;data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 s-&gt;string_table_buf-&gt;len, s);<br>
+=C2=A0 =C2=A0 if (ret &lt; 0) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, -ret, &quot;dump: faile=
d to write string table data&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
=C2=A0static void write_data(DumpState *s, void *buf, int length, Error **e=
rrp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int ret;<br>
@@ -692,6 +770,31 @@ static void dump_iterate(DumpState *s, Error **errp)<b=
r>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+static void dump_end(DumpState *s, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 int rc;<br>
+=C2=A0 =C2=A0 ERRP_GUARD();<br>
+<br>
+=C2=A0 =C2=A0 if (s-&gt;elf_section_data_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;elf_section_data =3D g_malloc0(s-&gt;elf=
_section_data_size);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Adds the architecture defined section data to s-&gt;elf_s=
ection_data=C2=A0 */<br>
+=C2=A0 =C2=A0 if (s-&gt;dump_info.arch_sections_write_fn &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;elf_section_data_size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D s-&gt;dump_info.arch_sections_write_fn(=
s, s-&gt;elf_section_data);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg_errno(errp, rc,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;dump: failed to get arch section data&=
quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(s-&gt;elf_section_data);<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* write sections to vmcore */<br>
+=C2=A0 =C2=A0 write_elf_sections(s, errp);<br>
+}<br>
+<br>
=C2=A0static void create_vmcore(DumpState *s, Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ERRP_GUARD();<br>
@@ -701,7 +804,14 @@ static void create_vmcore(DumpState *s, Error **errp)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /* Iterate over memory and dump it to file */<br>
=C2=A0 =C2=A0 =C2=A0dump_iterate(s, errp);<br>
+=C2=A0 =C2=A0 if (*errp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Write the section data */<br>
+=C2=A0 =C2=A0 dump_end(s, errp);<br>
=C2=A0}<br>
<br>
=C2=A0static int write_start_flat_header(int fd)<br>
@@ -1711,6 +1821,14 @@ static void dump_init(DumpState *s, int fd, bool has=
_format,<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;filter_area_begin =3D begin;<br>
=C2=A0 =C2=A0 =C2=A0s-&gt;filter_area_length =3D length;<br>
<br>
+=C2=A0 =C2=A0 /* First index is 0, it&#39;s the special null name */<br>
+=C2=A0 =C2=A0 s-&gt;string_table_buf =3D g_array_new(FALSE, TRUE, 1);<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Allocate the null name, due to the clearing option s=
et to true<br>
+=C2=A0 =C2=A0 =C2=A0* it will be 0.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 g_array_set_size(s-&gt;string_table_buf, 1);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0memory_mapping_list_init(&amp;s-&gt;list);<br>
<br>
=C2=A0 =C2=A0 =C2=A0guest_phys_blocks_init(&amp;s-&gt;guest_phys_blocks);<b=
r>
@@ -1847,26 +1965,42 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0/*<br>
-=C2=A0 =C2=A0 =C2=A0* calculate phdr_num<br>
-=C2=A0 =C2=A0 =C2=A0*<br>
-=C2=A0 =C2=A0 =C2=A0* the type of ehdr-&gt;e_phnum is uint16_t, so we shou=
ld avoid overflow<br>
+=C2=A0 =C2=A0 =C2=A0* The first section header is always a special one in =
which most<br>
+=C2=A0 =C2=A0 =C2=A0* fields are 0. The section header string table is als=
o always<br>
+=C2=A0 =C2=A0 =C2=A0* set.<br>
=C2=A0 =C2=A0 =C2=A0 */<br>
-=C2=A0 =C2=A0 s-&gt;phdr_num =3D 1; /* PT_NOTE */<br>
-=C2=A0 =C2=A0 if (s-&gt;list.num &lt; UINT16_MAX - 2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num =3D 0;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num +=3D s-&gt;list.num;<br>
-=C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* sh_info of section 0 holds the real number =
of phdrs */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;shdr_num =3D 1;<br>
+=C2=A0 =C2=A0 s-&gt;shdr_num =3D 2;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* the type of shdr-&gt;sh_info is uint32_t, s=
o we should avoid overflow */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;list.num &lt;=3D UINT32_MAX - 1) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num +=3D s-&gt;list.n=
um;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num =3D UINT32_MAX;<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Adds the number of architecture sections to shdr_num=
 and sets<br>
+=C2=A0 =C2=A0 =C2=A0* elf_section_data_size so we know the offsets and siz=
es of all<br>
+=C2=A0 =C2=A0 =C2=A0* parts.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 if (s-&gt;dump_info.arch_sections_add_fn) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;dump_info.arch_sections_add_fn(s);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* calculate shdr_num so we know the offsets and sizes =
of all<br>
+=C2=A0 =C2=A0 =C2=A0* parts.<br>
+=C2=A0 =C2=A0 =C2=A0* Calculate phdr_num<br>
+=C2=A0 =C2=A0 =C2=A0*<br>
+=C2=A0 =C2=A0 =C2=A0* The absolute maximum amount of phdrs is UINT32_MAX -=
 1 as<br>
+=C2=A0 =C2=A0 =C2=A0* sh_info is 32 bit. There&#39;s special handling once=
 we go over<br>
+=C2=A0 =C2=A0 =C2=A0* UINT16_MAX - 1 but that is handled in the ehdr and s=
ection<br>
+=C2=A0 =C2=A0 =C2=A0* code.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 s-&gt;phdr_num =3D 1; /* Reserve PT_NOTE */<br>
+=C2=A0 =C2=A0 if (s-&gt;list.num &lt;=3D UINT32_MAX - 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num +=3D s-&gt;list.num;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;phdr_num =3D UINT32_MAX;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Now that the number of section and program headers i=
s known we<br>
+=C2=A0 =C2=A0 =C2=A0* can calculate the offsets of the headers and data.<b=
r>
+=C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0if (dump_is_64bit(s)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;shdr_offset =3D sizeof(Elf64_Ehdr);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;phdr_offset =3D s-&gt;shdr_offset +=
 sizeof(Elf64_Shdr) * s-&gt;shdr_num;<br>
diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h<br>
index e25b02e990..59bbc9be38 100644<br>
--- a/include/sysemu/dump-arch.h<br>
+++ b/include/sysemu/dump-arch.h<br>
@@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {<br>
=C2=A0 =C2=A0 =C2=A0uint32_t page_size;=C2=A0 =C2=A0 =C2=A0 /* The target&#=
39;s page size. If it&#39;s variable and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* unknown, then this should be the ma=
ximum. */<br>
=C2=A0 =C2=A0 =C2=A0uint64_t phys_base;=C2=A0 =C2=A0 =C2=A0 /* The target&#=
39;s physmem base. */<br>
+=C2=A0 =C2=A0 void (*arch_sections_add_fn)(DumpState *s);<br>
+=C2=A0 =C2=A0 uint64_t (*arch_sections_write_hdr_fn)(DumpState *s, uint8_t=
 *buff);<br>
+=C2=A0 =C2=A0 int (*arch_sections_write_fn)(DumpState *s, uint8_t *buff);<=
br>
=C2=A0} ArchDumpInfo;<br>
<br>
=C2=A0struct GuestPhysBlockList; /* memory_mapping.h */<br>
diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h<br>
index 9ed811b313..38ccac7190 100644<br>
--- a/include/sysemu/dump.h<br>
+++ b/include/sysemu/dump.h<br>
@@ -180,6 +180,9 @@ typedef struct DumpState {<br>
=C2=A0 =C2=A0 =C2=A0hwaddr note_offset;<br>
<br>
=C2=A0 =C2=A0 =C2=A0void *elf_section_hdrs;=C2=A0 =C2=A0 =C2=A0/* Pointer t=
o section header buffer */<br>
+=C2=A0 =C2=A0 void *elf_section_data;=C2=A0 =C2=A0 =C2=A0/* Pointer to sec=
tion data buffer */<br>
+=C2=A0 =C2=A0 uint64_t elf_section_data_size; /* Size of section data */<b=
r>
+=C2=A0 =C2=A0 GArray *string_table_buf;=C2=A0 =C2=A0/* String table data b=
uffer */<br>
<br>
=C2=A0 =C2=A0 =C2=A0uint8_t *note_buf;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*=
 buffer for notes */<br>
=C2=A0 =C2=A0 =C2=A0size_t note_buf_offset;=C2=A0 =C2=A0 =C2=A0/* the writi=
ng place in note_buf */<br>
-- <br>
2.34.1<br>
<br></blockquote><div><br></div><div>otherwise lgtm</div><div>Reviewed-by: =
Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">m=
arcandre.lureau@redhat.com</a>&gt;<br><br>=C2=A0</div></div></div></div>

--0000000000004b684f05eb37d78a--


