Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC0A63F607
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 18:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0n6s-0004Zm-22; Thu, 01 Dec 2022 12:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0n6n-0004ZR-8U
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 12:12:26 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p0n6k-0002Ef-Ig
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 12:12:24 -0500
Received: by mail-wr1-x430.google.com with SMTP id f18so3775872wrj.5
 for <qemu-devel@nongnu.org>; Thu, 01 Dec 2022 09:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=koNXauXfdMq7Rx+XLTIO3C6tCrMLAJfLlMAFZC8GWQI=;
 b=Myc82jCFluGA81h4K8NzsPQXlOw0yBzKUNyAdPyiIHL3h1bWhliQ7jMzskD8zrgvRm
 k6XvXj9rObF0ri2TqtnblroEx07dsuyAnWcaKIyuWPCw0Z0CufMVRPv+zw8FndbLqvQA
 N1uzR4+UHUXBQqMUuLThrUT9hkyroQPhg4r28MQqPxUT6tymTX25dDB3kSiwNg/Fc3j3
 uIaoXJZcsy+x6/obEoFloe6dCJoELvFtVkBqFWwBjhjMPnLysof0cLAtjxJLbzxPg0mB
 eBVjYH4W0H/DnorsLsFO1e0lJh7+De8GcayxYRM44j4f3QdR6j8QP1k/ZQPLrjm5I99Y
 Gjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=koNXauXfdMq7Rx+XLTIO3C6tCrMLAJfLlMAFZC8GWQI=;
 b=U7AF7TyUPRcm3LQ0SgMwAXi+Y3yQ6RO+emP9vJCkKGwTxgn17btJnhKUiOLwbSBO3p
 lewqkIqjm9VFTVH5QS9pNAMvH3trKU+ZkBuluTqQNGFNvtBTKsbBOpWKMpAvuZuruiMO
 hy4T8vnoHOYaZMYsaqtane8drX/5G/aQSBtBDuCjXu4LhhUGfHzaJ5CKSxko6hKmG7pC
 Pi1+d6b8LzvJqgqcmzRV+JC0mTUqHR/UPpeEw63eWbisWfi4T8LbGjlGfunb73q0K7F3
 P+XqfBXEdHoCyjxVks6HXkapPQlHo0otAjMeP8A7WAwU+kZVOKuy7LKVf3YKyIonSVMg
 3aYA==
X-Gm-Message-State: ANoB5pnvMDI4ye2OCXFXlh5wUwOSN2hzfIHc5pZVgusiljuoGsUUj+6F
 MUPSPXqhjUngOZxM4ime8CJsVw==
X-Google-Smtp-Source: AA0mqf6MO5+opc4GIqsrGjeAwyBq/gufueO/4SUQ1mnKsjdZDwHvaA7GRhgEYf60xrSqR1UP8sNsRw==
X-Received: by 2002:a5d:5187:0:b0:242:5ef:ce32 with SMTP id
 k7-20020a5d5187000000b0024205efce32mr20175920wrv.260.1669914740936; 
 Thu, 01 Dec 2022 09:12:20 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a056000118b00b00225307f43fbsm5067095wrx.44.2022.12.01.09.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 09:12:20 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CA4E51FFB7;
 Thu,  1 Dec 2022 17:12:19 +0000 (GMT)
References: <20221130112439.2527228-1-alex.bennee@linaro.org>
 <20221130112439.2527228-5-alex.bennee@linaro.org>
 <Y4fJZhRgpAH4NVVP@fedora>
User-agent: mu4e 1.9.3; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, mst@redhat.com,
 marcandre.lureau@redhat.com, mathieu.poirier@linaro.org,
 viresh.kumar@linaro.org, sgarzare@redhat.com, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH  v4 4/5] hw/virtio: generalise CHR_EVENT_CLOSED handling
Date: Thu, 01 Dec 2022 17:05:06 +0000
In-reply-to: <Y4fJZhRgpAH4NVVP@fedora>
Message-ID: <87v8mvaw0c.fsf@linaro.org>
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


Stefan Hajnoczi <stefanha@redhat.com> writes:

> [[PGP Signed Part:Undecided]]
> On Wed, Nov 30, 2022 at 11:24:38AM +0000, Alex Benn=C3=A9e wrote:
>> ..and use for both virtio-user-blk and virtio-user-gpio. This avoids
>> the circular close by deferring shutdown due to disconnection until a
>> later point.
>
> I thought re-entrancy was already avoided by Patch 3?

No because vu_gpio_disconnect() gets called while we are in the process
of tearing things down for the vu_gpio_stop(). As it hasn't disconnected
yet we end up doing the teardown there:

  #2  0x0000557adbe04d56 in vu_gpio_disconnect (dev=3D0x557adf80d640) at ..=
