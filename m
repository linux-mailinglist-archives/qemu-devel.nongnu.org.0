Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FCB61100F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 13:52:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooNuK-0008Tl-J2; Fri, 28 Oct 2022 07:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ooNuI-0008Td-Hu
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:52:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ooNuG-0005aS-P0
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 07:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666957932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwUOEls3yoL4rHGhhy128GLCi+TTjZ3KcbNnYxjW1f8=;
 b=RqM3zfv3UbDqFkMiL8Y+VoVxGDRNUyGFxXoZZOG5QSQBotniQScYv4h21lVPcyn0N/oksy
 sMaRZrCpHOczLYwQFbUyFDrTkZowtsau4kJFI4ODitbibC+PqV7AfkMGnXtaVlXOxq/5Fu
 +7uaFigfcnc1DRQiUgNOgpYhI6Zn0qA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-nuEo68KsNyKfXTn-vm-Ydg-1; Fri, 28 Oct 2022 07:52:10 -0400
X-MC-Unique: nuEo68KsNyKfXTn-vm-Ydg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p39-20020a05600c1da700b003cf608d10ccso487787wms.5
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 04:52:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zwUOEls3yoL4rHGhhy128GLCi+TTjZ3KcbNnYxjW1f8=;
 b=Pk6Kup7rmvXEO/cYMlnqjsIBX8zWku1s0SkAVAmfeJIjGrlOFh5MKgRqmB0MPyyy9y
 vmAqu9qiIJw7zcorKvrxloOqlXtIbEEH5IUI6EhYpki4MPRRCq33Dte+RJiD5yj/RF5o
 Jw6lsw6pjKc9KPdS/69E7muP+5GzXa2yl2KszaJf/pr7Gv6BkqqtlmdCnJeIkjGa4xsc
 aBBU8aVC7rrFB2qdivXKYTGS+HiL7lmePrUQrkdUidIlM9Ewc0PfyA+GGXgvTx3G3+hM
 F2WvZjq6bWE+KKYr8UEicO2nOJvjRqHJGtnrxR3HySj6Pe8uY61vKJ0jCq8d+X+Bps2B
 PaSg==
X-Gm-Message-State: ACrzQf024hIR7A57CTiDzeIqBQvWSUTgJoSXYSYCqwph/42yhKYISBTL
 s8HjfZTqAaWYgXaaSrAvyFFVATbSxFODORuLeHpJ5T/L5NUx78C/gbNa1EAywRwaoFft4UcXkCU
 As5CqjKJxD2rx8+g=
X-Received: by 2002:a05:600c:3d0f:b0:3cf:49ee:545d with SMTP id
 bh15-20020a05600c3d0f00b003cf49ee545dmr9159873wmb.195.1666957929651; 
 Fri, 28 Oct 2022 04:52:09 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KJ7H6777zmKhQPuxTDXrkfqDg09u0+wk1ZI8NbUIGY+UZTc9XeWCTC0DTwH0ioNodoKUhhQ==
X-Received: by 2002:a05:600c:3d0f:b0:3cf:49ee:545d with SMTP id
 bh15-20020a05600c3d0f00b003cf49ee545dmr9159857wmb.195.1666957929388; 
 Fri, 28 Oct 2022 04:52:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 bw5-20020a0560001f8500b00228d67db06esm3556970wrb.21.2022.10.28.04.52.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 04:52:08 -0700 (PDT)
Message-ID: <51318024-109f-fb02-a945-1c11b260dab8@redhat.com>
Date: Fri, 28 Oct 2022 13:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 3/3] thread-pool: use ThreadPool from the running thread
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Julia Suvorova <jusual@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20221028071635.3037348-1-eesposit@redhat.com>
 <20221028071635.3037348-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221028071635.3037348-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 09:16, Emanuele Giuseppe Esposito wrote:
