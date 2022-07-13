Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999895739C9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 17:11:32 +0200 (CEST)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBe1R-0002Vf-JP
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 11:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBdzv-0000Uh-KO
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:09:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oBdzs-0001Xd-9L
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 11:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657724988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hjb3qMm9w9lVxKGAjQCUSj7C4daU45mKW67/15uMyOc=;
 b=O/wguW/s8umv4XqgctMB4uAeOtj/KHNFGuAuDF5mPpNdcZyfjA+zXZPbG7FcA/Z9jCb2vh
 xDVw9wQJdmobPGGV5JMVz/E0OYypyuShE9Lec6vC2rRNxELBtrKb1xsq2ofqJVo+gBH+5o
 4Y2On1dC04/PN3O3553k4pBh7JsgvZ8=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-KNVysqvDN-6krJvV6vIlaw-1; Wed, 13 Jul 2022 11:09:47 -0400
X-MC-Unique: KNVysqvDN-6krJvV6vIlaw-1
Received: by mail-ot1-f72.google.com with SMTP id
 by5-20020a056830608500b00616c152aefbso4573192otb.6
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 08:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hjb3qMm9w9lVxKGAjQCUSj7C4daU45mKW67/15uMyOc=;
 b=VLNndiFSxKSkr8BAqSvze0Pdi41XwU6RPbhF0/h2rfMGDqPTL2LLYSHsw8BWNLDT+o
 0p1eVcSgNvrBtyYIHbF0SeQkMskrf45xcrzpTu+mwzi75EJaAgHLfX/WWRwFBtubPkxq
 W+mSa8oU8XWxsz4FhOXNuK6tNDo1zGccvEhnCPrQXydwZevoZQ+URRhk2vepCa3t/ETk
 MsooKg/yEZIV7kJwMYyEGkg4YlDrivsgzlfZkEKtezUoAzuIFfNcADM6Kk3oC5l/kdgh
 St/ES+iUa+K51tIne0apMH+leHX294dc6Y6xtOnMgLaR1JkS/CY/eqqrhYBAvRby8Mfa
 xeRw==
X-Gm-Message-State: AJIora+OKcI1vEthjZDt8iu8oH7PaJHsMDFwyQiNyvHPI8+268L6eYyk
 qx2edKPjVwrkZ2RVUdbNP13Xk79UcYOd1En0gPatfHny7Ud80Ib778DDCQu/1Y8Uh/vEUtZuDoo
 P5JEVe0uMT7nuQb0rrShzU4idSTBHCNM=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr4898086oab.205.1657724986627; 
 Wed, 13 Jul 2022 08:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uUIxezqF2b9DGoPlWSa5yU10L5nt1c6mbbfsb7dGK7G/9xQXLMgM9Smib8BD3HC/7Q391oXivV8MCMkNrGHa4=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr4898066oab.205.1657724986330; Wed, 13
 Jul 2022 08:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220713130322.25517-1-frankja@linux.ibm.com>
 <20220713130322.25517-2-frankja@linux.ibm.com>
In-Reply-To: <20220713130322.25517-2-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 13 Jul 2022 19:09:35 +0400
Message-ID: <CAMxuvaz=erLFMasq1CK_Y1Ku+dU0ZMR3EPF8ehDnPjQ94R9Rfw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dump: Cleanup memblock usage
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
> The iteration over the memblocks is hard to understand so it's about
> time to clean it up.
>
> struct DumpState's next_block and start members can and should be
> local variables within the iterator.
>
> Instead of manually grabbing the next memblock we can use
> QTAILQ_FOREACH to iterate over all memblocks.
>
> The begin and length fields in the DumpState have been left untouched
> since the qmp arguments share their names.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>

After this patch:
./qemu-system-x86_64 -monitor stdio -S
(qemu) dump-guest-memory foo
Error: dump: failed to save memory: Bad address


