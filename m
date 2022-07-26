Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C78581241
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:44:26 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIz9-0007vM-CK
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIqh-0002BW-Pb
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oGIqe-0007nE-Lc
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 07:35:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658835335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wBKIaecUD13cIBswPGPTp8AjChGPi8/Yp+2lKHbqeXI=;
 b=SI1iI3fQorUGuslXlCLP+JnFVFTYZwvdv6VQk2uioRlwcm8OxVwVafZZDlxMv7IjFSwc+8
 9xj+MKPch1K5bVa5XrVyy4QeJkYIDVFG6MuR3UhKCZz8uCKmrrwi3tGwmgOoSK+PBYVxUe
 YoWg7lcjB4OO9gLUvwgf2IpWCEQhepg=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-ZDlfMrebMJGgAL3DIK91tQ-1; Tue, 26 Jul 2022 07:35:34 -0400
X-MC-Unique: ZDlfMrebMJGgAL3DIK91tQ-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-106a48f2df7so7585200fac.16
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 04:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBKIaecUD13cIBswPGPTp8AjChGPi8/Yp+2lKHbqeXI=;
 b=Mtl7LGwyB9yh9ri/Q5wSBKUKvnpbgIUrbFb5pwSIqsumbAPR7fis/yjSp3LXtQijXD
 cpn66OLDQ41OKDc+FBYK/WLCUvnopIun3aVkRFhz6AtemzyBGruksJkLvuOW5VRGIKcL
 9U7Q2+ISSFHsF8AoQID5aCpxE+Nbuctp9i7l+6VLbB4s4b+YnTMpTzZtH3gNUvcaFGsK
 v3NFYCsrxfhEuT3rD5ml3tdSy4QWHEMGoHFw41NAgPhlHzjY3b8/jZ4tgtd79TGonNur
 dRRqyqqxkywVemW1Z3jqYvt8w+qTap8DYWbFbUDqfrd/BVsFsaJSr4bpGxLDZPakPXb2
 cY7A==
X-Gm-Message-State: AJIora/kqV+ICrMUcSYb3qfuBsVQELPDHKGYJnsD/ygb/Wka6ptXCZD/
 Yg42Xkz6iLACNnADhRxe9fE2dgGqNQjPc5d75SU7mCNjMn/MwjZ66ahxy9AbENYDEdNhxhzDtl3
 7rNBRa0/FOjmLDSfwnuuimDeZjafPV1M=
X-Received: by 2002:a05:6830:58:b0:61c:cf3c:14b8 with SMTP id
 d24-20020a056830005800b0061ccf3c14b8mr6184041otp.38.1658835334008; 
 Tue, 26 Jul 2022 04:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1teWtuuLaHKUGx9QNmdizDt25MYDfREAr2mAO97ZVZIseJrGpCJJERcAl+9QZAy8JDCNaWqbMx0sStT6+MltQ0=
X-Received: by 2002:a05:6830:58:b0:61c:cf3c:14b8 with SMTP id
 d24-20020a056830005800b0061ccf3c14b8mr6184027otp.38.1658835333790; Tue, 26
 Jul 2022 04:35:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220726092248.128336-1-frankja@linux.ibm.com>
 <20220726092248.128336-3-frankja@linux.ibm.com>
In-Reply-To: <20220726092248.128336-3-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 26 Jul 2022 15:35:22 +0400
Message-ID: <CAMxuvazFw2eD1dTQJOQniQCc4faJd3zQw0jtfKdKygWEEtPe5A@mail.gmail.com>
Subject: Re: [PATCH v4 02/17] dump: Introduce GuestPhysBlock offset and length
 filter functions
To: Janosch Frank <frankja@linux.ibm.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Bonzini, Paolo" <pbonzini@redhat.com>,
 mhartmay@linux.ibm.com, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, imbrenda@linux.ibm.com, 
 Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, seiden@linux.ibm.com,
 scgl@linux.ibm.com
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

On Tue, Jul 26, 2022 at 1:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> The iteration over the memblocks is hard to understand so it's about
> time to clean it up. Instead of manually grabbing the next memblock we
> can use QTAILQ_FOREACH to iterate over all memblocks.
>
> Additionally we move the calculation of the offset and length out by
> using the dump_get_memblock_*() functions.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  dump/dump.c           | 37 +++++++++++++++++++++++++++++++++++++
>  include/sysemu/dump.h |  5 +++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 0ed7cf9c7b..0fd7c76c1e 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -591,6 +591,43 @@ static void dump_begin(DumpState *s, Error **errp)
>      write_elf_notes(s, errp);
>  }
>
> +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
> +                               int64_t filter_area_length)
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
> +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
> +                                int64_t filter_area_length)
> +{
> +    if (filter_area_length) {
> +        /* return -1 if the block is not within filter area */
> +        if (block->target_start >= filter_area_start + filter_area_length ||
> +            block->target_end <= filter_area_start) {
> +            return -1;
> +        }
> +
> +        if (filter_area_start > block->target_start) {
> +            return filter_area_start - block->target_start;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static int get_next_block(DumpState *s, GuestPhysBlock *block)
>  {
>      while (1) {
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..6ce3c24197 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -203,4 +203,9 @@ typedef struct DumpState {
>  uint16_t cpu_to_dump16(DumpState *s, uint16_t val);
>  uint32_t cpu_to_dump32(DumpState *s, uint32_t val);
>  uint64_t cpu_to_dump64(DumpState *s, uint64_t val);
> +
> +int64_t dump_get_memblock_size(GuestPhysBlock *block, int64_t filter_area_start,
> +                               int64_t filter_area_length);
> +int64_t dump_get_memblock_start(GuestPhysBlock *block, int64_t filter_area_start,
> +                                int64_t filter_area_length);

The functions don't need to be exported. You probably need to
introduce them back with their usage, to avoid some compiler warning.
If you can't split the introduction and related refactoring, then
let's have a single patch.

Thanks

>  #endif
> --
> 2.34.1
>


