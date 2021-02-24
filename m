Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4988323A66
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 11:20:26 +0100 (CET)
Received: from localhost ([::1]:52740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lErHN-0004lj-Pq
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 05:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lErFr-0004Ko-Fv
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:18:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lErFp-0003Ea-TK
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 05:18:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614161927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3Jk29pAmsdJq3gZ/3o0th6k/DkbnC2HawCdEk++JO4=;
 b=XGVUQFvgzF0Cq3lm3VUhjbzMVVEq31cd2yvyyOmRkIhi8YAFSUaETIc2WLmM5msn6zr6Zb
 zAgjFb0rbsh1p/d1UWfiqZBcgIWxk6LViBk25TuoRJPbUl1IdgcTH8o/Bvp6VpAaEDgfTz
 y7r9Nw4xipV9bIFFVV2hKPePB6NWF4o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-l_4rc0PIM9GMPmTLJZrWkA-1; Wed, 24 Feb 2021 05:17:51 -0500
X-MC-Unique: l_4rc0PIM9GMPmTLJZrWkA-1
Received: by mail-wr1-f72.google.com with SMTP id s18so840467wrf.0
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 02:17:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G3Jk29pAmsdJq3gZ/3o0th6k/DkbnC2HawCdEk++JO4=;
 b=QrcK00H/6WUbcMO+SIq1aVZG4A+15i/BIkinyKMXAXw47CmAZK1jhAyEH0bnkqPYUk
 9/Ib+kxPQoW1rhld+lQwDWIQKlN5SSgtG4uZ3Ahx6wPZu6tiwsI1z8pNx7Ekt/qnj/1F
 /HMVcACjietFasa9Zk0mdyODPTD+Ip9Qijuv9IgrgRyNOIxIhD52GX5poPPEwx9m3qmV
 p5PGxMyHgnsJsnRs/udmK85HcvUVjdZ8X3Z/j/Q1XYHIQqbpedVnZrPzCqbcxeVOUy7s
 /QCll2z6GPMh2Si49C2AUlDkcDBQaC7bm/InaTsJo10c7Vw+WNxkBqxrFXWQV5oXtgfG
 0OEg==
X-Gm-Message-State: AOAM5330ZxKHsRxSNfUFeCTh+qJhj0BPyYdke392w7ncXdG9C5y/u9P2
 grTjpQRqNvgtVYpEzKwcCWgp+tPJZTqy1937TvWTqVjcZXdYuW6zQ+DWhzEjWWYnsxg/TnfvWI9
 k9elaOIfIzCBZGMs=
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr3104478wma.26.1614161870569; 
 Wed, 24 Feb 2021 02:17:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNFnUrCv4phwdkrjrmC55oPK/ZMyXpYZm7/diiXOnnfPaua3b1bNwz+ooh48ev0ALda4oVvw==
X-Received: by 2002:a05:600c:2512:: with SMTP id
 d18mr3104463wma.26.1614161870390; 
 Wed, 24 Feb 2021 02:17:50 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id p17sm1969661wmq.27.2021.02.24.02.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 02:17:50 -0800 (PST)
Date: Wed, 24 Feb 2021 11:17:47 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v3] virtio-blk: Respect discard granularity
Message-ID: <20210224101747.hmgou6z7qzmk62ft@steredhat>
References: <20210223112406.cqbujfkt7pq4zyg6@steredhat>
 <20210223120940.89227-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210223120940.89227-1-akihiko.odaki@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Cc stefanha@redhat.com

Please explain a bit the changes in the commit message, for example that 
you added 'report-discard-granularity', disabled it for older machines, 
that we use blk_size as default granularity, etc.

Something like this:

     Report the configured granularity for discard operation to the 
     guest. If this is not set use the block size.

     Since until now we have ignored the configured discard granularity 
     and always reported the block size, let's add 
     'report-discard-granularity' property and disable it for older 
     machine types to avoid migration issues.

And use ./scripts/get_maintainer.pl to CC all the maintainers (e.g.  
Stefan Hajnoczi was missing)

Other than that, the patch LGTM.

Thanks,
Stefano

On Tue, Feb 23, 2021 at 09:09:40PM +0900, Akihiko Odaki wrote:
>Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>---
> hw/block/virtio-blk.c          | 8 +++++++-
> hw/core/machine.c              | 4 +++-
> include/hw/virtio/virtio-blk.h | 1 +
> 3 files changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
>index bac2d6fa2b2..f4378e61182 100644
>--- a/hw/block/virtio-blk.c
>+++ b/hw/block/virtio-blk.c
>@@ -962,10 +962,14 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>     blkcfg.wce = blk_enable_write_cache(s->blk);
>     virtio_stw_p(vdev, &blkcfg.num_queues, s->conf.num_queues);
>     if (virtio_has_feature(s->host_features, VIRTIO_BLK_F_DISCARD)) {
>+        uint32_t discard_granularity = conf->discard_granularity;
>+        if (discard_granularity == -1 || !s->conf.report_discard_granularity) {
>+            discard_granularity = blk_size;
>+        }
>         virtio_stl_p(vdev, &blkcfg.max_discard_sectors,
>                      s->conf.max_discard_sectors);
>         virtio_stl_p(vdev, &blkcfg.discard_sector_alignment,
>-                     blk_size >> BDRV_SECTOR_BITS);
>+                     discard_granularity >> BDRV_SECTOR_BITS);
>         /*
>          * We support only one segment per request since multiple segments
>          * are not widely used and there are no userspace APIs that allow
>@@ -1299,6 +1303,8 @@ static Property virtio_blk_properties[] = {
>                      IOThread *),
>     DEFINE_PROP_BIT64("discard", VirtIOBlock, host_features,
>                       VIRTIO_BLK_F_DISCARD, true),
>+    DEFINE_PROP_BOOL("report-discard-granularity", VirtIOBlock,
>+                     conf.report_discard_granularity, true),
>     DEFINE_PROP_BIT64("write-zeroes", VirtIOBlock, host_features,
>                       VIRTIO_BLK_F_WRITE_ZEROES, true),
>     DEFINE_PROP_UINT32("max-discard-sectors", VirtIOBlock,
>diff --git a/hw/core/machine.c b/hw/core/machine.c
>index de3b8f1b318..e4df5797e72 100644
>--- a/hw/core/machine.c
>+++ b/hw/core/machine.c
>@@ -33,7 +33,9 @@
> #include "migration/global_state.h"
> #include "migration/vmstate.h"
>
>-GlobalProperty hw_compat_5_2[] = {};
>+GlobalProperty hw_compat_5_2[] = {
>+    { "virtio-blk-device", "report-discard-granularity", "off" },
>+};
> const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>
> GlobalProperty hw_compat_5_1[] = {
>diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
>index 214ab748229..29655a406dd 100644
>--- a/include/hw/virtio/virtio-blk.h
>+++ b/include/hw/virtio/virtio-blk.h
>@@ -41,6 +41,7 @@ struct VirtIOBlkConf
>     uint16_t num_queues;
>     uint16_t queue_size;
>     bool seg_max_adjust;
>+    bool report_discard_granularity;
>     uint32_t max_discard_sectors;
>     uint32_t max_write_zeroes_sectors;
>     bool x_enable_wce_if_config_wce;
>-- 
>2.24.3 (Apple Git-128)
>
>


