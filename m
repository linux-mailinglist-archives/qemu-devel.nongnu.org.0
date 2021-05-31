Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929C33954CA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 06:49:27 +0200 (CEST)
Received: from localhost ([::1]:35984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnZrc-0005VN-J0
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 00:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lnZpJ-0003xZ-Ku
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:46:57 -0400
Received: from mail.ispras.ru ([83.149.199.84]:50242)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lnZpG-0003YM-Hj
 for qemu-devel@nongnu.org; Mon, 31 May 2021 00:46:57 -0400
Received: from [192.168.0.92] (unknown [62.118.138.151])
 by mail.ispras.ru (Postfix) with ESMTPSA id D4F014076B39;
 Mon, 31 May 2021 04:46:47 +0000 (UTC)
Subject: Re: [PATCH] replay: improve determinism of virtio-net
To: qemu-devel@nongnu.org
References: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <838fb92b-ce17-3643-23f1-8ba74498341f@ispras.ru>
Date: Mon, 31 May 2021 07:46:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <162125666020.1252655.9997723318921206001.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.618,
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
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping

On 17.05.2021 16:04, Pavel Dovgalyuk wrote:
> virtio-net device uses bottom halves for callbacks.
> These callbacks should be deterministic, because they affect VM state.
> This patch replaces BH invocations with corresponding replay functions,
> making them deterministic in record/replay mode.
> This patch also disables guest announce timers for record/replay,
> because they break correct loadvm in deterministic mode.
> 
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


