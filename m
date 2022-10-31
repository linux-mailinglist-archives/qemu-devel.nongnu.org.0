Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F34206131B8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 09:31:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opQC2-0005al-Nx; Mon, 31 Oct 2022 04:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opQBt-0005aL-Bw
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1opQBn-00054d-CS
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 04:30:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667205034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMwO5p9ydlXmkNEhuXHLTFFNIo0AXQuYxgACpsfKjhc=;
 b=TsOUWU1ABbu6BUjRRFghBdVzHEmaqOeilP/c2d6NIjrMzDVk8RYUThlCVsRP6egEhZW1UU
 1shbtFG6ndgBM7fmhnVm/+TIeQfq/343PG+RFgguebGW5mkDWyPQmiIBHDYjBUceylq75R
 jmTLRZwnQCIL7KAyZkkauO0d5p7FSS4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-WXosMeWuNUmSUXqixBPbrg-1; Mon, 31 Oct 2022 04:30:30 -0400
X-MC-Unique: WXosMeWuNUmSUXqixBPbrg-1
Received: by mail-pf1-f200.google.com with SMTP id
 s2-20020aa78282000000b00561ba8f77b4so5300860pfm.1
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 01:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YMwO5p9ydlXmkNEhuXHLTFFNIo0AXQuYxgACpsfKjhc=;
 b=OAki10yCmeckdwIekNkSfltmYDcS1MaeN1uQSXvZr+Cdom6YXSzbsX4+JyhkwsVaUP
 2yEUZN45abAqdizpM7k+6v9t35HV0C98ekleg0WfKmClVzcxdUxRDt8CQkutnCXXn8gF
 0R/v4EFGkXOaMoPiwcqz0LPHzlMlf/9pMwv7swyzrMKuVRgJesdQG7x3AEqYXhzFOJKU
 /6m17Tjdc7v+GXBlM3C/kVcNXtGqMrrMHooSkEHiDy1U4aXYojUkqOdYVxX+ag9D9MGG
 msmxebE+BTzpqYnWmLxL6oK01GdtKIKdZOX3IiaQacuWR7i2GOgKu0FNV8F+eiy/8XOG
 4SaA==
X-Gm-Message-State: ACrzQf1NfgAvtlDMOE8erO2I/uNDkeKYe2VGkz2/BVd2apgmK+bRCiuv
 BRafOe0doSTS4yJ4of4sURz2fxKGk+p2kk+vr2uQo32+wp6aqKOJZZDld59CLasutz7iRgJYyeL
 knGW52p/poPa974KoPSNB9JngFpFiNB0=
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id
 mp12-20020a17090b190c00b00211ab5635e6mr31465719pjb.159.1667205029805; 
 Mon, 31 Oct 2022 01:30:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5x65yix6SVm7G6Ael3YKU7wf9ZA1cT0laGQROiiekb78ZdyLYFUTptL8BXoq5Adh7L/+IdnJXwyu6M5g4kGGg=
X-Received: by 2002:a17:90b:190c:b0:211:ab56:35e6 with SMTP id
 mp12-20020a17090b190c00b00211ab5635e6mr31465700pjb.159.1667205029552; Mon, 31
 Oct 2022 01:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221028160251.268607-1-eperezma@redhat.com>
 <20221028160251.268607-5-eperezma@redhat.com>
 <a08bc5b7-8481-49f7-c4fb-a4c780783e5b@linaro.org>
In-Reply-To: <a08bc5b7-8481-49f7-c4fb-a4c780783e5b@linaro.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Oct 2022 09:29:53 +0100
Message-ID: <CAJaqyWerZzwFK01+rrdp-dHqFAmrUx-3PYfK+VGY3zGRDOwJBw@mail.gmail.com>
Subject: Re: [PATCH 4/4] vhost: convert byte order on avail_event read
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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

On Sat, Oct 29, 2022 at 12:53 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 28/10/22 18:02, Eugenio P=C3=A9rez wrote:
> > This causes errors on virtio modern devices on big endian hosts
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 18a49e1ecb..3131903edd 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -231,7 +231,8 @@ static void vhost_svq_kick(VhostShadowVirtqueue *sv=
q)
> >           size_t num =3D svq->vring.num;
> >           uint16_t *avail_event =3D (uint16_t *)&svq->vring.used->ring[=
num];
> >
>
>    uint16_t avail_event =3D virtio_lduw_p(svq->vdev,
>                                         &svq->vring.used->ring[num]);
>    needs_kick =3D vring_need_event(avail_event,
>                                  svq->shadow_avail_idx,
>                                  svq->shadow_avail_idx - 1);
>

It would work, but just because all vrings must be little endian for
the moment. If we support legacy drivers on a big endian host and
guest in the future, it would not work.

virtio_ld and virtio_st handle the conversions between the guest and
the emulated device in qemu, but this conversion is between qemu
shadow vring and the vdpa device (assuming modern, little endian for
the moment).

Right now the feature set must be the same, but it could not be that
way in the future.

Thanks!

> > -        needs_kick =3D vring_need_event(*avail_event, svq->shadow_avai=
l_idx,
> > +        needs_kick =3D vring_need_event(le16_to_cpu(*avail_event),
> > +                                      svq->shadow_avail_idx,
> >                                         svq->shadow_avail_idx - 1);
> >       } else {
> >           needs_kick =3D !(svq->vring.used->flags & VRING_USED_F_NO_NOT=
IFY);
>


