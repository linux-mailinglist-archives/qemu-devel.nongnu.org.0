Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F380E63D349
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:28:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KJX-0006bX-GH; Wed, 30 Nov 2022 05:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0KJR-0006Z0-7P
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:27:34 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0KJP-0002As-5A
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:27:32 -0500
Received: by mail-wr1-x430.google.com with SMTP id h11so19054938wrw.13
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVgWrvQRO62LnRYZuzhvOlduPkiglG6wT0N2iRKYeXs=;
 b=IJ8tmqKrk74CMHMqkwFb5NdL0png+1LAIdr/gIT0RIMO/HqUDr5l/sD04kR7kur7tn
 QliNnDsSGxfOEXiOVyYbOK7L/werHNbHFNLyGEqI/OyMJpOnxSf+Z0WjmNMfTkLDfYQX
 OPwzFE/802KBk7avZLkXEj0xprjv/m8AhZxwbECpEN4YmekIr6hpEN7w/eOQPrr7mIg7
 mDoeMduvaTzfsLCIKeH/WA0HeOysMBuoZzxf4mEXy0cSsg8GUlPwAGDapwnSrJDhgzDH
 vl0AXaCmu5HKY55IBhVbmlQhuyBhArHL7AyatBOUuhMIapqjN4M76ulmEPPpD1kgIymB
 mhng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yVgWrvQRO62LnRYZuzhvOlduPkiglG6wT0N2iRKYeXs=;
 b=pPTb1woDCl2/5+Hpn1KXBWy0auEwy/VngMhOsC7JcVAvX6wRoiHiZMEbbKtTQjtlFS
 aNOHSJkNQbKda8vepVfivfgkiZdlu+R5L+2CYUqv8Ky3R1l5gK9K2PVVsnmuOgWtnTRH
 fwufPOgaxgxdjexzduzvqXDCgx75ivOBz6LfjrV/VPkdJpq8T12vgbP0qXTOHu3f6QzX
 Rl1I6dMRNWjeLnw3pQRSPYQDprlrLQkVP8zm0Mew2G5tu2JVxaZQBjKPqjLI+ACFb4tU
 XliVIdfBJQR99tPCSlOkd5+BxjJQuDXWSd76erEtK9KxyY4ZH1tYUjlMZe6TBm9tsTQ+
 wyJQ==
X-Gm-Message-State: ANoB5plDtMXDKI4pTq4VNHA8R7OYbQMytX1ecTZIJrSBpub5wiiF6n7v
 jhg4V8fcpUnQvPfV6SKPZtFK7A==
X-Google-Smtp-Source: AA0mqf7xINeawAZIM5EDguEH0hw2g59e5Y3MCCyjQPvFBuj8H5WdyKJhYpmr/WlaZ5Mo2Z/RPG2oHw==
X-Received: by 2002:a05:6000:1282:b0:241:f10f:b9a5 with SMTP id
 f2-20020a056000128200b00241f10fb9a5mr21446871wrx.407.1669804049641; 
 Wed, 30 Nov 2022 02:27:29 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003b49bd61b19sm5974912wmq.15.2022.11.30.02.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 02:27:29 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 657E81FFB7;
 Wed, 30 Nov 2022 10:27:28 +0000 (GMT)
References: <20221128164105.1191058-1-alex.bennee@linaro.org>
 <20221128164105.1191058-8-alex.bennee@linaro.org>
 <4B9A0F71-8134-476F-ADFB-22FCFC142462@nutanix.com>
 <20221129002939-mutt-send-email-mst@kernel.org>
 <0D6478DF-5A53-43DA-9521-9EFD08CA1A59@nutanix.com>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "slp@redhat.com" <slp@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>, Stefan
 Hajnoczi <stefanha@redhat.com>, Mathieu  Poirier
 <mathieu.poirier@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:Block layer core"
 <qemu-block@nongnu.org>
