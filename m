Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FCB63EA0D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:58:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dVF-0005xX-W2; Thu, 01 Dec 2022 01:57:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0dVD-0005x2-1J
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:56:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p0dVA-0002M1-Uh
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669877815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuljzYlWkSyswg9C+efJhjlpWmcfm6eFO4QqpzTtBV8=;
 b=czeZDtOC3mA+KY7Q8tiA0ezpbG+mAVzZk6N0fGwlqtsEtP5Mr0Mp8eYw0GWxNueY3FxHbz
 XCTdobNzYV3NWgzjXPf4Kiq2dLmmgOhyrrlHjMY8dOovOTgeYKWTMKAhT2q/kKbKVOpFbS
 zYkAJHEPH4k/lh6hrzDstYi9rjOCMGo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-152-ohxp0R8vOhK9RiK1KLgd2w-1; Thu, 01 Dec 2022 01:56:53 -0500
X-MC-Unique: ohxp0R8vOhK9RiK1KLgd2w-1
Received: by mail-wm1-f69.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso414592wms.8
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 22:56:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TuljzYlWkSyswg9C+efJhjlpWmcfm6eFO4QqpzTtBV8=;
 b=uI9vF1DTYaqwZgkU1f4QeryUS/atdhzlnXbVNOIH4KZu/LpjdIborf/N49BDPWy7N+
 abVXkYZZcj2pYbnThB9b6nmECLOJhKsSe4X3EXbbVN/V0u4mH1XLVbjT3dn5djuCaa/l
 +0wVvdlrFUKvvnL/qrp1sJKs3i4x862poEYvoqSXNHYoKtJqofajdIaCEd9YSnwGsb6K
 qlIwUHZViUaQOqz6vLcXWYk42w1K2BPUT2Dg7pyikLceRQNF+KoAPgQ42GqI5vkawJBx
 6QkzbdNGs1daZmctqO+Y2y+6U+5xVbWovWQaaKY70mrzONykpdx21/zFD5RSA/E0+gFp
 BnrA==
X-Gm-Message-State: ANoB5pmaC8pUQyIAOpa5vXpPXn1TdBu+0IHIfeYSEpIKJyc9IrLBh4sT
 Sbwqg7AwY1LbvySEPGw41Vd7CVBYC+fF6yG6iWe7fxiy+enEGiXmffQ4A9xyP1+j9TrPjbGt+p2
 06Y4OTtVHUMw6++o=
X-Received: by 2002:adf:f5c3:0:b0:242:3427:bb51 with SMTP id
 k3-20020adff5c3000000b002423427bb51mr1604035wrp.635.1669877810208; 
 Wed, 30 Nov 2022 22:56:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4kUQnYrlUxgZORzBwsLxW+nXgN2RuA4SEdKUoecJZnXPFssz+En6UgBp0MztNbVqWAQR8lQw==
X-Received: by 2002:adf:f5c3:0:b0:242:3427:bb51 with SMTP id
 k3-20020adff5c3000000b002423427bb51mr1604021wrp.635.1669877809849; 
 Wed, 30 Nov 2022 22:56:49 -0800 (PST)
Received: from redhat.com ([2.52.19.245]) by smtp.gmail.com with ESMTPSA id
 m188-20020a1c26c5000000b003c83465ccbfsm7290670wmm.35.2022.11.30.22.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 22:56:49 -0800 (PST)
Date: Thu, 1 Dec 2022 01:56:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v4 4/5] hw/virtio: generalise CHR_EVENT_CLOSED handling
Message-ID: <20221201014840-mutt-send-email-mst@kernel.org>
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
 <20221130112439.2527228-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130112439.2527228-5-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 30, 2022 at 11:24:38AM +0000, Alex Bennée wrote:
> ..and use for both virtio-user-blk and virtio-user-gpio. This avoids
> the circular close by deferring shutdown due to disconnection until a
> later point. virtio-user-blk already had this mechanism in place so
> generalise it as a vhost-user helper function and use for both blk and
> gpio devices.
> 
> While we are at it we also fix up vhost-user-gpio to re-establish the
> event handler after close down so we can reconnect later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>


I have some ideas on how to improve the coding style here. Can be patches on
top.

> ---
>  include/hw/virtio/vhost-user.h | 18 +++++++++
>  hw/block/vhost-user-blk.c      | 41 +++-----------------
>  hw/virtio/vhost-user-gpio.c    | 11 +++++-
>  hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
>  4 files changed, 104 insertions(+), 37 deletions(-)
> 
> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> index c6e693cd3f..191216a74f 100644
> --- a/include/hw/virtio/vhost-user.h
> +++ b/include/hw/virtio/vhost-user.h
> @@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
>   */
>  void vhost_user_cleanup(VhostUserState *user);
>  
> +/**
> + * vhost_user_async_close() - cleanup vhost-user post connection drop
> + * @d: DeviceState for the associated device (passed to callback)
> + * @chardev: the CharBackend associated with the connection
> + * @vhost: the common vhost device
> + * @cb: the user callback function to complete the clean-up
> + *
> + * This function is used to handle the shutdown of a vhost-user
> + * connection to a backend. We handle this centrally to make sure we
> + * do all the steps and handle potential races due to VM shutdowns.
> + * Once the connection is disabled we call a backhalf to ensure

This sentence is incomplete. Fixing that can be done later.

> + */
> +typedef void (*vu_async_close_fn)(DeviceState *cb);

we should change the typedef to VhostUserAsyncCloseFn to agree with
the coding style:

	 Enum type
	names and function type names should also be in CamelCase. 

also, it's best to eschew abbreviation.

