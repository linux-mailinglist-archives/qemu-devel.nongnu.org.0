Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FA48EFD2
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:22:15 +0100 (CET)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RDK-0006iM-VM
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:22:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8RBi-0005Dd-1k
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8RBf-0002QF-69
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:20:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642184430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DTAbu6rrAfAFfknXtTRdSB/Kc5lgN1wqlgj+tOqWiMo=;
 b=Th7Hf6k1tU/qrgW4dG110NbfNuJhIouMWvB4ukqkbK1n5Zj4aBFVvQJzaHi+WjTNAIoVDH
 KwlkKTs4LYjT6Cq/18GI87qbAtBmXsi5RNdqh0K44MJlCSt8ITdAmYdN7YdAJyGz0Uo3a2
 rtk4BL0MsSRzzjdWXpwAtmXBW12ZenQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-HXEE3TpsMnakw6YhdFzFfQ-1; Fri, 14 Jan 2022 13:20:28 -0500
X-MC-Unique: HXEE3TpsMnakw6YhdFzFfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 a68-20020a1c9847000000b00346939a2d7cso2327486wme.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:20:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DTAbu6rrAfAFfknXtTRdSB/Kc5lgN1wqlgj+tOqWiMo=;
 b=OkVfdBAfWdz6izciXgMbobdFlhA1JLEZ6+gByfB+fO5iDqxUFphKOozA4LRlJhQH/6
 hZKX1qe3k81wzsaEUfJMJ2oayC475WYHRYw0KvIlhvjarGPM7GpmTjO5h15FaTDtbYMh
 RYZz39HBuAKmshP9S4L0sGy19r8efwh96v/X9q7WeKc6DTyYtYVRmBtbB1YXDsAHn+n8
 AOFEkLUT3ruOXRoFg/DNaDI0g24mzPu026iQhdZ3AEJGuzIEobJPcfu2MvHj7eghvCDZ
 bTcEY7MNEMnAY5kEMJgJGavrZ88hp1V67ZbuAbFSHcGFsBDbjr6XINPgFd33KRI2S3kl
 4Ebg==
X-Gm-Message-State: AOAM532T3E8+lpUWeotW+4AoLQ+mtXJP6esVxCU0Ns+EyzQGGqDomkSU
 3QIufukbVT0VE5ociEgs1jvyppSM0yxn32xc4xOQXQoWw2DmndQN+EcevhU+AH2QGxnyOTlM4De
 KsYc37HDDPoYOxR0=
X-Received: by 2002:adf:bc4d:: with SMTP id a13mr9483333wrh.415.1642184427549; 
 Fri, 14 Jan 2022 10:20:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPanvEclUM4R7HXbdQ1lOUTKPZhJqxMOmltDX7m+EU2avYzoYhT757Gt6uD/Xj6zxLYgQdRA==
X-Received: by 2002:adf:bc4d:: with SMTP id a13mr9483306wrh.415.1642184427217; 
 Fri, 14 Jan 2022 10:20:27 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b5sm5810079wrr.19.2022.01.14.10.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 10:20:26 -0800 (PST)
Message-ID: <d74ba93e-7fd7-3738-50e0-a1dcc91d4076@redhat.com>
Date: Fri, 14 Jan 2022 19:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 06/19] block: intoduce reqlist
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-7-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-7-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> Split intersecting-requests functionality out of block-copy to be
> reused in copy-before-write filter.
>
> Note: while being here, fix tiny typo in MAINTAINERS.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/reqlist.h |  67 +++++++++++++++++++++++
>   block/block-copy.c      | 116 +++++++++++++---------------------------
>   block/reqlist.c         |  76 ++++++++++++++++++++++++++
>   MAINTAINERS             |   4 +-
>   block/meson.build       |   1 +
>   5 files changed, 184 insertions(+), 80 deletions(-)
>   create mode 100644 include/block/reqlist.h
>   create mode 100644 block/reqlist.c

Looks good to me, this split makes sense.

I have just minor comments (50 % about pre-existing things) below.

> diff --git a/include/block/reqlist.h b/include/block/reqlist.h
> new file mode 100644
> index 0000000000..b904d80216
> --- /dev/null
> +++ b/include/block/reqlist.h
> @@ -0,0 +1,67 @@
> +/*
> + * reqlist API
> + *
> + * Copyright (C) 2013 Proxmox Server Solutions
> + * Copyright (c) 2021 Virtuozzo International GmbH.
> + *
> + * Authors:
> + *  Dietmar Maurer (dietmar@proxmox.com)
> + *  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef REQLIST_H
> +#define REQLIST_H
> +
> +#include "qemu/coroutine.h"
> +
> +/*
> + * The API is not thread-safe and shouldn't be. The struct is public to be part
> + * of other structures and protected by third-party locks, see
> + * block/block-copy.c for example.
> + */
> +
> +typedef struct BlockReq {
> +    int64_t offset;
> +    int64_t bytes;
> +
> +    CoQueue wait_queue; /* coroutines blocked on this req */
> +    QLIST_ENTRY(BlockReq) list;
> +} BlockReq;
> +
> +typedef QLIST_HEAD(, BlockReq) BlockReqList;
> +
> +/*
> + * Initialize new request and add it to the list. Caller should be sure that

I’d say s/should/must/, because that is guarded by an assertion.

> + * there are no conflicting requests in the list.
> + */
> +void reqlist_init_req(BlockReqList *reqs, BlockReq *req, int64_t offset,
> +                      int64_t bytes);
> +/* Search for request in the list intersecting with @offset/@bytes area. */
> +BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
> +                                int64_t bytes);
> +
> +/*
> + * If there are no intersecting requests return false. Otherwise, wait for the
> + * first found intersecting request to finish and return true.
> + *
> + * @lock is passed to qemu_co_queue_wait()
> + * False return value proves that lock was NOT released.

I’d say “was released at no point” instead, because when first reading 
this I understood it to mean that lock simply is locked when this 
function returns, and so I thought that this implies that when `true` is 
returned, the lock is released (and remains released).

> + */
> +bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
> +                                   int64_t bytes, CoMutex *lock);
> +
> +/*
> + * Shrink request and wake all waiting coroutines (may be some of them are not

s/may be/maybe/

> + * intersecting with shrunk request).
> + */
> +void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes);
> +
> +/*
> + * Remove request and wake all waiting coroutines. Do not release any memory.
> + */
> +void coroutine_fn reqlist_remove_req(BlockReq *req);
> +
> +#endif /* REQLIST_H */

> diff --git a/block/reqlist.c b/block/reqlist.c
> new file mode 100644
> index 0000000000..5e320ba649
> --- /dev/null
> +++ b/block/reqlist.c
> @@ -0,0 +1,76 @@

[...]

> +BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
> +                                int64_t bytes)
> +{
> +    BlockReq *r;
> +
> +    QLIST_FOREACH(r, reqs, list) {
> +        if (offset + bytes > r->offset && offset < r->offset + r->bytes) {

(Late, I know, the old code was exactly this, but:) Why not use 
ranges_overlap()?

> +            return r;
> +        }
> +    }
> +
> +    return NULL;
> +}


