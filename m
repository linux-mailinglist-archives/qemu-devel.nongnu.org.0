Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F09573A31
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:34:13 +0200 (CEST)
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeNQ-0002xz-AA
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeLC-0000gc-FP
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:31:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBeL8-00080r-08
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657726309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rARDsnll66TBO2ctVAQjnXPlg9FGlWfY7Knl5BOkVM0=;
 b=EKDOC9yLMux1B2BoN8YivwfCaFrfN0JfURokFz4vXlhSvw9/MprMiZ9lo0AOyYdK77MN+W
 z6MM2eFINVW3JCiu0hQwCmSqpUNwC6X//PCwHdwM2eEugYfNs2KviA+KPTX4sLXosJTWIY
 rpFKshfSuRSr8K7lb2/hhl0YvioRBHM=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-js60036CNtumPe5p30FPhw-1; Wed, 13 Jul 2022 11:31:36 -0400
X-MC-Unique: js60036CNtumPe5p30FPhw-1
Received: by mail-oi1-f198.google.com with SMTP id
 a9-20020a056808098900b00339f990621cso5599436oic.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rARDsnll66TBO2ctVAQjnXPlg9FGlWfY7Knl5BOkVM0=;
 b=OElfeoE9st10zEIU4+yz4nlyGG16r2s1hr9NQhgUGLPDIVouRqWruO53pUSdoe7a8E
 pF7C6Z1faArQQ6FgmMSUFocM2UTfKI2LPCxQPs46QXW6hQke4GG8AWJlt7hWN6T55jo1
 AWx0vfPK1zfP3o2QtflFUl5Yvz+ihS2TRl51QiDwf7cNGmuWbMfwacL2mWZixkdZg+jx
 pX5nq3/i/x4wQIv0sY3njILuhf9rVkse3X5d1Y+ujOMu7qA1+9D5baKo3C/GThZzafA8
 TEfN9xV4ItjPpNueopfgBiM+mSXnPktqyn8Dd+ZarMeHoM16iqY+vY1ZkgrIOPBV4KZZ
 m3Yw==
X-Gm-Message-State: AJIora8AI9noZ+YlHPQtLg2wRKW1UYzjj4SnmHlxNuXZbG27aBI0TujJ
 vdc+m7g95MeycZwRlO/046oOH8mQnvhNaDgvjQD8OuCDPMAJ6PXCddR9n8oI4Am99kBbmVzElVI
 CjECgou1zMh7Tes2Ihfnp4Aicbuu/V30=
X-Received: by 2002:a05:6808:d4f:b0:339:afb0:ccce with SMTP id
 w15-20020a0568080d4f00b00339afb0cccemr2111556oik.53.1657726295626; 
 Wed, 13 Jul 2022 08:31:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u/QRndwG6zrB83yNpHlJKUPK1hOTJBEMiAPoytl4egz8sXrGUrZveyg/pHUwNPeN7kNWv9kKHYd3c7+tEIbfs=
X-Received: by 2002:a05:6808:d4f:b0:339:afb0:ccce with SMTP id
 w15-20020a0568080d4f00b00339afb0cccemr2111539oik.53.1657726295381; Wed, 13
 Jul 2022 08:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-4-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-4-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 19:31:24 +0400
Message-ID: <CAMxuvazSob1cgGiY8euW6Cq4_f37VZhLxjF6PK7kixVFnHukpA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dump: Split write of section headers and data
 and add a prepare step
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> By splitting the writing of the section headers and (future) section
> data we prepare for the addition of a string table section and
> architecture sections.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 116 ++++++++++++++++++++++++++++++++----------
>  include/sysemu/dump.h |   4 ++
>  2 files changed, 94 insertions(+), 26 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 16d7474258..467d934bc1 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -342,30 +342,73 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
>      }
>  }
>
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static size_t write_elf_section_hdr_zero(DumpState *s, void *buff)

