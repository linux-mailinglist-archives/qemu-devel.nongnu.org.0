Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 212A261DC20
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMGv-0003yr-0p; Sat, 05 Nov 2022 12:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMGs-0003yR-NO
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:43:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMGr-0002lJ-6n
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667666628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmkZCIBLPF+4+RAGE7aYka+ubfra/UPTpxwDP8ZiRd4=;
 b=hgUcOLZSxY2DkettDghyNVkwUok+vWFPNdX13XqLwsZWo5Q/cjsyZqgscoqpcWAK5GUFWC
 LKv0FSTXvxwG23v/ruulsKhKNyePvkZU3cE5ZjvWFMHRnNOiuWQmWoremsyAAkBEthlqe+
 sb+PHM0zJsCcq/hPkELEVL6R2aOe4yA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-Fq2tFj5pM4q7q_K-9ctdVQ-1; Sat, 05 Nov 2022 12:43:47 -0400
X-MC-Unique: Fq2tFj5pM4q7q_K-9ctdVQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r206-20020a1c44d7000000b003cf9bd60855so393587wma.6
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 09:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmkZCIBLPF+4+RAGE7aYka+ubfra/UPTpxwDP8ZiRd4=;
 b=eHtR06jz8eEtXL6GuyRl8EPcuhYfSPa9DAVgM6URnu2RxAKameXXbIkGb2ge8IuFhZ
 Gg7RheB3cnj8FtyWThHYYW0Lp0KR4CYRXTOnwBOt10YxzLoClQbKocRwiHDjWEsnBwZM
 KR8EthZXS2VgKG0jpGbH9IzADueQ2EnKazrSbbZYov5uJtpzIxuZMJxSXazmYiabrBIw
 +LlCAcpk9hoSvCsh8i+YoFJW4NCzyHJoWn1dBLPI+uyigYlE+aCYkkuGpUaFDG3va72z
 Y4gQOLv/GvYjM3L8Iy9VzUz2CvPQLBonvmwMceaIEStLgzf6Voso5D/bwqSlvlFgFsbi
 I5Sg==
X-Gm-Message-State: ACrzQf3b4/LMGNdO5e6YVXEargG+rTBvjikLkDmwcFcPLDMixgkN1Iyz
 7Ybo3Y8RNyah7qaX9adIo/GKMUsSzYk0wOygiitVstQVrE7iW7iBKD11M6ul/LAS6oN+IEAp5LN
 FRK9G0PqYD+mcDUg=
X-Received: by 2002:adf:fa51:0:b0:236:5100:f595 with SMTP id
 y17-20020adffa51000000b002365100f595mr25597735wrr.309.1667666625980; 
 Sat, 05 Nov 2022 09:43:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41irevzoIdAy5FTsWGMJaOjZriAj0kBY/2x2i3DRpbth0RV6ZcSm+n7oAw05rmv/6r1Ll1+w==
X-Received: by 2002:adf:fa51:0:b0:236:5100:f595 with SMTP id
 y17-20020adffa51000000b002365100f595mr25597728wrr.309.1667666625787; 
 Sat, 05 Nov 2022 09:43:45 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c359400b003a6a3595edasm3178913wmq.27.2022.11.05.09.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 09:43:45 -0700 (PDT)
Date: Sat, 5 Nov 2022 12:43:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, parav@nvidia.com
Subject: Re: [PATCH v3 1/2] vhost: Change the sequence of device start
Message-ID: <20221105103207-mutt-send-email-mst@kernel.org>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20221017064452.1226514-1-yajunw@nvidia.com>
 <20221017064452.1226514-2-yajunw@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221017064452.1226514-2-yajunw@nvidia.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 17, 2022 at 02:44:51PM +0800, Yajun Wu wrote:
> This patch is part of adding vhost-user vhost_dev_start support. The
> motivation is to improve backend configuration speed and reduce live
> migration VM downtime.
> 
> Moving the device start routines after finishing all the necessary device
> and VQ configuration, further aligning to the virtio specification for
> "device initialization sequence".
> 
> Following patch will add vhost-user vhost_dev_start support.
> 
> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> Acked-by: Parav Pandit <parav@nvidia.com>
> 
> ---
>  hw/block/vhost-user-blk.c | 18 +++++++++++-------
>  hw/net/vhost_net.c        | 12 ++++++------
>  2 files changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 84902dde17..f4deb8cd5d 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -164,13 +164,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
>          goto err_guest_notifiers;
>      }
>  
> -    ret = vhost_dev_start(&s->dev, vdev);
> -    if (ret < 0) {
> -        error_setg_errno(errp, -ret, "Error starting vhost");
> -        goto err_guest_notifiers;
> -    }
> -    s->started_vu = true;
> -
>      /* guest_notifier_mask/pending not used yet, so just unmask
>       * everything here. virtio-pci will do the right thing by
>       * enabling/disabling irqfd.
> @@ -179,9 +172,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
>          vhost_virtqueue_mask(&s->dev, vdev, i, false);
>      }
>  
> +    s->dev.vq_index_end = s->dev.nvqs;
> +    ret = vhost_dev_start(&s->dev, vdev);
> +    if (ret < 0) {
> +        error_setg_errno(errp, -ret, "Error starting vhost");
> +        goto err_guest_notifiers;
> +    }
> +    s->started_vu = true;
> +
>      return ret;
>  
>  err_guest_notifiers:
> +    for (i = 0; i < s->dev.nvqs; i++) {
> +        vhost_virtqueue_mask(&s->dev, vdev, i, true);
> +    }
>      k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
>  err_host_notifiers:
>      vhost_dev_disable_notifiers(&s->dev, vdev);
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b974b..d6924f5e57 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -387,21 +387,21 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>          } else {
>              peer = qemu_get_peer(ncs, n->max_queue_pairs);
>          }
> -        r = vhost_net_start_one(get_vhost_net(peer), dev);
> -
> -        if (r < 0) {
> -            goto err_start;
> -        }
>  
>          if (peer->vring_enable) {
>              /* restore vring enable state */
>              r = vhost_set_vring_enable(peer, peer->vring_enable);
>  
>              if (r < 0) {
> -                vhost_net_stop_one(get_vhost_net(peer), dev);
>                  goto err_start;
>              }
>          }
> +
> +        r = vhost_net_start_one(get_vhost_net(peer), dev);
> +        if (r < 0) {
> +            vhost_net_stop_one(get_vhost_net(peer), dev);

Error handling broken here. Corrupts memory if triggered.
I fixed it up when applying just because of the freeze
but I won't do this generally.

> +            goto err_start;
> +        }
>      }
>  
>      return 0;
> -- 
> 2.27.0


