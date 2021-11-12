Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8070844E654
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 13:27:37 +0100 (CET)
Received: from localhost ([::1]:51520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlVea-0008Rp-CS
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 07:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlVcm-0006qZ-0Q
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:25:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlVci-0000pf-I9
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 07:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636719939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MnleM2nclZSZtiEGVon7lV9NbFSZ13G5iSmOJtCL0Y8=;
 b=ZR/oo0n4huo/95hLApm+cILfl7jj0UCUMZJ4q5Tz8hh6QgXEUePxJhM3sUlN0wiFrrxUAB
 Usrfhcm1ok7ac8bbES4ulnZ9va09Ks7bfnrul4lo9ar5mC95f+eInfusgcL0z1ofZfIaKo
 GX/nFJkz1sJv9mfx6TmfQSB5I2NZDGw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-SrZc4DLwMymsIgr6JfpMZQ-1; Fri, 12 Nov 2021 07:25:38 -0500
X-MC-Unique: SrZc4DLwMymsIgr6JfpMZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r12-20020adfdc8c000000b0017d703c07c0so1561812wrj.0
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 04:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MnleM2nclZSZtiEGVon7lV9NbFSZ13G5iSmOJtCL0Y8=;
 b=pop6m098o0VyIbBdTOeSge1lQw2DuTvamAwiyCgUcUZ59PYY7t/TQuay+Y22/8oFUA
 hOIo21sKlK5QgNrjSPQAbVNYMQ3qxr8+H/41PeP7W+1tPSp4yveGcM3FoSKsYwdpUnKb
 ys+IEssXu8WPWipubaSUK56BpzleupBhgOlPmmE5nHqVO+CFw4aGGiHyu2bUTgoM1r2Q
 arCZO7NDgoZk3cgh4iSe5fIQGybebHl2B/ziMj45hdXeGY9UKz/XMyUxTjGKJ1t0nz0i
 YLYCiXL7ZtLvuWWp6nCz6rr979eaTnbzSPndaQgB52HdsM8fmpoZjD+i0PHY4vLiRS43
 kQEw==
X-Gm-Message-State: AOAM532MoSdwsKQI3BukjzPLLVAlOasKTw/gm+zW/7dAT51Tx2H0GO93
 K2nBS7tvGtrLDGPo8MCCwO3ZOeIE2DZdDT8VEiJ7NIH7l6jXsJKyMSRR7DvYLhOApVl74zb5wta
 +lzoYkkPQYSCrGUo=
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr33811113wmr.118.1636719937475; 
 Fri, 12 Nov 2021 04:25:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf3dGkf/OZ9475m+uMFwJXHU4YRqUuXbi3I8vxGwFG5SZrWo5igj0Jepp3KsvEQrOI+Uq+JQ==
X-Received: by 2002:a05:600c:ac2:: with SMTP id
 c2mr33811076wmr.118.1636719937274; 
 Fri, 12 Nov 2021 04:25:37 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o12sm6248589wmq.12.2021.11.12.04.25.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 04:25:37 -0800 (PST)
Message-ID: <7b87d8bd-b742-8fbc-a127-a6b47b2b03d4@redhat.com>
Date: Fri, 12 Nov 2021 13:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/25] include/block/block: split header into I/O and
 global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-3-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-3-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> block.h currently contains a mix of functions:
> some of them run under the BQL and modify the block layer graph,
> others are instead thread-safe and perform I/O in iothreads.
> It is not easy to understand which function is part of which
> group (I/O vs GS), and this patch aims to clarify it.
>
> The "GS" functions need the BQL, and often use
> aio_context_acquire/release and/or drain to be sure they
> can modify the graph safely.
> The I/O function are instead thread safe, and can run in
> any AioContext.
>
> By splitting the header in two files, block-io.h
> and block-global-state.h we have a clearer view on what
> needs what kind of protection. block-common.h
> contains common structures shared by both headers.
>
> block.h is left there for legacy and to avoid changing
> all includes in all c files that use the block APIs.
>
> Assertions are added in the next patch.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   block.c                            |   3 +
>   block/meson.build                  |   7 +-
>   include/block/block-common.h       | 389 +++++++++++++
>   include/block/block-global-state.h | 286 ++++++++++
>   include/block/block-io.h           | 306 ++++++++++
>   include/block/block.h              | 878 +----------------------------
>   6 files changed, 1012 insertions(+), 857 deletions(-)
>   create mode 100644 include/block/block-common.h
>   create mode 100644 include/block/block-global-state.h
>   create mode 100644 include/block/block-io.h

[...]

> diff --git a/include/block/block-common.h b/include/block/block-common.h
> new file mode 100644
> index 0000000000..4f1fd8de21
> --- /dev/null
> +++ b/include/block/block-common.h

[...]

> +#define BLKDBG_EVENT(child, evt) \
> +    do { \
> +        if (child) { \
> +            bdrv_debug_event(child->bs, evt); \
> +        } \
> +    } while (0)

This is defined twice, once here, and...

> diff --git a/include/block/block-io.h b/include/block/block-io.h
> new file mode 100644
> index 0000000000..9af4609ccb
> --- /dev/null
> +++ b/include/block/block-io.h

[...]

> +#define BLKDBG_EVENT(child, evt) \
> +    do { \
> +        if (child) { \
> +            bdrv_debug_event(child->bs, evt); \
> +        } \
> +    } while (0)

...once here.

[...]

> +/**
> + * bdrv_drained_begin:
> + *
> + * Begin a quiesced section for exclusive access to the BDS, by disabling
> + * external request sources including NBD server and device model. Note that
> + * this doesn't block timers or coroutines from submitting more requests, which
> + * means block_job_pause is still necessary.

Where does this sentence come from?  I can’t see it in master or in the 
lines removed from block.h:

> + *
> + * This function can be recursive.
> + */
> +void bdrv_drained_begin(BlockDriverState *bs);

[...]

> diff --git a/include/block/block.h b/include/block/block.h
> index e5dd22b034..1e6b8fef1e 100644
> --- a/include/block/block.h
> +++ b/include/block/block.h

[...]

> -/**
> - * bdrv_drained_begin:
> - *
> - * Begin a quiesced section for exclusive access to the BDS, by disabling
> - * external request sources including NBD server, block jobs, and device model.
> - *
> - * This function can be recursive.
> - */
> -void bdrv_drained_begin(BlockDriverState *bs);


