Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24339D504
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 08:35:54 +0200 (CEST)
Received: from localhost ([::1]:47746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lq8rZ-0002sP-IE
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 02:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8qa-0001v4-Ny
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:34:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lq8qY-0002wE-Mm
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 02:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623047690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMOPno3042Z6q4EAEGHoAbh9QndGm5TQxzPwDwpz2bU=;
 b=JR0SeKFVQ6r8VNzTQj5zWD5nMwJnI/NIOE2PNcCchG6u0cSFPWr93nj2v3lxhDdcr7mqdP
 m4AN+8kYZ8z0I+mb6yH1YqegVED4nEhmMszIcfvyHx2Gquy3+pWE9JuhGzise4vTvCWkHC
 4Tvfwahf+RpoBTg0v/s0ZxS8i7BuqG4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-1yZJL_H-Pla6wofGhWXQEA-1; Mon, 07 Jun 2021 02:34:48 -0400
X-MC-Unique: 1yZJL_H-Pla6wofGhWXQEA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso8841986edd.12
 for <qemu-devel@nongnu.org>; Sun, 06 Jun 2021 23:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DMOPno3042Z6q4EAEGHoAbh9QndGm5TQxzPwDwpz2bU=;
 b=hZx3a3M2/coNaWmr3L28g0S7iX35XcQMsypjaG+cci8UPK2GhOgoF75ouTR5gp1JgR
 vtGre8M2cvarQ9jFF9GpX4ywuHh8Jes3SXwd5s3dLwTMxyBmeDoU+/GQl35hdOAqBqee
 Xrukekr99KhR8Iu6kph8FsFtne9G9nCRY2yfpyvhDNCNvN1447FHq3J+3Kns7K16KQcs
 Be4XP7/QSphh6ruQUUbXlvSgsebt1llRBhmMovtcr/FbyLAru6Bysjh4J1tPvD4O57nd
 k8qyQ3hwOvkcGZzh0I9T7khkBAGjcA7HoDUukLdYbw5hhLACK0Cp0WcX+BcZqYpXzQRB
 XMGw==
X-Gm-Message-State: AOAM532XDUDoqxYkhlPnC/vYXvDB3Kw1aeuFmAP0czTg/SGSS7bL3TiH
 2N4YB+AQ+VT7ymLp8oyHUnvlyjldPBZju3/HczukoeF9hKjQtjvoZVcTwxj/OtY0u7aoGtMgN6a
 yHuE61rEPowAEavrZnS/cwOGlOEoHYJg=
X-Received: by 2002:a50:ee02:: with SMTP id g2mr18474352eds.333.1623047687346; 
 Sun, 06 Jun 2021 23:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoeRpTfjn0BWRpDMJ7MHmT5itVy0yMEkYtKP/nrPMNb34+7IXfR+4CNz0Zxj7r9kd6NkotjweIiILYtQBBJVo=
X-Received: by 2002:a50:ee02:: with SMTP id g2mr18474345eds.333.1623047687191; 
 Sun, 06 Jun 2021 23:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210602034750.23377-1-lulu@redhat.com>
 <20210602034750.23377-6-lulu@redhat.com>
 <655e3a49-229d-d858-3273-90e109dd7779@redhat.com>
In-Reply-To: <655e3a49-229d-d858-3273-90e109dd7779@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 7 Jun 2021 14:34:11 +0800
Message-ID: <CACLfguUNtFLT2wD_QGjfmWKhhmspNxn6JOZXkW1zsKACW_7n5Q@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] vhost-vdpa: add support for config interrupt
 call back
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 3, 2021 at 2:06 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/2 =E4=B8=8A=E5=8D=8811:47, Cindy Lu =E5=86=99=E9=81=93:
> > Add new call back function in vhost-vdpa, this call back function only
> > supported in vhost-vdpa backend
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/trace-events | 2 ++
> >   hw/virtio/vhost-vdpa.c | 7 +++++++
> >   2 files changed, 9 insertions(+)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index c62727f879..60a15f0186 100644
> > --- a/hw/virtio/trace-events
> > +++ b/hw/virtio/trace-events
> > @@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int ind=
ex, int fd) "dev: %p index:
> >   vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p featur=
es: 0x%"PRIx64
> >   vhost_vdpa_set_owner(void *dev) "dev: %p"
> >   vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, =
uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_use=
r_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
> > +vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
>
>
> This tracing information is sub-optimal, I think we should show the fd
> instead of its address here.
>
> Other looks good.
>
> Thanks
>
>
sure, I will fix this
> > +
> >
> >   # virtio.c
> >   virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsig=
ned out_num) "elem %p size %zd in_num %u out_num %u"
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 01d2101d09..9ba2a2bed4 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -545,6 +545,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_=
dev *dev,
> >       trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> > +static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
> > +                                       int *fd)
> > +{
> > +    trace_vhost_vdpa_set_config_call(dev, fd);
> > +    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
> > +}
> >
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> >                                        uint64_t *features)
> > @@ -611,4 +617,5 @@ const VhostOps vdpa_ops =3D {
> >           .vhost_get_device_id =3D vhost_vdpa_get_device_id,
> >           .vhost_vq_get_addr =3D vhost_vdpa_vq_get_addr,
> >           .vhost_force_iommu =3D vhost_vdpa_force_iommu,
> > +        .vhost_set_config_call =3D vhost_vdpa_set_config_call,
> >   };
>


