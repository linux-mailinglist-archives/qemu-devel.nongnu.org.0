Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03254322C38
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:28:45 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYg7-0003g1-Eg
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEYeS-0002af-Jw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEYeQ-0001CQ-JT
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614090417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9E4qquD8F7onRhiWKyP0rIPZvaVhIK3v1n2gRrMAsh0=;
 b=S9FLoRVkWu4IpIcZSidRD/ur4JvZX2Z692wISkLL848g0MACbcoSp0JoNjrLUJCVw8xa1X
 a+D2Cd9RN5ZOxhpG/wNA+I6ylF07BogpYNxdJSbpYp+1nnZ9k4/y632uMUldKzGW1fdshG
 513dtsWAkE4Uqy1WC2THqtUFjiX+YOE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-7EpTKzkKOkqMl_xomvjklg-1; Tue, 23 Feb 2021 09:26:55 -0500
X-MC-Unique: 7EpTKzkKOkqMl_xomvjklg-1
Received: by mail-wr1-f71.google.com with SMTP id w11so7438522wrp.6
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 06:26:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9E4qquD8F7onRhiWKyP0rIPZvaVhIK3v1n2gRrMAsh0=;
 b=Yah9o9IixS5EgF9wPEy12r2MyhZujtV93I/VBWqeaP31k9udP7bu2/haEqdZ90owVS
 9UFivUL3kIe5/5DkgvqhsUaPFnqWpBG6ZKWIf82dxpaOz233+Tki3goeKpbx1idANyC0
 K5aBjF2E7yBfPlRSFw8oa+bLfeWFm6OlD+rON50h20oznkO14T8awLJlvRBhJNzAQpIz
 6F/AmlOXKfdyak+41lefA3i+YgszOZ3Ym1/ddkI0iRLnEOzKW3JmzQmv1ljfqlstWTJI
 MIHwBNUGbklcaBY5hn+4VxLeSFelZtHKIsXycs7EMOffVRx6mfNocTZMEjP9hmT0qKHu
 59Qg==
X-Gm-Message-State: AOAM5321Ph6UXHR7TFVeb1ZmadKfM09VhDesDmTI5p5yA8zOFsqXa203
 rNzxoCrfVevZf1BrWqLS68bOqokCoi/R9/mnz2IX0LCEjZBYPbbcUl6Ciw7AGvI0i9RsmDQWg65
 3TUPyROP22kUXy2A=
X-Received: by 2002:a1c:f212:: with SMTP id s18mr25850918wmc.133.1614090414436; 
 Tue, 23 Feb 2021 06:26:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMLWi+y5N7KGlKigJfJAcCNW+kk/G4efdL1veRRRNg4/d/NHpWP/eJpQbnz0b3ss5YsznclA==
X-Received: by 2002:a1c:f212:: with SMTP id s18mr25850900wmc.133.1614090414279; 
 Tue, 23 Feb 2021 06:26:54 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id w81sm2905119wmb.3.2021.02.23.06.26.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 06:26:53 -0800 (PST)
Date: Tue, 23 Feb 2021 09:26:51 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3] virtio-blk: Respect discard granularity
Message-ID: <20210223092614-mutt-send-email-mst@kernel.org>
References: <20210223112406.cqbujfkt7pq4zyg6@steredhat>
 <20210223120940.89227-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210223120940.89227-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 23, 2021 at 09:09:40PM +0900, Akihiko Odaki wrote:
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>


whoever knows more about the detail here, feel free to merge.

> ---
>  hw/block/virtio-blk.c          | 8 +++++++-
>  hw/core/machine.c              | 4 +++-
>  include/hw/virtio/virtio-blk.h | 1 +
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
> index bac2d6fa2b2..f4378e61182 100644
> --- a/hw/block/virtio-blk.c
> +++ b/hw/block/virtio-blk.c
> @@ -962,10 +962,14 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>      blkcfg.wce = blk_enable_write_cache(s->blk);
>      virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
>      if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD)) {
> +        uint32_t discard_granularity = conf->discard_granularity;
> +        if (discard_granularity == -1 || !s->conf.report_discard_granularity) {
> +            discard_granularity = blk_size;
> +        }
>          virtio_stl_p(vdev, &blkcfg.max_discard_sectors,
>                       s->conf.max_discard_sectors);
>          virtio_stl_p(vdev, &blkcfg.discard_sector_alignment,
> -                     blk_size >> BDRV_SECTOR_BITS);
> +                     discard_granularity >> BDRV_SECTOR_BITS);
>          /*
>           * We support only one segment per request since multiple segments
>           * are not widely used and there are no userspace APIs that allow
> @@ -1299,6 +1303,8 @@ static Property virtio_blk_properties[] = {
>                       IOThread *),
>      DEFINE_PROP_BIT64("discard", VirtIOBlock, host_features,
>                        VIRTIO_BLK_F_DISCARD, true),
> +    DEFINE_PROP_BOOL("report-discard-granularity", VirtIOBlock,
> +                     conf.report_discard_granularity, true),
>      DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
>                        VIRTIO_BLK_F_WRITE_ZEROES, true),
>      DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index de3b8f1b318..e4df5797e72 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -33,7 +33,9 @@
>  #include "migration/global_state.h"
>  #include "migration/vmstate.h"
>  
> -GlobalProperty hw_compat_5_2[] = {};
> +GlobalProperty hw_compat_5_2[] = {
> +    { "virtio-blk-device", "report-discard-granularity", "off" },
> +};
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>  
>  GlobalProperty hw_compat_5_1[] = {
> diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
> index 214ab748229..29655a406dd 100644
> --- a/include/hw/virtio/virtio-blk.h
> +++ b/include/hw/virtio/virtio-blk.h
> @@ -41,6 +41,7 @@ struct VirtIOBlkConf
>      uint16_t num_queues;
>      uint16_t queue_size;
>      bool seg_max_adjust;
> +    bool report_discard_granularity;
>      uint32_t max_discard_sectors;
>      uint32_t max_write_zeroes_sectors;
>      bool x_enable_wce_if_config_wce;
> -- 
> 2.24.3 (Apple Git-128)


