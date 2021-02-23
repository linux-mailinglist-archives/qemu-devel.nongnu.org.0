Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57372322E9E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:20:37 +0100 (CET)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaQO-0004zP-8P
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:20:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaJy-000080-SE
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:13:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaJv-0008Dy-9b
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iMG5FxucDGCrGlm45RTShWvgNAdqJIZJjF8UaSNc4Lc=;
 b=BOEze8kKIADGOLskzEw4GRoAwFgX+05nQ/mMQ9nCmGkKXqJs/tQQzYS2gyz6l+JBA5SPP4
 kO38B5XT8ItgJavjgIoZe4Ued8oXrB1C90SaL7AyJOwVAJEywqTcbxXszO98z11wLGOCJg
 mbtAzavr5R09fdP+BUg2W2bC/1gPupA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-7akE6s9YOmiP8yTkemVO9g-1; Tue, 23 Feb 2021 11:13:53 -0500
X-MC-Unique: 7akE6s9YOmiP8yTkemVO9g-1
Received: by mail-wr1-f69.google.com with SMTP id v18so5254093wrr.8
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iMG5FxucDGCrGlm45RTShWvgNAdqJIZJjF8UaSNc4Lc=;
 b=NqQ1SeSLZl7xSO890OZChvvQf6RJlhRhndv70F20LOYlBsdaXxpxQmvFjhkJYEZNGH
 uulV6HoZBebrlUxLb6DQlgMM/cZqIMbCK+serBBUc4Qh8NX22N8TFmnY0p9irsDvrrEF
 ux2axWbtYeswqE3mixkACazswl7q8oMVhUyKMGivxFV8Ygc8GRGMcVRoQqndq/BDC5Gu
 6LZgHHPNmWRxxfow7UqEqnhdBi6zMU7tCPUMnAnlJnyoYUut7R9iAdT4pskioHdcEsU6
 gNKHNWiQUBdepoLrA9PO+9ANaUevaWV34wC/9Pc7Oa9SgIXRMDldK/3cJasEbdYFf2kk
 o9Gw==
X-Gm-Message-State: AOAM532jps/oDvD838PoAqOphYrCkqclgANwKM2WJYllTwODVJDoBvQZ
 bWcljE8JZ7aM4u8sYfUSGzBc7UpnlKWD0L20LonMSWcyX35RD/hGMUbmkGUEx9Tszlfe+5QjIBl
 mA6d+KrHUpM0+TX8=
X-Received: by 2002:a1c:e384:: with SMTP id a126mr25886946wmh.42.1614096830957; 
 Tue, 23 Feb 2021 08:13:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaVPJls5cxR/gh/KQmYHbE6a78TYcKsuhfedBehPQl3sGh/uIbOeAtel2kKcIar6N7885rKA==
X-Received: by 2002:a1c:e384:: with SMTP id a126mr25886925wmh.42.1614096830796; 
 Tue, 23 Feb 2021 08:13:50 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id t2sm15934112wrx.23.2021.02.23.08.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:13:50 -0800 (PST)
Date: Tue, 23 Feb 2021 11:13:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 01/12] vhost-user-blk: fix blkcfg->num_queues endianness
Message-ID: <20210223111018-mutt-send-email-mst@kernel.org>
References: <20210223144653.811468-1-stefanha@redhat.com>
 <20210223144653.811468-2-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223144653.811468-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Coiby Xu <Coiby.Xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 02:46:42PM +0000, Stefan Hajnoczi wrote:
> Treat the num_queues field as virtio-endian. On big-endian hosts the
> vhost-user-blk num_queues field was in the wrong endianness.
> 
> Move the blkcfg.num_queues store operation from realize to
> vhost_user_blk_update_config() so feature negotiation has finished and
> we know the endianness of the device. VIRTIO 1.0 devices are
> little-endian, but in case someone wants to use legacy VIRTIO we support
> all endianness cases.
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

okay but as we recently discovered config space can in theory
be read before FEATURES_OK. Nasty, I know. Things kind of work
right now but we really need some other path to notify backends
when legacy guest is active. E.g. VDPA also has this problem.

> ---
>  hw/block/vhost-user-blk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index da4fbf9084..b870a50e6b 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -54,6 +54,9 @@ static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>  {
>      VHostUserBlk *s = VHOST_USER_BLK(vdev);
>  
> +    /* Our num_queues overrides the device backend */
> +    virtio_stw_p(vdev, &s->blkcfg.num_queues, s->num_queues);
> +
>      memcpy(config, &s->blkcfg, sizeof(struct virtio_blk_config));
>  }
>  
> @@ -491,10 +494,6 @@ reconnect:
>          goto reconnect;
>      }
>  
> -    if (s->blkcfg.num_queues != s->num_queues) {
> -        s->blkcfg.num_queues = s->num_queues;
> -    }
> -
>      return;
>  
>  virtio_err:
> -- 
> 2.29.2
> 