Subject: Re: [PATCH  v3 7/7] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Wed, 30 Nov 2022 10:25:58 +0000
In-reply-to: <0D6478DF-5A53-43DA-9521-9EFD08CA1A59@nutanix.com>
Message-ID: <87wn7cd9f3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Raphael Norwitz <raphael.norwitz@nutanix.com> writes:

>> On Nov 29, 2022, at 12:30 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
>>=20
>> On Tue, Nov 29, 2022 at 05:18:58AM +0000, Raphael Norwitz wrote:
>>>> On Nov 28, 2022, at 11:41 AM, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>>>>=20
>>>> ..and use for both virtio-user-blk and virtio-user-gpio. This avoids
>>>> the circular close by deferring shutdown due to disconnection until a
>>>> later point. virtio-user-blk already had this mechanism in place so
>>>=20
>>> The mechanism was originally copied from virtio-net so we should
>>> probably fix it there too. AFAICT calling vhost_user_async_close()
>>> should work in net_vhost_user_event().
>>>=20
>>> Otherwise the code looks good modulo a few nits. Happy to see the dupli=
cated logic is being generalized.
>>=20
>> If you do, separate patch pls and does not have to block this series.
>
> If the series is urgent my comments can be addressed later.

On the surface it looks similar but the vhost-net code doesn't deal in
DeviceState opaques and also has invented a s->watch variable for
manually removing gio sources. I'm not sure I'm confident I can
re-factor this code and not break something so close to release.

>
> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>
>>=20
>>>=20
>>>> generalise it as a vhost-user helper function and use for both blk and
>>>> gpio devices.
>>>>=20
>>>> While we are at it we also fix up vhost-user-gpio to re-establish the
>>>> event handler after close down so we can reconnect later.
>>>>=20
>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>> ---
>>>> include/hw/virtio/vhost-user.h | 18 +++++++++
>>>> hw/block/vhost-user-blk.c      | 41 +++-----------------
>>>> hw/virtio/vhost-user-gpio.c    | 11 +++++-
>>>> hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
>>>> 4 files changed, 104 insertions(+), 37 deletions(-)
>>>>=20
>>>> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-=
user.h
>>>> index c6e693cd3f..191216a74f 100644
>>>> --- a/include/hw/virtio/vhost-user.h
>>>> +++ b/include/hw/virtio/vhost-user.h
>>>> @@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBack=
end *chr, Error **errp);
>>>> */
>>>> void vhost_user_cleanup(VhostUserState *user);
>>>>=20
>>>> +/**
>>>> + * vhost_user_async_close() - cleanup vhost-user post connection drop
>>>> + * @d: DeviceState for the associated device (passed to callback)
>>>> + * @chardev: the CharBackend associated with the connection
>>>> + * @vhost: the common vhost device
>>>> + * @cb: the user callback function to complete the clean-up
>>>> + *
>>>> + * This function is used to handle the shutdown of a vhost-user
>>>> + * connection to a backend. We handle this centrally to make sure we
>>>> + * do all the steps and handle potential races due to VM shutdowns.
>>>> + * Once the connection is disabled we call a backhalf to ensure
>>>> + */
>>>> +typedef void (*vu_async_close_fn)(DeviceState *cb);
>>>> +
>>>> +void vhost_user_async_close(DeviceState *d,
>>>> +                            CharBackend *chardev, struct vhost_dev *v=
host,
>>>> +                            vu_async_close_fn cb);
>>>> +
>>>> #endif
>>>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>>>> index 1177064631..aff4d2b8cb 100644
>>>> --- a/hw/block/vhost-user-blk.c
>>>> +++ b/hw/block/vhost-user-blk.c
>>>> @@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceStat=
e *dev)
>>>>    vhost_user_blk_stop(vdev);
>>>>=20
>>>>    vhost_dev_cleanup(&s->dev);
>>>> -}
>>>>=20
>>>> -static void vhost_user_blk_chr_closed_bh(void *opaque)
>>>> -{
>>>> -    DeviceState *dev =3D opaque;
>>>> -    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>>>> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
>>>> -
>>>> -    vhost_user_blk_disconnect(dev);
>>>> +    /* Re-instate the event handler for new connections */
>>>>    qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_ev=
ent,
>>>> -                             NULL, opaque, NULL, true);
>>>> +                             NULL, dev, NULL, true);
>>>> }
>>>>=20
>>>> static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>>>> @@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QE=
MUChrEvent event)
>>>>        }
>>>>        break;
>>>>    case CHR_EVENT_CLOSED:
>>>> -        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>>>> -            /*
>>>> -             * A close event may happen during a read/write, but vhost
>>>> -             * code assumes the vhost_dev remains setup, so delay the
>>>> -             * stop & clear.
>>>> -             */
>>>> -            AioContext *ctx =3D qemu_get_current_aio_context();
>>>> -
>>>> -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, N=
ULL,
>>>> -                    NULL, NULL, false);
>>>> -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh=
, opaque);
>>>> -
>>>> -            /*
>>>> -             * Move vhost device to the stopped state. The vhost-user=
 device
>>>> -             * will be clean up and disconnected in BH. This can be u=
seful in
>>>> -             * the vhost migration code. If disconnect was caught the=
re is an
>>>> -             * option for the general vhost code to get the dev state=
 without
>>>> -             * knowing its type (in this case vhost-user).
>>>> -             *
>>>> -             * FIXME: this is sketchy to be reaching into vhost_dev
>>>> -             * now because we are forcing something that implies we
>>>> -             * have executed vhost_dev_stop() but that won't happen
>>>> -             * until vhost_user_blk_stop() gets called from the bh.
>>>> -             * Really this state check should be tracked locally.
>>>> -             */
>>>> -            s->dev.started =3D false;
>>>> -        }
>>>> +        /* defer close until later to avoid circular close */
>>>> +        vhost_user_async_close(dev, &s->chardev, &s->dev,
>>>> +                               vhost_user_blk_disconnect);
>>>>        break;
>>>>    case CHR_EVENT_BREAK:
>>>>    case CHR_EVENT_MUX_IN:
>>>> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
>>>> index 75e28bcd3b..cd76287766 100644
>>>> --- a/hw/virtio/vhost-user-gpio.c
>>>> +++ b/hw/virtio/vhost-user-gpio.c
>>>> @@ -239,6 +239,8 @@ static int vu_gpio_connect(DeviceState *dev, Error=
 **errp)
