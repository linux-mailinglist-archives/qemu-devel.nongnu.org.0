Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB5045571B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 09:36:24 +0100 (CET)
Received: from localhost ([::1]:57788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mncu7-0005iP-Kk
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 03:36:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mncsW-0004jM-Je
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 03:34:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mncsT-0003rK-Gd
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 03:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637224480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gdHPtbLa3W0QmIVi/8X4k+2sU5F3r29M0ba0pGXxUA=;
 b=iEzzXh+KGLj6is0nX38Zw6YkV1QBaXZwpIwUvbAQyQArYvk/tkU4tX3jfdQR0rrSmx4nrM
 P3xAIHOv7L3K9d7Ba6I0dmyeqQQ+Bmri5s3BDB5xcNKOm01+9x6c2anonnJcg9rdF6r/Kw
 Jw+hqXIciP/ysr9p4oOEVeyY7n5sVMQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-Y_3wzKxlMaaS94ZdK2NGow-1; Thu, 18 Nov 2021 03:34:37 -0500
X-MC-Unique: Y_3wzKxlMaaS94ZdK2NGow-1
Received: by mail-wr1-f71.google.com with SMTP id
 p3-20020a056000018300b00186b195d4ddso879393wrx.15
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 00:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0gdHPtbLa3W0QmIVi/8X4k+2sU5F3r29M0ba0pGXxUA=;
 b=MSINCRo4ork6Gi2XpWVoL583g0Qy8zchhA5XfBMHnVFoOeRd7cQxQe30y9FI1hE0jL
 7OdBslihZJ9g2C9gikcSyJxN+wyjMXJCsn+B84+ui5M8QZPk+tyz2NqmAlvMbQGAZMkT
 MmVwAIo+LqNWSqFxrfPT9uJZBOxh9xSXiwGpTT5MfsoRl9xNMlFVdwzY+8JlF4Aq0hUU
 414NF5LmddL+ecNHbn9jh3wnYFmNU5E2eQr7O7rvghAwTO9hm8QtgNXBYvSVpN5T2gvF
 sLhI7kcBa3KlHy+rmvYQhSKrolEqG/9TTV1QPM4pbt9msUsHFqeg0uah/y2Nv9Zs1ljb
 Z8BA==
X-Gm-Message-State: AOAM532Kdm3XPKA2RRLlh7zIHLyH4R2fdqxRpxEzcxBtMMQznoTJ/ql4
 PNvLRIelscDgAoV7rgxleFYnqObVXw4fbKUCmVq/Jg5tsnbXwkE40nC4i3lK6bjGtkf6AX1PQQY
 sGJpunMq7dkfZZa4=
X-Received: by 2002:a5d:6447:: with SMTP id d7mr29786156wrw.118.1637224476411; 
 Thu, 18 Nov 2021 00:34:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzLlqVajdQqPTzo0VpkKRl/h0BaSnAVk7LWgGC0a7XfFJSlNwemQqyjLyUubUvrl9qv4wk46g==
X-Received: by 2002:a5d:6447:: with SMTP id d7mr29786129wrw.118.1637224476170; 
 Thu, 18 Nov 2021 00:34:36 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id b6sm8612504wmq.45.2021.11.18.00.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Nov 2021 00:34:35 -0800 (PST)
Message-ID: <6077174b-c7e9-99a9-fb03-e0b27e97d39f@redhat.com>
Date: Thu, 18 Nov 2021 09:34:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] block/vvfat.c fix leak when failure occurs
To: Daniella Lee <daniellalee111@gmail.com>, kwolf@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20211116125718.2922980-1-daniellalee111@gmail.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211116125718.2922980-1-daniellalee111@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.084, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: pai.po.sec@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.11.21 13:57, Daniella Lee wrote:
> Function vvfat_open called function enable_write_target and init_directories,
> and these functions malloc new memory for BDRVVVFATState::qcow_filename,
> BDRVVVFATState::used_clusters, and BDRVVVFATState::cluster_buff.
>
> When the specified folder does not exist ,it may contains memory leak.
> After init_directories function is executed, the vvfat_open return -EIO,
> and bdrv_open_driver goto label open_failed,
> the program use g_free(bs->opaque) to release BDRVVVFATState struct
> without members mentioned.
>
> command line:
> qemu-system-x86_64 -hdb <vdisk qcow file>  -usb -device usb-storage,drive=fat16
> -drive file=fat:rw:fat-type=16:"<path of a host folder does not exist>",
> id=fat16,format=raw,if=none
>
> enable_write_target called:
> (gdb) bt
> #0  enable_write_target (bs=0x555556f9f000, errp=0x7fffffffd780)
>      at ../block/vvfat.c:3114
> #1  vvfat_open (bs=0x555556f9f000, options=0x555556fa45d0,
>      flags=155650, errp=0x7fffffffd780) at ../block/vvfat.c:1236
> #2  bdrv_open_driver (bs=0x555556f9f000, drv=0x555556c47920 <bdrv_vvfat>,
>      node_name=0x0, options=0x555556fa45d0, open_flags=155650,
>      errp=0x7fffffffd890) at ../block.c:1558
> #3  bdrv_open_common (bs=0x555556f9f000, file=0x0, options=0x555556fa45d0,
>      errp=0x7fffffffd890) at ../block.c:1852
> #4  bdrv_open_inherit (filename=0x555556f73310 "fat:rw:<dirNone>",
>      reference=0x0, options=0x555556fa45d0, flags=40962, parent=0x555556f98cd0,
>      child_class=0x555556b1d6a0 <child_of_bds>, child_role=19,
>      errp=0x7fffffffda90) at ../block.c:3779
> #5  bdrv_open_child_bs (filename=0x555556f73310 "fat:rw:<dirNone>",
>      options=0x555556f9cfc0, bdref_key=0x555556239bb8 "file",
>      parent=0x555556f98cd0, child_class=0x555556b1d6a0 <child_of_bds>,
>      child_role=19, allow_none=true, errp=0x7fffffffda90) at ../block.c:3419
> #6  bdrv_open_inherit (filename=0x555556f73310 "fat:rw:<dirNone>",
>      reference=0x0, options=0x555556f9cfc0, flags=8194, parent=0x0,
>      child_class=0x0, child_role=0, errp=0x555556c98c40 <error_fatal>)
>      at ../block.c:3726
> #7  bdrv_open (filename=0x555556f73310 "fat:rw:<dirNone>", reference=0x0,
>      options=0x555556f757b0, flags=0, errp=0x555556c98c40 <error_fatal>)
>      at ../block.c:3872
> #8  blk_new_open (filename=0x555556f73310 "fat:rw:<dirNone>", reference=0x0,
>      options=0x555556f757b0, flags=0, errp=0x555556c98c40 <error_fatal>)
>      at ../block/block-backend.c:436
> #9  blockdev_init (file=0x555556f73310 "fat:rw:<dirNone>",
>      bs_opts=0x555556f757b0, errp=0x555556c98c40 <error_fatal>)
>      at ../blockdev.c:608
> #10 drive_new (all_opts=0x555556d2b700, block_default_type=IF_IDE,
>      errp=0x555556c98c40 <error_fatal>) at ../blockdev.c:992
> ......
>
> Signed-off-by: Daniella Lee <daniellalee111@gmail.com>
> ---
>   block/vvfat.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Hi,

