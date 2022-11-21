Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A7632CFB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 20:26:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxCQ7-0001Xo-Um; Mon, 21 Nov 2022 14:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxCPt-0001XR-PI
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 14:25:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxCPr-0001ZD-Ig
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 14:25:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s5so4136264wru.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 11:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CyHGjFoSfzH2X7SDCa8qLi1KDODdopabrQmAlX6oOf4=;
 b=Nf+YBP2touVVC2+t7j6/RvuK5paIVfs2P8C0ZxN8aZMgmBmnbvwvGETZTWBWLHymIx
 HtX5FNH4GXoQzmvLoVVXi/P7dYehoDq7DQ9lPEc3V25EkpaIqyn/OHcV22SolwHHNJg9
 mvgXQsbn9UwUW5nPHl1qPD9Fndul/IlJPcC7bVl1SYLULZ6gSRoH021k1ZBzHj0W9FmE
 m3ZXJyD1NW6P9kjE7mgqftv3EUaq7RKC/hittSsFX2dUY2NhesiaeVvXktXBB5WOqeMG
 Tufrjl32BUm3K3B+tmilX6ATAguTiDXV0cJfGvAL5rl/oAmKdPNJeiUnRnaYLmRoIaux
 scxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CyHGjFoSfzH2X7SDCa8qLi1KDODdopabrQmAlX6oOf4=;
 b=znXYTxQix/QTRREV67hG+4bPM2PmoxK3YjhiR0vxqpWI9pHBEmdyqEZSTByL+5VFRE
 F7HargID8ryxT0WmGZfgx+/2qq7ztdb99X46lsOcdYOCX+ymkik3cOfZy8NhzOeZuvaw
 vGxVsgnKGiZ4fEnuusn6bZTq3zIPrRY2qY3UxJ/M2I+huJ+A48ToVCvOBKNUrBqsCtbx
 /z4vtK+aSUI2qMw1lMsBOKpZhyO9V2Pmr6s++FvJvUJIx+b+5gXNApHGLWv7O+/r+0KS
 3iXTwk6yINn+cK4a0sYOEAOJg0bt58QCCntehB9ydno7IhVOsjsL7yMLd4qNL+0CANJh
 ojRg==
X-Gm-Message-State: ANoB5pn2RTyuhN4NsXz3zfZ3Dqg9rOvDF5JVAnGbWh0kOjzjhbG0jNOU
 gi5vI94GTO7oGEwvVFxvEC9aug==
X-Google-Smtp-Source: AA0mqf7DN9TbZ4fEI5CdR4r9rXjM6P+eJZWnHnzG+oonRp71A33bZWihUaKf+75M4e9HL3RND3P7cg==
X-Received: by 2002:a5d:5f0a:0:b0:241:dcf9:107e with SMTP id
 cl10-20020a5d5f0a000000b00241dcf9107emr2191817wrb.363.1669058713238; 
 Mon, 21 Nov 2022 11:25:13 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 fc10-20020a05600c524a00b003cf9bf5208esm21260230wmb.19.2022.11.21.11.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 11:25:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 06C4F1FFB7;
 Mon, 21 Nov 2022 19:25:12 +0000 (GMT)
References: <20221121144921.2830330-1-alex.bennee@linaro.org>
 <CAJSP0QU72EnMQRbHpZ812QpszkjEeStA1R2Jic1VvCKBFas8_g@mail.gmail.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [RFC PATCH] include/hw: attempt to document VirtIO feature
 variables (!DISCUSS!)
Date: Mon, 21 Nov 2022 19:15:30 +0000
In-reply-to: <CAJSP0QU72EnMQRbHpZ812QpszkjEeStA1R2Jic1VvCKBFas8_g@mail.gmail.com>
Message-ID: <87a64kcdpk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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


Stefan Hajnoczi <stefanha@gmail.com> writes:

