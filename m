Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC335BBAF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:08:42 +0200 (CEST)
Received: from localhost ([::1]:36778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVrcf-00004y-4O
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVrbL-0007hR-QW
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:07:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVrbF-00071L-Rt
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618214831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gyWEVUJD7VBgdwkAfMSCoCQm+FOam4z2DvHagQ0tPeI=;
 b=FDjVnCD4owVrrS74572yGS3yiu2VEsfyqpgmKzQKc2qVImkgm/KNKrs1sYPSwm17G60YLp
 Zhz0hetG6c9SefbBHeOtCXIrphYLmCzSqfCS29ZkHDZZAeDg7FkLRZYJ7VE3lBDGWbvrY+
 R9BY5mVrpd7A2LIQmJlItmBTLaGSNLE=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-fS2vV0znNJGTSfd415vSyA-1; Mon, 12 Apr 2021 04:07:08 -0400
X-MC-Unique: fS2vV0znNJGTSfd415vSyA-1
Received: by mail-pf1-f198.google.com with SMTP id m15so1369528pfh.4
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gyWEVUJD7VBgdwkAfMSCoCQm+FOam4z2DvHagQ0tPeI=;
 b=Fcsi+dqySHXJbqcUPjehj9yPaySRjs3JKLL/ACBL6cwFccj3AuJvKfslddpiOXiPap
 xmpVsPitbMlj0COJofSPfpvHjsVjLSpvcgIxtqIbQLCkl6F3ljjaVQ71ORKSVX4KcJ0a
 8xZNP0hJAf10Kb6IoqC7Fkwg+MpGcGvMKoj/1pZXc+qK+Rf3fumRMjC+oWAOM5xFXmv2
 AzVaXUUZ00qSun1XkkGNcSnzpciSqop0W/8+coh4gik8d9bZ1skcuYdOFzGgsvG/5N8r
 enSEpmgjBcEKUCXwRHHYqft7fUq5GvWMEG+4FflREZoAiNXE6kgifGQRUI1/0Mf07PUn
 hzzg==
X-Gm-Message-State: AOAM533nsrk3JyvXD2H7rZieIRPpvtz7Rs91UMH0/u+iS2rMfkLU6do8
 sx5T6Zf8g+HkRMaAoyX4heMAsF9V3t+/Of8HqXXhv0KDpq2Eu9RU+JfglpI14WmmZoLqJa1T5P4
 jV7NNtrqWdm/+Jsy6R+IfSMIckcNTr+c=
X-Received: by 2002:a63:d153:: with SMTP id c19mr25406876pgj.311.1618214827687; 
 Mon, 12 Apr 2021 01:07:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSdVvfl+9tniPDU5Jxn/ae3Ynv0LxRygJYuFR8kGfsZX6UwewRf2Erd5sX+Ux3Q5ZGFtKVsTlfHgrxeyqDv/k=
X-Received: by 2002:a63:d153:: with SMTP id c19mr25406861pgj.311.1618214827407; 
 Mon, 12 Apr 2021 01:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-3-lulu@redhat.com>
 <ce3cb890-f91f-c458-4db1-b8bd19bfed02@redhat.com>
In-Reply-To: <ce3cb890-f91f-c458-4db1-b8bd19bfed02@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 12 Apr 2021 16:06:29 +0800
Message-ID: <CACLfguXRBXoewYDbd1bOubg-5K3EWtwV6Ea1fF2qR_bUDxsmDw@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] vhost: add new call back function for config
 interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

On Fri, Apr 9, 2021 at 3:12 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/8 =E4=B8=8B=E5=8D=885:38, Cindy Lu =E5=86=99=E9=81=93:
> > to support configure interrupt, we need to
> > Add new call back function for config interrupt.
>
>
> There're brunch of capital issues.
>
>
> > now=E8=81=BDthis call back function only used in vhost-vdpa driver
>
>
> And looks like anthoer traditional chinese character.
>
>
will fix this
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/trace-events            | 2 ++
> >   hw/virtio/vhost-vdpa.c            | 7 +++++++
> >   include/hw/virtio/vhost-backend.h | 3 +++
> >   3 files changed, 12 insertions(+)
> >
> > diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> > index 2060a144a2..6710835b46 100644
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
> > diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhos=
t-backend.h
> > index 8a6f8e2a7a..adaf6982d2 100644
> > --- a/include/hw/virtio/vhost-backend.h
> > +++ b/include/hw/virtio/vhost-backend.h
> > @@ -125,6 +125,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_=
dev *dev, uint32_t *dev_id);
> >
> >   typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
> >
> > +typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
> > +                                       int *fd);
> >   typedef struct VhostOps {
> >       VhostBackendType backend_type;
> >       vhost_backend_init vhost_backend_init;
> > @@ -170,6 +172,7 @@ typedef struct VhostOps {
> >       vhost_vq_get_addr_op  vhost_vq_get_addr;
> >       vhost_get_device_id_op vhost_get_device_id;
> >       vhost_force_iommu_op vhost_force_iommu;
> > +    vhost_set_config_call_op vhost_set_config_call;
> >   } VhostOps;
>
>
> Let's split the vhost-vdpa implementation into another patch.
>
> Thanks
>
>
sure will fix this
> >
> >   extern const VhostOps user_ops;
>


