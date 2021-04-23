Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA3B368DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 09:18:48 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZq5O-0007x1-SC
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 03:18:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lZq4D-0007T9-O0; Fri, 23 Apr 2021 03:17:34 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:35440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den-plotnikov@yandex-team.ru>)
 id 1lZq49-0005J8-Ab; Fri, 23 Apr 2021 03:17:32 -0400
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2f26:0:640:d077:482f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 6D94A2E15CE;
 Fri, 23 Apr 2021 10:17:21 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva8-d077482f1536.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 LapBrelPRI-HL1iMQvY; Fri, 23 Apr 2021 10:17:21 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1619162241; bh=Iha9Y4JlNNC0TCDEWzRxeNxE463otycIq0tP6sLyouc=;
 h=In-Reply-To:References:Date:Message-ID:From:To:Subject:Cc;
 b=x1aqKJv+ay0rOBHcIJxQ29J791oP5qKZUqvFGFEjEhQyTZn0hcT3PDpu/IaS8pw8l
 Z97NFhP8aIcNZzuhNNovlbyU1htVpZ9QULCa1F1dDbddfRTR92gx/iJamQWGQ+WF1j
 Jj2bJMoPOoT3jvcX4zBFxLuj8XbOh/RouxjeGQyk=
Authentication-Results: iva8-d077482f1536.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-iva.dhcp.yndx.net (dynamic-iva.dhcp.yndx.net
 [2a02:6b8:b080:8807::1:1])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mhSw4l2DuJ-HKpGmukO; Fri, 23 Apr 2021 10:17:20 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Subject: Re: [PATCH 1/5] vhost-user-blk: Don't reconnect during initialisation
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-2-kwolf@redhat.com>
From: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Message-ID: <ba7c7221-e6e7-473c-9532-2d1205951423@yandex-team.ru>
Date: Fri, 23 Apr 2021 10:17:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422170221.285006-2-kwolf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=5.45.199.163;
 envelope-from=den-plotnikov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>

