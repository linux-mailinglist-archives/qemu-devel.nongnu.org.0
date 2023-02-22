Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251C69F696
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:26:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUq4V-00012c-JY; Wed, 22 Feb 2023 09:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUq4Q-00012S-Ip
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:26:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pUq4N-0003lY-LY
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677075966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3Dw4kq26MrKjHJKtcbOfYRZmIXoy59kp59lw32mD7hs=;
 b=Y0zHfdG1J23Bhf61jmirX7F5eSTef0reiTtq6mgcVAtJn14wYxHqpKj4KwmTECBjUeiUWG
 JX1gNgPDdw2CQ1LuoZFVEvyxRKzqK46sNRmFl5ChnrCTcUzV9MiwlJGbwxp88136RbRk8Z
 e+GqYNZMNgczfLr0MxRA8p4hPYIU6lg=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-LAYnUEoKPtOvd51ddyoQKw-1; Wed, 22 Feb 2023 09:25:58 -0500
X-MC-Unique: LAYnUEoKPtOvd51ddyoQKw-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-536c02ed619so67079997b3.8
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Dw4kq26MrKjHJKtcbOfYRZmIXoy59kp59lw32mD7hs=;
 b=TdNnnv6e9/S06cCT0+N8uYHcBT3j+3OwZR0mhxDDcavp37IrugE3dVgqq3t7a3HwAP
 eW0dFcLgQcxi30HwdlnYzBYsJf1T5aI93PygANZE6C2JLRjuecd9iBBF/vMe4xwpyLF/
 LBIBE9Dh6x6KcQIA1mbvB1tlSGWO7eHhhxXbf948cDhUC2JHx+mOGyup4Sf8Eg1RBVaR
 G2hlqikIeGbLJS53ZMjQWK3yhnwQP2KRm/THPHnjabyjgy3L/4BOC70tzeCC1ra5Egfm
 hyw/iIj5ZjGHwNhQ14mq5Fjl8cmH541EgJRPThfg0pH9nIvjn2fGyKuzunfVWITI1UOX
 M36g==
X-Gm-Message-State: AO0yUKVY4frLML0RB9+JkGNFhrErDANzdECqqFNEz3KDGMoAUs0W+DfG
 Wquu+/tW0NRUQt9Zbq9STFKkz7/OdUoubgS0A7P2x+vD9/RrsY2CO18aGsSu2pQxaJ9tMsQDlpG
 VXcbs+Jtt/fSdeSds1q6BOmnPxSv9NPg=
X-Received: by 2002:a81:6709:0:b0:536:e148:d9e8 with SMTP id
 b9-20020a816709000000b00536e148d9e8mr576351ywc.193.1677075958333; 
 Wed, 22 Feb 2023 06:25:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+gR7rd4ZTwd9jAZUUu2kFpnOScq3LIoFP59vVWPIb+jxW6vhvbwVlvxcPUjwqFdJgSFhf/1t565oldGVt7SS0=
X-Received: by 2002:a81:6709:0:b0:536:e148:d9e8 with SMTP id
 b9-20020a816709000000b00536e148d9e8mr576332ywc.193.1677075958055; Wed, 22 Feb
 2023 06:25:58 -0800 (PST)
MIME-Version: 1.0
References: <20230208094253.702672-1-eperezma@redhat.com>
 <20230208094253.702672-12-eperezma@redhat.com>
 <c8d6ecc3-87f6-986e-e78d-003000e8a51e@redhat.com>
In-Reply-To: <c8d6ecc3-87f6-986e-e78d-003000e8a51e@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Wed, 22 Feb 2023 15:25:21 +0100
Message-ID: <CAJaqyWdhK7QEHECP7qJP9tPA69e8uTuJtqLPNq_mUUhRDG_2Aw@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] vdpa: block migration if dev does not have
 _F_SUSPEND
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>, 
 alvaro.karsz@solid-run.com, Zhu Lingshan <lingshan.zhu@intel.com>, 
 Lei Yang <leiyang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
 Shannon Nelson <snelson@pensando.io>, Parav Pandit <parav@mellanox.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org, 
 Stefano Garzarella <sgarzare@redhat.com>, si-wei.liu@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Wed, Feb 22, 2023 at 5:05 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2023/2/8 17:42, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > Next patches enable devices to be migrated even if vdpa netdev has not
> > been started with x-svq. However, not all devices are migratable, so we
> > need to block migration if we detect that.
> >
> > Block vhost-vdpa device migration if it does not offer _F_SUSPEND and i=
t
> > has not been started with x-svq.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 84a6b9690b..9d30cf9b3c 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -442,6 +442,27 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >           return 0;
> >       }
> >
> > +    /*
> > +     * If dev->shadow_vqs_enabled at initialization that means the dev=
ice has
> > +     * been started with x-svq=3Don, so don't block migration
> > +     */
> > +    if (dev->migration_blocker =3D=3D NULL && !v->shadow_vqs_enabled) =
{
> > +        uint64_t backend_features;
> > +
> > +        /* We don't have dev->backend_features yet */
> > +        ret =3D vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES,
> > +                              &backend_features);
> > +        if (unlikely(ret)) {
> > +            error_setg_errno(errp, -ret, "Could not get backend featur=
es");
> > +            return ret;
> > +        }
> > +
> > +        if (!(backend_features & BIT_ULL(VHOST_BACKEND_F_SUSPEND))) {
> > +            error_setg(&dev->migration_blocker,
> > +                "vhost-vdpa backend lacks VHOST_BACKEND_F_SUSPEND feat=
ure.");
> > +        }
>
>
> I wonder why not let the device to decide? For networking device, we can
> live without suspend probably.
>

Right, but how can we know if this is a net device in init? I don't
think a switch (vhost_vdpa_get_device_id(dev)) is elegant.

If the parent device does not need to be suspended i'd go with
exposing a suspend ioctl but do nothing in the parent device. After
that, it could even choose to return an error for GET_VRING_BASE.

If we want to implement it as a fallback in qemu, I'd go for
implementing it on top of this series. There are a few operations we
could move to a device-kind specific ops.

Would it make sense to you?

Thanks!


> Thanks
>
>
> > +    }
> > +
> >       /*
> >        * Similar to VFIO, we end up pinning all guest memory and have t=
o
> >        * disable discarding of RAM.
>