> On Mon, 21 Nov 2022 at 09:49, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> We have a bunch of variables associated with the device and the vhost
>> backend which are used inconsistently throughout the code base. Lets
>> start trying to bring some order by agreeing what each variable is
>> for. Some cases to address (vho/vio renames to avoid ambiguous results
>> while grepping):
>>
>> virtio->guest_features is mostly the live status of the features field
>> and read and written as such by the guest. It does get manipulated by
>> the various load state via virtio_set_features_nocheck(vdev, val) for
>> migration.
>>
>> virtio->host_features is the result of vcd->get_features() most of the
>> time and for vhost-user devices eventually ends up down at the vhost
>> get features message:
>>
>>   ./hw/virtio/virtio-bus.c:66:    vdev->host_features =3D vdc->get_featu=
res(vdev, vdev->host_features,
>>
>> However virtio-net does a lot of direct modification of it:
>>
>>   ./hw/net/virtio-net.c:3517:        n->host_features |=3D (1ULL << VIRT=
IO_NET_F_MTU);
>>   ./hw/net/virtio-net.c:3529:        n->host_features |=3D (1ULL << VIRT=
IO_NET_F_SPEED_DUPLEX);
>>   ./hw/net/virtio-net.c:3539:        n->host_features |=3D (1ULL << VIRT=
IO_NET_F_SPEED_DUPLEX);
>>   ./hw/net/virtio-net.c:3548:        n->host_features |=3D (1ULL << VIRT=
IO_NET_F_STANDBY);
>>   ./hw/virtio/virtio.c:3438:    bool bad =3D (val & ~(vdev->host_feature=
s)) !=3D 0;
>>
>> And we have this case which propagates the global QMP values for the
>> device to the host features. This causes the resent regression of
>> vhost-user-sock due to 69e1c14aa2 (virtio: core: vq reset feature
>> negotation support) because the reset feature was rejected by the
>> vhost-user backend causing it to freeze:
>>
>>   ./hw/virtio/virtio.c:4667:    status->host_features =3D qmp_decode_fea=
tures(vdev->device_id,
>>
>> virtio->backend_features is only used by virtio-net to stash the
>> vhost_net_get_features features for checking later:
>>
>>     features =3D vhost_net_get_features(get_vhost_net(nc->peer), feature=
s);
>>     vdev->vio_backend_features =3D features;
>>
>> and:
>>
>>     if (n->mtu_bypass_backend &&
>>             !virtio_has_feature(vdev->vio_backend_features, VIRTIO_NET_F=
_MTU)) {
>>         features &=3D ~(1ULL << VIRTIO_NET_F_MTU);
>>     }
>>
>> vhost_dev->acked_features seems to mostly reflect
>> virtio->guest_features (but where in the negotiation cycle?). Except
>> for vhost_net where is becomes vhost_dev->backend_features
>>
>>   ./backends/vhost-user.c:87:    b->dev.vho_acked_features =3D b->vdev->=
guest_features;
>>   ./hw/block/vhost-user-blk.c:149:    s->dev.vho_acked_features =3D vdev=
->guest_features;
>>   ./hw/net/vhost_net.c:132:    net->dev.vho_acked_features =3D net->dev.=
vho_backend_features;
>>   ./hw/scsi/vhost-scsi-common.c:53:    vsc->dev.vho_acked_features =3D v=
dev->guest_features;
>>   ./hw/virtio/vhost-user-fs.c:77:    fs->vhost_dev.vho_acked_features =
=3D vdev->guest_features;
>>   ./hw/virtio/vhost-user-i2c.c:46:    i2c->vhost_dev.vho_acked_features =
=3D vdev->guest_features;
>>   ./hw/virtio/vhost-user-rng.c:44:    rng->vhost_dev.vho_acked_features =
=3D vdev->guest_features;
>>   ./hw/virtio/vhost-vsock-common.c:71:    vvc->vhost_dev.vho_acked_featu=
res =3D vdev->guest_features;
>>   ./hw/virtio/vhost.c:1631:            hdev->vho_acked_features |=3D bit=
_mask;
>>
>> vhost_dev->backend_features has become overloaded with two use cases:
>>
>>   ./hw/block/vhost-user-blk.c:336:    s->dev.vho_backend_features =3D 0;
>>   ./hw/net/vhost_net.c:180:        net->dev.vho_backend_features =3D qem=
u_has_vnet_hdr(options->net_backend)
>>   ./hw/net/vhost_net.c:185:        net->dev.vho_backend_features =3D 0;
>>   ./hw/scsi/vhost-scsi.c:220:    vsc->dev.vho_backend_features =3D 0;
>>   ./hw/scsi/vhost-user-scsi.c:121:    vsc->dev.vho_backend_features =3D =
0;
>>   ./hw/virtio/vhost-user.c:2083:        dev->vho_backend_features |=3D 1=
ULL << VHOST_USER_F_PROTOCOL_FEATURES;
>> One use for saving the availability of a vhost-net feature and another
>> for ensuring we add the protocol feature negotiation bit when querying
>> a vhost backend. Maybe the places where this is queried should really
>> be bools that can be queried in the appropriate places?
>>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Cc: Stefano Garzarella <sgarzare@redhat.com>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Stefan Hajnoczi <stefanha@gmail.com>
>> ---
>>  include/hw/virtio/vhost.h  | 18 +++++++++++++++---
>>  include/hw/virtio/virtio.h | 20 +++++++++++++++++++-
>>  2 files changed, 34 insertions(+), 4 deletions(-)
>>
>> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
>> index 353252ac3e..502aa5677a 100644
>> --- a/include/hw/virtio/vhost.h
>> +++ b/include/hw/virtio/vhost.h
>> @@ -88,13 +88,25 @@ struct vhost_dev {
>>      int vq_index_end;
>>      /* if non-zero, minimum required value for max_queues */
>>      int num_queues;
>> +    /**
>> +     * vhost feature handling requires matching the feature set
>> +     * offered by a backend which may be a subset of the total
>> +     * features eventually offered to the guest.
>> +     *
>> +     * @features: available features provided by the backend
>> +     * @acked_features: final set of negotiated features with the
>> +     * front-end driver
>> +     * @backend_features: additional feature bits applied during negoti=
ation
>
> What does this mean?

Well practically it is currently either applying
VHOST_USER_F_PROTOCOL_FEATURES to the vhost_user_set_features() or
storing VHOST_NET_F_VIRTIO_NET_HDR which I think eventually gets applied
to:

  net->dev.acked_features =3D net->dev.backend_features;

I suspect both could be dropped and handled as flags and applied at the
destination.

>
>> +     *
>> +     * Finally the @protocol_features is the final protocal feature
>
> s/protocal/protocol/
>
> All the other fields are VIRTIO feature bits and this field holds the
> VHOST_USER_SET_FEATURES feature bits?

No these are the protocol features so a totally separate set of feature
bits for the vhost user protocol. I don't think these apply to kernel
vhost stuff?

>
>> +     * set negotiated between QEMU and the backend (after
>> +     * VHOST_USER_F_PROTOCOL_FEATURES is negotiated)
>> +     */
>>      uint64_t features;
>> -    /** @acked_features: final set of negotiated features */
>>      uint64_t acked_features;
>> -    /** @backend_features: backend specific feature bits */
>>      uint64_t backend_features;
>> -    /** @protocol_features: final negotiated protocol features */
>>      uint64_t protocol_features;
>> +
>>      uint64_t max_queues;
>>      uint64_t backend_cap;
>>      /* @started: is the vhost device started? */
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index a973811cbf..9939a0a632 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -93,6 +93,12 @@ enum virtio_device_endian {
>>      VIRTIO_DEVICE_ENDIAN_BIG,
>>  };
>>
>> +/**
>> + * struct VirtIODevice - common VirtIO structure
>> + * @name: name of the device
>> + * @status: VirtIO Device Status field
>> + *
>> + */
>>  struct VirtIODevice
>>  {
>>      DeviceState parent_obj;
>> @@ -100,9 +106,21 @@ struct VirtIODevice
>>      uint8_t status;
>>      uint8_t isr;
>>      uint16_t queue_sel;
>> -    uint64_t guest_features;
>> +    /**
>> +     * These fields represent a set of VirtIO features at various
>> +     * levels of the stack. @host_features indicates the complete
>> +     * feature set the VirtIO device can offer to the driver.
>> +     * @guest_features indicates which features the VirtIO driver can
>> +     * support.
>
> The device never knows the features that the driver can support, so
> this sentence is ambiguous/incorrect. The device only knows the
> features that the driver writes during negotiation, which the spec
> says is a subset of host_features.
>
> Maybe "indicates the features that driver wrote"?
>
> I noticed that this field is assigned even when the guest writes
> invalid feature bits.

Should we fix that? The negotiation sequence should be guest read, mask
and write back so the value should be validated against host_features?

>
>> Finally @backend_features represents everything
>> +     * supported by the backend. This set might be split between stuff
>> +     * done by QEMU itself and stuff handled by an external backend
>> +     * (e.g. vhost). As a result some feature bits may be added or
>> +     * masked from the backend.
>
> I'm not 100% sure what this is referring to. Transport features that
> are handled by QEMU and not the backend?

Well there is the rub. While looking at the reset stuff it was
postulated a device could support reset even if vhost part couldn't. If
that is not true maybe we should drop this because host_features should
have everything we need?

>
>> +     */
>>      uint64_t host_features;
>> +    uint64_t guest_features;
>>      uint64_t backend_features;
>> +
>>      size_t config_len;
>>      void *config;
>>      uint16_t config_vector;
>> --
>> 2.34.1
>>


--=20
Alex Benn=C3=A9e

