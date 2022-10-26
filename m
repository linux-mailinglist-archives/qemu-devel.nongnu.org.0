Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1560E2B4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 15:55:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ongrF-0001Z9-ST; Wed, 26 Oct 2022 09:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ongrC-0001Yu-BW
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:54:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1ongrA-0003H4-Io
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 09:54:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666792447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VOfJLZR3qrtV6Cun/P1pNM4iyndkSoI9I95eAREeEM=;
 b=TfKgyEwmsIhsNJ2rjxibDbAhH1PRmAAHsY78FejSV3IF8niSDYdlIQ0dt9IYMmaBW7lUa8
 R4whPBxMgdFAf4MwHI5dyO09QXHlz24MWmvFkO+lwR7OSzfjY9swFxAPGSlqPB4ASE7/8X
 VsUiuzrokTeUBXboUmv0DAPj8r11Jxk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-akhLEltfPCGhH6CzPb94vQ-1; Wed, 26 Oct 2022 09:54:06 -0400
X-MC-Unique: akhLEltfPCGhH6CzPb94vQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 gt15-20020a1709072d8f00b007aaac7973fbso3523076ejc.23
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 06:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6VOfJLZR3qrtV6Cun/P1pNM4iyndkSoI9I95eAREeEM=;
 b=EZCT84xmKIDna0x71aQHovroUYzh2PPOqr5u+wnMPAJTslfc9SQLG6Qva13KS/CfGf
 Dh4owqmRNqqXqRMhkCYuOC0e1fTN8tox3tKb8s3MyN/dZ6o8upsMNBmp4Dp9Wtybj0tR
 d6kyHaKuP/UTjIps5eJ6+lJkGs1/2cT7XGh2P2VUwjXjcDUau5Eov84X+hRi1q+ixf/c
 qITBWIMCDNQnuctsVLowd6abz4611yIh8YNk41lRFF8qaudNI3rMn0STNWwJEFgedL0S
 AlrRXwU7bvZkuegERYkiEvIuS9wbcjylqFc5uoYazt/bPhSPE3PbI45yVe4tkyyiGyV7
 Wssg==
X-Gm-Message-State: ACrzQf0NCgy9GCcavT/euD7eSxQ96G7oyQsfKnHvXT7Dsfopmne0gmVL
 1jIwwlgMzgIt8W1Uk4X86h7aHP7EtEXg44WhAFubgb/VViJ048qJtsi/TT3YE8IwJOl3ywXH+5B
 tNyWKo8wTzc0ZZRI=
X-Received: by 2002:a17:906:9745:b0:78d:480f:cee7 with SMTP id
 o5-20020a170906974500b0078d480fcee7mr37488387ejy.192.1666792444984; 
 Wed, 26 Oct 2022 06:54:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6F6Fe7fRZClYs00vwRZO0YwtcjyYPtHnWhSMzCaQd7Wt2TdnN4x+b+xGD74xmv+FPjL0Rcaw==
X-Received: by 2002:a17:906:9745:b0:78d:480f:cee7 with SMTP id
 o5-20020a170906974500b0078d480fcee7mr37488368ejy.192.1666792444736; 
 Wed, 26 Oct 2022 06:54:04 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906200200b007812ba2a360sm3071953ejo.149.2022.10.26.06.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 06:54:04 -0700 (PDT)
Message-ID: <d8bfb034-74ce-9092-a75a-0548cfcd2fcc@redhat.com>
Date: Wed, 26 Oct 2022 15:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] qemu-img: Speed up checksum
Content-Language: en-US
To: Nir Soffer <nsoffer@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220901143223.201295-1-nsoffer@redhat.com>
 <20220901143223.201295-4-nsoffer@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220901143223.201295-4-nsoffer@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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

On 01.09.22 16:32, Nir Soffer wrote:
> Add coroutine based loop inspired by `qemu-img convert` design.
>
> Changes compared to `qemu-img convert`:
>
> - State for the entire image is kept in ImgChecksumState
>
> - State for single worker coroutine is kept in ImgChecksumworker.
>
> - "Writes" are always in-order, ensured using a queue.
>
> - Calling block status once per image extent, when the current extent is
>    consumed by the workers.
>
> - Using 1m buffer size - testings shows that this gives best read
>    performance both with buffered and direct I/O.

Why does patch 1 then choose to use 2 MB?

