Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1855811FC
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:32:12 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGInL-0005As-7L
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIgo-0006jp-Uj
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:25:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIgj-0005Bz-VK
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658834719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wPkKNR8DBA3g825Srgo5pW/IJ9K7MYVczKNydXIIoho=;
 b=GvPYS//0aTi3yIJ5gsa6BRZVZXIWr2HTWsNqomNIjwalYF3TgK6Az/LTB9PT9A11P8LtFQ
 5UukZ1ZxngHrJpRwl7yzHUAFMJ/F7ukpUQCYg1nCmcBAHTP5yWtOylDJjuax19Lcx76Yi1
 CCDEj34CcFngLHScdZRnr+j06eY1hSg=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-oq1ZBixxO0--y8FnsOmd-A-1; Tue, 26 Jul 2022 07:25:18 -0400
X-MC-Unique: oq1ZBixxO0--y8FnsOmd-A-1
Received: by mail-oo1-f71.google.com with SMTP id
 f2-20020a4a9d42000000b0043224eb6778so1065104ook.21
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wPkKNR8DBA3g825Srgo5pW/IJ9K7MYVczKNydXIIoho=;
 b=Kw664B1TIwFDDVU6mq8OxpY91AKYCWgMZeefQMaBYzrNqpLZsWWsfmCtjKryaVhbnK
 PjdH28AQ8Y4KnNNqrGFbqz3ozGU7rPqN5geRE8H7tJ9RxfgkDdjcZ9bBZkdzQuQx6ZBC
 0FHXpXpzOisEldhQySH9+B59j5sBKfqIgpLbPIoQ9LgTVU25Ul63fvUJrBsQbXC0CJ6v
 Be4cVgUZBEBIs4qkLO5uGfa5ICg3JyoJo0wpE6cCkMo72qYro7n/360ws6ild46/qiDI
 XIoFKR0z39ghJ6UP/dWq5XhsAl3nIsRqzCIRe+Mg9wSqXDhbCeeFqrGIONLZMczCAqF8
 UrJg==
X-Gm-Message-State: AJIora8gZ4rifKx/C1HEWI6gV2M8judLm/1lKrQSFculPIPQAjvV60tK
 uk0OUi1RNtVUA9jxupq0ABJiwKopxo207bOhMgeKBoMXAVp9BOF85Cy3Xh/IGA5TZpMV+C48REW
 kjiyGTnvuWXreWI9M8GC/FNSLqNADtrE=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7844272oib.205.1658834717665; 
 Tue, 26 Jul 2022 04:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uJxFE2bffobXIWxHXWvlqdOkjHarokiq8b+e0ZcwVRAdHG/Si3rNg4gv9ZKlT3XzUUpcvQNPCRS7yo2A0XuTI=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr7844270oib.205.1658834717428; Tue, 26
 Jul 2022 04:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-12-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-12-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:25:06 +0400
Message-ID: <CAMxuvawu-q-Fe4ZXU2Bc1gwLfpQCCw3HxWhbBK6+8exkM1b+nw@mail.gmail.com>
Subject: Re: [PATCH v4 11/17] dump/dump: Add section string table support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
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
>  dump/dump.c           | 81 ++++++++++++++++++++++++++++++++++++++++++-
>  include/sysemu/dump.h |  1 +
>  2 files changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 3cf846d0a0..298a1e923f 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -99,6 +99,7 @@ static int dump_cleanup(DumpState *s)
>      close(s->fd);
>      g_free(s->guest_note);
>      g_free(s->elf_header);
> +    g_array_unref(s->string_table_buf);
>      s->guest_note = NULL;
>      if (s->resume) {
>          if (s->detached) {
> @@ -357,21 +358,72 @@ static size_t prepare_elf_section_hdr_zero(DumpState *s)
>      return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>  }
>
> +static void write_elf_section_hdr_string(DumpState *s, void *buff)
> +{

Mildly annoyed that we use "write_" prefix for actually writing to the
fd, and sometimes to pre-fill (or "prepare_" structures). Would you
mind cleaning that up?

> +    Elf32_Shdr shdr32;
> +    Elf64_Shdr shdr64;
> +    int shdr_size;
> +    void *shdr = buff;

Why assign here?

> +
> +    if (dump_is_64bit(s)) {
> +        shdr_size = sizeof(Elf64_Shdr);
> +        memset(&shdr64, 0, shdr_size);
> +        shdr64.sh_type = SHT_STRTAB;
> +        shdr64.sh_offset = s->section_offset + s->elf_section_data_size;
> +        shdr64.sh_name = s->string_table_buf->len;
> +        g_array_append_vals(s->string_table_buf, ".strtab", sizeof(".strtab"));
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
> +}
> +
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

This comment isn't exactly relevant yet, since that code isn't there, but ok.

> +    write_elf_section_hdr_string(s, buff_hdr);
> +    if (dump_is_64bit(s)) {
> +        hdr64->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
> +    } else {
> +        hdr32->e_shstrndx = cpu_to_dump16(s, s->shdr_num - 1);
>      }
>  }
>
> @@ -401,11 +453,18 @@ static void write_elf_sections(DumpState *s, Error **errp)
>  {
>      int ret;
>
> -    /* Write section zero */
> +    /* Write section zero and arch sections */
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

I wonder if GByteArray wouldn't be more appropriate, even if it
doesn't have the clearing option. If it's just for one byte, ...

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
> --
> 2.34.1
>


