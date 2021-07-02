Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1413BA29D
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 17:13:06 +0200 (CEST)
Received: from localhost ([::1]:34648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzKqn-0000c9-0x
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 11:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKpr-0007O0-Tq
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:12:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzKpo-0001so-Mo
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 11:12:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625238723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ItVkG8dPy9/F0vNCKi7jvhH2WVxB80xoa5rCQhtC34=;
 b=N2WNNvS2uCIq9fa6Pp2jEArJkShzU0+yl+wgEFZ9L7WHLK5/cIiQgqeiMG8mpqLGzjX7/X
 /97ur7jmjFPYMlDFE4BvMLfFvR4eNT4uWBZmM/zfQc7lpg7rsHbIjAczUeeQk560hGnetk
 ZJkGemDwtMaH0yLXrHeBzEZZYB2WPIk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-4ZpqYdrHP_WCqp6DDiqu4g-1; Fri, 02 Jul 2021 11:12:01 -0400
X-MC-Unique: 4ZpqYdrHP_WCqp6DDiqu4g-1
Received: by mail-ed1-f69.google.com with SMTP id
 z5-20020a05640235c5b0290393974bcf7eso5226738edc.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 08:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2ItVkG8dPy9/F0vNCKi7jvhH2WVxB80xoa5rCQhtC34=;
 b=e4kEYimuhCfu0cdXgYi9Rbec35G9jREPNxaeTffZkiW+bbI7qGwPVs5+shO557Qpkc
 oDvQ/FhDjnODcdPmrnzykpTQwGVQRsQwUncpNvfPV80MjNJ87G8GCVWSYWymGPW0nJM/
 Zfl6jHmJ+NwXUyJRr+FfQ1uncU9X0+mBfHkHuO0gi0uoc6YFcBO/hNXVuih1wO/EMdTu
 IeRLewH2cGVNHYbLMLGJ2jh4ufn/k+tsT9l0yBvshnCrW0Be1NhPNj4BxVexEFjCYDO4
 paKgmiPyUVwjWR8Vj3i7yiTJ/0bz0K8N6vRAxCPku9Akoh9Nd0jE3yU5Or/UnCrMzUbR
 5lDQ==
X-Gm-Message-State: AOAM5329LBhWAV9OvrxVGfIvv7ZLsj93NzjKg65YKa7ROKuJUKk1SS1r
 RDUBGfkVl3EpSPf7Yoeq/97ztsvUNiXmPaRoBKeFqtR1+67dIPhwstLmfcbwwfSKtPv8EiOCuoc
 bbXIrbh0iXt1yTn8=
X-Received: by 2002:a17:906:a2da:: with SMTP id
 by26mr196567ejb.152.1625238720754; 
 Fri, 02 Jul 2021 08:12:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyJfJmUaNrmFkBM79FsJufflw7L0QrjiOX6Sx+DHIKNaL8ktLsDUcQP+07bLV70R67rL9NUA==
X-Received: by 2002:a17:906:a2da:: with SMTP id
 by26mr196538ejb.152.1625238720447; 
 Fri, 02 Jul 2021 08:12:00 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id yd25sm1116696ejb.114.2021.07.02.08.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:11:59 -0700 (PDT)
Date: Fri, 2 Jul 2021 11:11:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] replay: improve determinism of virtio-net
Message-ID: <20210702111128-mutt-send-email-mst@kernel.org>
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
MIME-Version: 1.0
In-Reply-To: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: pbonzini@redhat.com, jasowang@redhat.com, alex.bennee@linaro.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 04:04:20PM +0300, Pavel Dovgalyuk wrote:
> virtio-net device uses bottom halves for callbacks.
> These callbacks should be deterministic, because they affect VM state.
> This patch replaces BH invocations with corresponding replay functions,
> making them deterministic in record/replay mode.
> This patch also disables guest announce timers for record/replay,
> because they break correct loadvm in deterministic mode.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

Seems to make sense but clearly Jason's area.
Jason?


> ---
>  hw/net/virtio-net.c |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 6b7e8dd04e..e876363236 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -44,6 +44,7 @@
>  #include "hw/pci/pci.h"
>  #include "net_rx_pkt.h"
>  #include "hw/virtio/vhost.h"
> +#include "sysemu/replay.h"
>  
>  #define VIRTIO_NET_VM_VERSION    11
>  
> @@ -394,7 +395,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
>                  timer_mod(q->tx_timer,
>                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
>              } else {
> -                qemu_bh_schedule(q->tx_bh);
> +                replay_bh_schedule_event(q->tx_bh);
>              }
>          } else {
>              if (q->tx_timer) {
> @@ -2546,7 +2547,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>          return;
>      }
>      virtio_queue_set_notification(vq, 0);
> -    qemu_bh_schedule(q->tx_bh);
> +    replay_bh_schedule_event(q->tx_bh);
>  }
>  
>  static void virtio_net_tx_timer(void *opaque)
> @@ -2602,7 +2603,7 @@ static void virtio_net_tx_bh(void *opaque)
>      /* If we flush a full burst of packets, assume there are
>       * more coming and immediately reschedule */
>      if (ret >= n->tx_burst) {
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>          q->tx_waiting = 1;
>          return;
>      }
> @@ -2616,7 +2617,7 @@ static void virtio_net_tx_bh(void *opaque)
>          return;
>      } else if (ret > 0) {
>          virtio_queue_set_notification(q->tx_vq, 0);
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>          q->tx_waiting = 1;
>      }
>  }
> @@ -3206,6 +3207,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>          n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
>      }
>  
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        n->host_features &= ~(1ULL << VIRTIO_NET_F_GUEST_ANNOUNCE);
> +    }
> +
>      if (n->net_conf.duplex_str) {
>          if (strncmp(n->net_conf.duplex_str, "half", 5) == 0) {
>              n->net_conf.duplex = DUPLEX_HALF;