/../hw/virtio/vhost-user-gpio.c:255
  #3  0x0000557adbe049bb in vu_gpio_event (opaque=3D0x557adf80d640, event=
=3DCHR_EVENT_CLOSED) at ../../hw/virtio/vhost-user-gpio.c:274
  #4  0x0000557adc0539ef in chr_be_event (s=3D0x557adea51f10, event=3DCHR_E=
VENT_CLOSED) at ../../chardev/char.c:61
  #5  0x0000557adc0506aa in qemu_chr_be_event (s=3D0x557adea51f10, event=3D=
CHR_EVENT_CLOSED) at ../../chardev/char.c:81
  #6  0x0000557adc04f666 in tcp_chr_disconnect_locked (chr=3D0x557adea51f10=
) at ../../chardev/char-socket.c:470
  #7  0x0000557adc04c81a in tcp_chr_write (chr=3D0x557adea51f10, buf=3D0x7f=
fe8588cce0 "\v", len=3D20) at ../../chardev/char-socket.c:129
  #8  0x0000557adc050999 in qemu_chr_write_buffer (s=3D0x557adea51f10, buf=
=3D0x7ffe8588cce0 "\v", len=3D20, offset=3D0x7ffe8588cbe4, write_all=3Dtrue=
) at ../../chardev/char.c:121
  #9  0x0000557adc0507c7 in qemu_chr_write (s=3D0x557adea51f10, buf=3D0x7ff=
e8588cce0 "\v", len=3D20, write_all=3Dtrue) at ../../chardev/char.c:173
  #10 0x0000557adc046f3a in qemu_chr_fe_write_all (be=3D0x557adf80d830, buf=
=3D0x7ffe8588cce0 "\v", len=3D20) at ../../chardev/char-fe.c:53
  #11 0x0000557adbddc02f in vhost_user_write (dev=3D0x557adf80d878, msg=3D0=
x7ffe8588cce0, fds=3D0x0, fd_num=3D0) at ../../hw/virtio/vhost-user.c:490
  #12 0x0000557adbddd48f in vhost_user_get_vring_base (dev=3D0x557adf80d878=
, ring=3D0x7ffe8588d000) at ../../hw/virtio/vhost-user.c:1260
  #13 0x0000557adbdd4bd6 in vhost_virtqueue_stop (dev=3D0x557adf80d878, vde=
v=3D0x557adf80d640, vq=3D0x557adf843570, idx=3D0) at ../../hw/virtio/vhost.=
c:1220
  #14 0x0000557adbdd7eda in vhost_dev_stop (hdev=3D0x557adf80d878, vdev=3D0=
x557adf80d640, vrings=3Dfalse) at ../../hw/virtio/vhost.c:1916
  #15 0x0000557adbe051a6 in vu_gpio_stop (vdev=3D0x557adf80d640) at ../../h=
w/virtio/vhost-user-gpio.c:142

and when we finally return the disconnect event has wiped out vhost_user.

>
>> virtio-user-blk already had this mechanism in place so
>> generalise it as a vhost-user helper function and use for both blk and
>> gpio devices.
>>=20
>> While we are at it we also fix up vhost-user-gpio to re-establish the
>> event handler after close down so we can reconnect later.
>
> I don't understand how the BH is supposed to help. Normally BHs are used
> to defer processing while we're in a call stack of some depth. The
> callers still require the resource we want to free, so we scheduled a
> BH.
>
> That's not the case here. The CHR_EVENT_CLOSED callback is just another
> top-level event handler, not something that is called deep in a call
> stack.

Well it is in the shutdown case because as we write to the vhost_user
backend to shut things down it dies and we immediately process the
disconnect event.

It is racy though so some times you get away with it.

> This BH approach isn't safe against nested event loops (something that
> calls aio_poll() to wait), because now the BH can be invoked deep in a
> call stack.

Well I did ask if anyone had any better suggestions. In this case I'm
mostly just copying what vhost-user-blk did.

