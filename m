Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED9B573ACB
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:06:07 +0200 (CEST)
Received: from localhost ([::1]:41632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBesI-0004h5-9s
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBelT-0000Ad-47
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:59:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBelQ-0001Js-01
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:59:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657727939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cBNDrA0ZX60NKZ4z6R/cRjlYRDriK8tUjn/4yLaMMc8=;
 b=Qx5lEqJay3r3TIcXY5TdtgwhvEW+VZxiw4ttZ/0N2bwm63nIYh40/jI9k+biVp4S83HVaS
 bSSZWqLxdljWz6FInk/t+8p6Eo20WG5HaRMPMuYViohwG0kSJq2JLbEH3EKMmVrwmpLEFF
 AE+nW1bMb7X3hB+/i9BZU9QlafqWGjY=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-NJR17D5jOfa-3w3V70RHOA-1; Wed, 13 Jul 2022 11:58:57 -0400
X-MC-Unique: NJR17D5jOfa-3w3V70RHOA-1
Received: by mail-oi1-f198.google.com with SMTP id
 a9-20020a056808098900b00339f990621cso5636386oic.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:58:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cBNDrA0ZX60NKZ4z6R/cRjlYRDriK8tUjn/4yLaMMc8=;
 b=ppHk4+EJR0JYoroGbMZfPIOOkbglPlOhjnQCk0h9hCisaLepuFZXOy/4RLqYUAbPup
 l90+6JQi+BSZCskzxf5DFeTzqEZKiGC/1w4wjpp5qiD+ENj/wouPa8F0mRraFbplB9HS
 6MmEB7zlrdIETQatkwGrfsMuOVWux7fK16LHVyNA4js5kbtuiE62I8rdZgolXDg5vM60
 oBPHuiPImjS9VHxJAy2EFPhh5CchSUfNIsDJQ9Y0ek/NFV2F195N4/1sV+umhlwmfJVv
 R5nPJpgImTS9WZ+0OT3Sgfb+oaPK3+VY4UXw3ZD/rxHD+P5c42EbeTp7DzCWhy3hotJB
 6Bkw==
X-Gm-Message-State: AJIora8BSuzlgTAFreRRL+ZbE3xmB98aFNKH3Z4YGfO6Zq0TmD6SG7bb
 vWhJo/H1rnLVDwmFW81o+Rzq++2ojIvqg99++vx3E+3iat9MfjZVYKLJQoEZXTjbyr5cLe6Br4b
 58sJixAYgpC+uxi1khKAb2N3wP/To/AQ=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5028594oab.205.1657727937202; 
 Wed, 13 Jul 2022 08:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vg1us4ICKs9B6VsSoEl2HT1FjVtUgA6uSdmkD3j7RSTKAjMFUvVkO744au8f0tmCb0MBONeZmVKrt2vxX+dxY=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5028571oab.205.1657727936980; Wed, 13
 Jul 2022 08:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-6-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-6-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 19:58:46 +0400
Message-ID: <CAMxuvawZehnqK=UN03nKEdtwL7yySKgb6GG5GV1S3CT_d0_iyg@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dump/dump: Add section string table support
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "Henderson,
 Richard" <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 13, 2022 at 5:07 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> Time to add a bit more descriptiveness to the dumps.

Please add some more description & motivation to the patch (supposedly
necessary for next patches), and explain that it currently doesn't
change the dump (afaict).

>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  dump/dump.c           | 106 ++++++++++++++++++++++++++++++++++++------
>  include/sysemu/dump.h |   1 +
>  2 files changed, 94 insertions(+), 13 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 467d934bc1..31e2a85372 100644
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
> @@ -359,14 +360,47 @@ static size_t write_elf_section_hdr_zero(DumpState *s, void *buff)
>      return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>  }
>
> +static void write_elf_section_hdr_string(DumpState *s, void *buff)
> +{
> +    Elf32_Shdr shdr32;
> +    Elf64_Shdr shdr64;
> +    int shdr_size;
> +    void *shdr = buff;
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
>      uint8_t *buff_hdr;
> -    size_t len, sizeof_shdr;
> +    size_t len, size = 0, sizeof_shdr;
> +    Elf64_Ehdr *hdr64 = s->elf_header;
> +    Elf32_Ehdr *hdr32 = s->elf_header;
>
>      /*
>       * Section ordering:
>       * - HDR zero (if needed)
> +     * - String table hdr
>       */
>      sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
>      len = sizeof_shdr * s->shdr_num;
> @@ -377,6 +411,22 @@ static void prepare_elf_section_hdrs(DumpState *s)
>      if (s->phdr_num == PN_XNUM) {
>              write_elf_section_hdr_zero(s, buff_hdr);
>      }
> +    buff_hdr += size;
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
> +    }
>  }
>
>  static void prepare_elf_sections(DumpState *s, Error **errp)
> @@ -405,11 +455,18 @@ static void write_elf_sections(DumpState *s, Error **errp)
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
> @@ -592,6 +649,9 @@ static void dump_begin(DumpState *s, Error **errp)
>       *   --------------
>       *   |  memory     |
>       *   --------------
> +     *   |  sectn data |
> +     *   --------------
> +
>       *
>       * we only know where the memory is saved after we write elf note into
>       * vmcore.
> @@ -677,6 +737,7 @@ static void create_vmcore(DumpState *s, Error **errp)
>          return;
>      }
>
> +    /* Iterate over memory and dump it to file */
>      dump_iterate(s, errp);
>      if (*errp) {
>          return;
> @@ -1659,6 +1720,13 @@ static void dump_init(DumpState *s, int fd, bool has_format,
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
> @@ -1819,19 +1887,31 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          }
>      }
>
> -    if (dump_is_64bit(s)) {
> -        s->phdr_offset = sizeof(Elf64_Ehdr);
> -        s->shdr_offset = s->phdr_offset + sizeof(Elf64_Phdr) * s->phdr_num;
> -        s->note_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> -        s->memory_offset = s->note_offset + s->note_size;
> -    } else {
> -
> -        s->phdr_offset = sizeof(Elf32_Ehdr);
> -        s->shdr_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
> -        s->note_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
> -        s->memory_offset = s->note_offset + s->note_size;
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
>      }
>
> +    tmp = (s->phdr_num == PN_XNUM) ? s->sh_info : s->phdr_num;
> +    if (dump_is_64bit(s)) {
> +        s->shdr_offset = sizeof(Elf64_Ehdr);
> +        s->phdr_offset = s->shdr_offset + sizeof(Elf64_Shdr) * s->shdr_num;
> +        s->note_offset = s->phdr_offset + sizeof(Elf64_Phdr) * tmp;
> +    } else {
> +        s->shdr_offset = sizeof(Elf32_Ehdr);
> +        s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
> +        s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * tmp;
> +    }
> +    s->memory_offset = s->note_offset + s->note_size;

I suggest to split this in a different patch. It's not obvious that
you can change phdr_offset / shdr_offset, it deserves a comment.

> +    s->section_offset = s->memory_offset + s->total_size;
> +
>      return;
>
>  cleanup:
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index 8379e29ef6..2c25c7d309 100644
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


