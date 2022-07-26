Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF25815B7
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 16:51:12 +0200 (CEST)
Received: from localhost ([::1]:58242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGLtv-0008Vc-1R
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 10:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLph-000404-S5
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:46:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oGLpf-0007eN-UK
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 10:46:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658846807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0BTI12aY0BMggaoc5W9golNQ7eHfw1JPtj5zdy0VNkM=;
 b=SenEqxf9QX8xUfAMQfNVCkbMqvHal1NoouKk/Vgjty/OTFruPHBdBcypRNhIGyU44984+v
 iht9HA3pMgaycPuCh5P327xHCtisx3d+jXE5MIyQ65xYBRMHzORMaGOpGxDHj19dxCIvNM
 MFcv82wNA+M054RB+gZq9nOuYpYvyJ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-_Jwa4vVFP4y11qsPQ1LQ8w-1; Tue, 26 Jul 2022 10:46:42 -0400
X-MC-Unique: _Jwa4vVFP4y11qsPQ1LQ8w-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh18-20020a05600c3d1200b003a32044cc9fso7751114wmb.6
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 07:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=0BTI12aY0BMggaoc5W9golNQ7eHfw1JPtj5zdy0VNkM=;
 b=LtQphuWPEVjWxERkPRF3ECwSl5d3WvjW9tBBx224xO24DjDRmkGcJQqlmSa/4FGZmh
 wBat/EOxgKswD6xr4PoETumEE/l9uKgiwPHEOUYQEYNHHEx+5gLTmFM3fp8dkfltBXjm
 TSYUUm8zw29yUrdeDACDG9k+WVY7GEFn48vhIlCs2IWFfq0FnVwd69Ys+EuBOlKDiy/P
 I08Y/MmsLhw6R32S013h+gHpZa+CITe74ZQB+fiBsoMfSbtlG8Yw7WDEd/r/xK0dJDrU
 Mq9ZZQTRB9rnUXVGerzYoLyjLxQaU9kFQhN2sBxpYXtpJ7sMHiaAII+J/Fa+u5M9/vX2
 TVbA==
X-Gm-Message-State: AJIora+XicRlkmUYlnXrcBwLMuYmOGYOx5/2nmxPbCFiZKXkL+xjT6qU
 Lff9VzXHKAA4b85A0uGPu3Lgn6HArEXxlExN0OdTgm7PgNJ1kRiZ9TIV20PdckvKDiAyh3WXcPe
 y/TC+ctpArpav0zs=
X-Received: by 2002:a05:600c:49a4:b0:3a2:fec4:954c with SMTP id
 h36-20020a05600c49a400b003a2fec4954cmr25492011wmp.163.1658846801575; 
 Tue, 26 Jul 2022 07:46:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u0dHzMLinriIU+ORcOjO+6DBOfyMl5Ru97NZiRZRf4Jrw41/vcbjQ7pLBT2rOrY9blF37ppg==
X-Received: by 2002:a05:600c:49a4:b0:3a2:fec4:954c with SMTP id
 h36-20020a05600c49a400b003a2fec4954cmr25491992wmp.163.1658846801162; 
 Tue, 26 Jul 2022 07:46:41 -0700 (PDT)
Received: from redhat.com ([2.55.4.105]) by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b003a317ee3036sm18856376wmq.2.2022.07.26.07.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:46:40 -0700 (PDT)
Date: Tue, 26 Jul 2022 10:46:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, raphael.norwitz@nutanix.com, qemu-trivial@nongnu.org
Subject: Re: [PATCH] contrib/vhost-user-blk: Clean up deallocation of
 VuVirtqElement
Message-ID: <20220726104620-mutt-send-email-mst@kernel.org>
References: <20220630085219.1305519-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630085219.1305519-1-armbru@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 30, 2022 at 10:52:19AM +0200, Markus Armbruster wrote:
> We allocate VuVirtqElement with g_malloc() in
> virtqueue_alloc_element(), but free it with free() in
> vhost-user-blk.c.  Harmless, but use g_free() anyway.
> 
> One of the calls is guarded by a "not null" condition.  Useless,
> because it cannot be null (it's dereferenced right before), and even
> it it could be, free() and g_free() do the right thing.  Drop the
> conditional.
> 
> Fixes: Coverity CID 1490290
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Thanks!

Acked-by: Michael S. Tsirkin <mst@redhat.com>

trivial tree pls.


> ---
> Not even compile-tested, because I can't figure out how this thing is
> supposed to be built.  Its initial commit message says "make
> vhost-user-blk", but that doesn't work anymore.
> 
>  contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
> index 9cb78ca1d0..d6932a2645 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -106,10 +106,7 @@ static void vub_req_complete(VubReq *req)
>                    req->size + 1);
>      vu_queue_notify(vu_dev, req->vq);
>  
> -    if (req->elem) {
> -        free(req->elem);
> -    }
> -
> +    g_free(req->elem);
>      g_free(req);
>  }
>  
> @@ -243,7 +240,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      /* refer to hw/block/virtio_blk.c */
>      if (elem->out_num < 1 || elem->in_num < 1) {
>          fprintf(stderr, "virtio-blk request missing headers\n");
> -        free(elem);
> +        g_free(elem);
>          return -1;
>      }
>  
> @@ -325,7 +322,7 @@ static int vub_virtio_process_req(VubDev *vdev_blk,
>      return 0;
>  
>  err:
> -    free(elem);
> +    g_free(elem);
>      g_free(req);
>      return -1;
>  }
> -- 
> 2.35.3