>>>>    return 0;
>>>> }
>>>>=20
>>>> +static void vu_gpio_event(void *opaque, QEMUChrEvent event);
>>>> +
>>>> static void vu_gpio_disconnect(DeviceState *dev)
>>>> {
>>>>    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>>>> @@ -251,6 +253,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
>>>>=20
>>>>    vu_gpio_stop(vdev);
>>>>    vhost_dev_cleanup(&gpio->vhost_dev);
>>>> +
>>>> +    /* Re-instate the event handler for new connections */
>>>> +    qemu_chr_fe_set_handlers(&gpio->chardev,
>>>> +                             NULL, NULL, vu_gpio_event,
>>>> +                             NULL, dev, NULL, true);
>>>> }
>>>>=20
>>>> static void vu_gpio_event(void *opaque, QEMUChrEvent event)
>>>> @@ -268,7 +275,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEve=
nt event)
>>>>        }
>>>>        break;
>>>>    case CHR_EVENT_CLOSED:
>>>> -        vu_gpio_disconnect(dev);
>>>> +        /* defer close until later to avoid circular close */
>>>> +        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
>>>> +                               vu_gpio_disconnect);
>>>>        break;
>>>>    case CHR_EVENT_BREAK:
>>>>    case CHR_EVENT_MUX_IN:
>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>>> index abe23d4ebe..8f635844af 100644
>>>> --- a/hw/virtio/vhost-user.c
>>>> +++ b/hw/virtio/vhost-user.c
>>>> @@ -21,6 +21,7 @@
>>>> #include "qemu/error-report.h"
>>>> #include "qemu/main-loop.h"
>>>> #include "qemu/sockets.h"
>>>> +#include "sysemu/runstate.h"
>>>> #include "sysemu/cryptodev.h"
>>>> #include "migration/migration.h"
>>>> #include "migration/postcopy-ram.h"
>>>> @@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
>>>>    user->chr =3D NULL;
>>>> }
>>>>=20
>>>=20
>>> nit: Extra space=20
>>>=20
>>>> +
>>>> +typedef struct {
>>>> +    vu_async_close_fn cb;
>>>> +    DeviceState *dev;
>>>> +    CharBackend *cd;
>>>> +    struct vhost_dev *vhost;
>>>> +} VhostAsyncCallback;
>>>> +
>>>> +static void vhost_user_async_close_bh(void *opaque)
>>>> +{
>>>> +    VhostAsyncCallback *data =3D opaque;
>>>> +    struct vhost_dev *vhost =3D data->vhost;
>>>> +
>>>> +    /*
>>>> +     * If the vhost_dev has been cleared in the meantime there is
>>>> +     * nothing left to do as some other path has completed the
>>>> +     * cleanup.
>>>> +     */
>>>> +    if (vhost->vdev) {
>>>> +        data->cb(data->dev);
>>>> +    }
>>>> +
>>>> +    g_free(data);
>>>> +}
>>>> +
>>>> +/*
>>>> + * We only schedule the work if the machine is running. If suspended
>>>> + * we want to keep all the in-flight data as is for migration
>>>> + * purposes.
>>>> + */
>>>> +void vhost_user_async_close(DeviceState *d,
>>>> +                            CharBackend *chardev, struct vhost_dev *v=
host,
>>>> +                            vu_async_close_fn cb)
>>>> +{
>>>> +    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>>>> +        /*
>>>> +         * A close event may happen during a read/write, but vhost
>>>> +         * code assumes the vhost_dev remains setup, so delay the
>>>> +         * stop & clear.
>>>> +         */
>>>> +        AioContext *ctx =3D qemu_get_current_aio_context();
>>>> +        VhostAsyncCallback *data =3D g_new0(VhostAsyncCallback, 1);
>>>> +
>>>> +        /* Save data for the callback */
>>>> +        data->cb =3D cb;
>>>> +        data->dev =3D d;
>>>> +        data->cd =3D chardev;
>>>> +        data->vhost =3D vhost;
>>>> +
>>>> +        /* Disable any further notifications on the chardev */
>>>> +        qemu_chr_fe_set_handlers(chardev,
>>>> +                                 NULL, NULL, NULL, NULL, NULL, NULL,
>>>> +                                 false);
>>>> +
>>>> +        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
>>>> +
>>>> +        /*
>>>> +         * Move vhost device to the stopped state. The vhost-user dev=
ice
>>>=20
>>> Not this change=E2=80=99s fault but we should fix up the grammar here i=
.e.
>>> s/clean/cleaned/ and probably should be =E2=80=9Cdisconnected in the
>>> BH=E2=80=9D=E2=80=A6etc.
>>>=20
>>>> +         * will be clean up and disconnected in BH. This can be usefu=
l in
>>>> +         * the vhost migration code. If disconnect was caught there i=
s an
>>>> +         * option for the general vhost code to get the dev state wit=
hout
>>>> +         * knowing its type (in this case vhost-user).
>>>> +         *
>>>> +         * Note if the vhost device is fully cleared by the time we
>>>> +         * execute the bottom half we won't continue with the cleanup.
>>>> +         */
>>>> +        vhost->started =3D false;
>>>> +    }
>>>> +}
>>>> +
>>>> static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>>>> {
>>>>    if (!virtio_has_feature(dev->protocol_features,
>>>> --=20
>>>> 2.34.1
>>>>=20
>>>=20
>>=20


--=20
Alex Benn=C3=A9e

