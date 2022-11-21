Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5865A632DAC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 21:10:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxD6Q-0001se-85; Mon, 21 Nov 2022 15:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxD6G-0001om-3X
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:09:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oxD6D-0001KA-Ro
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 15:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669061340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dX3Bg1INMpot1nyRHCLEyZr1ihRQtXmx7xBDgerOPx0=;
 b=GXCzI/vFBua46EpegQODg7saRUgvdF3KRQ+kY2g5FayTNsMtt961Re1ni42x0Nr4K2yFtj
 LLFfudXQXwRWd8rOGB2vbmddBT1b6c14u0ToGm0ChvyoM+nrC75v0mV2Go7T2nE5jvtkRA
 fHCEybYmuClSeXznC41gt8/B+tTRvcA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-206-bU6Ls8Q8MaavrAhDtavj2Q-1; Mon, 21 Nov 2022 15:08:58 -0500
X-MC-Unique: bU6Ls8Q8MaavrAhDtavj2Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso6994517wmb.4
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 12:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dX3Bg1INMpot1nyRHCLEyZr1ihRQtXmx7xBDgerOPx0=;
 b=H5BKV3brq4qvM7SZtkWv5PwCKGMNvWvYGMIaffqaMqGYAhiIWoLb0cgzvJwIBRx0cV
 ojb8CEPW5arxaSZ94Di1qrK47c/5wmDc9VQU9XyKIgfpsj4lkM3S03nRHyEGNlSuagsr
 SxTDh8WuXXTJS5mmxky3XJgiIv/nons0Ee14Cv+7KEQbvg4YD7NJkfOTW5UBHKZpGHhV
 5bPt46wv81kJq7C+gE2tl//ev26UQtFFVwWLPLDJJwUX8/0GCKwgqpWCU35THV0432Db
 x3Rk8b1TCX0Q4jhvPmTKLI3z/hSFWnK/GCvqQoiNmdPL4u6fTv9lk22snw9gFY/SWtLW
 q27Q==
X-Gm-Message-State: ANoB5pkwo62J2YOyjCffLhjEYwiT1+ikbWODaHDdH922nPNWH02oCNJl
 7YNS3s4Y5NhzA7iNAwFgeVZJJQfb5ZomjKltFKi/om5eb27pHjWLuieNfwyz2XQG39MQWH8u8mz
 2GO+gSayw19WeKqk=
X-Received: by 2002:adf:aa91:0:b0:241:b2b2:a71d with SMTP id
 h17-20020adfaa91000000b00241b2b2a71dmr2060027wrc.326.1669061337464; 
 Mon, 21 Nov 2022 12:08:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf481/oXtrNo8csmCq1NURYtfEsQbQTm9NvYozQzsVhmpJeGEcm5ACB5JC0Hjpe25ZOBTRpXaQ==
X-Received: by 2002:adf:aa91:0:b0:241:b2b2:a71d with SMTP id
 h17-20020adfaa91000000b00241b2b2a71dmr2060021wrc.326.1669061337199; 
 Mon, 21 Nov 2022 12:08:57 -0800 (PST)
Received: from redhat.com ([2.52.21.254]) by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b00236488f62d6sm12111983wru.79.2022.11.21.12.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 12:08:56 -0800 (PST)
Date: Mon, 21 Nov 2022 15:08:53 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [RFC PATCH] include/hw: attempt to document VirtIO feature
 variables (!DISCUSS!)
Message-ID: <20221121150635-mutt-send-email-mst@kernel.org>
References: <20221121144921.2830330-1-alex.bennee@linaro.org>
 <CAJSP0QU72EnMQRbHpZ812QpszkjEeStA1R2Jic1VvCKBFas8_g@mail.gmail.com>
 <87a64kcdpk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a64kcdpk.fsf@linaro.org>
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

