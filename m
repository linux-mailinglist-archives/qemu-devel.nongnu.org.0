Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF68581205
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:34:36 +0200 (CEST)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIpf-00016x-FT
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIlo-00046k-BQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIll-0006WN-OP
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658835032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QQbhntD5W4BAK6W0uLVBhbpTnMQjJECJk8HRHWmhbIY=;
 b=iDMuKR1Ap3GWDtU4oxCegfKbpnnpF+IKziZAbpnNawbzB19uyqSOHRoYopvVdCIJfNk8N8
 pNoK1cAwjaDI+S1RfGOGYAgtTIjLFNRx631rhop1xsF3xH7VCwiAjhMZAzes87XR26XsLl
 2Ri3HKr2TTlWUXdbiDPiUqdhB1fG3Ag=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-UyzLzwDOMQyJvyiWn1uOmw-1; Tue, 26 Jul 2022 07:30:31 -0400
X-MC-Unique: UyzLzwDOMQyJvyiWn1uOmw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-10dcc7339c4so4937473fac.13
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQbhntD5W4BAK6W0uLVBhbpTnMQjJECJk8HRHWmhbIY=;
 b=F0iwQpwoRg1F5jstrdBKlRTjNo6mKvNKvYdNerEcwblxAt+jjNuiCfmhk29TeENthg
 ZgQWfQl+jLPe71bh2sL1RGQW15bUwtDM2OzbUqLi32kVeF4ut8TPEQAvtDnppmLBmdWL
 /CGTMUhX1Fg6xlk6H73Ey4jiulCH4Rn1+zicSI8DQCljZQdmMtg/grBpmLohxtOryL4m
 enjt+hBhOsyZxSaRsI760PZ1oJ3SGl5kdLYbYPjobrTTMLnMPPVW6vauXlqh6FYVlP2i
 1Xx5DX+jdfyrYhQ8D7+08zq3X65yt1xja/cgxsztUjANKK+EfZzWXF8Z4EMb7Pio0Xwm
 R8mQ==
X-Gm-Message-State: AJIora94uEduooHLHI7YI+rFb9Za0GeuSip5OUveIkploj9IP5yGVp0E
 YgA/5bcllsL63DWLwbNH/sF2fXRIyyPXVL97rKnELWFkgyAKV+7X46ka2qau8ll0UmL3iCsVXQC
 I2x0emf2yxx51ZeLw0dA3uLPj0egkaDY=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr8683782oad.53.1658835030896; 
 Tue, 26 Jul 2022 04:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t/ou3JwoIYx6/YbzSoDDUgNjeMxccBE1v2XN5H2kKV3s3voJuJJ6QJNyowI5ALam628CFE+1jvUYockjcY3ss=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr8683769oad.53.1658835030687; Tue, 26 Jul
 2022 04:30:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-13-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-13-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:30:19 +0400
Message-ID: <CAMxuvazpXtOjWH_OoBDAj0VB4gjGAcy4ozv_oouRYtcZ_+MZvQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/17] dump/dump: Add arch section support
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
> Add hooks which architectures can use to add arbitrary data to custom
> sections.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c                |  5 +++++
>  include/sysemu/dump-arch.h | 27 +++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 298a1e923f..1ec4c3b6c3 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -398,6 +398,7 @@ static void prepare_elf_section_hdrs(DumpState *s)
>      /*
>       * Section ordering:
>       * - HDR zero (if needed)
> +     * - Arch section hdrs
>       * - String table hdr
>       */
>      sizeof_shdr = dump_is_64bit(s) ? sizeof(Elf64_Shdr) : sizeof(Elf32_Shdr);
> @@ -415,6 +416,8 @@ static void prepare_elf_section_hdrs(DumpState *s)
>          return;
>      }
>
> +    buff_hdr += dump_arch_sections_write_hdr(&s->dump_info, s, buff_hdr);
> +
>      /*
>       * String table needs to be last section since strings are added
>       * via arch_sections_write_hdr().
> @@ -758,6 +761,7 @@ static void dump_end(DumpState *s, Error **errp)
>          return;
>      }
>      s->elf_section_data = g_malloc0(s->elf_section_data_size);
> +    dump_arch_sections_write(&s->dump_info, s, s->elf_section_data);
>
>      /* write sections to vmcore */
>      write_elf_sections(s, errp);
> @@ -1929,6 +1933,7 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>       * If phdr_num overflowed we have at least one section header
>       * More sections/hdrs can be added by the architectures
>       */
> +    dump_arch_sections_add(&s->dump_info, (void *)s);
>      if (s->shdr_num > 1) {
>          /* Reserve the string table */
>          s->shdr_num += 1;
> diff --git a/include/sysemu/dump-arch.h b/include/sysemu/dump-arch.h
> index e25b02e990..de77908424 100644
> --- a/include/sysemu/dump-arch.h
> +++ b/include/sysemu/dump-arch.h
> @@ -21,6 +21,9 @@ typedef struct ArchDumpInfo {
>      uint32_t page_size;      /* The target's page size. If it's variable and
>                                * unknown, then this should be the maximum. */
>      uint64_t phys_base;      /* The target's physmem base. */
> +    void (*arch_sections_add_fn)(void *opaque);
> +    uint64_t (*arch_sections_write_hdr_fn)(void *opaque, uint8_t *buff);
> +    void (*arch_sections_write_fn)(void *opaque, uint8_t *buff);

Why not pass DumpState? If there is an issue with header declaration
order, you can always move the declaration in include/qemu/typedefs.h,
I guess.

>  } ArchDumpInfo;
>
>  struct GuestPhysBlockList; /* memory_mapping.h */
> @@ -28,4 +31,28 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>                        const struct GuestPhysBlockList *guest_phys_blocks);
>  ssize_t cpu_get_note_size(int class, int machine, int nr_cpus);
>
> +static inline void dump_arch_sections_add(ArchDumpInfo *info, void *opaque)
> +{
> +    if (info->arch_sections_add_fn) {
> +        info->arch_sections_add_fn(opaque);
> +    }
> +}
> +
> +static inline uint64_t dump_arch_sections_write_hdr(ArchDumpInfo *info,
> +                                                void *opaque, uint8_t *buff)
> +{
> +    if (info->arch_sections_write_hdr_fn) {
> +        return info->arch_sections_write_hdr_fn(opaque, buff);
> +    }
> +    return 0;
> +}
> +
> +static inline void dump_arch_sections_write(ArchDumpInfo *info, void *opaque,
> +                                            uint8_t *buff)
> +{
> +    if (info->arch_sections_write_fn) {
> +        info->arch_sections_write_fn(opaque, buff);
> +    }
> +}

We probably don't need those static inline helpers in the header.