> ---
>  dump/dump.c           | 91 +++++++++++--------------------------------
>  include/sysemu/dump.h | 47 +++++++++++++++++++---
>  2 files changed, 65 insertions(+), 73 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 4d9658ffa2..6feba3cbfa 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -591,56 +591,27 @@ static void dump_begin(DumpState *s, Error **errp)
>      write_elf_notes(s, errp);
>  }
>
> -static int get_next_block(DumpState *s, GuestPhysBlock *block)
> -{
> -    while (1) {
> -        block = QTAILQ_NEXT(block, next);
> -        if (!block) {
> -            /* no more block */
> -            return 1;
> -        }
> -
> -        s->start = 0;
> -        s->next_block = block;
> -        if (s->has_filter) {
> -            if (block->target_start >= s->begin + s->length ||
> -                block->target_end <= s->begin) {
> -                /* This block is out of the range */
> -                continue;
> -            }
> -
> -            if (s->begin > block->target_start) {
> -                s->start = s->begin - block->target_start;
> -            }
> -        }
> -
> -        return 0;
> -    }
> -}
> -
>  /* write all memory to vmcore */
>  static void dump_iterate(DumpState *s, Error **errp)
>  {
>      ERRP_GUARD();
>      GuestPhysBlock *block;
> -    int64_t size;
> +    int64_t memblock_size, memblock_start;
>
> -    do {
> -        block = s->next_block;
> -
> -        size = block->target_end - block->target_start;
> -        if (s->has_filter) {
> -            size -= s->start;
> -            if (s->begin + s->length < block->target_end) {
> -                size -= block->target_end - (s->begin + s->length);
> -            }
> +    QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        memblock_start = dump_get_memblock_start(block, s->begin, s->length);
> +        if (memblock_start == -1) {
> +            continue;
>          }
> -        write_memory(s, block, s->start, size, errp);
> +
> +        memblock_size = dump_get_memblock_size(block, s->begin, s->length);
> +
> +        /* Write the memory to file */
> +        write_memory(s, block, memblock_start, memblock_size, errp);
>          if (*errp) {
>              return;
>          }
> -
> -    } while (!get_next_block(s, block));
> +    }
>  }
>
>  static void create_vmcore(DumpState *s, Error **errp)
> @@ -1490,30 +1461,22 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
>      }
>  }
>
> -static ram_addr_t get_start_block(DumpState *s)
> +static int validate_start_block(DumpState *s)
>  {
>      GuestPhysBlock *block;
>
>      if (!s->has_filter) {
> -        s->next_block = QTAILQ_FIRST(&s->guest_phys_blocks.head);
>          return 0;
>      }
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> +        /* This block is out of the range */
>          if (block->target_start >= s->begin + s->length ||
>              block->target_end <= s->begin) {
> -            /* This block is out of the range */
>              continue;
>          }
> -
> -        s->next_block = block;
> -        if (s->begin > block->target_start) {
> -            s->start = s->begin - block->target_start;
> -        } else {
> -            s->start = 0;
> -        }
> -        return s->start;
> -    }
> +        return 0;
> +   }
>
>      return -1;
>  }
> @@ -1540,25 +1503,17 @@ bool qemu_system_dump_in_progress(void)
>      return (qatomic_read(&state->status) == DUMP_STATUS_ACTIVE);
>  }
>
> -/* calculate total size of memory to be dumped (taking filter into
> - * acoount.) */
> +/*
> + * calculate total size of memory to be dumped (taking filter into
> + * account.)

thanks for fixing the typo

> + */
>  static int64_t dump_calculate_size(DumpState *s)
>  {
>      GuestPhysBlock *block;
> -    int64_t size = 0, total = 0, left = 0, right = 0;
> +    int64_t total = 0;
>
>      QTAILQ_FOREACH(block, &s->guest_phys_blocks.head, next) {
> -        if (s->has_filter) {
> -            /* calculate the overlapped region. */
> -            left = MAX(s->begin, block->target_start);
> -            right = MIN(s->begin + s->length, block->target_end);
> -            size = right - left;
> -            size = size > 0 ? size : 0;
> -        } else {
> -            /* count the whole region in */
> -            size = (block->target_end - block->target_start);
> -        }
> -        total += size;
> +        total += dump_get_memblock_size(block, s->begin, s->length);
>      }
>
>      return total;
> @@ -1660,8 +1615,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
>          goto cleanup;
>      }
>
> -    s->start = get_start_block(s);
> -    if (s->start == -1) {
> +    /* Is the filter filtering everything? */
> +    if (validate_start_block(s) == -1) {
>          error_setg(errp, QERR_INVALID_PARAMETER, "begin");
>          goto cleanup;
>      }
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..f3bf98c220 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -166,11 +166,10 @@ typedef struct DumpState {
>      hwaddr memory_offset;
>      int fd;
>
> -    GuestPhysBlock *next_block;
> -    ram_addr_t start;
> -    bool has_filter;
> -    int64_t begin;
> -    int64_t length;
> +    /* Guest memory related data */
> +    bool has_filter;           /* Are we dumping parts of the memory? */
> +    int64_t begin;             /* Start address of the chunk we want to dump */
> +    int64_t length;            /* Length of the dump we want to dump */
>
>      uint8_t *note_buf;          /* buffer for notes */
>      size_t note_buf_offset;     /* the writing place in note_buf */
> @@ -203,4 +202,42 @@ typedef struct DumpState {
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
>  uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
>  uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
> +
> +static inline int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
> +                                             int64_t filter_area_length)
> +{
> +    int64_t size, left, right;
> +
> +    /* No filter, return full size */
> +    if (!filter_area_length) {
> +        return block->target_end - block->target_start;
> +    }
> +
> +    /* calculate the overlapped region. */
> +    left = MAX(filter_area_start, block->target_start);
> +    right = MIN(filter_area_start + filter_area_length, block->target_end);
> +    size = right - left;
> +    size = size > 0 ? size : 0;
> +
> +    return size;
> +}
> +
> +static inline int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
> +                                  int64_t filter_area_length)
> +{
> +    if (filter_area_length) {
> +        /*
> +         * Check if block is within guest memory dump area. If not
> +         * go to next one.
> +         */

Or rather "return -1 if the block is not within filter area"

> +        if (block->target_start >= filter_area_start + filter_area_length ||
> +            block->target_end <= filter_area_start) {
> +            return -1;
> +        }
> +        if (filter_area_start > block->target_start) {
> +            return filter_area_start - block->target_start;
> +        }
> +    }
> +    return block->target_start;

This used to be 0. Changing that, I think the patch looks good.
Although it could perhaps be splitted to introduce the two functions.

> +}
>  #endif
> --
> 2.34.1
>


