Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617A361100D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:52:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNtv-0008OS-G6; Fri, 28 Oct 2022 07:51:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ooNtr-0008NU-LE
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:51:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ooNtp-0005Z0-Ls
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:51:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666957905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1JAliku7A+XSm133dMznXAZOQQ+R4F6kQRqImSTbDdE=;
 b=ObVWqA5Xa6PB10tUUA/5X7DZAFA2Anu4tULZB0qHcZl6QMDGIXIIuaRrP2xhy0324Tr/kN
 9Vc1EpRixPn02uppVX6iW64LXGTNHveq+pLACPFBE7TzbPe0tePdtf+dCEjoi4uxthqRGt
 H+MzmJ4yN9DwvLSc/JZ2Thk7NE/39LM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-rB7lu6syObKhXAtXSDAM-Q-1; Fri, 28 Oct 2022 07:51:42 -0400
X-MC-Unique: rB7lu6syObKhXAtXSDAM-Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 s7-20020a1cf207000000b003cf56bad2e2so1016347wmc.9
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 04:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1JAliku7A+XSm133dMznXAZOQQ+R4F6kQRqImSTbDdE=;
 b=nU+tMmU4c9HbaLCAXswP4Jg1DkmpzYJq9ZCIvKgm3oRCPZomyLvLsnJB17gxEO0g2L
 fRMQ3tnjN0ho8WkSRr7tG++956qrjrJXu3oOnd8fAYnc37g1pk5uCljOrpfgA2b0KKNo
 1WWvrVE7LBC3dDlCINuOCTKQIg+2ovs0oyUKJ0cB4x+T0i9G7myzizgNkjesKIJJq8Mz
 rW4ZLVzvZHo2WSyvK3/OvcX6St0VGOvWXAleKUIwCs2+jWMOqc5Y8odLQSi7jLGQ0MQ9
 mkYDGFwd/YQaoPAefbNOiIaYUwMOiq48uRpKXqiMW4hB3uqMaeJvVhCitH2K3b2WhGxg
 E1CA==
X-Gm-Message-State: ACrzQf2kNtJja1Q+a1k8H7TPQSv3OwMeiqfwbetG8n8KZcKn/mK1uS0E
 LCAG7DkJlzPOpTZGxc9+SmQ5EdpPyKEx5AkkL3ExczXVVapejO1tcBhsePySHQl/JG7euZ+kURc
 04B4+dUFgD14IkKA=
X-Received: by 2002:a1c:7c15:0:b0:3cf:5c5c:ab85 with SMTP id
 x21-20020a1c7c15000000b003cf5c5cab85mr2295031wmc.175.1666957901672; 
 Fri, 28 Oct 2022 04:51:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4IevsSznyOcx5vKM+hWWLu2n6L45BWbjlh0SIX6Mg7LoUmvCP8/cGJc8OeMbBVCUIzJXZs7w==
X-Received: by 2002:a1c:7c15:0:b0:3cf:5c5c:ab85 with SMTP id
 x21-20020a1c7c15000000b003cf5c5cab85mr2295003wmc.175.1666957901335; 
 Fri, 28 Oct 2022 04:51:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 o42-20020a05600c512a00b003b4868eb71bsm8151546wms.25.2022.10.28.04.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 04:51:40 -0700 (PDT)
Message-ID: <7d34077e-ee9d-26ea-ad94-ecc5c7f7376c@redhat.com>
Date: Fri, 28 Oct 2022 13:51:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/3] linux-aio: use LinuxAioState from the running
 thread
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221028071635.3037348-1-eesposit@redhat.com>
 <20221028071635.3037348-2-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221028071635.3037348-2-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 09:16, Emanuele Giuseppe Esposito wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> Remove usage of aio_context_acquire by always submitting asynchronous
> AIO to the current thread's LinuxAioState.
> 
> In order to prevent mistakes from the caller side, avoid passing LinuxAioState
> in laio_io_{plug/unplug} and laio_co_submit.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/file-posix.c      | 10 +++-------
>   block/linux-aio.c       | 34 ++++++++++++++++++----------------
>   include/block/aio.h     |  4 ----
>   include/block/raw-aio.h | 10 ++++------
>   4 files changed, 25 insertions(+), 33 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 23acffb9a4..23fe98eb3e 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2099,10 +2099,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>   #endif
>   #ifdef CONFIG_LINUX_AIO
>       } else if (s->use_linux_aio) {
> -        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
>           assert(qiov->size == bytes);
> -        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
> -                              s->aio_max_batch);
> +        return laio_co_submit(s->fd, offset, qiov, type, s->aio_max_batch);
>   #endif
>       }
>   
> @@ -2142,8 +2140,7 @@ static void raw_aio_plug(BlockDriverState *bs)
>       BDRVRawState __attribute__((unused)) *s = bs->opaque;
>   #ifdef CONFIG_LINUX_AIO
>       if (s->use_linux_aio) {
> -        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
> -        laio_io_plug(bs, aio);
> +        laio_io_plug();
>       }
>   #endif
>   #ifdef CONFIG_LINUX_IO_URING
> @@ -2159,8 +2156,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
>       BDRVRawState __attribute__((unused)) *s = bs->opaque;
>   #ifdef CONFIG_LINUX_AIO
>       if (s->use_linux_aio) {
> -        LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
> -        laio_io_unplug(bs, aio, s->aio_max_batch);
> +        laio_io_unplug(s->aio_max_batch);
>       }
>   #endif
>   #ifdef CONFIG_LINUX_IO_URING
> diff --git a/block/linux-aio.c b/block/linux-aio.c
> index d2cfb7f523..c806d3bb91 100644
> --- a/block/linux-aio.c
> +++ b/block/linux-aio.c
> @@ -16,6 +16,9 @@
>   #include "qemu/coroutine.h"
>   #include "qapi/error.h"
>   
> +/* Only used for assertions.  */
> +#include "qemu/coroutine_int.h"
> +
>   #include <libaio.h>
>   
>   /*
> @@ -56,10 +59,8 @@ struct LinuxAioState {
>       io_context_t ctx;
>       EventNotifier e;
>   
> -    /* io queue for submit at batch.  Protected by AioContext lock. */
> +    /* All data is only used in one I/O thread.  */
>       LaioQueue io_q;
> -
> -    /* I/O completion processing.  Only runs in I/O thread.  */
>       QEMUBH *completion_bh;
>       int event_idx;
>       int event_max;
> @@ -102,9 +103,8 @@ static void qemu_laio_process_completion(struct qemu_laiocb *laiocb)
>        * later.  Coroutines cannot be entered recursively so avoid doing
>        * that!
>        */
> -    if (!qemu_coroutine_entered(laiocb->co)) {
> -        aio_co_wake(laiocb->co);
> -    }
> +    assert(laiocb->co->ctx == laiocb->ctx->aio_context);
> +    qemu_coroutine_enter_if_inactive(laiocb->co);

This is wrong, it misses the aio_context_acquire/aio_context_release 
pair in aio_co_enter() (which is called by aio_co_wake()).

Likewise in patch 2.

Paolo


