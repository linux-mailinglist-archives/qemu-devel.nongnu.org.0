Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C01632F3A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 22:48:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxEd9-0006Fv-L5; Mon, 21 Nov 2022 16:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxEd6-0006EB-M6
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:47:04 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxEd4-0003iq-GB
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 16:47:04 -0500
Received: by mail-wr1-x42c.google.com with SMTP id cl5so21859471wrb.9
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 13:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q1GG+yvWpePc7eb/n6WhLCot2lU9UeRTJnXcv0xWXck=;
 b=ZbnXnxNBq4a/jkogItJvYEiiayqRnU+JTRqB9eh8+aWDZ/39vwYOX0nXUEiqk4ToX1
 spxRpeTwdAGGKedUGoKfvGgzdiq0CTQpaGuka9D1eExtQu+o28KYZEkxsxmc0Uc+ZsLd
 WLA1rDol4PANC8MtaDVUEJg/jHR2bHoTtyYt38xrX+Ad3rPpTOQqAfbOO00mjgeDqW7t
 1XfjcFaiHboF61+Yzs2fl0kki7ZXZwgntopYjpx/aH9BGOguUWpAjuJL6M7y2G3b3O+a
 F05YvCYOTCc1Mbj8CCfGy9Z6O5BsP3zX1VEhR/0L4tGUKzUlDPmPA2UTS5iv9FYp7aR9
 F5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=q1GG+yvWpePc7eb/n6WhLCot2lU9UeRTJnXcv0xWXck=;
 b=BBSH00GX1KGxiajA/CwDt6dx2X6KSV0pBLimAw0C8XpI33C/cZQzqL1c54E8qce74F
 GrnrcTZVFTOpcjnRKWaZBXa3RGQ/2aPpHjFYoNpC+RLQD8LJcFUlyOgPLpAm/URwPRzk
 o7J/VzW0957FN57CBQY3NSCZ0uStp53hEzSEw2ewbckoFYTUw9cZn6X8uo7z1wXMeeX5
 /RcZuCcFwf79WANAj3qolwCwdBw0QpzbHEX6CZ3kdEb9RCZRpasdO/GK0QZi9u78Medr
 q/jAr3HG3najSpNauJQtae/A26TKWaw+qa1aMwe+9P87vBeZOFskKzBZKOW2JTjTRvJR
 a7BA==
X-Gm-Message-State: ANoB5pnPrP414uqQYCxpgDEoUO1W9Qyam31GBAjy5mo2Aair36hlnbdK
 YwB29CWdknuatWSIrXejMyld9g==
X-Google-Smtp-Source: AA0mqf6fSlF3saWUodGKhYTeEsDl7/Hj6bBVbbdYwZF5IB9ZpJjdAzzniEPfidFLF/WughtLNM8EnQ==
X-Received: by 2002:adf:fd46:0:b0:22e:382d:b06 with SMTP id
 h6-20020adffd46000000b0022e382d0b06mr11804443wrs.265.1669067220729; 
 Mon, 21 Nov 2022 13:47:00 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a5d61c5000000b002362f6fcaf5sm12476053wrv.48.2022.11.21.13.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 13:47:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 544831FFB7;
 Mon, 21 Nov 2022 21:46:59 +0000 (GMT)
References: <20221121144921.2830330-1-alex.bennee@linaro.org>
 <CAJSP0QU72EnMQRbHpZ812QpszkjEeStA1R2Jic1VvCKBFas8_g@mail.gmail.com>
 <87a64kcdpk.fsf@linaro.org>
 <20221121150635-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org, Stefano
 Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH] include/hw: attempt to document VirtIO feature
 variables (!DISCUSS!)
