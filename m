Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978434C3CE7
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 05:09:09 +0100 (CET)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNRum-0003DA-E2
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 23:09:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nNRsp-00019R-2Q
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 23:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nNRsk-0003WZ-Vo
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 23:07:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645762022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OQXwnk+mqVacu6EKzF5eXWl27E6g/z/GL3bmgaFrdOA=;
 b=KU+6YLbmXXR3vxr6pDJbegU8Ggld1VnM8n0rk0YUiISMp+4r7VPfTE5P7DUmY1T8SjEHS7
 0wzCLLMCg51Gyga00iR7w/JFslphcqU462RDn64IBysay/0bgSePxeH2cGGQHr+ep8tZf4
 Q+EzeFqYx488iVUe5pGSZysyE+xmTQ0=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-viDgdA5KOtKza60KxqyLfQ-1; Thu, 24 Feb 2022 23:07:00 -0500
X-MC-Unique: viDgdA5KOtKza60KxqyLfQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 b9-20020a17090aa58900b001b8b14b4aabso2559097pjq.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 20:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OQXwnk+mqVacu6EKzF5eXWl27E6g/z/GL3bmgaFrdOA=;
 b=4hzKALoizPzj7/guY2R15ASsmFtAtAtUREIDCCjdcselGrIzoWTnVul1Eno5rkbRwl
 Gw9xYuVqxeqWZHbCAQ0BLV38bLkfwMdOHtcvwh9v45A6/UDsJxXsrjCI05jfH1EsmK1b
 UXPecEe3VkzG9bhTxW6i6z1xTA+C4vhwv+ZyZLs+V6Y7fTV/IVObDCZvDq8m/Yu8LGec
 wYTgkvYMY/yhjCOiuWCuPGppU7U9N+lM+D1vzTWqh8y9jNhK9J6DDksMS+kSZ3PrWUgN
 1q1SkGEqq37eGJ/Wux2+jiu6zp6jnz+c8Ar3d4tyzExKczVk0VKxY3ryWcb4G5dOF7rV
 1J2A==
X-Gm-Message-State: AOAM530OjMdGYv62hI3+oCSxQksreNjHisGQdnxxiWseFpyFc55acG2v
 ULGeGE3DSXA6Z5OpLI1N/dmkIw8aiJv9AfNl85r6YeConWsQuFkKBSmi37iFNSnOFCIcuOrV1kB
 25o4/Inqy76J565M=
X-Received: by 2002:a17:902:8509:b0:14f:1b7e:4c23 with SMTP id
 bj9-20020a170902850900b0014f1b7e4c23mr5545052plb.102.1645762019672; 
 Thu, 24 Feb 2022 20:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzp4Yb3BPJfcCGBeh3gIIi9FweD/9Juh6i8YaA5+d8nvloDlI3CtBt1v1/C5g2mvtN05EQQ8g==
X-Received: by 2002:a17:902:8509:b0:14f:1b7e:4c23 with SMTP id
 bj9-20020a170902850900b0014f1b7e4c23mr5545034plb.102.1645762019283; 
 Thu, 24 Feb 2022 20:06:59 -0800 (PST)
Received: from [10.72.13.160] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 142-20020a621894000000b004dfc714b076sm1150629pfy.11.2022.02.24.20.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 20:06:58 -0800 (PST)
Message-ID: <e6e8564a-7739-cd6b-13a3-a6c0ba4c2890@redhat.com>
Date: Fri, 25 Feb 2022 12:06:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH] aio-posix: fix spurious ->poll_ready() callbacks in main
 loop
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220223155703.136833-1-stefanha@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220223155703.136833-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/23 下午11:57, Stefan Hajnoczi 写道:
> When ->poll() succeeds the AioHandler is placed on the ready list with
> revents set to the magic value 0. This magic value causes
> aio_dispatch_handler() to invoke ->poll_ready() instead of ->io_read()
> for G_IO_IN or ->io_write() for G_IO_OUT.
>
> This magic value 0 hack works for the IOThread where AioHandlers are
> placed on ->ready_list and processed by aio_dispatch_ready_handlers().
> It does not work for the main loop where all AioHandlers are processed
> by aio_dispatch_handlers(), even those that are not ready and have a
> revents value of 0.
>
> As a result the main loop invokes ->poll_ready() on AioHandlers that are
> not ready. These spurious ->poll_ready() calls waste CPU cycles and
> could lead to crashes if the code assumes ->poll() must have succeeded
> before ->poll_ready() is called (a reasonable asumption but I haven't
> seen it in practice).
>
> Stop using revents to track whether ->poll_ready() will be called on an
> AioHandler. Introduce a separate AioHandler->poll_ready field instead.
> This eliminates spurious ->poll_ready() calls in the main loop.
>
> Fixes: 826cc32423db2a99d184dbf4f507c737d7e7a4ae ("aio-posix: split poll check from ready handler")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>


Reported-by: Jason Wang <jasowang@redhat.com>

Tested-by: Jason Wang <jasowang@redhat.com>

Thanks


