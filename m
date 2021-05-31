Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9013954D7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 06:56:29 +0200 (CEST)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnZyW-00020Z-SL
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 00:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lnZxL-0001AK-4w
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:55:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lnZxG-0001Zw-HB
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622436907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZfgR29C/l28Q+XY4SnkXPlx6BOdyPRktmYnqwU7wio=;
 b=MXHNuv0OVIKlihbzG5ZrvP+MUTDKDNuNnf93mmYKTCkKt2isM0TbWj/SvnD8eKnVuDAK2v
 ChffNsN/1HvLiJCnrYNFlpEWFG2wu3yuQRIqsbXj28xpD8tCvqUnGEHJy7TOjoPYfZpgao
 s7eLdP22w2k+w/i5s1KqCSVHYKxQbus=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-P1sotKA4NIKP3RF3vSe61A-1; Mon, 31 May 2021 00:55:05 -0400
X-MC-Unique: P1sotKA4NIKP3RF3vSe61A-1
Received: by mail-pj1-f70.google.com with SMTP id
 mw15-20020a17090b4d0fb0290157199aadbaso9728671pjb.7
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 21:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pZfgR29C/l28Q+XY4SnkXPlx6BOdyPRktmYnqwU7wio=;
 b=JQRsbUfcygwrMerr9/NTkDhYWW31FBp3KHZ3RFJw56oUomX2dxi7JpoUi2ragd+0nL
 Tw2gc/iws89EyRxEjB0/C1ZVTSJSqboqAW0CBw7qN89zWkkA38Fzgx5NEjgs0zJv8fOI
 jpvGPqE4TQn/e8tQ+XNJjzE3vCNStQucB/2k47lZlvm/WAGCKwP18vkur5aPq0Cydohr
 Yz1BZF+4gT+HblmNc+K2nvhC5ZnNHiz3/EkRz/K2q1yIr45yqJTx1KpP+ZW5mHLZa0yD
 s49swCM+ubCG82dumLPqI9VlLbm1wV1D8BH3R0yH+E2Io0IaCY5BENvyFTDGt3qCVotQ
 aCbg==
X-Gm-Message-State: AOAM533+sUTl26iaQUVXFIjF4WX/bIhE+6Ue0rXSNRYRXzYLN+c09Add
 THIGE3VSY6gYu+QZaogrpCuvM/Xyn2mK6XApV8Gi8eEBeal7bSU3VFDdY/DSZzXWH/vsZtM/KVu
 q+AA14B18chPrqXg=
X-Received: by 2002:a17:90a:1b8f:: with SMTP id
 w15mr17126989pjc.101.1622436904653; 
 Sun, 30 May 2021 21:55:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmkTCDQDrW6sEi9K2iy/ZE6mbpaNvAg/qGx+PJlve2Y5+Qo5M1B/VjZeArhsLXySYQDcyShw==
X-Received: by 2002:a17:90a:1b8f:: with SMTP id
 w15mr17126978pjc.101.1622436904403; 
 Sun, 30 May 2021 21:55:04 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h76sm10641699pfe.161.2021.05.30.21.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 May 2021 21:55:03 -0700 (PDT)
Subject: Re: [PATCH] replay: improve determinism of virtio-net
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a0210fac-af32-8f1e-ae5f-237d773c32bf@redhat.com>
Date: Mon, 31 May 2021 12:55:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.618, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/17 下午9:04, Pavel Dovgalyuk 写道:
> virtio-net device uses bottom halves for callbacks.
> These callbacks should be deterministic, because they affect VM state.
> This patch replaces BH invocations with corresponding replay functions,
> making them deterministic in record/replay mode.
> This patch also disables guest announce timers for record/replay,
> because they break correct loadvm in deterministic mode.


Virtio-net can be configured to work in tx timer mode. Do we need to 
care about that?


> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   hw/net/virtio-net.c |   13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 6b7e8dd04e..e876363236 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -44,6 +44,7 @@
>   #include "hw/pci/pci.h"
>   #include "net_rx_pkt.h"
>   #include "hw/virtio/vhost.h"
> +#include "sysemu/replay.h"
>   
>   #define VIRTIO_NET_VM_VERSION    11
>   
> @@ -394,7 +395,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
>                   timer_mod(q->tx_timer,
>                                  qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
>               } else {
> -                qemu_bh_schedule(q->tx_bh);
> +                replay_bh_schedule_event(q->tx_bh);
>               }
>           } else {
>               if (q->tx_timer) {
> @@ -2546,7 +2547,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>           return;
>       }
>       virtio_queue_set_notification(vq, 0);
> -    qemu_bh_schedule(q->tx_bh);
> +    replay_bh_schedule_event(q->tx_bh);


Not familiar with replay but any chance to change qemu_bh_schedule() 
instead?

Thanks


>   }
>   
>   static void virtio_net_tx_timer(void *opaque)
> @@ -2602,7 +2603,7 @@ static void virtio_net_tx_bh(void *opaque)
>       /* If we flush a full burst of packets, assume there are
>        * more coming and immediately reschedule */
>       if (ret >= n->tx_burst) {
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>           q->tx_waiting = 1;
>           return;
>       }
> @@ -2616,7 +2617,7 @@ static void virtio_net_tx_bh(void *opaque)
>           return;
>       } else if (ret > 0) {
>           virtio_queue_set_notification(q->tx_vq, 0);
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>           q->tx_waiting = 1;
>       }
>   }
> @@ -3206,6 +3207,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
>           n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
>       }
>   
> +    if (replay_mode != REPLAY_MODE_NONE) {
> +        n->host_features &= ~(1ULL << VIRTIO_NET_F_GUEST_ANNOUNCE);
> +    }
> +
>       if (n->net_conf.duplex_str) {
>           if (strncmp(n->net_conf.duplex_str, "half", 5) == 0) {
>               n->net_conf.duplex = DUPLEX_HALF;
>
>