On 22.04.2021 20:02, Kevin Wolf wrote:
> This is a partial revert of commits 77542d43149 and bc79c87bcde.
>
> Usually, an error during initialisation means that the configuration was
> wrong. Reconnecting won't make the error go away, but just turn the
> error condition into an endless loop. Avoid this and return errors
> again.
>
> Additionally, calling vhost_user_blk_disconnect() from the chardev event
> handler could result in use-after-free because none of the
> initialisation code expects that the device could just go away in the
> middle. So removing the call fixes crashes in several places.
>
> For example, using a num-queues setting that is incompatible with the
> backend would result in a crash like this (dereferencing dev->opaque,
> which is already NULL):
>
>   #0  0x0000555555d0a4bd in vhost_user_read_cb (source=0x5555568f4690, condition=(G_IO_IN | G_IO_HUP), opaque=0x7fffffffcbf0) at ../hw/virtio/vhost-user.c:313
>   #1  0x0000555555d950d3 in qio_channel_fd_source_dispatch (source=0x555557c3f750, callback=0x555555d0a478 <vhost_user_read_cb>, user_data=0x7fffffffcbf0) at ../io/channel-watch.c:84
>   #2  0x00007ffff7b32a9f in g_main_context_dispatch () at /lib64/libglib-2.0.so.0
>   #3  0x00007ffff7b84a98 in g_main_context_iterate.constprop () at /lib64/libglib-2.0.so.0
>   #4  0x00007ffff7b32163 in g_main_loop_run () at /lib64/libglib-2.0.so.0
>   #5  0x0000555555d0a724 in vhost_user_read (dev=0x555557bc62f8, msg=0x7fffffffcc50) at ../hw/virtio/vhost-user.c:402
>   #6  0x0000555555d0ee6b in vhost_user_get_config (dev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost-user.c:2133
>   #7  0x0000555555d56d46 in vhost_dev_get_config (hdev=0x555557bc62f8, config=0x555557bc62ac "", config_len=60) at ../hw/virtio/vhost.c:1566
>   #8  0x0000555555cdd150 in vhost_user_blk_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcf90) at ../hw/block/vhost-user-blk.c:510
>   #9  0x0000555555d08f6d in virtio_device_realize (dev=0x555557bc60b0, errp=0x7fffffffcff0) at ../hw/virtio/virtio.c:3660
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>   hw/block/vhost-user-blk.c | 54 ++++++++++-----------------------------
>   1 file changed, 13 insertions(+), 41 deletions(-)
>
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index f5e9682703..e824b0a759 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -50,6 +50,8 @@ static const int user_feature_bits[] = {
>       VHOST_INVALID_FEATURE_BIT
>   };
>   
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event);
> +
>   static void vhost_user_blk_update_config(VirtIODevice *vdev, uint8_t *config)
>   {
>       VHostUserBlk *s = VHOST_USER_BLK(vdev);
> @@ -362,19 +364,6 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
>       vhost_dev_cleanup(&s->dev);
>   }
>   
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> -                                 bool realized);
> -
> -static void vhost_user_blk_event_realize(void *opaque, QEMUChrEvent event)
> -{
> -    vhost_user_blk_event(opaque, event, false);
> -}
> -
> -static void vhost_user_blk_event_oper(void *opaque, QEMUChrEvent event)
> -{
> -    vhost_user_blk_event(opaque, event, true);
> -}
> -
>   static void vhost_user_blk_chr_closed_bh(void *opaque)
>   {
>       DeviceState *dev = opaque;
> @@ -382,12 +371,11 @@ static void vhost_user_blk_chr_closed_bh(void *opaque)
>       VHostUserBlk *s = VHOST_USER_BLK(vdev);
>   
>       vhost_user_blk_disconnect(dev);
> -    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL,
> -            vhost_user_blk_event_oper, NULL, opaque, NULL, true);
> +    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
> +                             NULL, opaque, NULL, true);
>   }
>   
> -static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
> -                                 bool realized)
> +static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>   {
>       DeviceState *dev = opaque;
>       VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> @@ -401,17 +389,7 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
>           }
>           break;
>       case CHR_EVENT_CLOSED:
> -        /*
> -         * Closing the connection should happen differently on device
> -         * initialization and operation stages.
> -         * On initalization, we want to re-start vhost_dev initialization
> -         * from the very beginning right away when the connection is closed,
> -         * so we clean up vhost_dev on each connection closing.
> -         * On operation, we want to postpone vhost_dev cleanup to let the
> -         * other code perform its own cleanup sequence using vhost_dev data
> -         * (e.g. vhost_dev_set_log).
> -         */
> -        if (realized && !runstate_check(RUN_STATE_SHUTDOWN)) {
> +        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>               /*
>                * A close event may happen during a read/write, but vhost
>                * code assumes the vhost_dev remains setup, so delay the
> @@ -431,8 +409,6 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event,
>                * knowing its type (in this case vhost-user).
>                */
>               s->dev.started = false;
> -        } else {
> -            vhost_user_blk_disconnect(dev);
>           }
>           break;
>       case CHR_EVENT_BREAK:
> @@ -490,31 +466,27 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
>       s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
>       s->connected = false;
>   
> -    qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> -                             vhost_user_blk_event_realize, NULL, (void *)dev,
> -                             NULL, true);
> -
> -reconnect:
>       if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
>           error_report_err(err);
>           goto virtio_err;
>       }
>   
> -    /* check whether vhost_user_blk_connect() failed or not */
> -    if (!s->connected) {
> -        goto reconnect;
> +    if (vhost_user_blk_connect(dev) < 0) {
> +        qemu_chr_fe_disconnect(&s->chardev);
> +        goto virtio_err;
>       }
> +    assert(s->connected);
>   
>       ret = vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
>                                  sizeof(struct virtio_blk_config));
>       if (ret < 0) {
>           error_report("vhost-user-blk: get block config failed");
> -        goto reconnect;
> +        goto virtio_err;
>       }
>   
> -    /* we're fully initialized, now we can operate, so change the handler */
> +    /* we're fully initialized, now we can operate, so add the handler */
>       qemu_chr_fe_set_handlers(&s->chardev,  NULL, NULL,
> -                             vhost_user_blk_event_oper, NULL, (void *)dev,
> +                             vhost_user_blk_event, NULL, (void *)dev,
>                                NULL, true);
>       return;
>   