Since the function no longer write, I'd suggest to rename it with
prepare_ prefix

>  {
> -    Elf32_Shdr shdr32;
> -    Elf64_Shdr shdr64;
> -    int shdr_size;
> -    void *shdr;
> -    int ret;
> +    if (dump_is_64bit(s)) {
> +        Elf64_Shdr *shdr64 = buff;
>
> -    if (type == 0) {
> -        shdr_size = sizeof(Elf32_Shdr);
> -        memset(&shdr32, 0, shdr_size);
> -        shdr32.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr32;
> +        memset(buff, 0, sizeof(Elf64_Shdr));

You can drop this

> +        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
>      } else {
> -        shdr_size = sizeof(Elf64_Shdr);
> -        memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr64;
> +        Elf32_Shdr *shdr32 = buff;
> +
> +        memset(buff, 0, sizeof(Elf32_Shdr));

and this

> +        shdr32->sh_info = cpu_to_dump32(s, s->phdr_num);
>      }
>
> -    ret = fd_write_vmcore(shdr, shdr_size, s);
> +    return dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +}
> +
> +static void prepare_elf_section_hdrs(DumpState *s)
> +{
> +    uint8_t *buff_hdr;
> +    size_t len, sizeof_shdr;
> +
> +    /*
> +     * Section ordering:
> +     * - HDR zero (if needed)
> +     */
> +    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +    len = sizeof_shdr * s->shdr_num;
> +    s->elf_section_hdrs = g_malloc0(len);

since you alloc0 here

> +    buff_hdr = s->elf_section_hdrs;
> +
> +    /* Write special section first */
> +    if (s->phdr_num == PN_XNUM) {
> +            write_elf_section_hdr_zero(s, buff_hdr);

Eventually, drop buff_hdr, and pass only "s" as argument

+ Indentation is off

> +    }
> +}
> +
> +static void prepare_elf_sections(DumpState *s, Error **errp)
> +{
> +    if (!s->shdr_num) {
> +        return;
> +    }
> +
> +    prepare_elf_section_hdrs(s);
> +}
> +
> +static void write_elf_section_headers(DumpState *s, Error **errp)
> +{
> +    size_t sizeof_shdr;
> +    int ret;
> +
> +    sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> +
> +    ret = fd_write_vmcore(s->elf_section_hdrs, s->shdr_num * sizeof_shdr, s);
>      if (ret < 0) {
> -        error_setg_errno(errp, -ret,
> -                         "dump: failed to write section header table");
> +        error_setg_errno(errp, -ret, "dump: failed to write section data");

nit: data->header


> +    }
> +}
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
> @@ -557,12 +600,22 @@ static void dump_begin(DumpState *s, Error **errp)
>      /* Write elf header to buffer */
>      prepare_elf_header(s);
>
> +    prepare_elf_sections(s, errp);
> +    if (*errp) {
> +        return;
> +    }
> +
>      /* Start to write stuff into files*/
>      write_elf_header(s, errp);
>      if (*errp) {
>          return;
>      }
>
> +    write_elf_section_headers(s, errp);

Why do you reorder the sections? Could you explain in the commit
message why? Is this is format compliant? and update the comment
above? thanks

> +    if (*errp) {
> +        return;
> +    }
> +
>      /* write PT_NOTE to vmcore */
>      write_elf_phdr_note(s, errp);
>      if (*errp) {
> @@ -575,14 +628,6 @@ static void dump_begin(DumpState *s, Error **errp)
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
> @@ -610,6 +655,19 @@ static void dump_iterate(DumpState *s, Error **errp)
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
> +
> +    /* write sections to vmcore */
> +    write_elf_sections(s, errp);
> +}
> +
>  static void create_vmcore(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -620,6 +678,12 @@ static void create_vmcore(DumpState *s, Error **errp)
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
> index 736f681d01..bd49532232 100644
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
> --
> 2.34.1
>