>
> That said, if Patch 3 isn't enough and this patch fixes a problem, then
> let's keep it for 7.2. It feels like a possibly incomplete solution and
> maybe something that should be solved differently in 8.0.
>
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
>> ---
>>  include/hw/virtio/vhost-user.h | 18 +++++++++
>>  hw/block/vhost-user-blk.c      | 41 +++-----------------
>>  hw/virtio/vhost-user-gpio.c    | 11 +++++-
>>  hw/virtio/vhost-user.c         | 71 ++++++++++++++++++++++++++++++++++
>>  4 files changed, 104 insertions(+), 37 deletions(-)
>>=20
>> diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-us=
er.h
>> index c6e693cd3f..191216a74f 100644
>> --- a/include/hw/virtio/vhost-user.h
>> +++ b/include/hw/virtio/vhost-user.h
>> @@ -68,4 +68,22 @@ bool vhost_user_init(VhostUserState *user, CharBacken=
d *chr, Error **errp);
>>   */
>>  void vhost_user_cleanup(VhostUserState *user);
>>=20=20
>> +/**
>> + * vhost_user_async_close() - cleanup vhost-user post connection drop
>> + * @d: DeviceState for the associated device (passed to callback)
>> + * @chardev: the CharBackend associated with the connection
>> + * @vhost: the common vhost device
>> + * @cb: the user callback function to complete the clean-up
>> + *
>> + * This function is used to handle the shutdown of a vhost-user
>> + * connection to a backend. We handle this centrally to make sure we
>> + * do all the steps and handle potential races due to VM shutdowns.
>> + * Once the connection is disabled we call a backhalf to ensure
>> + */
>> +typedef void (*vu_async_close_fn)(DeviceState *cb);
>> +
>> +void vhost_user_async_close(DeviceState *d,
>> +                            CharBackend *chardev, struct vhost_dev *vho=
st,
>> +                            vu_async_close_fn cb);
>> +
>>  #endif
>> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
>> index 1177064631..aff4d2b8cb 100644
>> --- a/hw/block/vhost-user-blk.c
>> +++ b/hw/block/vhost-user-blk.c
>> @@ -369,17 +369,10 @@ static void vhost_user_blk_disconnect(DeviceState =
*dev)
>>      vhost_user_blk_stop(vdev);
>>=20=20
>>      vhost_dev_cleanup(&s->dev);
>> -}
>>=20=20
>> -static void vhost_user_blk_chr_closed_bh(void *opaque)
>> -{
>> -    DeviceState *dev =3D opaque;
>> -    VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>> -    VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
>> -
>> -    vhost_user_blk_disconnect(dev);
>> +    /* Re-instate the event handler for new connections */
>>      qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, vhost_user_blk_ev=
ent,
>> -                             NULL, opaque, NULL, true);
>> +                             NULL, dev, NULL, true);
>>  }
>>=20=20
>>  static void vhost_user_blk_event(void *opaque, QEMUChrEvent event)
>> @@ -398,33 +391,9 @@ static void vhost_user_blk_event(void *opaque, QEMU=
ChrEvent event)
>>          }
>>          break;
>>      case CHR_EVENT_CLOSED:
>> -        if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>> -            /*
>> -             * A close event may happen during a read/write, but vhost
>> -             * code assumes the vhost_dev remains setup, so delay the
>> -             * stop & clear.
>> -             */
>> -            AioContext *ctx =3D qemu_get_current_aio_context();
>> -
>> -            qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NUL=
L,
>> -                    NULL, NULL, false);
>> -            aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, =
opaque);
>> -
>> -            /*
>> -             * Move vhost device to the stopped state. The vhost-user d=
evice
>> -             * will be clean up and disconnected in BH. This can be use=
ful in
>> -             * the vhost migration code. If disconnect was caught there=
 is an
>> -             * option for the general vhost code to get the dev state w=
ithout
>> -             * knowing its type (in this case vhost-user).
>> -             *
>> -             * FIXME: this is sketchy to be reaching into vhost_dev
>> -             * now because we are forcing something that implies we
>> -             * have executed vhost_dev_stop() but that won't happen
>> -             * until vhost_user_blk_stop() gets called from the bh.
>> -             * Really this state check should be tracked locally.
>> -             */
>> -            s->dev.started =3D false;
>> -        }
>> +        /* defer close until later to avoid circular close */
>> +        vhost_user_async_close(dev, &s->chardev, &s->dev,
>> +                               vhost_user_blk_disconnect);
>>          break;
>>      case CHR_EVENT_BREAK:
>>      case CHR_EVENT_MUX_IN:
>> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
>> index be9be08b4c..b7b82a1099 100644
>> --- a/hw/virtio/vhost-user-gpio.c
>> +++ b/hw/virtio/vhost-user-gpio.c
>> @@ -233,6 +233,8 @@ static int vu_gpio_connect(DeviceState *dev, Error *=
*errp)
>>      return 0;
>>  }
>>=20=20
>> +static void vu_gpio_event(void *opaque, QEMUChrEvent event);
>> +
>>  static void vu_gpio_disconnect(DeviceState *dev)
>>  {
>>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>> @@ -245,6 +247,11 @@ static void vu_gpio_disconnect(DeviceState *dev)
>>=20=20
>>      vu_gpio_stop(vdev);
>>      vhost_dev_cleanup(&gpio->vhost_dev);
>> +
>> +    /* Re-instate the event handler for new connections */
>> +    qemu_chr_fe_set_handlers(&gpio->chardev,
>> +                             NULL, NULL, vu_gpio_event,
>> +                             NULL, dev, NULL, true);
>>  }
>>=20=20
>>  static void vu_gpio_event(void *opaque, QEMUChrEvent event)
>> @@ -262,7 +269,9 @@ static void vu_gpio_event(void *opaque, QEMUChrEvent=
 event)