On Mon, Nov 21, 2022 at 07:15:30PM +0000, Alex Bennée wrote:
> 
> Stefan Hajnoczi <stefanha@gmail.com> writes:
> 
> > On Mon, 21 Nov 2022 at 09:49, Alex Bennée <alex.bennee@linaro.org> wrote:
> >>
> >> We have a bunch of variables associated with the device and the vhost
> >> backend which are used inconsistently throughout the code base. Lets
> >> start trying to bring some order by agreeing what each variable is
> >> for. Some cases to address (vho/vio renames to avoid ambiguous results
> >> while grepping):
> >>
> >> virtio->guest_features is mostly the live status of the features field
> >> and read and written as such by the guest. It does get manipulated by
> >> the various load state via virtio_set_features_nocheck(vdev, val) for
> >> migration.
> >>
> >> virtio->host_features is the result of vcd->get_features() most of the
> >> time and for vhost-user devices eventually ends up down at the vhost
> >> get features message:
> >>
> >>   ./hw/virtio/virtio-bus.c:66:    vdev->host_features = vdc->get_features(vdev, vdev->host_features,
> >>
> >> However virtio-net does a lot of direct modification of it:
> >>
> >>   ./hw/net/virtio-net.c:3517:        n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
> >>   ./hw/net/virtio-net.c:3529:        n->host_features |= (1ULL << VIRTIO_NET_F_SPEED_DUPLEX);
> >>   ./hw/net/virtio-net.c:3539:        n->host_features |= (1ULL << VIRTIO_NET_F_SPEED_DUPLEX);
> >>   ./hw/net/virtio-net.c:3548:        n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
> >>   ./hw/virtio/virtio.c:3438:    bool bad = (val & ~(vdev->host_features)) != 0;
> >>
> >> And we have this case which propagates the global QMP values for the
> >> device to the host features. This causes the resent regression of
> >> vhost-user-sock due to 69e1c14aa2 (virtio: core: vq reset feature
> >> negotation support) because the reset feature was rejected by the
> >> vhost-user backend causing it to freeze:
> >>
> >>   ./hw/virtio/virtio.c:4667:    status->host_features = qmp_decode_features(vdev->device_id,
> >>
> >> virtio->backend_features is only used by virtio-net to stash the
> >> vhost_net_get_features features for checking later:
> >>
> >>     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
> >>     vdev->vio_backend_features = features;
> >>
> >> and:
> >>
> >>     if (n->mtu_bypass_backend &&
> >>             !virtio_has_feature(vdev->vio_backend_features, VIRTIO_NET_F_MTU)) {
> >>         features &= ~(1ULL << VIRTIO_NET_F_MTU);
> >>     }
> >>
> >> vhost_dev->acked_features seems to mostly reflect
> >> virtio->guest_features (but where in the negotiation cycle?). Except
> >> for vhost_net where is becomes vhost_dev->backend_features
> >>
> >>   ./backends/vhost-user.c:87:    b->dev.vho_acked_features = b->vdev->guest_features;
> >>   ./hw/block/vhost-user-blk.c:149:    s->dev.vho_acked_features = vdev->guest_features;
> >>   ./hw/net/vhost_net.c:132:    net->dev.vho_acked_features = net->dev.vho_backend_features;
> >>   ./hw/scsi/vhost-scsi-common.c:53:    vsc->dev.vho_acked_features = vdev->guest_features;
> >>   ./hw/virtio/vhost-user-fs.c:77:    fs->vhost_dev.vho_acked_features = vdev->guest_features;
> >>   ./hw/virtio/vhost-user-i2c.c:46:    i2c->vhost_dev.vho_acked_features = vdev->guest_features;
> >>   ./hw/virtio/vhost-user-rng.c:44:    rng->vhost_dev.vho_acked_features = vdev->guest_features;
> >>   ./hw/virtio/vhost-vsock-common.c:71:    vvc->vhost_dev.vho_acked_features = vdev->guest_features;
> >>   ./hw/virtio/vhost.c:1631:            hdev->vho_acked_features |= bit_mask;
> >>
> >> vhost_dev->backend_features has become overloaded with two use cases:
> >>
> >>   ./hw/block/vhost-user-blk.c:336:    s->dev.vho_backend_features = 0;
> >>   ./hw/net/vhost_net.c:180:        net->dev.vho_backend_features = qemu_has_vnet_hdr(options->net_backend)
> >>   ./hw/net/vhost_net.c:185:        net->dev.vho_backend_features = 0;
> >>   ./hw/scsi/vhost-scsi.c:220:    vsc->dev.vho_backend_features = 0;
> >>   ./hw/scsi/vhost-user-scsi.c:121:    vsc->dev.vho_backend_features = 0;
> >>   ./hw/virtio/vhost-user.c:2083:        dev->vho_backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
> >> One use for saving the availability of a vhost-net feature and another
> >> for ensuring we add the protocol feature negotiation bit when querying
> >> a vhost backend. Maybe the places where this is queried should really
> >> be bools that can be queried in the appropriate places?
> >>
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Cc: Stefano Garzarella <sgarzare@redhat.com>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Cc: Stefan Hajnoczi <stefanha@gmail.com>
> >> ---
> >>  include/hw/virtio/vhost.h  | 18 +++++++++++++++---
> >>  include/hw/virtio/virtio.h | 20 +++++++++++++++++++-
> >>  2 files changed, 34 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> >> index 353252ac3e..502aa5677a 100644
> >> --- a/include/hw/virtio/vhost.h
> >> +++ b/include/hw/virtio/vhost.h
> >> @@ -88,13 +88,25 @@ struct vhost_dev {
> >>      int vq_index_end;
> >>      /* if non-zero, minimum required value for max_queues */
> >>      int num_queues;
> >> +    /**
> >> +     * vhost feature handling requires matching the feature set
> >> +     * offered by a backend which may be a subset of the total
> >> +     * features eventually offered to the guest.
> >> +     *
> >> +     * @features: available features provided by the backend
> >> +     * @acked_features: final set of negotiated features with the
> >> +     * front-end driver
> >> +     * @backend_features: additional feature bits applied during negotiation
> >
> > What does this mean?
> 
> Well practically it is currently either applying
> VHOST_USER_F_PROTOCOL_FEATURES to the vhost_user_set_features() or
> storing VHOST_NET_F_VIRTIO_NET_HDR which I think eventually gets applied
> to:
> 
>   net->dev.acked_features = net->dev.backend_features;
> 
> I suspect both could be dropped and handled as flags and applied at the
> destination.
> 
> >
> >> +     *
> >> +     * Finally the @protocol_features is the final protocal feature
> >
> > s/protocal/protocol/
> >
> > All the other fields are VIRTIO feature bits and this field holds the
> > VHOST_USER_SET_FEATURES feature bits?
> 
> No these are the protocol features so a totally separate set of feature
> bits for the vhost user protocol. I don't think these apply to kernel
> vhost stuff?
> 
> >
> >> +     * set negotiated between QEMU and the backend (after
> >> +     * VHOST_USER_F_PROTOCOL_FEATURES is negotiated)
> >> +     */
> >>      uint64_t features;
> >> -    /** @acked_features: final set of negotiated features */
> >>      uint64_t acked_features;
> >> -    /** @backend_features: backend specific feature bits */
> >>      uint64_t backend_features;
> >> -    /** @protocol_features: final negotiated protocol features */
> >>      uint64_t protocol_features;
> >> +
> >>      uint64_t max_queues;
> >>      uint64_t backend_cap;
> >>      /* @started: is the vhost device started? */
> >> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> >> index a973811cbf..9939a0a632 100644
> >> --- a/include/hw/virtio/virtio.h
> >> +++ b/include/hw/virtio/virtio.h
> >> @@ -93,6 +93,12 @@ enum virtio_device_endian {
> >>      VIRTIO_DEVICE_ENDIAN_BIG,
> >>  };
> >>
> >> +/**
> >> + * struct VirtIODevice - common VirtIO structure
> >> + * @name: name of the device
> >> + * @status: VirtIO Device Status field
> >> + *
> >> + */
> >>  struct VirtIODevice
> >>  {
> >>      DeviceState parent_obj;
> >> @@ -100,9 +106,21 @@ struct VirtIODevice
> >>      uint8_t status;
> >>      uint8_t isr;
> >>      uint16_t queue_sel;
> >> -    uint64_t guest_features;
> >> +    /**
> >> +     * These fields represent a set of VirtIO features at various
> >> +     * levels of the stack. @host_features indicates the complete
> >> +     * feature set the VirtIO device can offer to the driver.
> >> +     * @guest_features indicates which features the VirtIO driver can
> >> +     * support.
> >
> > The device never knows the features that the driver can support, so
> > this sentence is ambiguous/incorrect. The device only knows the
> > features that the driver writes during negotiation, which the spec
> > says is a subset of host_features.
> >
> > Maybe "indicates the features that driver wrote"?
> >
> > I noticed that this field is assigned even when the guest writes
> > invalid feature bits.
> 
> Should we fix that? The negotiation sequence should be guest read, mask
> and write back so the value should be validated against host_features?
> 
> >
> >> Finally @backend_features represents everything
> >> +     * supported by the backend. This set might be split between stuff
> >> +     * done by QEMU itself and stuff handled by an external backend
> >> +     * (e.g. vhost). As a result some feature bits may be added or
> >> +     * masked from the backend.
> >
> > I'm not 100% sure what this is referring to. Transport features that
> > are handled by QEMU and not the backend?
> 
> Well there is the rub. While looking at the reset stuff it was
> postulated a device could support reset even if vhost part couldn't.

reset here referring to per-ring reset?  It's possible with enough work
- you would save ring state for each ring, reset all of vhost, then
restore all but the one ring that needs to be reset.

> If
> that is not true maybe we should drop this because host_features should
> have everything we need?
> 
> >
> >> +     */
> >>      uint64_t host_features;
> >> +    uint64_t guest_features;
> >>      uint64_t backend_features;
> >> +
> >>      size_t config_len;
> >>      void *config;
> >>      uint16_t config_vector;
> >> --
> >> 2.34.1
> >>
> 
> 
> -- 
> Alex Bennée