Date: Mon, 21 Nov 2022 21:45:59 +0000
In-reply-to: <20221121150635-mutt-send-email-mst@kernel.org>
Message-ID: <875yf8c758.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Nov 21, 2022 at 07:15:30PM +0000, Alex Benn=C3=A9e wrote:
>>=20
>> Stefan Hajnoczi <stefanha@gmail.com> writes:
>>=20
>> > On Mon, 21 Nov 2022 at 09:49, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> We have a bunch of variables associated with the device and the vhost
>> >> backend which are used inconsistently throughout the code base. Lets
>> >> start trying to bring some order by agreeing what each variable is
>> >> for. Some cases to address (vho/vio renames to avoid ambiguous results
>> >> while grepping):
>> >>
>> >> virtio->guest_features is mostly the live status of the features field
>> >> and read and written as such by the guest. It does get manipulated by
>> >> the various load state via virtio_set_features_nocheck(vdev, val) for
>> >> migration.
>> >>
>> >> virtio->host_features is the result of vcd->get_features() most of the
>> >> time and for vhost-user devices eventually ends up down at the vhost
>> >> get features message:
>> >>
>> >>   ./hw/virtio/virtio-bus.c:66:    vdev->host_features =3D vdc->get_fe=
atures(vdev, vdev->host_features,
>> >>
>> >> However virtio-net does a lot of direct modification of it:
>> >>
>> >>   ./hw/net/virtio-net.c:3517:        n->host_features |=3D (1ULL << V=
IRTIO_NET_F_MTU);
>> >>   ./hw/net/virtio-net.c:3529:        n->host_features |=3D (1ULL << V=
IRTIO_NET_F_SPEED_DUPLEX);
>> >>   ./hw/net/virtio-net.c:3539:        n->host_features |=3D (1ULL << V=
IRTIO_NET_F_SPEED_DUPLEX);
>> >>   ./hw/net/virtio-net.c:3548:        n->host_features |=3D (1ULL << V=
IRTIO_NET_F_STANDBY);
>> >>   ./hw/virtio/virtio.c:3438:    bool bad =3D (val & ~(vdev->host_feat=
ures)) !=3D 0;
>> >>
>> >> And we have this case which propagates the global QMP values for the
>> >> device to the host features. This causes the resent regression of
>> >> vhost-user-sock due to 69e1c14aa2 (virtio: core: vq reset feature
>> >> negotation support) because the reset feature was rejected by the
>> >> vhost-user backend causing it to freeze:
>> >>
>> >>   ./hw/virtio/virtio.c:4667:    status->host_features =3D qmp_decode_=
features(vdev->device_id,
>> >>
>> >> virtio->backend_features is only used by virtio-net to stash the
>> >> vhost_net_get_features features for checking later:
>> >>
>> >>     features =3D vhost_net_get_features(get_vhost_net(nc->peer), feat=
ures);
>> >>     vdev->vio_backend_features =3D features;
>> >>
>> >> and:
>> >>
>> >>     if (n->mtu_bypass_backend &&
>> >>             !virtio_has_feature(vdev->vio_backend_features, VIRTIO_NE=
T_F_MTU)) {
>> >>         features &=3D ~(1ULL << VIRTIO_NET_F_MTU);
>> >>     }
>> >>
>> >> vhost_dev->acked_features seems to mostly reflect
>> >> virtio->guest_features (but where in the negotiation cycle?). Except
>> >> for vhost_net where is becomes vhost_dev->backend_features
>> >>
>> >>   ./backends/vhost-user.c:87:    b->dev.vho_acked_features =3D b->vde=
v->guest_features;
>> >>   ./hw/block/vhost-user-blk.c:149:    s->dev.vho_acked_features =3D v=
dev->guest_features;
>> >>   ./hw/net/vhost_net.c:132:    net->dev.vho_acked_features =3D net->d=
ev.vho_backend_features;
>> >>   ./hw/scsi/vhost-scsi-common.c:53:    vsc->dev.vho_acked_features =
=3D vdev->guest_features;
>> >>   ./hw/virtio/vhost-user-fs.c:77:    fs->vhost_dev.vho_acked_features=
 =3D vdev->guest_features;
>> >>   ./hw/virtio/vhost-user-i2c.c:46:    i2c->vhost_dev.vho_acked_featur=
es =3D vdev->guest_features;
>> >>   ./hw/virtio/vhost-user-rng.c:44:    rng->vhost_dev.vho_acked_featur=
es =3D vdev->guest_features;
>> >>   ./hw/virtio/vhost-vsock-common.c:71:    vvc->vhost_dev.vho_acked_fe=
atures =3D vdev->guest_features;
>> >>   ./hw/virtio/vhost.c:1631:            hdev->vho_acked_features |=3D =
bit_mask;
>> >>
>> >> vhost_dev->backend_features has become overloaded with two use cases:
>> >>
>> >>   ./hw/block/vhost-user-blk.c:336:    s->dev.vho_backend_features =3D=
 0;
>> >>   ./hw/net/vhost_net.c:180:        net->dev.vho_backend_features =3D =
qemu_has_vnet_hdr(options->net_backend)
>> >>   ./hw/net/vhost_net.c:185:        net->dev.vho_backend_features =3D =
0;
>> >>   ./hw/scsi/vhost-scsi.c:220:    vsc->dev.vho_backend_features =3D 0;
>> >>   ./hw/scsi/vhost-user-scsi.c:121:    vsc->dev.vho_backend_features =
=3D 0;
>> >>   ./hw/virtio/vhost-user.c:2083:        dev->vho_backend_features |=
=3D 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>> >> One use for saving the availability of a vhost-net feature and another
>> >> for ensuring we add the protocol feature negotiation bit when querying
>> >> a vhost backend. Maybe the places where this is queried should really
>> >> be bools that can be queried in the appropriate places?
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: Stefano Garzarella <sgarzare@redhat.com>
>> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> >> Cc: Stefan Hajnoczi <stefanha@gmail.com>
>> >> ---
>> >>  include/hw/virtio/vhost.h  | 18 +++++++++++++++---
>> >>  include/hw/virtio/virtio.h | 20 +++++++++++++++++++-
>> >>  2 files changed, 34 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> >> index 353252ac3e..502aa5677a 100644
>> >> --- a/include/hw/virtio/vhost.h
>> >> +++ b/include/hw/virtio/vhost.h
>> >> @@ -88,13 +88,25 @@ struct vhost_dev {
>> >>      int vq_index_end;
>> >>      /* if non-zero, minimum required value for max_queues */
>> >>      int num_queues;
>> >> +    /**
>> >> +     * vhost feature handling requires matching the feature set
>> >> +     * offered by a backend which may be a subset of the total
>> >> +     * features eventually offered to the guest.
>> >> +     *
>> >> +     * @features: available features provided by the backend
>> >> +     * @acked_features: final set of negotiated features with the
>> >> +     * front-end driver
>> >> +     * @backend_features: additional feature bits applied during neg=
otiation
>> >
>> > What does this mean?
>>=20
>> Well practically it is currently either applying
>> VHOST_USER_F_PROTOCOL_FEATURES to the vhost_user_set_features() or
>> storing VHOST_NET_F_VIRTIO_NET_HDR which I think eventually gets applied
>> to:
>>=20
>>   net->dev.acked_features =3D net->dev.backend_features;
>>=20
>> I suspect both could be dropped and handled as flags and applied at the
>> destination.
>>=20
>> >
>> >> +     *
>> >> +     * Finally the @protocol_features is the final protocal feature
>> >
>> > s/protocal/protocol/
>> >
>> > All the other fields are VIRTIO feature bits and this field holds the
>> > VHOST_USER_SET_FEATURES feature bits?
>>=20
>> No these are the protocol features so a totally separate set of feature
>> bits for the vhost user protocol. I don't think these apply to kernel
>> vhost stuff?
>>=20
>> >
>> >> +     * set negotiated between QEMU and the backend (after
>> >> +     * VHOST_USER_F_PROTOCOL_FEATURES is negotiated)
>> >> +     */
>> >>      uint64_t features;
>> >> -    /** @acked_features: final set of negotiated features */
>> >>      uint64_t acked_features;
>> >> -    /** @backend_features: backend specific feature bits */
>> >>      uint64_t backend_features;
>> >> -    /** @protocol_features: final negotiated protocol features */
>> >>      uint64_t protocol_features;
>> >> +
>> >>      uint64_t max_queues;
>> >>      uint64_t backend_cap;
>> >>      /* @started: is the vhost device started? */
>> >> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> >> index a973811cbf..9939a0a632 100644
>> >> --- a/include/hw/virtio/virtio.h
>> >> +++ b/include/hw/virtio/virtio.h
>> >> @@ -93,6 +93,12 @@ enum virtio_device_endian {
>> >>      VIRTIO_DEVICE_ENDIAN_BIG,
>> >>  };
>> >>
>> >> +/**
>> >> + * struct VirtIODevice - common VirtIO structure
>> >> + * @name: name of the device
>> >> + * @status: VirtIO Device Status field
>> >> + *
>> >> + */
>> >>  struct VirtIODevice
>> >>  {
>> >>      DeviceState parent_obj;
>> >> @@ -100,9 +106,21 @@ struct VirtIODevice
>> >>      uint8_t status;
>> >>      uint8_t isr;
>> >>      uint16_t queue_sel;
>> >> -    uint64_t guest_features;
>> >> +    /**
>> >> +     * These fields represent a set of VirtIO features at various
>> >> +     * levels of the stack. @host_features indicates the complete
>> >> +     * feature set the VirtIO device can offer to the driver.
>> >> +     * @guest_features indicates which features the VirtIO driver can
>> >> +     * support.
>> >
>> > The device never knows the features that the driver can support, so
>> > this sentence is ambiguous/incorrect. The device only knows the
>> > features that the driver writes during negotiation, which the spec
>> > says is a subset of host_features.
>> >
>> > Maybe "indicates the features that driver wrote"?
>> >
>> > I noticed that this field is assigned even when the guest writes
>> > invalid feature bits.
>>=20
>> Should we fix that? The negotiation sequence should be guest read, mask
>> and write back so the value should be validated against host_features?
>>=20
>> >
>> >> Finally @backend_features represents everything
>> >> +     * supported by the backend. This set might be split between stu=
ff
>> >> +     * done by QEMU itself and stuff handled by an external backend
>> >> +     * (e.g. vhost). As a result some feature bits may be added or
>> >> +     * masked from the backend.
>> >
>> > I'm not 100% sure what this is referring to. Transport features that
>> > are handled by QEMU and not the backend?
>>=20
>> Well there is the rub. While looking at the reset stuff it was
>> postulated a device could support reset even if vhost part couldn't.
>
> reset here referring to per-ring reset?  It's possible with enough work
> - you would save ring state for each ring, reset all of vhost, then
> restore all but the one ring that needs to be reset.

Does anything work like this at the moment or is it a fair assumption
that the feature set of a vhost/vhost-user backend will be the maximum
set of features the guest can select from?

>
>> If
>> that is not true maybe we should drop this because host_features should
>> have everything we need?
>>=20
>> >
>> >> +     */
>> >>      uint64_t host_features;
>> >> +    uint64_t guest_features;
>> >>      uint64_t backend_features;
>> >> +
>> >>      size_t config_len;
>> >>      void *config;
>> >>      uint16_t config_vector;
>> >> --
>> >> 2.34.1
>> >>
>>=20
>>=20
>> --=20
>> Alex Benn=C3=A9e


--=20
Alex Benn=C3=A9e