> ---
>   util/aio-posix.h |  1 +
>   util/aio-posix.c | 32 ++++++++++++++++++--------------
>   2 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/util/aio-posix.h b/util/aio-posix.h
> index 7f2c37a684..80b927c7f4 100644
> --- a/util/aio-posix.h
> +++ b/util/aio-posix.h
> @@ -37,6 +37,7 @@ struct AioHandler {
>       unsigned flags; /* see fdmon-io_uring.c */
>   #endif
>       int64_t poll_idle_timeout; /* when to stop userspace polling */
> +    bool poll_ready; /* has polling detected an event? */
>       bool is_external;
>   };
>   
> diff --git a/util/aio-posix.c b/util/aio-posix.c
> index 7b9f629218..be0182a3c6 100644
> --- a/util/aio-posix.c
> +++ b/util/aio-posix.c
> @@ -23,15 +23,6 @@
>   #include "trace.h"
>   #include "aio-posix.h"
>   
> -/*
> - * G_IO_IN and G_IO_OUT are not appropriate revents values for polling, since
> - * the handler may not need to access the file descriptor. For example, the
> - * handler doesn't need to read from an EventNotifier if it polled a memory
> - * location and a read syscall would be slow. Define our own unique revents
> - * value to indicate that polling determined this AioHandler is ready.
> - */
> -#define REVENTS_POLL_READY 0
> -
>   /* Stop userspace polling on a handler if it isn't active for some time */
>   #define POLL_IDLE_INTERVAL_NS (7 * NANOSECONDS_PER_SECOND)
>   
> @@ -49,6 +40,14 @@ void aio_add_ready_handler(AioHandlerList *ready_list,
>       QLIST_INSERT_HEAD(ready_list, node, node_ready);
>   }
>   
> +static void aio_add_poll_ready_handler(AioHandlerList *ready_list,
> +                                       AioHandler *node)
> +{
> +    QLIST_SAFE_REMOVE(node, node_ready); /* remove from nested parent's list */
> +    node->poll_ready = true;
> +    QLIST_INSERT_HEAD(ready_list, node, node_ready);
> +}
> +
>   static AioHandler *find_aio_handler(AioContext *ctx, int fd)
>   {
>       AioHandler *node;
> @@ -76,6 +75,7 @@ static bool aio_remove_fd_handler(AioContext *ctx, AioHandler *node)
>       }
>   
>       node->pfd.revents = 0;
> +    node->poll_ready = false;
>   
>       /* If the fd monitor has already marked it deleted, leave it alone */
>       if (QLIST_IS_INSERTED(node, node_deleted)) {
> @@ -247,7 +247,7 @@ static bool poll_set_started(AioContext *ctx, AioHandlerList *ready_list,
>   
>           /* Poll one last time in case ->io_poll_end() raced with the event */
>           if (!started && node->io_poll(node->opaque)) {
> -            aio_add_ready_handler(ready_list, node, REVENTS_POLL_READY);
> +            aio_add_poll_ready_handler(ready_list, node);
>               progress = true;
>           }
>       }
> @@ -282,6 +282,7 @@ bool aio_pending(AioContext *ctx)
>       QLIST_FOREACH_RCU(node, &ctx->aio_handlers, node) {
>           int revents;
>   
> +        /* TODO should this check poll ready? */
>           revents = node->pfd.revents & node->pfd.events;
>           if (revents & (G_IO_IN | G_IO_HUP | G_IO_ERR) && node->io_read &&
>               aio_node_check(ctx, node->is_external)) {
> @@ -323,11 +324,15 @@ static void aio_free_deleted_handlers(AioContext *ctx)
>   static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
>   {
>       bool progress = false;
> +    bool poll_ready;
>       int revents;
>   
>       revents = node->pfd.revents & node->pfd.events;
>       node->pfd.revents = 0;
>   
> +    poll_ready = node->poll_ready;
> +    node->poll_ready = false;
> +
>       /*
>        * Start polling AioHandlers when they become ready because activity is
>        * likely to continue.  Note that starvation is theoretically possible when
> @@ -344,7 +349,7 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
>           QLIST_INSERT_HEAD(&ctx->poll_aio_handlers, node, node_poll);
>       }
>       if (!QLIST_IS_INSERTED(node, node_deleted) &&
> -        revents == 0 &&
> +        poll_ready && revents == 0 &&
>           aio_node_check(ctx, node->is_external) &&
>           node->io_poll_ready) {
>           node->io_poll_ready(node->opaque);
> @@ -432,7 +437,7 @@ static bool run_poll_handlers_once(AioContext *ctx,
>       QLIST_FOREACH_SAFE(node, &ctx->poll_aio_handlers, node_poll, tmp) {
>           if (aio_node_check(ctx, node->is_external) &&
>               node->io_poll(node->opaque)) {
> -            aio_add_ready_handler(ready_list, node, REVENTS_POLL_READY);
> +            aio_add_poll_ready_handler(ready_list, node);
>   
>               node->poll_idle_timeout = now + POLL_IDLE_INTERVAL_NS;
>   
> @@ -491,8 +496,7 @@ static bool remove_idle_poll_handlers(AioContext *ctx,
>                    * this causes progress.
>                    */
>                   if (node->io_poll(node->opaque)) {
> -                    aio_add_ready_handler(ready_list, node,
> -                                          REVENTS_POLL_READY);
> +                    aio_add_poll_ready_handler(ready_list, node);
>                       progress = true;
>                   }
>               }


