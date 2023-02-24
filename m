Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB916A1543
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 04:20:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVOce-00021F-Cc; Thu, 23 Feb 2023 22:19:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pVOcc-00020l-EW
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 22:19:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pVOca-0004z1-AR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 22:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677208783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmpwBpkcZu2N0HGI0fcmtwxgu0ad0AlbN3BYuN4clcw=;
 b=DFGonAmiE1gW3g+OjnhUdm3ZvaRYAiPE5/gWMOrtjh4irMr8by/Nud9M3geVtvkr/zhWmX
 grGHujz3gltwQq5y+XZyaMtRgmuGMu29fDkT2EYTPgfzrWDn433+HWGCTlPfeRJBmJ9/0F
 9E33+IYgu5PAc6P3aixcv2ZTU2ys+HQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-bdRZitJaNXyQbiGIPOJRzg-1; Thu, 23 Feb 2023 22:19:41 -0500
X-MC-Unique: bdRZitJaNXyQbiGIPOJRzg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-17215789117so5669671fac.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 19:19:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QmpwBpkcZu2N0HGI0fcmtwxgu0ad0AlbN3BYuN4clcw=;
 b=rFtI1Fl2TLcjkAWvAy/wwrydCruyc0FWTG1TrjoVSbwrr3NoVke4ylopZqU7mt5gKC
 Y0p6p+IryAwh1Epx9bR3RQ5FJCFU+VRWwMMuFP9/C2P+1wu6+1IaeCxR17eAgkPCoRuX
 C8y6LQ3GisGBrM/Dr4muRhK+I7FlD6XDAiCky3v9VnfVeDG+G4Jj4oZiVaAPWrsfEaYm
 e0yHbUWbEb+vNVKPgmdZSnU88bUnwPF/7LlHUSrkrDJh7KYE2T08BMPG3z/tCcIUleDH
 3sS1lYZSKAtvs9R2vl5i6R+uKSJ+jJ2SOaqaOYiCoCZ563e/4ZtQyd6D4CRi3Pl7/nAM
 NO1w==
X-Gm-Message-State: AO0yUKXbQdNjSQ86MFltbiU/89g65NdRfHvOBY+aH7QLPF34qWhIOvTl
 rBQfOouqcj7sf18LByvWACn+G+cIV+dlvv43GR6Hydt183n2W8twK3Se/Q1yunfp3hL1NQzJjZM
 6uoH4a+6Wi9U8PCJYVDYbX/6UqgdQxIU=
X-Received: by 2002:a05:6870:a891:b0:172:7c3d:cd0f with SMTP id
 eb17-20020a056870a89100b001727c3dcd0fmr639875oab.9.1677208780682; 
 Thu, 23 Feb 2023 19:19:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9c1wwIgdgosGYDDKgTAvP64VGcxAQxwoTWNyCRmQvcOqF85HUOYtp+Hx4tZkgaNmWNQbPC6PNvmZHylNhCzWo=
X-Received: by 2002:a05:6870:a891:b0:172:7c3d:cd0f with SMTP id
 eb17-20020a056870a89100b001727c3dcd0fmr639871oab.9.1677208780491; Thu, 23 Feb
 2023 19:19:40 -0800 (PST)
MIME-Version: 1.0
References: <20230209170004.899472-1-eperezma@redhat.com>
 <21d698e6-e7de-a07d-624d-c2fa88152e71@redhat.com>
In-Reply-To: <21d698e6-e7de-a07d-624d-c2fa88152e71@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Feb 2023 11:19:29 +0800
Message-ID: <CACGkMEtgNjY8NDniw6RRB2=aYjeFVROteMr6ABaxyp08CqLV-w@mail.gmail.com>
Subject: Re: [PATCH] vdpa: stop all svq on device deletion
To: Laurent Vivier <lvivier@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-stable@nongnu.org,
 Lei Yang <leiyang@redhat.com>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Feb 23, 2023 at 4:51 PM Laurent Vivier <lvivier@redhat.com> wrote:
>
> Hi,
>
> this patch fixes a QEMU crash, could it be merged?

Acked-by: Jason Wang <jasowang@redhat.com>

I think it should go with Michael's tree.

Thanks

>
> Thanks,
> Laurent
>
> On 2/9/23 18:00, Eugenio P=C3=A9rez wrote:
> > Not stopping them leave the device in a bad state when virtio-net
> > fronted device is unplugged with device_del monitor command.
> >
> > This is not triggable in regular poweroff or qemu forces shutdown
> > because cleanup is called right after vhost_vdpa_dev_start(false).  But
> > devices hot unplug does not call vdpa device cleanups.  This lead to al=
l
> > the vhost_vdpa devices without stop the SVQ but the last.
> >
> > Fix it and clean the code, making it symmetric with
> > vhost_vdpa_svqs_start.
> >
> > Fixes: dff4426fa656 ("vhost: Add Shadow VirtQueue kick forwarding capab=
ilities")
> > Reported-by: Lei Yang <leiyang@redhat.com>
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 17 ++---------------
> >   1 file changed, 2 insertions(+), 15 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 542e003101..df3a1e92ac 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -689,26 +689,11 @@ static int vhost_vdpa_get_device_id(struct vhost_=
dev *dev,
> >       return ret;
> >   }
> >
> > -static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
> > -{
> > -    if (!v->shadow_vqs_enabled) {
> > -        return;
> > -    }
> > -
> > -    for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
> > -        VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs,=
 i);
> > -        vhost_svq_stop(svq);
> > -    }
> > -}
> > -
> >   static int vhost_vdpa_reset_device(struct vhost_dev *dev)
> >   {
> > -    struct vhost_vdpa *v =3D dev->opaque;
> >       int ret;
> >       uint8_t status =3D 0;
> >
> > -    vhost_vdpa_reset_svq(v);
> > -
> >       ret =3D vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
> >       trace_vhost_vdpa_reset_device(dev, status);
> >       return ret;
> > @@ -1100,6 +1085,8 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev=
 *dev)
> >
> >       for (unsigned i =3D 0; i < v->shadow_vqs->len; ++i) {
> >           VhostShadowVirtqueue *svq =3D g_ptr_array_index(v->shadow_vqs=
, i);
> > +
> > +        vhost_svq_stop(svq);
> >           vhost_vdpa_svq_unmap_rings(dev, svq);
> >
> >           event_notifier_cleanup(&svq->hdev_kick);
>


