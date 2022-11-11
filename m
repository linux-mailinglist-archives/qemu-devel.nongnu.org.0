Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E59E625AA0
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 13:42:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTLX-0003vW-ME; Fri, 11 Nov 2022 07:41:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otTLN-0003us-3a
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:41:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otTLK-0008Ac-RM
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:41:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668170470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzLkwk+SySkkKbJawdU+8rf1k4R8WNm2WpqyBieoahk=;
 b=C8HfGcX2GyqstvDtRRgF4Qbhbo6uUefDhSKZG+ZF5H/5iuIZ+CeJh4V9jG+N14CaL5azjJ
 wmGUEFFHvZhjmDY3A4qjWRTRLemp6b5GtVXUjso97xT6tRt5lcwI+YeqQz2IuWTRxbHmPD
 uBVSO/qdWb8sMqwz6Q0Cwjyboeu5nSo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-9-npLAn2FWNPCYJOMcEaQ1Sw-1; Fri, 11 Nov 2022 07:41:06 -0500
X-MC-Unique: npLAn2FWNPCYJOMcEaQ1Sw-1
Received: by mail-qv1-f70.google.com with SMTP id
 g12-20020a0cfdcc000000b004ad431ceee0so3567376qvs.7
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:41:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dzLkwk+SySkkKbJawdU+8rf1k4R8WNm2WpqyBieoahk=;
 b=aqcInA4zxVOvjeMLenUwA6t7obzs0ONQ6QYVOR13XKvRh7Xjy0UvIJuO5elUwcfKTr
 LgXwNhsye96pH4hYXe9ETUqQE5KBudhPotNJOaQ8msry8/fiqaY9bqYRAUnx8qJqkxtv
 vVC7w2g3HQRfxrizE+0wjF0+OA8p9iaeq9vDDfgio2l+Gyl3zLIZne4eeH0tgn2QbFd4
 wvKGh7nuKwaHTW7kBxtJDBYGnEUuMekNUlraBGTfAjt4OegPBLPvC69Kak1/pGOY9zSq
 PiviI07GlBZaM8l0WSCYp6DNCDmTNkh5YK5Zv6siGmzOwGY3XhKN05dTFoeBu8pNUKEX
 ZqVw==
X-Gm-Message-State: ANoB5plH16P5O8uhE3gMitwPkA3V1hMykGn4D++KeEC6a5HehnJUJFPD
 C8jC7dai+n8salD3bJjLDEiENEva6h06NYVOfbbY8wfI4tM8jdNGj8pSGql9ZpVk4BPz4CuJX62
 oPLgV/jOlA8whuxw=
X-Received: by 2002:a05:622a:5c8c:b0:35b:b250:340c with SMTP id
 ge12-20020a05622a5c8c00b0035bb250340cmr994922qtb.511.1668170466298; 
 Fri, 11 Nov 2022 04:41:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5/vmYz9P7L2rLeFTCkmGP+3zu1w+aKlAMnBZpmRgmYiMm0XYLMCxjLZUFgwmvAUVUW0b6yhQ==
X-Received: by 2002:a05:622a:5c8c:b0:35b:b250:340c with SMTP id
 ge12-20020a05622a5c8c00b0035bb250340cmr994904qtb.511.1668170466052; 
 Fri, 11 Nov 2022 04:41:06 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 gd8-20020a05622a5c0800b003a5430ee366sm1183182qtb.60.2022.11.11.04.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:41:05 -0800 (PST)
Message-ID: <449f74e7-7108-337e-b8e5-e21cb3ba8dcc@redhat.com>
Date: Fri, 11 Nov 2022 13:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 7/8] virtio-blk: don't acquire AioContext in
 virtio_blk_handle_vq()
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20221108211930.876142-1-stefanha@redhat.com>
 <20221108211930.876142-8-stefanha@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108211930.876142-8-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 08/11/2022 um 22:19 schrieb Stefan Hajnoczi:
> There is no need to acquire AioContext in virtio_blk_handle_vq() because
> no APIs used in the function require it and nothing else in the
> virtio-blk code requires mutual exclusion anymore.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/block/virtio-blk.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index faea045178..771d87cfbe 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -784,7 +784,6 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
>  
>      IO_CODE();
>  
> -    aio_context_acquire(blk_get_aio_context(s->blk));
>      blk_io_plug(s->blk);
>  
>      do {
> @@ -810,7 +809,6 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
>      }
>  
>      blk_io_unplug(s->blk);
> -    aio_context_release(blk_get_aio_context(s->blk));
>  }
>  
>  static void virtio_blk_handle_output(VirtIODevice *vdev, VirtQueue *vq)
> 

As already discussed offline, this might be problematic with the work I
am done.

Basically I am trying to replace the AioContext lock with a rwlock for
graph modifications, and in order to use it we must convert all
BlockDriver IO functions in coroutines, because they traverse the graph
and must take the read lock (defined as coroutine_fn).

This implies that for now we need to implement blk_* and bdrv_*
functions in a similar fashion as generated_co_wrapper, therefore
creating a coroutine and polling waiting for it.
And polling uses AIO_WAIT_WHILE, which assumes the AioContext lock to be
taken.

In the future, we will use AIO_WAIT_WHILE_UNLOCKED, as you did in patch
1, but right now it's definitely too early to do it for a g_c_w function.

For this specific case, I see that blk_ioplug/unplug is not called in a
lot of places:
- here, and it's ok
- virtio-scsi, and I think you are going to cover this too soon
- xen-block

So if you manage to make all callers aiocontext-free, then I can just
rebase on top of your series and use AIO_WAIT_WHILE_POLL for
blk_ioplug/unplug when I convert it in coroutine.

Thank you,
Emanuele