> - Number of coroutines is not configurable. Testing does not show
>    improvement when using more than 8 coroutines.
>
> - Progress include entire image, not only the allocated state.
>
> Comparing to the simple read loop shows that this version is up to 4.67
> times faster when computing a checksum for an image full of zeroes. For
> real images it is 1.59 times faster with direct I/O, and with buffered
> I/O there is no difference.
>
> Test results on Dell PowerEdge R640 in a CentOS Stream 9 container:
>
> | image    | size | i/o       | before         | after          | change |
> |----------|------|-----------|----------------|----------------|--------|
> | zero [1] |   6g | buffered  | 1.600s ±0.014s | 0.342s ±0.016s |  x4.67 |
> | zero     |   6g | direct    | 4.684s ±0.093s | 2.211s ±0.009s |  x2.12 |
> | real [2] |   6g | buffered  | 1.841s ±0.075s | 1.806s ±0.036s |  x1.02 |
> | real     |   6g | direct    | 3.094s ±0.079s | 1.947s ±0.017s |  x1.59 |
> | nbd  [3] |   6g | buffered  | 2.455s ±0.183s | 1.808s ±0.016s |  x1.36 |
> | nbd      |   6g | direct    | 3.540s ±0.020s | 1.749s ±0.018s |  x2.02 |
>
> [1] raw image full of zeroes
> [2] raw fedora 35 image with additional random data, 50% full
> [3] image [2] exported by qemu-nbd via unix socket
>
> Signed-off-by: Nir Soffer <nsoffer@redhat.com>
> ---
>   qemu-img.c | 343 +++++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 270 insertions(+), 73 deletions(-)

Looks good!

Just a couple of style comments below.

> diff --git a/qemu-img.c b/qemu-img.c
> index 7edcfe4bc8..bfa8e2862f 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1613,48 +1613,288 @@ out:
>       qemu_vfree(buf2);
>       blk_unref(blk2);
>   out2:
>       blk_unref(blk1);
>   out3:
>       qemu_progress_end();
>       return ret;
>   }
>   
>   #ifdef CONFIG_BLKHASH
> +
> +#define CHECKSUM_COROUTINES 8
> +#define CHECKSUM_BUF_SIZE (1 * MiB)
> +#define CHECKSUM_ZERO_SIZE MIN(16 * GiB, SIZE_MAX)
> +
> +typedef struct ImgChecksumState ImgChecksumState;
> +
> +typedef struct ImgChecksumWorker {
> +    QTAILQ_ENTRY(ImgChecksumWorker) entry;
> +    ImgChecksumState *state;
> +    Coroutine *co;
> +    uint8_t *buf;
> +
> +    /* The current chunk. */
> +    int64_t offset;
> +    int64_t length;
> +    bool zero;
> +
> +    /* Always true for zero extent, false for data extent. Set to true
> +     * when reading the chunk completes. */

Qemu codestyle requires /* and */ to be on separate lines for multi-line 
comments (see checkpatch.pl).

> +    bool ready;
> +} ImgChecksumWorker;
> +
> +struct ImgChecksumState {
> +    const char *filename;
> +    BlockBackend *blk;
> +    BlockDriverState *bs;
> +    int64_t total_size;
> +
> +    /* Current extent, modified in checksum_co_next. */
> +    int64_t offset;
> +    int64_t length;
> +    bool zero;
> +
> +    int running_coroutines;
> +    CoMutex lock;
> +    ImgChecksumWorker workers[CHECKSUM_COROUTINES];
> +
> +    /* Ensure in-order updates. Update are scheduled at the tail of the
> +     * queue and processed from the head of the queue when a worker is
> +     * ready. */

Qemu codestyle requires /* and */ to be on separate lines for multi-line 
comments.

> +    QTAILQ_HEAD(, ImgChecksumWorker) update_queue;
> +
> +    struct blkhash *hash;
> +    int ret;
> +};

[...]

> +static coroutine_fn bool checksum_co_next(ImgChecksumWorker *w)
> +{
> +    ImgChecksumState *s = w->state;
> +
> +    qemu_co_mutex_lock(&s->lock);
> +
> +    if (s->offset == s->total_size || s->ret != -EINPROGRESS) {
> +        qemu_co_mutex_unlock(&s->lock);
> +        return false;
> +    }
> +
> +    if (s->length == 0 && checksum_block_status(s)) {

I’d prefer `checksum_block_status(s) < 0` so that it is clear that 
negative values indicate errors.  Otherwise, based on this code alone, 
it looks to me more like `checksum_block_status()` returned a boolean, 
where `false` would generally indicate an error, which is confusing.

Same in other places below.

> +        qemu_co_mutex_unlock(&s->lock);
> +        return false;
> +    }

[...]

> +/* Enter the next worker coroutine if the worker is ready. */
> +static void coroutine_fn checksum_co_enter_next(ImgChecksumWorker *w)
> +{
> +    ImgChecksumState *s = w->state;
> +    ImgChecksumWorker *next;
> +
> +    if (!QTAILQ_EMPTY(&s->update_queue)) {
> +        next = QTAILQ_FIRST(&s->update_queue);
> +        if (next->ready)
> +            qemu_coroutine_enter(next->co);

Qemu codestyle requires braces here.

Hanna


