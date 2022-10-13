Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB385FDCAE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 16:53:27 +0200 (CEST)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oizaQ-0007Re-EY
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 10:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oizVZ-0004XX-Mm
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oizVX-0005IP-H6
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 10:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665672502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mNyvdnO0lLvd+ukbViz9xPvDTmt3h2PL7xmunDp1kIE=;
 b=Mrxr3T/1mhuOWHzvDikk+78kUMq4i9PcKK/Ma2hcDpR7n7ZRxcy3u0R0/vZ7DJVUbPhV+c
 lD3V/I5f9xE1Qjzc4x1e/Jq5tphm8MQ6KQF2OvIxLwf/GoBA29krrdmfk6YvAPjNCDZJor
 UZZtV3f+3OCCGp8sI2ZZwC3094sVung=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-Z9RpjCwPNLOiN_ZbuVtxzA-1; Thu, 13 Oct 2022 10:48:20 -0400
X-MC-Unique: Z9RpjCwPNLOiN_ZbuVtxzA-1
Received: by mail-wr1-f69.google.com with SMTP id
 i26-20020adfaada000000b0022e2f38ffccso658202wrc.14
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 07:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNyvdnO0lLvd+ukbViz9xPvDTmt3h2PL7xmunDp1kIE=;
 b=TnMLyuuVlkdG7vV2eGjysVkZS9BBkEGuYJAIq0qFWeb+PyK0Q+QaVKForPwBUrpL1L
 07+yC5myZbgeEAFF/XoXX+SmCyr/3VbmCY2hw+fErvFwxaLojDmZy62+mH6KCbDkglw7
 XI5ionF7agwkC+AKrsw4srCesUhSs+6Gi6I7+c/mGeXAhT6zMYr+4UxwSW5TFAIwsM+l
 FZp1RUEYG78W8K8ehYOoPgmm4+EknLT7i9Rq+A/6bt6ce+tez/R4onzR+qITnVfsxvye
 I3t8flQJPDA8BfyK4cbumySFYVtlxZyWeKtTcvSJtyLA/+pxBdVYyOGq3K3hxRetVPsz
 fS7w==
X-Gm-Message-State: ACrzQf1wOWYem+9owDxgd1cZrbmOoAXefXbfV+pIhK8zuZUIEVkxR8Mx
 2HKIRrnivzmXbWaR1My7I18YnjTD+/lja4mmEf9e3M9Ft1duWOGZwYBAmBb23Lsm+UltqFVY11H
 zv2ikQl6yM9jobD0=
X-Received: by 2002:a05:6000:611:b0:22e:c347:2943 with SMTP id
 bn17-20020a056000061100b0022ec3472943mr213176wrb.603.1665672498884; 
 Thu, 13 Oct 2022 07:48:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ON/8r/0K/CBlunZvyTiHyZnwAj4XAVegTonixdwCyK0qCC+ES5lLN/Xy63fIK1bHaA4K1Vg==
X-Received: by 2002:a05:6000:611:b0:22e:c347:2943 with SMTP id
 bn17-20020a056000061100b0022ec3472943mr213160wrb.603.1665672498598; 
 Thu, 13 Oct 2022 07:48:18 -0700 (PDT)
Received: from redhat.com ([2.54.162.123]) by smtp.gmail.com with ESMTPSA id
 z1-20020adfec81000000b0022e36c1113fsm2219985wrn.13.2022.10.13.07.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 07:48:18 -0700 (PDT)
Date: Thu, 13 Oct 2022 10:48:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Jason Wang <jasowang@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>, alex.williamson@redhat.com
Subject: Re: [PATCH RFC] virtio-net: fix bottom-half packet TX on
 asynchronous completion
Message-ID: <20221013104724-mutt-send-email-mst@kernel.org>
References: <20221013140057.63575-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013140057.63575-1-lvivier@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 13, 2022 at 04:00:57PM +0200, Laurent Vivier wrote:
> When virtio-net is used with the socket netdev backend, the backend
> can be busy and not able to collect new packets.
> 
> In this case, net_socket_receive() returns 0 and registers a poll function
> to detect when the socket is ready again.
> 
> In virtio_net_tx_bh(), virtio_net_flush_tx() forwards the 0, the virtio
> notifications are disabled and the function is not rescheduled, waiting
> for the backend to be ready.
> 
> When the socket netdev backend is again able to send packets, the poll
> function re-starts to flush remaining packets. This is done by
> calling virtio_net_tx_complete(). It re-enables notifications and calls
> again virtio_net_flush_tx().
> 
> But it seems if virtio_net_flush_tx() reaches the tx_burst value all
> the queue is not flushed and no new notification is sent to reschedule
> virtio_net_tx_bh(). Nothing re-start to flush the queue and remaining packets
> are stuck in the queue.
> 
> To fix that, detect in virtio_net_tx_complete() if virtio_net_flush_tx()
> has been stopped by tx_burst and if yes reschedule the bottom half
> function virtio_net_tx_bh() to flush the remaining packets.
> 
> This is what is done in virtio_net_tx_bh() when the virtio_net_flush_tx()
> is synchronous, and completely by-passed when the operation needs to be
> asynchronous.
> 
> RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC
> 
> Do we need to reschedule the function in the other case managed
> in virtio_net_tx_bh() and by-passed when the completion is asynchronous?


I am guessing no.

>     /* If less than a full burst, re-enable notification and flush
>      * anything that may have come in while we weren't looking.  If
>      * we find something, assume the guest is still active and reschedule */
>     virtio_queue_set_notification(q->tx_vq, 1);
>     ret = virtio_net_flush_tx(q);
>     if (ret == -EINVAL) {
>         return;
>     } else if (ret > 0) {
>         virtio_queue_set_notification(q->tx_vq, 0);
>         qemu_bh_schedule(q->tx_bh);
>         q->tx_waiting = 1;
>     }
> 
> RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC RFC
> 
> Fixes: a697a334b3c4 ("virtio-net: Introduce a new bottom half packet TX")
> Cc: alex.williamson@redhat.com
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Looks ok superficially

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Jason, your area.

> ---
>  hw/net/virtio-net.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index e9f696b4cfeb..1fbf2f3e19a7 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2526,6 +2526,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
>      VirtIONet *n = qemu_get_nic_opaque(nc);
>      VirtIONetQueue *q = virtio_net_get_subqueue(nc);
>      VirtIODevice *vdev = VIRTIO_DEVICE(n);
> +    int ret;
>  
>      virtqueue_push(q->tx_vq, q->async_tx.elem, 0);
>      virtio_notify(vdev, q->tx_vq);
> @@ -2534,7 +2535,17 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
>      q->async_tx.elem = NULL;
>  
>      virtio_queue_set_notification(q->tx_vq, 1);
> -    virtio_net_flush_tx(q);
> +    ret = virtio_net_flush_tx(q);
> +    if (q->tx_bh && ret >= n->tx_burst) {
> +        /*
> +         * the flush has been stopped by tx_burst
> +         * we will not receive notification for the
> +         * remainining part, so re-schedule
> +         */
> +        virtio_queue_set_notification(q->tx_vq, 0);
> +        qemu_bh_schedule(q->tx_bh);
> +        q->tx_waiting = 1;
> +    }
>  }
>  
>  /* TX */
> -- 
> 2.37.3


