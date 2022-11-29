Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37B063B97D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Nov 2022 06:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oztCd-0001yN-U1; Tue, 29 Nov 2022 00:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oztCc-0001xg-C1
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 00:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oztCa-00065v-0u
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 00:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669699839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wRNxNtb3sHPec652kxuojuC/onKnKgwrp7j1xlLq5mY=;
 b=ZsO9SEJyF96YLpdQm24yiCqK7l4ZYPB+Xz5AAiH8j/ftKrcV9mBJPS74MguwbwOec//oLN
 jf3KX+j36k6MUoxI139MqzVpfuY0YD6kieQnOaCLnk8eFIOVuSNw2NzHSH1M9Kf+rB+jXh
 MNDF4L/FWW4p4wc8tUq5ozTRSZ4MYbg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-WtmlmTANMBqjvui_qYvDRg-1; Tue, 29 Nov 2022 00:30:37 -0500
X-MC-Unique: WtmlmTANMBqjvui_qYvDRg-1
Received: by mail-wr1-f69.google.com with SMTP id
 e7-20020adf9bc7000000b00242121eebe2so1354620wrc.3
 for <qemu-devel@nongnu.org>; Mon, 28 Nov 2022 21:30:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wRNxNtb3sHPec652kxuojuC/onKnKgwrp7j1xlLq5mY=;
 b=bCEeMgHi15xN8CgYwd2M9vd5An0KNDmzeOuS5lvnp1WHvuVIMoIr8yfZeUukOKMiZ+
 Xd+IRycuy8w+GP6TMSD1ruHbM2nIDpcbVcXCq1lwleXAi9A4lS/BlfXybZGoSCThNyTA
 3sc5RfZVI4+LMPUYA0D/vlzCChuCH0RgVi+vqeSPHSkZ8WRNW6TmmWnIg+ZzPPCiPilv
 Gys6t5693qm6qVSdIqBYWtmjAzBpwIXPjkIrfn2VKULT4X1CdmdLg6PI2Sx/18JeC7Jp
 gz247xcrtRfYZe3sD7B8Cl4ByyIDXlJE4vOYphFD2jo8cOJofnCGRmSiNDOb2U10wqQC
 Cf4A==
X-Gm-Message-State: ANoB5pmcKAMZaDyFr7gZikvFtQAtik+wcvwTKZeSRd4AwxCPO5OPYWTP
 C/n7sHyk5UHzAEB9VwrCwbTfJZMoTaMMlFv70vH7+YnO/4MibXm6CxSrH0TiVCc14s3B/OBIUcw
 KkYYwKuLkRphlCmQ=
X-Received: by 2002:a05:600c:4f44:b0:3b4:7a99:b22c with SMTP id
 m4-20020a05600c4f4400b003b47a99b22cmr2773846wmq.11.1669699835698; 
 Mon, 28 Nov 2022 21:30:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5pcMia9GYv5zOwZgBqoMsKHx9pGzW4zK0W+v3vNrD8BXjUE/JGtSXLZnME1CE6Av/0FOZSqA==
X-Received: by 2002:a05:600c:4f44:b0:3b4:7a99:b22c with SMTP id
 m4-20020a05600c4f4400b003b47a99b22cmr2773823wmq.11.1669699835381; 
 Mon, 28 Nov 2022 21:30:35 -0800 (PST)
Received: from redhat.com ([2.52.149.178]) by smtp.gmail.com with ESMTPSA id
 d8-20020a5d6dc8000000b002415dd45320sm12460751wrz.112.2022.11.28.21.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 21:30:34 -0800 (PST)
Date: Tue, 29 Nov 2022 00:30:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "slp@redhat.com" <slp@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v3 7/7] hw/virtio: generalise CHR_EVENT_CLOSED handling
Message-ID: <20221129002939-mutt-send-email-mst@kernel.org>
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-8-alex.bennee@linaro.org>
 <4B9A0F71-8134-476F-ADFB-22FCFC142462@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4B9A0F71-8134-476F-ADFB-22FCFC142462@nutanix.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Nov 29, 2022 at 05:18:58AM +0000, Raphael Norwitz wrote:
> > On Nov 28, 2022, at 11:41 AM, Alex Bennée <alex.bennee@linaro.org> wrote:
> > 
> > ..and use for both virtio-user-blk and virtio-user-gpio. This avoids
> > the circular close by deferring shutdown due to disconnection until a
> > later point. virtio-user-blk already had this mechanism in place so
> 
> The mechanism was originally copied from virtio-net so we should probably fix it there too. AFAICT calling vhost_user_async_close() should work in net_vhost_user_event().
> 
> Otherwise the code looks good modulo a few nits. Happy to see the duplicated logic is being generalized.

