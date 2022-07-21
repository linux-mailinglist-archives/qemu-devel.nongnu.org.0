Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE057CDEF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:43:01 +0200 (CEST)
Received: from localhost ([::1]:42060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEXOH-0005Ka-2A
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXMt-0003Pl-6T
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEXMr-0002iu-FN
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658414493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6TybopFtE+mI3THeyJKzQBPQ1osP4aIad6pTOEiKJpo=;
 b=HpkCLztLNO68fYmrIhnKQanRW7GxjiEsoh7hlZDgL8UYed6oE6yb4K0MiyS+4rzX5KxcPl
 i9rGsXPq1dz0frQNYFLRGUUHs0d0YfMWjA9u2TK3Z5xfPSQMQug6Uk1jzYtLzXsnEwUHO1
 dRchI6uwHRGpaoJQvfSlZRV2yWIl4vc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-4aVfQjy5MPewPXbQ2DcY1Q-1; Thu, 21 Jul 2022 10:41:26 -0400
X-MC-Unique: 4aVfQjy5MPewPXbQ2DcY1Q-1
Received: by mail-ot1-f69.google.com with SMTP id
 w24-20020a056830111800b0061cc2dc6bfbso852870otq.19
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 07:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6TybopFtE+mI3THeyJKzQBPQ1osP4aIad6pTOEiKJpo=;
 b=mnb+I8dM/L0XRRuuVcTPln4QtK4eO2duigs2AsDxwpcgMqs4ZkeyeyN/CVLMHSKQzO
 6J9mCNYPbfXCHy05iA0kIdMX5tfe4JlSjLUBI3Y0NHyNz0YpBgyjseEuh4VoL+wBRzYo
 NXrM2HBgwcu+ZxXvLiaBuZsuS9DIDsyAFi9fi8YMsqtVX7lVheEhRAdfQEqMI++DxEG9
 80ORSkyMiMBmaXfaKBf3GWKjsZEZoBwfeKlYCyFbEgljc8JQ89jWBrLlRRvZk/zuxbuy
 PWBX1i7KWf8WwpHMvo6t9A99UQKUKVbuVKTqX+e67DumBkvKLupUoaZvEIKsr1/cRzKj
 BakA==
X-Gm-Message-State: AJIora/Bjkfhkyfj/VAFs11hLnvnpbRSXhBJqnWpH7+Z2thhd/swIblS
 b9jz92VC179Hl9G6XYC7BBQSooY7sXlc6Eo45Ga7qD04KuhqJXkWqI/40hoeWYEqA7r4EMrpQPC
 20qZvIHDDiTNofHGRReCRJLG5PVFsZDk=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr4943274oib.205.1658414485104; 
 Thu, 21 Jul 2022 07:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s6bfrD1HOYTyDNFl+q4LFd82UUyFV4Z16U6E1akUTv3hqJ9p1QGgXiznqOmgq+bHhOVJ1Air1ei75LQRPnzCY=
X-Received: by 2002:a05:6808:23d4:b0:337:e764:90eb with SMTP id
 bq20-20020a05680823d400b00337e76490ebmr4943257oib.205.1658414484822; Thu, 21
 Jul 2022 07:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-6-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-6-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 18:41:14 +0400
Message-ID: <CAMxuvazYXtCmf9pUvgD2h_GX5wUB-5Y9eWk-Qiiuh=wXF8Mt=A@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] dump: Split write of section headers and data
 and add a prepare step
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com
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

On Thu, Jul 21, 2022 at 5:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
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
>  dump/dump.c           | 114 ++++++++++++++++++++++++++++++++----------
>  include/sysemu/dump.h |   4 ++
>  2 files changed, 92 insertions(+), 26 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 2d04e06815..980702d476 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -342,30 +342,71 @@ static void write_elf_phdr_note(DumpState *s, Error **errp)
>      }
>  }
>
> -static void write_elf_section(DumpState *s, int type, Error **errp)
> +static size_t prepare_elf_section_hdr_zero(DumpState *s, void *buff)
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
> +        shdr64->sh_info = cpu_to_dump32(s, s->phdr_num);
>      } else {
> -        shdr_size = sizeof(Elf64_Shdr);
> -        memset(&shdr64, 0, shdr_size);
> -        shdr64.sh_info = cpu_to_dump32(s, s->phdr_num);
> -        shdr = &shdr64;
> +        Elf32_Shdr *shdr32 = buff;
> +
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
> +    buff_hdr = s->elf_section_hdrs;
> +
> +    /* Write special section first */
> +    if (s->phdr_num == PN_XNUM) {
> +            prepare_elf_section_hdr_zero(s, buff_hdr);

From v2 review:

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
> +        error_setg_errno(errp, -ret, "dump: failed to write section headers");
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
> @@ -557,12 +598,22 @@ static void dump_begin(DumpState *s, Error **errp)
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
> @@ -575,14 +626,6 @@ static void dump_begin(DumpState *s, Error **errp)
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
> @@ -610,6 +653,19 @@ static void dump_iterate(DumpState *s, Error **errp)
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
> @@ -620,6 +676,12 @@ static void create_vmcore(DumpState *s, Error **errp)
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
> index 58f41bbf45..dad10dee0b 100644
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


