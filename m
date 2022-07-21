Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31257CD99
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 16:28:00 +0200 (CEST)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEX9j-0000WK-6Y
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 10:27:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEX6I-000657-AH
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:24:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oEX6E-0008Pw-K7
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 10:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658413461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+3EP+yob99qzXuJIiGh+LzqQrHvZGCf0X0ZzEM8qcY4=;
 b=L0uSVqWeXQT2MrexRQRhRWU7OmY5ad8Z00PLMZMlRzPVB1mlTgTi6bpCWWH+6zn9+NWmQM
 f+/JeNc8OZqmqcZdDNG2/gS+U7oZnvhBbXUrDPLKZg6X2MMZbViy2iztdZC5CaIiZxeN5N
 kt/Ai+55iM13EI7RZMGvYHssTbY7ipw=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-3EkmddxQNByy82yXjmiZsQ-1; Thu, 21 Jul 2022 10:24:14 -0400
X-MC-Unique: 3EkmddxQNByy82yXjmiZsQ-1
Received: by mail-oi1-f199.google.com with SMTP id
 i5-20020aca2b05000000b0033a509b7255so867757oik.21
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 07:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+3EP+yob99qzXuJIiGh+LzqQrHvZGCf0X0ZzEM8qcY4=;
 b=QT1jHvWyEaPFjxSDZcdsEYPBZ19W805r2ORcTlTFQGvHRA2Cq6JDB/PjPKczmkocg5
 RMmsqUwqLqkvMhZy+DeTefDugD+bBaUnWDjlqhrpCgXuI0sma+ZR+ylVBPGckVje+c2X
 uM0/szaHrcy12tXmwlqgvk7H9HKaCA48WLEdB5nXliHqeCw0mrE9n1pMgmiS93kjlUbT
 9Lb+9ddIUFPf4QQrVqJi6YlDbw7/2JF7lQXPH5C9L/ViSu+RUDQvKmgIx75odetKQZbb
 nmwGMzNBc1tyU5zjF2RtNGfknOBLnihi4QIUIrtsWa8ReqnEAvS9KKcBG7jG2T84ROB3
 HYDw==
X-Gm-Message-State: AJIora8FIswcDF+GeGJzGv7jpWWJ3JIlaWard+9w8P77bt465Ruh+cre
 V3GLrSOlFZEjHyQSAs5N1S1Xa+D2vjz1xLKWMfNVVKVG9Hnf0bal63PNVmvvv75drKT/VajYADx
 TfgSd+bpF7jC7qijKSaW+MuzKS4KLNuc=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5391637oab.205.1658413453409; 
 Thu, 21 Jul 2022 07:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t1u57nuQJIUKjbuDfNpS6jqomQ3aZm95OcQSgVTspE8jYUparwNiFdbunEc/cET4txXpxycrQnI+kvodHjd5k=
X-Received: by 2002:a05:6870:f627:b0:10c:9be9:5306 with SMTP id
 ek39-20020a056870f62700b0010c9be95306mr5391621oab.205.1658413453174; Thu, 21
 Jul 2022 07:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220721132256.2171-1-frankja@linux.ibm.com>
 <20220721132256.2171-2-frankja@linux.ibm.com>
In-Reply-To: <20220721132256.2171-2-frankja@linux.ibm.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 21 Jul 2022 18:24:02 +0400
Message-ID: <CAMxuvawXSMHbo3KbaBPqhqd5NLi4_+Ezt+vY=B4c+q8w2yi0zA@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] dump: Introduce GuestPhysBlock offset and length
 filter functions
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

Hi

On Thu, Jul 21, 2022 at 5:23 PM Janosch Frank <frankja@linux.ibm.com> wrote:
>
> As the code is used in multiple places in dump/dump.c we should
> introduce functions that calculate the filtered length and offset of a
> GuestPhysBlock so we can use them in the next patch.
>
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>  include/sysemu/dump.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index ffc2ea1072..2b39abeeae 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -203,4 +203,41 @@ typedef struct DumpState {
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

Why inline the function and have it in the header? (similar for other
inline functions in the series - except obvious empty/stubs functions)

>  #endif
> --
> 2.34.1
>