> +
> +void vhost_user_async_close(DeviceState *d,
> +                            CharBackend *chardev, struct vhost_dev *vhost,
> +                            vu_async_close_fn cb);
> +
>  #endif
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1177064631..aff4d2b8cb 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
>      vhost_user_blk_stop(vdev);
>  
>      vhost_dev_cleanup(&s->dev);
> -}
>  
> -static void vhost_user_blk_chr_closed_bh(void *opaque)
> -{
> -    DeviceState *dev = opaque;
> -    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> -
> -    vhost_user_blk_disconnect(dev);
> +    /* Re-instate the event handler for new connections */
>      qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
> -                             NULL, opaque, NULL, true);
> +                             NULL, dev, NULL, true);
>  }
>  
>  static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> @@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> -            /*
> -             * A close event may happen during a read/write, but vhost
> -             * code assumes the vhost_dev remains setup, so delay the
> -             * stop & clear.
> -             */
> -            AioContext *ctx = qemu_get_current_aio_context();
> -
> -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
> -                    NULL, NULL, false);
> -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
> -
> -            /*
> -             * Move vhost device to the stopped state. The vhost-user device
> -             * will be clean up and disconnected in BH. This can be useful in
> -             * the vhost migration code. If disconnect was caught there is an
> -             * option for the general vhost code to get the dev state without
> -             * knowing its type (in this case vhost-user).
> -             *
> -             * FIXME: this is sketchy to be reaching into vhost_dev
> -             * now because we are forcing something that implies we
> -             * have executed vhost_dev_stop() but that won't happen
> -             * until vhost_user_blk_stop() gets called from the bh.
> -             * Really this state check should be tracked locally.
> -             */
> -            s->dev.started = false;
> -        }
> +        /* defer close until later to avoid circular close */
> +        vhost_user_async_close(dev, &s->chardev, &s->dev,
> +                               vhost_user_blk_disconnect);
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index be9be08b4c..b7b82a1099 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -233,6 +233,8 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
>      return 0;
>  }
>  
> +static void vu_gpio_event(void *opaque, QEMUChrEvent event);
> +
>  static void vu_gpio_disconnect(DeviceState *dev)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);

we should reorder functions down the road to avoid declarations like
this.

> @@ -245,6 +247,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
>  
>      vu_gpio_stop(vdev);
>      vhost_dev_cleanup(&gpio->vhost_dev);
> +
> +    /* Re-instate the event handler for new connections */
> +    qemu_chr_fe_set_handlers(&gpio->chardev,
> +                             NULL, NULL, vu_gpio_event,
> +                             NULL, dev, NULL, true);
>  }
>  
>  static void vu_gpio_event(void *opaque, QEMUChrEvent event)
> @@ -262,7 +269,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent event)
>          }
>          break;
>      case CHR_EVENT_CLOSED:
> -        vu_gpio_disconnect(dev);
> +        /* defer close until later to avoid circular close */
> +        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
> +                               vu_gpio_disconnect);
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index abe23d4ebe..8f635844af 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -21,6 +21,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/sockets.h"
> +#include "sysemu/runstate.h"
>  #include "sysemu/cryptodev.h"
>  #include "migration/migration.h"
>  #include "migration/postcopy-ram.h"
> @@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
>      user->chr = NULL;
>  }
>  
> +

extra empty line

> +typedef struct {
> +    vu_async_close_fn cb;

cb can be renamed to e.g. "close" for clarity?

> +    DeviceState *dev;
> +    CharBackend *cd;
> +    struct vhost_dev *vhost;
> +} VhostAsyncCallback;
> +
> +static void vhost_user_async_close_bh(void *opaque)
> +{
> +    VhostAsyncCallback *data = opaque;
> +    struct vhost_dev *vhost = data->vhost;
> +
> +    /*
> +     * If the vhost_dev has been cleared in the meantime there is
> +     * nothing left to do as some other path has completed the
> +     * cleanup.
> +     */
> +    if (vhost->vdev) {

it's clearer to drop the vhost variable here. It's only used once.
Above will be
if (data->vhost->vdev)

> +        data->cb(data->dev);
> +    }
> +
> +    g_free(data);
> +}
> +
> +/*
> + * We only schedule the work if the machine is running. If suspended
> + * we want to keep all the in-flight data as is for migration
> + * purposes.
> + */
> +void vhost_user_async_close(DeviceState *d,
> +                            CharBackend *chardev, struct vhost_dev *vhost,
> +                            vu_async_close_fn cb)
> +{
> +    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> +        /*
> +         * A close event may happen during a read/write, but vhost
> +         * code assumes the vhost_dev remains setup, so delay the
> +         * stop & clear.
> +         */
> +        AioContext *ctx = qemu_get_current_aio_context();
> +        VhostAsyncCallback *data = g_new0(VhostAsyncCallback, 1);
> +
> +        /* Save data for the callback */
> +        data->cb = cb;
> +        data->dev = d;
> +        data->cd = chardev;
> +        data->vhost = vhost;
> +
> +        /* Disable any further notifications on the chardev */
> +        qemu_chr_fe_set_handlers(chardev,
> +                                 NULL, NULL, NULL, NULL, NULL, NULL,
> +                                 false);
> +
> +        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
> +
> +        /*
> +         * Move vhost device to the stopped state. The vhost-user device
> +         * will be clean up and disconnected in BH. This can be useful in
> +         * the vhost migration code. If disconnect was caught there is an
> +         * option for the general vhost code to get the dev state without
> +         * knowing its type (in this case vhost-user).
> +         *
> +         * Note if the vhost device is fully cleared by the time we
> +         * execute the bottom half we won't continue with the cleanup.
> +         */
> +        vhost->started = false;
> +    }
> +}
> +
>  static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>  {
>      if (!virtio_has_feature(dev->protocol_features,
> -- 
> 2.34.1