If you do, separate patch pls and does not have to block this series.

> 
> > generalise it as a vhost-user helper function and use for both blk and
> > gpio devices.
> > 
> > While we are at it we also fix up vhost-user-gpio to re-establish the
> > event handler after close down so we can reconnect later.
> > 
> > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > ---
> > include/hw/virtio/vhost-user.h | 18 +++++++++
> > hw/block/vhost-user-blk.c      | 41 +++-----------------
> > hw/virtio/vhost-user-gpio.c    | 11 +++++-
> > hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
> > 4 files changed, 104 insertions(+), 37 deletions(-)
> > 
> > diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
> > index c6e693cd3f..191216a74f 100644
> > --- a/include/hw/virtio/vhost-user.h
> > +++ b/include/hw/virtio/vhost-user.h
> > @@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
> >  */
> > void vhost_user_cleanup(VhostUserState *user);
> > 
> > +/**
> > + * vhost_user_async_close() - cleanup vhost-user post connection drop
> > + * @d: DeviceState for the associated device (passed to callback)
> > + * @chardev: the CharBackend associated with the connection
> > + * @vhost: the common vhost device
> > + * @cb: the user callback function to complete the clean-up
> > + *
> > + * This function is used to handle the shutdown of a vhost-user
> > + * connection to a backend. We handle this centrally to make sure we
> > + * do all the steps and handle potential races due to VM shutdowns.
> > + * Once the connection is disabled we call a backhalf to ensure
> > + */
> > +typedef void (*vu_async_close_fn)(DeviceState *cb);
> > +
> > +void vhost_user_async_close(DeviceState *d,
> > +                            CharBackend *chardev, struct vhost_dev *vhost,
> > +                            vu_async_close_fn cb);
> > +
> > #endif
> > diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> > index 1177064631..aff4d2b8cb 100644
> > --- a/hw/block/vhost-user-blk.c
> > +++ b/hw/block/vhost-user-blk.c
> > @@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceState *dev)
> >     vhost_user_blk_stop(vdev);
> > 
> >     vhost_dev_cleanup(&s->dev);
> > -}
> > 
> > -static void vhost_user_blk_chr_closed_bh(void *opaque)
> > -{
> > -    DeviceState *dev = opaque;
> > -    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > -    VHostUserBlk *s = VHOST_USER_BLK(vdev);
> > -
> > -    vhost_user_blk_disconnect(dev);
> > +    /* Re-instate the event handler for new connections */
> >     qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_event,
> > -                             NULL, opaque, NULL, true);
> > +                             NULL, dev, NULL, true);
> > }
> > 
> > static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> > @@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
> >         }
> >         break;
> >     case CHR_EVENT_CLOSED:
> > -        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> > -            /*
> > -             * A close event may happen during a read/write, but vhost
> > -             * code assumes the vhost_dev remains setup, so delay the
> > -             * stop & clear.
> > -             */
> > -            AioContext *ctx = qemu_get_current_aio_context();
> > -
> > -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL,
> > -                    NULL, NULL, false);
> > -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, opaque);
> > -
> > -            /*
> > -             * Move vhost device to the stopped state. The vhost-user device
> > -             * will be clean up and disconnected in BH. This can be useful in
> > -             * the vhost migration code. If disconnect was caught there is an
> > -             * option for the general vhost code to get the dev state without
> > -             * knowing its type (in this case vhost-user).
> > -             *
> > -             * FIXME: this is sketchy to be reaching into vhost_dev
> > -             * now because we are forcing something that implies we
> > -             * have executed vhost_dev_stop() but that won't happen
> > -             * until vhost_user_blk_stop() gets called from the bh.
> > -             * Really this state check should be tracked locally.
> > -             */
> > -            s->dev.started = false;
> > -        }
> > +        /* defer close until later to avoid circular close */
> > +        vhost_user_async_close(dev, &s->chardev, &s->dev,
> > +                               vhost_user_blk_disconnect);
> >         break;
> >     case CHR_EVENT_BREAK:
> >     case CHR_EVENT_MUX_IN:
> > diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> > index 75e28bcd3b..cd76287766 100644
> > --- a/hw/virtio/vhost-user-gpio.c
> > +++ b/hw/virtio/vhost-user-gpio.c
> > @@ -239,6 +239,8 @@ static int vu_gpio_connect(DeviceState *dev, Error **errp)
> >     return 0;
> > }
> > 
> > +static void vu_gpio_event(void *opaque, QEMUChrEvent event);
> > +
> > static void vu_gpio_disconnect(DeviceState *dev)
> > {
> >     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> > @@ -251,6 +253,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
> > 
> >     vu_gpio_stop(vdev);
> >     vhost_dev_cleanup(&gpio->vhost_dev);
> > +
> > +    /* Re-instate the event handler for new connections */
> > +    qemu_chr_fe_set_handlers(&gpio->chardev,
> > +                             NULL, NULL, vu_gpio_event,
> > +                             NULL, dev, NULL, true);
> > }
> > 
> > static void vu_gpio_event(void *opaque, QEMUChrEvent event)
> > @@ -268,7 +275,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent event)
> >         }
> >         break;
> >     case CHR_EVENT_CLOSED:
> > -        vu_gpio_disconnect(dev);
> > +        /* defer close until later to avoid circular close */
> > +        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
> > +                               vu_gpio_disconnect);
> >         break;
> >     case CHR_EVENT_BREAK:
> >     case CHR_EVENT_MUX_IN:
> > diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> > index abe23d4ebe..8f635844af 100644
> > --- a/hw/virtio/vhost-user.c
> > +++ b/hw/virtio/vhost-user.c
> > @@ -21,6 +21,7 @@
> > #include "qemu/error-report.h"
> > #include "qemu/main-loop.h"
> > #include "qemu/sockets.h"
> > +#include "sysemu/runstate.h"
> > #include "sysemu/cryptodev.h"
> > #include "migration/migration.h"
> > #include "migration/postcopy-ram.h"
> > @@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
> >     user->chr = NULL;
> > }
> > 
> 
> nit: Extra space 
> 
> > +
> > +typedef struct {
> > +    vu_async_close_fn cb;
> > +    DeviceState *dev;
> > +    CharBackend *cd;
> > +    struct vhost_dev *vhost;
> > +} VhostAsyncCallback;
> > +
> > +static void vhost_user_async_close_bh(void *opaque)
> > +{
> > +    VhostAsyncCallback *data = opaque;
> > +    struct vhost_dev *vhost = data->vhost;
> > +
> > +    /*
> > +     * If the vhost_dev has been cleared in the meantime there is
> > +     * nothing left to do as some other path has completed the
> > +     * cleanup.
> > +     */
> > +    if (vhost->vdev) {
> > +        data->cb(data->dev);
> > +    }
> > +
> > +    g_free(data);
> > +}
> > +
> > +/*
> > + * We only schedule the work if the machine is running. If suspended
> > + * we want to keep all the in-flight data as is for migration
> > + * purposes.
> > + */
> > +void vhost_user_async_close(DeviceState *d,
> > +                            CharBackend *chardev, struct vhost_dev *vhost,
> > +                            vu_async_close_fn cb)
> > +{
> > +    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
> > +        /*
> > +         * A close event may happen during a read/write, but vhost
> > +         * code assumes the vhost_dev remains setup, so delay the
> > +         * stop & clear.
> > +         */
> > +        AioContext *ctx = qemu_get_current_aio_context();
> > +        VhostAsyncCallback *data = g_new0(VhostAsyncCallback, 1);
> > +
> > +        /* Save data for the callback */
> > +        data->cb = cb;
> > +        data->dev = d;
> > +        data->cd = chardev;
> > +        data->vhost = vhost;
> > +
> > +        /* Disable any further notifications on the chardev */
> > +        qemu_chr_fe_set_handlers(chardev,
> > +                                 NULL, NULL, NULL, NULL, NULL, NULL,
> > +                                 false);
> > +
> > +        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
> > +
> > +        /*
> > +         * Move vhost device to the stopped state. The vhost-user device
> 
> Not this change’s fault but we should fix up the grammar here i.e. s/clean/cleaned/ and probably should be “disconnected in the BH”…etc.
> 
> > +         * will be clean up and disconnected in BH. This can be useful in
> > +         * the vhost migration code. If disconnect was caught there is an
> > +         * option for the general vhost code to get the dev state without
> > +         * knowing its type (in this case vhost-user).
> > +         *
> > +         * Note if the vhost device is fully cleared by the time we
> > +         * execute the bottom half we won't continue with the cleanup.
> > +         */
> > +        vhost->started = false;
> > +    }
> > +}
> > +
> > static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
> > {
> >     if (!virtio_has_feature(dev->protocol_features,
> > -- 
> > 2.34.1
> > 
> 