Thanks for your patch!  Yes, that makes sense.

I believe there are some issues that should be addressed, though:

> diff --git a/block/vvfat.c b/block/vvfat.c
> index 05e78e3c27..454a74c5d5 100644
> --- a/block/vvfat.c
> +++ b/block/vvfat.c
> @@ -1280,7 +1280,22 @@ static int vvfat_open(BlockDriverState *bs, QDict *options, int flags,
>       qemu_co_mutex_init(&s->lock);
>   
>       ret = 0;
> +
> +    qemu_opts_del(opts);
> +    return ret;

Optional: I’d drop the `ret = 0;` line and just `return 0;` here.

>   fail:
> +    if(s->qcow_filename) {

Our coding style requires a space between `if` and the opening parenthesis.

> +        g_free(s->qcow_filename);

`g_free()` checks whether the parameter given to it is `NULL`, and if 
so, performs a no-op.  So checking whether `s->qcow_filename != NULL` 
before calling `g_free()` is not necessary.

We have a script under scripts/checkpatch.pl that takes patch files as 
input and checks whether they conform to our coding style.  It’s really 
helpful, for example in these two cases it does report the issues.

> +        s->qcow_filename = NULL;
> +    }
> +    if(s->cluster_buffer) {
> +        g_free(s->cluster_buffer);
> +        s->cluster_buffer = NULL;
> +    }
> +    if(s->used_clusters) {
> +        g_free(s->used_clusters);

`s->used_clusters` is allocated with `calloc()`, so it can’t be freed 
with `g_free()`.  But you’re right, it should be `g_free()`-able, so the 
fix is to have `enable_write_target()` allocate it with `g_malloc0(size)`.

(And this made me notice that we free neither `s->used_clusters` nor 
`s->qcow_filename` in vvfat_close()...  Oops.)

> +        s->used_clusters = NULL;
> +    }
>       qemu_opts_del(opts);
>       return ret;
>   }

Finally, `enable_write_target()` frees `s->qcow_filename` on error.  
That seems unnecessary now, though not wrong.  (It’s just weird that it 
frees that one, but not `s->used_clusters`...)

Hanna