>>          }
>>          break;
>>      case CHR_EVENT_CLOSED:
>> -        vu_gpio_disconnect(dev);
>> +        /* defer close until later to avoid circular close */
>> +        vhost_user_async_close(dev, &gpio->chardev, &gpio->vhost_dev,
>> +                               vu_gpio_disconnect);
>>          break;
>>      case CHR_EVENT_BREAK:
>>      case CHR_EVENT_MUX_IN:
>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>> index abe23d4ebe..8f635844af 100644
>> --- a/hw/virtio/vhost-user.c
>> +++ b/hw/virtio/vhost-user.c
>> @@ -21,6 +21,7 @@
>>  #include "qemu/error-report.h"
>>  #include "qemu/main-loop.h"
>>  #include "qemu/sockets.h"
>> +#include "sysemu/runstate.h"
>>  #include "sysemu/cryptodev.h"
>>  #include "migration/migration.h"
>>  #include "migration/postcopy-ram.h"
>> @@ -2670,6 +2671,76 @@ void vhost_user_cleanup(VhostUserState *user)
>>      user->chr =3D NULL;
>>  }
>>=20=20
>> +
>> +typedef struct {
>> +    vu_async_close_fn cb;
>> +    DeviceState *dev;
>> +    CharBackend *cd;
>> +    struct vhost_dev *vhost;
>> +} VhostAsyncCallback;
>> +
>> +static void vhost_user_async_close_bh(void *opaque)
>> +{
>> +    VhostAsyncCallback *data =3D opaque;
>> +    struct vhost_dev *vhost =3D data->vhost;
>> +
>> +    /*
>> +     * If the vhost_dev has been cleared in the meantime there is
>> +     * nothing left to do as some other path has completed the
>> +     * cleanup.
>> +     */
>> +    if (vhost->vdev) {
>> +        data->cb(data->dev);
>> +    }
>> +
>> +    g_free(data);
>> +}
>> +
>> +/*
>> + * We only schedule the work if the machine is running. If suspended
>> + * we want to keep all the in-flight data as is for migration
>> + * purposes.
>> + */
>> +void vhost_user_async_close(DeviceState *d,
>> +                            CharBackend *chardev, struct vhost_dev *vho=
st,
>> +                            vu_async_close_fn cb)
>> +{
>> +    if (!runstate_check(RUN_STATE_SHUTDOWN)) {
>> +        /*
>> +         * A close event may happen during a read/write, but vhost
>> +         * code assumes the vhost_dev remains setup, so delay the
>> +         * stop & clear.
>> +         */
>> +        AioContext *ctx =3D qemu_get_current_aio_context();
>> +        VhostAsyncCallback *data =3D g_new0(VhostAsyncCallback, 1);
>> +
>> +        /* Save data for the callback */
>> +        data->cb =3D cb;
>> +        data->dev =3D d;
>> +        data->cd =3D chardev;
>> +        data->vhost =3D vhost;
>> +
>> +        /* Disable any further notifications on the chardev */
>> +        qemu_chr_fe_set_handlers(chardev,
>> +                                 NULL, NULL, NULL, NULL, NULL, NULL,
>> +                                 false);
>> +
>> +        aio_bh_schedule_oneshot(ctx, vhost_user_async_close_bh, data);
>> +
>> +        /*
>> +         * Move vhost device to the stopped state. The vhost-user device
>> +         * will be clean up and disconnected in BH. This can be useful =
in
>> +         * the vhost migration code. If disconnect was caught there is =
an
>> +         * option for the general vhost code to get the dev state witho=
ut
>> +         * knowing its type (in this case vhost-user).
>> +         *
>> +         * Note if the vhost device is fully cleared by the time we
>> +         * execute the bottom half we won't continue with the cleanup.
>> +         */
>> +        vhost->started =3D false;
>> +    }
>> +}
>> +
>>  static int vhost_user_dev_start(struct vhost_dev *dev, bool started)
>>  {
>>      if (!virtio_has_feature(dev->protocol_features,
>> --=20
>> 2.34.1
>>=20
>
> [[End of PGP Signed Part]]


--=20
Alex Benn=C3=A9e