> Use qemu_get_current_aio_context() where possible, since we always
> submit work to the current thread anyways.
> 
> We want to also be sure that the thread submitting the work is
> the same as the one processing the pool, to avoid adding
> synchronization to the pool list.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/file-posix.c    | 21 ++++++++++-----------
>   block/file-win32.c    |  2 +-
>   block/qcow2-threads.c |  2 +-
>   util/thread-pool.c    |  5 ++++-
>   4 files changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 3800dbd222..28f12b08c8 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -2044,11 +2044,10 @@ out:
>       return result;
>   }
>   
> -static int coroutine_fn raw_thread_pool_submit(BlockDriverState *bs,
> -                                               ThreadPoolFunc func, void *arg)
> +static int coroutine_fn raw_thread_pool_submit(ThreadPoolFunc func, void *arg)
>   {
>       /* @bs can be NULL, bdrv_get_aio_context() returns the main context then */
> -    ThreadPool *pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
> +    ThreadPool *pool = aio_get_thread_pool(qemu_get_current_aio_context());
>       return thread_pool_submit_co(pool, func, arg);
>   }
>   
> @@ -2116,7 +2115,7 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
>       };
>   
>       assert(qiov->size == bytes);
> -    return raw_thread_pool_submit(bs, handle_aiocb_rw, &acb);
> +    return raw_thread_pool_submit(handle_aiocb_rw, &acb);
>   }
>   
>   static int coroutine_fn raw_co_preadv(BlockDriverState *bs, int64_t offset,
> @@ -2186,7 +2185,7 @@ static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
>           return luring_co_submit(bs, s->fd, 0, NULL, QEMU_AIO_FLUSH);
>       }
>   #endif
> -    return raw_thread_pool_submit(bs, handle_aiocb_flush, &acb);
> +    return raw_thread_pool_submit(handle_aiocb_flush, &acb);
>   }
>   
>   static void raw_aio_attach_aio_context(BlockDriverState *bs,
> @@ -2248,7 +2247,7 @@ raw_regular_truncate(BlockDriverState *bs, int fd, int64_t offset,
>           },
>       };
>   
> -    return raw_thread_pool_submit(bs, handle_aiocb_truncate, &acb);
> +    return raw_thread_pool_submit(handle_aiocb_truncate, &acb);
>   }
>   
>   static int coroutine_fn raw_co_truncate(BlockDriverState *bs, int64_t offset,
> @@ -2998,7 +2997,7 @@ raw_do_pdiscard(BlockDriverState *bs, int64_t offset, int64_t bytes,
>           acb.aio_type |= QEMU_AIO_BLKDEV;
>       }
>   
> -    ret = raw_thread_pool_submit(bs, handle_aiocb_discard, &acb);
> +    ret = raw_thread_pool_submit(handle_aiocb_discard, &acb);
>       raw_account_discard(s, bytes, ret);
>       return ret;
>   }
> @@ -3073,7 +3072,7 @@ raw_do_pwrite_zeroes(BlockDriverState *bs, int64_t offset, int64_t bytes,
>           handler = handle_aiocb_write_zeroes;
>       }
>   
> -    return raw_thread_pool_submit(bs, handler, &acb);
> +    return raw_thread_pool_submit(handler, &acb);
>   }
>   
>   static int coroutine_fn raw_co_pwrite_zeroes(
> @@ -3284,7 +3283,7 @@ static int coroutine_fn raw_co_copy_range_to(BlockDriverState *bs,
>           },
>       };
>   
> -    return raw_thread_pool_submit(bs, handle_aiocb_copy_range, &acb);
> +    return raw_thread_pool_submit(handle_aiocb_copy_range, &acb);
>   }
>   
>   BlockDriver bdrv_file = {
> @@ -3614,7 +3613,7 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
>           struct sg_io_hdr *io_hdr = buf;
>           if (io_hdr->cmdp[0] == PERSISTENT_RESERVE_OUT ||
>               io_hdr->cmdp[0] == PERSISTENT_RESERVE_IN) {
> -            return pr_manager_execute(s->pr_mgr, bdrv_get_aio_context(bs),
> +            return pr_manager_execute(s->pr_mgr, qemu_get_current_aio_context(),
>                                         s->fd, io_hdr);
>           }
>       }
> @@ -3630,7 +3629,7 @@ hdev_co_ioctl(BlockDriverState *bs, unsigned long int req, void *buf)
>           },
>       };
>   
> -    return raw_thread_pool_submit(bs, handle_aiocb_ioctl, &acb);
> +    return raw_thread_pool_submit(handle_aiocb_ioctl, &acb);
>   }
>   #endif /* linux */
>   
> diff --git a/block/file-win32.c b/block/file-win32.c
> index ec9d64d0e4..3d7f59a592 100644
> --- a/block/file-win32.c
> +++ b/block/file-win32.c
> @@ -167,7 +167,7 @@ static BlockAIOCB *paio_submit(BlockDriverState *bs, HANDLE hfile,
>       acb->aio_offset = offset;
>   
>       trace_file_paio_submit(acb, opaque, offset, count, type);
> -    pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
> +    pool = aio_get_thread_pool(qemu_get_current_aio_context());
>       return thread_pool_submit_aio(pool, aio_worker, acb, cb, opaque);
>   }
>   
> diff --git a/block/qcow2-threads.c b/block/qcow2-threads.c
> index 1914baf456..9e370acbb3 100644
> --- a/block/qcow2-threads.c
> +++ b/block/qcow2-threads.c
> @@ -42,7 +42,7 @@ qcow2_co_process(BlockDriverState *bs, ThreadPoolFunc *func, void *arg)
>   {
>       int ret;
>       BDRVQcow2State *s = bs->opaque;
> -    ThreadPool *pool = aio_get_thread_pool(bdrv_get_aio_context(bs));
> +    ThreadPool *pool = aio_get_thread_pool(qemu_get_current_aio_context());
>   
>       qemu_co_mutex_lock(&s->lock);
>       while (s->nb_threads >= QCOW2_MAX_THREADS) {
> diff --git a/util/thread-pool.c b/util/thread-pool.c
> index 31113b5860..0e26687e97 100644
> --- a/util/thread-pool.c
> +++ b/util/thread-pool.c
> @@ -48,7 +48,7 @@ struct ThreadPoolElement {
>       /* Access to this list is protected by lock.  */
>       QTAILQ_ENTRY(ThreadPoolElement) reqs;
>   
> -    /* Access to this list is protected by the global mutex.  */
> +    /* This list is only written by the thread pool's mother thread.  */
>       QLIST_ENTRY(ThreadPoolElement) all;
>   };
>   
> @@ -251,6 +251,9 @@ BlockAIOCB *thread_pool_submit_aio(ThreadPool *pool,
>   {
>       ThreadPoolElement *req;
>   
> +    /* Assert that the thread submitting work is the same running the pool */
> +    assert(pool->ctx == qemu_get_current_aio_context());
> +
>       req = qemu_aio_get(&thread_pool_aiocb_info, NULL, cb, opaque);
>       req->func = func;
>       req->arg = arg;

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


